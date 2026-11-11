/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { configureTestLocale } from '../support/TestLocaleFixture';
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
  // Isolated model cases assert the reviewed zh_CN text.
  configureTestLocale();
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
