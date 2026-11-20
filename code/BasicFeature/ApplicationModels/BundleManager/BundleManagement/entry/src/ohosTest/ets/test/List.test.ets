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

// BundleManagement ohosTest aggregator.
// Each imported suite targets one business capability of the sample.

// BundleInfo suites
import bundleInfoUITest from './BundleInfo/BundleInfoUI.test';
import bundleInfoOperationsTest from './BundleInfo/BundleInfoOperations.test';
import bundleInfoLifecycleTest from './BundleInfo/BundleInfoLifecycle.test';
import bundleInfoStateManagementTest from './BundleInfo/BundleInfoStateManagement.test';
import bundleInfoStressTest from './BundleInfo/BundleInfoStress.test';
import bundleInfoConcurrencyTest from './BundleInfo/BundleInfoConcurrency.test';
import bundleInfoConsistencyTest from './BundleInfo/BundleInfoConsistency.test';
import bundleInfoEndToEndTest from './BundleInfo/BundleInfoEndToEnd.test';
import bundleInfoErrorRecoveryTest from './BundleInfo/BundleInfoErrorRecovery.test';
import profileQueryInteractionTest from './BundleInfo/ProfileQueryInteraction.test';
import bundleInfoModelTest from './BundleInfo/BundleInfoModel.test';
import bundleFlagConfigurationTest from './BundleInfo/BundleFlagConfiguration.test';
import bundleInfoModelDeepTest from './BundleInfo/BundleInfoModelDeep.test';
import bundleOperationCatalogTest from './BundleInfo/BundleOperationCatalog.test';
import bundleOperationFlowTest from './BundleInfo/BundleOperationFlow.test';
import bundleOperationWorkflowTest from './BundleInfo/BundleOperationWorkflow.test';
// BundleValidation suites
import bundleAppVersionTest from './BundleValidation/BundleAppVersion.test';
import bundleAuthSessionTest from './BundleValidation/BundleAuthSession.test';
import bundleDataSourceValidationTest from './BundleValidation/BundleDataSourceValidation.test';
import bundleEventToolValidationTest from './BundleValidation/BundleEventToolValidation.test';
import bundleInterruptionRecoveryTest from './BundleValidation/BundleInterruptionRecovery.test';
import bundleNotificationTest from './BundleValidation/BundleNotification.test';
import bundleOfflineNetworkTest from './BundleValidation/BundleOfflineNetwork.test';
import bundleSessionValidationTest from './BundleValidation/BundleSessionValidation.test';
// Validation suites
import overlayStateValidationTest from './Validation/OverlayStateValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import bundleEventValidationTest from './Validation/BundleEventValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import bundleStateManagerValidationTest from './Validation/BundleStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import linkSchemeValidationTest from './Validation/LinkSchemeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import defaultAppValidationTest from './Validation/DefaultAppValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
// Interaction suites
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import menuButtonInteractionTest from './Interaction/MenuButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import pageLayoutPositioningTest from './Interaction/PageLayoutPositioning.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import uIComponentRenderingTest from './Interaction/UIComponentRendering.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
// LifecycleState suites
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import pageLifecycleTest from './LifecycleState/PageLifecycle.test';
import appStateManagementTest from './LifecycleState/AppStateManagement.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
// PerformanceStability suites
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import resourceConsumptionTest from './PerformanceStability/ResourceConsumption.test';
import performanceBenchmarkTest from './PerformanceStability/PerformanceBenchmark.test';
// Security suites
import bundleSecurityTest from './Security/BundleSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
// Integration suites
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import bundleCompatibilityTest from './Integration/BundleCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';

export default function testsuite(): void {
  bundleInfoUITest();
  bundleInfoOperationsTest();
  bundleInfoLifecycleTest();
  bundleInfoStateManagementTest();
  bundleInfoStressTest();
  bundleInfoConcurrencyTest();
  bundleInfoConsistencyTest();
  bundleInfoEndToEndTest();
  bundleInfoErrorRecoveryTest();
  profileQueryInteractionTest();
  bundleInfoModelTest();
  bundleFlagConfigurationTest();
  bundleInfoModelDeepTest();
  bundleOperationCatalogTest();
  bundleOperationFlowTest();
  bundleOperationWorkflowTest();
  bundleAppVersionTest();
  bundleAuthSessionTest();
  bundleDataSourceValidationTest();
  bundleEventToolValidationTest();
  bundleInterruptionRecoveryTest();
  bundleNotificationTest();
  bundleOfflineNetworkTest();
  bundleSessionValidationTest();
  overlayStateValidationTest();
  boundaryErrorTestingTest();
  bundleEventValidationTest();
  configurationManagerValidationTest();
  bundleStateManagerValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  linkSchemeValidationTest();
  loggerValidationTest();
  defaultAppValidationTest();
  resourceLoaderValidationTest();
  accessibilityNavigationTest();
  menuButtonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  pageLayoutPositioningTest();
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
  pageLifecycleTest();
  appStateManagementTest();
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
  resourceConsumptionTest();
  performanceBenchmarkTest();
  bundleSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  bundleCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();
}
