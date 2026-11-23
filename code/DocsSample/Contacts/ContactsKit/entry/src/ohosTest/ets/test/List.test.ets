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
import contactOperationsTest from './Contacts/ContactOperations.test';
import contactInputInteractionTest from './Contacts/ContactInputInteraction.test';
import contactPageStateManagementTest from './Contacts/ContactPageStateManagement.test';
import contactPickerConcurrencyTest from './Contacts/ContactPickerConcurrency.test';
import contactPickerConsistencyTest from './Contacts/ContactPickerConsistency.test';
import contactPickerEndToEndTest from './Contacts/ContactPickerEndToEnd.test';
import contactPickerErrorRecoveryTest from './Contacts/ContactPickerErrorRecovery.test';
import contactPickerLifecycleTest from './Contacts/ContactPickerLifecycle.test';
import contactPickerStressTest from './Contacts/ContactPickerStress.test';
import contactPickerUITest from './Contacts/ContactPickerUI.test';
import contactItemInfoModelTest from './Contacts/ContactItemInfoModel.test';
import contactAuthSessionTest from './ContactsValidation/ContactAuthSession.test';
import contactDataSourceValidationTest from './ContactsValidation/ContactDataSourceValidation.test';
import contactEventToolValidationTest from './ContactsValidation/ContactEventToolValidation.test';
import contactInterruptionRecoveryTest from './ContactsValidation/ContactInterruptionRecovery.test';
import contactKitVersionTest from './ContactsValidation/ContactKitVersion.test';
import contactNotificationTest from './ContactsValidation/ContactNotification.test';
import contactOfflineNetworkTest from './ContactsValidation/ContactOfflineNetwork.test';
import contactSessionValidationTest from './ContactsValidation/ContactSessionValidation.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import contactKitCompatibilityTest from './Integration/ContactKitCompatibility.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import dialogPositioningTest from './Interaction/DialogPositioning.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import uiComponentRenderingTest from './Interaction/UIComponentRendering.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import pickerLifecycleTest from './LifecycleState/PickerLifecycle.test';
import pickerStateManagementTest from './LifecycleState/PickerStateManagement.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import batteryAndResourceConsumptionTest from './PerformanceStability/BatteryAndResourceConsumption.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import operationPerformanceTest from './PerformanceStability/OperationPerformance.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import pickerAnimationPerformanceTest from './PerformanceStability/PickerAnimationPerformance.test';
import contactDataSecurityTest from './Security/ContactDataSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import buttonFocusManagerValidationTest from './Validation/ButtonFocusManagerValidation.test';
import contactBoundaryErrorTestingTest from './Validation/ContactBoundaryErrorTesting.test';
import contactChangeEventValidationTest from './Validation/ContactChangeEventValidation.test';
import contactConfigManagerValidationTest from './Validation/ContactConfigManagerValidation.test';
import contactInputValidationTest from './Validation/ContactInputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pickerSessionValidationTest from './Validation/PickerSessionValidation.test';
import pickerStateManagerValidationTest from './Validation/PickerStateManagerValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
import touchPointValidationTest from './Validation/TouchPointValidation.test';

export default function testsuite(): void {
  abilityTest();
  contactOperationsTest();
  contactInputInteractionTest();
  contactPageStateManagementTest();
  contactPickerConcurrencyTest();
  contactPickerConsistencyTest();
  contactPickerEndToEndTest();
  contactPickerErrorRecoveryTest();
  contactPickerLifecycleTest();
  contactPickerStressTest();
  contactPickerUITest();
  contactItemInfoModelTest();
  contactAuthSessionTest();
  contactDataSourceValidationTest();
  contactEventToolValidationTest();
  contactInterruptionRecoveryTest();
  contactKitVersionTest();
  contactNotificationTest();
  contactOfflineNetworkTest();
  contactSessionValidationTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  contactKitCompatibilityTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  systemIntegrationTest();
  userScenariosTest();
  accessibilityNavigationTest();
  buttonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  dialogPositioningTest();
  eventHandlingTest();
  eventPropagationTest();
  focusNavigationTest();
  focusRingBehaviorTest();
  gestureRecognitionTest();
  themeVariationTest();
  touchInteractionTest();
  uiComponentRenderingTest();
  visualEffectsTest();
  configurationChangesTest();
  errorRecoveryTest();
  exceptionHandlingTest();
  extensionLifecycleTest();
  pickerLifecycleTest();
  pickerStateManagementTest();
  resourceManagementTest();
  sessionManagementTest();
  statePersistenceTest();
  stateRecoveryTest();
  batteryAndResourceConsumptionTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  operationPerformanceTest();
  performanceStressTest();
  pickerAnimationPerformanceTest();
  contactDataSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  buttonFocusManagerValidationTest();
  contactBoundaryErrorTestingTest();
  contactChangeEventValidationTest();
  contactConfigManagerValidationTest();
  contactInputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pickerSessionValidationTest();
  pickerStateManagerValidationTest();
  resourceLoaderValidationTest();
  touchPointValidationTest();
}