import argparse
import json

from runtime import run_all, run_case
from validator import validate
from replay import replay_all, replay_case
from metrics import generate


def print_result(result):
    print(json.dumps(result.to_dict(), indent=4))


def main():
    parser = argparse.ArgumentParser(
        description="Integrity Preservation Theory (IPT) Reference Runtime"
    )

    parser.add_argument("--all", action="store_true", help="Run all IPT cases")
    parser.add_argument("--case", type=str, help="Run a single IPT case, e.g. IPT-001")
    parser.add_argument("--validate", action="store_true", help="Run runtime validation")
    parser.add_argument("--replay", action="store_true", help="Generate replay artifacts")
    parser.add_argument("--metrics", action="store_true", help="Generate runtime metrics")

    args = parser.parse_args()

    if args.all:
        results = run_all()
        for result in results:
            print_result(result)
        print(f"Executed {len(results)} IPT cases.")
        return

    if args.case:
        print_result(run_case(args.case))
        return

    if args.validate:
        validate()
        return

    if args.replay:
        replay_all()
        return

    if args.metrics:
        generate()
        return

    parser.print_help()


if __name__ == "__main__":
    main()
