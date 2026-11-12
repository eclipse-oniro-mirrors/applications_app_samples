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

import controllerResetCoreTest from './ControllerResetCore.test';
import controllerResetExtendedTest from './ControllerResetExtended.test';
import controllerResetAdvancedTest from './ControllerResetAdvanced.test';
import controllerResetTailTest from './ControllerResetTail.test';
import controllerResultCoreTestPart1 from './ControllerResultCorePart1.test';
import controllerResultCoreTestPart2 from './ControllerResultCorePart2.test';
import controllerResultExtendedTestPart1 from './ControllerResultExtendedPart1.test';
import controllerResultExtendedTestPart2 from './ControllerResultExtendedPart2.test';
import controllerResultAdvancedTestPart1 from './ControllerResultAdvancedPart1.test';
import controllerResultAdvancedTestPart2 from './ControllerResultAdvancedPart2.test';
import controllerResultTailTestPart1 from './ControllerResultTailPart1.test';
import controllerResultTailTestPart2 from './ControllerResultTailPart2.test';
import challengeResultEnumCoreTest from './ChallengeResultEnumCore.test';
import challengeResultEnumExtendedTest from './ChallengeResultEnumExtended.test';
import challengeResultEnumAdvancedTest from './ChallengeResultEnumAdvanced.test';
import challengeResultEnumTailTest from './ChallengeResultEnumTail.test';
import circleStyleOptionsCoreTestPart1 from './CircleStyleOptionsCorePart1.test';
import circleStyleOptionsCoreTestPart2 from './CircleStyleOptionsCorePart2.test';
import circleStyleOptionsExtendedTestPart1 from './CircleStyleOptionsExtendedPart1.test';
import circleStyleOptionsExtendedTestPart2 from './CircleStyleOptionsExtendedPart2.test';
import circleStyleOptionsAdvancedTestPart1 from './CircleStyleOptionsAdvancedPart1.test';
import circleStyleOptionsAdvancedTestPart2 from './CircleStyleOptionsAdvancedPart2.test';
import circleStyleOptionsTailTestPart1 from './CircleStyleOptionsTailPart1.test';
import circleStyleOptionsTailTestPart2 from './CircleStyleOptionsTailPart2.test';
import controllerIsolationCoreTestPart1 from './ControllerIsolationCorePart1.test';
import controllerIsolationCoreTestPart2 from './ControllerIsolationCorePart2.test';
import controllerIsolationCoreTestPart3 from './ControllerIsolationCorePart3.test';
import controllerIsolationExtendedTestPart1 from './ControllerIsolationExtendedPart1.test';
import controllerIsolationExtendedTestPart2 from './ControllerIsolationExtendedPart2.test';
import controllerIsolationExtendedTestPart3 from './ControllerIsolationExtendedPart3.test';
import controllerIsolationAdvancedTestPart1 from './ControllerIsolationAdvancedPart1.test';
import controllerIsolationAdvancedTestPart2 from './ControllerIsolationAdvancedPart2.test';
import controllerIsolationAdvancedTestPart3 from './ControllerIsolationAdvancedPart3.test';
import controllerIsolationTailTestPart1 from './ControllerIsolationTailPart1.test';
import controllerIsolationTailTestPart2 from './ControllerIsolationTailPart2.test';
import controllerIsolationTailTestPart3 from './ControllerIsolationTailPart3.test';
import controllerLifecycleCoreTestPart1 from './ControllerLifecycleCorePart1.test';
import controllerLifecycleCoreTestPart2 from './ControllerLifecycleCorePart2.test';
import controllerLifecycleExtendedTestPart1 from './ControllerLifecycleExtendedPart1.test';
import controllerLifecycleExtendedTestPart2 from './ControllerLifecycleExtendedPart2.test';
import controllerLifecycleAdvancedTestPart1 from './ControllerLifecycleAdvancedPart1.test';
import controllerLifecycleAdvancedTestPart2 from './ControllerLifecycleAdvancedPart2.test';
import controllerLifecycleTailTestPart1 from './ControllerLifecycleTailPart1.test';
import controllerLifecycleTailTestPart2 from './ControllerLifecycleTailPart2.test';

export default function testsuite() {
  abilityTest();
  controllerResetCoreTest();
  controllerResetExtendedTest();
  controllerResetAdvancedTest();
  controllerResetTailTest();
  controllerResultCoreTestPart1();
  controllerResultCoreTestPart2();
  controllerResultExtendedTestPart1();
  controllerResultExtendedTestPart2();
  controllerResultAdvancedTestPart1();
  controllerResultAdvancedTestPart2();
  controllerResultTailTestPart1();
  controllerResultTailTestPart2();
  challengeResultEnumCoreTest();
  challengeResultEnumExtendedTest();
  challengeResultEnumAdvancedTest();
  challengeResultEnumTailTest();
  circleStyleOptionsCoreTestPart1();
  circleStyleOptionsCoreTestPart2();
  circleStyleOptionsExtendedTestPart1();
  circleStyleOptionsExtendedTestPart2();
  circleStyleOptionsAdvancedTestPart1();
  circleStyleOptionsAdvancedTestPart2();
  circleStyleOptionsTailTestPart1();
  circleStyleOptionsTailTestPart2();
  controllerIsolationCoreTestPart1();
  controllerIsolationCoreTestPart2();
  controllerIsolationCoreTestPart3();
  controllerIsolationExtendedTestPart1();
  controllerIsolationExtendedTestPart2();
  controllerIsolationExtendedTestPart3();
  controllerIsolationAdvancedTestPart1();
  controllerIsolationAdvancedTestPart2();
  controllerIsolationAdvancedTestPart3();
  controllerIsolationTailTestPart1();
  controllerIsolationTailTestPart2();
  controllerIsolationTailTestPart3();
  controllerLifecycleCoreTestPart1();
  controllerLifecycleCoreTestPart2();
  controllerLifecycleExtendedTestPart1();
  controllerLifecycleExtendedTestPart2();
  controllerLifecycleAdvancedTestPart1();
  controllerLifecycleAdvancedTestPart2();
  controllerLifecycleTailTestPart1();
  controllerLifecycleTailTestPart2();
}