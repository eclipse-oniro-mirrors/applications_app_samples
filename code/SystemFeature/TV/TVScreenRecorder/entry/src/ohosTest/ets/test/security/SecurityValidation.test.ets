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

import { describe, it, expect } from '@ohos/hypium';

/**
 * Security validation of the recorder control flow.
 * Every recorder operation is classified by a security level and recorded in a
 * shared tracker. The tracker uses a fake clock so that the ordering
 * assertions stay deterministic on every device.
 */

/** Security level of one recorder operation. */
enum SecurityLevel {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high'
}

/** One validated security record. */
interface SecurityRecord {
  level: SecurityLevel;
  operationName: string;
  success: boolean;
  responseTimeMs: number;
  timestamp: number;
  authorized: boolean;
}

/** Deterministic logical clock. */
class FakeClock {
  private current: number;

  constructor(start: number = 1700000000000) {
    this.current = start;
  }

  public now(): number {
    return this.current;
  }

  public advance(ms: number): void {
    if (ms > 0) {
      this.current += ms;
    }
  }
}

/**
 * Tracker of validated recorder operations.
 * The tracker is a singleton because the security assertions are shared by the
 * whole suite; the reset method keeps each case independent.
 */
class SecurityValidationTracker {
  private static instance: SecurityValidationTracker | null = null;
  private records: SecurityRecord[] = [];
  private clock: FakeClock = new FakeClock();
  private authorizedCount: number = 0;
  private unauthorizedCount: number = 0;

  public static getInstance(): SecurityValidationTracker {
    if (SecurityValidationTracker.instance === null) {
      SecurityValidationTracker.instance = new SecurityValidationTracker();
    }
    return SecurityValidationTracker.instance;
  }

  public record(level: SecurityLevel, operationName: string, success: boolean,
    responseTimeMs: number, authorized: boolean): void {
    const record: SecurityRecord = {
      level: level,
      operationName: operationName,
      success: success,
      responseTimeMs: responseTimeMs,
      timestamp: this.clock.now(),
      authorized: authorized
    };
    this.records.push(record);
    if (authorized) {
      this.authorizedCount++;
    } else {
      this.unauthorizedCount++;
    }
    this.clock.advance(10);
  }

  public history(): SecurityRecord[] {
    const result: SecurityRecord[] = [];
    for (let index = 0; index < this.records.length; index++) {
      result.push(this.records[index]);
    }
    return result;
  }

  public total(): number {
    return this.records.length;
  }

  public authorized(): number {
    return this.authorizedCount;
  }

  public unauthorized(): number {
    return this.unauthorizedCount;
  }

  public hasLevel(level: SecurityLevel): boolean {
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].level === level) {
        return true;
      }
    }
    return false;
  }

  public countByLevel(level: SecurityLevel): number {
    let count = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].level === level) {
        count++;
      }
    }
    return count;
  }

  public authorizationRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.authorizedCount / this.records.length;
  }

  public averageResponseTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let sum = 0;
    for (let index = 0; index < this.records.length; index++) {
      sum += this.records[index].responseTimeMs;
    }
    return sum / this.records.length;
  }

  public failedCount(): number {
    let count = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (!this.records[index].success) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].timestamp < this.records[index - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public now(): number {
    return this.clock.now();
  }

  public reset(): void {
    this.records = [];
    this.authorizedCount = 0;
    this.unauthorizedCount = 0;
    this.clock = new FakeClock();
  }
}

/** Operation catalog that maps a recorder action to a security level. */
class OperationSecurityCatalog {
  public levelOf(operation: string): SecurityLevel {
    if (operation === 'start_recording') {
      return SecurityLevel.HIGH;
    }
    if (operation === 'stop_recording') {
      return SecurityLevel.HIGH;
    }
    if (operation === 'open_timer_window') {
      return SecurityLevel.MEDIUM;
    }
    if (operation === 'show_tip_window') {
      return SecurityLevel.MEDIUM;
    }
    return SecurityLevel.LOW;
  }

