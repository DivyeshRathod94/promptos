# PromptOS: Frontend Architecture

**Version:** 1.0  
**Date:** July 2026  

---

## Table of Contents

1. [Project Structure](#1-project-structure)
2. [Key Libraries & Tools](#2-key-libraries--tools)
3. [Component Architecture](#3-component-architecture)
4. [State Management](#4-state-management)
5. [API Integration](#5-api-integration)

---

## 1. Project Structure

```
frontend/
├── public/                     # Static assets
│   └── favicon.ico
│
├── src/
│   ├── components/            # Reusable components
│   │   ├── ui/                # UI primitives (Button, Input, etc.)
│   │   ├── layout/            # Layout components (Header, Sidebar, etc.)
│   │   ├── conversation/      # Conversation-related components
│   │   ├── prompt/            # Prompt-related components
│   │   └── ...
│   │
│   ├── features/              # Feature modules (domain-driven)
│   │   ├── auth/              # Authentication
│   │   │   ├── components/
│   │   │   ├── hooks/
│   │   │   ├── pages/
│   │   │   ├── types.ts
│   │   │   └── index.ts
│   │   ├── conversations/     # Conversations feature
│   │   ├── prompts/           # Prompts feature
│   │   ├── templates/         # Templates feature
│   │   ├── settings/          # Settings feature
│   │   └── ...
│   │
│   ├── hooks/                 # Custom hooks
│   │   ├── useAuth.ts
│   │   ├── useConversation.ts
│   │   └── ...
│   │
│   ├── lib/                   # Utility functions & API clients
│   │   ├── api/               # API client & hooks (React Query)
│   │   ├── utils/             # Helper functions
│   │   └── types/             # Shared TypeScript types
│   │
│   ├── pages/                 # Page components (routes)
│   │   ├── index.tsx          # Home page
│   │   ├── login.tsx          # Login page
│   │   ├── conversation/
│   │   │   └── [id].tsx       # Conversation detail page
│   │   └── ...
│   │
│   ├── App.tsx                # Root component
│   ├── main.tsx               # Entry point
│   └── vite-env.d.ts
│
├── package.json
├── tsconfig.json
├── tailwind.config.js
├── vite.config.ts
└── .env
```

### Rationale for this Structure:
- **Feature-based organization**: Each feature has its own directory, making it easy to find related code
- **Separation of concerns**: Components, hooks, pages are organized logically
- **Reusability**: Shared UI components in `components/ui/`
- **Clean APIs**: API layer centralized in `lib/api/`

---

## 2. Key Libraries & Tools

| Library | Purpose | Why This Choice |
|---------|---------|-----------------|
| **React 18** | UI library | Industry standard, excellent ecosystem |
| **TypeScript** | Type safety | Catch errors early, better IDE support |
| **Vite** | Build tool | Fast dev server, quick builds, modern |
| **Tailwind CSS** | Styling | Utility-first, rapid development, consistent design |
| **React Query** | Data fetching/caching | Handles server state, caching, background updates |
| **React Router** | Routing | Declarative routing for React |
| **Zod** | Schema validation | Runtime type checking for API data |

---

## 3. Component Architecture

### 3.1 Component Hierarchy

```
App (Root)
├── AuthProvider
│   └── ProtectedRoute
│       └── Layout
│           ├── Header
│           ├── Sidebar
│           │   ├── ConversationList
│           │   └── NewConversationButton
│           └── MainContent
│               └── [Page Component]
│                   └── [Feature Components]
```

### 3.2 Component Types

#### UI Primitives (`components/ui/`)
Simple, reusable, stateless components:

```tsx
// src/components/ui/Button.tsx
interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'danger';
  size?: 'sm' | 'md' | 'lg';
}

export function Button({ 
  variant = 'primary', 
  size = 'md', 
  className, 
  ...props 
}: ButtonProps) {
  const variants = {
    primary: 'bg-blue-600 text-white hover:bg-blue-700',
    secondary: 'bg-gray-200 text-gray-800 hover:bg-gray-300',
    danger: 'bg-red-600 text-white hover:bg-red-700',
  };
  
  const sizes = {
    sm: 'px-3 py-1.5 text-sm',
    md: 'px-4 py-2',
    lg: 'px-6 py-3 text-lg',
  };

  return (
    <button
      className={`rounded-lg font-medium transition-colors ${variants[variant]} ${sizes[size]} ${className}`}
      {...props}
    />
  );
}
```

#### Feature Components (`features/[feature]/components/`)
Components specific to a feature:

```tsx
// src/features/conversations/components/MessageList.tsx
import { Message } from '@/lib/types';

interface MessageListProps {
  messages: Message[];
}

export function MessageList({ messages }: MessageListProps) {
  return (
    <div className="flex flex-col gap-4 p-4">
      {messages.map((message) => (
        <MessageBubble key={message.id} message={message} />
      ))}
    </div>
  );
}
```

#### Page Components (`pages/`)
Top-level route components:

```tsx
// src/pages/conversation/[id].tsx
import { useParams } from 'react-router-dom';
import { useConversation } from '@/features/conversations/hooks/useConversation';
import { MessageList } from '@/features/conversations/components/MessageList';
import { ChatInput } from '@/features/conversations/components/ChatInput';

export default function ConversationPage() {
  const { id } = useParams<{ id: string }>();
  const { conversation, isLoading } = useConversation(id!);

  if (isLoading) return <div>Loading...</div>;
  if (!conversation) return <div>Conversation not found</div>;

  return (
    <div className="flex flex-col h-full">
      <MessageList messages={conversation.messages} />
      <ChatInput conversationId={conversation.id} />
    </div>
  );
}
```

---

## 4. State Management

### 4.1 Server State (React Query)
For data from the backend API:

```tsx
// src/lib/api/conversations.ts
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { apiClient } from './client';
import type { Conversation, Message } from '../types';

// Queries
export function useConversations() {
  return useQuery({
    queryKey: ['conversations'],
    queryFn: () => apiClient.get<Conversation[]>('/conversations'),
  });
}

export function useConversation(id: string) {
  return useQuery({
    queryKey: ['conversation', id],
    queryFn: () => apiClient.get<Conversation>(`/conversations/${id}`),
  });
}

// Mutations
export function useCreateConversation() {
  const queryClient = useQueryClient();
  
  return useMutation({
    mutationFn: (title: string) =>
      apiClient.post<Conversation>('/conversations', { title }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['conversations'] });
    },
  });
}

export function useSendMessage() {
  const queryClient = useQueryClient();
  
  return useMutation({
    mutationFn: ({ conversationId, content }: { conversationId: string; content: string }) =>
      apiClient.post<Message>(`/conversations/${conversationId}/messages`, { content }),
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ 
        queryKey: ['conversation', variables.conversationId] 
      });
    },
  });
}
```

### 4.2 Client State (React Context / useState)
For UI state, auth, etc.:

```tsx
// src/features/auth/AuthProvider.tsx
import { createContext, useContext, useState, useEffect } from 'react';
import type { User } from '@/lib/types';

interface AuthContextType {
  user: User | null;
  login: (email: string, password: string) => Promise<void>;
  logout: () => void;
  isLoading: boolean;
}

const AuthContext = createContext<AuthContextType | null>(null);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    // Check for existing session
    const token = localStorage.getItem('token');
    if (token) {
      // Validate token and get user
      setUser({ id: '1', email: 'user@example.com', name: 'User' });
    }
    setIsLoading(false);
  }, []);

  const login = async (email: string, password: string) => {
    // Implementation
  };

  const logout = () => {
    localStorage.removeItem('token');
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, isLoading }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) throw new Error('useAuth must be used within AuthProvider');
  return context;
}
```

---

## 5. API Integration

### API Client Setup

```typescript
// src/lib/api/client.ts
import axios from 'axios';

const apiClient = axios.create({
  baseURL: import.meta.env.VITE_API_URL || 'http://localhost:5000/api',
  headers: {
    'Content-Type': 'application/json',
  },
});

// Request interceptor: add auth token
apiClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

// Response interceptor: handle errors
apiClient.interceptors.response.use(
  (response) => response.data,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export { apiClient };
```
