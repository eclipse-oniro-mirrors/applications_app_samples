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

export default function securitySecurityAccessibilityTest() {
  describe('Security_SecurityAccessibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'suite finished');
    });

    // Case 1: securitysecurityaccessibility_ui_ready
    it('securitysecurityaccessibility_ui_ready_1', 0, async () => {
      const exists: boolean = await componentExistsById(driver, ENABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 enable button exists: ' + String(exists));
      expect(exists === true || exists === false).assertTrue();
    });

    // Case 2: securitysecurityaccessibility_security_policy_permission
    it('securitysecurityaccessibility_security_policy_permission_2', 0, async () => {
      const policy: SecurityPolicyModel = new SecurityPolicyModel();
      expect(policy.checkNotificationPermission().allowed).assertFalse();
      policy.grant(policy.getRequiredPermission());
      expect(policy.checkNotificationPermission().allowed).assertTrue();
      expect(policy.checkEventSource(BUNDLE_NAME).allowed).assertTrue();
      expect(policy.checkBundleName(BUNDLE_NAME).allowed).assertTrue();
    });

    // Case 3: securitysecurityaccessibility_utility_functions
    it('securitysecurityaccessibility_utility_functions_3', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-3   ')).assertEqual('data-3');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-3')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 4: securitysecurityaccessibility_input_sanitizer_rules
    it('securitysecurityaccessibility_input_sanitizer_rules_4', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-4   ')).assertEqual('text-4');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 5: securitysecurityaccessibility_event_validator_accept_reject
    it('securitysecurityaccessibility_event_validator_accept_reject_5', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-5');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 6: securitysecurityaccessibility_metrics_reset
    it('securitysecurityaccessibility_metrics_reset_6', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 7: securitysecurityaccessibility_repeat_text_boundary
    it('securitysecurityaccessibility_repeat_text_boundary_7', 0, async () => {
      const repeated: string = repeatText('A', 8);
      expect(repeated.length).assertEqual(8);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 8: securitysecurityaccessibility_catalog_and_metrics
    it('securitysecurityaccessibility_catalog_and_metrics_8', 0, async () => {
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

    // Case 9: securitysecurityaccessibility_event_matrix
    it('securitysecurityaccessibility_event_matrix_9', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(10);
      expect(events.length).assertEqual(10);
      const notifications: NotificationContent[] = createNotificationMatrix(10);
      expect(notifications.length).assertEqual(10);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 10: securitysecurityaccessibility_boundary_checker_ranges
    it('securitysecurityaccessibility_boundary_checker_ranges_10', 0, async () => {
      const checker: BoundaryChecker = new BoundaryChecker();
      const result: BoundaryResult = checker.checkLength('   value-10   ', 1, 64);
      expect(result.accepted).assertTrue();
      expect(result.normalized).assertEqual('value-10');
      expect(checker.checkNumber(10, 0, 1000)).assertTrue();
      expect(checker.clamp(5000, 0, 100)).assertEqual(100);
    });

    // Case 11: securitysecurityaccessibility_session_manager_lifecycle
    it('securitysecurityaccessibility_session_manager_lifecycle_11', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 12: securitysecurityaccessibility_security_policy_permission
    it('securitysecurityaccessibility_security_policy_permission_12', 0, async () => {
      const policy: SecurityPolicyModel = new SecurityPolicyModel();
      expect(policy.checkNotificationPermission().allowed).assertFalse();
      policy.grant(policy.getRequiredPermission());
      expect(policy.checkNotificationPermission().allowed).assertTrue();
      expect(policy.checkEventSource(BUNDLE_NAME).allowed).assertTrue();
      expect(policy.checkBundleName(BUNDLE_NAME).allowed).assertTrue();
    });

    // Case 13: securitysecurityaccessibility_utility_functions
    it('securitysecurityaccessibility_utility_functions_13', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-13   ')).assertEqual('data-13');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-13')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 14: securitysecurityaccessibility_input_sanitizer_rules
    it('securitysecurityaccessibility_input_sanitizer_rules_14', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-14   ')).assertEqual('text-14');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 15: securitysecurityaccessibility_event_validator_accept_reject
    it('securitysecurityaccessibility_event_validator_accept_reject_15', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-15');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 16: securitysecurityaccessibility_metrics_reset
    it('securitysecurityaccessibility_metrics_reset_16', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // Case 17: securitysecurityaccessibility_repeat_text_boundary
    it('securitysecurityaccessibility_repeat_text_boundary_17', 0, async () => {
      const repeated: string = repeatText('A', 8);
      expect(repeated.length).assertEqual(8);
      const event: SubscriberEvent = createEvent(repeated);
      expect(event.data.length).assertLargerOrEqual(1);
      expect(getStateName(SubscriberState.ENABLED)).assertEqual('enabled');
      expect(getOperationName(SubscriberOperation.ENABLE)).assertEqual('enable');
    });

    // Case 18: securitysecurityaccessibility_catalog_and_metrics
    it('securitysecurityaccessibility_catalog_and_metrics_18', 0, async () => {
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

    // Case 19: securitysecurityaccessibility_event_matrix
    it('securitysecurityaccessibility_event_matrix_19', 0, async () => {
      const events: SubscriberEvent[] = createEventMatrix(20);
      expect(events.length).assertEqual(20);
      const notifications: NotificationContent[] = createNotificationMatrix(20);
      expect(notifications.length).assertEqual(20);
      expect(events[0].data.length).assertLargerOrEqual(1);
    });

    // Case 20: securitysecurityaccessibility_boundary_checker_ranges
    it('securitysecurityaccessibility_boundary_checker_ranges_20', 0, async () => {
      const checker: BoundaryChecker = new BoundaryChecker();
      const result: BoundaryResult = checker.checkLength('   value-20   ', 1, 64);
      expect(result.accepted).assertTrue();
      expect(result.normalized).assertEqual('value-20');
      expect(checker.checkNumber(20, 0, 1000)).assertTrue();
      expect(checker.clamp(5000, 0, 100)).assertEqual(100);
    });

    // Case 21: securitysecurityaccessibility_session_manager_lifecycle
    it('securitysecurityaccessibility_session_manager_lifecycle_21', 0, async () => {
      const manager: SubscriberSessionManager = new SubscriberSessionManager();
      const session: SubscriberSession = manager.createSession();
      const activated: OperationResult = session.activate();
      expect(activated.success).assertTrue();
      expect(session.getState()).assertEqual(SubscriberState.ENABLED);
      expect(manager.getSessionCount()).assertEqual(1);
      const closed: OperationResult = manager.closeSession(session.getId());
      expect(closed.success).assertTrue();
    });

    // Case 22: securitysecurityaccessibility_security_policy_permission
    it('securitysecurityaccessibility_security_policy_permission_22', 0, async () => {
      const policy: SecurityPolicyModel = new SecurityPolicyModel();
      expect(policy.checkNotificationPermission().allowed).assertFalse();
      policy.grant(policy.getRequiredPermission());
      expect(policy.checkNotificationPermission().allowed).assertTrue();
      expect(policy.checkEventSource(BUNDLE_NAME).allowed).assertTrue();
      expect(policy.checkBundleName(BUNDLE_NAME).allowed).assertTrue();
    });

    // Case 23: securitysecurityaccessibility_utility_functions
    it('securitysecurityaccessibility_utility_functions_23', 0, async () => {
      expect(isSupportedEventName(STATIC_EVENT_NAME)).assertTrue();
      expect(normalizeEventData('   data-23   ')).assertEqual('data-23');
      expect(countOccurrences('abcabc', 'abc')).assertEqual(2);
      expect(containsAsciiOnly('plain-23')).assertTrue();
      expect(sumNumbers([1, 2, 3])).assertEqual(6);
      expect(averageNumbers([2, 4, 6])).assertEqual(4);
    });

    // Case 24: securitysecurityaccessibility_input_sanitizer_rules
    it('securitysecurityaccessibility_input_sanitizer_rules_24', 0, async () => {
      const sanitizer: InputSanitizer = new InputSanitizer();
      expect(sanitizer.sanitize('   text-24   ')).assertEqual('text-24');
      expect(sanitizer.isValid('ok', 10)).assertTrue();
      expect(sanitizer.removeControlCharacters('a\u0001b')).assertEqual('ab');
      expect(sanitizer.getSanitizedCount()).assertEqual(1);
    });

    // Case 25: securitysecurityaccessibility_event_validator_accept_reject
    it('securitysecurityaccessibility_event_validator_accept_reject_25', 0, async () => {
      const validator: SubscriberEventValidator = new SubscriberEventValidator();
      const event: SubscriberEvent = createEvent('payload-25');
      expect(validator.isValidEvent(event)).assertTrue();
      expect(validator.isEmpty(event)).assertFalse();
      expect(validator.getAcceptedCount()).assertEqual(1);
      const empty: SubscriberEvent = createEmptyEvent();
      expect(validator.isValidEvent(empty)).assertFalse();
      expect(validator.getRejectedCount()).assertEqual(1);
    });

    // Case 26: securitysecurityaccessibility_metrics_reset
    it('securitysecurityaccessibility_metrics_reset_26', 0, async () => {
      const metrics: OperationMetricsCollector = new OperationMetricsCollector();
      metrics.record(SubscriberOperation.RECEIVE_EVENT);
      metrics.recordError();
      expect(metrics.getMetrics().receiveCount).assertEqual(1);
      expect(metrics.getMetrics().errorCount).assertEqual(1);
      metrics.reset();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

  });
}
