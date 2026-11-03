---
name: test-engineering
description: Procedimento para elaboração e execução de estratégias de teste, incluindo testes de caracterização pré-refatoração, testes unitários determinísticos e testes ponta a ponta (E2E). Use para garantir cobertura de qualidade e proteger a base contra regressões.
---

# Skill: Test Engineering & Characterization Testing

Esta skill define as melhores práticas para criação de testes confiáveis, rápidos e eficientes.

## 1. Testes de Caracterização (Blindagem de Refatoração)
- **Objetivo:** Congelar e registrar o comportamento atual da aplicação antes de iniciar uma refatoração ou migração de código.
- **Regra:** Se o código atual tiver um comportamento estranho ou aparente falha, escreva o teste refletindo esse comportamento, adicione o comentário `// BUG?` e relate. **Não altere o código de produção** prematuramente para tentar consertar durante o teste de caracterização.

## 2. Princípios de Testes Unitários
- **Rápidos e Determinísticos:** Devem rodar em milissegundos sem depender de rede externa, temporizadores reais (`sleep`) ou banco compartilhado.
- **Teste de Regra, Não de Detalhe:** Teste contratos e comportamentos através das interfaces públicas, evitando acoplamento excessivo com variáveis ou métodos privados que impeçam refatorações futuras.
- **Nomenclatura Clara:** Nomes de testes descritivos em português ou convenção clara do projeto (ex.: `'deve recusar transferência quando saldo for insuficiente'`).

## 3. Testes Ponta a Ponta (E2E)
- Use frameworks modernos (ex.: Playwright, Cypress) para validar fluxos completos.
- Isole ambientes de teste com diretórios temporários ou bancos de dados descartáveis criados e destruídos ao final de cada execução.

