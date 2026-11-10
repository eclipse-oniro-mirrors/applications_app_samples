/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import abilityTest from './abilityTest.test';
import stationaryManifestTest from './StationaryManifest.test';
import stationaryApiContractTest from './StationaryApiContract.test';
import stationaryApiRobustTest from './StationaryApiRobust.test';
import stationaryApiInterleaveTest from './StationaryApiInterleave.test';
import stationaryUiMatrixTest from './StationaryUiMatrix.test';
import stationaryUiSequenceMatrixTest from './StationaryUiSequenceMatrix.test';
import stationaryUiRepeatTest from './StationaryUiRepeat.test';
import stationaryUiLabelTest from './StationaryUiLabel.test';
import stationaryPerfTest from './StationaryPerf.test';
import stationaryLifecycleTest from './StationaryLifecycle.test';
import stationaryAbilityContractTest from './StationaryAbilityContract.test';
import stationaryAppContextTest from './StationaryAppContext.test';

export default function testsuite() {
  abilityTest();
  stationaryManifestTest();
  stationaryApiContractTest();
  stationaryApiRobustTest();
  stationaryApiInterleaveTest();
  stationaryUiMatrixTest();
  stationaryUiSequenceMatrixTest();
  stationaryUiRepeatTest();
  stationaryUiLabelTest();
  stationaryPerfTest();
  stationaryLifecycleTest();
  stationaryAbilityContractTest();
  stationaryAppContextTest();
}