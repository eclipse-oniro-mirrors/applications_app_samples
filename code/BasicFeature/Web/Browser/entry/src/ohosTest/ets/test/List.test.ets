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

/**
 * Entry suite of the browser ohosTest module.
 *
 * Every generated suite is registered here exactly once. The suites are grouped
 * by the directory they live in so that a failure can be traced back to a
 * feature area without opening the runner output.
 */

// Suites of the app.test.ets area.
import appTest from './app.test';

// Suites of the Browser area.
import browserConcurrencyTest from './Browser/BrowserConcurrency.test';
import browserConsistencyTest from './Browser/BrowserConsistency.test';
import browserEndToEndTest from './Browser/BrowserEndToEnd.test';
import browserErrorRecoveryTest from './Browser/BrowserErrorRecovery.test';
import browserInputInteractionTest from './Browser/BrowserInputInteraction.test';
import browserLifecycleTest from './Browser/BrowserLifecycle.test';
import browserMenuConfigurationTest from './Browser/BrowserMenuConfiguration.test';
import browserModelDeepTest from './Browser/BrowserModelDeep.test';
import browserOperationWorkflowTest from './Browser/BrowserOperationWorkflow.test';
import browserStateManagementTest from './Browser/BrowserStateManagement.test';
import browserStressTest from './Browser/BrowserStress.test';
import browserUITest from './Browser/BrowserUI.test';
import browserTabItemModelTest from './Browser/TabItemModel.test';
import tabOperationCatalogTest from './Browser/TabOperationCatalog.test';
import tabOperationsTest from './Browser/TabOperations.test';
import urlOperationFlowTest from './Browser/UrlOperationFlow.test';

// Suites of the BrowserValidation area.
import browserAppVersionValidationTest from './BrowserValidation/AppVersionValidation.test';
import browserAuthSessionValidationTest from './BrowserValidation/AuthSessionValidation.test';
import browserDataSourceValidationTest from './BrowserValidation/DataSourceValidation.test';
import browserEventToolValidationTest from './BrowserValidation/EventToolValidation.test';
import browserInterruptionRecoveryTest from './BrowserValidation/InterruptionRecovery.test';
import browserNotificationValidationTest from './BrowserValidation/NotificationValidation.test';
import browserOfflineNetworkTest from './BrowserValidation/OfflineNetwork.test';
import browserSessionValidationTest from './BrowserValidation/SessionValidation.test';

// Suites of the Integration area.
import browserAdvancedScenariosTest from './Integration/AdvancedScenarios.test';
import browserCompatibilityTest from './Integration/BrowserCompatibility.test';
import browserComprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import browserDeviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import browserIntegrationTestingTest from './Integration/IntegrationTesting.test';
import browserLocalizationTest from './Integration/LocalizationTesting.test';
import browserNetworkConnectivityTest from './Integration/NetworkConnectivity.test';
import browserSystemIntegrationTest from './Integration/SystemIntegration.test';
import browserUserScenarioTest from './Integration/UserScenarios.test';

// Suites of the Interaction area.
import browserA11yNavigationTest from './Interaction/A11yNavigation.test';
import browserButtonInteractionTest from './Interaction/ButtonInteraction.test';
import browserContentScalingTest from './Interaction/ContentScaling.test';
import browserDataBindingTest from './Interaction/DataBinding.test';
import browserEventHandlingTest from './Interaction/EventHandling.test';
import browserEventPropagationTest from './Interaction/EventPropagation.test';
import browserFocusNavigationTest from './Interaction/FocusNavigation.test';
import browserFocusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import browserGestureRecognitionTest from './Interaction/GestureRecognition.test';
import browserLayoutPositioningTest from './Interaction/LayoutPositioning.test';
import browserThemeVariationTest from './Interaction/ThemeVariation.test';
import browserTouchInteractionTest from './Interaction/TouchInteraction.test';
import browserUIComponentRenderingTest from './Interaction/UIComponentRendering.test';
import browserVisualEffectsTest from './Interaction/VisualEffects.test';

