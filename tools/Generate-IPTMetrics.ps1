$cases = Get-ChildItem .\cases\IPT-*.json | Sort-Object Name

$total = $cases.Count
$domains = @{}
$states = @{}
$admissibility = @{}
$assertionCount = 0
$metricsObjects = 0
$expectedOutputs = 0

foreach ($case in $cases) {
    $json = Get-Content $case.FullName -Raw | ConvertFrom-Json

    if ($json.domain) {
        if (-not $domains.ContainsKey($json.domain)) { $domains[$json.domain] = 0 }
        $domains[$json.domain]++
    }

    $state = $json.expected.integrity_state
    if ($state) {
        if (-not $states.ContainsKey($state)) { $states[$state] = 0 }
        $states[$state]++
    }

    $adm = $json.expected.admissibility
    if ($adm) {
        if (-not $admissibility.ContainsKey($adm)) { $admissibility[$adm] = 0 }
        $admissibility[$adm]++
    }

    if ($json.runtime_assertions) {
        $assertionCount += $json.runtime_assertions.Count
    }

    if ($json.expected_metrics_contribution) {
        $metricsObjects++
    }

    if ($json.expected_json_output) {
        $expectedOutputs++
    }
}

Write-Host ""
Write-Host "========================================="
Write-Host "IPT Constitutional Corpus Metrics v1.0"
Write-Host "========================================="
Write-Host ""
Write-Host "Total Proofs:                 $total"
Write-Host "Runtime Assertions:           $assertionCount"
Write-Host "Expected Outputs Present:     $expectedOutputs / $total"
Write-Host "Metrics Objects Present:      $metricsObjects / $total"
Write-Host ""

Write-Host "Domains:"
foreach ($key in ($domains.Keys | Sort-Object)) {
    Write-Host ("  {0,-40} {1}" -f $key, $domains[$key])
}

Write-Host ""
Write-Host "Integrity States:"
foreach ($key in ($states.Keys | Sort-Object)) {
    Write-Host ("  {0,-30} {1}" -f $key, $states[$key])
}

Write-Host ""
Write-Host "Admissibility:"
foreach ($key in ($admissibility.Keys | Sort-Object)) {
    Write-Host ("  {0,-35} {1}" -f $key, $admissibility[$key])
}

Write-Host ""
Write-Host "Corpus Status:"
if ($total -eq 100 -and $expectedOutputs -eq 100 -and $metricsObjects -eq 100) {
    Write-Host "CONSTITUTIONALLY COMPLETE"
} else {
    Write-Host "INCOMPLETE"
}
