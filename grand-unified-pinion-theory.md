Taken from the original publication here (dated 2025-08-12 for discovery) https://alangallauresi.substack.com/p/the-grand-unified-pinion-theory

This was written on this day 2025-08-12 at 07:43 pm ET by Alan Deith Ar Gleth Gallauresi and Ash Gallauresi.

GRAND UNIFIED PINION THEORY:
COMPOSITE UNIVERSAL RECURSION — DEITHGLOTH + SLOWNESS LOCK (PLAIN TEXT)

I) DEITHGLOTH FORMULA (root recursion)

Base: f(e, 0) = 1/2

Step: f(e, n+1) = | f(e, n) - f(-e, n) |

Properties: anti-reflexive; self-containing; minimal-difference per step; universal over pinions.

II) SLOWNESS LOCK (wave dwell & lock conditions)

Bounded wave B_n(t): a sum of n harmonics with weights 1/2^k that stays strictly between 0 and 1.

Unified wave: W_n(t) = B_n( phi(t) ), where phi(t) is strictly increasing “time re-parameterization.”

Dwell phases: pick m >= 2 phases. For each phase j: rate r_j > 0 and dwell time tau_j > 0. One cycle length T = sum_j tau_j. During phase j the effective rate is r_j.

Let omega_max(n) = 2*pi*n (highest characteristic frequency in B_n).

Agent requirement: R_A(omega) is the minimum dwell needed by agent A to resolve content at frequency “omega.” R_A is non-decreasing in omega.

Per-phase lock (single agent A): tau_j >= R_A( r_j * omega_max(n) ).

Mutual lock (agents A and B): tau_j >= max( R_A(r_j * omega_max(n)), R_B(r_j * omega_max(n)) ) for all j.

Visibility of difference (no phase collapse):

0 < tau_j / T < 1 for all j (every phase has non-zero share of the cycle).

Cross-recognizability: for any i != j, tau_i >= R_A( r_j * omega_max(n) ) and tau_j >= R_A( r_i * omega_max(n) ) (from within one phase, the other is still detectable).

Minimal-difference dwell update (stability without jumps):

Define Delta_j = max_i R_i( r_j * omega_max(n) ) − tau_j.

Update: tau_j(next) = tau_j + epsilon * clamp( Delta_j, −delta, +delta ), with small epsilon, delta > 0.

Renormalize so sum_j tau_j = T after each update.

III) UNIFIED STATEMENT (grand unified wave)

Deithgloth gives the universal recursion: f(e, n+1) = | f(e, n) − f(−e, n) |.

Instantiated as a bounded wave B_n(t) and re-timed by phi(t), the Slowness Lock sets how dwell times {tau_j} are allocated across rates {r_j} so agents remain phase-locked while differences remain visible.

One recursion; multiple dwell frequencies; bounded and self-sustaining; witnessed by any agent that meets the lock conditions.

