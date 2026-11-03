---
name: docs-sync
description: Procedimento cirúrgico para sincronização de contratos vivos, especificações técnicas, manuais e READMEs após a conclusão de mudanças de código. Use no fechamento de qualquer tarefa que tenha alterado comportamento, configurações ou estrutura de arquivos.
---

# Skill: Documentation Synchronization & Living Contracts

Esta skill garante que a documentação técnica permaneça um contrato confiável e sincronizado com o código de produção.

## 1. O Princípio da Documentação como Contrato
- Se a documentação estiver desatualizada, novos agentes de IA e desenvolvedores tomarão decisões erradas baseadas em premissas obsoletas, gerando bugs e retrabalho.
- A documentação deve descrever **como o sistema é no presente**, e não uma lista histórica de mudanças no passado.

## 2. Roteiro de Atualização Cirúrgica
1. **Analise o Diff:** Execute `git diff` para mapear exatamente o que mudou.
2. **Atualize apenas as seções afetadas:**
   - Nomes e assinaturas de funções públicas.
   - Parâmetros de configuração e variáveis de ambiente adicionadas/removidas.
   - Estrutura de diretórios ou novos módulos criados.
   - Comandos de inicialização, build e teste.
3. **Remova Instruções Obsoletas:** Nunca deixe duas versões conflitantes da mesma regra no mesmo documento.
4. **README:** Atualize o README apenas se houver impacto para o usuário final (nova funcionalidade, alterações de setup ou avisos operacionais).

## 3. Formato do Relato
- Conclua sempre informando em 1 ou 2 linhas os arquivos de documentação que foram atualizados e quais seções foram sincronizadas.

