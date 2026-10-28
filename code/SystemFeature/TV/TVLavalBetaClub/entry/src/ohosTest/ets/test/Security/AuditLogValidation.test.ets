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

const ACTOR_USER: string = 'user';

const ACTOR_SYSTEM: string = 'system';

const ACTION_CREATE: string = 'create';

const ACTION_SUBMIT: string = 'submit';

const ACTION_VIEW: string = 'view';

const ACTION_DELETE: string = 'delete';

const RESULT_SUCCESS: string = 'success';

const RESULT_FAILURE: string = 'failure';

const MAX_EVENTS: number = 128;

interface AuditEvent {
  id: string;
  actor: string;
  action: string;
  target: string;
  result: string;
  timestamp: number;
  checksum: number;
}

// Validates audit event fields
class AuditValidator {
  public static isActorValid(actor: string): boolean {
    return actor === ACTOR_USER || actor === ACTOR_SYSTEM;
  }

  public static isActionValid(action: string): boolean {
    return action === ACTION_CREATE || action === ACTION_SUBMIT ||
      action === ACTION_VIEW || action === ACTION_DELETE;
  }

  public static isResultValid(result: string): boolean {
    return result === RESULT_SUCCESS || result === RESULT_FAILURE;
  }

  public static isValid(event: AuditEvent): boolean {
    return event.id.length > 0 && AuditValidator.isActorValid(event.actor) &&
      AuditValidator.isActionValid(event.action) && AuditValidator.isResultValid(event.result) &&
      event.target.length > 0 && event.timestamp > 0;
  }

  public static checksumOf(event: AuditEvent): number {
    const raw = `${event.id}|${event.actor}|${event.action}|${event.target}|${event.result}`;
    let hash: number = 0;
    for (let i = 0; i < raw.length; i++) {
      hash = (hash * 31 + raw.charCodeAt(i)) % 1000003;
    }
    return hash;
  }

  public static isChecksumValid(event: AuditEvent): boolean {
    return AuditValidator.checksumOf(event) === event.checksum;
  }
}

