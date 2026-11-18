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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import SerialAdvancedScenariosTest from './Integration/SerialAdvancedScenarios.test';
import SerialRegressionTest from './Integration/SerialRegression.test';
import SerialHardwareTest from './Integration/SerialHardware';
import SerialIntegrationTest from './Integration/SerialIntegration.test';
import SerialPortMetadataTest from './Integration/SerialPortMetadata.test';
import SerialProviderRecoveryTest from './Integration/SerialProviderRecovery.test';
import SerialConfigurationCompatibilityTest from './Integration/SerialConfigurationCompatibility.test';
import SerialSystemIntegrationTest from './Integration/SerialSystemIntegration.test';
import SerialUserScenariosTest from './Integration/SerialUserScenarios.test';
import SerialCallbackRegistrationTest from './Interaction/SerialCallbackRegistration.test';
import SerialWriteBufferBoundariesTest from './Interaction/SerialWriteBufferBoundaries.test';
import SerialSnapshotIsolationTest from './Interaction/SerialSnapshotIsolation.test';
import SerialWriteBufferOwnershipTest from './Interaction/SerialWriteBufferOwnership.test';
import SerialDataReadEventsTest from './Interaction/SerialDataReadEvents.test';
import SerialCallbackRemovalTest from './Interaction/SerialCallbackRemoval.test';
import SerialSignalTransitionsTest from './Interaction/SerialSignalTransitions.test';
import SerialStatusReadbackTest from './Interaction/SerialStatusReadback.test';
import SerialDataChunkingTest from './Interaction/SerialDataChunking.test';
import SerialConfigOwnershipTest from './Interaction/SerialConfigOwnership.test';
import SerialDisconnectEventsTest from './Interaction/SerialDisconnectEvents.test';
import SerialSignalIsolationTest from './Interaction/SerialSignalIsolation.test';
import SerialReconfigurationTest from './LifecycleState/SerialReconfiguration.test';
import SerialOpenCloseTest from './LifecycleState/SerialOpenClose.test';
import SerialSessionStateTest from './LifecycleState/SerialSessionState.test';
import SerialErrorRecoveryTest from './LifecycleState/SerialErrorRecovery.test';
import SerialFailurePropagationTest from './LifecycleState/SerialFailurePropagation.test';
import SerialDisposalTest from './LifecycleState/SerialDisposal.test';
import SerialCallbackResourcesTest from './LifecycleState/SerialCallbackResources.test';
import SerialSessionIsolationTest from './LifecycleState/SerialSessionIsolation.test';
import SerialTransferAccountingTest from './LifecycleState/SerialTransferAccounting.test';
import SerialDisconnectRecoveryTest from './LifecycleState/SerialDisconnectRecovery.test';
import SerialQueuedOperationsTest from './PerformanceStability/SerialQueuedOperations.test';
import SerialConcurrentWritesTest from './PerformanceStability/SerialConcurrentWrites.test';
import SerialRepeatedSessionsTest from './PerformanceStability/SerialRepeatedSessions.test';
import SerialResourceReleaseTest from './PerformanceStability/SerialResourceRelease.test';
import SerialWriteBurstTest from './PerformanceStability/SerialWriteBurst.test';
import SerialBufferControlTest from './PerformanceStability/SerialBufferControl.test';
import SerialTransferLoadTest from './PerformanceStability/SerialTransferLoad.test';
import SerialPortConcurrencyTest from './SerialPort/SerialPortConcurrency.test';
import SerialPortConsistencyTest from './SerialPort/SerialPortConsistency.test';
import SerialPortEndToEndTest from './SerialPort/SerialPortEndToEnd.test';
import SerialPortErrorRecoveryTest from './SerialPort/SerialPortErrorRecovery.test';
import SerialPortLifecycleTest from './SerialPort/SerialPortLifecycle.test';
import SerialPortStateTest from './SerialPort/SerialPortState.test';
import SerialPortBurstTest from './SerialPort/SerialPortBurst.test';
import SerialPortGuardsTest from './SerialPort/SerialPortGuards.test';
import SerialPortReceiveTest from './SerialPort/SerialPortReceive.test';
import SerialPortInfoTest from './SerialPort/SerialPortInfo.test';
import SerialPortConfigurationTest from './SerialPort/SerialPortConfiguration.test';
import SerialPortDeepWorkflowTest from './SerialPort/SerialPortDeepWorkflow.test';
import SerialPortOperationsTest from './SerialPort/SerialPortOperations.test';
import SerialPortFlowTest from './SerialPort/SerialPortFlow.test';
import SerialPortSignalsTest from './SerialPort/SerialPortSignals.test';
import SerialPortWorkflowTest from './SerialPort/SerialPortWorkflow.test';
import SerialOpenConfigurationsTest from './SerialValidation/SerialOpenConfigurations.test';
import SerialAuthorizationErrorsTest from './SerialValidation/SerialAuthorizationErrors.test';
import SerialEnumerationTest from './SerialValidation/SerialEnumeration.test';
import SerialEventCallbacksTest from './SerialValidation/SerialEventCallbacks.test';
import SerialInterruptedTransfersTest from './SerialValidation/SerialInterruptedTransfers.test';
import SerialDisconnectUnsubscribeTest from './SerialValidation/SerialDisconnectUnsubscribe.test';
import SerialDiscoveryFailuresTest from './SerialValidation/SerialDiscoveryFailures.test';
import SerialUnselectedGuardsTest from './SerialValidation/SerialUnselectedGuards.test';
import SerialPayloadOwnershipTest from './Security/SerialPayloadOwnership.test';
import SerialControllerIsolationTest from './Security/SerialControllerIsolation.test';
import SerialStaleCallbacksTest from './Security/SerialStaleCallbacks.test';
import SerialOperationOrderingTest from './Validation/SerialOperationOrdering.test';
import SerialWriteBoundariesTest from './Validation/SerialWriteBoundaries.test';
import SerialReceiveBoundariesTest from './Validation/SerialReceiveBoundaries.test';
import SerialConfigurationForwardingTest from './Validation/SerialConfigurationForwarding.test';
import SerialCloseFailureRecoveryTest from './Validation/SerialCloseFailureRecovery.test';
import SerialSignalSequencesTest from './Validation/SerialSignalSequences.test';
import SerialWriteTimeoutForwardingTest from './Validation/SerialWriteTimeoutForwarding.test';
import SerialPartialWriteAccountingTest from './Validation/SerialPartialWriteAccounting.test';
import SerialQueueFailureRecoveryTest from './Validation/SerialQueueFailureRecovery.test';
import SerialSnapshotCopiesTest from './Validation/SerialSnapshotCopies.test';
import SerialEmptyEnumerationTest from './Validation/SerialEmptyEnumeration.test';

