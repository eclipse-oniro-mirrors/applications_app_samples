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

const SESSION_ACTIVE: string = 'active';

const SESSION_IDLE: string = 'idle';

const SESSION_EXPIRED: string = 'expired';

const SESSION_CLOSED: string = 'closed';

const SESSION_TTL_MS: number = 60000;

const MAX_SESSIONS: number = 5;

const IDLE_AFTER_MS: number = 30000;

interface SessionRecord {
  id: string;
  userId: string;
  createdAt: number;
  lastActiveAt: number;
  state: string;
}

// Validates session identifiers before registration
class SessionValidator {
  public static isIdValid(id: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_-]{6,64}$');
    return pattern.test(id);
  }

  public static isUserValid(userId: string): boolean {
    return userId.length > 0 && userId.length <= 64;
  }

  public static isTimestampValid(timestamp: number): boolean {
    return timestamp >= 0;
  }

  public static isValid(record: SessionRecord): boolean {
    return SessionValidator.isIdValid(record.id) && SessionValidator.isUserValid(record.userId) &&
      SessionValidator.isTimestampValid(record.createdAt) &&
      SessionValidator.isTimestampValid(record.lastActiveAt) &&
      record.lastActiveAt >= record.createdAt;
  }
}

// Manages session lifecycle with TTL and idle tracking
class SessionRegistry {
  private sessions: Map<string, SessionRecord> = new Map<string, SessionRecord>();
  private readonly capacity: number;
  private readonly ttlMs: number;

  constructor(ttlMs: number, capacity: number) {
    this.ttlMs = ttlMs;
    this.capacity = capacity;
  }

  public create(id: string, userId: string, now: number): boolean {
    if (!SessionValidator.isIdValid(id) || !SessionValidator.isUserValid(userId)) {
      return false;
    }
    if (this.sessions.has(id) || this.sessions.size >= this.capacity) {
      return false;
    }
    this.sessions.set(id, {
      id: id,
      userId: userId,
      createdAt: now,
      lastActiveAt: now,
      state: SESSION_ACTIVE
    });
    return true;
  }

  public touch(id: string, now: number): boolean {
    const session = this.sessions.get(id);
    if (session === undefined || session.state === SESSION_CLOSED) {
      return false;
    }
    if (now - session.lastActiveAt > this.ttlMs) {
      session.state = SESSION_EXPIRED;
      return false;
    }
    session.lastActiveAt = now;
    session.state = SESSION_ACTIVE;
    return true;
  }

  public markIdle(now: number): string[] {
    const idle: string[] = [];
    this.sessions.forEach((session: SessionRecord) => {
      if (session.state === SESSION_ACTIVE && now - session.lastActiveAt > IDLE_AFTER_MS) {
        session.state = SESSION_IDLE;
        idle.push(session.id);
      }
    });
    return idle;
  }

  public close(id: string): boolean {
    const session = this.sessions.get(id);
    if (session === undefined || session.state === SESSION_CLOSED) {
      return false;
    }
    session.state = SESSION_CLOSED;
    return true;
  }

  public expire(now: number): string[] {
    const expired: string[] = [];
    this.sessions.forEach((session: SessionRecord) => {
      if (session.state !== SESSION_CLOSED && now - session.lastActiveAt > this.ttlMs) {
        session.state = SESSION_EXPIRED;
        expired.push(session.id);
      }
    });
    return expired;
  }

  public stateOf(id: string): string {
    const session = this.sessions.get(id);
    return session === undefined ? '' : session.state;
  }

  public activeCount(): number {
    let count: number = 0;
    this.sessions.forEach((session: SessionRecord) => {
      if (session.state === SESSION_ACTIVE) {
        count++;
      }
    });
    return count;
  }

  public size(): number {
    return this.sessions.size;
  }

  public sessionsOf(userId: string): SessionRecord[] {
    const result: SessionRecord[] = [];
    this.sessions.forEach((session: SessionRecord) => {
      if (session.userId === userId) {
        result.push(session);
      }
    });
    return result;
  }

  public purgeClosed(): number {
    const remove: string[] = [];
    this.sessions.forEach((session: SessionRecord, id: string) => {
      if (session.state === SESSION_CLOSED || session.state === SESSION_EXPIRED) {
        remove.push(id);
      }
    });
    for (let i = 0; i < remove.length; i++) {
      this.sessions.delete(remove[i]);
    }
    return remove.length;
  }

