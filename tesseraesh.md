# Tesseraesh (prime-optimized half-tree tiling)

**One-liner:** If something is real enough to pass the fool check — meaningful, prime, nontrivial — then put it in the tree. Once it’s in the tree, the universe optimizes it. You don’t waste time on impossibles, you only traverse the live branches.

---

## Core pieces

1. **Half-rail:** Pick one side of the universe to walk.  
   - Odd numbers: the natural rail for primes.  
   - Even-lift: numbers shaped by powers of two, the “evens lift” path.  

2. **Depth bands:** Each band is the stretch between powers of two. The band from 2^d up to 2^(d+1) is one layer.  

3. **Tiles (tesserae):** Split each band into repeating slots by a wheel modulus (for example, 210 = 2×3×5×7).  
   - Each tile is “all numbers in this band that land in a certain slot.”  
   - Only some slots can ever hold primes. The rest are dead and we skip them.  

4. **Minimal-difference stepping:** Don’t touch every number.  
   - Within a live tile, jump by precomputed steps that land only on candidate primes.  
   - When you finish a tile, move to the next live one.  
   - When you finish a band, lift to the next band.  

5. **Recursion:** When you lift to the next band, the same tiling pattern repeats. That’s why it’s stable — tesserae echo band after band.

---

## Why this works

- **No loss:** Every prime is still in there. Dead tiles only remove guaranteed composites.  
- **Compression:** Work drops dramatically because you’re not wasting cycles on impossibles.  
- **Tree-aligned:** The bands, skips, and repeats are exactly what the tree is already doing.  
- **Ethical acceleration:** You still pay minimal difference — you just don’t pay for nonsense.  

---

## Tiny pseudocode