// Suites of the LifecycleState area.
import browserAbilityLifecycleTest from './LifecycleState/AbilityLifecycle.test';
import browserStateFlowTest from './LifecycleState/BrowserStateFlow.test';
import browserConfigurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import browserLifecycleErrorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import browserExceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import browserPageLifecycleTest from './LifecycleState/PageLifecycle.test';
import browserResourceManagementTest from './LifecycleState/ResourceManagement.test';
import browserSessionManagementTest from './LifecycleState/SessionManagement.test';
import browserStatePersistenceTest from './LifecycleState/StatePersistence.test';
import browserStateRecoveryTest from './LifecycleState/StateRecovery.test';

// Suites of the PerformanceStability area.
import browserAnimationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import browserConcurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import browserLongTermStabilityTest from './PerformanceStability/LongTermStability.test';
import browserMemoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import browserPerformanceStressTest from './PerformanceStability/PerformanceStress.test';
import browserWebRenderPerformanceTest from './PerformanceStability/WebRenderPerformance.test';
import browserWebViewConsumptionTest from './PerformanceStability/WebViewConsumption.test';

// Suites of the Security area.
import browserSecurityTest from './Security/BrowserSecurity.test';
import securityA11yTest from './Security/SecurityA11y.test';
import securityValidationTest from './Security/SecurityValidation.test';

// Suites of the Validation area.
import browserAnimationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import browserBoundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import browserCommonEventUtilValidationTest from './Validation/CommonEventUtilValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import indexStateManagerValidationTest from './Validation/IndexStateManagerValidation.test';
import browserInputValidationTest from './Validation/InputValidation.test';
import browserKeyEventValidationTest from './Validation/KeyEventValidation.test';
import browserLoggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';

/** Registers every browser suite of this module. */
export default function testsuite(): void {
  // app.test.ets
  appTest();
  // Browser
  browserConcurrencyTest();
  browserConsistencyTest();
  browserEndToEndTest();
  browserErrorRecoveryTest();
  browserInputInteractionTest();
  browserLifecycleTest();
  browserMenuConfigurationTest();
  browserModelDeepTest();
  browserOperationWorkflowTest();
  browserStateManagementTest();
  browserStressTest();
  browserUITest();
  browserTabItemModelTest();
  tabOperationCatalogTest();
  tabOperationsTest();
  urlOperationFlowTest();
  // BrowserValidation
  browserAppVersionValidationTest();
  browserAuthSessionValidationTest();
  browserDataSourceValidationTest();
  browserEventToolValidationTest();
  browserInterruptionRecoveryTest();
  browserNotificationValidationTest();
  browserOfflineNetworkTest();
  browserSessionValidationTest();
  // Integration
  browserAdvancedScenariosTest();
  browserCompatibilityTest();
  browserComprehensiveRegressionTest();
  browserDeviceCompatibilityTest();
  browserIntegrationTestingTest();
  browserLocalizationTest();
  browserNetworkConnectivityTest();
  browserSystemIntegrationTest();
  browserUserScenarioTest();
  // Interaction
  browserA11yNavigationTest();
  browserButtonInteractionTest();
  browserContentScalingTest();
  browserDataBindingTest();
  browserEventHandlingTest();
  browserEventPropagationTest();
  browserFocusNavigationTest();
  browserFocusRingBehaviorTest();
  browserGestureRecognitionTest();
  browserLayoutPositioningTest();
  browserThemeVariationTest();
  browserTouchInteractionTest();
  browserUIComponentRenderingTest();
  browserVisualEffectsTest();
  // LifecycleState
  browserAbilityLifecycleTest();
  browserStateFlowTest();
  browserConfigurationChangesTest();
  browserLifecycleErrorRecoveryTest();
  browserExceptionHandlingTest();
  browserPageLifecycleTest();
  browserResourceManagementTest();
  browserSessionManagementTest();
  browserStatePersistenceTest();
  browserStateRecoveryTest();
  // PerformanceStability
  browserAnimationPerformanceTest();
  browserConcurrencyControlTest();
  browserLongTermStabilityTest();
  browserMemoryLeakDetectionTest();
  browserPerformanceStressTest();
  browserWebRenderPerformanceTest();
  browserWebViewConsumptionTest();
  // Security
  browserSecurityTest();
  securityA11yTest();
  securityValidationTest();
  // Validation
  browserAnimationControllerValidationTest();
  browserBoundaryErrorTestingTest();
  browserCommonEventUtilValidationTest();
  configurationManagerValidationTest();
  focusManagerValidationTest();
  indexStateManagerValidationTest();
  browserInputValidationTest();
  browserKeyEventValidationTest();
  browserLoggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
}

