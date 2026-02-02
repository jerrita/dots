## What I do

I help you write evaluation sections that convincingly demonstrate your system's effectiveness and efficiency. Evaluation is critical: without strong evaluation, reviewers won't believe your claims. This section should occupy 4.5 pages and include both security and performance analysis.

## When to use me

Use this skill when writing or revising your evaluation section. I can help you:

- Structure security and performance evaluations
- Design fair and comprehensive experiments
- Present results clearly and convincingly
- Analyze and explain results
- Address potential reviewer concerns

## How I work

I follow a structured approach for evaluation sections:

## OVERALL STRUCTURE (4.5 pages)

**Opening Paragraph: Evaluation Overview (100-150 words)**
- State the evaluation's overall goals
- List the main aspects being evaluated (security, performance, etc.)
- Outline the section's organization
- Preview key findings

**Security Evaluation (1.5-2 pages)**
- Attack vector analysis
- Real-world vulnerability verification
- Detailed case studies

**Performance Evaluation (2-2.5 pages)**
- Experimental setup
- Performance results across scenarios
- Result analysis and discussion

## SECURITY EVALUATION FRAMEWORK

**Part 1: Attack Vector Analysis (0.75-1 page)**

Systematically list all possible attack vectors and analyze how your system mitigates each:

```
① [Attack Type 1]
[Description of attack]
[How your system mitigates it]

② [Attack Type 2]
[Description of attack]
[How your system mitigates it]

③ [Attack Type 3]
[Description of attack]
[How your system mitigates it]
```

Example (from MOAT):
```
① Arbitrary Kernel Access. Currently, the most prevalent threat to the BPF
ecosystem is the ability of malicious BPF programs to arbitrarily modify
kernel memory. In order to accomplish this, these BPF programs typically
employ corner-case operations to deceive the verifier during the loading
phase and to behave maliciously during runtime. This type of attack is
effectively mitigated due to the fact that MOAT derives the necessary memory
regions of each BPF program and uses PKS to prevent any runtime access
beyond this region.
```

**Part 2: Real-World CVE Verification (0.75-1 page)**

Verify your system against actual vulnerabilities:

```
We surveyed [domain] CVEs in the past [time period]. A total of [N] CVEs
are [vulnerability type] and thus fall within the scope of [System].
We tested [System]'s effectiveness on all of these CVEs with publicly
available PoC.

[Summary statistics]: [X]% of CVEs are mitigated by [System].

[For each major CVE category]:
- [Category]: [Number] CVEs, [Percentage]% mitigated
```

**Part 3: Detailed CVE Case Studies (0.5-1 page)**

Select 3-5 representative CVEs and analyze in detail:

```
CVE-[YEAR]-[NUMBER]: [Vulnerability Name]
[Description of vulnerability]
[How it exploits the system]
[How your system mitigates it]
[Code snippet or diagram showing mitigation]
```

Example (from MOAT):
```
CVE-2022-23222 is a pointer mischeck vulnerability introduced via a rather
new BPF feature, bpf_ringbuf. This new pointer type named PTR_TO_MEM_OR_NULL
was brought to BPF in 2020, along with a new pointer type. However, the
verifier had not been updated to track the bounds of this new type, resulting
in this vulnerability. As shown in Fig. 13a, the malicious payload first
retrieves a nullptr via ringbuf_reserve, which returns this newly added
pointer type. Then, the conditional clause helps the verifier to determine
its value range (line 3). However, when tracking the bpf_or operator, the
verifier performs a wrong truncation on its upper bound. After the truncation,
the uncontrolled r5 is viewed by the verifier as a legitimate constant 0x1,
which is later used as the offset to perform arbitrary kernel access.
```

## PERFORMANCE EVALUATION FRAMEWORK

**Part 1: Experimental Setup (200-300 words)**

Describe your experimental environment:

```
Hardware Configuration:
- CPU: [Model, cores, frequency]
- Memory: [Size, type]
- Storage: [Type, capacity]

Software Environment:
- OS: [Name, version]
- Compiler: [Name, version]
- Other dependencies: [List]

Benchmark Selection:
- [Benchmark 1]: [Why chosen, what it measures]
- [Benchmark 2]: [Why chosen, what it measures]
- [Benchmark 3]: [Why chosen, what it measures]

Experimental Methodology:
- [How many runs]
- [Warm-up procedure]
- [Measurement method]
- [Error handling]
```

**Part 2: Performance Results (1.5-2 pages)**

Present results across multiple scenarios:

```
### [Application/Scenario 1]

[Description of scenario]

[Performance metrics and results]

[Table or figure showing results]

[Brief analysis of results]

### [Application/Scenario 2]

[Similar structure]

### [Application/Scenario 3]

[Similar structure]
```

Example (from MOAT):
```
Network Applications. We evaluate MOAT's performance when using BPF for
network applications, and the maximum performance penalty from MOAT is 3%
among these cases. We also test MOAT's overhead on system tracing, another
important BPF use case. On average, MOAT brings a performance loss of 5.5%
in this setting.
```

**Part 3: Result Analysis (300-400 words)**

Explain and interpret the results:

