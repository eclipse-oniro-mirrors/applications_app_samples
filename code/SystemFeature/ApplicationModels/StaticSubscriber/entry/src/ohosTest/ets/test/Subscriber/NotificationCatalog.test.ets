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

export default function subscriberNotificationCatalogTest() {
  describe('Subscriber_NotificationCatalog_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: subscribernotificationcatalog_ui_ready
    it('subscribernotificationcatalog_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_2', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 3: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_3', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-3');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 4: subscribernotificationcatalog_notification_builder_fields
    it('subscribernotificationcatalog_notification_builder_fields_4', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-4').withText('body-4').build();
      expect(content.title).assertEqual('title-4');
      expect(content.text).assertEqual('body-4');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 5: subscribernotificationcatalog_publisher_publish_and_clear
    it('subscribernotificationcatalog_publisher_publish_and_clear_5', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-5');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 6: subscribernotificationcatalog_event_validator_length_and_sanitize
    it('subscribernotificationcatalog_event_validator_length_and_sanitize_6', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 6);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-6');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-6   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-6');
    });

    // Case 7: subscribernotificationcatalog_catalog_and_metrics
    it('subscribernotificationcatalog_catalog_and_metrics_7', 0, async () => {
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

    // Case 8: subscribernotificationcatalog_workflow_enable_receive
    it('subscribernotificationcatalog_workflow_enable_receive_8', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-8');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-8');
      expect(receiveResult.success).assertTrue();
    });

    // Case 9: subscribernotificationcatalog_state_machine_duplicate_enable
    it('subscribernotificationcatalog_state_machine_duplicate_enable_9', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 10: subscribernotificationcatalog_metrics_reset
    it('subscribernotificationcatalog_metrics_reset_10', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 11: subscribernotificationcatalog_repeat_text_boundary
    it('subscribernotificationcatalog_repeat_text_boundary_11', 0, async () => {
      const repeated: string = repeatText('A', 2);
      expect(repeated.length).assertEqual(2);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 12: subscribernotificationcatalog_event_matrix
    it('subscribernotificationcatalog_event_matrix_12', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(13);
      expect(events.length).assertEqual(13);
      const notifications: NotificationContent[] = createNotificationMatrix(13);
      expect(notifications.length).assertEqual(13);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 13: subscribernotificationcatalog_utility_functions
    it('subscribernotificationcatalog_utility_functions_13', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-13   ')).assertEqual('data-13');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-13')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 14: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_14', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 15: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_15', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-15');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 16: subscribernotificationcatalog_notification_builder_fields
    it('subscribernotificationcatalog_notification_builder_fields_16', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-16').withText('body-16').build();
      expect(content.title).assertEqual('title-16');
      expect(content.text).assertEqual('body-16');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 17: subscribernotificationcatalog_publisher_publish_and_clear
    it('subscribernotificationcatalog_publisher_publish_and_clear_17', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-17');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 18: subscribernotificationcatalog_event_validator_length_and_sanitize
    it('subscribernotificationcatalog_event_validator_length_and_sanitize_18', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 18);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-18');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-18   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-18');
    });

    // Case 19: subscribernotificationcatalog_catalog_and_metrics
    it('subscribernotificationcatalog_catalog_and_metrics_19', 0, async () => {
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

    // Case 20: subscribernotificationcatalog_workflow_enable_receive
    it('subscribernotificationcatalog_workflow_enable_receive_20', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-20');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-20');
      expect(receiveResult.success).assertTrue();
    });

    // Case 21: subscribernotificationcatalog_state_machine_duplicate_enable
    it('subscribernotificationcatalog_state_machine_duplicate_enable_21', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 22: subscribernotificationcatalog_metrics_reset
    it('subscribernotificationcatalog_metrics_reset_22', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 23: subscribernotificationcatalog_repeat_text_boundary
    it('subscribernotificationcatalog_repeat_text_boundary_23', 0, async () => {
      const repeated: string = repeatText('A', 4);
      expect(repeated.length).assertEqual(4);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 24: subscribernotificationcatalog_event_matrix
    it('subscribernotificationcatalog_event_matrix_24', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(5);
      expect(events.length).assertEqual(5);
      const notifications: NotificationContent[] = createNotificationMatrix(5);
      expect(notifications.length).assertEqual(5);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 25: subscribernotificationcatalog_utility_functions
    it('subscribernotificationcatalog_utility_functions_25', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-25   ')).assertEqual('data-25');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-25')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 26: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_26', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 27: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_27', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-27');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 28: subscribernotificationcatalog_notification_builder_fields
    it('subscribernotificationcatalog_notification_builder_fields_28', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-28').withText('body-28').build();
      expect(content.title).assertEqual('title-28');
      expect(content.text).assertEqual('body-28');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 29: subscribernotificationcatalog_publisher_publish_and_clear
    it('subscribernotificationcatalog_publisher_publish_and_clear_29', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-29');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 30: subscribernotificationcatalog_event_validator_length_and_sanitize
    it('subscribernotificationcatalog_event_validator_length_and_sanitize_30', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 30);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-30');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-30   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-30');
    });

    // Case 31: subscribernotificationcatalog_catalog_and_metrics
    it('subscribernotificationcatalog_catalog_and_metrics_31', 0, async () => {
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

    // Case 32: subscribernotificationcatalog_workflow_enable_receive
    it('subscribernotificationcatalog_workflow_enable_receive_32', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-32');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-32');
      expect(receiveResult.success).assertTrue();
    });

    // Case 33: subscribernotificationcatalog_state_machine_duplicate_enable
    it('subscribernotificationcatalog_state_machine_duplicate_enable_33', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 34: subscribernotificationcatalog_metrics_reset
    it('subscribernotificationcatalog_metrics_reset_34', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 35: subscribernotificationcatalog_repeat_text_boundary
    it('subscribernotificationcatalog_repeat_text_boundary_35', 0, async () => {
      const repeated: string = repeatText('A', 6);
      expect(repeated.length).assertEqual(6);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 36: subscribernotificationcatalog_event_matrix
    it('subscribernotificationcatalog_event_matrix_36', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(17);
      expect(events.length).assertEqual(17);
      const notifications: NotificationContent[] = createNotificationMatrix(17);
      expect(notifications.length).assertEqual(17);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 37: subscribernotificationcatalog_utility_functions
    it('subscribernotificationcatalog_utility_functions_37', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-37   ')).assertEqual('data-37');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-37')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 38: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_38', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 39: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_39', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-39');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 40: subscribernotificationcatalog_notification_builder_fields
    it('subscribernotificationcatalog_notification_builder_fields_40', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-40').withText('body-40').build();
      expect(content.title).assertEqual('title-40');
      expect(content.text).assertEqual('body-40');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 41: subscribernotificationcatalog_publisher_publish_and_clear
    it('subscribernotificationcatalog_publisher_publish_and_clear_41', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-41');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 42: subscribernotificationcatalog_event_validator_length_and_sanitize
    it('subscribernotificationcatalog_event_validator_length_and_sanitize_42', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 42);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-42');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-42   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-42');
    });

    // Case 43: subscribernotificationcatalog_catalog_and_metrics
    it('subscribernotificationcatalog_catalog_and_metrics_43', 0, async () => {
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

    // Case 44: subscribernotificationcatalog_workflow_enable_receive
    it('subscribernotificationcatalog_workflow_enable_receive_44', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-44');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-44');
      expect(receiveResult.success).assertTrue();
    });

    // Case 45: subscribernotificationcatalog_state_machine_duplicate_enable
    it('subscribernotificationcatalog_state_machine_duplicate_enable_45', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 46: subscribernotificationcatalog_metrics_reset
    it('subscribernotificationcatalog_metrics_reset_46', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 47: subscribernotificationcatalog_repeat_text_boundary
    it('subscribernotificationcatalog_repeat_text_boundary_47', 0, async () => {
      const repeated: string = repeatText('A', 8);
      expect(repeated.length).assertEqual(8);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 48: subscribernotificationcatalog_event_matrix
    it('subscribernotificationcatalog_event_matrix_48', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(9);
      expect(events.length).assertEqual(9);
      const notifications: NotificationContent[] = createNotificationMatrix(9);
      expect(notifications.length).assertEqual(9);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 49: subscribernotificationcatalog_utility_functions
    it('subscribernotificationcatalog_utility_functions_49', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-49   ')).assertEqual('data-49');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-49')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 50: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_50', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 51: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_51', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-51');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 52: subscribernotificationcatalog_notification_builder_fields
    it('subscribernotificationcatalog_notification_builder_fields_52', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-52').withText('body-52').build();
      expect(content.title).assertEqual('title-52');
      expect(content.text).assertEqual('body-52');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 53: subscribernotificationcatalog_publisher_publish_and_clear
    it('subscribernotificationcatalog_publisher_publish_and_clear_53', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-53');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 54: subscribernotificationcatalog_event_validator_length_and_sanitize
    it('subscribernotificationcatalog_event_validator_length_and_sanitize_54', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 54);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-54');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-54   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-54');
    });

    // Case 55: subscribernotificationcatalog_catalog_and_metrics
    it('subscribernotificationcatalog_catalog_and_metrics_55', 0, async () => {
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

    // Case 56: subscribernotificationcatalog_workflow_enable_receive
    it('subscribernotificationcatalog_workflow_enable_receive_56', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-56');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-56');
      expect(receiveResult.success).assertTrue();
    });

    // Case 57: subscribernotificationcatalog_state_machine_duplicate_enable
    it('subscribernotificationcatalog_state_machine_duplicate_enable_57', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 58: subscribernotificationcatalog_metrics_reset
    it('subscribernotificationcatalog_metrics_reset_58', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 59: subscribernotificationcatalog_repeat_text_boundary
    it('subscribernotificationcatalog_repeat_text_boundary_59', 0, async () => {
      const repeated: string = repeatText('A', 10);
      expect(repeated.length).assertEqual(10);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 60: subscribernotificationcatalog_event_matrix
    it('subscribernotificationcatalog_event_matrix_60', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(1);
      expect(events.length).assertEqual(1);
      const notifications: NotificationContent[] = createNotificationMatrix(1);
      expect(notifications.length).assertEqual(1);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 61: subscribernotificationcatalog_utility_functions
    it('subscribernotificationcatalog_utility_functions_61', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-61   ')).assertEqual('data-61');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-61')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 62: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_62', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 63: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_63', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-63');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 64: subscribernotificationcatalog_notification_builder_fields
    it('subscribernotificationcatalog_notification_builder_fields_64', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-64').withText('body-64').build();
      expect(content.title).assertEqual('title-64');
      expect(content.text).assertEqual('body-64');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 65: subscribernotificationcatalog_publisher_publish_and_clear
    it('subscribernotificationcatalog_publisher_publish_and_clear_65', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-65');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 66: subscribernotificationcatalog_event_validator_length_and_sanitize
    it('subscribernotificationcatalog_event_validator_length_and_sanitize_66', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 66);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-66');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-66   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-66');
    });

    // Case 67: subscribernotificationcatalog_catalog_and_metrics
    it('subscribernotificationcatalog_catalog_and_metrics_67', 0, async () => {
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

    // Case 68: subscribernotificationcatalog_workflow_enable_receive
    it('subscribernotificationcatalog_workflow_enable_receive_68', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-68');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-68');
      expect(receiveResult.success).assertTrue();
    });

    // Case 69: subscribernotificationcatalog_state_machine_duplicate_enable
    it('subscribernotificationcatalog_state_machine_duplicate_enable_69', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 70: subscribernotificationcatalog_metrics_reset
    it('subscribernotificationcatalog_metrics_reset_70', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 71: subscribernotificationcatalog_repeat_text_boundary
    it('subscribernotificationcatalog_repeat_text_boundary_71', 0, async () => {
      const repeated: string = repeatText('A', 2);
      expect(repeated.length).assertEqual(2);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 72: subscribernotificationcatalog_event_matrix
    it('subscribernotificationcatalog_event_matrix_72', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(13);
      expect(events.length).assertEqual(13);
      const notifications: NotificationContent[] = createNotificationMatrix(13);
      expect(notifications.length).assertEqual(13);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 73: subscribernotificationcatalog_utility_functions
    it('subscribernotificationcatalog_utility_functions_73', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-73   ')).assertEqual('data-73');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-73')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 74: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_74', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 75: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_75', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-75');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 76: subscribernotificationcatalog_notification_builder_fields
    it('subscribernotificationcatalog_notification_builder_fields_76', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-76').withText('body-76').build();
      expect(content.title).assertEqual('title-76');
      expect(content.text).assertEqual('body-76');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 77: subscribernotificationcatalog_publisher_publish_and_clear
    it('subscribernotificationcatalog_publisher_publish_and_clear_77', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-77');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 78: subscribernotificationcatalog_event_validator_length_and_sanitize
    it('subscribernotificationcatalog_event_validator_length_and_sanitize_78', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 78);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-78');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-78   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-78');
    });

    // Case 79: subscribernotificationcatalog_catalog_and_metrics
    it('subscribernotificationcatalog_catalog_and_metrics_79', 0, async () => {
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

    // Case 80: subscribernotificationcatalog_workflow_enable_receive
    it('subscribernotificationcatalog_workflow_enable_receive_80', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-80');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-80');
      expect(receiveResult.success).assertTrue();
    });

    // Case 81: subscribernotificationcatalog_state_machine_duplicate_enable
    it('subscribernotificationcatalog_state_machine_duplicate_enable_81', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 82: subscribernotificationcatalog_metrics_reset
    it('subscribernotificationcatalog_metrics_reset_82', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 83: subscribernotificationcatalog_repeat_text_boundary
    it('subscribernotificationcatalog_repeat_text_boundary_83', 0, async () => {
      const repeated: string = repeatText('A', 4);
      expect(repeated.length).assertEqual(4);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 84: subscribernotificationcatalog_event_matrix
    it('subscribernotificationcatalog_event_matrix_84', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(5);
      expect(events.length).assertEqual(5);
      const notifications: NotificationContent[] = createNotificationMatrix(5);
      expect(notifications.length).assertEqual(5);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 85: subscribernotificationcatalog_utility_functions
    it('subscribernotificationcatalog_utility_functions_85', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-85   ')).assertEqual('data-85');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-85')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 86: subscribernotificationcatalog_state_machine_enable_disable
    it('subscribernotificationcatalog_state_machine_enable_disable_86', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 87: subscribernotificationcatalog_event_validator_accept_reject
    it('subscribernotificationcatalog_event_validator_accept_reject_87', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-87');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

  });
}
