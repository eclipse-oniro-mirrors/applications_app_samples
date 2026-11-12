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

import controllerResetMatrixTest from './ControllerResetMatrix.test';
import controllerResultMatrixTest from './ControllerResultMatrix.test';
import challengeResultEnumMatrixTest from './ChallengeResultEnumMatrix.test';
import circleStyleOptionsMatrixTest from './CircleStyleOptionsMatrix.test';
import controllerIsolationMatrixTest from './ControllerIsolationMatrix.test';
import controllerLifecycleMatrixTest from './ControllerLifecycleMatrix.test';
import perfBudgetTest from './PerfBudget.test';
import stabilityRepeatTest from './StabilityRepeat.test';
import inputBoundaryTest from './InputBoundary.test';
import compatibilityTest from './Compatibility.test';
import i18nResourceTest from './I18nResource.test';
import recoveryIsolationTest from './RecoveryIsolation.test';

export default function testsuite() {
  abilityTest();
  controllerResetMatrixTest();
  controllerResultMatrixTest();
  challengeResultEnumMatrixTest();
  circleStyleOptionsMatrixTest();
  controllerIsolationMatrixTest();
  controllerLifecycleMatrixTest();
  perfBudgetTest();
  stabilityRepeatTest();
  inputBoundaryTest();
  compatibilityTest();
  i18nResourceTest();
  recoveryIsolationTest();
}