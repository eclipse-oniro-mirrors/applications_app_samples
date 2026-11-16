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
import integrationAdvancedScenariosTest from './Integration/AdvancedScenarios.test';
import integrationComprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import integrationDeviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationIntegrationTestingTest from './Integration/IntegrationTesting.test';
import integrationLocalizationTestingTest from './Integration/LocalizationTesting.test';
import integrationNetworkConnectivityTest from './Integration/NetworkConnectivity.test';
import integrationRouterCompatibilityTest from './Integration/RouterCompatibility.test';
import integrationSystemIntegrationTest from './Integration/SystemIntegration.test';
import integrationUserScenariosTest from './Integration/UserScenarios.test';
import interactionAccessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import interactionButtonInteractionTest from './Interaction/ButtonInteraction.test';
import interactionContentScalingTest from './Interaction/ContentScaling.test';
import interactionDataBindingTest from './Interaction/DataBinding.test';
import interactionPagePositioningTest from './Interaction/PagePositioning.test';
import interactionEventHandlingTest from './Interaction/EventHandling.test';
import interactionEventPropagationTest from './Interaction/EventPropagation.test';
import interactionFocusNavigationTest from './Interaction/FocusNavigation.test';
import interactionFocusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import interactionGestureRecognitionTest from './Interaction/GestureRecognition.test';
import interactionThemeVariationTest from './Interaction/ThemeVariation.test';
import interactionTouchInteractionTest from './Interaction/TouchInteraction.test';
import interactionUIComponentRenderingTest from './Interaction/UIComponentRendering.test';
import interactionVisualEffectsTest from './Interaction/VisualEffects.test';
import lifecycleStateConfigurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import lifecycleStatePageLifecycleTest from './LifecycleState/PageLifecycle.test';
import lifecycleStatePageStateManagementTest from './LifecycleState/PageStateManagement.test';
import lifecycleStateErrorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import lifecycleStateExceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import lifecycleStateExtensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import lifecycleStateResourceManagementTest from './LifecycleState/ResourceManagement.test';
import lifecycleStateSessionManagementTest from './LifecycleState/SessionManagement.test';
import lifecycleStateStatePersistenceTest from './LifecycleState/StatePersistence.test';
import lifecycleStateStateRecoveryTest from './LifecycleState/StateRecovery.test';
import performanceStabilityAnimationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import performanceStabilityConcurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import performanceStabilityLongTermStabilityTest from './PerformanceStability/LongTermStability.test';
import performanceStabilityMemoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStabilityPerformanceStressTest from './PerformanceStability/PerformanceStress.test';
import performanceStabilityRouterConsumptionTest from './PerformanceStability/RouterConsumption.test';
import performanceStabilityRouterPerformanceTest from './PerformanceStability/RouterPerformance.test';
import navigationNavigationConcurrencyTest from './Navigation/NavigationConcurrency.test';
import navigationNavigationConsistencyTest from './Navigation/NavigationConsistency.test';
import navigationNavigationEndToEndTest from './Navigation/NavigationEndToEnd.test';
import navigationNavigationErrorRecoveryTest from './Navigation/NavigationErrorRecovery.test';
import navigationNavigationLifecycleTest from './Navigation/NavigationLifecycle.test';
import navigationNavigationStateManagementTest from './Navigation/NavigationStateManagement.test';
import navigationNavigationStressTest from './Navigation/NavigationStress.test';
import navigationNavigationUITest from './Navigation/NavigationUI.test';
import navigationRouterInputInteractionTest from './Navigation/RouterInputInteraction.test';
import navigationRouterItemInfoModelTest from './Navigation/RouterItemInfoModel.test';
import navigationRouterMenuConfigurationTest from './Navigation/RouterMenuConfiguration.test';
import navigationRouterModelDeepTest from './Navigation/RouterModelDeep.test';
import navigationRouterOperationCatalogTest from './Navigation/RouterOperationCatalog.test';
import navigationRouterOperationFlowTest from './Navigation/RouterOperationFlow.test';
import navigationRouterOperationWorkflowTest from './Navigation/RouterOperationWorkflow.test';
import navigationRouterOperationsTest from './Navigation/RouterOperations.test';
import routerValidationRouterAppVersionTest from './RouterValidation/RouterAppVersion.test';
import routerValidationRouterAuthSessionTest from './RouterValidation/RouterAuthSession.test';
import routerValidationRouterDataSourceValidationTest from './RouterValidation/RouterDataSourceValidation.test';
import routerValidationRouterEventToolValidationTest from './RouterValidation/RouterEventToolValidation.test';
import routerValidationRouterInterruptionRecoveryTest from './RouterValidation/RouterInterruptionRecovery.test';
import routerValidationRouterNotificationTest from './RouterValidation/RouterNotification.test';
import routerValidationRouterOfflineNetworkTest from './RouterValidation/RouterOfflineNetwork.test';
import routerValidationRouterSessionValidationTest from './RouterValidation/RouterSessionValidation.test';
import securityRouterSecurityTest from './Security/RouterSecurity.test';
import securitySecurityAccessibilityTest from './Security/SecurityAccessibility.test';
import securitySecurityValidationTest from './Security/SecurityValidation.test';
import validationAnimationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import validationBoundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import validationCommonEventUtilValidationTest from './Validation/CommonEventUtilValidation.test';
import validationConfigurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import validationPageStateManagerValidationTest from './Validation/PageStateManagerValidation.test';
import validationFocusManagerValidationTest from './Validation/FocusManagerValidation.test';
import validationInputValidationTest from './Validation/InputValidation.test';
import validationKeyCodeValidationTest from './Validation/KeyCodeValidation.test';
import validationLoggerValidationTest from './Validation/LoggerValidation.test';
import validationPointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import validationResourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';

