/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import serviceManagerPathTest from './ServiceManagerPath.test';
import opServiceManagerPathTest from './OpServiceManagerPath.test';
import importIsolationTest from './ImportIsolation.test';
import apiContractTest from './ApiContract.test';
import stateTransitionTest from './StateTransition.test';
import opStateParityTest from './OpStateParity.test';
import stabilityLoopTest from './StabilityLoop.test';
import stabilityExtendedTest from './StabilityExtended.test';
import perfBudgetTest from './PerfBudget.test';
import perfScalingTest from './PerfScaling.test';
import perfThroughputTest from './PerfThroughput.test';
import abilityTest from './Ability.test';
import uiStateMatrixTest from './UiStateMatrix.test';

import stateSequenceMatrixPart01Test from './StateSequenceMatrixPart01.test';
import stateSequenceMatrixPart02Test from './StateSequenceMatrixPart02.test';
import stateSequenceMatrixPart03Test from './StateSequenceMatrixPart03.test';
import stateSequenceMatrixPart04Test from './StateSequenceMatrixPart04.test';
import stateSequenceMatrixPart05Test from './StateSequenceMatrixPart05.test';
import stateSequenceMatrixPart06Test from './StateSequenceMatrixPart06.test';
import stateSequenceMatrixPart07Test from './StateSequenceMatrixPart07.test';
import stateSequenceMatrixPart08Test from './StateSequenceMatrixPart08.test';
import stateSequenceMatrixPart09Test from './StateSequenceMatrixPart09.test';
import stateSequenceMatrixPart10Test from './StateSequenceMatrixPart10.test';
import stateSequenceMatrixPart11Test from './StateSequenceMatrixPart11.test';
import stateSequenceMatrixPart12Test from './StateSequenceMatrixPart12.test';
import stateSequenceMatrixPart13Test from './StateSequenceMatrixPart13.test';
import stateSequenceMatrixPart14Test from './StateSequenceMatrixPart14.test';
import stateSequenceMatrixPart15Test from './StateSequenceMatrixPart15.test';

export default function testsuite() {
  serviceManagerPathTest();
  opServiceManagerPathTest();
  importIsolationTest();
  apiContractTest();
  stateTransitionTest();
  opStateParityTest();
  stabilityLoopTest();
  stabilityExtendedTest();
  perfBudgetTest();
  perfScalingTest();
  perfThroughputTest();
  abilityTest();
  uiStateMatrixTest();

  stateSequenceMatrixPart01Test();
  stateSequenceMatrixPart02Test();
  stateSequenceMatrixPart03Test();
  stateSequenceMatrixPart04Test();
  stateSequenceMatrixPart05Test();
  stateSequenceMatrixPart06Test();
  stateSequenceMatrixPart07Test();
  stateSequenceMatrixPart08Test();
  stateSequenceMatrixPart09Test();
  stateSequenceMatrixPart10Test();
  stateSequenceMatrixPart11Test();
  stateSequenceMatrixPart12Test();
  stateSequenceMatrixPart13Test();
  stateSequenceMatrixPart14Test();
  stateSequenceMatrixPart15Test();
}