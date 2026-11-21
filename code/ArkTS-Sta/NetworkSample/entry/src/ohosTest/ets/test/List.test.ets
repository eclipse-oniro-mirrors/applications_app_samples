'use static';
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

// Suite registry: every generated suite in this ohosTest module is imported here.
//
// Categories:
//   NetworkCore              A/B/C graph, gate matrix, progress ledger, config, polling
//   NetworkValidation        URL origin/session/source, security matrix, notices
//   TransferValidation       config, boundary, event, state and logging contracts
//   LifecycleState           run lifecycle, recovery matrix and persistence
//   PerformanceStability     throughput matrix, long runs and polling cost
//   Integration              pipeline, compatibility and user scenarios
//   Security                 redaction, scheme enforcement and safe configuration
//   AdvancedScenarios        interleaving, restart and timeout journeys
//   Interleavings            lock matrix and simultaneous completion
//   FaultInjection           create failure and callback loss
//   DataMatrix               URL structure and progress percentages
//   Semantics                semantic order and readable labels
//   ResourceContract         exported constant contract
//   Regression               fingerprint, snapshot and cross-module regression
//
// All cases are pure logic. No UI automation or ArkUI component is imported.

import abilityTest from './Ability.test';
import semanticOrderModelSuite from './Semantics/SemanticOrderModel.test';
import advancedScenariosAdvancedInterleavingSuite from './AdvancedScenarios/AdvancedInterleaving.test';
import advancedScenariosRestartAndRetrySuite from './AdvancedScenarios/RestartAndRetry.test';
import advancedScenariosTimeoutRecoverySuite from './AdvancedScenarios/TimeoutRecovery.test';
import dataMatrixProgressPercentageMatrixSuite from './DataMatrix/ProgressPercentageMatrix.test';
import dataMatrixUrlStructureMatrixSuite from './DataMatrix/UrlStructureMatrix.test';
import faultInjectionCallbackLossSuite from './FaultInjection/CallbackLoss.test';
import faultInjectionCreateFailureSuite from './FaultInjection/CreateFailure.test';
import integrationAdvancedScenariosSuite from './Integration/AdvancedScenarios.test';
import integrationCompatibilitySuite from './Integration/Compatibility.test';
import integrationComprehensiveRegressionSuite from './Integration/ComprehensiveRegression.test';
import integrationConnectivitySuite from './Integration/Connectivity.test';
import integrationPipelineTestingSuite from './Integration/PipelineTesting.test';
import integrationSystemIntegrationSuite from './Integration/SystemIntegration.test';
import integrationUserScenariosSuite from './Integration/UserScenarios.test';
import interleavingsLockAcquisitionMatrixSuite from './Interleavings/LockAcquisitionMatrix.test';
import interleavingsSimultaneousCompletionSuite from './Interleavings/SimultaneousCompletion.test';
import lifecycleStateErrorRecoverySuite from './LifecycleState/ErrorRecovery.test';
import lifecycleStateExceptionHandlingSuite from './LifecycleState/ExceptionHandling.test';
import lifecycleStateResourceManagementSuite from './LifecycleState/ResourceManagement.test';
import lifecycleStateRunLifecycleSuite from './LifecycleState/RunLifecycle.test';
import lifecycleStateRunRecoveryMatrixSuite from './LifecycleState/RunRecoveryMatrix.test';
import lifecycleStateSessionManagementSuite from './LifecycleState/SessionManagement.test';
import lifecycleStateStateManagementSuite from './LifecycleState/StateManagement.test';
import lifecycleStateStatePersistenceSuite from './LifecycleState/StatePersistence.test';
import lifecycleStateStateRecoverySuite from './LifecycleState/StateRecovery.test';
import networkCoreCoreConcurrencySuite from './NetworkCore/CoreConcurrency.test';
import networkCoreCoreConsistencySuite from './NetworkCore/CoreConsistency.test';
import networkCoreCoreEndToEndSuite from './NetworkCore/CoreEndToEnd.test';
import networkCoreCoreErrorRecoverySuite from './NetworkCore/CoreErrorRecovery.test';
import networkCoreCoreGateMatrixSuite from './NetworkCore/CoreGateMatrix.test';
import networkCoreCoreGraphSuite from './NetworkCore/CoreGraph.test';
import networkCoreCoreLifecycleSuite from './NetworkCore/CoreLifecycle.test';
import networkCoreCoreModelDeepSuite from './NetworkCore/CoreModelDeep.test';
import networkCoreCoreOperationCatalogSuite from './NetworkCore/CoreOperationCatalog.test';
import networkCoreCoreOperationFlowSuite from './NetworkCore/CoreOperationFlow.test';
import networkCoreCoreOperationsSuite from './NetworkCore/CoreOperations.test';
import networkCoreCoreOperationWorkflowSuite from './NetworkCore/CoreOperationWorkflow.test';
import networkCoreCoreProgressLedgerSuite from './NetworkCore/CoreProgressLedger.test';
import networkCoreCoreRunConfigurationSuite from './NetworkCore/CoreRunConfiguration.test';
import networkCoreCoreSchedulingSuite from './NetworkCore/CoreScheduling.test';
import networkCoreCoreStateManagementSuite from './NetworkCore/CoreStateManagement.test';
import networkCoreCoreStressSuite from './NetworkCore/CoreStress.test';
import networkCoreCoreTaskModelSuite from './NetworkCore/CoreTaskModel.test';
import networkValidationInterruptionRecoverySuite from './NetworkValidation/InterruptionRecovery.test';
import networkValidationOfflineResourceSuite from './NetworkValidation/OfflineResource.test';
import networkValidationResourceNoticeSuite from './NetworkValidation/ResourceNotice.test';
import networkValidationResourceOriginSuite from './NetworkValidation/ResourceOrigin.test';
import networkValidationResourceSessionSuite from './NetworkValidation/ResourceSession.test';
import networkValidationResourceSourceSuite from './NetworkValidation/ResourceSource.test';
import networkValidationSessionValidationSuite from './NetworkValidation/SessionValidation.test';
import networkValidationTransferToolValidationSuite from './NetworkValidation/TransferToolValidation.test';
import networkValidationUrlSecurityMatrixSuite from './NetworkValidation/UrlSecurityMatrix.test';
import performanceStabilityConcurrencyControlSuite from './PerformanceStability/ConcurrencyControl.test';
import performanceStabilityLongTermStabilitySuite from './PerformanceStability/LongTermStability.test';
import performanceStabilityMemoryLeakDetectionSuite from './PerformanceStability/MemoryLeakDetection.test';
import performanceStabilityPollingPerformanceSuite from './PerformanceStability/PollingPerformance.test';
import performanceStabilityQueueThroughputMatrixSuite from './PerformanceStability/QueueThroughputMatrix.test';
import regressionCrossModuleRegressionSuite from './Regression/CrossModuleRegression.test';
import regressionFingerprintRegressionSuite from './Regression/FingerprintRegression.test';
import regressionSnapshotConsistencySuite from './Regression/SnapshotConsistency.test';
import resourceContractConstantContractSuite from './ResourceContract/ConstantContract.test';
import securitySemanticSecuritySuite from './Security/SemanticSecurity.test';
import securitySecurityValidationSuite from './Security/SecurityValidation.test';
import securityTransferSecuritySuite from './Security/TransferSecurity.test';
import transferValidationBoundaryTransfersSuite from './TransferValidation/BoundaryTransfers.test';
import transferValidationTransferConfigurationSuite from './TransferValidation/TransferConfiguration.test';
import transferValidationTransferContractSuite from './TransferValidation/TransferContract.test';
import transferValidationTransferEventsSuite from './TransferValidation/TransferEvents.test';
import transferValidationTransferInputSuite from './TransferValidation/TransferInput.test';
import transferValidationTransferLoggingSuite from './TransferValidation/TransferLogging.test';
import transferValidationTransferResourcesSuite from './TransferValidation/TransferResources.test';
import transferValidationTransferStateMachineSuite from './TransferValidation/TransferStateMachine.test';

