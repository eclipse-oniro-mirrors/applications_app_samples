# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Runs the Call ohosTest suites in batches.
# Full-suite runs keep the JS engine busy inside a single uv loop task for ~17s and trip
# the THREAD_BLOCK_3S/6S watchdog, so each suite is executed as its own aa test session.
param(
  [string]$BundleName = 'ohos.samples.call',
  [string]$ModuleName = 'entry_test',
  [string]$Runner = 'OpenHarmonyTestRunner',
  [int]$TimeoutMs = 120000,
  [string]$HdcPath = ''
)

$hdc = $HdcPath
if (-not $hdc) { $hdc = (Get-Command hdc.exe -ErrorAction SilentlyContinue).Source }
if (-not $hdc) {
  foreach ($candidate in @('E:\KSDK\26.0.0\toolchains\hdc.exe', 'E:\SDK\23\toolchains\hdc.exe')) {
    if (Test-Path $candidate) { $hdc = $candidate; break }
  }
}
if (-not $hdc) {
  Write-Host 'hdc.exe not found. Pass -HdcPath <path to hdc.exe>'
  exit 2
}
Write-Host ("Using hdc: " + $hdc)

$classes = @(  'ActsAbilityTest',
  'CallNumberFormatCoreTest',
  'CallEmergencyCoreTest',
  'CallTelephonyStateTest',
  'CallLoggerCoreTest',
  'CallPageUiTest',
  'CallInputUiTest',
  'CallDialFlowUiTest',
  'CallNumberFormatMatrixA',
  'CallNumberFormatMatrixB',
  'CallNumberFormatMatrixC',
  'CallPhonePlanMatrix',
  'CallDialValidateMatrix',
  'CallEmergencyMatrix',
  'CallStateTransitionMatrix',
  'CallDurationMatrix',
  'CallHistoryMatrix',
  'CallCapabilityMatrix',
  'CallStatisticsMatrixA',
  'CallStatisticsMatrixB',
  'CallEventLogMatrix',
  'CallBoundaryMatrix',
  'CallIntegrationMatrix'
)

$failed = @()
$index = 0
foreach ($class in $classes) {
  $index++
  Write-Host ("[{0}/{1}] {2}" -f $index, $classes.Count, $class)
  $out = & $hdc shell aa test -b $BundleName -m $ModuleName -s unittest $Runner -s class $class -s timeout $TimeoutMs 2>&1
  $fails = $out | Select-String -Pattern 'OHOS_REPORT_RESULT.*(failure|error)|\[fail\]' -CaseSensitive:$false
  if ($fails) {
    $failed += $class
    $fails | ForEach-Object { Write-Host ("    " + $_) }
  }
}

Write-Host ''
if ($failed.Count -eq 0) {
  Write-Host ("ALL {0} SUITES PASSED" -f $classes.Count)
} else {
  Write-Host ("FAILED SUITES: " + ($failed -join ', '))
  exit 1
}
