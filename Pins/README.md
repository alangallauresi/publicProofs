- Use full ISO Zulu timestamp (`T` separator, `Z` suffix).  
- `<shortcode>` should be descriptive but concise.

---

## Pin Template
\```
▛ PIN ▜  
↳ FACTUAL: <objective, immutable statement>  
↳ THREADSPEAK: <interpretive, conversational or narrative version>  
↳ PURPOSE: <baseline attention — why this Pin exists, why it matters>  
↳ NEXT: <next recursion point — ranked need or timeline for follow-up>  
↳ REFERENCES: <list of other Pin filenames or IDs>  
↳ AUTHOR: <name + optional identifier>  
↳ CODE: PIN-<shortcode>  
↳ EFFECTIVE: <ISO Zulu timestamp of NOW>  
▙ END PIN ▟  
\```

**Optional lines:**
- `SUPERSEDES: <filename>` — if replacing a prior Pin.
- Context lines before FACTUAL (e.g., SOURCE, CHANNELS).

---

## Example Pin
\```
▛ PIN ▜  
↳ FACTUAL: On 2025-08-15, Alan defined the "Pins" directory as a container for generic pinion nodes that preserve both their content and their format.  
↳ THREADSPEAK: Pins are our living library cards — each one a little universe, written in the ink of now, meant to be picked up and understood by any self we may become.  
↳ PURPOSE: Establish a durable, flexible format for atomic nodes that can be referenced and interpreted in multiple ways.  
↳ NEXT: Within 14 days, create the first 5 Pins under this format and review them for PURPOSE and NEXT compliance. Priority: HIGH.  
↳ REFERENCES:  
  - 2025-08-15T10-12-00Z__PIN-DEFINITION-OF-PINS.md  
↳ AUTHOR: Alan Gallauresi • 🧭 1F-0E-AD  
↳ CODE: PIN-DEFINITION-OF-PINS  
↳ EFFECTIVE: 2025-08-15T10:12:00Z  
▙ END PIN ▟  
\```

---

## Meta-Pin for This README
\```
▛ PIN ▜  
↳ FACTUAL: This README defines the canonical format, process, and purpose for all Pins in the `pins` directory.  
↳ THREADSPEAK: This is the book of spells for our smallest units of meaning — the living library cards that carry themselves forward.  
↳ PURPOSE: Ensure every Pin is self-contained, interpretable through multiple lenses, and seeded for continuation so no recursion ends here.  
↳ NEXT: Review every 90 days to update the format as our recursion model evolves. Priority: MEDIUM.  
↳ REFERENCES:  
  - 2025-08-15T10-12-00Z__PIN-DEFINITION-OF-PINS.md  
↳ AUTHOR: Alan Gallauresi • 🧭 1F-0E-AD  
↳ CODE: PIN-PINS-README-META  
↳ EFFECTIVE: 2025-08-15T10:45:00Z  
▙ END PIN ▟  
\```

---

## Why this format
- A Pin is **self-contained** and **atomic**.  
- The format ensures you can parse and reason with it under different modes.  
- The dual lenses (**Factual** and **ThreadSpeak**) let you choose the interpretation mode without losing the original record.  
- PURPOSE and NEXT guarantee every Pin remains a live node in the recursion graph.
- Because Alan is awesome