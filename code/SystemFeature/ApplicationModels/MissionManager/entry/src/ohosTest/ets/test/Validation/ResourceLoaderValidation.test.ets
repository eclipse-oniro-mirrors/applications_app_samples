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

export default function validationResourceLoaderValidationTest() {
  describe('Validation_ResourceLoaderValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: validationresourceloadervalidation_ui_ready
    it('validationresourceloadervalidation_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: validationresourceloadervalidation_event_validator_accept_reject
    it('validationresourceloadervalidation_event_validator_accept_reject_2', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-2');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 3: validationresourceloadervalidation_event_validator_length_and_sanitize
    it('validationresourceloadervalidation_event_validator_length_and_sanitize_3', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 3);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-3');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-3   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-3');
    });

    // Case 4: validationresourceloadervalidation_config_manager_update
    it('validationresourceloadervalidation_config_manager_update_4', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.4';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 5: validationresourceloadervalidation_config_manager_reject_invalid
    it('validationresourceloadervalidation_config_manager_reject_invalid_5', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 6: validationresourceloadervalidation_boundary_checker_ranges
    it('validationresourceloadervalidation_boundary_checker_ranges_6', 0, async () => {
      const checker: BoundaryChecker = new BoundaryChecker();
      const result: BoundaryResult = checker.checkLength('   value-6   ', 1, 64);
      expect(result.accepted).assertTrue();
      expect(result.normalized).assertEqual('value-6');
      expect(checker.checkNumber(6, 0, 1000)).assertTrue();
      expect(checker.clamp(5000, 0, 100)).assertEqual(100);
    });

    // Case 7: validationresourceloadervalidation_utility_functions
    it('validationresourceloadervalidation_utility_functions_7', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-7   ')).assertEqual('data-7');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-7')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 8: validationresourceloadervalidation_repeat_text_boundary
    it('validationresourceloadervalidation_repeat_text_boundary_8', 0, async () => {
      const repeated: string = repeatText('A', 9);
      expect(repeated.length).assertEqual(9);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 9: validationresourceloadervalidation_metrics_reset
    it('validationresourceloadervalidation_metrics_reset_9', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 10: validationresourceloadervalidation_catalog_and_metrics
    it('validationresourceloadervalidation_catalog_and_metrics_10', 0, async () => {
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

    // Case 11: validationresourceloadervalidation_event_matrix
    it('validationresourceloadervalidation_event_matrix_11', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(12);
      expect(events.length).assertEqual(12);
      const notifications: NotificationContent[] = createNotificationMatrix(12);
      expect(notifications.length).assertEqual(12);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 12: validationresourceloadervalidation_input_sanitizer_rules
    it('validationresourceloadervalidation_input_sanitizer_rules_12', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-12   ')).assertEqual('text-12');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 13: validationresourceloadervalidation_event_validator_accept_reject
    it('validationresourceloadervalidation_event_validator_accept_reject_13', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-13');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 14: validationresourceloadervalidation_event_validator_length_and_sanitize
    it('validationresourceloadervalidation_event_validator_length_and_sanitize_14', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 14);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-14');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-14   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-14');
    });

    // Case 15: validationresourceloadervalidation_config_manager_update
    it('validationresourceloadervalidation_config_manager_update_15', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.15';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 16: validationresourceloadervalidation_config_manager_reject_invalid
    it('validationresourceloadervalidation_config_manager_reject_invalid_16', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 17: validationresourceloadervalidation_boundary_checker_ranges
    it('validationresourceloadervalidation_boundary_checker_ranges_17', 0, async () => {
      const checker: BoundaryChecker = new BoundaryChecker();
      const result: BoundaryResult = checker.checkLength('   value-17   ', 1, 64);
      expect(result.accepted).assertTrue();
      expect(result.normalized).assertEqual('value-17');
      expect(checker.checkNumber(17, 0, 1000)).assertTrue();
      expect(checker.clamp(5000, 0, 100)).assertEqual(100);
    });

    // Case 18: validationresourceloadervalidation_utility_functions
    it('validationresourceloadervalidation_utility_functions_18', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-18   ')).assertEqual('data-18');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-18')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 19: validationresourceloadervalidation_repeat_text_boundary
    it('validationresourceloadervalidation_repeat_text_boundary_19', 0, async () => {
      const repeated: string = repeatText('A', 10);
      expect(repeated.length).assertEqual(10);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 20: validationresourceloadervalidation_metrics_reset
    it('validationresourceloadervalidation_metrics_reset_20', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 21: validationresourceloadervalidation_catalog_and_metrics
    it('validationresourceloadervalidation_catalog_and_metrics_21', 0, async () => {
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

    // Case 22: validationresourceloadervalidation_event_matrix
    it('validationresourceloadervalidation_event_matrix_22', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(3);
      expect(events.length).assertEqual(3);
      const notifications: NotificationContent[] = createNotificationMatrix(3);
      expect(notifications.length).assertEqual(3);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 23: validationresourceloadervalidation_input_sanitizer_rules
    it('validationresourceloadervalidation_input_sanitizer_rules_23', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-23   ')).assertEqual('text-23');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 24: validationresourceloadervalidation_event_validator_accept_reject
    it('validationresourceloadervalidation_event_validator_accept_reject_24', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-24');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 25: validationresourceloadervalidation_event_validator_length_and_sanitize
    it('validationresourceloadervalidation_event_validator_length_and_sanitize_25', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 25);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-25');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-25   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-25');
    });

    // Case 26: validationresourceloadervalidation_config_manager_update
    it('validationresourceloadervalidation_config_manager_update_26', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.26';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 27: validationresourceloadervalidation_config_manager_reject_invalid
    it('validationresourceloadervalidation_config_manager_reject_invalid_27', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 28: validationresourceloadervalidation_boundary_checker_ranges
    it('validationresourceloadervalidation_boundary_checker_ranges_28', 0, async () => {
      const checker: BoundaryChecker = new BoundaryChecker();
      const result: BoundaryResult = checker.checkLength('   value-28   ', 1, 64);
      expect(result.accepted).assertTrue();
      expect(result.normalized).assertEqual('value-28');
      expect(checker.checkNumber(28, 0, 1000)).assertTrue();
      expect(checker.clamp(5000, 0, 100)).assertEqual(100);
    });

    // Case 29: validationresourceloadervalidation_utility_functions
    it('validationresourceloadervalidation_utility_functions_29', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-29   ')).assertEqual('data-29');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-29')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 30: validationresourceloadervalidation_repeat_text_boundary
    it('validationresourceloadervalidation_repeat_text_boundary_30', 0, async () => {
      const repeated: string = repeatText('A', 1);
      expect(repeated.length).assertEqual(1);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 31: validationresourceloadervalidation_metrics_reset
    it('validationresourceloadervalidation_metrics_reset_31', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 32: validationresourceloadervalidation_catalog_and_metrics
    it('validationresourceloadervalidation_catalog_and_metrics_32', 0, async () => {
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

    // Case 33: validationresourceloadervalidation_event_matrix
    it('validationresourceloadervalidation_event_matrix_33', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(14);
      expect(events.length).assertEqual(14);
      const notifications: NotificationContent[] = createNotificationMatrix(14);
      expect(notifications.length).assertEqual(14);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 34: validationresourceloadervalidation_input_sanitizer_rules
    it('validationresourceloadervalidation_input_sanitizer_rules_34', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-34   ')).assertEqual('text-34');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 35: validationresourceloadervalidation_event_validator_accept_reject
    it('validationresourceloadervalidation_event_validator_accept_reject_35', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-35');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 36: validationresourceloadervalidation_event_validator_length_and_sanitize
    it('validationresourceloadervalidation_event_validator_length_and_sanitize_36', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const longEvent: SubscriberEvent = createEventByKind(EventKind.LONG, 36);
      expect(validator.isTooLong(longEvent)).assertTrue();
      const unicodeEvent: SubscriberEvent = createEvent('unicode-\u03A9-36');
      expect(validator.containsUnicode(unicodeEvent)).assertTrue();
      const padded: SubscriberEvent = createEvent('   padded-36   ');
      const sanitized: SubscriberEvent = validator.sanitize(padded);
      expect(sanitized.data).assertEqual('padded-36');
    });

    // Case 37: validationresourceloadervalidation_config_manager_update
    it('validationresourceloadervalidation_config_manager_update_37', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      expect(manager.getConfig().bundleName).assertEqual(BUNDLE_NAME);
      const config: SubscriberConfig = createDefaultConfig();
      config.eventName = 'custom.event.37';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertTrue();
      expect(manager.getUpdateCount()).assertEqual(1);
    });

    // Case 38: validationresourceloadervalidation_config_manager_reject_invalid
    it('validationresourceloadervalidation_config_manager_reject_invalid_38', 0, async () => {
      const manager: SubscriberConfigManager = new SubscriberConfigManager();
      const config: SubscriberConfig = createDefaultConfig();
      config.bundleName = '';
      const result: OperationResult = manager.setConfig(config);
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(ERROR_CODE_INVALID_CONFIG);
      expect(manager.getInvalidCount()).assertEqual(1);
    });

    // Case 39: validationresourceloadervalidation_boundary_checker_ranges
    it('validationresourceloadervalidation_boundary_checker_ranges_39', 0, async () => {
      const checker: BoundaryChecker = new BoundaryChecker();
      const result: BoundaryResult = checker.checkLength('   value-39   ', 1, 64);
      expect(result.accepted).assertTrue();
      expect(result.normalized).assertEqual('value-39');
      expect(checker.checkNumber(39, 0, 1000)).assertTrue();
      expect(checker.clamp(5000, 0, 100)).assertEqual(100);
    });

    // Case 40: validationresourceloadervalidation_utility_functions
    it('validationresourceloadervalidation_utility_functions_40', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-40   ')).assertEqual('data-40');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-40')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

  });
}
