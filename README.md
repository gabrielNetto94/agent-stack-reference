# Reference AI Agent Stack (3-Tier Architecture)

Esta stack de referencia implementa a arquitetura recomendada para desenvolvimento assistido por IA: poucos agentes especializados, uma base compartilhada de skills reutilizaveis e subagentes efemeros sob demanda com camada de verificacao.

---

## Os Tres Niveis da Arquitetura

1. **Agents (Quem e responsavel):** 4 papeis especializados com escopos bem delimitados (`architect`, `developer`, `reviewer`, `qa`), coordenados por um **Main Agent (Orquestrador)**.
2. **Skills (Como executar):** Catalogo modular de manuais e procedimentos operacionais em `.agents/skills/<nome>/SKILL.md` carregados por revelacao progressiva (*Progressive Disclosure*).
3. **Subagents (Delegacao sob demanda):** Instancias independentes com janelas de contexto isoladas para tarefas concorrentes de analise, testes e implementacao atomica.
4. **Harness (Camada de Verificacao):** Scripts de validacao continua e exigencia de evidencias deterministicas antes de aprovar qualquer entrega.

---

## Estrutura de Diretorios

```text
sample-sub-agents/
├── README.md                      # Visao geral da stack (este documento)
├── ORCHESTRATOR.md                # Diretrizes de coordenacao do Tech Lead
├── decisions/
│   └── ADR-001-no-emojis.md       # Decisao de proibicao de emojis para economia de tokens
├── scripts/
│   └── verify-stack.sh            # Harness automatizado de verificacao da stack
└── .agents/
    ├── rules/
    │   └── no-emojis.md           # Regra estrutural de proibicao de emojis
    ├── roles/                     # Agentes Especializados (Quem e responsavel)
    │   ├── architect.md           # Design estrutural, limites modulares e ADRs
    │   ├── developer.md           # Implementacao cirurgica e refatoracao
    │   ├── reviewer.md            # Auditoria de regressao, seguranca e plataforma
    │   └── qa.md                  # Testes de caracterizacao e automacao E2E
    └── skills/                    # Skills Reutilizaveis (Como executar)
        ├── architecture-invariants/SKILL.md # Regra das 300 linhas e dominio puro
        ├── task-planning/SKILL.md           # Checklist de impacto e decomposicao
        ├── api-backend/SKILL.md             # Contratos de API, camadas e banco
        ├── ui-frontend/SKILL.md             # Componentes, design tokens e i18n
        ├── test-engineering/SKILL.md        # Testes de caracterizacao e unitarios
        ├── platform-audit/SKILL.md          # Portabilidade Linux/WSL, Win e Mac
        ├── regression-audit/SKILL.md        # Inspecao de diffs contra quebras
        ├── ui-review/SKILL.md               # Inspecao visual, temas e acessibilidade
        └── docs-sync/SKILL.md               # Sincronizacao de contratos e documentacao
```

---

## Matriz de Agentes x Skills

| Agente Especializado | Papel Central | Skills Primarias Utilizadas |
| :--- | :--- | :--- |
| **Main Agent** | Orquestracao e Decomposicao | `task-planning`, `docs-sync` |
| **Architect** | Guardiao da Arquitetura | `architecture-invariants`, `docs-sync` |
| **Developer** | Implementacao e Refactoring | `api-backend`, `ui-frontend` |
| **Reviewer** | Qualidade, Regressao e SO | `regression-audit`, `platform-audit`, `ui-review` |
| **QA** | Engenharia de Testes | `test-engineering` |

---

## Verificacao da Stack (Harness)

Para validar a integridade estrutural da stack, ausencia de emojis, metadados de YAML frontmatter e regras de orquestracao:

```bash
bash sample-sub-agents/scripts/verify-stack.sh
```
*(Saida esperada: codigo 0 com todos os agentes, skills e politicas de token validados).*

---

## Exemplos de Prompts no Dia a Dia

### Iniciar uma nova feature com planejamento e arquitetura:
> *"Aja como Main Agent. Use a skill `task-planning` para mapear os arquivos e checklist de impacto da nova rota de pagamentos. Em seguida, acione o subagente `architect` para validar se a proposta cumpre a regra de 300 linhas e os contratos modulares."*

### Implementacao paralela com auditoria:
> *"Dispare um subagente `developer` para implementar a alteracao de backend usando `api-backend`. Em paralelo, dispare um subagente `qa` para escrever os testes de caracterizacao com `test-engineering`. Apresente as evidencias de teste no retorno."*

### Revisao pre-merge:
> *"Acione o subagente `reviewer` para inspecionar o `git diff` usando as skills `regression-audit` e `platform-audit`. Aponte quaisquer riscos colaterais antes de fechar a tarefa com `docs-sync`."*
