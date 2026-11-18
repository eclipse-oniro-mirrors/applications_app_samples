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
import callbackOrderingScenariosTest from './Integration/CallbackOrderingScenarios.test';
import callRegressionTest from './Integration/CallRegression.test';
import voiceCapabilityCompatibilityTest from './Integration/VoiceCapabilityCompatibility.test';
import controllerIntegrationTest from './Integration/ControllerIntegration.test';
import phoneNumberForwardingTest from './Integration/PhoneNumberForwarding.test';
import capabilityUnavailableTest from './Integration/CapabilityUnavailable.test';
import callServiceCompatibilityTest from './Integration/CallServiceCompatibility.test';
import callServiceIntegrationTest from './Integration/CallServiceIntegration.test';
import makeCallUserScenariosTest from './Integration/MakeCallUserScenarios.test';
import callCommandAvailabilityTest from './Interaction/CallCommandAvailability.test';
import makeCallCommandInteractionTest from './Interaction/MakeCallCommandInteraction.test';
import phoneNumberPayloadPreservationTest from './Interaction/PhoneNumberPayloadPreservation.test';
import callStatePayloadBindingTest from './Interaction/CallStatePayloadBinding.test';
import listenerOwnershipTest from './Interaction/ListenerOwnership.test';
import callEventHandlingTest from './Interaction/CallEventHandling.test';
import callStateEventPropagationTest from './Interaction/CallStateEventPropagation.test';
import callRequestSequencingTest from './Interaction/CallRequestSequencing.test';
import callListenerIdentityTest from './Interaction/CallListenerIdentity.test';
import repeatedMakeCallCommandsTest from './Interaction/RepeatedMakeCallCommands.test';
import controllerInstanceIndependenceTest from './Interaction/ControllerInstanceIndependence.test';
import makeCallRequestDispatchTest from './Interaction/MakeCallRequestDispatch.test';
import callCommandStateTest from './Interaction/CallCommandState.test';
import callResultNotificationTest from './Interaction/CallResultNotification.test';
import voiceCapabilityChangesTest from './LifecycleState/VoiceCapabilityChanges.test';
import controllerLifecycleTest from './LifecycleState/ControllerLifecycle.test';
import callSubscriptionLifecycleTest from './LifecycleState/CallSubscriptionLifecycle.test';
import callFailureRecoveryTest from './LifecycleState/CallFailureRecovery.test';
import callExceptionHandlingTest from './LifecycleState/CallExceptionHandling.test';
import controllerReentryTest from './LifecycleState/ControllerReentry.test';
import callListenerResourceManagementTest from './LifecycleState/CallListenerResourceManagement.test';
import callRequestLifetimeTest from './LifecycleState/CallRequestLifetime.test';
import subscriptionPersistenceTest from './LifecycleState/SubscriptionPersistence.test';
import subscriptionRecoveryTest from './LifecycleState/SubscriptionRecovery.test';
import deferredCallbackBurstsTest from './PerformanceStability/DeferredCallbackBursts.test';
import requestCallbackOrderingTest from './PerformanceStability/RequestCallbackOrdering.test';
import repeatedControllerReuseTest from './PerformanceStability/RepeatedControllerReuse.test';
import listenerReleaseBalanceTest from './PerformanceStability/ListenerReleaseBalance.test';
import callRequestBurstsTest from './PerformanceStability/CallRequestBursts.test';
import unsupportedDeviceNoDispatchTest from './PerformanceStability/UnsupportedDeviceNoDispatch.test';
import subscriptionDeduplicationBurstsTest from './PerformanceStability/SubscriptionDeduplicationBursts.test';
import callCallbackOrderingTest from './CallFlow/CallCallbackOrdering.test';
import callRequestConsistencyTest from './CallFlow/CallRequestConsistency.test';
import controllerEndToEndTest from './CallFlow/ControllerEndToEnd.test';
import callFlowErrorRecoveryTest from './CallFlow/CallFlowErrorRecovery.test';
import callFlowLifecycleTest from './CallFlow/CallFlowLifecycle.test';
import callFlowStateEventsTest from './CallFlow/CallFlowStateEvents.test';
import callFlowRequestBurstsTest from './CallFlow/CallFlowRequestBursts.test';
import callFlowCommandContractTest from './CallFlow/CallFlowCommandContract.test';
import phoneNumberInputForwardingTest from './CallFlow/PhoneNumberInputForwarding.test';
import callStateInfoModelTest from './CallFlow/CallStateInfoModel.test';
import capabilityConfigurationTest from './CallFlow/CapabilityConfiguration.test';
import callControllerTransitionsTest from './CallFlow/CallControllerTransitions.test';
import callOperationOutcomesTest from './CallFlow/CallOperationOutcomes.test';
import makeCallOperationFlowTest from './CallFlow/MakeCallOperationFlow.test';
import makeCallOperationsTest from './CallFlow/MakeCallOperations.test';
import makeCallOperationWorkflowTest from './CallFlow/MakeCallOperationWorkflow.test';
import callCallbackGenerationTest from './CallValidation/CallCallbackGeneration.test';
import callServicePermissionErrorsTest from './CallValidation/CallServicePermissionErrors.test';
import callStateSourceValidationTest from './CallValidation/CallStateSourceValidation.test';
import callEventDispatchValidationTest from './CallValidation/CallEventDispatchValidation.test';
import interruptedCallRecoveryTest from './CallValidation/InterruptedCallRecovery.test';
import callResultNotificationsTest from './CallValidation/CallResultNotifications.test';
import unavailableVoiceCapabilityTest from './CallValidation/UnavailableVoiceCapability.test';
import callRequestSessionValidationTest from './CallValidation/CallRequestSessionValidation.test';
import sensitiveNumberForwardingTest from './Security/SensitiveNumberForwarding.test';
import unsupportedCallIsolationTest from './Security/UnsupportedCallIsolation.test';
import callFailureIsolationTest from './Security/CallFailureIsolation.test';
import deferredCompletionValidationTest from './Validation/DeferredCompletionValidation.test';
import callBoundaryErrorTestingTest from './Validation/CallBoundaryErrorTesting.test';
import callStateEventValidationTest from './Validation/CallStateEventValidation.test';
import capabilityTransitionValidationTest from './Validation/CapabilityTransitionValidation.test';
import subscriptionTransitionValidationTest from './Validation/SubscriptionTransitionValidation.test';
import listenerOwnershipValidationTest from './Validation/ListenerOwnershipValidation.test';
import phonePayloadValidationTest from './Validation/PhonePayloadValidation.test';
import callStateCodeValidationTest from './Validation/CallStateCodeValidation.test';
import callLoggerValidationTest from './Validation/CallLoggerValidation.test';
import callbackIdentityValidationTest from './Validation/CallbackIdentityValidation.test';
import listenerResourceValidationTest from './Validation/ListenerResourceValidation.test';
import indexTest from './Index.test';

