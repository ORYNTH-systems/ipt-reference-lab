"""
Integrity Preservation Theory (IPT)
Canonical Corpus Compiler

case_definitions.json is the single source of truth.
This compiler generates:
- Markdown case files
- JSON evidence templates

Repository Version: 1.0
"""

from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent.parent
DEFINITIONS_PATH = ROOT / "src" / "case_definitions.json"
SCHEMA_VERSION = "1.0"

def load_definitions():
    return json.loads(DEFINITIONS_PATH.read_text(encoding="utf-8-sig"))

def markdown_for(case_id, title, category):
    return f"""# {case_id} — {title}

## Category

{category}

## Constitutional Objective

Evaluate whether the bounded system remains sufficiently preserved to support an admissible integrity judgment.

## Bounded System

Runtime-declared bounded evaluative object.

## Evaluation Scope

Preservation-oriented integrity evaluation under declared observables, evidence sufficiency, continuity, degradation, recoverability, and admissibility constraints.

## Protected Preservation Properties

- Bounded object identity
- Evidence separation
- Continuity distinction
- Degradation distinction
- Recoverability distinction
- Evidence sufficiency
- Non-sovereign evaluation

## Input Observables

Defined in the matching JSON evidence artifact.

## Evidence Set

Defined in the matching JSON evidence artifact.

## Derived Indicators

Defined in the matching JSON evidence artifact.

## Evidence Sufficiency

Computed by runtime.

## Expected Continuity

Computed by runtime.

## Expected Degradation

Computed by runtime.

## Expected Recoverability

Computed by runtime.

## Expected Integrity Preservation Support

Computed by runtime.

## Expected Integrity State

Computed by runtime.

## Expected Admissibility

Computed by runtime.

## Runtime Assertions

The runtime shall preserve boundedness, evidence separation, admissibility constraint, continuity distinction, degradation distinction, recoverability distinction, and non-sovereignty.

## Expected JSON Output

Generated from reports/json/{case_id}.json.

## Expected Metrics Contribution

This case contributes to category coverage, admissibility coverage, integrity-state coverage, and replay validation.

## Implementation Notes

This case is generated from src/case_definitions.json by src/generate_cases.py.

## Repository References

- doctrine/IPT_DOCTRINE.md
- doctrine/CONSTITUTIONAL_INVARIANTS.md
- doctrine/EVALUATION_AXIOMS.md
- spec/IPT_REFERENCE_SPEC.md
- cases/EXECUTABLE_CASE_SPECIFICATION.md

Schema Version: {SCHEMA_VERSION}
"""

def json_for(case_id, title, category):
    return {
        "schema_version": SCHEMA_VERSION,
        "case_id": case_id,
        "title": title,
        "category": category,
        "bounded_system": {
            "declared": True,
            "object": "runtime_declared_bounded_system"
        },
        "observables": [],
        "evidence": [],
        "derived_indicators": [],
        "evidence_sufficiency": {
            "score": None,
            "status": "runtime_computed"
        },
        "continuity": {
            "structural": None,
            "functional": None,
            "behavioral": None,
            "evidentiary": None,
            "temporal": None,
            "status": "runtime_computed"
        },
        "degradation": {
            "score": None,
            "status": "runtime_computed"
        },
        "recoverability": {
            "score": None,
            "status": "runtime_computed"
        },
        "integrity_preservation_support": {
            "score": None,
            "status": "runtime_computed"
        },
        "integrity_state": "runtime_computed",
        "admissibility": "runtime_computed",
        "runtime_assertions": [
            "bounded_system_declared",
            "evidence_separated_from_interpretation",
            "evidence_sufficiency_constrains_evaluation",
            "continuity_distinct_from_integrity",
            "degradation_distinct_from_performance",
            "recoverability_distinct_from_current_state",
            "non_sovereign_output"
        ],
        "metrics": [
            "case_count",
            "category_coverage",
            "admissibility_coverage",
            "integrity_state_coverage",
            "runtime_replay_coverage"
        ]
    }

def compile_cases():
    definitions = load_definitions()
    total = 0

    for group in definitions:
        folder = group["range"]
        category = group["category"]
        md_dir = ROOT / "cases" / folder
        json_dir = ROOT / "reports" / "json" / folder
        md_dir.mkdir(parents=True, exist_ok=True)
        json_dir.mkdir(parents=True, exist_ok=True)

        for case_id, title in group["cases"]:
            (md_dir / f"{case_id}.md").write_text(
                markdown_for(case_id, title, category),
                encoding="utf-8"
            )
            (json_dir / f"{case_id}.json").write_text(
                json.dumps(json_for(case_id, title, category), indent=4),
                encoding="utf-8"
            )
            total += 1

    print(f"Compiled {total} IPT cases from canonical definitions.")

if __name__ == "__main__":
    compile_cases()
