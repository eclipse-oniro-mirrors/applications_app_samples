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
import systemLoadSdkTest from './SystemLoadSdk.test';
import utilsTest from './Utils.test';
import extendedTest from './Extended.test';
import skillCompletionTest from './SkillCompletion.test';
import level3ExtendedTest from './Level3Extended.test';
import level2ExtendedTest from './Level2Extended.test';
import uiInteractionTest from './UIInteraction.test';
import comprehensiveTest from './Comprehensive.test';
import performanceSecurityTest from './PerformanceSecurity.test';
import callbackDataValidationTest from './CallbackDataValidation.test';
import listenerStateManagementTest from './ListenerStateManagement.test';
import uiComponentStateTest from './UIComponentState.test';
import concurrencySafetyTest from './ConcurrencySafety.test';
import i18nThemeTest from './I18nTheme.test';
import accessibilityPerformanceTest from './AccessibilityPerformance.test';
import boundaryExtensionPart1Test from './BoundaryExtensionPart1.test';
import boundaryExtensionPart2Test from './BoundaryExtensionPart2.test';
import boundaryExtensionPart3Test from './BoundaryExtensionPart3.test';
import boundaryExtensionPart4Test from './BoundaryExtensionPart4.test';
import cryptoUtilsBoundaryTest from './CryptoUtilsBoundary.test';
import clipboardUtilsBoundaryTest from './ClipboardUtilsBoundary.test';
import storageUtilsBoundaryTest from './StorageUtilsBoundary.test';
import networkUtilsBoundaryTest from './NetworkUtilsBoundary.test';
import uiAutomationEnhancedTest from './UIAutomationEnhanced.test';

export default function testsuite() {
  systemLoadSdkTest();
  abilityTest();
  utilsTest();
  extendedTest();
  skillCompletionTest();
  level3ExtendedTest();
  level2ExtendedTest();
  uiInteractionTest();
  comprehensiveTest();
  performanceSecurityTest();
  callbackDataValidationTest();
  listenerStateManagementTest();
  uiComponentStateTest();
  concurrencySafetyTest();
  i18nThemeTest();
  accessibilityPerformanceTest();
  boundaryExtensionPart1Test();
  boundaryExtensionPart2Test();
  boundaryExtensionPart3Test();
  boundaryExtensionPart4Test();
  cryptoUtilsBoundaryTest();
  clipboardUtilsBoundaryTest();
  storageUtilsBoundaryTest();
  networkUtilsBoundaryTest();
  uiAutomationEnhancedTest();
}
