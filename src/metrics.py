import json
from pathlib import Path

from runtime import run_all

ROOT = Path(__file__).resolve().parent.parent
REPORTS = ROOT / "reports"

REPORTS.mkdir(parents=True, exist_ok=True)

def generate():

    results = run_all()

    state_counts = {}
    admissibility_counts = {}

    total_support = 0.0
    total_evidence = 0.0
    total_continuity = 0.0
    total_degradation = 0.0
    total_recoverability = 0.0

    for r in results:

        state_counts[r.integrity_state] = state_counts.get(r.integrity_state,0)+1
        admissibility_counts[r.admissibility] = admissibility_counts.get(r.admissibility,0)+1

        total_support += r.integrity_preservation_support
        total_evidence += r.evidence_sufficiency
        total_continuity += r.continuity
        total_degradation += r.degradation
        total_recoverability += r.recoverability

    n = len(results)

    metrics = {
        "repository":"IPT Reference Lab",
        "version":"0.1",
        "total_cases":n,
        "average_support":round(total_support/n,3),
        "average_evidence":round(total_evidence/n,3),
        "average_continuity":round(total_continuity/n,3),
        "average_degradation":round(total_degradation/n,3),
        "average_recoverability":round(total_recoverability/n,3),
        "integrity_states":state_counts,
        "admissibility":admissibility_counts
    }

    (REPORTS/"metrics.json").write_text(
        json.dumps(metrics,indent=4),
        encoding="utf-8"
    )

    md = []

    md.append("# IPT Runtime Metrics")
    md.append("")
    md.append(f"Repository Version: {metrics['version']}")
    md.append("")
    md.append(f"Total Cases: {metrics['total_cases']}")
    md.append("")
    md.append(f"Average Integrity Preservation Support: {metrics['average_support']}")
    md.append(f"Average Evidence Sufficiency: {metrics['average_evidence']}")
    md.append(f"Average Continuity: {metrics['average_continuity']}")
    md.append(f"Average Degradation: {metrics['average_degradation']}")
    md.append(f"Average Recoverability: {metrics['average_recoverability']}")
    md.append("")
    md.append("## Integrity States")
    md.append("")

    for k,v in sorted(state_counts.items()):
        md.append(f"- {k}: {v}")

    md.append("")
    md.append("## Admissibility")
    md.append("")

    for k,v in sorted(admissibility_counts.items()):
        md.append(f"- {k}: {v}")

    (REPORTS/"METRICS.md").write_text(
        "\n".join(md),
        encoding="utf-8"
    )

    evidence=[]

    for r in results:
        evidence.append(r.to_dict())

    (REPORTS/"EVIDENCE_LIBRARY.json").write_text(
        json.dumps(evidence,indent=4),
        encoding="utf-8"
    )

    print(f"Generated metrics for {n} cases.")

if __name__=="__main__":
    generate()
