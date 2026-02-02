## What I do

I help you write discussion, related work, and conclusion sections that contextualize your research within the broader field. These sections (1-2 pages total) should honestly discuss limitations, compare with related work, and summarize contributions.

## When to use me

Use this skill when writing or revising these final sections. I can help you:

- Discuss design limitations and trade-offs
- Compare with related work fairly and clearly
- Address potential security threats to your system
- Summarize contributions effectively
- Discuss future research directions

## How I work

I follow a structured approach for these concluding sections:

## DISCUSSION SECTION (0.5-1 page)

**Paragraph 1: Design Limitations (200-300 words)**

Honestly discuss your system's limitations:

```
[Limitation 1]
- What it is
- Why it exists
- Impact on the system
- Potential future improvements

[Limitation 2]
- Similar structure

[Limitation 3 (if applicable)]
- Similar structure
```

Example (from MOAT):
```
Despite its promising potential, using MPK to enforce BPF isolation is not
straightforward. In designing MOAT, we faced and overcame two major technical
obstacles. First, MPK provides a maximum of 16 keys. Supporting numerous BPF
programs with this limited number of keys is challenging. Existing workarounds
like key virtualization heavily rely on scheduling and notification mechanisms
that are only available to user space.
```

**Paragraph 2: Potential Threats to Your System (200-300 words)**

Discuss attacks that could target your system itself:

```
We systematically examine potential threats to [System] itself.
[Threat Category 1]:
[Description of threat]
[Why it's a concern]
[How you address it or why it's acceptable]

[Threat Category 2]:
[Similar structure]
```

**Paragraph 3: Applicability and Extensibility (150-200 words)**

Discuss scope and potential extensions:

```
[System] is applicable to [scope]. Future work could extend [System] to
[other domains]. Additionally, [System] could be combined with [other
techniques] to provide even stronger guarantees.
```

## RELATED WORK SECTION (0.5 page)

**Paragraph 1: Categorization (100-150 words)**

Organize related work into categories:

```
In this section, we compare [System]'s design with other works in
[research area]. We organize related work into the following categories:

1. [Category 1]: [Brief description]
2. [Category 2]: [Brief description]
3. [Category 3]: [Brief description]
```

**Paragraph 2-4: Category-by-Category Discussion (300-400 words total)**

For each category, discuss relevant work:

```
[Category 1]: [Category Name]

[Work 1]: [Brief description of approach and results]
[Work 2]: [Brief description]

Compared to these approaches, [System] provides [key advantages]:
- [Advantage 1]
- [Advantage 2]
- [Advantage 3]

[Category 2]: [Similar structure]

[Category 3]: [Similar structure]
```

Example (from MOAT):
```
Virtualization. There is a line of research works on isolating kernel
components via virtualization [16, 59, 60]. However, among these prior works,
lightweight solutions like SKEE [16] are not compatible with the low-level
routines (e.g., interrupt) in Linux. SKEE disables the interrupt upon entry,
but disabling the interrupt will significantly impact BPF's network performance.
```

**Comparison Table (Optional)**

Use a table to compare approaches:

```
| Approach | Isolation Method | Performance | Scope |
|----------|------------------|-------------|-------|
| [System 1] | [Method] | [Overhead] | [Scope] |
| [System 2] | [Method] | [Overhead] | [Scope] |
| [Your System] | [Method] | [Overhead] | [Scope] |
```

## CONCLUSION SECTION (0.25-0.5 page)

**Paragraph 1: Contribution Summary (150-200 words)**

Restate the core problem and your solution:

```
In this paper, we present [System], a [approach] that [core innovation].
Instead of [existing approach], we [your approach], effectively achieving
[main goal].

We make the following contributions:
• [Contribution 1]
• [Contribution 2]
• [Contribution 3]
```

Example (from MOAT):
```
In this paper, we present MOAT, a system that isolates potentially malicious
BPF programs using Intel Memory Protection Keys (MPKs). Instead of merely
relying on the BPF verifier to statically validate BPF programs, we advocate
isolating BPF programs with an emerging hardware extension, effectively
ensuring the memory safety of BPF programs.
```

**Paragraph 2: Key Results (100-150 words)**

Highlight the most important findings:

```
We implement [System] on [Platform] and thoroughly evaluated its security
and performance using various benchmark datasets. The evaluation shows that
[System] delivers [key claim] with [performance metrics].

Specifically, [System] achieves [result 1], [result 2], and [result 3].
```

