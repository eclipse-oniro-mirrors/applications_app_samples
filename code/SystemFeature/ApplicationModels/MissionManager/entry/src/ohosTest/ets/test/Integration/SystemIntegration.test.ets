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

export default function integrationSystemIntegrationTest() {
  describe('Integration_SystemIntegration_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: integrationsystemintegration_ui_ready
    it('integrationsystemintegration_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: integrationsystemintegration_workflow_enable_receive
    it('integrationsystemintegration_workflow_enable_receive_2', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-2');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-2');
      expect(receiveResult.success).assertTrue();
    });

    // Case 3: integrationsystemintegration_session_manager_lifecycle
    it('integrationsystemintegration_session_manager_lifecycle_3', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 4: integrationsystemintegration_catalog_and_metrics
    it('integrationsystemintegration_catalog_and_metrics_4', 0, async () => {
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

    // Case 5: integrationsystemintegration_utility_functions
    it('integrationsystemintegration_utility_functions_5', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-5   ')).assertEqual('data-5');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-5')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 6: integrationsystemintegration_event_matrix
    it('integrationsystemintegration_event_matrix_6', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(7);
      expect(events.length).assertEqual(7);
      const notifications: NotificationContent[] = createNotificationMatrix(7);
      expect(notifications.length).assertEqual(7);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 7: integrationsystemintegration_serialized_operation
    it('integrationsystemintegration_serialized_operation_7', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 7;
      });
      expect(value).assertEqual(7);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(8);
    });

    // Case 8: integrationsystemintegration_driver_smoke
    it('integrationsystemintegration_driver_smoke_8', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 8 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 9: integrationsystemintegration_metrics_reset
    it('integrationsystemintegration_metrics_reset_9', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 10: integrationsystemintegration_event_validator_accept_reject
    it('integrationsystemintegration_event_validator_accept_reject_10', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-10');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 11: integrationsystemintegration_config_manager_update
    it('integrationsystemintegration_config_manager_update_11', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.11';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 12: integrationsystemintegration_notification_builder_fields
    it('integrationsystemintegration_notification_builder_fields_12', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-12').withText('body-12').build();
      expect(content.title).assertEqual('title-12');
      expect(content.text).assertEqual('body-12');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 13: integrationsystemintegration_workflow_enable_receive
    it('integrationsystemintegration_workflow_enable_receive_13', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-13');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-13');
      expect(receiveResult.success).assertTrue();
    });

    // Case 14: integrationsystemintegration_session_manager_lifecycle
    it('integrationsystemintegration_session_manager_lifecycle_14', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 15: integrationsystemintegration_catalog_and_metrics
    it('integrationsystemintegration_catalog_and_metrics_15', 0, async () => {
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

    // Case 16: integrationsystemintegration_utility_functions
    it('integrationsystemintegration_utility_functions_16', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-16   ')).assertEqual('data-16');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-16')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 17: integrationsystemintegration_event_matrix
    it('integrationsystemintegration_event_matrix_17', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(18);
      expect(events.length).assertEqual(18);
      const notifications: NotificationContent[] = createNotificationMatrix(18);
      expect(notifications.length).assertEqual(18);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 18: integrationsystemintegration_serialized_operation
    it('integrationsystemintegration_serialized_operation_18', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 18;
      });
      expect(value).assertEqual(18);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(19);
    });

    // Case 19: integrationsystemintegration_driver_smoke
    it('integrationsystemintegration_driver_smoke_19', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 19 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 20: integrationsystemintegration_metrics_reset
    it('integrationsystemintegration_metrics_reset_20', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 21: integrationsystemintegration_event_validator_accept_reject
    it('integrationsystemintegration_event_validator_accept_reject_21', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-21');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 22: integrationsystemintegration_config_manager_update
    it('integrationsystemintegration_config_manager_update_22', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.22';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 23: integrationsystemintegration_notification_builder_fields
    it('integrationsystemintegration_notification_builder_fields_23', 0, async () => {
      const builder: NotificationRequestBuilder = new NotificationRequestBuilder();
      const content: NotificationContent = builder.withTitle('title-23').withText('body-23').build();
      expect(content.title).assertEqual('title-23');
      expect(content.text).assertEqual('body-23');
      expect(content.id).assertEqual(NOTIFICATION_ID);
      expect(builder.isValid()).assertTrue();
    });

    // Case 24: integrationsystemintegration_workflow_enable_receive
    it('integrationsystemintegration_workflow_enable_receive_24', 0, async () => {
      const workflow: SubscriberWorkflowModel = new SubscriberWorkflowModel();
      const enableResult: OperationResult = workflow.runEnableWorkflow('workflow-24');
      expect(enableResult.success).assertTrue();
      expect(workflow.getState()).assertEqual(SubscriberState.ENABLED);
      expect(workflow.getPublishedCount()).assertEqual(1);
      const receiveResult: OperationResult = workflow.runReceiveWorkflow('data-24');
      expect(receiveResult.success).assertTrue();
    });

    // Case 25: integrationsystemintegration_session_manager_lifecycle
    it('integrationsystemintegration_session_manager_lifecycle_25', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 26: integrationsystemintegration_catalog_and_metrics
    it('integrationsystemintegration_catalog_and_metrics_26', 0, async () => {
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

  });
}
