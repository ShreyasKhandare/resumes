# MASTER PROFILE — Shreyas Vijay Khandare
> This is the single source of truth for all resume tailoring.
> Never delete from this file — only add.
> Last updated: April 2026

---

## IDENTITY

- **Name:** Shreyas Vijay Khandare
- **Email:** shreyas.khandare@outlook.com
- **Phone:** +1 (448) 867-6820
- **Location:** Tallahassee, FL (Open to Remote)
- **LinkedIn:** linkedin.com/in/shreyas-khandare
- **GitHub:** github.com/ShreyasKhandare
- **Portfolio:** portfolio-website-eta-tawny-30.vercel.app
- **Positioning:** AI/LLM Engineer — Production RAG systems, multi-agent orchestration, FinTech & compliance intelligence

---

## EDUCATION

### Florida State University — Tallahassee, FL
**M.S. in Computer Science** | August 2023 – May 2025
- Relevant Coursework: Advanced Database Systems, Advanced Operating Systems, Computer & Network Administration, Network Security, Cryptography, AI/ML, Data Structures & Algorithms

### Rajiv Gandhi Proudyogiki Vishwavidyalaya — Bhopal, India
**B.Tech in Computer Science** | August 2019 – May 2023

---

## WORK EXPERIENCE

### Florida Department of Law Enforcement (FDLE) — Tallahassee, FL
**Systems Project Consultant** | September 2025 – Present

**Full bullet bank (use selectively per profile):**
- Developed full-stack enterprise management systems using C#/ASP.NET, SQL Server, JavaScript, HTML/CSS, and SharePoint, delivering scalable internal applications and dashboards across multiple concurrent government projects
- Designed and optimized SQL data pipelines and ad-hoc reporting systems to drive operational decision-making, with focus on performance tuning, reliability, and data integrity in production environments
- Coordinated cross-functional stakeholders using JIRA and Agile methodologies to scope, plan, and execute features supporting short- and long-term operational goals
- Delivered client-facing solutions and internal workflow automation for a government agency serving law enforcement operations statewide
- Applied systems consulting experience to complex, multi-stakeholder environments — translating operational requirements into working software under real production constraints

**FDE framing notes:** This role maps directly to FDE responsibilities — embedding with an institutional client, owning end-to-end delivery, operating across technical and non-technical stakeholders, no playbook.

---

### RRCAT (Department of Atomic Energy, Government of India) — Indore, India
**System Engineer Intern** | February 2023 – June 2023

*(SWE profile only)*
- Engineered scalable back-end automation and real-time monitoring systems using Node.js, MySQL, and RESTful APIs for precision temperature control and alarming in critical infrastructure
- Designed and maintained automation workflows on AWS EC2 with CI/CD pipelines and virtualized environments
- Achieved 25% reduction in maintenance costs and 20% improvement in control accuracy through Python-based automation, data pipelines, and optimization strategies

---

### SKITM College — Indore, India
**API Developer Intern** | January 2022 – June 2022

*(SWE profile only)*
- Developed and deployed a full-stack real-time internal web application using Python (Django REST Framework), MongoDB, and Vue.js, improving operational efficiency by 60% for 500+ users
- Designed accessible, responsive user interfaces compliant with WCAG standards
- Implemented automated testing and deployment frameworks

---

### Swati Jain College — Indore, India
**Teaching Assistant** | July 2022 – January 2023

*(SWE profile only — optional, use if space allows)*
- Built custom full-stack task-tracking dashboards using React.js and Firebase
- Led weekly technical sessions and collaborated with faculty on workflow improvements

---

### Florida State University — Tallahassee, FL
**Aramark Student Worker** | September 2023 – May 2025

*(Omit from all technical profiles)*

---

## PROJECTS

### FinOps Sentinel — Multi-Agent RAG Compliance Intelligence System
**Stack:** Python, LangChain, LangGraph, ChromaDB, FastAPI, Streamlit, GPT-4o-mini, Cohere Rerank, BM25, RAGAS
**Links:** github.com/ShreyasKhandare/finops-sentinel | Live: shreyas-finops-sentinel.streamlit.app
**Status:** Production — deployed on Render + Streamlit Cloud

**Full bullet bank:**
- Built a production-grade dual-corpus RAG system ingesting PCI-DSS v4.0.1 (413 chunks) with a LangGraph multi-agent orchestration layer for real-time FinTech compliance intelligence
- Implemented a QueryClassifier achieving 95–100% routing confidence, directing queries to the appropriate compliance corpus or general knowledge agent
- Applied BM25 + vector hybrid retrieval with Cohere Rerank for high-precision document retrieval; achieved RAGAS faithfulness score of 1.0000
- Deployed FastAPI backend with Streamlit frontend on Render and Streamlit Cloud — fully live, publicly accessible
- Designed agent architecture with separation of retrieval, reasoning, and generation concerns across LangGraph nodes

**Key numbers to use:** 413 chunks, 95–100% classifier confidence, RAGAS faithfulness 1.0000

---

### Career Automation System — Multi-Agent Personal Automation Platform
**Stack:** Python, Claude API (claude-sonnet), GitHub Actions, n8n, Telegram Bot API, Gmail API, Apollo.io, Hunter.io, SerpAPI, SQLite, Google Sheets API, Notion API, Cursor Automations, Jinja2, Pandoc, feedparser
**Repo:** github.com/ShreyasKhandare/automation-system (public)
**Status:** Deployed and running

