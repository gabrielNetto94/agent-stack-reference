---
name: platform-audit
description: Procedimento para auditoria de portabilidade e compatibilidade de código entre sistemas operacionais (Linux/WSL, Windows e macOS). Use ao alterar scripts, manipuladores de caminhos, chamadas de sistema ou helpers nativos.
---

# Skill: Platform & OS Portability Audit

Esta skill estabelece o roteiro de auditoria para garantir que o código funcione de maneira idêntica e sem quebras em ambientes heterogêneos.

## 1. Tratamento de Caminhos e Sistema de Arquivos
- **Caminhos Agnósticos:** Nunca utilize barras fixas (`/` ou `\\`) hardcoded. Utilize sempre funções utilitárias como `path.join()`, `filepath.Join()` ou `pathlib.Path`.
- **Case-Sensitivity:** Lembre-se de que Linux é estritamente sensível a maiúsculas/minúsculas no sistema de arquivos, enquanto Windows e macOS geralmente não são.

## 2. Processos, Shells e Comandos Nativos
- **Windows:**
  - Evite assumir a presença de comandos Unix padrão (`grep`, `sed`, `awk`, `curl` com flags Unix).
  - Scripts PowerShell (`.ps1`) devem ter codificação UTF-8 e políticas de execução consideradas.
  - Processos filhos devem ser gerenciados para não virarem processos zumbis ao fechar a aplicação principal.
- **Linux:**
  - Respeite variáveis de locale (`LC_ALL=C` quando parsear saídas de ferramentas como `pactl` ou `ip`).
  - Respeite permissões de execução (`chmod +x`).
- **macOS:**
  - Respeite particularidades de atalhos e janelas do sistema operacional.

## 3. Checklist de Auditoria
- [ ] O código específico de plataforma está isolado e protegido por condicionais de SO (ex.: `process.platform === 'win32'`)?
- [ ] Nenhuma chamada de shell assume utilitários que só existem em um sistema operacional específico?
- [ ] Existe uma lista clara de passos para verificação manual em SOs secundários caso o ambiente atual seja restrito (ex.: desenvolvedor rodando no WSL)?

