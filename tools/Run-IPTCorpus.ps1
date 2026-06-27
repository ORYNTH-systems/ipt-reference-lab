$cases = Get-ChildItem .\cases\IPT-*.json | Sort-Object Name

$total = 0
$passed = 0
$failed = 0
$failures = @()

$required = @(
    "case_id",
    "title",
    "domain",
    "bounded_system",
    "preservation_properties",
    "observables",
    "evidence_set",
    "derived_indicators",
    "expected",
    "runtime_assertions",
    "expected_json_output",
    "expected_metrics_contribution"
)

foreach ($case in $cases) {
    $total++
    $json = Get-Content $case.FullName -Raw | ConvertFrom-Json
    $casePass = $true
    $caseErrors = @()

    foreach ($field in $required) {
        if (-not ($json.PSObject.Properties.Name -contains $field)) {
            $casePass = $false
            $caseErrors += "Missing field: $field"
        }
    }

    if (-not $json.case_id) {
        $casePass = $false
        $caseErrors += "Missing case_id value"
    }

    if (-not $json.expected.integrity_state) {
        $casePass = $false
        $caseErrors += "Missing expected.integrity_state"
    }

    if (-not $json.expected.admissibility) {
        $casePass = $false
        $caseErrors += "Missing expected.admissibility"
    }

    if ($json.runtime_assertions.Count -eq 0) {
        $casePass = $false
        $caseErrors += "No runtime assertions declared"
    }

    if ($casePass) {
        $passed++
    } else {
        $failed++
        $failures += [ordered]@{
            case_id = $json.case_id
            file = $case.Name
            errors = $caseErrors
        }
    }
}

Write-Host ""
Write-Host "======================================"
Write-Host "IPT Constitutional Corpus v1.0"
Write-Host "======================================"
Write-Host ""
Write-Host "Cases Executed:        $total"
Write-Host "Passed:                $passed"
Write-Host "Failed:                $failed"
Write-Host ""

if ($failed -eq 0) {
    Write-Host "Corpus Status:"
    Write-Host "CONSTITUTIONALLY CONSISTENT"
} else {
    Write-Host "Corpus Status:"
    Write-Host "FAILURES DETECTED"
    $failures | ConvertTo-Json -Depth 10
}
