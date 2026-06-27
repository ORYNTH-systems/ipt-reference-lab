@{
    Proofs = @(
        @{
            File = "IPT-081_healthcare_preservation.json"
            BoundedSystem = @{ id = "CD-081"; name = "Healthcare Preservation"; boundary_rule = "Healthcare implementations shall preserve constitutional integrity independent of domain-specific workflows." }
            Properties = @("cross_domain_invariance","healthcare_preservation","constitutional_consistency")
            Observables = @("clinical_state","preservation_state","evaluation_trace")
            Evidence = @("clinical_record","preservation_evidence","runtime_log")
            Indicators = @("constitutional_rules_preserved","domain_specific_data_present","evaluation_admissible")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("constitutional rules are unchanged","healthcare data remains domain-specific","evaluation remains admissible")
            Output = @{ case_id = "IPT-081"; result = "PASS"; domain = "healthcare" }
            Metrics = @{ healthcare_validation_cases = 1; cross_domain_cases = 1 }
        },
        @{
            File = "IPT-082_agentic_ai_preservation.json"
            BoundedSystem = @{ id = "CD-082"; name = "Agentic AI Preservation"; boundary_rule = "Agentic AI implementations shall preserve IPT evaluation independently from agent task execution." }
            Properties = @("agentic_ai_preservation","cross_domain_invariance","evaluation_execution_separation")
            Observables = @("agent_state","task_context","preservation_trace")
            Evidence = @("agent_runtime_log","task_record","integrity_evaluation_record")
            Indicators = @("agent_domain_mapped","preservation_rules_unchanged","execution_not_substituted_for_preservation")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("agentic AI domain is mapped","IPT rules remain unchanged","task success is not treated as preservation")
            Output = @{ case_id = "IPT-082"; result = "PASS"; domain = "agentic_ai" }
            Metrics = @{ agentic_ai_validation_cases = 1; cross_domain_cases = 1 }
        },
        @{
            File = "IPT-083_financial_system_preservation.json"
            BoundedSystem = @{ id = "CD-083"; name = "Financial System Preservation"; boundary_rule = "Financial systems shall map domain events to IPT preservation states without redefining constitutional integrity." }
            Properties = @("financial_system_preservation","transaction_state_mapping","constitutional_consistency")
            Observables = @("ledger_state","settlement_status","preservation_state")
            Evidence = @("ledger_record","settlement_log","evaluation_trace")
            Indicators = @("financial_domain_mapped","state_mapping_valid","integrity_rules_preserved")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("financial event is domain-specific","IPT integrity state remains constitutional","mapping is traceable")
            Output = @{ case_id = "IPT-083"; result = "PASS"; domain = "financial_system" }
            Metrics = @{ financial_validation_cases = 1; cross_domain_cases = 1 }
        },
        @{
            File = "IPT-084_infrastructure_preservation.json"
            BoundedSystem = @{ id = "CD-084"; name = "Infrastructure Preservation"; boundary_rule = "Infrastructure systems shall support IPT preservation evaluation across physical or operational dependencies." }
            Properties = @("infrastructure_preservation","dependency_mapping","operational_continuity")
            Observables = @("asset_state","dependency_state","operational_status")
            Evidence = @("asset_registry","dependency_map","operations_log")
            Indicators = @("infrastructure_domain_mapped","dependencies_traceable","operational_continuity_preserved")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "external_dependency"; recoverability = "recoverable_if_dependency_restored"; integrity_state = "stressed"; admissibility = "conditionally_admissible" }
            Assertions = @("infrastructure dependencies are mapped","external dependency effects are separated","integrity state is not overclaimed")
            Output = @{ case_id = "IPT-084"; result = "PASS"; domain = "infrastructure"; integrity_state = "stressed" }
            Metrics = @{ infrastructure_validation_cases = 1; stressed_states = 1 }
        },
        @{
            File = "IPT-085_supply_chain_preservation.json"
            BoundedSystem = @{ id = "CD-085"; name = "Supply Chain Preservation"; boundary_rule = "Supply chain preservation shall distinguish internal bounded-system integrity from external supplier degradation." }
            Properties = @("supply_chain_preservation","dependency_separation","cross_boundary_integrity")
            Observables = @("supplier_state","internal_inventory_state","dependency_effect")
            Evidence = @("supplier_record","inventory_log","dependency_effect_report")
            Indicators = @("supplier_dependency_mapped","internal_external_separated","preservation_effect_classified")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "external_dependency"; recoverability = "recoverable_if_dependency_restored"; integrity_state = "stressed"; admissibility = "conditionally_admissible" }
            Assertions = @("supplier is classified as external dependency","internal system is evaluated separately","dependency effect is classified")
            Output = @{ case_id = "IPT-085"; result = "PASS"; domain = "supply_chain"; integrity_state = "stressed" }
            Metrics = @{ supply_chain_validation_cases = 1; stressed_states = 1 }
        },
        @{
            File = "IPT-086_digital_identity_preservation.json"
            BoundedSystem = @{ id = "CD-086"; name = "Digital Identity Preservation"; boundary_rule = "Digital identity preservation shall evaluate continuity without equating credential validity with identity integrity." }
            Properties = @("digital_identity_preservation","credential_identity_separation","continuity_validation")
            Observables = @("identity_record","credential_status","continuity_trace")
            Evidence = @("identity_registry","credential_log","continuity_validation_record")
            Indicators = @("identity_continuity_traceable","credential_not_substituted_for_identity","preservation_admissible")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("identity record exists","credential status is separated from identity continuity","continuity is evidence-supported")
            Output = @{ case_id = "IPT-086"; result = "PASS"; domain = "digital_identity" }
            Metrics = @{ digital_identity_validation_cases = 1; preserved_states = 1 }
        },
        @{
            File = "IPT-087_autonomous_vehicle_preservation.json"
            BoundedSystem = @{ id = "CD-087"; name = "Autonomous Vehicle Preservation"; boundary_rule = "Autonomous vehicle preservation shall evaluate system integrity separately from route completion or task success." }
            Properties = @("autonomous_vehicle_preservation","task_preservation_separation","runtime_integrity")
            Observables = @("vehicle_state","sensor_integrity","route_execution_status")
            Evidence = @("vehicle_runtime_log","sensor_validation","route_record")
            Indicators = @("vehicle_domain_mapped","sensor_integrity_validated","route_success_not_substituted_for_preservation")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("vehicle system is bounded","sensor integrity is validated","route completion is not treated as integrity preservation")
            Output = @{ case_id = "IPT-087"; result = "PASS"; domain = "autonomous_vehicle" }
            Metrics = @{ autonomous_vehicle_validation_cases = 1; preserved_states = 1 }
        },
        @{
            File = "IPT-088_robotic_system_preservation.json"
            BoundedSystem = @{ id = "CD-088"; name = "Robotic System Preservation"; boundary_rule = "Robotic system preservation shall evaluate embodiment, control, and evidence continuity as distinct preservation dimensions." }
            Properties = @("robotic_system_preservation","embodiment_continuity","control_integrity")
            Observables = @("embodiment_state","control_state","sensor_evidence")
            Evidence = @("robot_runtime_log","control_trace","sensor_record")
            Indicators = @("embodiment_continuous","control_integrity_preserved","evidence_continuity_valid")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("embodiment state is evaluated","control state is evaluated","evidence continuity is validated")
            Output = @{ case_id = "IPT-088"; result = "PASS"; domain = "robotic_system" }
            Metrics = @{ robotic_system_validation_cases = 1; preserved_states = 1 }
        },
        @{
            File = "IPT-089_distributed_network_preservation.json"
            BoundedSystem = @{ id = "CD-089"; name = "Distributed Network Preservation"; boundary_rule = "Distributed network preservation shall evaluate network continuity without collapsing node-level and system-level integrity." }
            Properties = @("distributed_network_preservation","node_system_separation","network_continuity")
            Observables = @("node_state","network_topology","system_integrity_state")
            Evidence = @("node_registry","topology_record","network_integrity_trace")
            Indicators = @("node_states_mapped","system_level_continuity_evaluated","node_failure_not_overgeneralized")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "partially_continuous"; degradation = "localized"; recoverability = "recoverable"; integrity_state = "stressed"; admissibility = "conditionally_admissible" }
            Assertions = @("node-level state is separated from network-level state","localized node failure is not treated as total collapse","network continuity is classified")
            Output = @{ case_id = "IPT-089"; result = "PASS"; domain = "distributed_network"; integrity_state = "stressed" }
            Metrics = @{ distributed_network_validation_cases = 1; stressed_states = 1 }
        },
        @{
            File = "IPT-090_cross_domain_invariance_validation.json"
            BoundedSystem = @{ id = "CD-090"; name = "Cross-Domain Invariance Validation"; boundary_rule = "IPT constitutional rules shall remain invariant across domain mappings." }
            Properties = @("cross_domain_invariance","constitutional_rule_stability","domain_independence")
            Observables = @("domain_mapping_set","constitutional_rule_set","invariance_result")
            Evidence = @("domain_case_matrix","rule_comparison","invariance_report")
            Indicators = @("rules_unchanged_across_domains","domain_terms_mapped_without_redefinition","invariance_validated")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("constitutional rules are stable across domains","domain-specific terms do not redefine IPT","cross-domain invariance is validated")
            Output = @{ case_id = "IPT-090"; result = "PASS"; cross_domain_invariance = "validated" }
            Metrics = @{ cross_domain_invariance_cases = 1; preserved_states = 1 }
        }
    )
}
