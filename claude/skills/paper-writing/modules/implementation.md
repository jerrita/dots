## What I do

I help you write implementation sections that bridge the gap between design and evaluation. A good implementation section is brief (0.5 page) but informative, highlighting the most important engineering decisions and challenges.

## When to use me

Use this skill when writing or revising your implementation section. I can help you:

- Decide what implementation details matter for the paper
- Explain engineering challenges and how you solved them
- Keep the section concise and focused
- Distinguish between design and implementation
- Provide reproducibility information

## How I work

I follow a structured approach for implementation sections:

## SECTION STRUCTURE (0.5 page)

**Paragraph 1: Implementation Platform & Scale (50-100 words)**
- Operating system and version
- Programming language(s) used
- Total lines of code
- Any major dependencies

Example:
```
"MOAT is implemented on Linux 6.1.38, and consists of 2,911 lines of C code.
We explain the key points below."
```

**Paragraph 2: Key Implementation Details (300-400 words)**
- 2-3 most important implementation challenges
- How you addressed each challenge
- Why these details matter for the paper
- Any non-obvious engineering decisions

**Paragraph 3: Availability & Reproducibility (50-100 words)**
- Whether code is open source
- Where to find the code
- Any documentation or resources
- Commitment to maintenance

## WHAT TO INCLUDE

**Include These Details**
- Significant engineering challenges
- Non-obvious solutions to problems
- Platform-specific considerations
- Performance optimizations that required special handling
- Workarounds for system limitations

**Exclude These Details**
- Standard implementation techniques
- Minor bug fixes
- Routine debugging processes
- Implementation details covered in design
- Code listings (put in appendix if necessary)

## IMPLEMENTATION DETAIL PATTERNS

**Pattern 1: Challenge-Solution**

```
[Challenge Name]. [Describe the challenge]

[Why this challenge exists]

[Solution approach]

[Why this solution works]
```

Example (from MOAT):
```
Kernel Interrupt Handling. MOAT has to cooperate with many low-level routines
inside the kernel. For instance, during the execution of BPF programs, an
interrupt may occur and take over control flow to its handler. Note that most
interrupt handlers require access to kernel memory, and as a result, the PKS
would presumably raise spurious alerts. Thus, we need to temporarily disable
PKS inside these handlers and re-enable it once the handlers finish.
```

**Pattern 2: Design-Implementation Gap**

```
[Design Aspect]. [How it was designed]

[Implementation consideration that differs from design]

[How implementation addresses this]

[Impact on system]
```

Example:
```
Memory Allocation. The design specifies that each BPF program should have
isolated memory. However, in practice, we found that strict isolation of all
memory regions would cause excessive fragmentation. Therefore, we implemented
a hybrid approach where critical structures are isolated, but less sensitive
data shares memory regions.
```

## COMMON PITFALLS TO AVOID

**Pitfall 1: Implementation Section Too Long**
- Problem: Exceeds 0.5 page, becomes a second design section
- Solution: Focus only on key challenges; save details for appendix
- Test: Is this about design or implementation?

**Pitfall 2: Missing Key Challenges**
- Problem: Readers can't understand why implementation took effort
- Solution: Highlight 2-3 significant challenges
- Test: What would someone need to know to implement this?

**Pitfall 3: Implementation Contradicts Design**
- Problem: Design and implementation don't match
- Solution: Explain any differences in implementation section
- Test: Are design and implementation consistent?

**Pitfall 4: No Reproducibility Information**
- Problem: Readers can't access or reproduce your work
- Solution: Provide code availability and documentation
- Test: Could someone reproduce your implementation?

**Pitfall 5: Too Much Code**
- Problem: Code listings waste precious space
- Solution: Describe code in text; put listings in appendix
- Test: Is this code essential for understanding?

## WRITING TECHNIQUES

1. **Be specific**: "2,911 lines of C code" not "a significant implementation"
2. **Explain challenges**: "Why did this require special handling?"
3. **Use concrete examples**: "Interrupt handlers require kernel memory access"
4. **Highlight non-obvious decisions**: "We use X instead of Y because Z"
5. **Connect to design**: "As described in §4.2, we implemented..."

## IMPLEMENTATION SECTION TEMPLATE

```
## 5. Implementation

MOAT is implemented on [Platform] [Version], and consists of [LOC] lines of
[Language] code. We explain the key points below.

[Key Challenge 1]
[Explanation of challenge and solution]

[Key Challenge 2]
[Explanation of challenge and solution]

[Key Challenge 3 (if applicable)]
[Explanation of challenge and solution]

We release the codebase of MOAT on [URL]. We will maintain [System Name]
to benefit the community and follow-up research.
```

## SELF-CHECK QUESTIONS

- [ ] Is the implementation platform clearly specified?
- [ ] Are 2-3 key challenges highlighted?
- [ ] Is each challenge explained with its solution?
- [ ] Is reproducibility information provided?
- [ ] Is the section approximately 0.5 page?
- [ ] Does implementation align with design?
- [ ] Would someone understand the engineering effort?

## REVISION CHECKLIST

1. Verify platform and version are clearly stated
2. Ensure each challenge has a clear solution
3. Check that implementation aligns with design
4. Verify code availability information is provided
5. Remove any code listings (move to appendix)
6. Ensure section is concise (0.5 page max)
7. Have a colleague review for clarity

## TIPS FOR STRONG IMPLEMENTATION SECTIONS

1. Focus on significant challenges, not routine details
2. Explain why each challenge required special handling
3. Highlight non-obvious engineering decisions
4. Provide clear reproducibility information
5. Keep the section brief and focused
6. Use concrete examples and specific numbers
7. Connect implementation to design decisions
