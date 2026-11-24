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

import pointerSettingConcurrencyTest from './MouseSettings/PointerSettingConcurrency.test';
import pointerSettingConsistencyTest from './MouseSettings/PointerSettingConsistency.test';
import pointerSettingEndToEndTest from './MouseSettings/PointerSettingEndToEnd.test';
import pointerSettingErrorRecoveryTest from './MouseSettings/PointerSettingErrorRecovery.test';
import pointerSettingLifecycleTest from './MouseSettings/PointerSettingLifecycle.test';
import pointerSettingStateManagementTest from './MouseSettings/PointerSettingStateManagement.test';
import pointerSettingStressTest from './MouseSettings/PointerSettingStress.test';
import mouseSettingsUITest from './MouseSettings/MouseSettingsUI.test';
import pointerInputInteractionTest from './MouseSettings/PointerInputInteraction.test';
import pointerItemInfoModelTest from './MouseSettings/PointerItemInfoModel.test';
import pointerMenuConfigurationTest from './MouseSettings/PointerMenuConfiguration.test';
import pointerModelDeepTest from './MouseSettings/PointerModelDeep.test';
import pointerSettingCatalogTest from './MouseSettings/PointerSettingCatalog.test';
import pointerSettingFlowTest from './MouseSettings/PointerSettingFlow.test';
import pointerOperationsTest from './MouseSettings/PointerOperations.test';
import pointerSettingWorkflowTest from './MouseSettings/PointerSettingWorkflow.test';
import mouseAppVersionTest from './MouseValidation/MouseAppVersion.test';
import mouseAuthSessionTest from './MouseValidation/MouseAuthSession.test';
import mouseDataSourceValidationTest from './MouseValidation/MouseDataSourceValidation.test';
import mouseEventToolValidationTest from './MouseValidation/MouseEventToolValidation.test';
import mouseInterruptionRecoveryTest from './MouseValidation/MouseInterruptionRecovery.test';
import mouseNotificationTest from './MouseValidation/MouseNotification.test';
import mouseOfflineNetworkTest from './MouseValidation/MouseOfflineNetwork.test';
import mouseSessionValidationTest from './MouseValidation/MouseSessionValidation.test';
import pointerScaleAnimationValidationTest from './Validation/PointerScaleAnimationValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import mouseEventChannelValidationTest from './Validation/MouseEventChannelValidation.test';
import mouseConfigManagerValidationTest from './Validation/MouseConfigManagerValidation.test';
import mouseStateManagerValidationTest from './Validation/MouseStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import panelPositioningTest from './Interaction/PanelPositioning.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import uIComponentRenderingTest from './Interaction/UIComponentRendering.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import panelLifecycleTest from './LifecycleState/PanelLifecycle.test';
import settingStateManagementTest from './LifecycleState/SettingStateManagement.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import abilityLifecycleTest from './LifecycleState/AbilityLifecycle.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import resourceConsumptionTest from './PerformanceStability/ResourceConsumption.test';
import pointerPerformanceTest from './PerformanceStability/PointerPerformance.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import deviceConnectivityTest from './Integration/DeviceConnectivity.test';
import pointerCompatibilityTest from './Integration/PointerCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import mouseSecurityTest from './Security/MouseSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';

export default function testsuite(): void {
  pointerSettingConcurrencyTest();
  pointerSettingConsistencyTest();
  pointerSettingEndToEndTest();
  pointerSettingErrorRecoveryTest();
  pointerSettingLifecycleTest();
  pointerSettingStateManagementTest();
  pointerSettingStressTest();
  mouseSettingsUITest();
  pointerInputInteractionTest();
  pointerItemInfoModelTest();
  pointerMenuConfigurationTest();
  pointerModelDeepTest();
  pointerSettingCatalogTest();
  pointerSettingFlowTest();
  pointerOperationsTest();
  pointerSettingWorkflowTest();
  mouseAppVersionTest();
  mouseAuthSessionTest();
  mouseDataSourceValidationTest();
  mouseEventToolValidationTest();
  mouseInterruptionRecoveryTest();
  mouseNotificationTest();
  mouseOfflineNetworkTest();
  mouseSessionValidationTest();
  pointerScaleAnimationValidationTest();
  boundaryErrorTestingTest();
  mouseEventChannelValidationTest();
  mouseConfigManagerValidationTest();
  mouseStateManagerValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
  accessibilityNavigationTest();
  buttonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  panelPositioningTest();
  eventHandlingTest();
  eventPropagationTest();
  focusNavigationTest();
  focusRingBehaviorTest();
  gestureRecognitionTest();
  themeVariationTest();
  touchInteractionTest();
  uIComponentRenderingTest();
  visualEffectsTest();
  configurationChangesTest();
  panelLifecycleTest();
  settingStateManagementTest();
  errorRecoveryTest();
  exceptionHandlingTest();
  abilityLifecycleTest();
  resourceManagementTest();
  sessionManagementTest();
  statePersistenceTest();
  stateRecoveryTest();
  animationPerformanceTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  performanceStressTest();
  resourceConsumptionTest();
  pointerPerformanceTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  deviceConnectivityTest();
  pointerCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();
  mouseSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
}