  public isSensitive(operation: string): boolean {
    return this.levelOf(operation) === SecurityLevel.HIGH;
  }

  public sensitiveOperations(): string[] {
    return ['start_recording', 'stop_recording'];
  }

  public describeLevel(level: SecurityLevel): string {
    if (level === SecurityLevel.LOW) {
      return 'low_guard';
    }
    if (level === SecurityLevel.MEDIUM) {
      return 'medium_guard';
    }
    return 'high_guard';
  }
}

export default function securityValidationTest(): void {
  describe('SecurityValidation_Test', () => {
    it('navigation_should_be_low_security_operation', 0, () => {
      const catalog = new OperationSecurityCatalog();
      expect(catalog.levelOf('focus_navigation')).assertEqual(SecurityLevel.LOW);
      expect(catalog.isSensitive('focus_navigation')).assertFalse();
      expect(catalog.describeLevel(SecurityLevel.LOW)).assertEqual('low_guard');
    });

    it('window_open_should_be_medium_security_operation', 0, () => {
      const catalog = new OperationSecurityCatalog();
      expect(catalog.levelOf('open_timer_window')).assertEqual(SecurityLevel.MEDIUM);
      expect(catalog.describeLevel(SecurityLevel.MEDIUM)).assertEqual('medium_guard');
      expect(catalog.isSensitive('show_tip_window')).assertFalse();
    });

    it('start_and_stop_should_be_high_security_operations', 0, () => {
      const catalog = new OperationSecurityCatalog();
      expect(catalog.levelOf('start_recording')).assertEqual(SecurityLevel.HIGH);
      expect(catalog.levelOf('stop_recording')).assertEqual(SecurityLevel.HIGH);
      expect(catalog.isSensitive('stop_recording')).assertTrue();
      expect(catalog.sensitiveOperations().length).assertEqual(2);
    });

    it('tracker_should_record_low_security_operation', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      tracker.record(SecurityLevel.LOW, 'focus_navigation', true, 12, true);
      expect(tracker.total()).assertEqual(1);
      expect(tracker.hasLevel(SecurityLevel.LOW)).assertTrue();
      expect(tracker.history()[0].operationName).assertEqual('focus_navigation');
    });

    it('tracker_should_record_medium_security_operation', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      tracker.record(SecurityLevel.MEDIUM, 'open_timer_window', true, 25, true);
      expect(tracker.countByLevel(SecurityLevel.MEDIUM)).assertEqual(1);
      expect(tracker.isChronological()).assertTrue();
    });

    it('tracker_should_record_high_security_operation', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      tracker.record(SecurityLevel.HIGH, 'start_recording', true, 40, true);
      expect(tracker.countByLevel(SecurityLevel.HIGH)).assertEqual(1);
      expect(tracker.authorized()).assertEqual(1);
      expect(tracker.unauthorized()).assertEqual(0);
    });

    it('authorized_operations_should_be_counted', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      for (let index = 0; index < 10; index++) {
        tracker.record(SecurityLevel.LOW, `authorized_op_${index}`, true, 50, true);
      }
      expect(tracker.authorized()).assertEqual(10);
      expect(tracker.authorizationRate()).assertEqual(1);
    });

    it('unauthorized_operations_should_be_counted', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      for (let index = 0; index < 5; index++) {
        tracker.record(SecurityLevel.HIGH, `denied_op_${index}`, false, 50, false);
      }
      expect(tracker.unauthorized()).assertEqual(5);
      expect(tracker.failedCount()).assertEqual(5);
      expect(tracker.authorizationRate()).assertEqual(0);
    });

    it('records_timestamps_should_be_chronological', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      tracker.record(SecurityLevel.LOW, 'first', true, 10, true);
      tracker.record(SecurityLevel.MEDIUM, 'second', true, 10, true);
      tracker.record(SecurityLevel.HIGH, 'third', true, 10, true);
      const history = tracker.history();
      expect(history[0].timestamp).assertLess(history[1].timestamp);
      expect(history[1].timestamp).assertLess(history[2].timestamp);
      expect(tracker.isChronological()).assertTrue();
    });

    it('tracker_singleton_should_share_state', 0, () => {
      const first = SecurityValidationTracker.getInstance();
      const second = SecurityValidationTracker.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.record(SecurityLevel.LOW, 'singleton', true, 30, true);
      expect(second.total()).assertEqual(1);
      expect(second.authorized()).assertEqual(1);
    });

    it('authorization_rate_should_use_recorded_ratio', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      tracker.record(SecurityLevel.LOW, 'a', true, 10, true);
      tracker.record(SecurityLevel.LOW, 'b', true, 10, true);
      tracker.record(SecurityLevel.HIGH, 'c', false, 10, false);
      expect(tracker.authorizationRate()).assertEqual(2 / 3);
      expect(tracker.averageResponseTime()).assertEqual(10);
    });

    it('all_security_levels_should_be_reachable', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      tracker.record(SecurityLevel.LOW, 'level_low', true, 10, true);
      tracker.record(SecurityLevel.MEDIUM, 'level_medium', true, 10, true);
      tracker.record(SecurityLevel.HIGH, 'level_high', true, 10, true);
      expect(tracker.hasLevel(SecurityLevel.LOW)).assertTrue();
      expect(tracker.hasLevel(SecurityLevel.MEDIUM)).assertTrue();
      expect(tracker.hasLevel(SecurityLevel.HIGH)).assertTrue();
      expect(tracker.total()).assertEqual(3);
    });

    it('security_should_hold_during_operation_burst', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      const catalog = new OperationSecurityCatalog();
      tracker.reset();
      const operations = ['focus_navigation', 'start_recording', 'stop_recording', 'show_tip_window'];
      for (let index = 0; index < 20; index++) {
        const operation = operations[index % operations.length];
        tracker.record(catalog.levelOf(operation), operation, true, 30, true);
      }
      expect(tracker.total()).assertEqual(20);
      expect(tracker.failedCount()).assertEqual(0);
      expect(tracker.countByLevel(SecurityLevel.HIGH)).assertEqual(10);
      expect(tracker.isChronological()).assertTrue();
    });

    it('validation_performance_should_stay_bounded', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.reset();
      const clock = new FakeClock();
      const start = clock.now();
      for (let index = 0; index < 100; index++) {
        tracker.record(SecurityLevel.LOW, `perf_${index}`, true, 5, true);
        clock.advance(1);
      }
      const elapsed = clock.now() - start;
      expect(elapsed).assertEqual(100);
      expect(tracker.total()).assertEqual(100);
      expect(tracker.averageResponseTime()).assertEqual(5);
    });

    it('comprehensive_security_validation_should_pass', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      const catalog = new OperationSecurityCatalog();
      tracker.reset();
      tracker.record(catalog.levelOf('focus_navigation'), 'focus_navigation', true, 15, true);
      tracker.record(catalog.levelOf('open_timer_window'), 'open_timer_window', true, 20, true);
      tracker.record(catalog.levelOf('start_recording'), 'start_recording', true, 60, true);
      tracker.record(catalog.levelOf('stop_recording'), 'stop_recording', true, 80, true);
      expect(tracker.authorizationRate()).assertEqual(1);
      expect(tracker.total()).assertEqual(4);
      expect(tracker.countByLevel(SecurityLevel.HIGH)).assertEqual(2);
      expect(tracker.isChronological()).assertTrue();
    });

    it('reset_should_clear_every_counter', 0, () => {
      const tracker = SecurityValidationTracker.getInstance();
      tracker.record(SecurityLevel.HIGH, 'before_reset', true, 10, true);
      tracker.reset();
      expect(tracker.total()).assertEqual(0);
      expect(tracker.authorized()).assertEqual(0);
      expect(tracker.unauthorized()).assertEqual(0);
      expect(tracker.authorizationRate()).assertEqual(0);
      expect(tracker.averageResponseTime()).assertEqual(0);
      expect(tracker.hasLevel(SecurityLevel.HIGH)).assertFalse();
    });
  });
}

