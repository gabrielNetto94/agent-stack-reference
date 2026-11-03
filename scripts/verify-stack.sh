#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROLES_DIR="${BASE_DIR}/.agents/roles"
SKILLS_DIR="${BASE_DIR}/.agents/skills"

echo "=========================================================="
echo " [HARNESS] Validando Integridade da Stack de Agentes & Skills"
echo " Diretório Base: ${BASE_DIR}"
echo "=========================================================="

ERRORS=0

# 1. Validar papéis dos 4 Agentes Especializados
EXPECTED_ROLES=("architect" "developer" "reviewer" "qa")
echo ""
echo ">> [1/5] Verificando Agentes Especializados em .agents/roles/..."

for role in "${EXPECTED_ROLES[@]}"; do
    ROLE_FILE="${ROLES_DIR}/${role}.md"
    if [[ -f "${ROLE_FILE}" ]]; then
        if grep -q "^name: ${role}" "${ROLE_FILE}" && grep -q "^description:" "${ROLE_FILE}"; then
            echo "   [OK] Role: ${role} (declarada com metadados válidos)"
        else
            echo "   [FALHA] Role: ${role} encontrada, mas sem frontmatter válido"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo "   [FALHA] Role ausente: ${role}.md em ${ROLES_DIR}"
        ERRORS=$((ERRORS + 1))
    fi
done

# 2. Validar Base de Skills Modulares
echo ""
echo ">> [2/5] Verificando Base de Skills Reutilizáveis em .agents/skills/..."

if [[ ! -d "${SKILLS_DIR}" ]]; then
    echo "   [FALHA] Diretório de skills não encontrado: ${SKILLS_DIR}"
    exit 1
fi

SKILL_COUNT=0
for skill_dir in "${SKILLS_DIR}"/*; do
    if [[ -d "${skill_dir}" ]]; then
        SKILL_NAME="$(basename "${skill_dir}")"
        SKILL_FILE="${skill_dir}/SKILL.md"
        if [[ -f "${SKILL_FILE}" ]]; then
            if grep -q "^name: ${SKILL_NAME}" "${SKILL_FILE}" && grep -q "^description:" "${SKILL_FILE}"; then
                echo "   [OK] Skill: ${SKILL_NAME} (SKILL.md e frontmatter válidos)"
                SKILL_COUNT=$((SKILL_COUNT + 1))
            else
                echo "   [FALHA] Skill ${SKILL_NAME} possui SKILL.md, mas frontmatter inválido"
                ERRORS=$((ERRORS + 1))
            fi
        else
            echo "   [FALHA] Skill ${SKILL_NAME} não possui arquivo SKILL.md"
            ERRORS=$((ERRORS + 1))
        fi
    fi
done

echo "   Total de skills operacionais validadas: ${SKILL_COUNT}"

# 3. Validar Documentos de Orquestração e ADRs
echo ""
echo ">> [3/5] Verificando Orquestração, Documentação e ADRs..."

for doc in "ORCHESTRATOR.md" "README.md" "decisions/ADR-001-no-emojis.md"; do
    if [[ -f "${BASE_DIR}/${doc}" ]]; then
        echo "   [OK] Documento presente: ${doc}"
    else
        echo "   [FALHA] Documento obrigatório ausente: ${doc}"
        ERRORS=$((ERRORS + 1))
    fi
done

# 4. Validar Política de Zero Emojis (ADR-001)
echo ""
echo ">> [4/5] Auditando conformidade com ADR-001 (Zero Emojis para economia de tokens)..."

EMOJI_VIOLATIONS=$(python3 -c "
import os, re, sys

pattern = re.compile(r'[\U00010000-\U0010ffff]|[\u2600-\u27bf]')
violations = []

for root, dirs, files in os.walk('${BASE_DIR}'):
    for f in files:
        if f.endswith(('.md', '.sh', '.json', '.yaml', '.yml')):
            p = os.path.join(root, f)
            with open(p, 'r', encoding='utf-8', errors='ignore') as fp:
                for idx, line in enumerate(fp, start=1):
                    found = pattern.findall(line)
                    if found:
                        violations.append(f'{p}:{idx} -> {set(found)}')

if violations:
    print('\n'.join(violations))
    sys.exit(1)
sys.exit(0)
" 2>&1 || true)

if [[ -n "${EMOJI_VIOLATIONS}" ]]; then
    echo "   [FALHA] Emojis detectados violando ADR-001:"
    echo "${EMOJI_VIOLATIONS}"
    ERRORS=$((ERRORS + 1))
else
    echo "   [OK] Conformidade 100% com ADR-001: nenhum emoji detectado na stack."
fi

# 5. Checar Ausência de Resíduos Legados
echo ""
echo ">> [5/5] Verificando Limpeza de Resíduos Legados..."

if [[ -d "${BASE_DIR}/new-agents" ]]; then
    echo "   [FALHA] Pasta legada new-agents ainda existe."
    ERRORS=$((ERRORS + 1))
else
    echo "   [OK] Pasta legada new-agents removida com sucesso."
fi

echo ""
echo "=========================================================="
if [[ ${ERRORS} -eq 0 ]]; then
    echo " [SUCESSO] Todos os 4 Agentes, as ${SKILL_COUNT} Skills, ADRs e Politica de Zero Emojis passaram na verificacao!"
    echo "=========================================================="
    exit 0
else
    echo " [ERRO] Foram encontrados ${ERRORS} problema(s) de integridade."
    echo "=========================================================="
    exit 1
fi
