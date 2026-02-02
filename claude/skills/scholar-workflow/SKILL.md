---
name: scholar-workflow
description: Use when searching papers, verifying DOIs, checking publication venues, or validating academic sources.
---

## Overview

This skill provides a unified interface for academic document retrieval, DOI verification, and multi-source cross-validation using four authoritative academic APIs: **OpenAlex**, **DBLP**, **CrossRef**, and **arXiv**.

---

## Supported Operations

| Operation | Description | Primary Sources |
|-----------|-------------|-----------------|
| `search` | Search papers by title, author, or keywords | OpenAlex, DBLP, arXiv |
| `verify-doi` | Validate DOI and retrieve metadata | CrossRef, OpenAlex |
| `check-venue` | Verify publication venue legitimacy | DBLP, CrossRef |
| `cross-validate` | Multi-source consistency check | All sources |

---

## API Endpoints

### 1. OpenAlex API
- **Base URL**: `https://api.openalex.org`
- **Rate Limit**: 100,000 requests/day (with polite pool)
- **Key Endpoints**:
  - `/works` - Search papers
  - `/works/{openalex_id}` - Get work by ID
  - `/works/doi:{doi}` - Get work by DOI

### 2. DBLP API
- **Base URL**: `https://dblp.org/search`
- **Rate Limit**: No strict limit (be polite)
- **Key Endpoints**:
  - `/publ/api` - Publication search
  - `/author/api` - Author search
  - `/venue/api` - Venue search

### 3. CrossRef API
- **Base URL**: `https://api.crossref.org`
- **Rate Limit**: 50 requests/second (with polite pool)
- **Key Endpoints**:
  - `/works/{doi}` - DOI lookup
  - `/works` - Query works
  - `/journals/{issn}` - Journal metadata

### 4. arXiv API
- **Base URL**: `https://export.arxiv.org/api`
- **Rate Limit**: 1 request/3 seconds
- **Key Endpoints**:
  - `/query` - Search papers (Atom feed)

---

## Workflow Procedures

### Paper Search Workflow

```
INPUT: query (title/author/keywords)
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 1: Parallel Search                        │
│  ├─ OpenAlex: GET /works?search={query}         │
│  ├─ DBLP: GET /search/publ/api?q={query}        │
│  └─ arXiv: GET /query?search_query={query}      │
└─────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 2: Result Normalization                   │
│  ├─ Extract: title, authors, year, DOI, venue   │
│  └─ Deduplicate by DOI / title similarity       │
└─────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 3: Cross-Validation                       │
│  ├─ If DOI exists → verify via CrossRef         │
│  └─ Match confidence score calculation          │
└─────────────────────────────────────────────────┘
    │
    ▼
OUTPUT: Validated paper list with confidence scores
```

### DOI Verification Workflow

```
INPUT: doi (e.g., "10.1145/3292500.3330919")
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 1: Primary Verification (CrossRef)        │
│  GET https://api.crossref.org/works/{doi}       │
│  ├─ Status 200 → DOI valid                      │
│  └─ Status 404 → DOI not found                  │
└─────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 2: Secondary Verification (OpenAlex)      │
│  GET https://api.openalex.org/works/doi:{doi}   │
│  └─ Cross-check metadata consistency            │
└─────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 3: Metadata Extraction                    │
│  ├─ Title, Authors, Publication Date            │
│  ├─ Journal/Conference, Volume, Pages           │
│  ├─ Citation count, Open Access status          │
│  └─ Abstract (if available)                     │
└─────────────────────────────────────────────────┘
    │
    ▼
OUTPUT: Verified metadata + validation status
```

### Venue Validation Workflow

```
INPUT: venue_name (e.g., "Nature", "SIGMOD", "ICML")
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 1: DBLP Venue Lookup                      │
│  GET /search/venue/api?q={venue_name}           │
│  └─ Check if venue exists in DBLP database      │
└─────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 2: CrossRef Journal Verification          │
│  GET /journals?query={venue_name}               │
│  └─ Retrieve ISSN and publisher info            │
└─────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────┐
│  Step 3: Legitimacy Assessment                  │
│  ├─ Check presence in known predatory lists     │
│  ├─ Verify publisher reputation                 │
│  └─ Calculate legitimacy score (0-100)          │
└─────────────────────────────────────────────────┘
    │
    ▼
OUTPUT: Venue status + legitimacy score + warnings
```