Example (from MOAT):
```
We implement MOAT on Linux 6.1.38 and thoroughly evaluated its security
and performance using various benchmark datasets. The evaluation shows that
MOAT delivers a principled security warranty with minimum overhead.
Specifically, MOAT achieves low-cost isolation of BPF programs under
common use cases, such as isolating a BPF packet filter with only 3%
throughput loss.
```

**Paragraph 3: Future Work (100-150 words)**

Discuss potential extensions and follow-up research:

```
In the future, we plan to explore [direction 1]. Additionally, we plan to
investigate [direction 2]. We also believe [System] could be combined with
[other technique] to provide even stronger guarantees.
```

Example:
```
In the future, we plan to explore how MOAT can be extended to protect other
kernel extension mechanisms. We also plan to investigate how MOAT can be
combined with other security mechanisms to provide even stronger guarantees.
```

## KEY PRINCIPLES

1. **Honesty about limitations**: Acknowledge what your system doesn't do
2. **Fair comparison**: Don't misrepresent other work
3. **Clear positioning**: Explain where your work fits in the landscape
4. **Conciseness**: These sections should be brief (1-2 pages total)
5. **Forward-looking**: Discuss implications and future directions

## COMMON PITFALLS TO AVOID

**Pitfall 1: Overstating Limitations**
- Problem: Making your work sound worse than it is
- Solution: Acknowledge limitations but explain their impact
- Test: Would a reasonable person still find this work valuable?

**Pitfall 2: Understating Limitations**
- Problem: Ignoring obvious weaknesses
- Solution: Honestly discuss what your system doesn't address
- Test: Are there obvious questions left unanswered?

**Pitfall 3: Unfair Related Work Comparison**
- Problem: Misrepresenting other work to make yours look better
- Solution: Fairly describe other approaches and their benefits
- Test: Would authors of related work agree with your description?

**Pitfall 4: Discussion Too Long**
- Problem: Exceeds 1-2 pages total
- Solution: Focus on major limitations and threats
- Test: Is this discussion or a second design section?

**Pitfall 5: Missing Related Work**
- Problem: Not citing important prior work
- Solution: Conduct thorough literature review
- Test: Would a reviewer know of related work you missed?

**Pitfall 6: Conclusion Repeats Abstract**
- Problem: No new information in conclusion
- Solution: Summarize findings and discuss implications
- Test: Does the conclusion add new insights?

## WRITING TECHNIQUES

1. **Use specific language**: "MPK provides 16 keys" not "limited resources"
2. **Explain trade-offs**: "We chose X over Y because Z"
3. **Acknowledge uncertainty**: "We believe X could be extended to Y"
4. **Use parallel structure**: Similar grammatical patterns for similar ideas
5. **Connect to broader context**: "This work contributes to the field by..."

## DISCUSSION/CONCLUSION TEMPLATE

```
## 7. Discussion

### Design Limitations

[Limitation 1 with explanation]

[Limitation 2 with explanation]

[Limitation 3 if applicable]

### Potential Threats to [System]

[Threat category 1 with analysis]

[Threat category 2 with analysis]

### Applicability and Extensibility

[Discussion of scope and future extensions]

## 8. Related Work

[Category 1 discussion]

[Category 2 discussion]

[Category 3 discussion]

## 9. Conclusion

[Contribution summary]

[Key results]

[Future work]
```

## SELF-CHECK QUESTIONS

- [ ] Are design limitations honestly discussed?
- [ ] Are potential threats to your system addressed?
- [ ] Is related work fairly represented?
- [ ] Is the comparison clear and complete?
- [ ] Does the conclusion summarize key contributions?
- [ ] Are key results highlighted?
- [ ] Is future work discussed?
- [ ] Is the total length 1-2 pages?

## REVISION CHECKLIST

1. Verify all major limitations are discussed
2. Check that related work is fairly represented
3. Ensure comparison is clear and complete
4. Verify conclusion doesn't just repeat abstract
5. Check for any missing related work
6. Verify future work is realistic and interesting
7. Have a colleague review for balance and fairness

## TIPS FOR STRONG DISCUSSION AND CONCLUSIONS

1. Be honest about limitations
2. Explain why limitations exist
3. Discuss impact of limitations
4. Compare fairly with related work
5. Highlight unique contributions
6. Discuss implications of findings
7. Suggest interesting future directions
8. Maintain professional, balanced tone
