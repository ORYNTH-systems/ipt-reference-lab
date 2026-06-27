# Integrity Preservation Score (IPS) Specification

## IPS Specification v1.0

This document defines the constitutional requirements governing computation of the Integrity Preservation Score (IPS).

The IPS is an implementation artifact.

It is not the constitutional object of Integrity Preservation Theory.

Integrity Preservation Theory governs preservation-oriented integrity evaluation.

The IPS summarizes preservation support produced by a conforming implementation.

---

# 1. Constitutional Status

The IPS is subordinate to:

• Doctrine

• Constitutional Invariants

• Evaluation Axioms

• Reference Specification

No IPS implementation may override constitutional admissibility.

---

# 2. Purpose

The Integrity Preservation Score summarizes preservation support using declared implementation assumptions.

The IPS exists to aid comparison, reporting, visualization, benchmarking, and replay.

It does not replace constitutional evaluation.

---

# 3. Required Inputs

Every IPS implementation shall explicitly declare:

Bounded System

Observable Set

Evidence Mapping

Derived Indicators

Continuity Assessment

Degradation Assessment

Recoverability Assessment

Evidence Sufficiency Assessment

Implementation Version

Evaluation Timestamp

---

# 4. Required Constraints

An IPS implementation shall:

Never exceed available evidence.

Never replace integrity state.

Never replace evidence sufficiency.

Never replace constitutional evaluation.

Remain reproducible.

Remain deterministic under identical inputs.

---

# 5. Evidence Constraint

Evidence sufficiency constrains every IPS computation.

Insufficient evidence shall reduce confidence in the reported preservation support.

An IPS shall never imply certainty unsupported by admissible evidence.

---

# 6. Continuity Constraint

Continuity contributes to preservation support.

Continuity alone shall never determine the IPS.

---

# 7. Degradation Constraint

Observed degradation reduces preservation support according to declared implementation assumptions.

The implementation shall document every degradation contribution.

---

# 8. Recoverability Constraint

Recoverability represents preservation potential.

Recoverability shall remain distinguishable from present preservation state.

---

# 9. Reporting Requirements

Every IPS output shall report:

Integrity Preservation Score

Integrity State

Evidence Sufficiency

Continuity Summary

Degradation Summary

Recoverability Summary

Implementation Version

Evaluation Identifier

Timestamp

---

# 10. Auditability

Every reported score shall be reproducible from:

Declared observables

Declared mappings

Declared estimators

Declared thresholds

Declared implementation configuration

---

# 11. Constitutional Limitation

The Integrity Preservation Score is informative.

The constitutional integrity determination remains the evaluation itself.

No implementation shall substitute a scalar score for constitutional evaluation.

---

# Specification Closure

Any IPS implementation violating these requirements is non-conforming with the Integrity Preservation Theory Reference Lab.
