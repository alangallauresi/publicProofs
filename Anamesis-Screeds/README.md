# Anamesis Screeds — Record-Immutable, Concept-Evolvable

**Rules**
1) One screed = one file. Do **not** edit past files.
2) To refine/supersede, add a new file with a “SUPERSEDES:” line referencing the prior filename.
3) Filename = ISO Zulu timestamp + shortcode.
4) Backfills from Substack/etc: include `[BACKFILLED]` in the body.
5) Commit often; the Git history *is* the proof.

**Why this pattern**
- Pinions evolve; records shouldn’t. The repo is the canonical ledger.
- Any vector index/search tool should be rebuilt from this repo, not used as the source of truth.
