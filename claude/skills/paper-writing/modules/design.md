## What I do

I help you write design sections that clearly present your solution architecture and technical approach. The design is your paper's core; it must be logically coherent, well-illustrated, and detailed enough to guide implementation.

## When to use me

Use this skill when writing or revising your design section. I can help you:

- Organize complex designs into understandable components
- Use figures effectively to convey architecture
- Explain design decisions and trade-offs
- Ensure logical coherence throughout
- Maintain appropriate level of detail (not too abstract, not too implementation-focused)

## How I work

I follow a structured approach for design sections:

## OVERALL STRUCTURE (4 pages)

**Opening Paragraph: High-Level Overview (150-200 words)**
- Introduce the overall approach at a high level
- State the core idea or principle
- Explain why this approach makes sense
- Set expectations for detailed sections

**Main Design Sections: Detailed Components (2.5-3 pages)**
- Divide design into 2-4 major components
- Each component gets a dedicated subsection
- Use problem-challenge-solution pattern
- Include figures for each major component

**Design Comparison: Trade-offs and Alternatives (0.5-1 page)**
- Compare with related approaches
- Explain why you chose this design
- Discuss trade-offs and compromises
- Highlight advantages over alternatives

## DESIGN COMPONENT WRITING PATTERNS

**Pattern 1: Problem-Challenge-Solution**

This is the most effective pattern for complex designs:

```
[Component Title]

Problem/Background: [What problem does this component solve?]

Challenge: [What makes this problem difficult?]
- Specific challenge 1
- Specific challenge 2
- Specific challenge 3

Solution: [How do you solve this?]
[Detailed explanation of your approach]

[Figure showing the component]

[Explanation of how the component works]
```

Example (from MOAT):
```
Challenge. In theory, we can assign each BPF program with a unique key
to achieve low-cost BPF isolation. However, PKS only supports up to 16 regions.
If we assign each BPF program with a unique key, these keys would soon be
exhausted as there could be over 16 BPF programs in the kernel.

Solution. We propose a novel two-layer isolation scheme using PKS and
isolated address spaces. Though isolating address spaces is less efficient
than PKS, we manage to reduce its overhead to a minimum using a contemporary
hardware feature named PCID.
```

**Pattern 2: Design Consideration and Solution**

Use this when multiple design options exist:

```
Design Consideration and Solution. [State the design question]

[Discuss the considerations and trade-offs]

[Explain your chosen solution]

[Justify why this is the best choice]
```

Example (from MOAT):
```
Design Consideration and Solution. To prevent such abuse, we aim to
identify and guard sensitive BPF-related objects (instead of all BPF-related
objects) from the defective BPF helpers. Notably, unidentified critical
objects could exist; we will discuss their potential threat in Sec. 8.
```

**Pattern 3: Mechanism Description**

Use this for explaining how a specific mechanism works:

```
[Mechanism Name]

[Overview paragraph explaining what this mechanism does]

[Detailed explanation with multiple paragraphs]

[Figure showing the mechanism]

[Explanation of how the mechanism works with the figure]
```

## FIGURE DESIGN GUIDELINES

**System Architecture Figure**
- Shows major components and relationships
- Includes data flow and control flow
- Uses consistent symbols and colors
- Labels all important elements
- Typically placed early in design section

**Detailed Component Figure**
- Illustrates specific mechanism or algorithm
- Uses tables, flowcharts, or diagrams as appropriate
- Clearly labels parameters and constraints
- Self-contained and understandable
- Placed with corresponding text section

**Comparison Figure**
- Shows differences between design options
- Uses consistent visual style
- Clearly labels what's being compared
- Highlights key distinctions

**Example Figures**
- System overview showing all major components
- Detailed architecture of key subsystem
- State machine or flowchart of algorithm
- Memory layout or data structure diagram
- Comparison table with other approaches

## DESIGN QUALITY CHECKLIST

**Clarity**
- [ ] Can a reader understand the overall approach from the overview?
- [ ] Is each component's purpose clear?
- [ ] Are design decisions justified?
- [ ] Is the level of detail appropriate?

