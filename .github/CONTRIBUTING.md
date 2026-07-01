# Contributing to PromptOS

First off, thank you for considering contributing to PromptOS! 🎉

We welcome contributions of all kinds: code, documentation, bug reports, feature suggestions, and more.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [How to Contribute](#how-to-contribute)
4. [Development Guidelines](#development-guidelines)
5. [Pull Request Process](#pull-request-process)
6. [Community](#community)

---

## Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct.

### Our Pledge

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment include:
- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

---

## Getting Started

### Prerequisites

- **Backend**: .NET 8 SDK
- **Frontend**: Node.js 18+ and npm
- **Database**: PostgreSQL 15+
- **Docker** (optional but recommended)

### Setting Up Development Environment

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/PromptOS.git
   cd PromptOS
   ```

2. **Backend Setup**
   ```bash
   cd backend
   dotnet restore
   dotnet build
   ```

3. **Frontend Setup**
   ```bash
   cd frontend
   npm install
   ```

4. **Database Setup**
   - Install PostgreSQL
   - Create a database named `promptos`
   - Run migrations (coming soon)

5. **Environment Variables**
   - Copy `.env.example` to `.env`
   - Fill in your API keys and configuration

---

## How to Contribute

### Reporting Bugs 🐛

Found a bug? Please [open an issue](https://github.com/PromptOS/PromptOS/issues/new) with:
- A clear, descriptive title
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Environment details (OS, browser, versions)

### Suggesting Features 💡

Have an idea for a feature? [Open an issue](https://github.com/PromptOS/PromptOS/issues/new) and tell us:
- What problem does it solve?
- How should it work?
- Any alternatives you've considered

### Contributing Code 👨‍💻

1. **Find an issue to work on**
   - Look for issues labeled `good first issue` or `help wanted`
   - Comment on the issue to let us know you're working on it

2. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

3. **Make your changes**
   - Follow our coding style guidelines
   - Write tests if applicable
   - Update documentation as needed

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add amazing new feature"
   ```
   We use [Conventional Commits](https://www.conventionalcommits.org/)

5. **Push and create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

### Improving Documentation 📚

Documentation improvements are always welcome! This includes:
- Fixing typos
- Clarifying explanations
- Adding examples
- Writing tutorials

---

## Development Guidelines

### Backend (.NET)

- Follow Clean Architecture principles
- Use CQRS with MediatR
- Write unit tests for all new functionality
- Use FluentValidation for input validation
- Follow C# coding conventions

### Frontend (React/TypeScript)

- Use functional components with hooks
- Follow TypeScript best practices
- Use Tailwind CSS for styling
- Write tests with React Testing Library
- Keep components small and focused

### Git Commit Messages

We use Conventional Commits:

```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style/formatting
- `refactor`: Refactoring
- `test`: Testing
- `chore`: Build/tooling

Examples:
- `feat(auth): add Google OAuth login`
- `fix(api): handle null responses in user endpoint`
- `docs(readme): update contributing guidelines`

---

## Pull Request Process

1. **Fill out the PR template**
   - Describe what you changed
   - Link to related issues
   - Include test coverage

2. **Get reviewed**
   - At least one maintainer must approve
   - Address any feedback

3. **Merge**
   - Squash and merge is preferred
   - Keep commit history clean

---

## Community

- **Discord**: [Join our server](https://discord.gg/promptos)
- **Twitter**: [@PromptOS](https://twitter.com/PromptOS)
- **GitHub Discussions**: [Ask questions and share ideas](https://github.com/PromptOS/PromptOS/discussions)

---

## Thank You!

Again, thank you for contributing to PromptOS. Your efforts help make AI better for everyone! 🙏

---

### Quick Links

- [README.md](README.md) - Project overview
- [Architecture Docs](docs/) - Detailed design documents
- [Roadmap](docs/Roadmap.md) - See what's coming
