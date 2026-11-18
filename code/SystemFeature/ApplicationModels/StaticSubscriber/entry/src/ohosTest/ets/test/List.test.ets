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
import integrationAdvancedScenarios from './Integration/AdvancedScenarios.test';
import integrationComprehensiveRegression from './Integration/ComprehensiveRegression.test';
import integrationDeviceCompatibility from './Integration/DeviceCompatibility.test';
import integrationIntegrationTesting from './Integration/IntegrationTesting.test';
import integrationLocalizationTesting from './Integration/LocalizationTesting.test';
import integrationEventDeliveryConnectivity from './Integration/EventDeliveryConnectivity.test';
import integrationSubscriberCompatibility from './Integration/SubscriberCompatibility.test';
import integrationSystemIntegration from './Integration/SystemIntegration.test';
import integrationUserScenarios from './Integration/UserScenarios.test';
import interactionAccessibilityNavigation from './Interaction/AccessibilityNavigation.test';
import interactionButtonInteraction from './Interaction/ButtonInteraction.test';
import interactionContentScaling from './Interaction/ContentScaling.test';
import interactionDataBinding from './Interaction/DataBinding.test';
import interactionToastPositioning from './Interaction/ToastPositioning.test';
import interactionEventHandling from './Interaction/EventHandling.test';
import interactionEventPropagation from './Interaction/EventPropagation.test';
import interactionFocusNavigation from './Interaction/FocusNavigation.test';
import interactionFocusRingBehavior from './Interaction/FocusRingBehavior.test';
import interactionGestureRecognition from './Interaction/GestureRecognition.test';
import interactionThemeVariation from './Interaction/ThemeVariation.test';
import interactionTouchInteraction from './Interaction/TouchInteraction.test';
import interactionUIComponentRendering from './Interaction/UIComponentRendering.test';
import interactionVisualEffects from './Interaction/VisualEffects.test';
import lifecycleConfigurationChanges from './Lifecycle/ConfigurationChanges.test';
import lifecycleExtensionLifecycleBasics from './Lifecycle/ExtensionLifecycleBasics.test';
import lifecycleSubscriberStateManagement from './Lifecycle/SubscriberStateManagement.test';
import lifecycleErrorRecovery from './Lifecycle/ErrorRecovery.test';
import lifecycleExceptionHandling from './Lifecycle/ExceptionHandling.test';
import lifecycleStaticSubscriberExtensionLifecycle from './Lifecycle/StaticSubscriberExtensionLifecycle.test';
import lifecycleResourceManagement from './Lifecycle/ResourceManagement.test';
import lifecycleSessionManagement from './Lifecycle/SessionManagement.test';
import lifecycleStatePersistence from './Lifecycle/StatePersistence.test';
import lifecycleStateRecovery from './Lifecycle/StateRecovery.test';
import performanceToastAnimationPerformance from './Performance/ToastAnimationPerformance.test';
import performanceConcurrencyControl from './Performance/ConcurrencyControl.test';
import performanceLongTermStability from './Performance/LongTermStability.test';
import performanceMemoryLeakDetection from './Performance/MemoryLeakDetection.test';
import performancePerformanceStress from './Performance/PerformanceStress.test';
import performanceResourceConsumption from './Performance/ResourceConsumption.test';
import performanceSubscriberPerformance from './Performance/SubscriberPerformance.test';
import subscriberSubscriberConcurrency from './Subscriber/SubscriberConcurrency.test';
import subscriberSubscriberConsistency from './Subscriber/SubscriberConsistency.test';
import subscriberSubscriberEndToEnd from './Subscriber/SubscriberEndToEnd.test';
import subscriberSubscriberErrorRecovery from './Subscriber/SubscriberErrorRecovery.test';
import subscriberSubscriberLifecycle from './Subscriber/SubscriberLifecycle.test';
import subscriberSubscriberStateManagement from './Subscriber/SubscriberStateManagement.test';
import subscriberSubscriberStress from './Subscriber/SubscriberStress.test';
import subscriberSubscriberUI from './Subscriber/SubscriberUI.test';
import subscriberEventTriggerInteraction from './Subscriber/EventTriggerInteraction.test';
import subscriberEventDataModel from './Subscriber/EventDataModel.test';
import subscriberSubscribeConfiguration from './Subscriber/SubscribeConfiguration.test';
import subscriberSubscriberModelDeep from './Subscriber/SubscriberModelDeep.test';
import subscriberNotificationCatalog from './Subscriber/NotificationCatalog.test';
import subscriberNotificationFlow from './Subscriber/NotificationFlow.test';
import subscriberNotificationOperations from './Subscriber/NotificationOperations.test';
import subscriberNotificationWorkflow from './Subscriber/NotificationWorkflow.test';
import subscriberValidationSubscriberAppVersion from './SubscriberValidation/SubscriberAppVersion.test';
import subscriberValidationSubscriberPermissionSession from './SubscriberValidation/SubscriberPermissionSession.test';
import subscriberValidationSubscriberDataSourceValidation from './SubscriberValidation/SubscriberDataSourceValidation.test';
import subscriberValidationSubscriberEventToolValidation from './SubscriberValidation/SubscriberEventToolValidation.test';
import subscriberValidationSubscriberInterruptionRecovery from './SubscriberValidation/SubscriberInterruptionRecovery.test';
import subscriberValidationSubscriberNotification from './SubscriberValidation/SubscriberNotification.test';
import subscriberValidationSubscriberOfflineEvent from './SubscriberValidation/SubscriberOfflineEvent.test';
import subscriberValidationSubscriberSessionValidation from './SubscriberValidation/SubscriberSessionValidation.test';
import securitySubscriberSecurity from './Security/SubscriberSecurity.test';
import securitySecurityAccessibility from './Security/SecurityAccessibility.test';
import securitySecurityValidation from './Security/SecurityValidation.test';
import validationToastControllerValidation from './Validation/ToastControllerValidation.test';
import validationBoundaryErrorTesting from './Validation/BoundaryErrorTesting.test';
import validationCommonEventUtilValidation from './Validation/CommonEventUtilValidation.test';
import validationConfigurationManagerValidation from './Validation/ConfigurationManagerValidation.test';
import validationSubscriberStateManagerValidation from './Validation/SubscriberStateManagerValidation.test';
import validationFocusManagerValidation from './Validation/FocusManagerValidation.test';
import validationInputValidation from './Validation/InputValidation.test';
import validationEventCodeValidation from './Validation/EventCodeValidation.test';
import validationLoggerValidation from './Validation/LoggerValidation.test';
import validationToastPointerUtilValidation from './Validation/ToastPointerUtilValidation.test';
import validationResourceLoaderValidation from './Validation/ResourceLoaderValidation.test';

