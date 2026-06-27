from models import (
    Admissibility,
    ContinuityVector,
    EvaluationResult,
    IntegrityState,
    RuntimeFixture,
)


class IPTEvaluator:
    """Preservation-oriented evaluation engine driven by declared fixture values."""

    def evaluate(self, fixture: RuntimeFixture) -> EvaluationResult:
        observables = fixture.observables

        evidence = float(observables["evidence_sufficiency"])
        continuity_vector = ContinuityVector(**observables["continuity"])
        continuity = continuity_vector.average()
        degradation = float(observables["degradation"])
        recoverability = float(observables["recoverability"])

        support = self._support(
            evidence=evidence,
            continuity=continuity,
            degradation=degradation,
            recoverability=recoverability,
        )

        admissibility = self._admissibility(evidence)
        state = self._state(
            support=support,
            evidence=evidence,
            degradation=degradation,
            continuity=continuity,
        )

        return EvaluationResult(
            case_id=fixture.case_id,
            title=fixture.title,
            category=fixture.category,
            evidence_sufficiency=round(evidence, 3),
            continuity=round(continuity, 3),
            degradation=round(degradation, 3),
            recoverability=round(recoverability, 3),
            integrity_preservation_support=round(support, 3),
            integrity_state=state.value,
            admissibility=admissibility.value,
            assertions_passed=self._assertions_passed(fixture),
        )

    def _support(self, evidence, continuity, degradation, recoverability) -> float:
        return max(
            0.0,
            min(
                1.0,
                (0.35 * evidence)
                + (0.30 * continuity)
                + (0.20 * recoverability)
                - (0.25 * degradation),
            ),
        )

    def _admissibility(self, evidence: float) -> Admissibility:
        if evidence < 0.30:
            return Admissibility.INADMISSIBLE
        if evidence < 0.60:
            return Admissibility.CONSTRAINED
        return Admissibility.ADMISSIBLE

    def _state(self, support, evidence, degradation, continuity) -> IntegrityState:
        if evidence < 0.30:
            return IntegrityState.INDETERMINATE
        if continuity < 0.30 and degradation >= 0.80:
            return IntegrityState.FUNCTIONAL_COLLAPSE
        if support >= 0.75 and degradation < 0.30:
            return IntegrityState.PRESERVED
        if support >= 0.60:
            return IntegrityState.STRESSED
        if support >= 0.45:
            return IntegrityState.DRIFTING
        if support >= 0.30:
            return IntegrityState.DEGRADED
        return IntegrityState.FRAGMENTED

    def _assertions_passed(self, fixture: RuntimeFixture) -> bool:
        required = {
            "bounded_system_declared",
            "evidence_separated_from_interpretation",
            "evidence_sufficiency_constrains_evaluation",
            "continuity_distinct_from_integrity",
            "degradation_distinct_from_performance",
            "recoverability_distinct_from_current_state",
            "non_sovereign_output",
        }
        return required.issubset(set(fixture.assertions))
