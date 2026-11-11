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

import AVRecorderLogic01Test from './AVRecorderLogicTest01.test';
import dateTimeUtilMatrixTest from './DateTimeUtilMatrix.test';
import cameraProfileSelectTest from './CameraProfileSelect.test';
import recorderFileDeviceTest from './RecorderFileDevice.test';
import recorderPrepareGuardTest from './RecorderPrepareGuard.test';
import dateTimeEdgeTest from './DateTimeEdge.test';
import cameraSelectionEdgeTest from './CameraSelectionEdge.test';
import recorderFileMatrixTest from './RecorderFileMatrix.test';
import recorderServiceLifecycleTest from './RecorderServiceLifecycle.test';
import dateTimeOracleTest from './DateTimeOracle.test';
import cameraSelectionInvariantTest from './CameraSelectionInvariant.test';
import recorderFileSequenceTest from './RecorderFileSequence.test';
import recorderServicePairTest from './RecorderServicePair.test';
import dateTimeFillWideTableTest from './DateTimeFillWideTable.test';
import shownTimerTableTest from './ShownTimerTable.test';
import dateTimeClockTableTest from './DateTimeClockTable.test';
import concatDateTableTest from './ConcatDateTable.test';
import concatTimeTableTest from './ConcatTimeTable.test';
import cameraProfileTableTest from './CameraProfileTable.test';
import dateTimeExtremeTableTest from './DateTimeExtremeTable.test';
import recorderFileContractTest from './RecorderFileContract.test';
import recorderServiceSequenceTest from './RecorderServiceSequence.test';

export default function testsuite() {
  AVRecorderLogic01Test();
  dateTimeUtilMatrixTest();
  cameraProfileSelectTest();
  recorderFileDeviceTest();
  recorderPrepareGuardTest();
  dateTimeEdgeTest();
  cameraSelectionEdgeTest();
  recorderFileMatrixTest();
  recorderServiceLifecycleTest();
  dateTimeOracleTest();
  cameraSelectionInvariantTest();
  recorderFileSequenceTest();
  recorderServicePairTest();
  dateTimeFillWideTableTest();
  shownTimerTableTest();
  dateTimeClockTableTest();
  concatDateTableTest();
  concatTimeTableTest();
  cameraProfileTableTest();
  dateTimeExtremeTableTest();
  recorderFileContractTest();
  recorderServiceSequenceTest();
}