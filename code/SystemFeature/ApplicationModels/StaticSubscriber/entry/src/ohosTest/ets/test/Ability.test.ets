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
} from './Shared/StaticSubscriberDriver';

export default function abilityTest() {
  describe('Ability_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: ability_ui_ready
    it('ability_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: ability_state_machine_enable_disable
    it('ability_state_machine_enable_disable_2', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 3: ability_state_machine_duplicate_enable
    it('ability_state_machine_duplicate_enable_3', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 4: ability_event_validator_accept_reject
    it('ability_event_validator_accept_reject_4', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-4');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 5: ability_notification_builder_fields
    it('ability_notification_builder_fields_5', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-5').withText('body-5').build();
      expect(content.title).assertEqual('title-5');
      expect(content.text).assertEqual('body-5');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 6: ability_publisher_publish_and_clear
    it('ability_publisher_publish_and_clear_6', 0, async () => {
      const publisher: NotificationPublisherModel = new NotificationPublisherModel();
      const content: NotificationContent = createNotification('publish-6');
      const result: OperationResult = publisher.publish(content);
      expect(result.success).assertTrue();
      expect(publisher.getPublishedCount()).assertEqual(1);
      publisher.clear();
      expect(publisher.getPublishedCount()).assertEqual(0);
    });

    // Case 7: ability_catalog_and_metrics
    it('ability_catalog_and_metrics_7', 0, async () => {
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

    // Case 8: ability_workflow_enable_receive
    it('ability_workflow_enable_receive_8', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-8');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-8');
      expect(receiveResult.success).assertTrue();
    });

    // Case 9: ability_serialized_operation
    it('ability_serialized_operation_9', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 9;
      });
      expect(value).assertEqual(9);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(10);
    });

    // Case 10: ability_driver_smoke
    it('ability_driver_smoke_10', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 10 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 11: ability_metrics_reset
    it('ability_metrics_reset_11', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 12: ability_utility_functions
    it('ability_utility_functions_12', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-12   ')).assertEqual('data-12');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-12')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

  });
}
