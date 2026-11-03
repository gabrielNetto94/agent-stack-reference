# ADR-001: Proibicao Estrita do Uso de Emojis para Otimizacao de Tokens

## Status
Aceito (Accepted)

## Data
2026-11-03

## Contexto
Modelos de linguagem (LLMs) convertem texto em tokens através de tokenizadores baseados em sub-palavras (como BPE). Emojis e caracteres pictográficos estendidos costumam consumir de 2 a 4 tokens cada, além de introduzir variações desnecessárias na representação vetorial do modelo.

Em arquiteturas com múltiplos agentes, subagentes e histórico de conversa longo, o uso decorativo de emojis acarreta:
1. Consumo desperdiçado da janela de contexto (token budget).
2. Maior custo operacional e latência de geração.
3. Potencial degradação de atenção (*attention dispersion*) em tarefas críticas de código e auditoria.
4. Poluição visual em logs de terminal, diffs de git e parseadores automatizados.

## Decisao
Fica expressamente proibido o uso de emojis em qualquer contexto técnico da stack, incluindo:
- Respostas, mensagens e relatórios de todos os agentes e subagentes.
- Arquivos de código-fonte, scripts e comentários.
- Arquivos de documentação (README, arquitetura, ADRs, runbooks).
- Definições de skills (`SKILL.md`) e regras de agentes (`.agents/roles/`).
- Mensagens de commit e logs de execução.

Para ênfase e demarcação de status, devem ser utilizados exclusivamente textos e prefixos ASCII/Markdown convencionais:
- `[OK]`, `[FALHA]`, `[AVISO]`, `[INFO]`, `[CRITICO]`, `[RISCO]`
- Listas e marcadores padrão (`-`, `*`, `1.`, `2.`)
- Negrito, itálico e blocos de código markdown (`**destaque**`, `` `codigo` ``)

## Consequencias
- Positivas: Redução consistente no consumo de tokens, maior densidade de informação útil por resposta, compatibilidade universal com qualquer terminal/CLI e execução determinística.
- Negativas: Nenhuma.

