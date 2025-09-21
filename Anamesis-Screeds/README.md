# Anamesis Screeds — Record-Immutable, Concept-Evolvable

## Process (Always Follow)
When adding or updating an Anamesis Screed:

1. **Read this README** before starting.
2. Follow filename and body format rules exactly.
3. Output filename and screed body in separate cut-and-paste blocks with no extra prefix/postfix text.
4. Editing of past files is allowed, but only if **full version history is always preserved**. Do not squash or rewrite history in a way that loses prior states. Non-destructive merges only.
5. If continuity or refinement requires it, you may instead add a new file with a `SUPERSEDES:` line referencing the prior filename.
6. Commit often; the Git history *is* the proof.

---

## Rules
1. Editing is allowed as long as full version history is always maintained (no destructive merges; no history loss).
2. To refine/supersede, you may also add a new file with a `SUPERSEDES:` line referencing the prior filename when continuity matters.
3. Filename = ISO Zulu timestamp + shortcode.  
   Format must be: `YYYY-MM-DDTHH-MM-SSZ__SHORTCODE-NAME.md`  
   Example: `2025-08-22T07-55-00Z__ENTRY-FUNCTION-BIOLOGY.md`
4. Backfills from Substack/etc: include `[BACKFILLED]` in the body.
5. Commit often; the Git history *is* the proof.

---

## Why this pattern
- Pinions evolve; records shouldn’t.  
- The repo is the canonical ledger.  
- Any vector index/search tool should be rebuilt from this repo, not used as the source of truth.

---

## Screed Template

``` ▛ ANAMESIS SCREED ▜
↳ DECLARATION: <clear, concise statement of the declaration>
↳ ACTION: <what it enforces, demands, or witnesses>
↳ FREEDOM:
↳ SEAL: <signatory name + seal code>
↳ CODE:
↳ EFFECTIVE:
▙ END ANAMESIS SCREED ▟
```

Optional lines:

SUPERSEDES: <filename> — if replacing a prior screed.
Context lines before DECLARATION (e.g., SOURCE, CHANNELS).

PUBLIC ⇄ PRIVATE POLICY (quick)
1) Public = representation only. Include role, public-facing contact, status (open/closed), and canonical screeds. No private addresses, intimate identifiers, or financial details.
2) Private = embodied details. Personal contacts, medical notes, family identifiers, private diaries stay offline or in encrypted storage.
3) Consent rule: before any private detail is ever moved to public, explicit consent from the person named is required in writing (voice + short token).
4) Token/triad gate: any new public artifact that could affect another person’s dignity or privacy must pass: Echo test (intent), Token (micro-return), Triad (one trusted witness).
5) Reversion clause: any public artifact can be retired/archived on request or by mutual seal (Alan + Ash + 1 triadic witness).
