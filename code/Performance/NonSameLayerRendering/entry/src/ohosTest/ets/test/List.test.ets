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

import renderingAbilityTest from './RenderingAbility.test';
import renderingAdvancedScenariosTest from './Integration/RenderingAdvancedScenarios.test';
import renderingComprehensiveRegressionTest from './Integration/RenderingComprehensiveRegression.test';
import renderingDeviceCompatibilityTest from './Integration/RenderingDeviceCompatibility.test';
import renderingIntegrationTestingTest from './Integration/RenderingIntegrationTesting.test';
import renderingLocalizationTestingTest from './Integration/RenderingLocalizationTesting.test';
import renderingNetworkConnectivityTest from './Integration/RenderingNetworkConnectivity.test';
import renderingProductCompatibilityTest from './Integration/RenderingProductCompatibility.test';
import renderingSystemIntegrationTest from './Integration/RenderingSystemIntegration.test';
import renderingUserScenariosTest from './Integration/RenderingUserScenarios.test';
import renderingAccessibilityNavigationTest from './Interaction/RenderingAccessibilityNavigation.test';
import renderingButtonInteractionTest from './Interaction/RenderingButtonInteraction.test';
import renderingContentScalingTest from './Interaction/RenderingContentScaling.test';
import renderingDataBindingTest from './Interaction/RenderingDataBinding.test';
import renderingOverlayPositioningTest from './Interaction/RenderingOverlayPositioning.test';
import renderingEventHandlingTest from './Interaction/RenderingEventHandling.test';
import renderingEventPropagationTest from './Interaction/RenderingEventPropagation.test';
import renderingFocusNavigationTest from './Interaction/RenderingFocusNavigation.test';
import renderingFocusRingBehaviorTest from './Interaction/RenderingFocusRingBehavior.test';
import renderingGestureRecognitionTest from './Interaction/RenderingGestureRecognition.test';
import renderingThemeVariationTest from './Interaction/RenderingThemeVariation.test';
import renderingTouchInteractionTest from './Interaction/RenderingTouchInteraction.test';
import renderingUIComponentRenderingTest from './Interaction/RenderingUIComponentRendering.test';
import renderingVisualEffectsTest from './Interaction/RenderingVisualEffects.test';
import renderingConfigurationChangesTest from './LifecycleState/RenderingConfigurationChanges.test';
import renderingOverlayLifecycleTest from './LifecycleState/RenderingOverlayLifecycle.test';
import renderingOverlayStateManagementTest from './LifecycleState/RenderingOverlayStateManagement.test';
import renderingErrorRecoveryTest from './LifecycleState/RenderingErrorRecovery.test';
import renderingExceptionHandlingTest from './LifecycleState/RenderingExceptionHandling.test';
import renderingExtensionLifecycleTest from './LifecycleState/RenderingExtensionLifecycle.test';
import renderingResourceManagementTest from './LifecycleState/RenderingResourceManagement.test';
import renderingSessionManagementTest from './LifecycleState/RenderingSessionManagement.test';
import renderingStatePersistenceTest from './LifecycleState/RenderingStatePersistence.test';
import renderingStateRecoveryTest from './LifecycleState/RenderingStateRecovery.test';
import renderingAnimationPerformanceTest from './PerformanceStability/RenderingAnimationPerformance.test';
import renderingConcurrencyControlTest from './PerformanceStability/RenderingConcurrencyControl.test';
import renderingLongTermStabilityTest from './PerformanceStability/RenderingLongTermStability.test';
import renderingMemoryLeakDetectionTest from './PerformanceStability/RenderingMemoryLeakDetection.test';
import renderingPerformanceStressTest from './PerformanceStability/RenderingPerformanceStress.test';
import renderingProductConsumptionTest from './PerformanceStability/RenderingProductConsumption.test';
import renderingProductPerformanceTest from './PerformanceStability/RenderingProductPerformance.test';
import renderingProductOverlayConcurrencyTest from './PowerDialog/RenderingProductOverlayConcurrency.test';
import renderingProductOverlayConsistencyTest from './PowerDialog/RenderingProductOverlayConsistency.test';
import renderingProductOverlayEndToEndTest from './PowerDialog/RenderingProductOverlayEndToEnd.test';
import renderingProductOverlayErrorRecoveryTest from './PowerDialog/RenderingProductOverlayErrorRecovery.test';
import renderingProductOverlayLifecycleTest from './PowerDialog/RenderingProductOverlayLifecycle.test';
import renderingProductOverlayStateManagementTest from './PowerDialog/RenderingProductOverlayStateManagement.test';
import renderingProductOverlayStressTest from './PowerDialog/RenderingProductOverlayStress.test';
import renderingProductOverlayUITest from './PowerDialog/RenderingProductOverlayUI.test';
import renderingProductInputInteractionTest from './PowerDialog/RenderingProductInputInteraction.test';
import renderingProductItemInfoModelTest from './PowerDialog/RenderingProductItemInfoModel.test';
import renderingProductMenuConfigurationTest from './PowerDialog/RenderingProductMenuConfiguration.test';
import renderingProductModelDeepTest from './PowerDialog/RenderingProductModelDeep.test';
import renderingProductOperationCatalogTest from './PowerDialog/RenderingProductOperationCatalog.test';
import renderingProductOperationFlowTest from './PowerDialog/RenderingProductOperationFlow.test';
import renderingProductOperationsTest from './PowerDialog/RenderingProductOperations.test';
import renderingProductOperationWorkflowTest from './PowerDialog/RenderingProductOperationWorkflow.test';
import renderingProductAppVersionTest from './PowerValidation/RenderingProductAppVersion.test';
import renderingProductAuthSessionTest from './PowerValidation/RenderingProductAuthSession.test';
import renderingProductDataSourceValidationTest from './PowerValidation/RenderingProductDataSourceValidation.test';
import renderingProductEventToolValidationTest from './PowerValidation/RenderingProductEventToolValidation.test';
import renderingProductInterruptionRecoveryTest from './PowerValidation/RenderingProductInterruptionRecovery.test';
import renderingProductNotificationTest from './PowerValidation/RenderingProductNotification.test';
import renderingProductOfflineNetworkTest from './PowerValidation/RenderingProductOfflineNetwork.test';
import renderingProductSessionValidationTest from './PowerValidation/RenderingProductSessionValidation.test';
import renderingProductSecurityTest from './Security/RenderingProductSecurity.test';
import renderingSecurityAccessibilityTest from './Security/RenderingSecurityAccessibility.test';
import renderingSecurityValidationTest from './Security/RenderingSecurityValidation.test';
import renderingAnimationControllerValidationTest from './Validation/RenderingAnimationControllerValidation.test';
import renderingBoundaryErrorTestingTest from './Validation/RenderingBoundaryErrorTesting.test';
import renderingCommonEventUtilValidationTest from './Validation/RenderingCommonEventUtilValidation.test';
import renderingConfigurationManagerValidationTest from './Validation/RenderingConfigurationManagerValidation.test';
import renderingOverlayStateManagerValidationTest from './Validation/RenderingOverlayStateManagerValidation.test';
import renderingFocusManagerValidationTest from './Validation/RenderingFocusManagerValidation.test';
import renderingInputValidationTest from './Validation/RenderingInputValidation.test';
import renderingKeyCodeValidationTest from './Validation/RenderingKeyCodeValidation.test';
import renderingLoggerValidationTest from './Validation/RenderingLoggerValidation.test';
import renderingPointerUtilValidationTest from './Validation/RenderingPointerUtilValidation.test';
import renderingResourceLoaderValidationTest from './Validation/RenderingResourceLoaderValidation.test';
import renderingIntegrationTest from './RenderingIntegration.test';

