---
name: regression-audit
description: Procedimento rigoroso de inspeção de diffs de código contra regras invioláveis e contratos consolidados para evitar regressões colaterais. Use no fechamento de qualquer pull request ou tarefa de implementação antes da aprovação final.
---

# Skill: Regression Audit & Diff Inspection

Esta skill estabelece a metodologia de revisão de código focada em prever efeitos colaterais longe do ponto de modificação.

## 1. Inspeção de Diff (`git diff`)
- Examine minuciosamente todas as linhas adicionadas e removidas (`git diff` ou `git diff main...HEAD`).
- Pergunte a cada bloco: *"O que mais no sistema depende desse comportamento anterior?"*

## 2. Invariantes Críticos a Conferir
- **Contratos e Schemas:** Nenhuma rota de API, payload ou chave de configuração foi renomeada ou removida sem que os consumidores fossem atualizados.
- **Configurações e Defaults:** Chaves de configuração novas possuem valores padrão saudáveis e rotina de migração se necessário.
- **Tratamento de Exceções:** Erros continuam sendo capturados e tratados, sem expor *stack traces* sensíveis ao usuário final.
- **Zero Mudança de Comportamento em Refactors:** Em tarefas classificadas como refatoração, confirme que nenhuma alteração funcional foi introduzida "de carona".

## 3. Relatório de Auditoria
Todo achado deve ser classificado em:
- **[CRÍTICO]**: Quebra comprovada de funcionalidade, vazamento de segurança ou crash de execução.
- **[RISCO]**: Potencial impacto colateral sob condições específicas de concorrência ou volume de dados.
- **[DETALHE]**: Oportunidade menor de melhoria de nomenclatura ou documentação.