export default function testsuite() {
  abilityTest();
  integrationAdvancedScenariosTest();
  integrationComprehensiveRegressionTest();
  integrationDeviceCompatibilityTest();
  integrationIntegrationTestingTest();
  integrationLocalizationTestingTest();
  integrationNetworkConnectivityTest();
  integrationRouterCompatibilityTest();
  integrationSystemIntegrationTest();
  integrationUserScenariosTest();
  interactionAccessibilityNavigationTest();
  interactionButtonInteractionTest();
  interactionContentScalingTest();
  interactionDataBindingTest();
  interactionPagePositioningTest();
  interactionEventHandlingTest();
  interactionEventPropagationTest();
  interactionFocusNavigationTest();
  interactionFocusRingBehaviorTest();
  interactionGestureRecognitionTest();
  interactionThemeVariationTest();
  interactionTouchInteractionTest();
  interactionUIComponentRenderingTest();
  interactionVisualEffectsTest();
  lifecycleStateConfigurationChangesTest();
  lifecycleStatePageLifecycleTest();
  lifecycleStatePageStateManagementTest();
  lifecycleStateErrorRecoveryTest();
  lifecycleStateExceptionHandlingTest();
  lifecycleStateExtensionLifecycleTest();
  lifecycleStateResourceManagementTest();
  lifecycleStateSessionManagementTest();
  lifecycleStateStatePersistenceTest();
  lifecycleStateStateRecoveryTest();
  performanceStabilityAnimationPerformanceTest();
  performanceStabilityConcurrencyControlTest();
  performanceStabilityLongTermStabilityTest();
  performanceStabilityMemoryLeakDetectionTest();
  performanceStabilityPerformanceStressTest();
  performanceStabilityRouterConsumptionTest();
  performanceStabilityRouterPerformanceTest();
  navigationNavigationConcurrencyTest();
  navigationNavigationConsistencyTest();
  navigationNavigationEndToEndTest();
  navigationNavigationErrorRecoveryTest();
  navigationNavigationLifecycleTest();
  navigationNavigationStateManagementTest();
  navigationNavigationStressTest();
  navigationNavigationUITest();
  navigationRouterInputInteractionTest();
  navigationRouterItemInfoModelTest();
  navigationRouterMenuConfigurationTest();
  navigationRouterModelDeepTest();
  navigationRouterOperationCatalogTest();
  navigationRouterOperationFlowTest();
  navigationRouterOperationWorkflowTest();
  navigationRouterOperationsTest();
  routerValidationRouterAppVersionTest();
  routerValidationRouterAuthSessionTest();
  routerValidationRouterDataSourceValidationTest();
  routerValidationRouterEventToolValidationTest();
  routerValidationRouterInterruptionRecoveryTest();
  routerValidationRouterNotificationTest();
  routerValidationRouterOfflineNetworkTest();
  routerValidationRouterSessionValidationTest();
  securityRouterSecurityTest();
  securitySecurityAccessibilityTest();
  securitySecurityValidationTest();
  validationAnimationControllerValidationTest();
  validationBoundaryErrorTestingTest();
  validationCommonEventUtilValidationTest();
  validationConfigurationManagerValidationTest();
  validationPageStateManagerValidationTest();
  validationFocusManagerValidationTest();
  validationInputValidationTest();
  validationKeyCodeValidationTest();
  validationLoggerValidationTest();
  validationPointerUtilValidationTest();
  validationResourceLoaderValidationTest();
}