  public clear(): void {
    this.sessions = new Map<string, SessionRecord>();
  }
}

// Summarizes session operations for diagnostics
class SessionReport {
  private created: number = 0;
  private closed: number = 0;
  private expired: number = 0;

  public recordCreate(): void {
    this.created++;
  }

  public recordClose(): void {
    this.closed++;
  }

  public recordExpire(count: number): void {
    this.expired += count;
  }

  public getCreated(): number {
    return this.created;
  }

  public getClosed(): number {
    return this.closed;
  }

  public getExpired(): number {
    return this.expired;
  }

  public getLive(): number {
    return this.created - this.closed - this.expired;
  }

  public summary(): string {
    return `created=${this.created},closed=${this.closed},expired=${this.expired}`;
  }

  public reset(): void {
    this.created = 0;
    this.closed = 0;
    this.expired = 0;
  }
}

export default function sessionManagementTest() {
  describe('SessionManagement_Test', () => {

    it('validator_should_check_session_fields', 0, () => {
      expect(SessionValidator.isIdValid('SESSION-01')).assertTrue();
      expect(SessionValidator.isIdValid('bad id')).assertFalse();
      expect(SessionValidator.isIdValid('short')).assertFalse();
      expect(SessionValidator.isUserValid('developer')).assertTrue();
      expect(SessionValidator.isUserValid('')).assertFalse();
      expect(SessionValidator.isTimestampValid(0)).assertTrue();
      expect(SessionValidator.isTimestampValid(-1)).assertFalse();
    });

    it('validator_should_validate_record', 0, () => {
      const record: SessionRecord = {
        id: 'SESSION-01', userId: 'dev', createdAt: 100, lastActiveAt: 200, state: SESSION_ACTIVE
      };
      expect(SessionValidator.isValid(record)).assertTrue();
      record.lastActiveAt = 50;
      expect(SessionValidator.isValid(record)).assertFalse();
      record.lastActiveAt = 200;
      record.id = 'bad';
      expect(SessionValidator.isValid(record)).assertFalse();
    });

    it('registry_should_create_sessions', 0, () => {
      const registry = new SessionRegistry(SESSION_TTL_MS, MAX_SESSIONS);
      expect(registry.create('SESSION-01', 'dev', 1000)).assertTrue();
      expect(registry.create('SESSION-01', 'dev', 1000)).assertFalse();
      expect(registry.create('bad', 'dev', 1000)).assertFalse();
      expect(registry.create('SESSION-02', '', 1000)).assertFalse();
      expect(registry.size()).assertEqual(1);
      expect(registry.stateOf('SESSION-01')).assertEqual(SESSION_ACTIVE);
      expect(registry.activeCount()).assertEqual(1);
    });

    it('registry_should_enforce_capacity', 0, () => {
      const registry = new SessionRegistry(SESSION_TTL_MS, 2);
      expect(registry.create('SESSION-01', 'dev', 0)).assertTrue();
      expect(registry.create('SESSION-02', 'dev', 0)).assertTrue();
      expect(registry.create('SESSION-03', 'dev', 0)).assertFalse();
      expect(registry.size()).assertEqual(2);
      registry.close('SESSION-01');
      registry.purgeClosed();
      expect(registry.create('SESSION-03', 'dev', 0)).assertTrue();
      expect(registry.size()).assertEqual(2);
    });

    it('registry_should_touch_active_session', 0, () => {
      const registry = new SessionRegistry(1000, MAX_SESSIONS);
      registry.create('SESSION-01', 'dev', 0);
      expect(registry.touch('SESSION-01', 500)).assertTrue();
      expect(registry.stateOf('SESSION-01')).assertEqual(SESSION_ACTIVE);
      expect(registry.touch('missing', 500)).assertFalse();
    });

    it('registry_should_expire_on_touch', 0, () => {
      const registry = new SessionRegistry(1000, MAX_SESSIONS);
      registry.create('SESSION-01', 'dev', 0);
      expect(registry.touch('SESSION-01', 1001)).assertFalse();
      expect(registry.stateOf('SESSION-01')).assertEqual(SESSION_EXPIRED);
      expect(registry.activeCount()).assertEqual(0);
      expect(registry.touch('SESSION-01', 1002)).assertFalse();
    });

    it('registry_should_mark_idle_sessions', 0, () => {
      const registry = new SessionRegistry(SESSION_TTL_MS, MAX_SESSIONS);
      registry.create('SESSION-01', 'dev', 0);
      registry.create('SESSION-02', 'dev', 20000);
      const idle = registry.markIdle(40000);
      expect(idle.length).assertEqual(1);
      expect(idle[0]).assertEqual('SESSION-01');
      expect(registry.stateOf('SESSION-01')).assertEqual(SESSION_IDLE);
      expect(registry.stateOf('SESSION-02')).assertEqual(SESSION_ACTIVE);
    });

    it('registry_should_close_and_purge', 0, () => {
      const registry = new SessionRegistry(SESSION_TTL_MS, MAX_SESSIONS);
      registry.create('SESSION-01', 'dev', 0);
      expect(registry.close('SESSION-01')).assertTrue();
      expect(registry.close('SESSION-01')).assertFalse();
      expect(registry.stateOf('SESSION-01')).assertEqual(SESSION_CLOSED);
      expect(registry.purgeClosed()).assertEqual(1);
      expect(registry.size()).assertEqual(0);
    });

    it('registry_should_expire_in_batch', 0, () => {
      const registry = new SessionRegistry(1000, MAX_SESSIONS);
      registry.create('SESSION-01', 'dev', 0);
      registry.create('SESSION-02', 'dev', 500);
      registry.create('SESSION-03', 'dev', 1900);
      const expired = registry.expire(2000);
      expect(expired.length).assertEqual(2);
      expect(expired.includes('SESSION-01')).assertTrue();
      expect(expired.includes('SESSION-02')).assertTrue();
      expect(registry.activeCount()).assertEqual(1);
      expect(registry.purgeClosed()).assertEqual(2);
    });

    it('registry_should_list_sessions_by_user', 0, () => {
      const registry = new SessionRegistry(SESSION_TTL_MS, MAX_SESSIONS);
      registry.create('SESSION-01', 'alice', 0);
      registry.create('SESSION-02', 'alice', 0);
      registry.create('SESSION-03', 'bob', 0);
      expect(registry.sessionsOf('alice').length).assertEqual(2);
      expect(registry.sessionsOf('bob').length).assertEqual(1);
      expect(registry.sessionsOf('carol').length).assertEqual(0);
      registry.clear();
      expect(registry.size()).assertEqual(0);
    });

    it('report_should_track_session_lifecycle', 0, () => {
      const report = new SessionReport();
      report.recordCreate();
      report.recordCreate();
      report.recordCreate();
      report.recordClose();
      report.recordExpire(1);
      expect(report.getCreated()).assertEqual(3);
      expect(report.getClosed()).assertEqual(1);
      expect(report.getExpired()).assertEqual(1);
      expect(report.getLive()).assertEqual(1);
      expect(report.summary()).assertEqual('created=3,closed=1,expired=1');
      report.reset();
      expect(report.getCreated()).assertEqual(0);
    });

    it('session_flow_should_create_touch_expire', 0, () => {
      const registry = new SessionRegistry(1000, MAX_SESSIONS);
      const report = new SessionReport();
      registry.create('SESSION-01', 'alice', 0);
      report.recordCreate();
      registry.touch('SESSION-01', 500);
      const expired = registry.expire(2000);
      report.recordExpire(expired.length);
      expect(expired.length).assertEqual(1);
      expect(registry.stateOf('SESSION-01')).assertEqual(SESSION_EXPIRED);
      expect(registry.purgeClosed()).assertEqual(1);
      expect(report.getLive()).assertEqual(0);
    });

    it('session_constants_should_be_stable', 0, () => {
      expect(SESSION_ACTIVE).assertEqual('active');
      expect(SESSION_IDLE).assertEqual('idle');
      expect(SESSION_EXPIRED).assertEqual('expired');
      expect(SESSION_CLOSED).assertEqual('closed');
      expect(SESSION_TTL_MS).assertEqual(60000);
      expect(MAX_SESSIONS).assertEqual(5);
      expect(IDLE_AFTER_MS).assertEqual(30000);
    });
  });
}

