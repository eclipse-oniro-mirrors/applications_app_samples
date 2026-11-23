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
//   IpcCore              stub request handling, lifecycle, protocol, descriptor,
//                        sequence, in-process client, ledger and stress
//   RpcProtocol          request-code matrix, reply/option/cursor/error contracts,
//                        unknown codes, protocol workflow and catalog
//   IpcValidation        want, descriptor, payload, state, lifecycle, log, session
//   LifecycleState       onCreate/onRequest/onConnect/onDisconnect/onDestroy,
//                        reconnect, persistence and resource management
//   PerformanceStability concurrency, long runs, memory footprint, throughput
//   Integration          system, user scenarios, pipeline and connectivity
//   Security             descriptor allowlist, payload, descriptor and log safety
//   FaultInjection       stub alive/reject/sequence faults
//   DataMatrix           payload matrix
//   Regression           snapshot regression
//   ResourceContract     exported constant contract
//
// All cases are pure logic. No UI automation or ArkUI component is imported.
// Logs use Shared/Support (hilog), and every case carries the full @tc field set.

import abilityTest from './Ability.test';
import dataMatrixPayloadMatrixSuite from './DataMatrix/PayloadMatrix.test';
import faultInjectionFaultInjectionSuite from './FaultInjection/FaultInjection.test';
import integrationConnectivityIntegrationSuite from './Integration/ConnectivityIntegration.test';
import integrationPipelineIntegrationSuite from './Integration/PipelineIntegration.test';
import integrationSystemIntegrationSuite from './Integration/SystemIntegration.test';
import integrationUserScenariosSuite from './Integration/UserScenarios.test';
import ipcCoreStubClientDoubleSuite from './IpcCore/StubClientDouble.test';
import ipcCoreStubDescriptorSuite from './IpcCore/StubDescriptor.test';
import ipcCoreStubLifecycleSuite from './IpcCore/StubLifecycle.test';
import ipcCoreStubMessageSequenceSuite from './IpcCore/StubMessageSequence.test';
import ipcCoreStubProtocolCoreSuite from './IpcCore/StubProtocolCore.test';
import ipcCoreStubRequestHandlingSuite from './IpcCore/StubRequestHandling.test';
import ipcCoreStubRequestLedgerSuite from './IpcCore/StubRequestLedger.test';
import ipcCoreStubStressSuite from './IpcCore/StubStress.test';
import ipcValidationDescriptorValidationSuite from './IpcValidation/DescriptorValidation.test';
import ipcValidationInputValidationSuite from './IpcValidation/InputValidation.test';
import ipcValidationLifecycleValidationSuite from './IpcValidation/LifecycleValidation.test';
import ipcValidationLogValidationSuite from './IpcValidation/LogValidation.test';
import ipcValidationPayloadValidationSuite from './IpcValidation/PayloadValidation.test';
import ipcValidationSessionValidationSuite from './IpcValidation/SessionValidation.test';
import ipcValidationStateValidationSuite from './IpcValidation/StateValidation.test';
import ipcValidationWantValidationSuite from './IpcValidation/WantValidation.test';
import lifecycleStateOnConnectLifecycleSuite from './LifecycleState/OnConnectLifecycle.test';
import lifecycleStateOnCreateLifecycleSuite from './LifecycleState/OnCreateLifecycle.test';
import lifecycleStateOnDestroyLifecycleSuite from './LifecycleState/OnDestroyLifecycle.test';
import lifecycleStateOnDisconnectLifecycleSuite from './LifecycleState/OnDisconnectLifecycle.test';
import lifecycleStateOnRequestLifecycleSuite from './LifecycleState/OnRequestLifecycle.test';
import lifecycleStateReconnectLifecycleSuite from './LifecycleState/ReconnectLifecycle.test';
import lifecycleStateResourceManagementSuite from './LifecycleState/ResourceManagement.test';
import lifecycleStateStatePersistenceSuite from './LifecycleState/StatePersistence.test';
import performanceStabilityConcurrencyControlSuite from './PerformanceStability/ConcurrencyControl.test';
import performanceStabilityLongTermStabilitySuite from './PerformanceStability/LongTermStability.test';
import performanceStabilityMemoryLeakDetectionSuite from './PerformanceStability/MemoryLeakDetection.test';
import performanceStabilityThroughputProfileSuite from './PerformanceStability/ThroughputProfile.test';
import regressionSnapshotRegressionSuite from './Regression/SnapshotRegression.test';
import resourceContractConstantContractSuite from './ResourceContract/ConstantContract.test';
import rpcProtocolCursorContractSuite from './RpcProtocol/CursorContract.test';
import rpcProtocolErrorCodeContractSuite from './RpcProtocol/ErrorCodeContract.test';
import rpcProtocolOptionContractSuite from './RpcProtocol/OptionContract.test';
import rpcProtocolProtocolCatalogSuite from './RpcProtocol/ProtocolCatalog.test';
import rpcProtocolProtocolWorkflowSuite from './RpcProtocol/ProtocolWorkflow.test';
import rpcProtocolReplyContractSuite from './RpcProtocol/ReplyContract.test';
import rpcProtocolRequestCodeMatrixSuite from './RpcProtocol/RequestCodeMatrix.test';
import rpcProtocolUnknownCodeMatrixSuite from './RpcProtocol/UnknownCodeMatrix.test';
import securityDescriptorSecuritySuite from './Security/DescriptorSecurity.test';
import securityLogSecuritySuite from './Security/LogSecurity.test';
import securityPayloadSecuritySuite from './Security/PayloadSecurity.test';
import securityStubSecuritySuite from './Security/StubSecurity.test';

