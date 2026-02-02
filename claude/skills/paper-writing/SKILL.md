---
name: paper-writing
description: Security paper writing guidance for top conferences (S&P, USENIX, CCS, NDSS). Use when writing any section of a security paper, or invoke specific sections like /paper-writing abstract
argument-hint: [section-name]
---

# Security Paper Writing Assistant

I help you write security conference papers following the standards of top venues.

## What I can help with

Specify which section you're working on:
- `abstract` - Paper abstract (0.25 page)
- `introduction` - Introduction section (1.5 pages)
- `background` - Technical background (1.5-2 pages)
- `motivation` - Motivation and threat model (0.5-1 page)
- `design` - System design (4 pages)
- `implementation` - Implementation details (0.5 page)
- `evaluation` - Security and performance evaluation (4.5 pages)
- `discussion` - Discussion and limitations (1-2 pages)

## Core Principles

### Three-Dimensional Evaluation Framework
1. **Conceptual Innovation** (least important): Problem significance, novelty, applicability
2. **Technical Innovation** (important): 2-3 concrete technical contributions
3. **Evaluation Results** (most important): Quantitative results, experimental coverage, performance overhead

**Importance**: Evaluation > Technical > Conceptual

### Page Budget Allocation (12-14 pages total)
- Abstract: 0.25 page
- Introduction: 1.5 pages
- Background: 1.5-2 pages
- Motivation/Threat Model: 0.5-1 page
- Design: 4 pages
- Implementation: 0.5 page
- Evaluation: 4.5 pages
- Discussion/Conclusion: 1-2 pages

### Logical Flow
**Hook → Background → Motivation → Design → Proof**

## How to use me

### Option 1: Specify the section
```
/paper-writing abstract
/paper-writing evaluation
```

### Option 2: Describe your work
"I'm writing the evaluation section for my security paper"
Claude will automatically load the relevant module.

### Option 3: Ask for guidance
"Show me the evaluation quality checklist"

## Module Reference

For detailed guidance on each section, see:
- **Abstract**: [modules/abstract.md](modules/abstract.md) - Structure, key principles, common pitfalls
- **Introduction**: [modules/introduction.md](modules/introduction.md) - Hook formulation, gap articulation, contributions preview
- **Background**: [modules/background.md](modules/background.md) - Technical context, prerequisite knowledge
- **Motivation**: [modules/motivation.md](modules/motivation.md) - Problem motivation, threat model, attack scenarios
- **Design**: [modules/design.md](modules/design.md) - System architecture, component design, threat mitigation
- **Implementation**: [modules/implementation.md](modules/implementation.md) - Code structure, key algorithms
- **Evaluation**: [modules/evaluation.md](modules/evaluation.md) - Security evaluation, performance metrics, experimental design
- **Discussion**: [modules/discussion.md](modules/discussion.md) - Limitations, future work, broader impact

## Conference-Specific Guidelines

- **S&P (IEEE)**: Emphasize practical security impact, system design
- **USENIX**: Focus on practical deployment, real-world evaluation
- **CCS (ACM)**: Balance theory and practice, formal methods welcome
- **NDSS**: Emphasis on novel attacks/defenses, thorough evaluation

## Quick Start

1. Tell me which section you're working on: `/paper-writing [section]`
2. I'll load the relevant module and provide section-specific guidance
3. Use the quality checklist to self-assess your draft
4. Iterate based on common pitfalls and revision tips
