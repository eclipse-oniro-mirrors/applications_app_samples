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
import behaviorTest from './Behavior.test';
import sequenceMatrixTest from './SequenceMatrix.test';
import boundaryMatrixTest from './BoundaryMatrix.test';
import sequenceLength7Test from './SequenceLength7.test';
import boundaryExtendedTest from './BoundaryExtended.test';
import uiStabilityTest from './UiStability.test';
import sequenceLength8Test from './SequenceLength8.test';
import sequenceLength9ATest from './SequenceLength9A.test';
import sequenceLength9BTest from './SequenceLength9B.test';
import sequenceLength10Test from './SequenceLength10.test';
import sequenceLength10BTest from './SequenceLength10B.test';
import sequenceLength10CTest from './SequenceLength10C.test';

export default function testsuite() {
  abilityTest();
  behaviorTest();
  sequenceMatrixTest();
  boundaryMatrixTest();
  sequenceLength7Test();
  boundaryExtendedTest();
  uiStabilityTest();
  sequenceLength8Test();
  sequenceLength9ATest();
  sequenceLength9BTest();
  sequenceLength10Test();
  sequenceLength10BTest();
  sequenceLength10CTest();
}