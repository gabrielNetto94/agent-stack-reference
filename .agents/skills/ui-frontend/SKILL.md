---
name: ui-frontend
description: Procedimento e padrões para desenvolvimento de interfaces de usuário, componentes desacoplados, tratamento de estados visuais, suporte a design tokens e internacionalização. Use para criar telas, componentes e fluxos de interação.
---

# Skill: UI & Front-end Engineering

Esta skill padroniza o desenvolvimento de interfaces com foco em componentização limpa, acessibilidade e estabilidade.

## 1. Princípios de Componentização
- **Desacoplamento:** Componentes de apresentação não devem conter lógica pesada de negócio ou chamadas diretas de infraestrutura; use stores, hooks ou serviços dedicados.
- **Tamanho Limite:** Mantenha componentes concisos e com escopo único.

## 2. Tratamento Obrigatório dos 4 Estados
Todo componente ou tela que consome dados assíncronos deve cobrir explicitamente:
1. **Loading (Carregando):** Indicador visual de progresso ou skeleton.
2. **Empty (Vazio):** Feedback claro quando a lista/resultado estiver vazio.
3. **Error (Erro):** Mensagem compreensível e botão de retry/ação corretiva.
4. **Success (Sucesso):** Renderização dos dados normais.

## 3. Diretrizes de Interface
- **Zero texto literal no código:** Todos os textos de interface devem passar pelo sistema de internacionalização (`i18n`), com chaves cadastradas nos dicionários de idiomas suportados.
- **Design Tokens:** Cores, tipografia e espaçamentos devem utilizar tokens/variáveis CSS padronizadas, garantindo suporte pleno a múltiplos temas (light e dark).

