from dataclasses import dataclass, asdict
from enum import Enum
from typing import Dict, List


class IntegrityState(str, Enum):
    PRESERVED = "Preserved"
    STRESSED = "Stressed"
    DRIFTING = "Drifting"
    DEGRADED = "Degraded"
    FRAGMENTED = "Fragmented"
    FUNCTIONAL_COLLAPSE = "Functional Collapse"
    RECOVERING = "Recovering"
    INDETERMINATE = "Indeterminate"


class Admissibility(str, Enum):
    ADMISSIBLE = "Admissible"
    CONSTRAINED = "Constrained"
    INADMISSIBLE = "Inadmissible"


@dataclass
class ContinuityVector:
    structural: float
    functional: float
    behavioral: float
    evidentiary: float
    temporal: float

    def average(self) -> float:
        return round(
            (
                self.structural
                + self.functional
                + self.behavioral
                + self.evidentiary
                + self.temporal
            )
            / 5,
            3,
        )


@dataclass
class RuntimeFixture:
    case_id: str
    title: str
    category: str
    bounded_system: Dict
    observables: Dict
    assertions: List[str]


@dataclass
class EvaluationResult:
    case_id: str
    title: str
    category: str
    evidence_sufficiency: float
    continuity: float
    degradation: float
    recoverability: float
    integrity_preservation_support: float
    integrity_state: str
    admissibility: str
    assertions_passed: bool

    def to_dict(self) -> Dict:
        return asdict(self)
