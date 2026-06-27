import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DEFINITIONS = ROOT / "src" / "case_definitions.json"
OUTPUT = ROOT / "src" / "fixtures" / "runtime_fixtures.json"

def profile(case_id, category):
    n = int(case_id.split("-")[1])

    evidence = 0.90
    continuity = {
        "structural": 0.86,
        "functional": 0.86,
        "behavioral": 0.86,
        "evidentiary": 0.86,
        "temporal": 0.86
    }
    degradation = 0.15
    recoverability = 0.70

    if category == "Evidence Sufficiency":
        evidence = 0.45 if n not in (11, 19) else 0.90
    elif category == "Continuity":
        continuity = {k: 0.50 for k in continuity}
    elif category == "Degradation":
        degradation = 0.65
    elif category == "Recoverability":
        recoverability = 0.45
    elif category == "Integrity State Architecture":
        evidence = 0.75
        degradation = 0.35
        recoverability = 0.60
    elif category == "Measurement Architecture":
        evidence = 0.70
        continuity["evidentiary"] = 0.60
    elif category == "Implementation Fidelity":
        evidence = 0.75
        continuity["structural"] = 0.70
    elif category == "Cross-Domain Validation":
        evidence = 0.80
        continuity = {k: 0.75 for k in continuity}
    elif category == "Constitutional Boundary Protection":
        evidence = 0.85
        degradation = 0.20

    terminal_cases = {"IPT-010", "IPT-020", "IPT-030", "IPT-040", "IPT-050", "IPT-080"}
    if case_id in terminal_cases:
        evidence = 0.25
        continuity = {k: 0.25 for k in continuity}
        degradation = 0.85
        recoverability = 0.20

    return {
        "evidence_sufficiency": evidence,
        "continuity": continuity,
        "degradation": degradation,
        "recoverability": recoverability
    }

def build():
    definitions = json.loads(DEFINITIONS.read_text(encoding="utf-8-sig"))
    fixtures = []

    for group in definitions:
        category = group["category"]
        for case_id, title in group["cases"]:
            fixtures.append({
                "case_id": case_id,
                "title": title,
                "category": category,
                "bounded_system": {
                    "declared": True,
                    "object": "bounded_evaluative_object"
                },
                "observables": profile(case_id, category),
                "assertions": [
                    "bounded_system_declared",
                    "evidence_separated_from_interpretation",
                    "evidence_sufficiency_constrains_evaluation",
                    "continuity_distinct_from_integrity",
                    "degradation_distinct_from_performance",
                    "recoverability_distinct_from_current_state",
                    "non_sovereign_output"
                ]
            })

    OUTPUT.write_text(json.dumps(fixtures, indent=4), encoding="utf-8")
    print(f"Wrote {len(fixtures)} runtime fixtures.")

if __name__ == "__main__":
    build()
