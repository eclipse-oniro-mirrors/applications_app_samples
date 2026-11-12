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

import motionApiContractTest from './MotionApiContract.test';
import motionUiMatrixTest from './MotionUiMatrix.test';
import motionApiRobustTest from './MotionApiRobust.test';
import motionApiInterleaveTest from './MotionApiInterleave.test';
import motionUiSequenceMatrixTest from './MotionUiSequenceMatrix.test';
import motionUiRepeatTest from './MotionUiRepeat.test';
import motionUiLabelTest from './MotionUiLabel.test';
import motionLifecycleTest from './MotionLifecycle.test';
import motionEnumCoreTest from './MotionEnumCore.test';
import motionApiShapeCoreTest from './MotionApiShapeCore.test';
import motionViewContractTest from './MotionViewContract.test';
import motionUiSupplementTest from './MotionUiSupplement.test';
import motionStateTransitionTest from './MotionStateTransition.test';
import motionApiOutcomeMatrixTest from './MotionApiOutcomeMatrix.test';
import motionApiBoundaryTest from './MotionApiBoundary.test';


export default function testsuite() {
  motionApiContractTest();
  motionUiMatrixTest();
  motionApiRobustTest();
  motionApiInterleaveTest();
  motionUiSequenceMatrixTest();
  motionUiRepeatTest();
  motionUiLabelTest();
  motionLifecycleTest();
  motionEnumCoreTest();
  motionApiShapeCoreTest();
  motionViewContractTest();
  motionUiSupplementTest();
  motionStateTransitionTest();
  motionApiOutcomeMatrixTest();
  motionApiBoundaryTest();
}