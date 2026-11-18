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

import abilityTest from './QoSAbility.test';
import dialogTest from './NdkQosDialog.test';
import napiContractTest from './NdkQosNapiContract.test';
import qosEffectTest from './NdkQosQosEffect.test';
import capabilityTest from './NdkQosCapability.test';
import topologyTest from './NdkQosTopology.test';
import parseTest from './NdkQosRecordParse.test';
import recordFileTest from './NdkQosRecordFile.test';
import recordFileExtTest from './NdkQosRecordFileExt.test';
import levelArgsTest from './NdkQosLevelArgs.test';
import benchmarkTest from './NdkQosBenchmark.test';
import concurrentTest from './NdkQosConcurrent.test';
import compareTest from './NdkQosCompare.test';
import summaryTest from './NdkQosSummary.test';
import benchPageTest from './NdkQosBenchmarkPage.test';
import concurrencyPageTest from './NdkQosConcurrencyPage.test';
import devicePageTest from './NdkQosDevicePage.test';
import historyPageTest from './NdkQosHistoryPage.test';
import levelPageTest from './NdkQosLevelPageUI.test';
import navigationTest from './NdkQosNavigation.test';
import argTypeTest from './NdkQosArgTypes.test';
import resourceModelTest from './NdkQosResourceModel.test';
import invariantTest from './NdkQosInvariant.test';

export default function testsuite() {
  // Page level cases run before any QoS calculation starts the background load threads.
  abilityTest();
  dialogTest();
  napiContractTest();
  qosEffectTest();
  capabilityTest();
  topologyTest();
  parseTest();
  recordFileTest();
  recordFileExtTest();
  levelArgsTest();
  benchmarkTest();
  concurrentTest();
  compareTest();
  summaryTest();
  benchPageTest();
  concurrencyPageTest();
  devicePageTest();
  historyPageTest();
  levelPageTest();
  navigationTest();
  // The argument, model and invariant suites drive real native runs, so they stay behind the page cases.
  argTypeTest();
  resourceModelTest();
  invariantTest();
}
