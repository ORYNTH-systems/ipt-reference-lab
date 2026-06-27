@{
    Proofs = @(
        @{
            File = "IPT-091_ipt_vs_uaa_boundary.json"
            BoundedSystem = @{
                id = "CB-091"
                name = "IPT vs UAA Boundary"
                boundary_rule = "IPT evaluates preservation integrity; UAA governs execution authority. Neither architecture substitutes for the other."
            }
            Properties = @(
                "constitutional_boundary",
                "architectural_separation",
                "non_substitutability"
            )
            Observables = @(
                "ipt_evaluation_scope",
                "uaa_execution_scope",
                "boundary_definition"
            )
            Evidence = @(
                "ipt_specification",
                "uaa_specification",
                "boundary_mapping"
            )
            Indicators = @(
                "boundary_preserved",
                "architectures_distinct",
                "scope_overlap_absent"
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
                "IPT scope is preservation",
                "UAA scope is execution governance",
                "architectural boundaries remain distinct"
            )
            Output = @{
                case_id = "IPT-091"
                result = "PASS"
                constitutional_boundary = "validated"
            }
            Metrics = @{
                constitutional_boundary_cases = 1
                preserved_states = 1
            }
        }
    )
}