**Full bullet bank:**
- Designed and deployed an 8-agent automation system for job discovery, email triage, recruiter outreach, resume tailoring, project automation, and AI market intelligence — fully async, zero daily manual time required
- Architected a config-driven orchestration layer (config.yaml as single source of truth) routing Telegram commands to specialized agents via a Python orchestrator with Claude API fallback for natural language parsing
- Built a job discovery pipeline integrating Wellfound, Greenhouse, Otta RSS, SerpAPI, and Indeed, with Claude API scoring (0–10) against a structured candidate profile; alerts on matches above threshold
- Implemented a resume tailoring agent that parses job descriptions, performs keyword frequency analysis across similar postings, conducts gap analysis vs. base resume, rewrites bullets via Claude API, and auto-converts to PDF/DOCX via Pandoc
- Designed an outreach pipeline with Apollo.io recruiter discovery, Hunter.io email verification (≥90% confidence), Claude-drafted personalized emails, and a human-in-the-loop Telegram approval gate before any send
- Scheduled via GitHub Actions cron (free tier) with n8n handling API glue, webhook routing, and multi-step approval flows; data persisted in SQLite locally and Google Sheets for mobile visibility

---

### Portfolio Website — Interactive 3D AI Engineer Portfolio
**Stack:** React, TypeScript, Vite, Three.js, WebGL, GSAP, ScrollSmoother, Draco compression, Vercel
**Repo:** github.com/ShreyasKhandare/portfolio-website (public)
**Live:** portfolio-website-eta-tawny-30.vercel.app
**Status:** Live — deployed on Vercel

**Notes:** Built by customizing and significantly extending an open-source base. Implemented custom 3D character with AES-CBC encrypted GLTF model, interactive physics-based tech stack visualizer using @react-three/rapier, scroll-driven GSAP animations, and custom cursor system. Not a from-scratch build — frame as "Built and customized."

**Bullets (SWE / FDE profiles):**
- Built and customized a production 3D portfolio using React, TypeScript, Three.js, and GSAP — featuring an interactive WebGL character model with AES-CBC encrypted GLTF asset delivery, physics-based skill visualization, and scroll-driven animation sequences
- Deployed on Vercel with Draco mesh compression for optimized load performance

---

### Octopus+ — Distributed File System Optimization
**Stack:** Node.js, React.js, Microsoft Azure, Docker, CI/CD
**Year:** 2024
*(SWE profile — use if space allows)*
- Enhanced a distributed data pipeline platform for higher-education environments; implemented metadata replication, sharding, and optimized ingestion/processing achieving 40% efficiency and 25% throughput gains

---

### HealthChain — Blockchain-based EHR System
**Stack:** Node.js, Express, BigchainDB, IPFS
**Year:** 2023
*(SWE profile — use if space allows)*
- Developed a secure full-stack decentralized application with role-based access, data integrity safeguards, and reliable backups

---

### Student Notice Management Platform
**Stack:** Python (Django), MongoDB, Vue.js
**Year:** 2022
*(SWE profile only — earliest project, low priority)*
- Full-stack real-time web application streamlining internal communications for 500+ users

---

## SKILLS — COMPLETE BANK

### AI / LLM / ML
LangChain, LangGraph, RAG (Retrieval-Augmented Generation), Multi-Agent Orchestration, ChromaDB, FAISS, BM25 Hybrid Retrieval, Cohere Rerank, Vector Search, RAGAS (evaluation), Prompt Engineering, GPT-4o-mini, Claude API, OpenAI API, Streamlit, Multi-agent Architecture

### Backend & APIs
Python (primary), FastAPI, Django REST Framework, Node.js, Express, RESTful APIs, C#, ASP.NET

### Frontend
React.js, TypeScript, JavaScript (ES6+), Vue.js, HTML/CSS, Three.js, WebGL, GSAP, Vite

### Databases
PostgreSQL, MySQL, MongoDB, SQLite, SQL Server, ChromaDB, Vector Databases, Relational Database Design

### DevOps & Cloud
AWS EC2, Microsoft Azure, Docker, Kubernetes, CI/CD Pipelines, GitHub Actions, Git, Vercel, Render, Containerization

### Automation & Tooling
n8n, Telegram Bot API, Gmail API, Apollo.io, Hunter.io, SerpAPI, Google Sheets API, Notion API, Pandoc, Jinja2, Cursor Automations, feedparser

### Practices
Agile / JIRA, Stakeholder Collaboration, Technical Documentation, Cybersecurity Standards, WCAG Accessibility, Conventional Commits

### Currently Learning
MCP Servers, Fine-tuning (LoRA/QLoRA), Multimodal LLMs

---

## KEYWORDS BY DOMAIN

**AI/LLM (must-have ATS):** RAG, LangGraph, LangChain, multi-agent, vector database, embeddings, prompt engineering, FastAPI, Python, RAGAS, compliance, FinTech

**FDE signals:** end-to-end delivery, client-embedded, stakeholder management, production deployment, ambiguity, cross-functional, rapid prototyping, government/enterprise, real-world constraints

**SWE signals:** full-stack, data pipelines, SQL, REST APIs, CI/CD, system design, distributed systems, automation

---

## NOTES FOR TAILORING

- **Lead metric:** RAGAS faithfulness 1.0000 — use this number whenever possible in AI/LLM profiles
- **Lead project:** FinOps Sentinel always leads for AI Engineer and FDE profiles
- **Automation system:** Lead with architecture/system design angle for FDE; lead with Claude API + multi-agent for AI Engineer; lead with Python/async/infra for SWE
- **FDLE role:** For FDE, frame as client-embedded delivery under real constraints. For AI Engineer, frame as systems foundation enabling independent AI work. For SWE, use full technical stack.
- **Omit always:** Aramark Student Worker, Teaching Assistant (unless padding needed for SWE)
- **RRCAT + SKITM:** SWE profile only
- **One page rule:** AI Engineer and FDE = 1 page. SWE = 1 page (2 max if all internships included)