export default function testsuite(): void {
  abilityTest();
  integrationAdvancedScenarios();
  integrationComprehensiveRegression();
  integrationDeviceCompatibility();
  integrationIntegrationTesting();
  integrationLocalizationTesting();
  integrationEventDeliveryConnectivity();
  integrationSubscriberCompatibility();
  integrationSystemIntegration();
  integrationUserScenarios();
  interactionAccessibilityNavigation();
  interactionButtonInteraction();
  interactionContentScaling();
  interactionDataBinding();
  interactionToastPositioning();
  interactionEventHandling();
  interactionEventPropagation();
  interactionFocusNavigation();
  interactionFocusRingBehavior();
  interactionGestureRecognition();
  interactionThemeVariation();
  interactionTouchInteraction();
  interactionUIComponentRendering();
  interactionVisualEffects();
  lifecycleConfigurationChanges();
  lifecycleExtensionLifecycleBasics();
  lifecycleSubscriberStateManagement();
  lifecycleErrorRecovery();
  lifecycleExceptionHandling();
  lifecycleStaticSubscriberExtensionLifecycle();
  lifecycleResourceManagement();
  lifecycleSessionManagement();
  lifecycleStatePersistence();
  lifecycleStateRecovery();
  performanceToastAnimationPerformance();
  performanceConcurrencyControl();
  performanceLongTermStability();
  performanceMemoryLeakDetection();
  performancePerformanceStress();
  performanceResourceConsumption();
  performanceSubscriberPerformance();
  subscriberSubscriberConcurrency();
  subscriberSubscriberConsistency();
  subscriberSubscriberEndToEnd();
  subscriberSubscriberErrorRecovery();
  subscriberSubscriberLifecycle();
  subscriberSubscriberStateManagement();
  subscriberSubscriberStress();
  subscriberSubscriberUI();
  subscriberEventTriggerInteraction();
  subscriberEventDataModel();
  subscriberSubscribeConfiguration();
  subscriberSubscriberModelDeep();
  subscriberNotificationCatalog();
  subscriberNotificationFlow();
  subscriberNotificationOperations();
  subscriberNotificationWorkflow();
  subscriberValidationSubscriberAppVersion();
  subscriberValidationSubscriberPermissionSession();
  subscriberValidationSubscriberDataSourceValidation();
  subscriberValidationSubscriberEventToolValidation();
  subscriberValidationSubscriberInterruptionRecovery();
  subscriberValidationSubscriberNotification();
  subscriberValidationSubscriberOfflineEvent();
  subscriberValidationSubscriberSessionValidation();
  securitySubscriberSecurity();
  securitySecurityAccessibility();
  securitySecurityValidation();
  validationToastControllerValidation();
  validationBoundaryErrorTesting();
  validationCommonEventUtilValidation();
  validationConfigurationManagerValidation();
  validationSubscriberStateManagerValidation();
  validationFocusManagerValidation();
  validationInputValidation();
  validationEventCodeValidation();
  validationLoggerValidation();
  validationToastPointerUtilValidation();
  validationResourceLoaderValidation();
}
