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

import perfBudgetPerfResetTest from './PerfBudgetPerfReset.test';
import perfBudgetPerfResultTest from './PerfBudgetPerfResult.test';
import perfBudgetPerfOptionsTest from './PerfBudgetPerfOptions.test';
import perfBudgetPerfMixedTest from './PerfBudgetPerfMixed.test';
import stabilityRepeatStableResetTest from './StabilityRepeatStableReset.test';
import stabilityRepeatStableResultTest from './StabilityRepeatStableResult.test';
import stabilityRepeatStableReplaceResetTest from './StabilityRepeatStableReplaceReset.test';
import stabilityRepeatStableReplaceResultTest from './StabilityRepeatStableReplaceResult.test';
import inputBoundaryBoundaryOptionsTest from './InputBoundaryBoundaryOptions.test';
import inputBoundaryBoundaryEnumTest from './InputBoundaryBoundaryEnum.test';
import inputBoundaryBoundaryNoCallbackTest from './InputBoundaryBoundaryNoCallback.test';
import inputBoundaryBoundaryRadiusTest from './InputBoundaryBoundaryRadius.test';
import compatibilityCompatColorsTest from './CompatibilityCompatColors.test';
import compatibilityCompatEnumTest from './CompatibilityCompatEnum.test';
import compatibilityCompatControllersTest from './CompatibilityCompatControllers.test';
import compatibilityCompatInstancesTest from './CompatibilityCompatInstances.test';
import i18nResourceI18nColorStringTest from './I18nResourceI18nColorString.test';
import i18nResourceI18nColorNumberTest from './I18nResourceI18nColorNumber.test';
import i18nResourceI18nUndefinedTest from './I18nResourceI18nUndefined.test';
import i18nResourceI18nMixedTest from './I18nResourceI18nMixed.test';
import recoveryIsolationRecoverTwoControllersTest from './RecoveryIsolationRecoverTwoControllers.test';
import recoveryIsolationRecoverReplaceTest from './RecoveryIsolationRecoverReplace.test';
import recoveryIsolationRecoverResultResetTest from './RecoveryIsolationRecoverResultReset.test';
import recoveryIsolationRecoverFreshTest from './RecoveryIsolationRecoverFresh.test';

export default function testsuite() {
  abilityTest();
  controllerResetMatrixTest();
  controllerResultMatrixTest();
  challengeResultEnumMatrixTest();
  circleStyleOptionsMatrixTest();
  controllerIsolationMatrixTest();
  controllerLifecycleMatrixTest();
  perfBudgetPerfResetTest();
  perfBudgetPerfResultTest();
  perfBudgetPerfOptionsTest();
  perfBudgetPerfMixedTest();
  stabilityRepeatStableResetTest();
  stabilityRepeatStableResultTest();
  stabilityRepeatStableReplaceResetTest();
  stabilityRepeatStableReplaceResultTest();
  inputBoundaryBoundaryOptionsTest();
  inputBoundaryBoundaryEnumTest();
  inputBoundaryBoundaryNoCallbackTest();
  inputBoundaryBoundaryRadiusTest();
  compatibilityCompatColorsTest();
  compatibilityCompatEnumTest();
  compatibilityCompatControllersTest();
  compatibilityCompatInstancesTest();
  i18nResourceI18nColorStringTest();
  i18nResourceI18nColorNumberTest();
  i18nResourceI18nUndefinedTest();
  i18nResourceI18nMixedTest();
  recoveryIsolationRecoverTwoControllersTest();
  recoveryIsolationRecoverReplaceTest();
  recoveryIsolationRecoverResultResetTest();
  recoveryIsolationRecoverFreshTest();
}