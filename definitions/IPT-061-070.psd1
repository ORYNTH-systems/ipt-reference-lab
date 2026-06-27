@{
    Proofs = @(
        @{
            File = "IPT-061_observable_acquisition.json"
            BoundedSystem = @{
                id = "MA-061"
                name = "Observable Acquisition"
                boundary_rule = "Only constitutionally admissible observables may enter preservation evaluation."
            }
            Properties = @(
                "observable_acquisition",
                "measurement_admissibility",
                "traceability"
            )
            Observables = @(
                "observable_registry",
                "source_identity",
                "collection_timestamp"
            )
            Evidence = @(
                "observable_log",
                "source_registry",
                "collection_record"
            )
            Indicators = @(
                "observable_acquired",
                "source_verified",
                "timestamp_valid"
            )
            Expected = @{
                evidence_sufficiency = "sufficient"
                continuity = "continuous"
                degradation = "none"
                recoverability = "not_required"
                integrity_state = "preserved"
                admissibility = "admissible"
            }
            Assertions = @(
                "observable exists",
                "source is verified",
                "timestamp is present"
            )
            Output = @{
                case_id = "IPT-061"
                result = "PASS"
                integrity_state = "preserved"
            }
            Metrics = @{
                observable_acquisition_cases = 1
                preserved_states = 1
            }
        }
    )
}
