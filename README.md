# PromptOS

**An AI Intelligence Layer, not just another wrapper.**

<div align="center">

![PromptOS Banner](https://coresg-normal.trae.ai/api/v1/text-to-image?prompt=A%20sleek%2C%20modern%20AI%20intelligence%20layer%20interface%20with%20clean%20design%2C%20showing%20prompt%20enhancement%2C%20conversation%20flow%2C%20and%20AI%20model%20orchestration%20in%20a%20professional%20dark%20theme&image_size=square_hd)

[![GitHub stars](https://img.shields.io/github/stars/PromptOS/PromptOS?style=social)](https://github.com/PromptOS/PromptOS/stargazers)
[![GitHub license](https://img.shields.io/github/license/PromptOS/PromptOS)](https://github.com/PromptOS/PromptOS/blob/main/LICENSE)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/PromptOS/PromptOS)](https://github.com/PromptOS/PromptOS/releases)
[![Discord](https://img.shields.io/badge/Discord-Join-blue)](https://discord.gg/promptos)

[Website](https://promptos.com) • [Documentation](https://docs.promptos.com) • [API Reference](https://docs.promptos.com/api) • [Discord](https://discord.gg/promptos)

</div>

---

## 🚀 Overview

PromptOS sits between you and your AI models, acting as an intelligent orchestrator that:
- 🎯 **Understands your intent**
- 🕵️ **Collects missing requirements**
- 📚 **Builds optimal context**
- ✨ **Refines your prompts**
- 🚦 **Routes to the best AI model**
- ✅ **Validates responses**

It's not just a wrapper—it's an intelligence layer that elevates every AI interaction.

---

## 💡 Why PromptOS?

| Feature | Traditional AI Wrappers | PromptOS |
|---------|------------------------|----------|
| Intent Understanding | ❌ No | ✅ Yes |
| Requirement Collection | ❌ No | ✅ Yes |
| Context Building | ❌ Basic | ✅ Intelligent |
| Prompt Optimization | ❌ Manual | ✅ Automatic |
| Multi-Model Orchestration | ❌ No | ✅ Yes |
| Response Validation | ❌ No | ✅ Yes |
| Token Efficiency | ❌ No | ✅ Yes |

---

## 🏗️ Architecture

PromptOS is built with enterprise-grade architecture:
- **Clean Architecture** for maintainability
- **CQRS + MediatR** for scalability
- **Event-driven** design
- **Multi-tenant SaaS** architecture
- **PostgreSQL + pgvector** for vector search
- **Azure Cloud** for infrastructure

[Learn more about our architecture →](docs/SystemDesign.md)

---

## 📦 Tech Stack

| Layer | Technologies |
|-------|--------------|
| Frontend | React 18, TypeScript, Vite, Tailwind, React Query |
| Backend | .NET 8, ASP.NET Core, EF Core, MediatR, Serilog |
| Database | PostgreSQL 16, pgvector |
| AI | OpenAI, Anthropic, Google |
| Cloud | Azure, Docker, GitHub Actions |
| Cache | Redis |

---

## 📁 Repository Structure

```
PromptOS/
├── docs/                           # 📚 Documentation
│   ├── Requirements.md
│   ├── SystemDesign.md
│   ├── BackendArchitecture.md
│   ├── FrontendArchitecture.md
│   ├── AIArchitecture.md
│   ├── DatabaseDesign.md
│   ├── APIDesign.md
│   ├── Security.md
│   └── Roadmap.md
├── assets/                         # 🖼️ Assets
├── frontend/                       # 📱 React Frontend
├── backend/                        # 🎯 .NET Backend
├── .github/                        # ⚙️ CI/CD
├── Makefile                        # 🔧 Development Automation
└── README.md
```

---

## 🛠️ Quick Start

```bash
# Clone the repository
git clone https://github.com/PromptOS/PromptOS.git
cd PromptOS

# Set up environment
cp .env.example .env
# Edit .env with your keys

# Start everything with Docker
make docker-up

# Or run locally
make install
make dev
```

[Full installation guide →](CONTRIBUTING.md)

---

## 📖 Documentation

| Section | Description |
|---------|-------------|
| [Requirements](docs/Requirements.md) | What we're building and why |
| [System Design](docs/SystemDesign.md) | High-level architecture overview |
| [Backend Architecture](docs/BackendArchitecture.md) | .NET 8 Clean Architecture details |
| [Frontend Architecture](docs/FrontendArchitecture.md) | React 18 architecture details |
| [AI Architecture](docs/AIArchitecture.md) | AI pipeline architecture |
| [REST API](docs/APIDesign.md) | API reference |
| [Database Design](docs/DatabaseDesign.md) | Database schema design |
| [Security](docs/Security.md) | Security architecture |
| [Roadmap](docs/Roadmap.md) | Product and technical roadmap |

---

## 🗺️ Roadmap

| Phase | Timeline | Focus |
|-------|----------|-------|
| **Phase 1** | Months 1-3 | MVP Launch |
| **Phase 2** | Months 4-12 | Team Collaboration |
| **Phase 3** | Year 2 | Marketplace & Workflows |
| **Phase 4** | Year 3+ | Enterprise & Self-Hosted |

[View full roadmap →](docs/Roadmap.md)

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md).

## 🔒 Security

Please see our [Security Policy](Security.md) for responsible disclosure.

## 📄 License

MIT © 2026 PromptOS. See [LICENSE](LICENSE) for details.

---

<div align="center">
  <sub>Built with ❤️ by the PromptOS team</sub>
</div>
