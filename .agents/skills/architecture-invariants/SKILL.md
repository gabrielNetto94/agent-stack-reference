---
name: architecture-invariants
description: Procedimento e regras para desenho modular, limites de contexto, prevencao de monolitos (regra das 300 linhas), isolamento de regras de dominio e economia de tokens (ADR-001 zero emojis). Use para estruturar novos modulos, auditar acoplamento ou planejar refatoracoes estruturais.
---

# Skill: Architecture Invariants & Modular Design

Esta skill define as regras inviolaiveis de estrutura de codigo para permitir desenvolvimento agil assistido por IA com baixo raio de explosao e maxima economia de tokens.

## 1. A Regra das 300 Linhas (Anti-Monolito)
- **Limite rigido:** Nenhum arquivo de implementacao deve ultrapassar 300 a 400 linhas.
- **Fatiamento continuo:** Quando um arquivo crescer alem desse limite, fatie-o imediatamente em submodulos coesos (ex.: extrair controladores, servicos, adaptadores ou componentes visuais).
- **Vantagem para IA:** Arquivos curtos cabem completamente no contexto do modelo, acelerando a velocidade de resposta e eliminando erros de atencao (*Lost in the Middle*).

## 2. Economia de Tokens e Proibicao de Emojis (ADR-001)
- Emojis custam de 2 a 4 tokens cada e dispersam a atencao do modelo.
- E proibido o uso de emojis em codigo, comentarios, documentacao, commits e mensagens de agentes.
- Use marcadores formais em texto: `[OK]`, `[FALHA]`, `[INFO]`, `[AVISO]`, `[CRITICO]`.

## 3. Isolamento de Dominio Puro
- As regras de negocio devem ser isoladas em funcoes puras (sem dependencias de DOM, frameworks web, banco de dados ou runtime de sistema operacional).
- Funcoes puras facilitam testes instantaneos e garantem que alteracoes de infraestrutura nao contaminem a logica central.

## 4. Gestao de Dependencias e Contratos
- **Zero dependencias superfluas:** Nao adicione pacotes externos sem aprovacao previa.
- **Contratos explicitos:** Todas as fronteiras entre modulos (IPC, APIs, eventos) devem possuir schemas tipados e documentados.
- **Registros de Decisao (ADR):** Toda mudanca de direcao arquitetural deve ser registrada em um documento ADR simples (Contexto, Decisao, Consequencias) na pasta `decisions/`.