export default function testsuite(): void {
  abilityTest();
  dataMatrixPayloadMatrixSuite();
  faultInjectionFaultInjectionSuite();
  integrationConnectivityIntegrationSuite();
  integrationPipelineIntegrationSuite();
  integrationSystemIntegrationSuite();
  integrationUserScenariosSuite();
  ipcCoreStubClientDoubleSuite();
  ipcCoreStubDescriptorSuite();
  ipcCoreStubLifecycleSuite();
  ipcCoreStubMessageSequenceSuite();
  ipcCoreStubProtocolCoreSuite();
  ipcCoreStubRequestHandlingSuite();
  ipcCoreStubRequestLedgerSuite();
  ipcCoreStubStressSuite();
  ipcValidationDescriptorValidationSuite();
  ipcValidationInputValidationSuite();
  ipcValidationLifecycleValidationSuite();
  ipcValidationLogValidationSuite();
  ipcValidationPayloadValidationSuite();
  ipcValidationSessionValidationSuite();
  ipcValidationStateValidationSuite();
  ipcValidationWantValidationSuite();
  lifecycleStateOnConnectLifecycleSuite();
  lifecycleStateOnCreateLifecycleSuite();
  lifecycleStateOnDestroyLifecycleSuite();
  lifecycleStateOnDisconnectLifecycleSuite();
  lifecycleStateOnRequestLifecycleSuite();
  lifecycleStateReconnectLifecycleSuite();
  lifecycleStateResourceManagementSuite();
  lifecycleStateStatePersistenceSuite();
  performanceStabilityConcurrencyControlSuite();
  performanceStabilityLongTermStabilitySuite();
  performanceStabilityMemoryLeakDetectionSuite();
  performanceStabilityThroughputProfileSuite();
  regressionSnapshotRegressionSuite();
  resourceContractConstantContractSuite();
  rpcProtocolCursorContractSuite();
  rpcProtocolErrorCodeContractSuite();
  rpcProtocolOptionContractSuite();
  rpcProtocolProtocolCatalogSuite();
  rpcProtocolProtocolWorkflowSuite();
  rpcProtocolReplyContractSuite();
  rpcProtocolRequestCodeMatrixSuite();
  rpcProtocolUnknownCodeMatrixSuite();
  securityDescriptorSecuritySuite();
  securityLogSecuritySuite();
  securityPayloadSecuritySuite();
  securityStubSecuritySuite();
}
