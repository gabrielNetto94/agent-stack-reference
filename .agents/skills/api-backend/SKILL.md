---
name: api-backend
description: Procedimento e padrões para desenvolvimento de serviços back-end, design de contratos de APIs, regras de negócio isoladas, persistência e migrations de banco de dados. Use para implementar ou refatorar endpoints, controllers e serviços.
---

# Skill: API & Back-end Engineering

Esta skill orienta a implementação e manutenção de serviços de backend com foco em desacoplamento e robustez.

## 1. Princípios de Implementação
- **Camadas Claras:** Separe rigorosamente:
  - `Controllers/Rotas`: Validação de payload de entrada e envio de resposta HTTP.
  - `Services/Casos de Uso`: Regras de negócio puras e orquestração de fluxo.
  - `Repositories/Gateways`: Acesso a banco de dados e integrações externas.
- **Tipagem e Schemas:** Valide inputs usando schemas explícitos (Zod, Pydantic, JSON Schema, Structs Go).

## 2. Persistência e Migrações
- Nunca quebre compatibilidade com versões anteriores de banco de dados sem estratégia de migração segura.
- Adicione valores padrão (*defaults*) para campos novos em registros já persistidos.

## 3. Checklist de Entrega do Backend
- [ ] Endpoints implementados e documentados (OpenAPI / contrato).
- [ ] Testes unitários para regras de negócio passando.
- [ ] Validações de erro tratadas com status HTTP e payloads descritivos.
- [ ] Nenhuma credencial ou secret em código-fonte (uso estrito de variáveis de ambiente ou secret stores).

