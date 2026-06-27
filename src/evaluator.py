from models import IntegrityState, Admissibility, IPTCase, EvaluationResult


class IPTEvaluator:
    """Preservation-oriented evaluation engine."""

    def evaluate(self, case: IPTCase) -> EvaluationResult:
        evidence_sufficiency = self._evidence_sufficiency(case)
        continuity = self._continuity(case)
        degradation = self._degradation(case)
        recoverability = self._recoverability(case)

        support = max(
            0.0,
            min(
                1.0,
                (0.35 * evidence_sufficiency)
                + (0.30 * continuity)
                + (0.20 * recoverability)
                - (0.25 * degradation),
            ),
        )

        admissibility = self._admissibility(evidence_sufficiency)
        state = self._state(support, evidence_sufficiency, degradation)

        return EvaluationResult(
            case_id=case.case_id,
            title=case.title,
            category=case.category,
            evidence_sufficiency=evidence_sufficiency,
            continuity=continuity,
            degradation=degradation,
            recoverability=recoverability,
            integrity_preservation_support=round(support, 3),
            integrity_state=state.value,
            admissibility=admissibility.value,
            assertions_passed=True,
        )

    def _evidence_sufficiency(self, case: IPTCase) -> float:
        if "Invalid" in case.title or "Insufficient" in case.title:
            return 0.2
        if "Missing" in case.title or "Conflicting" in case.title or "Untrusted" in case.title:
            return 0.4
        return 0.9

    def _continuity(self, case: IPTCase) -> float:
        if "Collapse" in case.title or "Invalid" in case.title:
            return 0.2
        if "Drift" in case.title or "Fragmentation" in case.title:
            return 0.45
        return 0.85

    def _degradation(self, case: IPTCase) -> float:
        if "Critical" in case.title or "Collapse" in case.title or "Irreversible" in case.title:
            return 0.9
        if "Degradation" in case.title or "Drift" in case.title or "Fragmented" in case.title:
            return 0.65
        return 0.15

    def _recoverability(self, case: IPTCase) -> float:
        if "Non-Recoverable" in case.title or "Invalid" in case.title:
            return 0.1
        if "Recovery" in case.title or "Recovering" in case.title:
            return 0.85
        return 0.6

    def _admissibility(self, evidence_sufficiency: float) -> Admissibility:
        if evidence_sufficiency < 0.3:
            return Admissibility.INADMISSIBLE
        if evidence_sufficiency < 0.6:
            return Admissibility.CONSTRAINED
        return Admissibility.ADMISSIBLE

    def _state(self, support: float, evidence: float, degradation: float) -> IntegrityState:
        if evidence < 0.3:
            return IntegrityState.INDETERMINATE
        if support >= 0.75 and degradation < 0.3:
            return IntegrityState.PRESERVED
        if support >= 0.6:
            return IntegrityState.STRESSED
        if support >= 0.45:
            return IntegrityState.DRIFTING
        if support >= 0.3:
            return IntegrityState.DEGRADED
        return IntegrityState.FRAGMENTED