export default function testsuite(): void {
  abilityTest();
  callbackOrderingScenariosTest();
  callRegressionTest();
  voiceCapabilityCompatibilityTest();
  controllerIntegrationTest();
  phoneNumberForwardingTest();
  capabilityUnavailableTest();
  callServiceCompatibilityTest();
  callServiceIntegrationTest();
  makeCallUserScenariosTest();
  callCommandAvailabilityTest();
  makeCallCommandInteractionTest();
  phoneNumberPayloadPreservationTest();
  callStatePayloadBindingTest();
  listenerOwnershipTest();
  callEventHandlingTest();
  callStateEventPropagationTest();
  callRequestSequencingTest();
  callListenerIdentityTest();
  repeatedMakeCallCommandsTest();
  controllerInstanceIndependenceTest();
  makeCallRequestDispatchTest();
  callCommandStateTest();
  callResultNotificationTest();
  voiceCapabilityChangesTest();
  controllerLifecycleTest();
  callSubscriptionLifecycleTest();
  callFailureRecoveryTest();
  callExceptionHandlingTest();
  controllerReentryTest();
  callListenerResourceManagementTest();
  callRequestLifetimeTest();
  subscriptionPersistenceTest();
  subscriptionRecoveryTest();
  deferredCallbackBurstsTest();
  requestCallbackOrderingTest();
  repeatedControllerReuseTest();
  listenerReleaseBalanceTest();
  callRequestBurstsTest();
  unsupportedDeviceNoDispatchTest();
  subscriptionDeduplicationBurstsTest();
  callCallbackOrderingTest();
  callRequestConsistencyTest();
  controllerEndToEndTest();
  callFlowErrorRecoveryTest();
  callFlowLifecycleTest();
  callFlowStateEventsTest();
  callFlowRequestBurstsTest();
  callFlowCommandContractTest();
  phoneNumberInputForwardingTest();
  callStateInfoModelTest();
  capabilityConfigurationTest();
  callControllerTransitionsTest();
  callOperationOutcomesTest();
  makeCallOperationFlowTest();
  makeCallOperationsTest();
  makeCallOperationWorkflowTest();
  callCallbackGenerationTest();
  callServicePermissionErrorsTest();
  callStateSourceValidationTest();
  callEventDispatchValidationTest();
  interruptedCallRecoveryTest();
  callResultNotificationsTest();
  unavailableVoiceCapabilityTest();
  callRequestSessionValidationTest();
  sensitiveNumberForwardingTest();
  unsupportedCallIsolationTest();
  callFailureIsolationTest();
  deferredCompletionValidationTest();
  callBoundaryErrorTestingTest();
  callStateEventValidationTest();
  capabilityTransitionValidationTest();
  subscriptionTransitionValidationTest();
  listenerOwnershipValidationTest();
  phonePayloadValidationTest();
  callStateCodeValidationTest();
  callLoggerValidationTest();
  callbackIdentityValidationTest();
  listenerResourceValidationTest();
  indexTest();
}
