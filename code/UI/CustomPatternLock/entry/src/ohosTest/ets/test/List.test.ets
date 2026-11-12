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
import controllerResultCoreTest from './ControllerResultCore.test';
import controllerResultExtendedTest from './ControllerResultExtended.test';
import controllerResultAdvancedTest from './ControllerResultAdvanced.test';
import controllerResultTailTest from './ControllerResultTail.test';
import challengeResultEnumCoreTest from './ChallengeResultEnumCore.test';
import challengeResultEnumExtendedTest from './ChallengeResultEnumExtended.test';
import challengeResultEnumAdvancedTest from './ChallengeResultEnumAdvanced.test';
import challengeResultEnumTailTest from './ChallengeResultEnumTail.test';
import circleStyleOptionsCoreTest from './CircleStyleOptionsCore.test';
import circleStyleOptionsExtendedTest from './CircleStyleOptionsExtended.test';
import circleStyleOptionsAdvancedTest from './CircleStyleOptionsAdvanced.test';
import circleStyleOptionsTailTest from './CircleStyleOptionsTail.test';
import controllerIsolationCoreTest from './ControllerIsolationCore.test';
import controllerIsolationExtendedTest from './ControllerIsolationExtended.test';
import controllerIsolationAdvancedTest from './ControllerIsolationAdvanced.test';
import controllerIsolationTailTest from './ControllerIsolationTail.test';
import controllerLifecycleCoreTest from './ControllerLifecycleCore.test';
import controllerLifecycleExtendedTest from './ControllerLifecycleExtended.test';
import controllerLifecycleAdvancedTest from './ControllerLifecycleAdvanced.test';
import controllerLifecycleTailTest from './ControllerLifecycleTail.test';

export default function testsuite() {
  abilityTest();
  controllerResetCoreTest();
  controllerResetExtendedTest();
  controllerResetAdvancedTest();
  controllerResetTailTest();
  controllerResultCoreTest();
  controllerResultExtendedTest();
  controllerResultAdvancedTest();
  controllerResultTailTest();
  challengeResultEnumCoreTest();
  challengeResultEnumExtendedTest();
  challengeResultEnumAdvancedTest();
  challengeResultEnumTailTest();
  circleStyleOptionsCoreTest();
  circleStyleOptionsExtendedTest();
  circleStyleOptionsAdvancedTest();
  circleStyleOptionsTailTest();
  controllerIsolationCoreTest();
  controllerIsolationExtendedTest();
  controllerIsolationAdvancedTest();
  controllerIsolationTailTest();
  controllerLifecycleCoreTest();
  controllerLifecycleExtendedTest();
  controllerLifecycleAdvancedTest();
  controllerLifecycleTailTest();
}