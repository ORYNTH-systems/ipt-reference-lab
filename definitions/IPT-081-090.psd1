@{
    Proofs = @(
        @{
            File = "IPT-081_healthcare_preservation.json"
            BoundedSystem = @{
                id = "CD-081"
                name = "Healthcare Preservation"
                boundary_rule = "Healthcare implementations shall preserve constitutional integrity independent of domain-specific workflows."
            }
            Properties = @(
                "cross_domain_invariance",
                "healthcare_preservation",
                "constitutional_consistency"
            )
            Observables = @(
                "clinical_state",
                "preservation_state",
                "evaluation_trace"
            )
            Evidence = @(
                "clinical_record",
                "preservation_evidence",
                "runtime_log"
            )
            Indicators = @(
                "constitutional_rules_preserved",
                "domain_specific_data_present",
                "evaluation_admissible"
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
                "constitutional rules are unchanged",
                "healthcare data remains domain-specific",
                "evaluation remains admissible"
            )
            Output = @{
                case_id = "IPT-081"
                result = "PASS"
                domain = "healthcare"
            }
            Metrics = @{
                healthcare_validation_cases = 1
                cross_domain_cases = 1
            }
        }
    )
}