**Completeness**
- [ ] Are all major components covered?
- [ ] Are edge cases or special cases addressed?
- [ ] Is there enough detail to guide implementation?
- [ ] Are all design choices explained?

**Coherence**
- [ ] Do components fit together logically?
- [ ] Are there any contradictions or inconsistencies?
- [ ] Does the design actually solve the stated problem?
- [ ] Are all assumptions from threat model respected?

**Illustration**
- [ ] Is there a figure for each major component?
- [ ] Are figures clear and well-labeled?
- [ ] Do figures support the text?
- [ ] Are figures consistent in style?

## COMMON PITFALLS TO AVOID

**Pitfall 1: Design Too Abstract**
- Problem: Readers can't understand how to implement it
- Solution: Provide concrete details and examples
- Test: Could someone implement this from your description?

**Pitfall 2: Design Too Concrete**
- Problem: Readers get lost in implementation details
- Solution: Save implementation details for Implementation section
- Test: Is this about design or implementation?

**Pitfall 3: Incomplete Design**
- Problem: Many unanswered questions remain
- Solution: Address edge cases and special scenarios
- Test: Are there obvious questions left unanswered?

**Pitfall 4: Inconsistent with Threat Model**
- Problem: Design doesn't actually defend against stated threats
- Solution: Verify design addresses each threat
- Test: Does the design defend against each threat in the threat model?

**Pitfall 5: Unclear Component Relationships**
- Problem: Readers can't understand how components interact
- Solution: Use figures to show component relationships
- Test: Can someone trace data/control flow through the system?

**Pitfall 6: Too Many Figures or Too Few**
- Problem: Either overwhelming or insufficient illustration
- Solution: One figure per major component, plus one overview
- Test: Could I understand this better with a figure?

## WRITING TECHNIQUES

1. **Use active voice**: "We isolate BPF programs using PKS" not "BPF programs are isolated using PKS"
2. **Be specific**: "16 protection keys" not "limited hardware resources"
3. **Explain rationale**: "We use PKS because it provides efficient isolation" not just "We use PKS"
4. **Use consistent terminology**: Pick one term and stick with it
5. **Reference figures**: "As shown in Figure 5" helps readers follow along

## DESIGN SECTION TEMPLATE

```
## 4. Design

### 4.1 System Overview

[High-level description of overall approach]

[Figure: System architecture]

[Explanation of how components work together]

### 4.2 [Component 1 Name]

[Problem-Challenge-Solution pattern]

[Figure: Component 1 details]

[Detailed explanation]

### 4.3 [Component 2 Name]

[Problem-Challenge-Solution pattern]

[Figure: Component 2 details]

[Detailed explanation]

### 4.4 Design Comparison

[Comparison with related approaches]

[Explanation of design choices]

[Trade-offs and compromises]
```

## SELF-CHECK QUESTIONS

- [ ] Is the overall approach clear from the overview?
- [ ] Does each component have a clear purpose?
- [ ] Are design decisions justified?
- [ ] Is there a figure for each major component?
- [ ] Are all figures clear and well-labeled?
- [ ] Does the design actually solve the stated problem?
- [ ] Is the design consistent with the threat model?
- [ ] Could someone implement this from your description?
- [ ] Is the section approximately 4 pages?

## REVISION CHECKLIST

1. Read the overview and verify it's understandable
2. For each component, verify the problem-challenge-solution pattern
3. Check that all design decisions are justified
4. Verify figures are clear and well-labeled
5. Ensure consistent terminology throughout
6. Verify design addresses all threats in threat model
7. Check for any contradictions or inconsistencies
8. Have a colleague review for clarity and completeness

## TIPS FOR STRONG DESIGNS

1. Start with a clear, compelling overview
2. Use the problem-challenge-solution pattern consistently
3. Include one figure per major component
4. Explain the "why" not just the "what"
5. Address edge cases and special scenarios
6. Compare with related approaches
7. Maintain consistent terminology
8. Ensure logical flow between components