```
[Why are the results what they are?]
[What are the main performance bottlenecks?]
[How do results compare to expectations?]
[Are results acceptable given security benefits?]
[What do results tell us about the system?]
```

Example:
```
The performance overhead is primarily due to three factors: (1) TLB flush
overhead when switching between BPF programs, (2) runtime checks for helper
parameters, and (3) PKS domain switching overhead. The TLB flush is the
dominant factor, accounting for approximately 60% of the overhead. This is
expected because modern systems have large TLBs, and flushing them is costly.
However, this overhead is acceptable given the security benefits provided.
```

## EVALUATION QUALITY CHECKLIST

**Security Evaluation**
- [ ] Are all major attack vectors covered?
- [ ] Is each attack vector clearly explained?
- [ ] Is the mitigation mechanism clear?
- [ ] Are real CVEs used for verification?
- [ ] Are representative CVEs analyzed in detail?
- [ ] Is the analysis convincing?

**Performance Evaluation**
- [ ] Is the experimental setup clearly described?
- [ ] Are multiple scenarios tested?
- [ ] Are multiple metrics measured?
- [ ] Are results presented clearly (tables/figures)?
- [ ] Are results analyzed and explained?
- [ ] Are results compared to expectations?

**Overall**
- [ ] Do results support the main claims?
- [ ] Are limitations acknowledged?
- [ ] Is the section approximately 4.5 pages?
- [ ] Are figures and tables clear?
- [ ] Are all results explained?

## COMMON PITFALLS TO AVOID

**Pitfall 1: Incomplete Security Evaluation**
- Problem: Only testing a few CVEs or attack vectors
- Solution: Systematically cover all major attack types
- Test: Are there obvious attacks you didn't test?

**Pitfall 2: Unfair Performance Comparison**
- Problem: Comparing against systems with different configurations
- Solution: Ensure fair comparison with same hardware/software
- Test: Could someone argue the comparison is unfair?

**Pitfall 3: Unexplained Results**
- Problem: Presenting data without analysis
- Solution: Explain why results are what they are
- Test: Does someone understand what the results mean?

**Pitfall 4: Missing Error Analysis**
- Problem: Not discussing anomalies or failures
- Solution: Analyze all unexpected results
- Test: Are there any results that seem odd?

**Pitfall 5: Insufficient Benchmarks**
- Problem: Testing only one application or scenario
- Solution: Test multiple representative scenarios
- Test: Would results be different with other applications?

**Pitfall 6: Unclear Visualization**
- Problem: Tables and figures are hard to read
- Solution: Use clear labels, consistent formatting
- Test: Can someone understand the figure without reading the caption?

## WRITING TECHNIQUES

1. **Use specific numbers**: "3% throughput loss" not "minimal overhead"
2. **Explain results**: "The overhead is due to X because Y"
3. **Use tables and figures**: Visual presentation is clearer
4. **Provide context**: "This overhead is acceptable because Z"
5. **Be honest**: Acknowledge limitations and failures

## EVALUATION SECTION TEMPLATE

```
## 6. Evaluation

To evaluate [System], we first analyze how [System] mitigates various attack
interfaces and then benchmark its effectiveness in Sec. 6.1. We then assess
the performance of [System] under different scenarios in Sec. 6.2.

### 6.1 Security Evaluation

#### 6.1.1 Attack Mitigation Analysis

① [Attack Type 1]
[Analysis]

② [Attack Type 2]
[Analysis]

[More attack types...]

#### 6.1.2 Real-world CVE Evaluation

We surveyed [domain] CVEs in the past [time period]. A total of [N] CVEs
are [vulnerability type] and thus fall within the scope of [System].

[CVE case studies]

### 6.2 Performance Evaluation

#### 6.2.1 Experimental Setup

[Hardware, software, benchmarks, methodology]

#### 6.2.2 Performance Results

[Results for each scenario]

[Figures and tables]

#### 6.2.3 Result Analysis

[Analysis and explanation of results]
```

## SELF-CHECK QUESTIONS

- [ ] Are all major attack vectors systematically analyzed?
- [ ] Are real CVEs used for verification?
- [ ] Are representative CVEs analyzed in detail?
- [ ] Is the experimental setup clearly described?
- [ ] Are multiple scenarios tested?
- [ ] Are multiple performance metrics measured?
- [ ] Are results clearly presented (tables/figures)?
- [ ] Are results analyzed and explained?
- [ ] Are limitations acknowledged?
- [ ] Is the section approximately 4.5 pages?

## REVISION CHECKLIST

1. Verify all attack vectors are covered
2. Check that CVE analysis is accurate
3. Verify experimental setup is reproducible
4. Ensure fair performance comparison
5. Analyze all unexpected results
6. Verify figures and tables are clear
7. Check that results support main claims
8. Have a colleague review for completeness

## TIPS FOR STRONG EVALUATIONS

1. Systematically cover all attack types
2. Use real CVEs for verification
3. Test multiple representative scenarios
4. Measure multiple relevant metrics
5. Present results clearly with figures/tables
6. Explain why results are what they are
7. Acknowledge limitations honestly
8. Compare results to expectations
