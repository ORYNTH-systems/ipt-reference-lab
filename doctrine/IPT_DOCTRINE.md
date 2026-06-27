# Integrity Preservation Theory (IPT) Doctrine

## Repository Doctrine v1.0

This document defines the constitutional doctrine governing the Integrity Preservation Theory (IPT) Reference Lab.

The doctrine is the normative source for this repository. Specifications, cases, runtime logic, evidence files, metrics, and release materials shall remain subordinate to this doctrine.

## Constitutional Object

Integrity Preservation Theory governs preservation-oriented integrity evaluation in bounded systems.

Its constitutional object is not execution, authorization, verification, optimization, compliance, or downstream action.

Its constitutional object is the evaluation of whether a bounded system remains sufficiently preserved to be treated as the same evaluative object under declared evidence, continuity, degradation, recoverability, and admissibility constraints.

## D-001 — Preservation Is the Constitutional Object

IPT evaluates preservation.

Integrity is not treated as a general synonym for quality, performance, correctness, safety, compliance, availability, resilience, or reliability.

An IPT implementation shall determine whether the bounded system remains sufficiently preserved to support an integrity judgment.

## D-002 — Evaluation Requires a Bounded System

Every IPT evaluation shall define the bounded system under evaluation.

No integrity claim may be made over an undefined, unbounded, or constitutionally ambiguous object.

The bounded system shall identify the evaluative object, relevant components, relevant interfaces, relevant dependencies, and preservation conditions.

## D-003 — Evidence Precedes Interpretation

Observable evidence, derived indicators, and evaluative interpretation shall remain distinct.

Raw observables are not integrity determinations.

Derived indicators are not integrity determinations.

Integrity state is a downstream evaluative classification constrained by admissible evidence.

## D-004 — Preservation Is Not Performance

A system may perform while failing preservation.

A system may temporarily fail performance while remaining preserved.

Performance, safety, compliance, correctness, resilience, reliability, and availability may inform evaluation, but none of them independently constitutes integrity under IPT.

## D-005 — Integrity Is Continuity-Aware

Continuity informs preservation evaluation but does not independently determine integrity.

Structural continuity, functional continuity, and evidentiary continuity shall be evaluated as distinct continuity dimensions where applicable.

Continuity, degradation, recoverability, and evidence sufficiency shall remain constitutionally distinct.

## D-006 — Evidence Sufficiency Constrains Evaluation

No IPT implementation may report a definitive integrity determination when evidence is constitutionally insufficient.

Evidence insufficiency is not proof of degradation.

Evidence insufficiency is not proof of preservation.

Indeterminate evaluation is a valid constitutional outcome.

## D-007 — Implementation Is Subordinate to Doctrine

Implementations may vary in observables, estimators, weights, thresholds, scoring functions, state labels, domains, and reporting formats.

Implementations may not redefine the constitutional object of IPT.

Implementations may not collapse protected distinctions among evidence, indicators, interpretation, continuity, degradation, recoverability, evidence sufficiency, scoring, and integrity state.

## D-008 — IPT Is Non-Sovereign

IPT evaluates.

IPT does not authorize.

IPT does not deny.

IPT does not execute.

IPT does not regulate.

IPT does not prescribe legal, clinical, institutional, operational, or regulatory action.

Its role is limited to preservation-oriented integrity evaluation.

## Constitutional Evaluation Path

Every conforming IPT evaluation shall preserve the following order:

1. Define the bounded system.
2. Identify preservation-relevant properties.
3. Acquire admissible observables.
4. Map observables to derived indicators.
5. Estimate preservation-relevant dimensions.
6. Evaluate evidence sufficiency.
7. Evaluate continuity.
8. Evaluate degradation.
9. Evaluate recoverability.
10. Compute preservation support where applicable.
11. Classify integrity state.
12. Report uncertainty, limitations, and admissibility constraints.

## Repository Rule

No document, runtime module, case file, evidence file, metric report, or release artifact in this repository may override this doctrine.

Any implementation that violates this doctrine is not an IPT-conforming implementation.
