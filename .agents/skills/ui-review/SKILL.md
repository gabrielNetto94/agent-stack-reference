---
name: ui-review
description: Procedimento de inspeção visual, validação de responsividade, aderência a temas (light/dark) e conformidade de acessibilidade para interfaces de usuário. Use para auditar alterações de CSS, HTML, templates e componentes frontend.
---

# Skill: UI & Visual Review

Esta skill padroniza a revisão visual e de experiência do usuário para garantir interfaces consistentes e livres de defeitos visuais.

## 1. Roteiro de Inspeção Visual
- **Temas (Light e Dark):**
  - Confirme legibilidade, contraste e ausência de textos apagados ou ilegíveis em ambos os modos.
  - Assegure que as cores provenham estritamente de tokens de design.
- **Responsividade e Quebras de Layout:**
  - Teste em larguras reduzidas (mobile / telas pequenas) e confirme ausência de rolagem horizontal indesejada.
  - Verifique o comportamento de gavetas laterais (*drawers*), modais e menus colapsáveis.
- **Internacionalização Visual:**
  - Alterne o idioma da interface e confirme que botões, labels e mensagens não quebram o layout quando traduzidos para textos mais longos.

## 2. Inspeção Automatizada de Telas
- Utilize scripts com Playwright ou Puppeteer para tirar capturas de tela (*screenshots*) automáticas dos principais fluxos em diferentes resoluções.
- Compare com as capturas de referência para identificar desvios visuais não intencionais.

## 3. Relatório de Revisão de UI
- Indique `arquivo:linha` onde foram identificados desvios.
- Descreva o cenário exato (ex.: *"No tema light, o botão de salvar fica com texto cinza claro sobre fundo branco em telas menores que 768px"*).

