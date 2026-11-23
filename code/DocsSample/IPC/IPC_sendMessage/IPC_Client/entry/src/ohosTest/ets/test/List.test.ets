import abilityTest from './Ability.test';
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
//   IpcCore              connection lifecycle, state machine, send flow, proxy,
//                        request result, message sequence, death recipient, session
//   RpcProtocol          request codes, reply/descriptor contracts, options,
//                        cursor behaviour, error and unknown-code matrices
//   IpcValidation        want, toast, connectId, state, payload, error, log, session
//   LifecycleState       connect/disconnect/death/reconnect, persistence, recovery
//   PerformanceStability concurrency, long runs, memory footprint, throughput
//   Integration          system, user scenarios, pipeline and connectivity
//   Security             descriptor allowlist, payload, descriptor and log safety
//   FaultInjection       connect/send/proxy/death/reclaim faults
//   DataMatrix           payload matrix
//   Regression           snapshot regression
//   ResourceContract     exported constant contract
//
// All cases are pure logic. No UI automation or ArkUI component is imported.
// Logs use Shared/Support (hilog), and every case carries the full @tc field set.

import dataMatrixPayloadMatrixSuite from './DataMatrix/PayloadMatrix.test';
import faultInjectionFaultInjectionSuite from './FaultInjection/FaultInjection.test';
import integrationConnectivityIntegrationSuite from './Integration/ConnectivityIntegration.test';
import integrationPipelineIntegrationSuite from './Integration/PipelineIntegration.test';
import integrationSystemIntegrationSuite from './Integration/SystemIntegration.test';
import integrationUserScenariosSuite from './Integration/UserScenarios.test';
import ipcCoreClientConnectionLifecycleSuite from './IpcCore/ClientConnectionLifecycle.test';
import ipcCoreClientDeathRecipientSuite from './IpcCore/ClientDeathRecipient.test';
import ipcCoreClientMessageSequenceSuite from './IpcCore/ClientMessageSequence.test';
import ipcCoreClientProxyModelSuite from './IpcCore/ClientProxyModel.test';
import ipcCoreClientRequestResultSuite from './IpcCore/ClientRequestResult.test';
import ipcCoreClientSendFlowSuite from './IpcCore/ClientSendFlow.test';
import ipcCoreClientSessionBasicsSuite from './IpcCore/ClientSessionBasics.test';
import ipcCoreClientStateMachineSuite from './IpcCore/ClientStateMachine.test';
import ipcValidationConnectIdValidationSuite from './IpcValidation/ConnectIdValidation.test';
import ipcValidationErrorValidationSuite from './IpcValidation/ErrorValidation.test';
import ipcValidationLogValidationSuite from './IpcValidation/LogValidation.test';
import ipcValidationPayloadValidationSuite from './IpcValidation/PayloadValidation.test';
import ipcValidationSessionValidationSuite from './IpcValidation/SessionValidation.test';
import ipcValidationStateValidationSuite from './IpcValidation/StateValidation.test';
import ipcValidationToastContractValidationSuite from './IpcValidation/ToastContractValidation.test';
import ipcValidationWantValidationSuite from './IpcValidation/WantValidation.test';
import lifecycleStateConfigurationChangesSuite from './LifecycleState/ConfigurationChanges.test';
import lifecycleStateConnectLifecycleSuite from './LifecycleState/ConnectLifecycle.test';
import lifecycleStateDeathLifecycleSuite from './LifecycleState/DeathLifecycle.test';
import lifecycleStateDisconnectLifecycleSuite from './LifecycleState/DisconnectLifecycle.test';
import lifecycleStateReconnectFlowSuite from './LifecycleState/ReconnectFlow.test';
import lifecycleStateResourceManagementSuite from './LifecycleState/ResourceManagement.test';
import lifecycleStateStatePersistenceSuite from './LifecycleState/StatePersistence.test';
import lifecycleStateStateRecoverySuite from './LifecycleState/StateRecovery.test';
import performanceStabilityConcurrencyControlSuite from './PerformanceStability/ConcurrencyControl.test';
import performanceStabilityLongTermStabilitySuite from './PerformanceStability/LongTermStability.test';
import performanceStabilityMemoryLeakDetectionSuite from './PerformanceStability/MemoryLeakDetection.test';
import performanceStabilityThroughputProfileSuite from './PerformanceStability/ThroughputProfile.test';
import regressionSnapshotRegressionSuite from './Regression/SnapshotRegression.test';
import resourceContractConstantContractSuite from './ResourceContract/ConstantContract.test';
import rpcProtocolClientCursorBehaviorSuite from './RpcProtocol/ClientCursorBehavior.test';
import rpcProtocolClientDescriptorContractSuite from './RpcProtocol/ClientDescriptorContract.test';
import rpcProtocolClientErrorCodesSuite from './RpcProtocol/ClientErrorCodes.test';
import rpcProtocolClientMessageOptionSuite from './RpcProtocol/ClientMessageOption.test';
import rpcProtocolClientProtocolCodesSuite from './RpcProtocol/ClientProtocolCodes.test';
import rpcProtocolClientProtocolWorkflowSuite from './RpcProtocol/ClientProtocolWorkflow.test';
import rpcProtocolClientReplyContractSuite from './RpcProtocol/ClientReplyContract.test';
import rpcProtocolClientUnknownCodesSuite from './RpcProtocol/ClientUnknownCodes.test';
import securityDescriptorSecuritySuite from './Security/DescriptorSecurity.test';
import securityIpcSecuritySuite from './Security/IpcSecurity.test';
import securityLogSecuritySuite from './Security/LogSecurity.test';
import securityPayloadSecuritySuite from './Security/PayloadSecurity.test';

