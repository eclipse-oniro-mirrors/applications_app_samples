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
import avRecorderFileNamingCoreTest from './AVRecorderFileNamingCore.test';

import avRecorderTimerEdgeTest from './AVRecorderTimerEdge.test';
import avRecorderFileNamingEdgeTest from './AVRecorderFileNamingEdge.test';

import avRecorderFileUtilIntegrationTest from './AVRecorderFileUtilIntegration.test';
import avRecorderCameraSelectionTest from './AVRecorderCameraSelection.test';

import avRecorderCameraNativeSelectionTest from './AVRecorderCameraNativeSelection.test';
import avRecorderFileNamingMatrixTest from './AVRecorderFileNamingMatrix.test';
import avRecorderTimeBoundaryTest from './AVRecorderTimeBoundary.test';

import avRecorderFileUtilFilesTest from './AVRecorderFileUtilFiles.test';
import avRecorderDurationStateCoreTest from './AVRecorderDurationStateCore.test';
import avRecorderTimeNamingEdgeTest from './AVRecorderTimeNamingEdge.test';

import avRecorderSettingsUiTest from './AVRecorderSettingsUi.test';
import avRecorderNativeUiTest from './AVRecorderNativeUi.test';

import avRecorderCameraServiceNoopTest from './AVRecorderCameraServiceNoop.test';
import avRecorderCameraNativeNoopTest from './AVRecorderCameraNativeNoop.test';
import avRecorderFileOutputMatrixTest from './AVRecorderFileOutputMatrix.test';

import avRecorderServiceIntegrationTest from './AVRecorderServiceIntegration.test';
import avRecorderCameraIntegrationTest from './AVRecorderCameraIntegration.test';
import avRecorderErrorPathsTest from './AVRecorderErrorPaths.test';



export default function testsuite(): void {
  abilityTest();
  avRecorderDateTimeCoreTest();
  avRecorderTimerCoreTest();
  avRecorderResolutionCoreTest();
  avRecorderFileNamingCoreTest();
  avRecorderTimerEdgeTest();
  avRecorderFileNamingEdgeTest();
  avRecorderFileUtilIntegrationTest();
  avRecorderCameraSelectionTest();
  avRecorderCameraNativeSelectionTest();
  avRecorderFileNamingMatrixTest();
  avRecorderTimeBoundaryTest();
  avRecorderFileUtilFilesTest();
  avRecorderDurationStateCoreTest();
  avRecorderTimeNamingEdgeTest();
  avRecorderSettingsUiTest();
  avRecorderNativeUiTest();
  avRecorderCameraServiceNoopTest();
  avRecorderCameraNativeNoopTest();
  avRecorderFileOutputMatrixTest();
  avRecorderServiceIntegrationTest();
  avRecorderCameraIntegrationTest();
  avRecorderErrorPathsTest();
}