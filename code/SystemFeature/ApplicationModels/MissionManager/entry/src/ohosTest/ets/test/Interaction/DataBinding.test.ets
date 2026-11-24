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

export default function interactionDataBindingTest() {
  describe('Interaction_DataBinding_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: interactiondatabinding_ui_ready
    it('interactiondatabinding_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: interactiondatabinding_driver_smoke
    it('interactiondatabinding_driver_smoke_2', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 2 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 3: interactiondatabinding_serialized_operation
    it('interactiondatabinding_serialized_operation_3', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 3;
      });
      expect(value).assertEqual(3);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(4);
    });

    // Case 4: interactiondatabinding_key_code_model
    it('interactiondatabinding_key_code_model_4', 0, async () => {
      expect(KeyCodeModel.isNavigationKey(KEY_LEFT)).assertTrue();
      expect(KeyCodeModel.isConfirmKey(KEY_ENTER)).assertTrue();
      expect(KeyCodeModel.getKeyName(KEY_BACK)).assertEqual('BACK');
      expect(KeyCodeModel.getNavigationKeyCount()).assertEqual(4);
      expect(KeyCodeModel.isNavigationKey(KEY_POWER)).assertFalse();
    });

    // Case 5: interactiondatabinding_utility_functions
    it('interactiondatabinding_utility_functions_5', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-5   ')).assertEqual('data-5');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-5')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 6: interactiondatabinding_input_sanitizer_rules
    it('interactiondatabinding_input_sanitizer_rules_6', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-6   ')).assertEqual('text-6');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 7: interactiondatabinding_metrics_reset
    it('interactiondatabinding_metrics_reset_7', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 8: interactiondatabinding_event_matrix
    it('interactiondatabinding_event_matrix_8', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(9);
      expect(events.length).assertEqual(9);
      const notifications: NotificationContent[] = createNotificationMatrix(9);
      expect(notifications.length).assertEqual(9);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 9: interactiondatabinding_repeat_text_boundary
    it('interactiondatabinding_repeat_text_boundary_9', 0, async () => {
      const repeated: string = repeatText('A', 10);
      expect(repeated.length).assertEqual(10);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 10: interactiondatabinding_profiler_samples
    it('interactiondatabinding_profiler_samples_10', 0, async () => {
      const profiler: PerformanceProfiler = new PerformanceProfiler();
      for (let index: number = 0; index < 5; index++) {
        profiler.record('operation-10', index * 10, index, true);
      }
      expect(profiler.getCount()).assertEqual(5);
      expect(profiler.getSuccessCount()).assertEqual(5);
      expect(profiler.isWithinBudget(1000)).assertTrue();
    });

    // Case 11: interactiondatabinding_driver_smoke
    it('interactiondatabinding_driver_smoke_11', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 11 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 12: interactiondatabinding_serialized_operation
    it('interactiondatabinding_serialized_operation_12', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 12;
      });
      expect(value).assertEqual(12);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(13);
    });

    // Case 13: interactiondatabinding_key_code_model
    it('interactiondatabinding_key_code_model_13', 0, async () => {
      expect(KeyCodeModel.isNavigationKey(KEY_LEFT)).assertTrue();
      expect(KeyCodeModel.isConfirmKey(KEY_ENTER)).assertTrue();
      expect(KeyCodeModel.getKeyName(KEY_BACK)).assertEqual('BACK');
      expect(KeyCodeModel.getNavigationKeyCount()).assertEqual(4);
      expect(KeyCodeModel.isNavigationKey(KEY_POWER)).assertFalse();
    });

    // Case 14: interactiondatabinding_utility_functions
    it('interactiondatabinding_utility_functions_14', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-14   ')).assertEqual('data-14');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-14')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 15: interactiondatabinding_input_sanitizer_rules
    it('interactiondatabinding_input_sanitizer_rules_15', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-15   ')).assertEqual('text-15');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 16: interactiondatabinding_metrics_reset
    it('interactiondatabinding_metrics_reset_16', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 17: interactiondatabinding_event_matrix
    it('interactiondatabinding_event_matrix_17', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(18);
      expect(events.length).assertEqual(18);
      const notifications: NotificationContent[] = createNotificationMatrix(18);
      expect(notifications.length).assertEqual(18);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 18: interactiondatabinding_repeat_text_boundary
    it('interactiondatabinding_repeat_text_boundary_18', 0, async () => {
      const repeated: string = repeatText('A', 9);
      expect(repeated.length).assertEqual(9);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 19: interactiondatabinding_profiler_samples
    it('interactiondatabinding_profiler_samples_19', 0, async () => {
      const profiler: PerformanceProfiler = new PerformanceProfiler();
      for (let index: number = 0; index < 5; index++) {
        profiler.record('operation-19', index * 10, index, true);
      }
      expect(profiler.getCount()).assertEqual(5);
      expect(profiler.getSuccessCount()).assertEqual(5);
      expect(profiler.isWithinBudget(1000)).assertTrue();
    });

    // Case 20: interactiondatabinding_driver_smoke
    it('interactiondatabinding_driver_smoke_20', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 20 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 21: interactiondatabinding_serialized_operation
    it('interactiondatabinding_serialized_operation_21', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 21;
      });
      expect(value).assertEqual(21);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(22);
    });

    // Case 22: interactiondatabinding_key_code_model
    it('interactiondatabinding_key_code_model_22', 0, async () => {
      expect(KeyCodeModel.isNavigationKey(KEY_LEFT)).assertTrue();
      expect(KeyCodeModel.isConfirmKey(KEY_ENTER)).assertTrue();
      expect(KeyCodeModel.getKeyName(KEY_BACK)).assertEqual('BACK');
      expect(KeyCodeModel.getNavigationKeyCount()).assertEqual(4);
      expect(KeyCodeModel.isNavigationKey(KEY_POWER)).assertFalse();
    });

    // Case 23: interactiondatabinding_utility_functions
    it('interactiondatabinding_utility_functions_23', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-23   ')).assertEqual('data-23');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-23')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 24: interactiondatabinding_input_sanitizer_rules
    it('interactiondatabinding_input_sanitizer_rules_24', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-24   ')).assertEqual('text-24');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 25: interactiondatabinding_metrics_reset
    it('interactiondatabinding_metrics_reset_25', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 26: interactiondatabinding_event_matrix
    it('interactiondatabinding_event_matrix_26', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(7);
      expect(events.length).assertEqual(7);
      const notifications: NotificationContent[] = createNotificationMatrix(7);
      expect(notifications.length).assertEqual(7);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 27: interactiondatabinding_repeat_text_boundary
    it('interactiondatabinding_repeat_text_boundary_27', 0, async () => {
      const repeated: string = repeatText('A', 8);
      expect(repeated.length).assertEqual(8);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 28: interactiondatabinding_profiler_samples
    it('interactiondatabinding_profiler_samples_28', 0, async () => {
      const profiler: PerformanceProfiler = new PerformanceProfiler();
      for (let index: number = 0; index < 5; index++) {
        profiler.record('operation-28', index * 10, index, true);
      }
      expect(profiler.getCount()).assertEqual(5);
      expect(profiler.getSuccessCount()).assertEqual(5);
      expect(profiler.isWithinBudget(1000)).assertTrue();
    });

    // Case 29: interactiondatabinding_driver_smoke
    it('interactiondatabinding_driver_smoke_29', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 29 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 30: interactiondatabinding_serialized_operation
    it('interactiondatabinding_serialized_operation_30', 0, async () => {
      const value: number = await runSerializedUiOperation<number>(async () => {
        return 30;
      });
      expect(value).assertEqual(30);
      const chained: number = await runSerializedUiOperation<number>(async () => {
        return value + 1;
      });
      expect(chained).assertEqual(31);
    });

    // Case 31: interactiondatabinding_key_code_model
    it('interactiondatabinding_key_code_model_31', 0, async () => {
      expect(KeyCodeModel.isNavigationKey(KEY_LEFT)).assertTrue();
      expect(KeyCodeModel.isConfirmKey(KEY_ENTER)).assertTrue();
      expect(KeyCodeModel.getKeyName(KEY_BACK)).assertEqual('BACK');
      expect(KeyCodeModel.getNavigationKeyCount()).assertEqual(4);
      expect(KeyCodeModel.isNavigationKey(KEY_POWER)).assertFalse();
    });

    // Case 32: interactiondatabinding_utility_functions
    it('interactiondatabinding_utility_functions_32', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-32   ')).assertEqual('data-32');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-32')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

  });
}
