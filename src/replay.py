import json
from pathlib import Path

from runtime import run_all, run_case

ROOT = Path(__file__).resolve().parent.parent
REPLAY_DIR = ROOT / "reports" / "replay"

REPLAY_DIR.mkdir(parents=True, exist_ok=True)


def replay_case(case_id):

    result = run_case(case_id)

    path = REPLAY_DIR / f"{case_id}.json"

    path.write_text(
        json.dumps(result.to_dict(), indent=4),
        encoding="utf-8"
    )

    print(f"Replayed {case_id}")


def replay_all():

    count = 0

    for result in run_all():

        path = REPLAY_DIR / f"{result.case_id}.json"

        path.write_text(
            json.dumps(result.to_dict(), indent=4),
            encoding="utf-8"
        )

        count += 1

    print(f"Generated {count} replay artifacts.")


if __name__ == "__main__":
    replay_all()
