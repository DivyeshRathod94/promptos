# PromptOS Makefile
# Production-Grade Development & Deployment

.PHONY: help install dev build test lint clean deploy

# =============================================================================
# Help
# =============================================================================
help:  ## Show this help message
	@echo "PromptOS Makefile"
	@echo ""
	@echo "Usage:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# =============================================================================
# Installation & Setup
# =============================================================================
install:  ## Install all dependencies
	cd backend && dotnet restore
	cd frontend && npm install

# =============================================================================
# Development
# =============================================================================
dev:  ## Start local development environment
	@echo "=== Starting Backend ==="
	cd backend && dotnet watch --project PromptOs.Presentation/PromptOs.Presentation.csproj &
	@echo "=== Starting Frontend ==="
	cd frontend && npm run dev

dev-backend:  ## Start only the backend
	cd backend && dotnet watch --project PromptOs.Presentation/PromptOs.Presentation.csproj

dev-frontend:  ## Start only the frontend
	cd frontend && npm run dev

# =============================================================================
# Build & Test
# =============================================================================
build:  ## Build all projects
	cd backend && dotnet build
	cd frontend && npm run build

test:  ## Run all tests
	cd backend && dotnet test
	cd frontend && npm run test

lint:  ## Run linter
	cd frontend && npm run lint

# =============================================================================
# Database
# =============================================================================
db-migrate:  ## Apply database migrations
	cd backend && dotnet ef database update --project PromptOs.Infrastructure --startup-project PromptOs.Presentation

db-seed:  ## Seed the database
	cd backend && dotnet run --project PromptOs.Presentation/PromptOs.Presentation.csproj -- seed

db-reset:  ## Drop and recreate the database
	cd backend && dotnet ef database drop --project PromptOs.Infrastructure --startup-project PromptOs.Presentation --force
	$(MAKE) db-migrate

# =============================================================================
# Docker
# =============================================================================
docker-build:  ## Build all Docker images
	@echo "Docker build coming soon"

docker-up:  ## Start all Docker containers
	@echo "Docker compose coming soon"

docker-down:  ## Stop all Docker containers
	@echo "Docker compose coming soon"

# =============================================================================
# Cleanup
# =============================================================================
clean:  ## Clean all build artifacts
	cd backend && dotnet clean
	cd frontend && rm -rf node_modules dist .turbo
