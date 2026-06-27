param(
    [Parameter(Mandatory=$true)]
    [string]$DefinitionFile
)

function Set-IPTProof {
    param(
        [string]$File,
        [hashtable]$BoundedSystem,
        [array]$Properties,
        [array]$Observables,
        [array]$Evidence,
        [array]$Indicators,
        [hashtable]$Expected,
        [array]$Assertions,
        [hashtable]$Output,
        [hashtable]$Metrics
    )

    $path = ".\cases\$File"
    $json = Get-Content $path -Raw | ConvertFrom-Json

    $json.bounded_system = $BoundedSystem
    $json.preservation_properties = $Properties
    $json.observables = $Observables
    $json.evidence_set = $Evidence
    $json.derived_indicators = $Indicators
    $json.expected = $Expected
    $json.runtime_assertions = $Assertions
    $json.expected_json_output = $Output
    $json.expected_metrics_contribution = $Metrics

    $json | ConvertTo-Json -Depth 20 | Set-Content -Encoding UTF8 $path
}

$Domain = Import-PowerShellDataFile $DefinitionFile

foreach ($Proof in $Domain.Proofs) {
    Set-IPTProof @Proof
}