---

## Multi-Source Cross-Validation Logic

### Confidence Score Calculation

```python
def calculate_confidence(results: dict) -> float:
    """
    Calculate confidence score based on multi-source agreement.
    
    Sources: openalex, dblp, crossref, arxiv
    Fields: title, authors, year, venue, doi
    """
    weights = {
        'title_match': 0.25,
        'author_match': 0.20,
        'year_match': 0.15,
        'venue_match': 0.20,
        'doi_verified': 0.20
    }
    
    score = 0.0
    source_count = len([s for s in results.values() if s])
    
    # Title consistency (fuzzy match across sources)
    if title_consistency(results) > 0.9:
        score += weights['title_match']
    
    # Author overlap ratio
    author_overlap = calculate_author_overlap(results)
    score += weights['author_match'] * author_overlap
    
    # Year agreement
    if year_agreement(results):
        score += weights['year_match']
    
    # Venue verification
    if venue_verified(results):
        score += weights['venue_match']
    
    # DOI verification via CrossRef
    if doi_verified_crossref(results.get('doi')):
        score += weights['doi_verified']
    
    # Bonus for multi-source confirmation
    if source_count >= 3:
        score *= 1.1
    
    return min(score, 1.0)
```

### Validation Status Codes

| Code | Status | Description |
|------|--------|-------------|
| `V1` | Fully Verified | DOI valid + 3+ sources agree |
| `V2` | Partially Verified | DOI valid + 2 sources agree |
| `V3` | Single Source | Only 1 source found |
| `U1` | Unverified | No DOI, metadata inconsistent |
| `E1` | Error | API failure or timeout |

---

## Example Requests

### Search Papers

```bash
# OpenAlex search
curl "https://api.openalex.org/works?search=transformer+attention&per_page=10"

# DBLP search
curl "https://dblp.org/search/publ/api?q=transformer+attention&format=json&h=10"

# arXiv search
curl "https://export.arxiv.org/api/query?search_query=all:transformer+AND+all:attention&max_results=10"
```

### Verify DOI

```bash
# CrossRef DOI lookup
curl "https://api.crossref.org/works/10.1145/3292500.3330919"

# OpenAlex DOI lookup
curl "https://api.openalex.org/works/doi:10.1145/3292500.3330919"
```

### Check Venue

```bash
# DBLP venue search
curl "https://dblp.org/search/venue/api?q=SIGMOD&format=json"

# CrossRef journal lookup
curl "https://api.crossref.org/journals?query=nature"
```

---

## Error Handling

| Error Type | Handling Strategy |
|------------|-------------------|
| Rate Limit (429) | Exponential backoff, switch to secondary source |
| Timeout | Retry with increased timeout, fall back to cache |
| Not Found (404) | Mark as unverified, try alternative sources |
| Malformed Response | Log error, use partial data if available |

---

## Output Schema

```json
{
  "query": "string",
  "results": [
    {
      "title": "string",
      "authors": ["string"],
      "year": "integer",
      "doi": "string | null",
      "venue": "string",
      "abstract": "string | null",
      "url": "string",
      "sources": {
        "openalex": "boolean",
        "dblp": "boolean",
        "crossref": "boolean",
        "arxiv": "boolean"
      },
      "validation": {
        "status": "V1 | V2 | V3 | U1 | E1",
        "confidence": "float (0-1)",
        "doi_verified": "boolean",
        "venue_verified": "boolean"
      }
    }
  ],
  "metadata": {
    "total_results": "integer",
    "sources_queried": ["string"],
    "timestamp": "ISO8601"
  }
}
```

---

## Best Practices

1. **Always verify DOIs** via CrossRef before accepting paper metadata
2. **Use parallel requests** to minimize latency across sources
3. **Prefer OpenAlex** for comprehensive coverage and citation data
4. **Use DBLP** for computer science venues and author disambiguation
5. **Check arXiv** for preprints and latest submissions
6. **Implement caching** for repeated queries (TTL: 24 hours)
7. **Log all validation failures** for quality monitoring