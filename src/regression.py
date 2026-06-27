from runtime import run_all

EXPECTED_CASES = 100

def main():

    results = run_all()

    assert len(results) == EXPECTED_CASES, (
        f"Expected {EXPECTED_CASES} cases, found {len(results)}"
    )

    failed = []

    for result in results:

        if not result.assertions_passed:
            failed.append(result.case_id)

        if result.integrity_state == "":
            failed.append(result.case_id)

        if result.admissibility == "":
            failed.append(result.case_id)

    print()
    print("========================================")
    print(" IPT REGRESSION TEST")
    print("========================================")
    print(f"Cases Executed : {len(results)}")
    print(f"Failures       : {len(failed)}")

    if failed:
        print()
        print("FAILED CASES")
        for case in failed:
            print(case)
        raise SystemExit(1)

    print()
    print("STATUS : PASS")

if __name__ == "__main__":
    main()
