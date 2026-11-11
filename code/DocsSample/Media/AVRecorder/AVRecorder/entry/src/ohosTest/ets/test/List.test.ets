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

import avRecorderDateTimeCoreTest from './AVRecorderDateTimeCore.test';
import avRecorderTimerCoreTest from './AVRecorderTimerCore.test';
import avRecorderResolutionCoreTest from './AVRecorderResolutionCore.test';
import avRecorderStateGuardCoreTest from './AVRecorderStateGuardCore.test';
import avRecorderConfigCoreTest from './AVRecorderConfigCore.test';
import avRecorderFileNamingCoreTest from './AVRecorderFileNamingCore.test';

import avRecorderStateMatrixTest from './AVRecorderStateMatrix.test';
import avRecorderConfigMatrixTest from './AVRecorderConfigMatrix.test';
import avRecorderCameraContractTest from './AVRecorderCameraContract.test';
import avRecorderPageContractTest from './AVRecorderPageContract.test';
import avRecorderTimerEdgeTest from './AVRecorderTimerEdge.test';
import avRecorderFileNamingEdgeTest from './AVRecorderFileNamingEdge.test';
import avRecorderServiceContractTest from './AVRecorderServiceContract.test';
import avRecorderUiSettingsContractTest from './AVRecorderUiSettingsContract.test';

import avRecorderServiceNoopTest from './AVRecorderServiceNoop.test';
import avRecorderFileUtilIntegrationTest from './AVRecorderFileUtilIntegration.test';
import avRecorderCameraSelectionTest from './AVRecorderCameraSelection.test';
import avRecorderUiFlowCoreTest from './AVRecorderUiFlowCore.test';

import avRecorderCameraNDKSelectionTest from './AVRecorderCameraNDKSelection.test';
import avRecorderPageStateCoreTest from './AVRecorderPageStateCore.test';
import avRecorderFileNamingMatrixTest from './AVRecorderFileNamingMatrix.test';
import avRecorderTimeBoundaryTest from './AVRecorderTimeBoundary.test';
import avRecorderNdkPageContractTest from './AVRecorderNdkPageContract.test';

import avRecorderFileUtilFilesTest from './AVRecorderFileUtilFiles.test';
import avRecorderDurationStateCoreTest from './AVRecorderDurationStateCore.test';
import avRecorderTimeNamingEdgeTest from './AVRecorderTimeNamingEdge.test';

import avRecorderSettingsUiTest from './AVRecorderSettingsUi.test';
import avRecorderNdkUiTest from './AVRecorderNdkUi.test';

import avRecorderCameraServiceNoopTest from './AVRecorderCameraServiceNoop.test';
import avRecorderCameraNDKNoopTest from './AVRecorderCameraNDKNoop.test';
import avRecorderPageSettingsCoreTest from './AVRecorderPageSettingsCore.test';
import avRecorderFileOutputMatrixTest from './AVRecorderFileOutputMatrix.test';
import avRecorderUiContractsTest from './AVRecorderUiContracts.test';

import avRecorderServiceIntegrationTest from './AVRecorderServiceIntegration.test';
import avRecorderCameraIntegrationTest from './AVRecorderCameraIntegration.test';
import avRecorderErrorPathsTest from './AVRecorderErrorPaths.test';

import avRecorderFormatContractTest from './AVRecorderFormatContract.test';
import avRecorderPermissionContractTest from './AVRecorderPermissionContract.test';
import avRecorderUiFlowModelTest from './AVRecorderUiFlowModel.test';

import avRecorderRecordingFlowCoreTest from './AVRecorderRecordingFlowCore.test';
import avRecorderErrorRecoveryCoreTest from './AVRecorderErrorRecoveryCore.test';
import avRecorderFileValidationCoreTest from './AVRecorderFileValidationCore.test';

export default function testsuite(): void {
  abilityTest();
  avRecorderDateTimeCoreTest();
  avRecorderTimerCoreTest();
  avRecorderResolutionCoreTest();
  avRecorderStateGuardCoreTest();
  avRecorderConfigCoreTest();
  avRecorderFileNamingCoreTest();
  avRecorderStateMatrixTest();
  avRecorderConfigMatrixTest();
  avRecorderCameraContractTest();
  avRecorderPageContractTest();
  avRecorderTimerEdgeTest();
  avRecorderFileNamingEdgeTest();
  avRecorderServiceContractTest();
  avRecorderUiSettingsContractTest();
  avRecorderServiceNoopTest();
  avRecorderFileUtilIntegrationTest();
  avRecorderCameraSelectionTest();
  avRecorderUiFlowCoreTest();
  avRecorderCameraNDKSelectionTest();
  avRecorderPageStateCoreTest();
  avRecorderFileNamingMatrixTest();
  avRecorderTimeBoundaryTest();
  avRecorderNdkPageContractTest();
  avRecorderFileUtilFilesTest();
  avRecorderDurationStateCoreTest();
  avRecorderTimeNamingEdgeTest();
  avRecorderSettingsUiTest();
  avRecorderNdkUiTest();
  avRecorderCameraServiceNoopTest();
  avRecorderCameraNDKNoopTest();
  avRecorderPageSettingsCoreTest();
  avRecorderFileOutputMatrixTest();
  avRecorderUiContractsTest();
  avRecorderServiceIntegrationTest();
  avRecorderCameraIntegrationTest();
  avRecorderErrorPathsTest();
  avRecorderFormatContractTest();
  avRecorderPermissionContractTest();
  avRecorderUiFlowModelTest();
  avRecorderRecordingFlowCoreTest();
  avRecorderErrorRecoveryCoreTest();
  avRecorderFileValidationCoreTest();
}