export default function testsuite(): void {
  abilityTest();
  dataMatrixPayloadMatrixSuite();
  faultInjectionFaultInjectionSuite();
  integrationConnectivityIntegrationSuite();
  integrationPipelineIntegrationSuite();
  integrationSystemIntegrationSuite();
  integrationUserScenariosSuite();
  ipcCoreClientConnectionLifecycleSuite();
  ipcCoreClientDeathRecipientSuite();
  ipcCoreClientMessageSequenceSuite();
  ipcCoreClientProxyModelSuite();
  ipcCoreClientRequestResultSuite();
  ipcCoreClientSendFlowSuite();
  ipcCoreClientSessionBasicsSuite();
  ipcCoreClientStateMachineSuite();
  ipcValidationConnectIdValidationSuite();
  ipcValidationErrorValidationSuite();
  ipcValidationLogValidationSuite();
  ipcValidationPayloadValidationSuite();
  ipcValidationSessionValidationSuite();
  ipcValidationStateValidationSuite();
  ipcValidationToastContractValidationSuite();
  ipcValidationWantValidationSuite();
  lifecycleStateConfigurationChangesSuite();
  lifecycleStateConnectLifecycleSuite();
  lifecycleStateDeathLifecycleSuite();
  lifecycleStateDisconnectLifecycleSuite();
  lifecycleStateReconnectFlowSuite();
  lifecycleStateResourceManagementSuite();
  lifecycleStateStatePersistenceSuite();
  lifecycleStateStateRecoverySuite();
  performanceStabilityConcurrencyControlSuite();
  performanceStabilityLongTermStabilitySuite();
  performanceStabilityMemoryLeakDetectionSuite();
  performanceStabilityThroughputProfileSuite();
  regressionSnapshotRegressionSuite();
  resourceContractConstantContractSuite();
  rpcProtocolClientCursorBehaviorSuite();
  rpcProtocolClientDescriptorContractSuite();
  rpcProtocolClientErrorCodesSuite();
  rpcProtocolClientMessageOptionSuite();
  rpcProtocolClientProtocolCodesSuite();
  rpcProtocolClientProtocolWorkflowSuite();
  rpcProtocolClientReplyContractSuite();
  rpcProtocolClientUnknownCodesSuite();
  securityDescriptorSecuritySuite();
  securityIpcSecuritySuite();
  securityLogSecuritySuite();
  securityPayloadSecuritySuite();
}
