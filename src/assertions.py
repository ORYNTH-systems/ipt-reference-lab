from typing import Callable, List

REQUIRED_ASSERTIONS = [
    "bounded_system_declared",
    "evidence_separated_from_interpretation",
    "evidence_sufficiency_constrains_evaluation",
    "continuity_distinct_from_integrity",
    "degradation_distinct_from_performance",
    "recoverability_distinct_from_current_state",
    "non_sovereign_output",
]


def bounded_system_declared(fixture):
    return fixture.bounded_system.get("declared", False)


def assertions_complete(fixture):
    return set(REQUIRED_ASSERTIONS).issubset(set(fixture.assertions))


def evidence_present(fixture):
    return "evidence_sufficiency" in fixture.observables


def continuity_present(fixture):
    return "continuity" in fixture.observables


def degradation_present(fixture):
    return "degradation" in fixture.observables


def recoverability_present(fixture):
    return "recoverability" in fixture.observables


ASSERTION_FUNCTIONS: List[Callable] = [
    bounded_system_declared,
    assertions_complete,
    evidence_present,
    continuity_present,
    degradation_present,
    recoverability_present,
]
