import json
from pathlib import Path

from models import IPTCase
from evaluator import IPTEvaluator


ROOT = Path(__file__).resolve().parent.parent
DEFINITIONS = ROOT / "src" / "case_definitions.json"


def load_cases():
    definitions = json.loads(DEFINITIONS.read_text(encoding="utf-8-sig"))
    cases = []

    for group in definitions:
        category = group["category"]
        for case_id, title in group["cases"]:
            cases.append(IPTCase(case_id=case_id, title=title, category=category))

    return cases


def run_all():
    evaluator = IPTEvaluator()
    return [evaluator.evaluate(case) for case in load_cases()]


def run_case(case_id: str):
    evaluator = IPTEvaluator()

    for case in load_cases():
        if case.case_id == case_id:
            return evaluator.evaluate(case)

    raise ValueError(f"Unknown case_id: {case_id}")
