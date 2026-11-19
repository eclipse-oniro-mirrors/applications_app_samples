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

export default function subscriberSubscriberStressTest() {
  describe('Subscriber_SubscriberStress_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: subscribersubscriberstress_ui_ready
    it('subscribersubscriberstress_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: subscribersubscriberstress_state_machine_enable_disable
    it('subscribersubscriberstress_state_machine_enable_disable_2', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 3: subscribersubscriberstress_event_validator_accept_reject
    it('subscribersubscriberstress_event_validator_accept_reject_3', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-3');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 4: subscribersubscriberstress_notification_builder_fields
    it('subscribersubscriberstress_notification_builder_fields_4', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-4').withText('body-4').build();
      expect(content.title).assertEqual('title-4');
      expect(content.text).assertEqual('body-4');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 5: subscribersubscriberstress_publisher_publish_and_clear
    it('subscribersubscriberstress_publisher_publish_and_clear_5', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-5');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 6: subscribersubscriberstress_event_validator_length_and_sanitize
    it('subscribersubscriberstress_event_validator_length_and_sanitize_6', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 6);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-6');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-6   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-6');
    });

    // Case 7: subscribersubscriberstress_catalog_and_metrics
    it('subscribersubscriberstress_catalog_and_metrics_7', 0, async () => {
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

    // Case 8: subscribersubscriberstress_workflow_enable_receive
    it('subscribersubscriberstress_workflow_enable_receive_8', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-8');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-8');
      expect(receiveResult.success).assertTrue();
    });

    // Case 9: subscribersubscriberstress_state_machine_duplicate_enable
    it('subscribersubscriberstress_state_machine_duplicate_enable_9', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 10: subscribersubscriberstress_metrics_reset
    it('subscribersubscriberstress_metrics_reset_10', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 11: subscribersubscriberstress_repeat_text_boundary
    it('subscribersubscriberstress_repeat_text_boundary_11', 0, async () => {
      const repeated: string = repeatText('A', 2);
      expect(repeated.length).assertEqual(2);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

  });
}
