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
import cliInvocationValidationTest from './Model/Validation.test';
import cliInvocationBoundaryTest from './Model/Boundary.test';
import cliInvocationErrorCatalogTest from './Model/ErrorCatalog.test';
import cliInvocationStateMachineTest from './Model/StateMachine.test';
import cliInvocationBuilderTest from './Model/Builder.test';
import cliInvocationIntegrationTest from './Model/Integration.test';
import cliInvocationSecurityTest from './Model/Security.test';
import cliInvocationMessagesTest from './Model/Messages.test';
import cliInvocationPathRulesTest from './Model/PathRules.test';
import cliInvocationWorkflowTest from './Model/Workflow.test';

// LOGIC_IMPORTS_BEGIN
import isValidNameCoreTest from './logic/IsValidName_Core.test';
import isValidNameEdgeTest from './logic/IsValidName_Edge.test';
import isValidNameMatrixTest from './logic/IsValidName_Matrix.test';
import isValidNameStressTest from './logic/IsValidName_Stress.test';
import isValidNameExtendedTest from './logic/IsValidName_Extended.test';
import isValidNameBoundaryTest from './logic/IsValidName_Boundary.test';
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
import isValidExitCodeCoreTest from './logic/IsValidExitCode_Core.test';
import isValidExitCodeEdgeTest from './logic/IsValidExitCode_Edge.test';
import isValidExitCodeMatrixTest from './logic/IsValidExitCode_Matrix.test';
import isValidExitCodeStressTest from './logic/IsValidExitCode_Stress.test';
import isSuccessCodeCoreTest from './logic/IsSuccessCode_Core.test';
import isSuccessCodeEdgeTest from './logic/IsSuccessCode_Edge.test';
import isSuccessCodeMatrixTest from './logic/IsSuccessCode_Matrix.test';
import isForkFailureCoreTest from './logic/IsForkFailure_Core.test';
import isForkFailureEdgeTest from './logic/IsForkFailure_Edge.test';
import isForkFailureMatrixTest from './logic/IsForkFailure_Matrix.test';
import isExecFailureCoreTest from './logic/IsExecFailure_Core.test';
import isExecFailureEdgeTest from './logic/IsExecFailure_Edge.test';
import isExecFailureMatrixTest from './logic/IsExecFailure_Matrix.test';
import exitMessageKeyCoreTest from './logic/ExitMessageKey_Core.test';
import exitMessageKeyEdgeTest from './logic/ExitMessageKey_Edge.test';
import exitMessageKeyMatrixTest from './logic/ExitMessageKey_Matrix.test';
import exitMessageKeyStressTest from './logic/ExitMessageKey_Stress.test';
import exitMessageCoreTest from './logic/ExitMessage_Core.test';
import exitMessageEdgeTest from './logic/ExitMessage_Edge.test';
import isSafeArgCoreTest from './logic/IsSafeArg_Core.test';
import isSafeArgEdgeTest from './logic/IsSafeArg_Edge.test';
import isSafeArgMatrixTest from './logic/IsSafeArg_Matrix.test';
import isSafeArgStressTest from './logic/IsSafeArg_Stress.test';
import isSafeArgExtendedTest from './logic/IsSafeArg_Extended.test';
import isSafeArgBoundaryTest from './logic/IsSafeArg_Boundary.test';
import decodeWaitStatusCoreTest from './logic/DecodeWaitStatus_Core.test';
import decodeWaitStatusEdgeTest from './logic/DecodeWaitStatus_Edge.test';
import decodeWaitStatusMatrixTest from './logic/DecodeWaitStatus_Matrix.test';
import decodeWaitStatusStressTest from './logic/DecodeWaitStatus_Stress.test';
import normalizeBundleCoreTest from './logic/NormalizeBundle_Core.test';
import normalizeBundleEdgeTest from './logic/NormalizeBundle_Edge.test';
import normalizeBundleMatrixTest from './logic/NormalizeBundle_Matrix.test';
import formatCommandCoreTest from './logic/FormatCommand_Core.test';
import formatCommandEdgeTest from './logic/FormatCommand_Edge.test';
import commandSummaryCoreTest from './logic/CommandSummary_Core.test';
import commandSummaryEdgeTest from './logic/CommandSummary_Edge.test';
import argCountCoreTest from './logic/ArgCount_Core.test';
import argCountEdgeTest from './logic/ArgCount_Edge.test';
import hasOptionCoreTest from './logic/HasOption_Core.test';
import hasOptionEdgeTest from './logic/HasOption_Edge.test';
import optionValueCoreTest from './logic/OptionValue_Core.test';
import optionValueEdgeTest from './logic/OptionValue_Edge.test';
import optionValueMatrixTest from './logic/OptionValue_Matrix.test';
// LOGIC_IMPORTS_END

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

