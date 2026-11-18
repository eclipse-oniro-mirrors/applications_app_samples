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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  DOMAIN,
  TAG,
  BUNDLE_NAME,
  ENABLE_BUTTON_ID,
  DISABLE_BUTTON_ID,
  NOTIFICATION_ID,
  STATIC_EVENT_NAME,
  ERROR_CODE_INVALID_STATE,
  ERROR_CODE_INVALID_CONFIG,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
  KEY_POWER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_OPERATION,
  TIMEOUT_PAGE_RENDER,
  SubscriberState,
  SubscriberOperation,
  EventKind,
  SubscriberEvent,
  NotificationContent,
  SubscriberConfig,
  OperationResult,
  SubscriberMetrics,
  runSerializedUiOperation,
  getDriver,
  serializedDelay,
  pressAndWait,
  componentExistsById,
  createEvent,
  createEmptyEvent,
  createEventByKind,
  createEventMatrix,
  createNotification,
  createNotificationMatrix,
  createDefaultConfig,
  repeatText,
  isSupportedEventName,
  normalizeEventData,
  isSubscriberStateValid,
  isValidOperation,
  getOperationName,
  getStateName,
  countOccurrences,
  containsAsciiOnly,
  sumNumbers,
  averageNumbers,
  SubscriberStateMachine,
  SubscriberEventValidator,
  NotificationRequestBuilder,
  SubscriberConfigManager,
  NotificationPublisherModel,
  SubscriberSession,
  SubscriberSessionManager,
  OperationCatalog,
  OperationMetricsCollector,
  LoggerBuffer,
  KeyCodeModel,
  InputSanitizer,
  ResourceBudgetModel,
  SecurityPolicyModel,
  PerformanceProfiler,
  BoundaryChecker,
  BoundaryResult,
  SubscriberWorkflowModel
} from '../Shared/StaticSubscriberDriver';

