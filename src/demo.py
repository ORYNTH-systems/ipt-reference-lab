from runtime import run_all

def main():

    results = run_all()

    print("=" * 70)
    print(" INTEGRITY PRESERVATION THEORY (IPT)")
    print(" Reference Runtime Demonstration")
    print("=" * 70)
    print()

    print(f"Total Cases: {len(results)}")
    print()

    state_counts = {}
    admissibility_counts = {}

    for r in results:

        state_counts[r.integrity_state] = state_counts.get(r.integrity_state,0)+1
        admissibility_counts[r.admissibility] = admissibility_counts.get(r.admissibility,0)+1

    print("Integrity States")
    print("----------------")

    for state,count in sorted(state_counts.items()):
        print(f"{state:25} {count}")

    print()

    print("Admissibility")
    print("-------------")

    for state,count in sorted(admissibility_counts.items()):
        print(f"{state:25} {count}")

    print()
    print("=" * 70)
    print("Runtime completed successfully.")
    print("=" * 70)

if __name__=="__main__":
    main()
