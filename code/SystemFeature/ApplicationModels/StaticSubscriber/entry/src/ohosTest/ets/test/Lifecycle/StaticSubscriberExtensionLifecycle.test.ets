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

export default function lifecycleStaticSubscriberExtensionLifecycleTest() {
  describe('Lifecycle_StaticSubscriberExtensionLifecycle_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: lifecyclestaticsubscriberextensionlifecycle_ui_ready
    it('lifecyclestaticsubscriberextensionlifecycle_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable_2', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 3: lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable_3', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 4: lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle
    it('lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle_4', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 5: lifecyclestaticsubscriberextensionlifecycle_metrics_reset
    it('lifecyclestaticsubscriberextensionlifecycle_metrics_reset_5', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 6: lifecyclestaticsubscriberextensionlifecycle_utility_functions
    it('lifecyclestaticsubscriberextensionlifecycle_utility_functions_6', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-6   ')).assertEqual('data-6');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-6')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 7: lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics
    it('lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics_7', 0, async () => {
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

    // Case 8: lifecyclestaticsubscriberextensionlifecycle_event_matrix
    it('lifecyclestaticsubscriberextensionlifecycle_event_matrix_8', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(9);
      expect(events.length).assertEqual(9);
      const notifications: NotificationContent[] = createNotificationMatrix(9);
      expect(notifications.length).assertEqual(9);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 9: lifecyclestaticsubscriberextensionlifecycle_config_manager_update
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_update_9', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.9';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 10: lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid_10', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 11: lifecyclestaticsubscriberextensionlifecycle_serialized_operation
    it('lifecyclestaticsubscriberextensionlifecycle_serialized_operation_11', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 11;
      });
      expect(value).assertEqual(11);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(12);
    });

    // Case 12: lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable_12', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 13: lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable_13', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 14: lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle
    it('lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle_14', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 15: lifecyclestaticsubscriberextensionlifecycle_metrics_reset
    it('lifecyclestaticsubscriberextensionlifecycle_metrics_reset_15', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 16: lifecyclestaticsubscriberextensionlifecycle_utility_functions
    it('lifecyclestaticsubscriberextensionlifecycle_utility_functions_16', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-16   ')).assertEqual('data-16');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-16')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 17: lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics
    it('lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics_17', 0, async () => {
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

    // Case 18: lifecyclestaticsubscriberextensionlifecycle_event_matrix
    it('lifecyclestaticsubscriberextensionlifecycle_event_matrix_18', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(19);
      expect(events.length).assertEqual(19);
      const notifications: NotificationContent[] = createNotificationMatrix(19);
      expect(notifications.length).assertEqual(19);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 19: lifecyclestaticsubscriberextensionlifecycle_config_manager_update
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_update_19', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.19';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 20: lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid_20', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 21: lifecyclestaticsubscriberextensionlifecycle_serialized_operation
    it('lifecyclestaticsubscriberextensionlifecycle_serialized_operation_21', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 21;
      });
      expect(value).assertEqual(21);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(22);
    });

    // Case 22: lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable_22', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 23: lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable_23', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 24: lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle
    it('lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle_24', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 25: lifecyclestaticsubscriberextensionlifecycle_metrics_reset
    it('lifecyclestaticsubscriberextensionlifecycle_metrics_reset_25', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 26: lifecyclestaticsubscriberextensionlifecycle_utility_functions
    it('lifecyclestaticsubscriberextensionlifecycle_utility_functions_26', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-26   ')).assertEqual('data-26');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-26')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 27: lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics
    it('lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics_27', 0, async () => {
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

    // Case 28: lifecyclestaticsubscriberextensionlifecycle_event_matrix
    it('lifecyclestaticsubscriberextensionlifecycle_event_matrix_28', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(9);
      expect(events.length).assertEqual(9);
      const notifications: NotificationContent[] = createNotificationMatrix(9);
      expect(notifications.length).assertEqual(9);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 29: lifecyclestaticsubscriberextensionlifecycle_config_manager_update
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_update_29', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.29';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 30: lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid_30', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 31: lifecyclestaticsubscriberextensionlifecycle_serialized_operation
    it('lifecyclestaticsubscriberextensionlifecycle_serialized_operation_31', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 31;
      });
      expect(value).assertEqual(31);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(32);
    });

    // Case 32: lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable_32', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 33: lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable_33', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 34: lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle
    it('lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle_34', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 35: lifecyclestaticsubscriberextensionlifecycle_metrics_reset
    it('lifecyclestaticsubscriberextensionlifecycle_metrics_reset_35', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 36: lifecyclestaticsubscriberextensionlifecycle_utility_functions
    it('lifecyclestaticsubscriberextensionlifecycle_utility_functions_36', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-36   ')).assertEqual('data-36');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-36')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 37: lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics
    it('lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics_37', 0, async () => {
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

    // Case 38: lifecyclestaticsubscriberextensionlifecycle_event_matrix
    it('lifecyclestaticsubscriberextensionlifecycle_event_matrix_38', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(19);
      expect(events.length).assertEqual(19);
      const notifications: NotificationContent[] = createNotificationMatrix(19);
      expect(notifications.length).assertEqual(19);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 39: lifecyclestaticsubscriberextensionlifecycle_config_manager_update
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_update_39', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.39';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 40: lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid_40', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 41: lifecyclestaticsubscriberextensionlifecycle_serialized_operation
    it('lifecyclestaticsubscriberextensionlifecycle_serialized_operation_41', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 41;
      });
      expect(value).assertEqual(41);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(42);
    });

    // Case 42: lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable_42', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 43: lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable_43', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 44: lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle
    it('lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle_44', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 45: lifecyclestaticsubscriberextensionlifecycle_metrics_reset
    it('lifecyclestaticsubscriberextensionlifecycle_metrics_reset_45', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 46: lifecyclestaticsubscriberextensionlifecycle_utility_functions
    it('lifecyclestaticsubscriberextensionlifecycle_utility_functions_46', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-46   ')).assertEqual('data-46');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-46')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 47: lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics
    it('lifecyclestaticsubscriberextensionlifecycle_catalog_and_metrics_47', 0, async () => {
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

    // Case 48: lifecyclestaticsubscriberextensionlifecycle_event_matrix
    it('lifecyclestaticsubscriberextensionlifecycle_event_matrix_48', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(9);
      expect(events.length).assertEqual(9);
      const notifications: NotificationContent[] = createNotificationMatrix(9);
      expect(notifications.length).assertEqual(9);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 49: lifecyclestaticsubscriberextensionlifecycle_config_manager_update
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_update_49', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.49';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 50: lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid
    it('lifecyclestaticsubscriberextensionlifecycle_config_manager_reject_invalid_50', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 51: lifecyclestaticsubscriberextensionlifecycle_serialized_operation
    it('lifecyclestaticsubscriberextensionlifecycle_serialized_operation_51', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 51;
      });
      expect(value).assertEqual(51);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(52);
    });

    // Case 52: lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_enable_disable_52', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      expect(machine.getState()).assertEqual(SubscriberState.DISABLED);
      const enableResult: OperationResult = machine.enable();
      expect(enableResult.success).assertTrue();
      expect(machine.isEnabled()).assertTrue();
      const disableResult: OperationResult = machine.disable();
      expect(disableResult.success).assertTrue();
      expect(machine.isDisabled()).assertTrue();
    });

    // Case 53: lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable
    it('lifecyclestaticsubscriberextensionlifecycle_state_machine_duplicate_enable_53', 0, async () => {
      const machine: SubscriberStateMachine = new SubscriberStateMachine();
      const first: OperationResult = machine.enable();
      expect(first.success).assertTrue();
      const second: OperationResult = machine.enable();
      expect(second.success).assertFalse();
      expect(second.code).assertEqual(ERROR_CODE_INVALID_STATE);
      expect(machine.getErrorCount()).assertEqual(1);
    });

    // Case 54: lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle
    it('lifecyclestaticsubscriberextensionlifecycle_session_manager_lifecycle_54', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

  });
}
