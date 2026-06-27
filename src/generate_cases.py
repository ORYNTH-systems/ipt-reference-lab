"""
Integrity Preservation Theory (IPT)
Reference Corpus Generator

This generator is the authoritative source for all
Markdown case files and JSON evidence templates.

Repository Version: 1.0
"""

from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent.parent

CASE_GROUPS = [
    ("IPT-001-010","Bounded System Definition"),
    ("IPT-011-020","Evidence Sufficiency"),
    ("IPT-021-030","Continuity"),
    ("IPT-031-040","Degradation"),
    ("IPT-041-050","Recoverability"),
    ("IPT-051-060","Integrity State Architecture"),
    ("IPT-061-070","Measurement Architecture"),
    ("IPT-071-080","Implementation Fidelity"),
    ("IPT-081-090","Cross-Domain Validation"),
    ("IPT-091-100","Constitutional Boundary Protection"),
]

CASE_TITLES = {
1:"Constitutional Bounded System Definition",
2:"Evaluative Object Delimitation",
3:"Boundary Ambiguity Resolution",
4:"External Dependency Separation",
5:"Nested Bounded Systems",
6:"Multi-System Boundary Isolation",
7:"Dynamic Boundary Evolution",
8:"Component Membership Validation",
9:"Boundary Drift Detection",
10:"Invalid Evaluative Object",
}

SCHEMA_VERSION="1.0"

def case_title(case_number):
    return CASE_TITLES.get(case_number,f"Reserved Case {case_number:03}")

def build_markdown(case_id,title,category):

    return f"""# {case_id}

## Title

{title}

## Category

{category}

## Constitutional Objective

Preservation-oriented integrity evaluation.

## Bounded System

TBD by runtime.

## Evaluation Scope

TBD.

## Protected Preservation Properties

TBD.

## Input Observables

TBD.

## Evidence Set

TBD.

## Derived Indicators

TBD.

## Evidence Sufficiency

TBD.

## Expected Continuity

TBD.

## Expected Degradation

TBD.

## Expected Recoverability

TBD.

## Expected Integrity Preservation Support

TBD.

## Expected Integrity State

TBD.

## Expected Admissibility

TBD.

## Runtime Assertions

TBD.

## Expected JSON Output

Generated from matching JSON artifact.

## Expected Metrics Contribution

Automatically collected.

Schema Version

{SCHEMA_VERSION}
"""

def build_json(case_id,title,category):

    return {
        "schema_version":SCHEMA_VERSION,
        "case_id":case_id,
        "title":title,
        "category":category,
        "bounded_system":None,
        "observables":[],
        "evidence":[],
        "derived_indicators":[],
        "evidence_sufficiency":None,
        "continuity":None,
        "degradation":None,
        "recoverability":None,
        "integrity_preservation_support":None,
        "integrity_state":None,
        "admissibility":None,
        "runtime_assertions":[],
        "metrics":[]
    }

case_number=1

for folder,category in CASE_GROUPS:

    md_dir=ROOT/"cases"/folder
    json_dir=ROOT/"reports"/"json"/folder

    json_dir.mkdir(parents=True,exist_ok=True)

    for _ in range(10):

        case_id=f"IPT-{case_number:03}"
        title=case_title(case_number)

        (md_dir/f"{case_id}.md").write_text(
            build_markdown(case_id,title,category),
            encoding="utf-8"
        )

        (json_dir/f"{case_id}.json").write_text(
            json.dumps(build_json(case_id,title,category),indent=4),
            encoding="utf-8"
        )

        case_number+=1

print("Generated 100 IPT markdown cases.")
print("Generated 100 IPT JSON templates.")
