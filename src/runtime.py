import json
from pathlib import Path

from evaluator import IPTEvaluator
from models import RuntimeFixture


ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "src" / "fixtures" / "runtime_fixtures.json"


def load_fixtures():
    raw = json.loads(FIXTURES.read_text(encoding="utf-8-sig"))
    return [
        RuntimeFixture(
            case_id=item["case_id"],
            title=item["title"],
            category=item["category"],
            bounded_system=item["bounded_system"],
            observables=item["observables"],
            assertions=item["assertions"],
        )
        for item in raw
    ]


def run_all():
    evaluator = IPTEvaluator()
    return [evaluator.evaluate(fixture) for fixture in load_fixtures()]


def run_case(case_id: str):
    evaluator = IPTEvaluator()

    for fixture in load_fixtures():
        if fixture.case_id == case_id:
            return evaluator.evaluate(fixture)

    raise ValueError(f"Unknown case_id: {case_id}")