export default function testsuite(): void {
  abilityTest();
  semanticOrderModelSuite();
  advancedScenariosAdvancedInterleavingSuite();
  advancedScenariosRestartAndRetrySuite();
  advancedScenariosTimeoutRecoverySuite();
  dataMatrixProgressPercentageMatrixSuite();
  dataMatrixUrlStructureMatrixSuite();
  faultInjectionCallbackLossSuite();
  faultInjectionCreateFailureSuite();
  integrationAdvancedScenariosSuite();
  integrationCompatibilitySuite();
  integrationComprehensiveRegressionSuite();
  integrationConnectivitySuite();
  integrationPipelineTestingSuite();
  integrationSystemIntegrationSuite();
  integrationUserScenariosSuite();
  interleavingsLockAcquisitionMatrixSuite();
  interleavingsSimultaneousCompletionSuite();
  lifecycleStateErrorRecoverySuite();
  lifecycleStateExceptionHandlingSuite();
  lifecycleStateResourceManagementSuite();
  lifecycleStateRunLifecycleSuite();
  lifecycleStateRunRecoveryMatrixSuite();
  lifecycleStateSessionManagementSuite();
  lifecycleStateStateManagementSuite();
  lifecycleStateStatePersistenceSuite();
  lifecycleStateStateRecoverySuite();
  networkCoreCoreConcurrencySuite();
  networkCoreCoreConsistencySuite();
  networkCoreCoreEndToEndSuite();
  networkCoreCoreErrorRecoverySuite();
  networkCoreCoreGateMatrixSuite();
  networkCoreCoreGraphSuite();
  networkCoreCoreLifecycleSuite();
  networkCoreCoreModelDeepSuite();
  networkCoreCoreOperationCatalogSuite();
  networkCoreCoreOperationFlowSuite();
  networkCoreCoreOperationsSuite();
  networkCoreCoreOperationWorkflowSuite();
  networkCoreCoreProgressLedgerSuite();
  networkCoreCoreRunConfigurationSuite();
  networkCoreCoreSchedulingSuite();
  networkCoreCoreStateManagementSuite();
  networkCoreCoreStressSuite();
  networkCoreCoreTaskModelSuite();
  networkValidationInterruptionRecoverySuite();
  networkValidationOfflineResourceSuite();
  networkValidationResourceNoticeSuite();
  networkValidationResourceOriginSuite();
  networkValidationResourceSessionSuite();
  networkValidationResourceSourceSuite();
  networkValidationSessionValidationSuite();
  networkValidationTransferToolValidationSuite();
  networkValidationUrlSecurityMatrixSuite();
  performanceStabilityConcurrencyControlSuite();
  performanceStabilityLongTermStabilitySuite();
  performanceStabilityMemoryLeakDetectionSuite();
  performanceStabilityPollingPerformanceSuite();
  performanceStabilityQueueThroughputMatrixSuite();
  regressionCrossModuleRegressionSuite();
  regressionFingerprintRegressionSuite();
  regressionSnapshotConsistencySuite();
  resourceContractConstantContractSuite();
  securitySemanticSecuritySuite();
  securitySecurityValidationSuite();
  securityTransferSecuritySuite();
  transferValidationBoundaryTransfersSuite();
  transferValidationTransferConfigurationSuite();
  transferValidationTransferContractSuite();
  transferValidationTransferEventsSuite();
  transferValidationTransferInputSuite();
  transferValidationTransferLoggingSuite();
  transferValidationTransferResourcesSuite();
  transferValidationTransferStateMachineSuite();
}
