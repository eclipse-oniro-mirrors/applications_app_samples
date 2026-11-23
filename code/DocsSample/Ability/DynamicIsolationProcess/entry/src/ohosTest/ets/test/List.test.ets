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
import dynamicIsolationProcessValidationTest from './Model/Validation.test';
import dynamicIsolationProcessBoundaryTest from './Model/Boundary.test';
import dynamicIsolationProcessErrorCatalogTest from './Model/ErrorCatalog.test';
import dynamicIsolationProcessStateMachineTest from './Model/StateMachine.test';
import dynamicIsolationProcessBuilderTest from './Model/Builder.test';
import dynamicIsolationProcessIntegrationTest from './Model/Integration.test';
import dynamicIsolationProcessSecurityTest from './Model/Security.test';
import dynamicIsolationProcessMessagesTest from './Model/Messages.test';
import dynamicIsolationProcessPathRulesTest from './Model/PathRules.test';
import dynamicIsolationProcessWorkflowTest from './Model/Workflow.test';

// LOGIC_IMPORTS_BEGIN
import isValidBundleNameCoreTest from './logic/IsValidBundleName_Core.test';
import isValidBundleNameEdgeTest from './logic/IsValidBundleName_Edge.test';
import isValidBundleNameMatrixTest from './logic/IsValidBundleName_Matrix.test';
import isValidBundleNameStressTest from './logic/IsValidBundleName_Stress.test';
import isValidBundleNameExtendedTest from './logic/IsValidBundleName_Extended.test';
import isValidBundleNameBoundaryTest from './logic/IsValidBundleName_Boundary.test';
import isValidModuleCoreTest from './logic/IsValidModule_Core.test';
import isValidModuleEdgeTest from './logic/IsValidModule_Edge.test';
import isValidModuleMatrixTest from './logic/IsValidModule_Matrix.test';
import isValidModuleStressTest from './logic/IsValidModule_Stress.test';
import isValidModuleExtendedTest from './logic/IsValidModule_Extended.test';
import isValidAbilityNameCoreTest from './logic/IsValidAbilityName_Core.test';
import isValidAbilityNameEdgeTest from './logic/IsValidAbilityName_Edge.test';
import isValidAbilityNameMatrixTest from './logic/IsValidAbilityName_Matrix.test';
import isValidAbilityNameStressTest from './logic/IsValidAbilityName_Stress.test';
import isValidIsolationKeyCoreTest from './logic/IsValidIsolationKey_Core.test';
import isValidIsolationKeyEdgeTest from './logic/IsValidIsolationKey_Edge.test';
import isValidIsolationKeyMatrixTest from './logic/IsValidIsolationKey_Matrix.test';
import isValidIsolationKeyStressTest from './logic/IsValidIsolationKey_Stress.test';
import isValidIsolationKeyExtendedTest from './logic/IsValidIsolationKey_Extended.test';
import isValidIsolationKeyBoundaryTest from './logic/IsValidIsolationKey_Boundary.test';
import composeProcessNameCoreTest from './logic/ComposeProcessName_Core.test';
import composeProcessNameEdgeTest from './logic/ComposeProcessName_Edge.test';
import composeProcessNameMatrixTest from './logic/ComposeProcessName_Matrix.test';
import composeProcessNameStressTest from './logic/ComposeProcessName_Stress.test';
import normalizeKeyCoreTest from './logic/NormalizeKey_Core.test';
import normalizeKeyEdgeTest from './logic/NormalizeKey_Edge.test';
import normalizeKeyMatrixTest from './logic/NormalizeKey_Matrix.test';
import isSameProcessNameCoreTest from './logic/IsSameProcessName_Core.test';
import isSameProcessNameEdgeTest from './logic/IsSameProcessName_Edge.test';
import isSameProcessNameMatrixTest from './logic/IsSameProcessName_Matrix.test';
import stateNameCoreTest from './logic/StateName_Core.test';
import stateNameEdgeTest from './logic/StateName_Edge.test';
import stateNameMatrixTest from './logic/StateName_Matrix.test';
import stateNameStressTest from './logic/StateName_Stress.test';
import stateNameExtendedTest from './logic/StateName_Extended.test';
import canStartCoreTest from './logic/CanStart_Core.test';
import canStartEdgeTest from './logic/CanStart_Edge.test';
import canStartMatrixTest from './logic/CanStart_Matrix.test';
import describeErrorCoreTest from './logic/DescribeError_Core.test';
import describeErrorEdgeTest from './logic/DescribeError_Edge.test';
import describeErrorMatrixTest from './logic/DescribeError_Matrix.test';
import errorMessageCoreTest from './logic/ErrorMessage_Core.test';
import errorMessageEdgeTest from './logic/ErrorMessage_Edge.test';
import errorMessageMatrixTest from './logic/ErrorMessage_Matrix.test';
import errorMessageStressTest from './logic/ErrorMessage_Stress.test';
import errorMessageExtendedTest from './logic/ErrorMessage_Extended.test';
import isSuccessCodeCoreTest from './logic/IsSuccessCode_Core.test';
import isSuccessCodeEdgeTest from './logic/IsSuccessCode_Edge.test';
import isSuccessCodeMatrixTest from './logic/IsSuccessCode_Matrix.test';
import isValidContextKeyCoreTest from './logic/IsValidContextKey_Core.test';
import isValidContextKeyEdgeTest from './logic/IsValidContextKey_Edge.test';
import isValidContextKeyMatrixTest from './logic/IsValidContextKey_Matrix.test';
import abilityLifecycleIndexCoreTest from './logic/AbilityLifecycleIndex_Core.test';
import abilityLifecycleIndexEdgeTest from './logic/AbilityLifecycleIndex_Edge.test';
import abilityLifecycleIndexMatrixTest from './logic/AbilityLifecycleIndex_Matrix.test';
import abilityLifecycleIndexStressTest from './logic/AbilityLifecycleIndex_Stress.test';
import describeIsolationCoreTest from './logic/DescribeIsolation_Core.test';
import describeIsolationEdgeTest from './logic/DescribeIsolation_Edge.test';
import describeIsolationMatrixTest from './logic/DescribeIsolation_Matrix.test';
import describeIsolationStressTest from './logic/DescribeIsolation_Stress.test';
// LOGIC_IMPORTS_END

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function testsuite(): void {
  const suites: Array<() => void> = [
    dynamicIsolationProcessValidationTest,
    dynamicIsolationProcessBoundaryTest,
    dynamicIsolationProcessErrorCatalogTest,
    dynamicIsolationProcessStateMachineTest,
    dynamicIsolationProcessBuilderTest,
    dynamicIsolationProcessIntegrationTest,
    dynamicIsolationProcessSecurityTest,
    dynamicIsolationProcessMessagesTest,
    dynamicIsolationProcessPathRulesTest,
    dynamicIsolationProcessWorkflowTest,
    isValidBundleNameCoreTest,
    isValidBundleNameEdgeTest,
    isValidBundleNameMatrixTest,
    isValidBundleNameStressTest,
    isValidBundleNameExtendedTest,
    isValidBundleNameBoundaryTest,
    isValidModuleCoreTest,
    isValidModuleEdgeTest,
    isValidModuleMatrixTest,
    isValidModuleStressTest,
    isValidModuleExtendedTest,
    isValidAbilityNameCoreTest,
    isValidAbilityNameEdgeTest,
    isValidAbilityNameMatrixTest,
    isValidAbilityNameStressTest,
    isValidIsolationKeyCoreTest,
    isValidIsolationKeyEdgeTest,
    isValidIsolationKeyMatrixTest,
    isValidIsolationKeyStressTest,
    isValidIsolationKeyExtendedTest,
    isValidIsolationKeyBoundaryTest,
    composeProcessNameCoreTest,
    composeProcessNameEdgeTest,
    composeProcessNameMatrixTest,
    composeProcessNameStressTest,
    normalizeKeyCoreTest,
    normalizeKeyEdgeTest,
    normalizeKeyMatrixTest,
    isSameProcessNameCoreTest,
    isSameProcessNameEdgeTest,
    isSameProcessNameMatrixTest,
    stateNameCoreTest,
    stateNameEdgeTest,
    stateNameMatrixTest,
    stateNameStressTest,
    stateNameExtendedTest,
    canStartCoreTest,
    canStartEdgeTest,
    canStartMatrixTest,
    describeErrorCoreTest,
    describeErrorEdgeTest,
    describeErrorMatrixTest,
    errorMessageCoreTest,
    errorMessageEdgeTest,
    errorMessageMatrixTest,
    errorMessageStressTest,
    errorMessageExtendedTest,
    isSuccessCodeCoreTest,
    isSuccessCodeEdgeTest,
    isSuccessCodeMatrixTest,
    isValidContextKeyCoreTest,
    isValidContextKeyEdgeTest,
    isValidContextKeyMatrixTest,
    abilityLifecycleIndexCoreTest,
    abilityLifecycleIndexEdgeTest,
    abilityLifecycleIndexMatrixTest,
    abilityLifecycleIndexStressTest,
    describeIsolationCoreTest,
    describeIsolationEdgeTest,
    describeIsolationMatrixTest,
    describeIsolationStressTest,
    abilityTest,
  ];
  let parameters: Record<string, string> | null = null;
  try {
    const args = abilityDelegatorRegistry.getArguments();
    if (args !== null && args !== undefined && args.parameters !== null && args.parameters !== undefined) {
      parameters = args.parameters;
    }
  } catch (err) {
    parameters = null;
  }
  // TestAbility.onCreate may invoke the suite without delegator arguments; only aa test carries them.
  if (parameters === null) {
    return;
  }
  const batchValue: string | undefined = parameters['-s batch'] ?? parameters['batch'];
  const batchesValue: string | undefined = parameters['-s batches'] ?? parameters['batches'];
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
