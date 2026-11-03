---
name: task-planning
description: Procedimento analítico para decompor tarefas complexas em passos atômicos, mapear arquivos afetados e preencher checklists de impacto antes de escrever qualquer código. Use no início de qualquer feature, refactor ou correção crítica.
---

# Skill: Task Planning & Impact Analysis

Esta skill padroniza o planejamento tático antes de qualquer modificação de código, minimizando riscos e retrabalho.

## 1. Mapeamento de Arquivos e Funções
- Identifique exatamente os arquivos e funções que serão tocados, indicando `arquivo:linha`.
- Restrinja o escopo ao estritamente necessário para atender à demanda.

## 2. Checklist de Impacto
Antes de codificar, analise os seguintes pontos e classifique como **Afeta**, **Não Afeta** ou **Verificar**:
- [ ] **Contratos de Comunicação:** Afeta APIs, canais IPC, rotas ou schemas de eventos?
- [ ] **Configuração e Estado Persistido:** Introduz chaves novas? Exige valores default ou migração de dados antigos?
- [ ] **Formato de Exportação/Backup:** Altera arquivos serializados ou versões de formato de dados?
- [ ] **Compatibilidade Multiplataforma:** Depende de chamadas específicas de SO (Linux, Windows, macOS)?
- [ ] **Internacionalização (i18n):** Adiciona novas mensagens ou textos visuais?
- [ ] **Testes:** Quais testes existentes cobrem a área? Quais novos testes devem ser criados primeiro?
- [ ] **Documentação:** Quais manuais, contratos ou arquivos de arquitetura precisarão de atualização?

## 3. Roteiro Passo a Passo
- Divida a execução em passos atômicos, onde cada passo seja individualmente testável e verificável.
- Em refatorações, ordene da fatia de menor risco para a de maior risco, garantindo **zero mudança de comportamento** em cada etapa.

