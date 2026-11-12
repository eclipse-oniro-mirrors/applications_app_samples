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

import perfBudgetPerfResetTest from './PerfBudget_PerfReset.test';
import perfBudgetPerfResultTest from './PerfBudget_PerfResult.test';
import perfBudgetPerfOptionsTest from './PerfBudget_PerfOptions.test';
import perfBudgetPerfMixedTest from './PerfBudget_PerfMixed.test';
import stabilityRepeatStableResetTest from './StabilityRepeat_StableReset.test';
import stabilityRepeatStableResultTest from './StabilityRepeat_StableResult.test';
import stabilityRepeatStableReplaceResetTest from './StabilityRepeat_StableReplaceReset.test';
import stabilityRepeatStableReplaceResultTest from './StabilityRepeat_StableReplaceResult.test';
import inputBoundaryBoundaryOptionsTest from './InputBoundary_BoundaryOptions.test';
import inputBoundaryBoundaryEnumTest from './InputBoundary_BoundaryEnum.test';
import inputBoundaryBoundaryNoCallbackTest from './InputBoundary_BoundaryNoCallback.test';
import inputBoundaryBoundaryRadiusTest from './InputBoundary_BoundaryRadius.test';
import compatibilityCompatColorsTest from './Compatibility_CompatColors.test';
import compatibilityCompatEnumTest from './Compatibility_CompatEnum.test';
import compatibilityCompatControllersTest from './Compatibility_CompatControllers.test';
import compatibilityCompatInstancesTest from './Compatibility_CompatInstances.test';
import i18nResourceI18nColorStringTest from './I18nResource_I18nColorString.test';
import i18nResourceI18nColorNumberTest from './I18nResource_I18nColorNumber.test';
import i18nResourceI18nUndefinedTest from './I18nResource_I18nUndefined.test';
import i18nResourceI18nMixedTest from './I18nResource_I18nMixed.test';
import recoveryIsolationRecoverTwoControllersTest from './RecoveryIsolation_RecoverTwoControllers.test';
import recoveryIsolationRecoverReplaceTest from './RecoveryIsolation_RecoverReplace.test';
import recoveryIsolationRecoverResultResetTest from './RecoveryIsolation_RecoverResultReset.test';
import recoveryIsolationRecoverFreshTest from './RecoveryIsolation_RecoverFresh.test';

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