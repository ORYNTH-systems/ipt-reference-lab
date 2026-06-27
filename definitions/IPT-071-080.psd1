@{
    Proofs = @(
        @{
            File = "IPT-071_declared_bounded_system.json"
            BoundedSystem = @{
                id = "IF-071"
                name = "Declared Bounded System"
                boundary_rule = "Implementations shall faithfully represent the declared constitutional bounded system."
            }
            Properties = @(
                "implementation_fidelity",
                "boundary_consistency",
                "representation_integrity"
            )
            Observables = @(
                "declared_boundary",
                "implemented_boundary",
                "implementation_version"
            )
            Evidence = @(
                "implementation_manifest",
                "boundary_specification",
                "version_record"
            )
            Indicators = @(
                "boundary_matches",
                "implementation_complete",
                "version_valid"
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
                "declared boundary exists",
                "implemented boundary matches declaration",
                "implementation version exists"
            )
            Output = @{
                case_id = "IPT-071"
                result = "PASS"
                implementation = "faithful"
            }
            Metrics = @{
                implementation_fidelity_cases = 1
                preserved_states = 1
            }
        }
    )
}
