'use static'


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

import tabsAdvancedScenariosTest from './Integration/AdvancedScenarios.test';
import tabsComprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import tabsDeviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import tabsIntegrationTestingTest from './Integration/IntegrationTesting.test';
import tabsLocalizationTestingTest from './Integration/LocalizationTesting.test';
import tabsOfflineResilienceTest from './Integration/NetworkConnectivity.test';
import tabsSurfaceCompatibilityTest from './Integration/SurfaceCompatibility.test';
import tabsSystemIntegrationTest from './Integration/SystemIntegration.test';
import tabsButtonInteractionTest from './Interaction/ButtonInteraction.test';
import tabsContentScalingTest from './Interaction/ContentScaling.test';
import tabsDataBindingTest from './Interaction/DataBinding.test';
import tabsPanelPositioningTest from './Interaction/PanelPositioning.test';
import tabsEventHandlerTest from './Interaction/EventHandling.test';
import tabsEventPropagationTest from './Interaction/EventPropagation.test';
import tabsGestureRecognitionTest from './Interaction/GestureRecognition.test';
import tabsThemeVariationTest from './Interaction/ThemeVariation.test';
import tabsTouchInteractionTest from './Interaction/TouchInteraction.test';
import tabsConfigurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import tabsPanelLifecycleTest from './LifecycleState/PanelLifecycle.test';
import tabsPanelStateManagementTest from './LifecycleState/PanelStateManagement.test';
import tabsExceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import tabsAbilityLifecycleTest from './LifecycleState/AbilityLifecycle.test';
import tabsResourceManagementTest from './LifecycleState/ResourceManagement.test';
import tabsSessionManagementTest from './LifecycleState/SessionManagement.test';
import tabsStatePersistenceTest from './LifecycleState/StatePersistence.test';
import tabsStateRecoveryTest from './LifecycleState/StateRecovery.test';
import tabsAnimationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import tabsConcurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import tabsLongTermStabilityTest from './PerformanceStability/LongTermStability.test';
import tabsMemoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import tabsPowerPerformanceTest from './PerformanceStability/PowerPerformance.test';
import tabPanelConsistencyTest from './TabPanel/TabPanelConsistency.test';
import tabPanelEndToEndTest from './TabPanel/TabPanelEndToEnd.test';
import tabPanelLifecycleTest from './TabPanel/TabPanelLifecycle.test';
import tabPanelStateManagementTest from './TabPanel/TabPanelStateManagement.test';
import tabPanelStressTest from './TabPanel/TabPanelStress.test';
import tabPanelUITest from './TabPanel/TabPanelUI.test';
import tabInputInteractionTest from './TabPanel/TabInputInteraction.test';
import tabBarConfigurationTest from './TabPanel/TabBarConfiguration.test';
import tabOperationCatalogTest from './TabPanel/TabOperationCatalog.test';
import tabOperationsTest from './TabPanel/TabOperations.test';
import panelAuthSessionTest from './PanelValidation/PanelAuthSession.test';
import panelDataSourceValidationTest from './PanelValidation/PanelDataSourceValidation.test';
import panelEventToolValidationTest from './PanelValidation/PanelEventToolValidation.test';
import panelNotificationTest from './PanelValidation/PanelNotification.test';
import panelSessionValidationTest from './PanelValidation/PanelSessionValidation.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';

export default function testsuite(): void {
  tabsAdvancedScenariosTest();
  tabsComprehensiveRegressionTest();
  tabsDeviceCompatibilityTest();
  tabsIntegrationTestingTest();
  tabsLocalizationTestingTest();
  tabsOfflineResilienceTest();
  tabsSurfaceCompatibilityTest();
  tabsSystemIntegrationTest();
  tabsButtonInteractionTest();
  tabsContentScalingTest();
  tabsDataBindingTest();
  tabsPanelPositioningTest();
  tabsEventHandlerTest();
  tabsEventPropagationTest();
  tabsGestureRecognitionTest();
  tabsThemeVariationTest();
  tabsTouchInteractionTest();
  tabsConfigurationChangesTest();
  tabsPanelLifecycleTest();
  tabsPanelStateManagementTest();
  tabsExceptionHandlingTest();
  tabsAbilityLifecycleTest();
  tabsResourceManagementTest();
  tabsSessionManagementTest();
  tabsStatePersistenceTest();
  tabsStateRecoveryTest();
  tabsAnimationPerformanceTest();
  tabsConcurrencyControlTest();
  tabsLongTermStabilityTest();
  tabsMemoryLeakDetectionTest();
  tabsPowerPerformanceTest();
  tabPanelConsistencyTest();
  tabPanelEndToEndTest();
  tabPanelLifecycleTest();
  tabPanelStateManagementTest();
  tabPanelStressTest();
  tabPanelUITest();
  tabInputInteractionTest();
  tabBarConfigurationTest();
  tabOperationCatalogTest();
  tabOperationsTest();
  panelAuthSessionTest();
  panelDataSourceValidationTest();
  panelEventToolValidationTest();
  panelNotificationTest();
  panelSessionValidationTest();
  securityAccessibilityTest();
  securityValidationTest();
  animationControllerValidationTest();
  resourceLoaderValidationTest();
}
