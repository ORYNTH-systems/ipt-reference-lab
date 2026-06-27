from dataclasses import dataclass, asdict
from enum import Enum
from typing import Dict, List, Optional


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
class IPTCase:
    case_id: str
    title: str
    category: str


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
