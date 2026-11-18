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

// Structured screenshot suites, ported one to one from the reference power dialog sample.
import abilityTest from './Ability.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import screenshotCompatibilityTest from './Integration/ScreenshotCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import previewPositioningTest from './Interaction/PreviewPositioning.test';
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
import previewLifecycleTest from './LifecycleState/PreviewLifecycle.test';
import previewStateManagementTest from './LifecycleState/PreviewStateManagement.test';
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
import capturePerformanceTest from './PerformanceStability/CapturePerformance.test';
import captureConcurrencyTest from './Screenshot/CaptureConcurrency.test';
import captureConsistencyTest from './Screenshot/CaptureConsistency.test';
import captureEndToEndTest from './Screenshot/CaptureEndToEnd.test';
import captureErrorRecoveryTest from './Screenshot/CaptureErrorRecovery.test';
import captureLifecycleTest from './Screenshot/CaptureLifecycle.test';
import captureStateManagementTest from './Screenshot/CaptureStateManagement.test';
import captureStressTest from './Screenshot/CaptureStress.test';
import captureUITest from './Screenshot/CaptureUI.test';
import captureInputInteractionTest from './Screenshot/CaptureInputInteraction.test';
import captureItemInfoModelTest from './Screenshot/CaptureItemInfoModel.test';
import captureConfigurationTest from './Screenshot/CaptureConfiguration.test';
import captureModelDeepTest from './Screenshot/CaptureModelDeep.test';
import captureOperationCatalogTest from './Screenshot/CaptureOperationCatalog.test';
import captureOperationFlowTest from './Screenshot/CaptureOperationFlow.test';
import captureOperationsTest from './Screenshot/CaptureOperations.test';
import captureWorkflowTest from './Screenshot/CaptureWorkflow.test';
import captureAppVersionTest from './ScreenshotValidation/CaptureAppVersion.test';
import captureAuthSessionTest from './ScreenshotValidation/CaptureAuthSession.test';
import captureDataSourceValidationTest from './ScreenshotValidation/CaptureDataSourceValidation.test';
import captureEventToolValidationTest from './ScreenshotValidation/CaptureEventToolValidation.test';
import captureInterruptionRecoveryTest from './ScreenshotValidation/CaptureInterruptionRecovery.test';
import captureNotificationTest from './ScreenshotValidation/CaptureNotification.test';
import captureOfflineNetworkTest from './ScreenshotValidation/CaptureOfflineNetwork.test';
import captureSessionValidationTest from './ScreenshotValidation/CaptureSessionValidation.test';
import screenshotSecurityTest from './Security/ScreenshotSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import windowAnimationValidationTest from './Validation/WindowAnimationValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import systemEventValidationTest from './Validation/SystemEventValidation.test';
import displayConfigurationValidationTest from './Validation/DisplayConfigurationValidation.test';
import previewStateValidationTest from './Validation/PreviewStateValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import sizeCalcValidationTest from './Validation/SizeCalcValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';

// Legacy flat suites kept for backward compatibility of the existing pipeline.
import accessibilityDeepTest from './AccessibilityDeep.test';
import advancedTest from './Advanced.test';
import chaosTest from './Chaos.test';
import compatibilityMatrixTest from './CompatibilityMatrix.test';
import compatibilityMatrixCatalogATest from './CompatibilityMatrixCatalogA.test';
import compatibilityMatrixCatalogBTest from './CompatibilityMatrixCatalogB.test';
import compatibilityMatrixCatalogCTest from './CompatibilityMatrixCatalogC.test';
import concurrencyTest from './Concurrency.test';
import dataIntegrityTest from './DataIntegrity.test';
import i18nDeepTest from './I18nDeep.test';
import integrationSceneTest from './IntegrationScene.test';
import mainPageTest from './MainPage.test';
import performanceDeepTest from './PerformanceDeep.test';
import regressionTest from './Regression.test';
import screenShotModelTest from './ScreenShotModel.test';
import securityTest from './Security.test';
import serviceExtAbilityTest from './ServiceExtAbility.test';
import viewModelTest from './ViewModel.test';

/**
 * List.test.ets is the single entry point consumed by OpenHarmonyTestRunner.
 * Every suite below is registered exactly once so the runner can execute the whole
 * capture feature scope: model, view model, extension ability, window, resources
 * and the interaction, lifecycle, performance, integration and security dimensions.
 */
export default function testsuite(): void {
  // Structured screenshot suites.
  abilityTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  screenshotCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();
  accessibilityNavigationTest();
  buttonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  previewPositioningTest();
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
  previewLifecycleTest();
  previewStateManagementTest();
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
  capturePerformanceTest();
  captureConcurrencyTest();
  captureConsistencyTest();
  captureEndToEndTest();
  captureErrorRecoveryTest();
  captureLifecycleTest();
  captureStateManagementTest();
  captureStressTest();
  captureUITest();
  captureInputInteractionTest();
  captureItemInfoModelTest();
  captureConfigurationTest();
  captureModelDeepTest();
  captureOperationCatalogTest();
  captureOperationFlowTest();
  captureOperationsTest();
  captureWorkflowTest();
  captureAppVersionTest();
  captureAuthSessionTest();
  captureDataSourceValidationTest();
  captureEventToolValidationTest();
  captureInterruptionRecoveryTest();
  captureNotificationTest();
  captureOfflineNetworkTest();
  captureSessionValidationTest();
  screenshotSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  windowAnimationValidationTest();
  boundaryErrorTestingTest();
  systemEventValidationTest();
  displayConfigurationValidationTest();
  previewStateValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  sizeCalcValidationTest();
  resourceLoaderValidationTest();

  // Legacy flat suites.
  accessibilityDeepTest();
  advancedTest();
  chaosTest();
  compatibilityMatrixTest();
  compatibilityMatrixCatalogATest();
  compatibilityMatrixCatalogBTest();
  compatibilityMatrixCatalogCTest();
  concurrencyTest();
  dataIntegrityTest();
  i18nDeepTest();
  integrationSceneTest();
  mainPageTest();
  performanceDeepTest();
  regressionTest();
  screenShotModelTest();
  securityTest();
  serviceExtAbilityTest();
  viewModelTest();
}