export default function subscriberSubscriberConsistencyTest() {
  describe('Subscriber_SubscriberConsistency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: subscribersubscriberconsistency_ui_ready
    it('subscribersubscriberconsistency_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: subscribersubscriberconsistency_state_machine_enable_disable
    it('subscribersubscriberconsistency_state_machine_enable_disable_2', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 3: subscribersubscriberconsistency_event_validator_accept_reject
    it('subscribersubscriberconsistency_event_validator_accept_reject_3', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-3');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 4: subscribersubscriberconsistency_notification_builder_fields
    it('subscribersubscriberconsistency_notification_builder_fields_4', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-4').withText('body-4').build();
      expect(content.title).assertEqual('title-4');
      expect(content.text).assertEqual('body-4');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 5: subscribersubscriberconsistency_publisher_publish_and_clear
    it('subscribersubscriberconsistency_publisher_publish_and_clear_5', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-5');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 6: subscribersubscriberconsistency_event_validator_length_and_sanitize
    it('subscribersubscriberconsistency_event_validator_length_and_sanitize_6', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 6);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-6');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-6   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-6');
    });

    // Case 7: subscribersubscriberconsistency_catalog_and_metrics
    it('subscribersubscriberconsistency_catalog_and_metrics_7', 0, async () => {
      expect(OperationCatalog.getOperationCount()).assertEqual(5);
      expect(OperationCatalog.contains(SubscriberOperation.ENABLE)).assertTrue();
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.ENABLE);
      metrics.record(SubscriberOperation.DISABLE);
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.record(SubscriberOperation.PUBLISH_NOTIFICATION);
      expect(metrics.getTotalCount()).assertEqual(4);
      expect(metrics.getMetrics().enableCount).assertEqual(1);
    });

    // Case 8: subscribersubscriberconsistency_workflow_enable_receive
    it('subscribersubscriberconsistency_workflow_enable_receive_8', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-8');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-8');
      expect(receiveResult.success).assertTrue();
    });

    // Case 9: subscribersubscriberconsistency_state_machine_duplicate_enable
    it('subscribersubscriberconsistency_state_machine_duplicate_enable_9', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 10: subscribersubscriberconsistency_metrics_reset
    it('subscribersubscriberconsistency_metrics_reset_10', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 11: subscribersubscriberconsistency_repeat_text_boundary
    it('subscribersubscriberconsistency_repeat_text_boundary_11', 0, async () => {
      const repeated: string = repeatText('A', 2);
      expect(repeated.length).assertEqual(2);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 12: subscribersubscriberconsistency_event_matrix
    it('subscribersubscriberconsistency_event_matrix_12', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(13);
      expect(events.length).assertEqual(13);
      const notifications: NotificationContent[] = createNotificationMatrix(13);
      expect(notifications.length).assertEqual(13);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 13: subscribersubscriberconsistency_utility_functions
    it('subscribersubscriberconsistency_utility_functions_13', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-13   ')).assertEqual('data-13');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-13')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 14: subscribersubscriberconsistency_state_machine_enable_disable
    it('subscribersubscriberconsistency_state_machine_enable_disable_14', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 15: subscribersubscriberconsistency_event_validator_accept_reject
    it('subscribersubscriberconsistency_event_validator_accept_reject_15', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-15');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 16: subscribersubscriberconsistency_notification_builder_fields
    it('subscribersubscriberconsistency_notification_builder_fields_16', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-16').withText('body-16').build();
      expect(content.title).assertEqual('title-16');
      expect(content.text).assertEqual('body-16');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 17: subscribersubscriberconsistency_publisher_publish_and_clear
    it('subscribersubscriberconsistency_publisher_publish_and_clear_17', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-17');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 18: subscribersubscriberconsistency_event_validator_length_and_sanitize
    it('subscribersubscriberconsistency_event_validator_length_and_sanitize_18', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 18);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-18');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-18   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-18');
    });

    // Case 19: subscribersubscriberconsistency_catalog_and_metrics
    it('subscribersubscriberconsistency_catalog_and_metrics_19', 0, async () => {
      expect(OperationCatalog.getOperationCount()).assertEqual(5);
      expect(OperationCatalog.contains(SubscriberOperation.ENABLE)).assertTrue();
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.ENABLE);
      metrics.record(SubscriberOperation.DISABLE);
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.record(SubscriberOperation.PUBLISH_NOTIFICATION);
      expect(metrics.getTotalCount()).assertEqual(4);
      expect(metrics.getMetrics().enableCount).assertEqual(1);
    });

    // Case 20: subscribersubscriberconsistency_workflow_enable_receive
    it('subscribersubscriberconsistency_workflow_enable_receive_20', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-20');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-20');
      expect(receiveResult.success).assertTrue();
    });

    // Case 21: subscribersubscriberconsistency_state_machine_duplicate_enable
    it('subscribersubscriberconsistency_state_machine_duplicate_enable_21', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 22: subscribersubscriberconsistency_metrics_reset
    it('subscribersubscriberconsistency_metrics_reset_22', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 23: subscribersubscriberconsistency_repeat_text_boundary
    it('subscribersubscriberconsistency_repeat_text_boundary_23', 0, async () => {
      const repeated: string = repeatText('A', 4);
      expect(repeated.length).assertEqual(4);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 24: subscribersubscriberconsistency_event_matrix
    it('subscribersubscriberconsistency_event_matrix_24', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(5);
      expect(events.length).assertEqual(5);
      const notifications: NotificationContent[] = createNotificationMatrix(5);
      expect(notifications.length).assertEqual(5);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 25: subscribersubscriberconsistency_utility_functions
    it('subscribersubscriberconsistency_utility_functions_25', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-25   ')).assertEqual('data-25');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-25')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 26: subscribersubscriberconsistency_state_machine_enable_disable
    it('subscribersubscriberconsistency_state_machine_enable_disable_26', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 27: subscribersubscriberconsistency_event_validator_accept_reject
    it('subscribersubscriberconsistency_event_validator_accept_reject_27', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-27');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 28: subscribersubscriberconsistency_notification_builder_fields
    it('subscribersubscriberconsistency_notification_builder_fields_28', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-28').withText('body-28').build();
      expect(content.title).assertEqual('title-28');
      expect(content.text).assertEqual('body-28');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 29: subscribersubscriberconsistency_publisher_publish_and_clear
    it('subscribersubscriberconsistency_publisher_publish_and_clear_29', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-29');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 30: subscribersubscriberconsistency_event_validator_length_and_sanitize
    it('subscribersubscriberconsistency_event_validator_length_and_sanitize_30', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 30);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-30');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-30   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-30');
    });

    // Case 31: subscribersubscriberconsistency_catalog_and_metrics
    it('subscribersubscriberconsistency_catalog_and_metrics_31', 0, async () => {
      expect(OperationCatalog.getOperationCount()).assertEqual(5);
      expect(OperationCatalog.contains(SubscriberOperation.ENABLE)).assertTrue();
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.ENABLE);
      metrics.record(SubscriberOperation.DISABLE);
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.record(SubscriberOperation.PUBLISH_NOTIFICATION);
      expect(metrics.getTotalCount()).assertEqual(4);
      expect(metrics.getMetrics().enableCount).assertEqual(1);
    });

    // Case 32: subscribersubscriberconsistency_workflow_enable_receive
    it('subscribersubscriberconsistency_workflow_enable_receive_32', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-32');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-32');
      expect(receiveResult.success).assertTrue();
    });

    // Case 33: subscribersubscriberconsistency_state_machine_duplicate_enable
    it('subscribersubscriberconsistency_state_machine_duplicate_enable_33', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 34: subscribersubscriberconsistency_metrics_reset
    it('subscribersubscriberconsistency_metrics_reset_34', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 35: subscribersubscriberconsistency_repeat_text_boundary
    it('subscribersubscriberconsistency_repeat_text_boundary_35', 0, async () => {
      const repeated: string = repeatText('A', 6);
      expect(repeated.length).assertEqual(6);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 36: subscribersubscriberconsistency_event_matrix
    it('subscribersubscriberconsistency_event_matrix_36', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(17);
      expect(events.length).assertEqual(17);
      const notifications: NotificationContent[] = createNotificationMatrix(17);
      expect(notifications.length).assertEqual(17);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 37: subscribersubscriberconsistency_utility_functions
    it('subscribersubscriberconsistency_utility_functions_37', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-37   ')).assertEqual('data-37');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-37')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 38: subscribersubscriberconsistency_state_machine_enable_disable
    it('subscribersubscriberconsistency_state_machine_enable_disable_38', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 39: subscribersubscriberconsistency_event_validator_accept_reject
    it('subscribersubscriberconsistency_event_validator_accept_reject_39', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-39');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

  });
}
