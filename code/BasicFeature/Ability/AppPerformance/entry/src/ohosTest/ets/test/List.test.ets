import { afterAll, beforeEachIt } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { fileIo } from '@kit.CoreFileKit';
import coreTests from './Core.test';
import reactiveUiTests from './ReactiveUi.test';
import additionalTests from './Additional.test';
import targetDiscoveryTests from './TargetDiscovery.test';
import maintenanceFlowTests from './MaintenanceFlow.test';
import planMatrixTests from './PlanMatrix.test';
import performanceRuleCasesTests from './PerformanceRuleCases.test';
import faultThresholdCasesTests from './FaultThresholdCases.test';
import experimentTests from './Experiment.test';
import thresholdGateMatrixCasesTests from './ThresholdGateMatrixCases.test';
import loadFaultWorkloadCasesTests from './LoadFaultWorkloadCases.test';
import launchBudgetCasesTests from './LaunchBudgetCases.test';

import reportCasesTests from './ReportCases.test';
import templateCoreCasesTests from './TemplateCoreCases.test';
import templateRunnerCasesTests from './TemplateRunnerCases.test';
import workloadCatalogMatrixTests from './WorkloadCatalogMatrix.test';
import reportDeliveryB2Tests from './ReportDeliveryB2.test';
import performanceExecutorWaveOneTests from './PerformanceExecutorWaveOne.test';
import performanceRestoreWaveOneTests from './PerformanceRestoreWaveOne.test';
import performanceGroupingWaveOneTests from './PerformanceGroupingWaveOne.test';
import performanceServiceWaveOneTests from './PerformanceServiceWaveOne.test';
import performanceConditionWaveTwoTests from './PerformanceConditionWaveTwo.test';
import performanceExportWaveTwoTests from './PerformanceExportWaveTwo.test';
import performanceInputWaveTwoTests from './PerformanceInputWaveTwo.test';
import performanceThresholdWaveTwoTests from './PerformanceThresholdWaveTwo.test';
import seriesUiQaTests from './SeriesUiQa.test';
import seriesOwnershipFeatureTests from './SeriesOwnershipFeature.test';
import seriesPersistenceFeatureTests from './SeriesPersistenceFeature.test';
import seriesStateFeatureTests from './SeriesStateFeature.test';
import seriesNativeQaTests from './SeriesNativeQa.test';
import { CaseResult, caseResults, CASE_TIMEOUT_MS, RUNNER_TIMEOUT_MS } from '../support/BoundedCase';

interface TestReport {
  caseTimeoutMs: number;
  runnerTimeoutMs: number;
  total: number;
  passed: number;
  failed: number;
  cases: CaseResult[];
}

export default function testsuite(): void {
  // Keep this entry a flat registration list for DevEco's static test discovery.
  registerEventLoopYield();
  coreTests();
  reactiveUiTests();
  additionalTests();
  targetDiscoveryTests();
  maintenanceFlowTests();
  planMatrixTests();
  performanceRuleCasesTests();
  faultThresholdCasesTests();
  experimentTests();
  thresholdGateMatrixCasesTests();
  loadFaultWorkloadCasesTests();
  launchBudgetCasesTests();
  reportCasesTests();
  templateCoreCasesTests();
  templateRunnerCasesTests();
  workloadCatalogMatrixTests();
  reportDeliveryB2Tests();
  performanceExecutorWaveOneTests();
  performanceRestoreWaveOneTests();
  performanceGroupingWaveOneTests();
  performanceServiceWaveOneTests();
  performanceConditionWaveTwoTests();
  performanceExportWaveTwoTests();
  performanceInputWaveTwoTests();
  performanceThresholdWaveTwoTests();
  seriesUiQaTests();
  seriesOwnershipFeatureTests();
  seriesPersistenceFeatureTests();
  seriesStateFeatureTests();
  seriesNativeQaTests();
  registerReportHook();
}

function registerEventLoopYield(): void {
  // Hypium can run synchronous cases and printSync reports in one long Promise chain.
  // Yield to the native event loop before EVERY leaf case, including after a failed case.
  // Promise.resolve() is not sufficient: it only schedules another microtask.
  beforeEachIt(async (): Promise<void> => {
    await new Promise<void>((resolve): void => {
      setTimeout((): void => { resolve(); }, 0);
    });
  });
}

function registerReportHook(): void {
  afterAll(async (): Promise<void> => {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const path = `${delegator.getAppContext().filesDir}/app-performance-test-report.json`;
    const rows = caseResults();
    const data: TestReport = {
      caseTimeoutMs: CASE_TIMEOUT_MS,
      runnerTimeoutMs: RUNNER_TIMEOUT_MS,
      total: rows.length,
      passed: rows.filter((row: CaseResult): boolean => row.status === 'passed').length,
      failed: rows.filter((row: CaseResult): boolean => row.status === 'failed').length,
      cases: rows
    };
    const report = JSON.stringify(data, null, 2);
    const file = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
    try {
      fileIo.writeSync(file.fd, report);
    } finally {
      fileIo.closeSync(file);
    }
    await delegator.print(`[AP_REPORT] ${path}`);
  });
}


