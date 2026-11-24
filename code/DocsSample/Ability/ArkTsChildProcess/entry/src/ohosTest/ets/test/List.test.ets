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

// This suite is split into six registration batches. Registering all 3067
// cases in a single `aa test` run exceeds the device lifecycle/watchdog budget,
// so each run registers and executes exactly one batch, selected by the
// `-s batch <1..6>` parameter (default: batch 1). See run_tests_batched.ps1.

import { abilityDelegatorRegistry } from '@kit.TestKit';

// ===== Batch 1 imports (517 cases, 22 classes) =====
import arkTsChildProcessBoundaryTest from './Model/Boundary.test';
import arkTsChildProcessBuilderTest from './Model/Builder.test';
import arkTsChildProcessErrorCatalogTest from './Model/ErrorCatalog.test';
import arkTsChildProcessIntegrationTest from './Model/Integration.test';
import arkTsChildProcessMessagesTest from './Model/Messages.test';
import arkTsChildProcessPathRulesTest from './Model/PathRules.test';
import arkTsChildProcessSecurityTest from './Model/Security.test';
import arkTsChildProcessStateMachineTest from './Model/StateMachine.test';
import arkTsChildProcessValidationTest from './Model/Validation.test';
import arkTsChildProcessWorkflowTest from './Model/Workflow.test';
import canStartCoreTest from './logic/CanStart_Core.test';
import canStartEdgeTest from './logic/CanStart_Edge.test';
import canStartMatrixTest from './logic/CanStart_Matrix.test';
import canStopCoreTest from './logic/CanStop_Core.test';
import canStopEdgeTest from './logic/CanStop_Edge.test';
import canStopMatrixTest from './logic/CanStop_Matrix.test';
import countValidPidsCoreTest from './logic/CountValidPids_Core.test';
import countValidPidsEdgeTest from './logic/CountValidPids_Edge.test';
import describeResultCoreTest from './logic/DescribeResult_Core.test';
import describeResultEdgeTest from './logic/DescribeResult_Edge.test';
import errorMessageCoreTest from './logic/ErrorMessage_Core.test';
import abilityTest from './Ability.test';

// ===== Batch 2 imports (550 cases, 11 classes) =====
import errorMessageEdgeTest from './logic/ErrorMessage_Edge.test';
import errorMessageMatrixTest from './logic/ErrorMessage_Matrix.test';
import errorMessageStressTest from './logic/ErrorMessage_Stress.test';
import isArkTsProcessPathCoreTest from './logic/IsArkTsProcessPath_Core.test';
import isArkTsProcessPathEdgeTest from './logic/IsArkTsProcessPath_Edge.test';
import isArkTsProcessPathMatrixTest from './logic/IsArkTsProcessPath_Matrix.test';
import isArkTsProcessPathStressTest from './logic/IsArkTsProcessPath_Stress.test';
import isModuleProcessPathCoreTest from './logic/IsModuleProcessPath_Core.test';
import isModuleProcessPathEdgeTest from './logic/IsModuleProcessPath_Edge.test';
import isModuleProcessPathMatrixTest from './logic/IsModuleProcessPath_Matrix.test';
import isModuleProcessPathStressTest from './logic/IsModuleProcessPath_Stress.test';

// ===== Batch 3 imports (550 cases, 11 classes) =====
import isolationAllowedCoreTest from './logic/IsolationAllowed_Core.test';
import isolationAllowedEdgeTest from './logic/IsolationAllowed_Edge.test';
import isolationAllowedMatrixTest from './logic/IsolationAllowed_Matrix.test';
import isSameProcessCoreTest from './logic/IsSameProcess_Core.test';
import isSameProcessEdgeTest from './logic/IsSameProcess_Edge.test';
import isSuccessCodeCoreTest from './logic/IsSuccessCode_Core.test';
import isSuccessCodeEdgeTest from './logic/IsSuccessCode_Edge.test';
import isSuccessCodeMatrixTest from './logic/IsSuccessCode_Matrix.test';
import isValidEntryParamsCoreTest from './logic/IsValidEntryParams_Core.test';
import isValidEntryParamsEdgeTest from './logic/IsValidEntryParams_Edge.test';
import isValidEntryParamsMatrixTest from './logic/IsValidEntryParams_Matrix.test';

// ===== Batch 4 imports (550 cases, 11 classes) =====
import isValidEntryParamsStressTest from './logic/IsValidEntryParams_Stress.test';
import isValidFdValueCoreTest from './logic/IsValidFdValue_Core.test';
import isValidFdValueEdgeTest from './logic/IsValidFdValue_Edge.test';
import isValidFdValueMatrixTest from './logic/IsValidFdValue_Matrix.test';
import isValidPathCoreTest from './logic/IsValidPath_Core.test';
import isValidPathEdgeTest from './logic/IsValidPath_Edge.test';
import isValidPathExtendedTest from './logic/IsValidPath_Extended.test';
import isValidPathMatrixTest from './logic/IsValidPath_Matrix.test';
import isValidPathStressTest from './logic/IsValidPath_Stress.test';
import isValidPidCoreTest from './logic/IsValidPid_Core.test';
import isValidPidEdgeTest from './logic/IsValidPid_Edge.test';

