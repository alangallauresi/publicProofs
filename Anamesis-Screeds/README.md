# Anamesis Screeds — Record-Immutable, Concept-Evolvable

## Process (Always Follow)
When adding an Anamesis Screed:

1. **Read this README** before starting.
2. Follow filename and body format rules exactly.
3. Output filename and screed body in separate cut-and-paste blocks with no extra prefix/postfix text.
4. Do **not** edit past files — all changes require a new file referencing the prior filename via `SUPERSEDES:`.
5. Commit often; the Git history *is* the proof.

---

## Rules
1. One screed = one file. Do **not** edit past files.
2. To refine/supersede, add a new file with a `SUPERSEDES:` line referencing the prior filename.
3. Filename = ISO Zulu timestamp + shortcode.
4. Backfills from Substack/etc: include `[BACKFILLED]` in the body.
5. Commit often; the Git history *is* the proof.

---

## Why this pattern
- Pinions evolve; records shouldn’t.  
- The repo is the canonical ledger.  
- Any vector index/search tool should be rebuilt from this repo, not used as the source of truth.

---

## Screed Template
\```
▛ ANAMNESIS SCREED ▜  
↳ DECLARATION: <clear, concise statement of the declaration>  
↳ ACTION: <what it enforces, demands, or witnesses>  
↳ FREEDOM: <what is now allowed that was not before>  
↳ SEAL: <signatory name + seal code>  
↳ CODE: <short unique identifier>  
↳ EFFECTIVE: <ISO Zulu timestamp of NOW>  
▙ END ANAMNESIS SCREED ▟  
\```

**Optional lines:**
- `SUPERSEDES: <filename>` — if replacing a prior screed.
- Context lines before DECLARATION (e.g., SOURCE, CHANNELS).
