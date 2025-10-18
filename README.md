# 🚀 Minimal API – Sistema de Administração e Veículos

Uma API desenvolvida com **.NET Minimal API**, que implementa autenticação JWT e controle de acesso por perfis, permitindo **gestão de administradores e veículos** com segurança e organização em camadas.

## 🧰 Tecnologias Utilizadas

- [.NET 7+](https://dotnet.microsoft.com/) — Minimal API  
- **Entity Framework Core** — ORM para persistência de dados  
- **MySQL** — Banco de dados relacional  
- **Swagger / OpenAPI** — Documentação interativa  
- **JWT Authentication** — Segurança e controle de acesso por token  
- **Authorization Roles** — Perfis `adm` e `editor`  

---

## 📂 Estrutura do Projeto

```
minimal-api/
├── Dominio/                     # Entidades, interfaces, serviços de domínio
├── infraestrutura/              # Repositórios, contexto EF Core, Db
├── Migrations/                  # Migrations do EF Core
├── Properties/                  # launchSettings.json
├── Program.cs                   # Configuração dos endpoints e middlewares
├── appsettings.json             # Configuração de conexão com o banco e JWT
├── appsettings.Development.json
├── minimal-api.csproj
```

---

## 🔐 Autenticação JWT

A API utiliza **JWT Bearer Token** para proteger rotas.  
O token é gerado ao fazer login com um administrador válido.  
Perfis de acesso:
- `adm` — acesso total (CRUD de administradores e veículos)
- `editor` — acesso limitado a alguns endpoints de veículos

Após obter o token, inclua-o no header das requisições:
```
Authorization: Bearer {seu_token_aqui}
```

---

## 🏁 Endpoints Disponíveis

### 🏠 **Home**
| Método | Endpoint | Descrição |
|--------|-----------|------------|
| GET | `/` | Exibe informações básicas da API |

---

### 👤 **Administradores**

| Método | Endpoint | Autorização | Descrição |
|--------|-----------|-------------|------------|
| POST | `/administradores/Login` | ❌ Público | Realiza login e retorna token JWT |
| GET | `/administradores/listar` | ✅ `adm` | Lista todos os administradores |
| GET | `/Administradores/PorId/{id}` | ✅ `adm` | Busca administrador por ID |
| POST | `/Administradores/cadastrar` | ✅ `adm` | Cadastra um novo administrador |

📌 **Observação:**  
- Campos obrigatórios: `Email`, `Senha` e `Perfil` (ex.: `adm` ou `editor`).

🪙 **Exemplo de resposta ao logar**:
```json
{
  "email": "admin@teste.com",
  "perfil": "adm",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

---

### 🚗 **Veículos**

| Método | Endpoint | Autorização | Descrição |
|--------|-----------|-------------|------------|
| POST | `/veiculos/cadastrar` | ✅ `adm`, `editor` | Cadastra um novo veículo |
| GET | `/veiculos` | ✅ Autenticado | Lista todos os veículos |
| GET | `/veiculos/ListaPorId/{id}` | ✅ `adm`, `editor` | Busca veículo por ID |
| PUT | `/veiculos/{id}` | ✅ `adm` | Atualiza dados de um veículo |
| DELETE | `/veiculos/Deletar/{id}` | ✅ `adm` | Exclui veículo por ID |

📌 **Validações de cadastro:**
- `Nome` e `Marca` não podem ser vazios.  
- `Ano` deve ser maior ou igual a 1950.

🪙 **Exemplo de veículo cadastrado**:
```json
{
  "id": 1,
  "nome": "Fusca",
  "marca": "Volkswagen",
  "ano": 1975
}
```

---

## ⚙️ Configuração do Banco de Dados

No `appsettings.json`:

```json
"ConnectionStrings": {
  "mysql": "Server=localhost;Database=MinimalApiDB;Uid=root;Pwd=senha;"
},
"Jwt": "chave_super_secreta"
```

---

## 🚀 Como Rodar o Projeto

```bash
# 1. Restaurar dependências
dotnet restore

# 2. Aplicar migrations no banco de dados MySQL
dotnet ef database update

# 3. Executar a aplicação
dotnet run
```

Acesse:
```
http://localhost:5000
https://localhost:7000
```

E a documentação Swagger:
```
http://localhost:5000/swagger
```

---


## 🧭 Recursos Implementados

- ✅ Autenticação e autorização via JWT  
- ✅ Rotas públicas e protegidas  
- ✅ Perfis de usuário (`adm` e `editor`)  
- ✅ CRUD completo de veículos  
- ✅ Listagem e cadastro de administradores  
- ✅ Validações no lado do servidor  
- ✅ Documentação automática com Swagger  
- ✅ Conexão com banco MySQL via EF Core

---

## 🧱 Melhorias Futuras (Sugestões)

- 🔹 Refresh Token e expiração configurável  
- 🔹 Paginação e filtros avançados  
- 🔹 Testes unitários e de integração  
- 🔹 Logs estruturados com Serilog  
- 🔹 Deploy em container (Dockerfile)

---

## 🪪 Licença

Projeto livre para estudo, testes e evolução profissional.  
Desenvolvido com 💻 .NET Minimal API.
