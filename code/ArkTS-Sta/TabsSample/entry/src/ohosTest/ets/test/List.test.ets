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


import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import compatibilityMatrixTest from './Integration/CompatibilityMatrix.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import tabBarPositioningTest from './Interaction/TabBarPositioning.test';
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
import tabsLifecycleTest from './LifecycleState/TabsLifecycle.test';
import tabsStateManagementTest from './LifecycleState/TabsStateManagement.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import powerConsumptionTest from './PerformanceStability/PowerConsumption.test';
import renderPerformanceTest from './PerformanceStability/RenderPerformance.test';
import tabsCoreConcurrencyTest from './TabsCore/TabsCoreConcurrency.test';
import tabsCoreConsistencyTest from './TabsCore/TabsCoreConsistency.test';
import tabsCoreEndToEndTest from './TabsCore/TabsCoreEndToEnd.test';
import tabsCoreErrorRecoveryTest from './TabsCore/TabsCoreErrorRecovery.test';
import tabsCoreLifecycleTest from './TabsCore/TabsCoreLifecycle.test';
import tabsCoreStateManagementTest from './TabsCore/TabsCoreStateManagement.test';
import tabsCoreStressTest from './TabsCore/TabsCoreStress.test';
import tabsCoreUITest from './TabsCore/TabsCoreUI.test';
import tabBarInteractionTest from './TabsCore/TabBarInteraction.test';
import tabDataModelTest from './TabsCore/TabDataModel.test';
import tabMenuConfigurationTest from './TabsCore/TabMenuConfiguration.test';
import tabModelDeepTest from './TabsCore/TabModelDeep.test';
import tabOperationCatalogTest from './TabsCore/TabOperationCatalog.test';
import tabOperationFlowTest from './TabsCore/TabOperationFlow.test';
import tabOperationWorkflowTest from './TabsCore/TabOperationWorkflow.test';
import tabOperationsTest from './TabsCore/TabOperations.test';
import tabAppVersionTest from './TabsValidation/TabAppVersion.test';
import tabAuthSessionTest from './TabsValidation/TabAuthSession.test';
import tabDataSourceValidationTest from './TabsValidation/TabDataSourceValidation.test';
import tabEventToolValidationTest from './TabsValidation/TabEventToolValidation.test';
import tabInterruptionRecoveryTest from './TabsValidation/TabInterruptionRecovery.test';
import tabNotificationTest from './TabsValidation/TabNotification.test';
import tabOfflineNetworkTest from './TabsValidation/TabOfflineNetwork.test';
import tabSessionValidationTest from './TabsValidation/TabSessionValidation.test';
import dataSecurityTest from './Security/DataSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import tabSwitchAnimationValidationTest from './Validation/TabSwitchAnimationValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import tabEventBusValidationTest from './Validation/TabEventBusValidation.test';
import tabConfigManagerValidationTest from './Validation/TabConfigManagerValidation.test';
import tabStateManagerValidationTest from './Validation/TabStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';

export default function testsuite(): void {
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  compatibilityMatrixTest();
  systemIntegrationTest();
  userScenariosTest();
  accessibilityNavigationTest();
  buttonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  tabBarPositioningTest();
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
  tabsLifecycleTest();
  tabsStateManagementTest();
  errorRecoveryTest();
  exceptionHandlingTest();
  extensionLifecycleTest();
  resourceManagementTest();
  sessionManagementTest();
  statePersistenceTest();
  stateRecoveryTest();
  animationPerformanceTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  performanceStressTest();
  powerConsumptionTest();
  renderPerformanceTest();
  tabsCoreConcurrencyTest();
  tabsCoreConsistencyTest();
  tabsCoreEndToEndTest();
  tabsCoreErrorRecoveryTest();
  tabsCoreLifecycleTest();
  tabsCoreStateManagementTest();
  tabsCoreStressTest();
  tabsCoreUITest();
  tabBarInteractionTest();
  tabDataModelTest();
  tabMenuConfigurationTest();
  tabModelDeepTest();
  tabOperationCatalogTest();
  tabOperationFlowTest();
  tabOperationWorkflowTest();
  tabOperationsTest();
  tabAppVersionTest();
  tabAuthSessionTest();
  tabDataSourceValidationTest();
  tabEventToolValidationTest();
  tabInterruptionRecoveryTest();
  tabNotificationTest();
  tabOfflineNetworkTest();
  tabSessionValidationTest();
  dataSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  tabSwitchAnimationValidationTest();
  boundaryErrorTestingTest();
  tabEventBusValidationTest();
  tabConfigManagerValidationTest();
  tabStateManagerValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
}
