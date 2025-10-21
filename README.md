# 🚀 Minimal API .NET 8: Sistema de Administração de Veículos 🛠️
# --------------------------------------------------------------

# 🌐 Acesse e teste a API em produção:
# 🔗 https://api-sistema-de-administra-o-de-veiculos.onrender.com/swagger/index.html

# A API está hospedada e conteinerizada no Render com MySQL em nuvem (Aiven).
# É totalmente funcional — você pode autenticar, cadastrar e consultar veículos direto do Swagger.

---

## 🧭 Introdução

Este projeto foi desenvolvido com o objetivo de demonstrar, de forma prática e didática,
como construir uma **API REST segura e performática** utilizando **.NET 8 Minimal API**.

O sistema permite **gerenciar administradores e veículos**, aplicando autenticação JWT
e controle de acesso baseado em perfis de usuário (`adm` e `editor`).

Ele foi estruturado com separação clara de camadas e foco em **simplicidade, segurança e escalabilidade**.

### 💡 O que este projeto oferece:
- CRUD completo de Administradores e Veículos  
- Autenticação JWT com controle de perfis  
- Persistência em banco MySQL local ou em nuvem (Aiven)  
- Deploy automatizado no Render  
- Documentação interativa via Swagger UI  

---

## 🌐 API Online e Swagger

Visualize e teste todos os endpoints de forma interativa:  
🔗 **[Abrir Swagger da API em Produção](https://api-sistema-de-administra-o-de-veiculos.onrender.com/swagger/index.html)**  

### Visão Geral da Documentação Online
<div align="center">
    <img src="ima1.png" alt="Endpoints de Administradores" width="300px"/>
    <img src="ima2.png" alt="Endpoints de Veículos" width="300px"/>
    <img src="ima3.png" alt="Schemas de Dados" width="300px"/>
</div>

---

## 🧰 Stack Tecnológica Principal

| Tecnologia | Função no Projeto | Detalhes |
| :--- | :--- | :--- |
| **.NET 8** | Backend (Minimal API) | Foco em performance e endpoints concisos. |
| **MySQL** | Banco de Dados | Persistência de dados relacional. |
| **EF Core** | ORM | Mapeamento e migrações automáticas. |
| **JWT** | Segurança | Autenticação e autorização via Token. |
| **Docker + Render** | Deploy | Contêiner leve pronto para produção. |

---

## 🔐 Autenticação e Perfis

A API utiliza **JWT (JSON Web Token)** para autenticação.  
Cada token inclui o email, o perfil e a data de expiração do usuário autenticado.

| Perfil | Acesso |
| :--- | :--- |
| **`adm`** | Controle total sobre Administradores e Veículos |
| **`editor`** | Controle apenas sobre Veículos |

### 🔑 Conta de Acesso Inicial
- **Email:** administrador@teste.com  
- **Senha:** 123456  
- **Perfil:** adm  

---

## 🏁 Endpoints Principais

### 👥 **Administradores**
| Método | Rota | Descrição | Autorização |
| :--- | :--- | :--- | :--- |
| `POST` | `/administradores/Login` | Autenticação e geração do token JWT | ❌ Público |
| `GET` | `/administradores/listar` | Lista todos os administradores | ✅ `adm` |
| `POST` | `/Administradores/cadastrar` | Cadastra novo administrador | ✅ `adm` |

### 🚗 **Veículos**
| Método | Rota | Descrição | Autorização |
| :--- | :--- | :--- | :--- |
| `POST` | `/veiculos/cadastrar` | Cadastra novo veículo | ✅ `adm`, `editor` |
| `GET` | `/veiculos` | Lista veículos | ✅ Qualquer autenticado |
| `PUT` | `/veiculos/{id}` | Atualiza dados de um veículo | ✅ `adm` |
| `DELETE` | `/veiculos/Deletar/{id}` | Remove veículo | ✅ `adm` |

---

## 📂 Estrutura do Projeto

