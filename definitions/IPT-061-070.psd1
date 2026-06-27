@{
    Proofs = @(
        @{
            File = "IPT-061_observable_acquisition.json"
            BoundedSystem = @{ id = "MA-061"; name = "Observable Acquisition"; boundary_rule = "Only constitutionally admissible observables may enter preservation evaluation." }
            Properties = @("observable_acquisition","measurement_admissibility","traceability")
            Observables = @("observable_registry","source_identity","collection_timestamp")
            Evidence = @("observable_log","source_registry","collection_record")
            Indicators = @("observable_acquired","source_verified","timestamp_valid")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("observable exists","source is verified","timestamp is present")
            Output = @{ case_id = "IPT-061"; result = "PASS"; integrity_state = "preserved" }
            Metrics = @{ observable_acquisition_cases = 1; preserved_states = 1 }
        },
        @{
            File = "IPT-062_derived_indicator_mapping.json"
            BoundedSystem = @{ id = "MA-062"; name = "Derived Indicator Mapping"; boundary_rule = "Derived indicators must be traceable to declared observables." }
            Properties = @("indicator_traceability","observable_to_indicator_mapping","derivation_validity")
            Observables = @("raw_observable","mapping_rule","derived_indicator")
            Evidence = @("observable_record","mapping_specification","derivation_log")
            Indicators = @("mapping_exists","indicator_traceable","derivation_valid")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("mapping rule exists","derived indicator references observables","indicator is traceable")
            Output = @{ case_id = "IPT-062"; result = "PASS"; mapping = "valid" }
            Metrics = @{ derived_indicator_mapping_cases = 1; admissible_evaluations = 1 }
        },
        @{
            File = "IPT-063_interpretation_separation.json"
            BoundedSystem = @{ id = "MA-063"; name = "Interpretation Separation"; boundary_rule = "Measurement acquisition must remain separate from interpretation and judgment." }
            Properties = @("measurement_interpretation_separation","non_conflation","evaluation_control")
            Observables = @("measurement_value","interpretation_rule","judgment_output")
            Evidence = @("measurement_record","interpretation_policy","evaluation_trace")
            Indicators = @("measurement_recorded_separately","interpretation_rule_declared","judgment_not_embedded_in_measurement")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("measurement exists before interpretation","interpretation rule is separate","judgment is not substituted for observable")
            Output = @{ case_id = "IPT-063"; result = "PASS"; separation = "valid" }
            Metrics = @{ interpretation_separation_cases = 1; preserved_states = 1 }
        },
        @{
            File = "IPT-064_measurement_normalization.json"
            BoundedSystem = @{ id = "MA-064"; name = "Measurement Normalization"; boundary_rule = "Normalization must preserve measurement meaning while enabling comparison." }
            Properties = @("normalization_validity","scale_consistency","meaning_preservation")
            Observables = @("raw_measurement","normalization_rule","normalized_measurement")
            Evidence = @("raw_measurement_record","normalization_specification","normalized_output")
            Indicators = @("normalization_applied","scale_consistent","meaning_preserved")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("raw measurement exists","normalization rule exists","normalized value preserves declared meaning")
            Output = @{ case_id = "IPT-064"; result = "PASS"; normalization = "valid" }
            Metrics = @{ measurement_normalization_cases = 1; admissible_evaluations = 1 }
        },
        @{
            File = "IPT-065_observable_drift.json"
            BoundedSystem = @{ id = "MA-065"; name = "Observable Drift"; boundary_rule = "Observable drift must be detected before derived integrity claims are made." }
            Properties = @("observable_drift_detection","measurement_stability","drift_classification")
            Observables = @("baseline_observable","current_observable","drift_delta")
            Evidence = @("baseline_measurement_record","current_measurement_record","drift_analysis")
            Indicators = @("observable_drift_detected","drift_delta_computed","measurement_stability_reduced")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "drifting"; degradation = "progressive"; recoverability = "recoverable"; integrity_state = "drifting"; admissibility = "conditionally_admissible" }
            Assertions = @("baseline observable exists","current observable exists","drift delta is computed")
            Output = @{ case_id = "IPT-065"; result = "PASS"; observable_drift = "detected"; integrity_state = "drifting" }
            Metrics = @{ observable_drift_cases = 1; drifting_states = 1 }
        },
        @{
            File = "IPT-066_measurement_noise.json"
            BoundedSystem = @{ id = "MA-066"; name = "Measurement Noise"; boundary_rule = "Measurement noise must be classified so noise is not mistaken for degradation." }
            Properties = @("noise_detection","signal_noise_separation","measurement_uncertainty")
            Observables = @("measurement_series","noise_estimate","signal_estimate")
            Evidence = @("measurement_log","noise_model","uncertainty_report")
            Indicators = @("noise_detected","signal_separated","judgment_adjusted_for_uncertainty")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "stressed"; admissibility = "conditionally_admissible" }
            Assertions = @("measurement series exists","noise estimate exists","noise is not classified as degradation")
            Output = @{ case_id = "IPT-066"; result = "PASS"; measurement_noise = "classified"; integrity_state = "stressed" }
            Metrics = @{ measurement_noise_cases = 1; stressed_states = 1 }
        },
        @{
            File = "IPT-067_measurement_bias_detection.json"
            BoundedSystem = @{ id = "MA-067"; name = "Measurement Bias Detection"; boundary_rule = "Measurement bias must be detected when systematic distortion affects preservation evaluation." }
            Properties = @("bias_detection","systematic_distortion_control","measurement_fairness")
            Observables = @("measurement_distribution","reference_distribution","bias_delta")
            Evidence = @("measurement_sample","reference_baseline","bias_report")
            Indicators = @("bias_detected","systematic_distortion_present","measurement_adjustment_required")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "stressed"; degradation = "measurement_bias"; recoverability = "recoverable"; integrity_state = "stressed"; admissibility = "conditionally_admissible" }
            Assertions = @("reference baseline exists","bias delta is computed","bias is classified separately from system degradation")
            Output = @{ case_id = "IPT-067"; result = "PASS"; measurement_bias = "detected"; admissibility = "conditionally_admissible" }
            Metrics = @{ measurement_bias_cases = 1; conditional_admissibility = 1 }
        },
        @{
            File = "IPT-068_admissible_transformation.json"
            BoundedSystem = @{ id = "MA-068"; name = "Admissible Transformation"; boundary_rule = "Measurement transformations are admissible only when traceable, declared, and meaning-preserving." }
            Properties = @("transformation_admissibility","traceability","semantic_preservation")
            Observables = @("input_measurement","transformation_rule","output_measurement")
            Evidence = @("transformation_specification","input_record","output_record")
            Indicators = @("transformation_declared","transformation_traceable","meaning_preserved")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("transformation rule exists","input and output are traceable","semantic meaning is preserved")
            Output = @{ case_id = "IPT-068"; result = "PASS"; transformation = "admissible" }
            Metrics = @{ admissible_transformation_cases = 1; preserved_states = 1 }
        },
        @{
            File = "IPT-069_invalid_measurement_chain.json"
            BoundedSystem = @{ id = "MA-069"; name = "Invalid Measurement Chain"; boundary_rule = "Invalid measurement chains cannot support preservation evaluation." }
            Properties = @("measurement_chain_validation","invalid_chain_rejection","evaluation_admissibility_control")
            Observables = @("measurement_chain","missing_link","invalid_derivation")
            Evidence = @("chain_record","gap_report","derivation_failure")
            Indicators = @("chain_invalid","traceability_failed","evaluation_blocked")
            Expected = @{ evidence_sufficiency = "insufficient"; continuity = "indeterminate"; degradation = "indeterminate"; recoverability = "indeterminate"; integrity_state = "indeterminate"; admissibility = "inadmissible" }
            Assertions = @("invalid chain is detected","traceability failure is recorded","admissibility equals inadmissible")
            Output = @{ case_id = "IPT-069"; result = "PASS"; measurement_chain = "invalid"; admissibility = "inadmissible" }
            Metrics = @{ invalid_measurement_chain_cases = 1; inadmissible_evaluations = 1 }
        },
        @{
            File = "IPT-070_measurement_integrity_validation.json"
            BoundedSystem = @{ id = "MA-070"; name = "Measurement Integrity Validation"; boundary_rule = "Measurement integrity must be validated before measurement-derived preservation judgments are admissible." }
            Properties = @("measurement_integrity","chain_traceability","validation_control")
            Observables = @("measurement_source","measurement_chain","validation_result")
            Evidence = @("source_record","measurement_chain_record","validation_report")
            Indicators = @("source_valid","chain_valid","measurement_integrity_validated")
            Expected = @{ evidence_sufficiency = "sufficient"; continuity = "continuous"; degradation = "none"; recoverability = "not_required"; integrity_state = "preserved"; admissibility = "admissible" }
            Assertions = @("measurement source is valid","measurement chain is valid","measurement integrity is validated")
            Output = @{ case_id = "IPT-070"; result = "PASS"; measurement_integrity = "validated"; admissibility = "admissible" }
            Metrics = @{ measurement_integrity_validation_cases = 1; admissible_evaluations = 1 }
        }
    )
}
