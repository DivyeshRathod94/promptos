# PromptOS: Database Design

**Version**: 1.0  
**Database**: PostgreSQL 16  
**Date**: July 2026  
**Owner**: Infrastructure Team

---

## Table of Contents

1. [Overview](#1-overview)
2. [Entity Relationship Diagram](#2-entity-relationship-diagram)
3. [Table Definitions](#3-table-definitions)
4. [Indexes](#4-indexes)
5. [Relationships](#5-relationships)
6. [SQL Snippets](#6-sql-snippets)
7. [Scaling Strategy](#7-scaling-strategy)

---

## 1. Overview

This design follows **3NF (Third Normal Form)** with appropriate denormalization for performance. We use **PostgreSQL** with:
- `pgvector` extension for vector search
- `uuid-ossp` for UUID generation
- Proper constraints and referential integrity
- Soft deletes for audit purposes

... (full content)
