import continuationScenes from './ContinuationScenes.test';
import continuationTransactions from './ContinuationTransactions.test';
import continuationScenarios from './ContinuationScenarios.test';
import continuationAdditional from './ContinuationAdditional.test';
import continuationVersioning from './ContinuationVersioning.test';
import payloadMatrixTest from './PayloadMatrix.test';
import payloadRuleCasesTest from './PayloadRuleCases.test';
import scenarioValidatorCasesTest from './ScenarioValidatorCases.test';
import retryDictionaryCasesTest from './RetryDictionaryCases.test';
import workspaceCasesTest from './WorkspaceCases.test';
import documentFormFlowCasesTest from './DocumentFormFlowCases.test';
import mergeRecoveryMatrixCasesTest from './MergeRecoveryMatrixCases.test';
import restoreSceneCasesTest from './RestoreSceneCases.test';
import sceneModelMatrixTest from './SceneModelMatrix.test';
import sceneRecoveryB2Test from './SceneRecoveryB2.test';
import continuationWorkbenchWaveOne from './ContinuationWorkbenchWaveOne.test';
import continuationArchiveWaveOne from './ContinuationArchiveWaveOne.test';
import continuationPageWaveOne from './ContinuationPageWaveOne.test';
import continuationModeBoundaryWaveTwo from './ContinuationModeBoundaryWaveTwo.test';
import continuationHistoryScopeWaveTwo from './ContinuationHistoryScopeWaveTwo.test';
import sceneBackupPlanningCases from './SceneBackupPlanningCases.test';
import sceneBackupTransactionCases from './SceneBackupTransactionCases.test';
import sceneBackupLifecycleCases from './SceneBackupLifecycleCases.test';
import sceneBackupClipboardCases from './SceneBackupClipboardCases.test';
import workspaceBackupUiQaTests from './WorkspaceBackupUiQa.test';
import workspaceBackupNativeQaTests from './WorkspaceBackupNativeQa.test';

export default function testsuite(): void {
  continuationScenes();
  continuationTransactions();
  continuationScenarios();
  continuationAdditional();
  continuationVersioning();
  payloadMatrixTest();
  payloadRuleCasesTest();
  scenarioValidatorCasesTest();
  retryDictionaryCasesTest();
  workspaceCasesTest();
  documentFormFlowCasesTest();
  mergeRecoveryMatrixCasesTest();
  restoreSceneCasesTest();
  sceneModelMatrixTest();
  sceneRecoveryB2Test();
  continuationWorkbenchWaveOne();
  continuationArchiveWaveOne();
  continuationPageWaveOne();
  continuationModeBoundaryWaveTwo();
  continuationHistoryScopeWaveTwo();
  sceneBackupPlanningCases();
  sceneBackupTransactionCases();
  sceneBackupLifecycleCases();
  sceneBackupClipboardCases();
  workspaceBackupUiQaTests();
  workspaceBackupNativeQaTests();
}


