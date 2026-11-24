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

import appTest from './App.test';
import settingUISuite from './Core/SettingUI.test';
import settingAuthSessionSuite from './Validation/SettingAuthSession.test';
import settingCommonEventUtilValidationSuite from './Validation/SettingCommonEventUtilValidation.test';
import settingCatalogStructureValidationSuite from './Validation/SettingCatalogStructureValidation.test';
import settingAccessibilityNavigationSuite from './Interaction/SettingAccessibilityNavigation.test';
import settingGestureRecognitionSuite from './Interaction/SettingGestureRecognition.test';
import settingAdvancedScenariosSuite from './Integration/SettingAdvancedScenarios.test';
import settingExceptionHandlingSuite from './LifecycleState/SettingExceptionHandling.test';
import settingMemoryLeakDetectionSuite from './PerformanceStability/SettingMemoryLeakDetection.test';
import settingsExtensionSuite from './SettingsExtension.test';

export default function testsuite() {
  appTest();
  settingUISuite();
  settingAuthSessionSuite();
  settingCommonEventUtilValidationSuite();
  settingCatalogStructureValidationSuite();
  settingAccessibilityNavigationSuite();
  settingGestureRecognitionSuite();
  settingAdvancedScenariosSuite();
  settingExceptionHandlingSuite();
  settingMemoryLeakDetectionSuite();
  settingsExtensionSuite();
}
