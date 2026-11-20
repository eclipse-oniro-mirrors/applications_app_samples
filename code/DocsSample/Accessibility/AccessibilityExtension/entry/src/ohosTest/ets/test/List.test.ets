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

import extensionKeyEventTest from './ExtensionKeyEvent.test';
import abilityTest from './AbilityTest.test';
import pageLoadTest from './PageLoad.test';
import uiInteractionTest from './UiInteraction.test';
import accessibilityAttrsTest from './AccessibilityAttrs.test';
import componentStructureTest from './ComponentStructure.test';
import textContentTest from './TextContent.test';
import userInteractionTest from './UserInteraction.test';
import accessibilityPropertyTest from './AccessibilityProperty.test';
import abilityLifecycleTest from './AbilityLifecycle.test';
import negativeTest from './NegativeTest.test';
import stateTransitionTest from './StateTransitionTest.test';
import combinationTest from './CombinationTest.test';
import driverApiTest from './DriverApiTest.test';
import toggleInteractionTest from './ToggleInteractionTest.test';
import longPressTest from './LongPressTest.test';
import scrollBehaviorTest from './ScrollBehaviorTest.test';
import accessibilityDeepTest from './AccessibilityDeepTest.test';
import extendedInteractionTest from './ExtendedInteractionTest.test';
import listItemTextVerifyTest from './ListItemTextVerify.test';
import accessibilityDescTextTest from './AccessibilityDescText.test';
import componentAttributeTest from './ComponentAttribute.test';
import postInteractionReverifyTest from './PostInteractionReverify.test';
import stressTest from './StressTest.test';
import inputValidationTest from './InputValidation.test';
import driverApiExtendedTest from './DriverApiExtended.test';
import pageStabilityTest from './PageStability.test';
import statePreservationTest from './StatePreservation.test';
import placeholderTextTest from './PlaceholderText.test';
import driverInteractionTest from './DriverInteraction.test';
import accessibilityGroupTest from './AccessibilityGroup.test';
import fullPageRenderTest from './FullPageRender.test';
import multiStartConsistencyTest from './MultiStartConsistency.test';
import errorRecoveryTest from './ErrorRecovery.test';
import controlStateTest from './ControlState.test';
import utilsSuite01 from './utils/UtilsSuite01.test';
import utilsSuite02 from './utils/UtilsSuite02.test';
import utilsSuite03 from './utils/UtilsSuite03.test';
import utilsSuite04 from './utils/UtilsSuite04.test';
import utilsSuite05 from './utils/UtilsSuite05.test';
import utilsSuite06 from './utils/UtilsSuite06.test';
import utilsSuite07 from './utils/UtilsSuite07.test';
import utilsSuite08 from './utils/UtilsSuite08.test';
import utilsSuite09 from './utils/UtilsSuite09.test';
import utilsSuite10 from './utils/UtilsSuite10.test';
import utilsSuite11 from './utils/UtilsSuite11.test';
import utilsSuite12 from './utils/UtilsSuite12.test';

export default function testsuite(): void {
  extensionKeyEventTest();
  abilityTest();
  pageLoadTest();
  uiInteractionTest();
  accessibilityAttrsTest();
  componentStructureTest();
  textContentTest();
  userInteractionTest();
  accessibilityPropertyTest();
  abilityLifecycleTest();
  negativeTest();
  stateTransitionTest();
  combinationTest();
  driverApiTest();
  toggleInteractionTest();
  longPressTest();
  scrollBehaviorTest();
  accessibilityDeepTest();
  extendedInteractionTest();
  listItemTextVerifyTest();
  accessibilityDescTextTest();
  componentAttributeTest();
  postInteractionReverifyTest();
  stressTest();
  inputValidationTest();
  driverApiExtendedTest();
  pageStabilityTest();
  statePreservationTest();
  placeholderTextTest();
  driverInteractionTest();
  accessibilityGroupTest();
  fullPageRenderTest();
  multiStartConsistencyTest();
  errorRecoveryTest();
  controlStateTest();
  utilsSuite01();
  utilsSuite02();
  utilsSuite03();
  utilsSuite04();
  utilsSuite05();
  utilsSuite06();
  utilsSuite07();
  utilsSuite08();
  utilsSuite09();
  utilsSuite10();
  utilsSuite11();
  utilsSuite12();
}
