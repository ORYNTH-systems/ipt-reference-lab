from assertions import ASSERTION_FUNCTIONS
from runtime import load_fixtures

def validate():

    fixtures = load_fixtures()

    total_cases = len(fixtures)
    total_assertions = 0
    passed = 0
    failed = 0

    failures = []

    for fixture in fixtures:

        for assertion in ASSERTION_FUNCTIONS:

            total_assertions += 1

            try:
                result = assertion(fixture)
            except Exception:
                result = False

            if result:
                passed += 1
            else:
                failed += 1
                failures.append(
                    {
                        "case": fixture.case_id,
                        "assertion": assertion.__name__
                    }
                )

    print()
    print("========================================")
    print(" IPT Runtime Validation")
    print("========================================")
    print(f"Total Cases:         {total_cases}")
    print(f"Assertions:          {total_assertions}")
    print(f"Passed:              {passed}")
    print(f"Failed:              {failed}")
    print()

    if failed == 0:
        print("Repository Conformance: PASS")
    else:
        print("Repository Conformance: FAIL")
        print()

        for failure in failures:
            print(failure)

if __name__ == "__main__":
    validate()