// ===== Batch 5 imports (550 cases, 11 classes) =====
import isValidPidExtendedTest from './logic/IsValidPid_Extended.test';
import isValidPidMatrixTest from './logic/IsValidPid_Matrix.test';
import isValidPidStressTest from './logic/IsValidPid_Stress.test';
import isValidStartModeCoreTest from './logic/IsValidStartMode_Core.test';
import isValidStartModeEdgeTest from './logic/IsValidStartMode_Edge.test';
import isValidStartModeMatrixTest from './logic/IsValidStartMode_Matrix.test';
import isValidStartModeStressTest from './logic/IsValidStartMode_Stress.test';
import normalizeParamsCoreTest from './logic/NormalizeParams_Core.test';
import normalizeParamsEdgeTest from './logic/NormalizeParams_Edge.test';
import normalizeParamsMatrixTest from './logic/NormalizeParams_Matrix.test';
import retryDelayCoreTest from './logic/RetryDelay_Core.test';

// ===== Batch 6 imports (350 cases, 7 classes) =====
import retryDelayEdgeTest from './logic/RetryDelay_Edge.test';
import retryDelayMatrixTest from './logic/RetryDelay_Matrix.test';
import retryDelayStressTest from './logic/RetryDelay_Stress.test';
import stateNameCoreTest from './logic/StateName_Core.test';
import stateNameEdgeTest from './logic/StateName_Edge.test';
import stateNameMatrixTest from './logic/StateName_Matrix.test';
import stateNameStressTest from './logic/StateName_Stress.test';

// ===== Batch 1 registration (517 cases) =====
function registerBatch1(): void {
  arkTsChildProcessBoundaryTest();
  arkTsChildProcessBuilderTest();
  arkTsChildProcessErrorCatalogTest();
  arkTsChildProcessIntegrationTest();
  arkTsChildProcessMessagesTest();
  arkTsChildProcessPathRulesTest();
  arkTsChildProcessSecurityTest();
  arkTsChildProcessStateMachineTest();
  arkTsChildProcessValidationTest();
  arkTsChildProcessWorkflowTest();
  canStartCoreTest();
  canStartEdgeTest();
  canStartMatrixTest();
  canStopCoreTest();
  canStopEdgeTest();
  canStopMatrixTest();
  countValidPidsCoreTest();
  countValidPidsEdgeTest();
  describeResultCoreTest();
  describeResultEdgeTest();
  errorMessageCoreTest();
  abilityTest();
}

// ===== Batch 2 registration (550 cases) =====
function registerBatch2(): void {
  errorMessageEdgeTest();
  errorMessageMatrixTest();
  errorMessageStressTest();
  isArkTsProcessPathCoreTest();
  isArkTsProcessPathEdgeTest();
  isArkTsProcessPathMatrixTest();
  isArkTsProcessPathStressTest();
  isModuleProcessPathCoreTest();
  isModuleProcessPathEdgeTest();
  isModuleProcessPathMatrixTest();
  isModuleProcessPathStressTest();
}

// ===== Batch 3 registration (550 cases) =====
function registerBatch3(): void {
  isolationAllowedCoreTest();
  isolationAllowedEdgeTest();
  isolationAllowedMatrixTest();
  isSameProcessCoreTest();
  isSameProcessEdgeTest();
  isSuccessCodeCoreTest();
  isSuccessCodeEdgeTest();
  isSuccessCodeMatrixTest();
  isValidEntryParamsCoreTest();
  isValidEntryParamsEdgeTest();
  isValidEntryParamsMatrixTest();
}

// ===== Batch 4 registration (550 cases) =====
function registerBatch4(): void {
  isValidEntryParamsStressTest();
  isValidFdValueCoreTest();
  isValidFdValueEdgeTest();
  isValidFdValueMatrixTest();
  isValidPathCoreTest();
  isValidPathEdgeTest();
  isValidPathExtendedTest();
  isValidPathMatrixTest();
  isValidPathStressTest();
  isValidPidCoreTest();
  isValidPidEdgeTest();
}

// ===== Batch 5 registration (550 cases) =====
function registerBatch5(): void {
  isValidPidExtendedTest();
  isValidPidMatrixTest();
  isValidPidStressTest();
  isValidStartModeCoreTest();
  isValidStartModeEdgeTest();
  isValidStartModeMatrixTest();
  isValidStartModeStressTest();
  normalizeParamsCoreTest();
  normalizeParamsEdgeTest();
  normalizeParamsMatrixTest();
  retryDelayCoreTest();
}

// ===== Batch 6 registration (350 cases) =====
function registerBatch6(): void {
  retryDelayEdgeTest();
  retryDelayMatrixTest();
  retryDelayStressTest();
  stateNameCoreTest();
  stateNameEdgeTest();
  stateNameMatrixTest();
  stateNameStressTest();
}

function resolveBatch(): number {
  let batchNo: number = 1;
  try {
    let params: Record<string, string> = abilityDelegatorRegistry.getArguments().parameters;
    let raw: string = '';
    let keys: string[] = Object.keys(params);
    for (let index: number = 0; index < keys.length; index++) {
      let key: string = keys[index];
      if (key === 'batch' || key === '-s batch') {
        raw = params[key];
      }
    }
    if (raw !== '') {
      let parsed: number = parseInt(raw);
      if (!isNaN(parsed) && parsed >= 1 && parsed <= 6) {
        batchNo = parsed;
      }
    }
  } catch (err) {
    batchNo = 1;
  }
  return batchNo;
}

export default function testsuite(): void {
  let batchNo: number = resolveBatch();
  if (batchNo === 1) {
    registerBatch1();
  } else if (batchNo === 2) {
    registerBatch2();
  } else if (batchNo === 3) {
    registerBatch3();
  } else if (batchNo === 4) {
    registerBatch4();
  } else if (batchNo === 5) {
    registerBatch5();
  } else {
    registerBatch6();
  }
}
