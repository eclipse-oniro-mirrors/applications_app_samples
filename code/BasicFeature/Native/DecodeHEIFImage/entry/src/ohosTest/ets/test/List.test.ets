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

import waterFlowDataMatrixPart1Test from './WaterFlowDataMatrixPart1.test';
import waterFlowDataMatrixPart2Test from './WaterFlowDataMatrixPart2.test';
import taskpoolMatrixPart1Test from './TaskpoolMatrixPart1.test';
import flowOperationMatrixPart1Test from './FlowOperationMatrixPart1.test';
import flowOperationMatrixPart2Test from './FlowOperationMatrixPart2.test';
import flowOperationMatrixPart3Test from './FlowOperationMatrixPart3.test';
import flowOperationMatrixPart4Test from './FlowOperationMatrixPart4.test';
import flowOperationMatrixPart5Test from './FlowOperationMatrixPart5.test';
import flowOperationMatrixPart6Test from './FlowOperationMatrixPart6.test';
import flowOperationMatrixPart7Test from './FlowOperationMatrixPart7.test';
import flowSpliceMatrixPart1Test from './FlowSpliceMatrixPart1.test';
import flowSpliceMatrixPart2Test from './FlowSpliceMatrixPart2.test';
import listenerLifecycleMatrixPart1Test from './ListenerLifecycleMatrixPart1.test';
import listenerLifecycleMatrixPart2Test from './ListenerLifecycleMatrixPart2.test';
import notifyMatrixPart1Test from './NotifyMatrixPart1.test';
import imageInfoMatrixPart1Test from './ImageInfoMatrixPart1.test';
import taskpoolExtraMatrixPart1Test from './TaskpoolExtraMatrixPart1.test';

export default function testsuite() {
  abilityTest();
  waterFlowDataMatrixPart1Test();
  waterFlowDataMatrixPart2Test();
  taskpoolMatrixPart1Test();
  flowOperationMatrixPart1Test();
  flowOperationMatrixPart2Test();
  flowOperationMatrixPart3Test();
  flowOperationMatrixPart4Test();
  flowOperationMatrixPart5Test();
  flowOperationMatrixPart6Test();
  flowOperationMatrixPart7Test();
  flowSpliceMatrixPart1Test();
  flowSpliceMatrixPart2Test();
  listenerLifecycleMatrixPart1Test();
  listenerLifecycleMatrixPart2Test();
  notifyMatrixPart1Test();
  imageInfoMatrixPart1Test();
  taskpoolExtraMatrixPart1Test();
}