// Stores a bounded, checksummed audit trail
class AuditLog {
  private events: AuditEvent[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public append(id: string, actor: string, action: string, target: string,
    result: string, now: number): boolean {
    const candidate: AuditEvent = {
      id: id,
      actor: actor,
      action: action,
      target: target,
      result: result,
      timestamp: now,
      checksum: 0
    };
    if (!AuditValidator.isValid(candidate)) {
      return false;
    }
    if (this.has(id)) {
      return false;
    }
    candidate.checksum = AuditValidator.checksumOf(candidate);
    if (this.events.length >= this.capacity) {
      this.events.shift();
    }
    this.events.push(candidate);
    return true;
  }

  public has(id: string): boolean {
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].id === id) {
        return true;
      }
    }
    return false;
  }

  public count(): number {
    return this.events.length;
  }

  public eventsSnapshot(): AuditEvent[] {
    return [...this.events];
  }

  public countByResult(result: string): number {
    return this.events.filter((event: AuditEvent) => event.result === result).length;
  }

  public countByAction(action: string): number {
    return this.events.filter((event: AuditEvent) => event.action === action).length;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.events.length; i++) {
      if (this.events[i].timestamp < this.events[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public allChecksumsValid(): boolean {
    for (let i = 0; i < this.events.length; i++) {
      if (!AuditValidator.isChecksumValid(this.events[i])) {
        return false;
      }
    }
    return true;
  }

  public latest(): AuditEvent | undefined {
    return this.events.length === 0 ? undefined : this.events[this.events.length - 1];
  }

  public clear(): void {
    this.events = [];
  }
}

// Audits failed actions and summarizes risk
class AuditSummary {
  private successes: number = 0;
  private failures: number = 0;
  private destructive: number = 0;

  public record(event: AuditEvent): void {
    if (event.result === RESULT_SUCCESS) {
      this.successes++;
    } else {
      this.failures++;
    }
    if (event.action === ACTION_DELETE) {
      this.destructive++;
    }
  }

  public getSuccesses(): number {
    return this.successes;
  }

  public getFailures(): number {
    return this.failures;
  }

  public getDestructive(): number {
    return this.destructive;
  }

  public total(): number {
    return this.successes + this.failures;
  }

  public failureRate(): number {
    return this.total() === 0 ? 0 : this.failures * 100 / this.total();
  }

  public isHealthy(): boolean {
    return this.failures === 0;
  }

  public reset(): void {
    this.successes = 0;
    this.failures = 0;
    this.destructive = 0;
  }
}

export default function auditLogValidationTest() {
  describe('AuditLogValidation_Test', () => {

    it('validator_should_check_actors', 0, () => {
      expect(AuditValidator.isActorValid(ACTOR_USER)).assertTrue();
      expect(AuditValidator.isActorValid(ACTOR_SYSTEM)).assertTrue();
      expect(AuditValidator.isActorValid('guest')).assertFalse();
      expect(AuditValidator.isActorValid('')).assertFalse();
    });

    it('validator_should_check_actions', 0, () => {
      expect(AuditValidator.isActionValid(ACTION_CREATE)).assertTrue();
      expect(AuditValidator.isActionValid(ACTION_SUBMIT)).assertTrue();
      expect(AuditValidator.isActionValid(ACTION_VIEW)).assertTrue();
      expect(AuditValidator.isActionValid(ACTION_DELETE)).assertTrue();
      expect(AuditValidator.isActionValid('drop')).assertFalse();
    });

    it('validator_should_check_results', 0, () => {
      expect(AuditValidator.isResultValid(RESULT_SUCCESS)).assertTrue();
      expect(AuditValidator.isResultValid(RESULT_FAILURE)).assertTrue();
      expect(AuditValidator.isResultValid('unknown')).assertFalse();
      expect(AuditValidator.isResultValid('')).assertFalse();
    });

    it('validator_should_validate_events', 0, () => {
      const event: AuditEvent = {
        id: 'E-1', actor: ACTOR_USER, action: ACTION_SUBMIT, target: 'issue-1',
        result: RESULT_SUCCESS, timestamp: 100, checksum: 1
      };
      expect(AuditValidator.isValid(event)).assertTrue();
      event.id = '';
      expect(AuditValidator.isValid(event)).assertFalse();
      event.id = 'E-1';
      event.timestamp = 0;
      expect(AuditValidator.isValid(event)).assertFalse();
    });

    it('validator_should_compute_checksum', 0, () => {
      const event: AuditEvent = {
        id: 'E-1', actor: ACTOR_USER, action: ACTION_SUBMIT, target: 'issue-1',
        result: RESULT_SUCCESS, timestamp: 100, checksum: 0
      };
      const checksum = AuditValidator.checksumOf(event);
      expect(checksum).assertLargerOrEqual(0);
      event.checksum = checksum;
      expect(AuditValidator.isChecksumValid(event)).assertTrue();
      event.target = 'issue-2';
      expect(AuditValidator.isChecksumValid(event)).assertFalse();
    });

    it('log_should_append_valid_events', 0, () => {
      const log = new AuditLog(MAX_EVENTS);
      expect(log.append('E-1', ACTOR_USER, ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100))
        .assertTrue();
      expect(log.append('E-2', ACTOR_SYSTEM, ACTION_SUBMIT, 'issue-1', RESULT_SUCCESS, 200))
        .assertTrue();
      expect(log.count()).assertEqual(2);
      expect(log.has('E-1')).assertTrue();
      expect(log.has('E-9')).assertFalse();
    });

    it('log_should_reject_invalid_events', 0, () => {
      const log = new AuditLog(MAX_EVENTS);
      expect(log.append('', ACTOR_USER, ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100))
        .assertFalse();
      expect(log.append('E-1', 'guest', ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100))
        .assertFalse();
      expect(log.append('E-2', ACTOR_USER, 'drop', 'issue-1', RESULT_SUCCESS, 100))
        .assertFalse();
      expect(log.append('E-3', ACTOR_USER, ACTION_CREATE, '', RESULT_SUCCESS, 100))
        .assertFalse();
      expect(log.count()).assertEqual(0);
    });

    it('log_should_reject_duplicate_ids', 0, () => {
      const log = new AuditLog(MAX_EVENTS);
      expect(log.append('E-1', ACTOR_USER, ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100))
        .assertTrue();
      expect(log.append('E-1', ACTOR_SYSTEM, ACTION_VIEW, 'issue-2', RESULT_SUCCESS, 200))
        .assertFalse();
      expect(log.count()).assertEqual(1);
    });

    it('log_should_be_chronological', 0, () => {
      const log = new AuditLog(MAX_EVENTS);
      log.append('E-1', ACTOR_USER, ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100);
      log.append('E-2', ACTOR_USER, ACTION_SUBMIT, 'issue-1', RESULT_SUCCESS, 200);
      expect(log.isChronological()).assertTrue();
      log.append('E-3', ACTOR_USER, ACTION_VIEW, 'issue-1', RESULT_SUCCESS, 150);
      expect(log.isChronological()).assertFalse();
      expect(log.allChecksumsValid()).assertTrue();
    });

    it('log_should_count_by_action_and_result', 0, () => {
      const log = new AuditLog(MAX_EVENTS);
      log.append('E-1', ACTOR_USER, ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100);
      log.append('E-2', ACTOR_USER, ACTION_VIEW, 'issue-1', RESULT_SUCCESS, 200);
      log.append('E-3', ACTOR_USER, ACTION_VIEW, 'issue-1', RESULT_FAILURE, 300);
      expect(log.countByAction(ACTION_VIEW)).assertEqual(2);
      expect(log.countByAction(ACTION_DELETE)).assertEqual(0);
      expect(log.countByResult(RESULT_SUCCESS)).assertEqual(2);
      expect(log.countByResult(RESULT_FAILURE)).assertEqual(1);
    });

    it('log_should_be_bounded', 0, () => {
      const log = new AuditLog(2);
      log.append('E-1', ACTOR_USER, ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100);
      log.append('E-2', ACTOR_USER, ACTION_VIEW, 'issue-1', RESULT_SUCCESS, 200);
      log.append('E-3', ACTOR_USER, ACTION_SUBMIT, 'issue-1', RESULT_SUCCESS, 300);
      expect(log.count()).assertEqual(2);
      expect(log.has('E-1')).assertFalse();
      expect((log.latest() as AuditEvent).id).assertEqual('E-3');
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.latest() === undefined).assertTrue();
    });

    it('summary_should_track_results', 0, () => {
      const log = new AuditLog(MAX_EVENTS);
      log.append('E-1', ACTOR_USER, ACTION_CREATE, 'issue-1', RESULT_SUCCESS, 100);
      log.append('E-2', ACTOR_USER, ACTION_DELETE, 'issue-1', RESULT_FAILURE, 200);
      const summary = new AuditSummary();
      const events = log.eventsSnapshot();
      for (let i = 0; i < events.length; i++) {
        summary.record(events[i]);
      }
      expect(summary.getSuccesses()).assertEqual(1);
      expect(summary.getFailures()).assertEqual(1);
      expect(summary.getDestructive()).assertEqual(1);
      expect(summary.total()).assertEqual(2);
      expect(summary.failureRate()).assertEqual(50);
      expect(summary.isHealthy()).assertFalse();
    });

    it('audit_flow_should_record_issue_lifecycle', 0, () => {
      const log = new AuditLog(MAX_EVENTS);
      const summary = new AuditSummary();
      log.append('E-1', ACTOR_USER, ACTION_CREATE, 'ISSUE-1', RESULT_SUCCESS, 100);
      log.append('E-2', ACTOR_USER, ACTION_VIEW, 'ISSUE-1', RESULT_SUCCESS, 200);
      log.append('E-3', ACTOR_SYSTEM, ACTION_SUBMIT, 'ISSUE-1', RESULT_SUCCESS, 300);
      const events = log.eventsSnapshot();
      for (let i = 0; i < events.length; i++) {
        summary.record(events[i]);
      }
      expect(log.count()).assertEqual(3);
      expect(summary.isHealthy()).assertTrue();
      expect(log.isChronological()).assertTrue();
      expect(log.allChecksumsValid()).assertTrue();
      expect(log.countByAction(ACTION_VIEW)).assertEqual(1);
    });

    it('audit_constants_should_be_stable', 0, () => {
      expect(ACTOR_USER).assertEqual('user');
      expect(ACTOR_SYSTEM).assertEqual('system');
      expect(ACTION_CREATE).assertEqual('create');
      expect(ACTION_SUBMIT).assertEqual('submit');
      expect(ACTION_VIEW).assertEqual('view');
      expect(ACTION_DELETE).assertEqual('delete');
      expect(RESULT_SUCCESS).assertEqual('success');
      expect(RESULT_FAILURE).assertEqual('failure');
      expect(MAX_EVENTS).assertEqual(128);
    });
  });
}

