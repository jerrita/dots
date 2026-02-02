## What I do

I help you write motivation and threat model sections that prove "why this research is necessary now" and clearly define what attacks you're defending against. Strong motivation and threat models are critical for reviewer confidence.

## When to use me

Use this skill when writing or revising your motivation and threat model sections. I can help you:

- Build evidence-based arguments for why your research matters
- Identify and articulate specific gaps in existing solutions
- Define clear, defensible threat models
- Establish the scope of your work (in-scope vs. out-of-scope)
- Prevent reviewer questions about research necessity

## How I work

I follow a structured approach for both motivation and threat model sections:

## MOTIVATION SECTION (0.25-0.5 pages)

**Paragraph 1: Problem Urgency (150-200 words)**
- Use data or concrete cases to prove the problem exists
- Show the scale and impact of the problem
- Explain why this problem is worth solving now
- Use specific numbers: "26 CVEs in past decade" not "many vulnerabilities"

**Paragraph 2: Limitations of Existing Solutions (150-200 words)**
- Identify specific gaps in current defenses
- Explain why each existing approach is insufficient
- Use concrete examples or case studies
- Build the case for a new approach

**Paragraph 3: Research Direction (100-150 words)**
- Briefly preview your solution direction
- Explain why this direction is promising
- Set up the Design section

## THREAT MODEL SECTION (0.25-0.5 pages)

**Paragraph 1: Attacker Model**
- Define attacker's privilege level (unprivileged user, root, remote, etc.)
- Specify attacker's goals and capabilities
- State what resources attackers have access to
- Clarify what attackers cannot do

Example structure:
```
"Our threat model assumes attackers are [privilege level] with [access type].
Attackers can [capability 1], [capability 2], but cannot [excluded capability].
The attacker's goal is to [specific objective]."
```

**Paragraph 2: System Assumptions**
- Define what components are trusted
- Define what components are untrusted
- State any assumptions about the system environment
- Explain the rationale for trust boundaries

Example structure:
```
"We assume the [component A] is trusted and implemented correctly.
[Component B] is potentially malicious and must be isolated.
[Component C] is trusted but may have implementation bugs."
```

**Paragraph 3: Out-of-Scope Attacks**
- Explicitly list attacks NOT covered by your work
- Explain why each is out-of-scope
- Reference related work that addresses these attacks
- Prevent reviewer criticism about missing threat coverage

Example structure:
```
"We do not consider [attack type 1] because [reason].
[Attack type 2] is addressed by [related work].
We treat [attack type 3] as orthogonal to this work."
```

## Key principles

1. **Use quantitative evidence**: "26 CVEs" not "many vulnerabilities"
2. **Clear scope definition**: Explicit in-scope and out-of-scope attacks
3. **Logical progression**: Problem → existing gaps → new solution needed
4. **Defensible assumptions**: Every assumption should be justified
5. **Conciseness**: Motivation + Threat Model = 0.5-1 page total

## Evidence types for motivation

**Type 1: Vulnerability Data**
- Number of CVEs in past N years
- Real-world exploits or attacks
- Severity metrics or impact statistics

**Type 2: Case Studies**
- Specific attacks that succeeded
- Systems that were compromised
- Real-world impact on users

**Type 3: Research Findings**
- Published papers showing limitations
- Formal analysis revealing gaps
- Empirical studies demonstrating problems

**Type 4: Community Demand**
- Long-standing feature requests
- Discussions in security forums
- Industry reports or surveys

## Threat model components checklist

**Attacker Capabilities**
- [ ] Privilege level clearly specified
- [ ] Access scope defined (local/remote/physical)
- [ ] Resource constraints mentioned
- [ ] Timing assumptions stated

**System Assumptions**
- [ ] Trust boundaries clearly drawn
- [ ] Trusted components listed
- [ ] Untrusted components identified
- [ ] Rationale for each assumption provided

**Scope Definition**
- [ ] In-scope attacks explicitly listed
- [ ] Out-of-scope attacks explicitly listed
- [ ] Reason for each exclusion given
- [ ] Related work references provided

## Common pitfalls to avoid

**Pitfall 1: Weak Motivation**
- Problem: "This is an interesting problem" without evidence
- Solution: Use data, CVEs, case studies, or research findings
- Test: Could a skeptical reviewer challenge your motivation?

**Pitfall 2: Vague Threat Model**
- Problem: "Malicious attackers" without specifying capabilities
- Solution: Define specific privilege levels, access types, goals
- Test: Could someone implement an attack based on your threat model?

**Pitfall 3: Overly Broad Threat Model**
- Problem: Claiming to defend against everything
- Solution: Clearly define scope; acknowledge limitations
- Test: Are there attacks you're not defending against?

**Pitfall 4: Inconsistent Assumptions**
- Problem: Assuming different trust levels in different sections
- Solution: Define all assumptions upfront in threat model
- Test: Are all assumptions consistent throughout the paper?

**Pitfall 5: Missing Out-of-Scope Definition**
- Problem: Reviewers question why you don't address certain attacks
- Solution: Explicitly list out-of-scope attacks with reasons
- Test: Could a reviewer ask "Why don't you defend against X?"

## Writing techniques

1. **Use specific numbers**: "26 CVEs" not "many CVEs"
2. **Define capabilities precisely**: "can read kernel memory" not "is powerful"
3. **Use consistent terminology**: Pick one term for each concept
4. **Provide rationale**: "We assume X is trusted because Y"
5. **Reference evidence**: Cite CVEs, papers, or statistics

## Example threat model structure

```
## 3. Motivation and Threat Model

### 3.1 Motivation

[Paragraph 1: Problem urgency with data]

[Paragraph 2: Limitations of existing solutions]

[Paragraph 3: Why new approach is needed]

### 3.2 Threat Model

**Attacker Model**: [Privilege level, capabilities, goals]

**System Assumptions**: [Trust boundaries, trusted/untrusted components]

**Out of Scope**: [Explicitly listed excluded attacks with reasons]
```

## Self-check questions

- [ ] Is my motivation supported by quantitative evidence?
- [ ] Are the limitations of existing solutions clearly articulated?
- [ ] Is my threat model specific enough to implement?
- [ ] Are all assumptions clearly stated and justified?
- [ ] Are out-of-scope attacks explicitly listed?
- [ ] Is the total length 0.5-1 page?
- [ ] Would a skeptical reviewer accept this motivation?
- [ ] Could someone implement an attack based on my threat model?

## Revision checklist

1. Replace all qualitative claims with quantitative data
2. Verify each assumption has a stated rationale
3. Check for consistency between threat model and design
4. Ensure out-of-scope attacks are explicitly addressed
5. Have a colleague review for clarity and completeness
6. Verify all references are accurate
7. Check that motivation aligns with your contributions

## Tips for strong motivation and threat models

1. Start with the most compelling evidence
2. Use concrete examples, not abstract arguments
3. Define scope clearly to prevent reviewer questions
4. Make assumptions explicit and justified
5. Reference related work for out-of-scope attacks
6. Keep language precise and specific