function resolveBatch(): number {
  let batchNo: number = 0;
  try {
    const parameters: Record<string, string> = abilityDelegatorRegistry.getArguments().parameters;
    let raw: string = '';
    const keys: string[] = Object.keys(parameters);
    for (let index: number = 0; index < keys.length; index++) {
      const key: string = keys[index];
      if (key === 'batch' || key === '-s batch') {
        raw = parameters[key];
      }
    }
    if (raw !== '') {
      const parsed: number = parseInt(raw, 10);
      if (!isNaN(parsed) && parsed >= 1 && parsed <= 6) {
        batchNo = parsed;
      }
    }
  } catch (err) {
    batchNo = 0;
  }
  return batchNo;
}

export default function testsuite(): void {
  const suites: Array<() => void> = [
    cliInvocationValidationTest,
    cliInvocationBoundaryTest,
    cliInvocationErrorCatalogTest,
    cliInvocationStateMachineTest,
    cliInvocationBuilderTest,
    cliInvocationIntegrationTest,
    cliInvocationSecurityTest,
    cliInvocationMessagesTest,
    cliInvocationPathRulesTest,
    cliInvocationWorkflowTest,
    isValidNameCoreTest,
    isValidNameEdgeTest,
    isValidNameMatrixTest,
    isValidNameStressTest,
    isValidNameExtendedTest,
    isValidNameBoundaryTest,
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
    isValidExitCodeCoreTest,
    isValidExitCodeEdgeTest,
    isValidExitCodeMatrixTest,
    isValidExitCodeStressTest,
    isSuccessCodeCoreTest,
    isSuccessCodeEdgeTest,
    isSuccessCodeMatrixTest,
    isForkFailureCoreTest,
    isForkFailureEdgeTest,
    isForkFailureMatrixTest,
    isExecFailureCoreTest,
    isExecFailureEdgeTest,
    isExecFailureMatrixTest,
    exitMessageKeyCoreTest,
    exitMessageKeyEdgeTest,
    exitMessageKeyMatrixTest,
    exitMessageKeyStressTest,
    exitMessageCoreTest,
    exitMessageEdgeTest,
    isSafeArgCoreTest,
    isSafeArgEdgeTest,
    isSafeArgMatrixTest,
    isSafeArgStressTest,
    isSafeArgExtendedTest,
    isSafeArgBoundaryTest,
    decodeWaitStatusCoreTest,
    decodeWaitStatusEdgeTest,
    decodeWaitStatusMatrixTest,
    decodeWaitStatusStressTest,
    normalizeBundleCoreTest,
    normalizeBundleEdgeTest,
    normalizeBundleMatrixTest,
    formatCommandCoreTest,
    formatCommandEdgeTest,
    commandSummaryCoreTest,
    commandSummaryEdgeTest,
    argCountCoreTest,
    argCountEdgeTest,
    hasOptionCoreTest,
    hasOptionEdgeTest,
    optionValueCoreTest,
    optionValueEdgeTest,
    optionValueMatrixTest,
    abilityTest,
  ];
  const batchNo: number = resolveBatch();
  let start: number = 0;
  let end: number = suites.length;
  if (batchNo === 1) {
    end = 19;
  } else if (batchNo === 2) {
    start = 19;
    end = 30;
  } else if (batchNo === 3) {
    start = 30;
    end = 41;
  } else if (batchNo === 4) {
    start = 41;
    end = 52;
  } else if (batchNo === 5) {
    start = 52;
    end = 63;
  } else if (batchNo === 6) {
    start = 63;
    end = 71;
  }
  for (let i: number = start; i < end; i++) {
    suites[i]();
  }
}
