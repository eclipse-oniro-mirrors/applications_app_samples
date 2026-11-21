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

import abilityTest from './Ability.test';
import connectAgentExtensionValidationTest from './Model/Validation.test';
import connectAgentExtensionBoundaryTest from './Model/Boundary.test';
import connectAgentExtensionErrorCatalogTest from './Model/ErrorCatalog.test';
import connectAgentExtensionStateMachineTest from './Model/StateMachine.test';
import connectAgentExtensionBuilderTest from './Model/Builder.test';
import connectAgentExtensionIntegrationTest from './Model/Integration.test';
import connectAgentExtensionSecurityTest from './Model/Security.test';
import connectAgentExtensionMessagesTest from './Model/Messages.test';
import connectAgentExtensionPathRulesTest from './Model/PathRules.test';
import connectAgentExtensionWorkflowTest from './Model/Workflow.test';

// LOGIC_IMPORTS_BEGIN
import isValidBundleNameCoreTest from './logic/IsValidBundleName_Core.test';
import isValidBundleNameEdgeTest from './logic/IsValidBundleName_Edge.test';
import isValidBundleNameMatrixTest from './logic/IsValidBundleName_Matrix.test';
import isValidBundleNameStressTest from './logic/IsValidBundleName_Stress.test';
import isValidBundleNameExtendedTest from './logic/IsValidBundleName_Extended.test';
import isValidBundleNameBoundaryTest from './logic/IsValidBundleName_Boundary.test';
import isValidAbilityNameCoreTest from './logic/IsValidAbilityName_Core.test';
import isValidAbilityNameEdgeTest from './logic/IsValidAbilityName_Edge.test';
import isValidAbilityNameMatrixTest from './logic/IsValidAbilityName_Matrix.test';
import isValidAbilityNameStressTest from './logic/IsValidAbilityName_Stress.test';
import isValidAbilityNameExtendedTest from './logic/IsValidAbilityName_Extended.test';
import isValidAbilityNameBoundaryTest from './logic/IsValidAbilityName_Boundary.test';
import isValidAgentIdCoreTest from './logic/IsValidAgentId_Core.test';
import isValidAgentIdEdgeTest from './logic/IsValidAgentId_Edge.test';
import isValidAgentIdMatrixTest from './logic/IsValidAgentId_Matrix.test';
import isValidAgentIdStressTest from './logic/IsValidAgentId_Stress.test';
import isValidAgentIdExtendedTest from './logic/IsValidAgentId_Extended.test';
import isValidAgentIdBoundaryTest from './logic/IsValidAgentId_Boundary.test';
import isValidPayloadCoreTest from './logic/IsValidPayload_Core.test';
import isValidPayloadEdgeTest from './logic/IsValidPayload_Edge.test';
import isValidPayloadMatrixTest from './logic/IsValidPayload_Matrix.test';
import isValidPayloadStressTest from './logic/IsValidPayload_Stress.test';
import isValidPayloadExtendedTest from './logic/IsValidPayload_Extended.test';
import isValidPayloadBoundaryTest from './logic/IsValidPayload_Boundary.test';
import stateNameCoreTest from './logic/StateName_Core.test';
import stateNameEdgeTest from './logic/StateName_Edge.test';
import stateNameMatrixTest from './logic/StateName_Matrix.test';
import stateNameStressTest from './logic/StateName_Stress.test';
import canConnectCoreTest from './logic/CanConnect_Core.test';
import canConnectEdgeTest from './logic/CanConnect_Edge.test';
import canConnectMatrixTest from './logic/CanConnect_Matrix.test';
import canSendCoreTest from './logic/CanSend_Core.test';
import canSendEdgeTest from './logic/CanSend_Edge.test';
import canSendMatrixTest from './logic/CanSend_Matrix.test';
import canAuthorizeCoreTest from './logic/CanAuthorize_Core.test';
import canAuthorizeEdgeTest from './logic/CanAuthorize_Edge.test';
import canAuthorizeMatrixTest from './logic/CanAuthorize_Matrix.test';
import canDisconnectCoreTest from './logic/CanDisconnect_Core.test';
import canDisconnectEdgeTest from './logic/CanDisconnect_Edge.test';
import canDisconnectMatrixTest from './logic/CanDisconnect_Matrix.test';
import isConnectedCoreTest from './logic/IsConnected_Core.test';
import isConnectedEdgeTest from './logic/IsConnected_Edge.test';
import isConnectedMatrixTest from './logic/IsConnected_Matrix.test';
import eventNameCoreTest from './logic/EventName_Core.test';
import eventNameEdgeTest from './logic/EventName_Edge.test';
import eventNameMatrixTest from './logic/EventName_Matrix.test';
import eventNameStressTest from './logic/EventName_Stress.test';
import errorMessageCoreTest from './logic/ErrorMessage_Core.test';
import errorMessageEdgeTest from './logic/ErrorMessage_Edge.test';
import errorMessageMatrixTest from './logic/ErrorMessage_Matrix.test';
import errorMessageStressTest from './logic/ErrorMessage_Stress.test';
import isSuccessCodeCoreTest from './logic/IsSuccessCode_Core.test';
import isSuccessCodeEdgeTest from './logic/IsSuccessCode_Edge.test';
import isSuccessCodeMatrixTest from './logic/IsSuccessCode_Matrix.test';
import normalizePayloadCoreTest from './logic/NormalizePayload_Core.test';
import normalizePayloadEdgeTest from './logic/NormalizePayload_Edge.test';
import normalizePayloadMatrixTest from './logic/NormalizePayload_Matrix.test';
import agentIdLengthCoreTest from './logic/AgentIdLength_Core.test';
import agentIdLengthEdgeTest from './logic/AgentIdLength_Edge.test';
import agentIdLengthMatrixTest from './logic/AgentIdLength_Matrix.test';
import agentIdLengthStressTest from './logic/AgentIdLength_Stress.test';
// LOGIC_IMPORTS_END

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function testsuite(): void {
  const suites: Array<() => void> = [
    connectAgentExtensionValidationTest,
    connectAgentExtensionBoundaryTest,
    connectAgentExtensionErrorCatalogTest,
    connectAgentExtensionStateMachineTest,
    connectAgentExtensionBuilderTest,
    connectAgentExtensionIntegrationTest,
    connectAgentExtensionSecurityTest,
    connectAgentExtensionMessagesTest,
    connectAgentExtensionPathRulesTest,
    connectAgentExtensionWorkflowTest,
    isValidBundleNameCoreTest,
    isValidBundleNameEdgeTest,
    isValidBundleNameMatrixTest,
    isValidBundleNameStressTest,
    isValidBundleNameExtendedTest,
    isValidBundleNameBoundaryTest,
    isValidAbilityNameCoreTest,
    isValidAbilityNameEdgeTest,
    isValidAbilityNameMatrixTest,
    isValidAbilityNameStressTest,
    isValidAbilityNameExtendedTest,
    isValidAbilityNameBoundaryTest,
    isValidAgentIdCoreTest,
    isValidAgentIdEdgeTest,
    isValidAgentIdMatrixTest,
    isValidAgentIdStressTest,
    isValidAgentIdExtendedTest,
    isValidAgentIdBoundaryTest,
    isValidPayloadCoreTest,
    isValidPayloadEdgeTest,
    isValidPayloadMatrixTest,
    isValidPayloadStressTest,
    isValidPayloadExtendedTest,
    isValidPayloadBoundaryTest,
    stateNameCoreTest,
    stateNameEdgeTest,
    stateNameMatrixTest,
    stateNameStressTest,
    canConnectCoreTest,
    canConnectEdgeTest,
    canConnectMatrixTest,
    canSendCoreTest,
    canSendEdgeTest,
    canSendMatrixTest,
    canAuthorizeCoreTest,
    canAuthorizeEdgeTest,
    canAuthorizeMatrixTest,
    canDisconnectCoreTest,
    canDisconnectEdgeTest,
    canDisconnectMatrixTest,
    isConnectedCoreTest,
    isConnectedEdgeTest,
    isConnectedMatrixTest,
    eventNameCoreTest,
    eventNameEdgeTest,
    eventNameMatrixTest,
    eventNameStressTest,
    errorMessageCoreTest,
    errorMessageEdgeTest,
    errorMessageMatrixTest,
    errorMessageStressTest,
    isSuccessCodeCoreTest,
    isSuccessCodeEdgeTest,
    isSuccessCodeMatrixTest,
    normalizePayloadCoreTest,
    normalizePayloadEdgeTest,
    normalizePayloadMatrixTest,
    agentIdLengthCoreTest,
    agentIdLengthEdgeTest,
    agentIdLengthMatrixTest,
    agentIdLengthStressTest,
    abilityTest,
  ];
  const parameters: Record<string, string> = abilityDelegatorRegistry.getArguments().parameters;
  const batchValue: string | undefined = parameters['-s batch'];
  const batchesValue: string | undefined = parameters['-s batches'];
  const batch: number = batchValue === undefined ? -1 : parseInt(batchValue, 10);
  const batches: number = batchesValue === undefined ? 1 : parseInt(batchesValue, 10);
  if (batch < 0 || batches <= 1) {
    for (let i: number = 0; i < suites.length; i++) {
      suites[i]();
    }
    return;
  }
  const chunk: number = Math.ceil(suites.length / batches);
  const start: number = batch * chunk;
  const end: number = Math.min(start + chunk, suites.length);
  for (let i: number = start; i < end; i++) {
    suites[i]();
  }
}