/* Simulation suites are always registered; there are no UI suites. */
/* Hardware cases require serialHardware=true and fail when no device is present. */
export default function testsuite(): void {
  const parameters = abilityDelegatorRegistry.getArguments().parameters;
  const runHardware: boolean = parameters['serialHardware'] === 'true';
  SerialAdvancedScenariosTest();
  SerialRegressionTest();
  SerialIntegrationTest();
  SerialPortMetadataTest();
  SerialProviderRecoveryTest();
  SerialConfigurationCompatibilityTest();
  SerialSystemIntegrationTest();
  SerialUserScenariosTest();
  SerialCallbackRegistrationTest();
  SerialWriteBufferBoundariesTest();
  SerialSnapshotIsolationTest();
  SerialWriteBufferOwnershipTest();
  SerialDataReadEventsTest();
  SerialCallbackRemovalTest();
  SerialSignalTransitionsTest();
  SerialStatusReadbackTest();
  SerialDataChunkingTest();
  SerialConfigOwnershipTest();
  SerialDisconnectEventsTest();
  SerialSignalIsolationTest();
  SerialReconfigurationTest();
  SerialOpenCloseTest();
  SerialSessionStateTest();
  SerialErrorRecoveryTest();
  SerialFailurePropagationTest();
  SerialDisposalTest();
  SerialCallbackResourcesTest();
  SerialSessionIsolationTest();
  SerialTransferAccountingTest();
  SerialDisconnectRecoveryTest();
  SerialQueuedOperationsTest();
  SerialConcurrentWritesTest();
  SerialRepeatedSessionsTest();
  SerialResourceReleaseTest();
  SerialWriteBurstTest();
  SerialBufferControlTest();
  SerialTransferLoadTest();
  SerialPortConcurrencyTest();
  SerialPortConsistencyTest();
  SerialPortEndToEndTest();
  SerialPortErrorRecoveryTest();
  SerialPortLifecycleTest();
  SerialPortStateTest();
  SerialPortBurstTest();
  SerialPortGuardsTest();
  SerialPortReceiveTest();
  SerialPortInfoTest();
  SerialPortConfigurationTest();
  SerialPortDeepWorkflowTest();
  SerialPortOperationsTest();
  SerialPortFlowTest();
  SerialPortSignalsTest();
  SerialPortWorkflowTest();
  SerialOpenConfigurationsTest();
  SerialAuthorizationErrorsTest();
  SerialEnumerationTest();
  SerialEventCallbacksTest();
  SerialInterruptedTransfersTest();
  SerialDisconnectUnsubscribeTest();
  SerialDiscoveryFailuresTest();
  SerialUnselectedGuardsTest();
  SerialPayloadOwnershipTest();
  SerialControllerIsolationTest();
  SerialStaleCallbacksTest();
  SerialOperationOrderingTest();
  SerialWriteBoundariesTest();
  SerialReceiveBoundariesTest();
  SerialConfigurationForwardingTest();
  SerialCloseFailureRecoveryTest();
  SerialSignalSequencesTest();
  SerialWriteTimeoutForwardingTest();
  SerialPartialWriteAccountingTest();
  SerialQueueFailureRecoveryTest();
  SerialSnapshotCopiesTest();
  SerialEmptyEnumerationTest();
  if (runHardware) {
    SerialHardwareTest();
  }
}