export default function testsuite(): void {
  // Register RenderingAbility: production model and rendering contract coverage.
  renderingAbilityTest();
  // Register RenderingAdvancedScenarios: production model and rendering contract coverage.
  renderingAdvancedScenariosTest();
  // Register RenderingComprehensiveRegression: production model and rendering contract coverage.
  renderingComprehensiveRegressionTest();
  // Register RenderingDeviceCompatibility: production model and rendering contract coverage.
  renderingDeviceCompatibilityTest();
  // Register RenderingIntegrationTesting: production model and rendering contract coverage.
  renderingIntegrationTestingTest();
  // Register RenderingLocalizationTesting: production model and rendering contract coverage.
  renderingLocalizationTestingTest();
  // Register RenderingNetworkConnectivity: production model and rendering contract coverage.
  renderingNetworkConnectivityTest();
  // Register RenderingProductCompatibility: production model and rendering contract coverage.
  renderingProductCompatibilityTest();
  // Register RenderingSystemIntegration: production model and rendering contract coverage.
  renderingSystemIntegrationTest();
  // Register RenderingUserScenarios: production model and rendering contract coverage.
  renderingUserScenariosTest();
  // Register RenderingAccessibilityNavigation: production model and rendering contract coverage.
  renderingAccessibilityNavigationTest();
  // Register RenderingButtonInteraction: production model and rendering contract coverage.
  renderingButtonInteractionTest();
  // Register RenderingContentScaling: production model and rendering contract coverage.
  renderingContentScalingTest();
  // Register RenderingDataBinding: production model and rendering contract coverage.
  renderingDataBindingTest();
  // Register RenderingOverlayPositioning: production model and rendering contract coverage.
  renderingOverlayPositioningTest();
  // Register RenderingEventHandling: production model and rendering contract coverage.
  renderingEventHandlingTest();
  // Register RenderingEventPropagation: production model and rendering contract coverage.
  renderingEventPropagationTest();
  // Register RenderingFocusNavigation: production model and rendering contract coverage.
  renderingFocusNavigationTest();
  // Register RenderingFocusRingBehavior: production model and rendering contract coverage.
  renderingFocusRingBehaviorTest();
  // Register RenderingGestureRecognition: production model and rendering contract coverage.
  renderingGestureRecognitionTest();
  // Register RenderingThemeVariation: production model and rendering contract coverage.
  renderingThemeVariationTest();
  // Register RenderingTouchInteraction: production model and rendering contract coverage.
  renderingTouchInteractionTest();
  // Register RenderingUIComponentRendering: production model and rendering contract coverage.
  renderingUIComponentRenderingTest();
  // Register RenderingVisualEffects: production model and rendering contract coverage.
  renderingVisualEffectsTest();
  // Register RenderingConfigurationChanges: production model and rendering contract coverage.
  renderingConfigurationChangesTest();
  // Register RenderingOverlayLifecycle: production model and rendering contract coverage.
  renderingOverlayLifecycleTest();
  // Register RenderingOverlayStateManagement: production model and rendering contract coverage.
  renderingOverlayStateManagementTest();
  // Register RenderingErrorRecovery: production model and rendering contract coverage.
  renderingErrorRecoveryTest();
  // Register RenderingExceptionHandling: production model and rendering contract coverage.
  renderingExceptionHandlingTest();
  // Register RenderingExtensionLifecycle: production model and rendering contract coverage.
  renderingExtensionLifecycleTest();
  // Register RenderingResourceManagement: production model and rendering contract coverage.
  renderingResourceManagementTest();
  // Register RenderingSessionManagement: production model and rendering contract coverage.
  renderingSessionManagementTest();
  // Register RenderingStatePersistence: production model and rendering contract coverage.
  renderingStatePersistenceTest();
  // Register RenderingStateRecovery: production model and rendering contract coverage.
  renderingStateRecoveryTest();
  // Register RenderingAnimationPerformance: production model and rendering contract coverage.
  renderingAnimationPerformanceTest();
  // Register RenderingConcurrencyControl: production model and rendering contract coverage.
  renderingConcurrencyControlTest();
  // Register RenderingLongTermStability: production model and rendering contract coverage.
  renderingLongTermStabilityTest();
  // Register RenderingMemoryLeakDetection: production model and rendering contract coverage.
  renderingMemoryLeakDetectionTest();
  // Register RenderingPerformanceStress: production model and rendering contract coverage.
  renderingPerformanceStressTest();
  // Register RenderingProductConsumption: production model and rendering contract coverage.
  renderingProductConsumptionTest();
  // Register RenderingProductPerformance: production model and rendering contract coverage.
  renderingProductPerformanceTest();
  // Register RenderingProductOverlayConcurrency: production model and rendering contract coverage.
  renderingProductOverlayConcurrencyTest();
  // Register RenderingProductOverlayConsistency: production model and rendering contract coverage.
  renderingProductOverlayConsistencyTest();
  // Register RenderingProductOverlayEndToEnd: production model and rendering contract coverage.
  renderingProductOverlayEndToEndTest();
  // Register RenderingProductOverlayErrorRecovery: production model and rendering contract coverage.
  renderingProductOverlayErrorRecoveryTest();
  // Register RenderingProductOverlayLifecycle: production model and rendering contract coverage.
  renderingProductOverlayLifecycleTest();
  // Register RenderingProductOverlayStateManagement: production model and rendering contract coverage.
  renderingProductOverlayStateManagementTest();
  // Register RenderingProductOverlayStress: production model and rendering contract coverage.
  renderingProductOverlayStressTest();
  // Register RenderingProductOverlayUI: production model and rendering contract coverage.
  renderingProductOverlayUITest();
  // Register RenderingProductInputInteraction: production model and rendering contract coverage.
  renderingProductInputInteractionTest();
  // Register RenderingProductItemInfoModel: production model and rendering contract coverage.
  renderingProductItemInfoModelTest();
  // Register RenderingProductMenuConfiguration: production model and rendering contract coverage.
  renderingProductMenuConfigurationTest();
  // Register RenderingProductModelDeep: production model and rendering contract coverage.
  renderingProductModelDeepTest();
  // Register RenderingProductOperationCatalog: production model and rendering contract coverage.
  renderingProductOperationCatalogTest();
  // Register RenderingProductOperationFlow: production model and rendering contract coverage.
  renderingProductOperationFlowTest();
  // Register RenderingProductOperations: production model and rendering contract coverage.
  renderingProductOperationsTest();
  // Register RenderingProductOperationWorkflow: production model and rendering contract coverage.
  renderingProductOperationWorkflowTest();
  // Register RenderingProductAppVersion: production model and rendering contract coverage.
  renderingProductAppVersionTest();
  // Register RenderingProductAuthSession: production model and rendering contract coverage.
  renderingProductAuthSessionTest();
  // Register RenderingProductDataSourceValidation: production model and rendering contract coverage.
  renderingProductDataSourceValidationTest();
  // Register RenderingProductEventToolValidation: production model and rendering contract coverage.
  renderingProductEventToolValidationTest();
  // Register RenderingProductInterruptionRecovery: production model and rendering contract coverage.
  renderingProductInterruptionRecoveryTest();
  // Register RenderingProductNotification: production model and rendering contract coverage.
  renderingProductNotificationTest();
  // Register RenderingProductOfflineNetwork: production model and rendering contract coverage.
  renderingProductOfflineNetworkTest();
  // Register RenderingProductSessionValidation: production model and rendering contract coverage.
  renderingProductSessionValidationTest();
  // Register RenderingProductSecurity: production model and rendering contract coverage.
  renderingProductSecurityTest();
  // Register RenderingSecurityAccessibility: production model and rendering contract coverage.
  renderingSecurityAccessibilityTest();
  // Register RenderingSecurityValidation: production model and rendering contract coverage.
  renderingSecurityValidationTest();
  // Register RenderingAnimationControllerValidation: production model and rendering contract coverage.
  renderingAnimationControllerValidationTest();
  // Register RenderingBoundaryErrorTesting: production model and rendering contract coverage.
  renderingBoundaryErrorTestingTest();
  // Register RenderingCommonEventUtilValidation: production model and rendering contract coverage.
  renderingCommonEventUtilValidationTest();
  // Register RenderingConfigurationManagerValidation: production model and rendering contract coverage.
  renderingConfigurationManagerValidationTest();
  // Register RenderingOverlayStateManagerValidation: production model and rendering contract coverage.
  renderingOverlayStateManagerValidationTest();
  // Register RenderingFocusManagerValidation: production model and rendering contract coverage.
  renderingFocusManagerValidationTest();
  // Register RenderingInputValidation: production model and rendering contract coverage.
  renderingInputValidationTest();
  // Register RenderingKeyCodeValidation: production model and rendering contract coverage.
  renderingKeyCodeValidationTest();
  // Register RenderingLoggerValidation: production model and rendering contract coverage.
  renderingLoggerValidationTest();
  // Register RenderingPointerUtilValidation: production model and rendering contract coverage.
  renderingPointerUtilValidationTest();
  // Register RenderingResourceLoaderValidation: production model and rendering contract coverage.
  renderingResourceLoaderValidationTest();
  // Register RenderingIntegration: production model and rendering contract coverage.
  renderingIntegrationTest();
}
