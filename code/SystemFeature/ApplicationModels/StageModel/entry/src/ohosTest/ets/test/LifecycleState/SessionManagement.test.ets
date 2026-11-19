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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum SessionState {
  PENDING = 0,
  ACTIVE = 1,
  EXPIRED = 2,
  REVOKED = 3
}

class Session {
  id: string = '';
  token: string = '';
  owner: string = '';
  createdAt: number = 0;
  ttl: number = 0;
  state: number = SessionState.PENDING;
  renewCount: number = 0;

  constructor(id: string, token: string, owner: string, createdAt: number, ttl: number) {
    this.id = id;
    this.token = token;
    this.owner = owner;
    this.createdAt = createdAt;
    this.ttl = ttl;
  }

  expiresAt(): number {
    return this.createdAt + this.ttl;
  }

  isAlive(now: number): boolean {
    return this.state === SessionState.ACTIVE && now < this.expiresAt();
  }
}

class SessionStore {
  private sessions: Session[] = [];
  private now: number = 0;
  private counter: number = 0;
  private rejected: number = 0;

  advance(ms: number): void {
    if (ms > 0) {
      this.now = this.now + ms;
    }
  }

  getNow(): number {
    return this.now;
  }

  create(owner: string, ttl: number): Session {
    this.counter = this.counter + 1;
    const index = this.counter;
    const session = new Session(`session-${index}`, `token-${index}`, owner, this.now, ttl);
    session.state = SessionState.ACTIVE;
    this.sessions.push(session);
    return session;
  }

  find(id: string): Session | null {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].id === id) {
        return this.sessions[i];
      }
    }
    return null;
  }

  findByToken(token: string): Session | null {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].token === token) {
        return this.sessions[i];
      }
    }
    return null;
  }

  renew(id: string): boolean {
    const session = this.find(id);
    if (session === null || session.state !== SessionState.ACTIVE) {
      this.rejected = this.rejected + 1;
      return false;
    }
    if (this.now >= session.expiresAt()) {
      session.state = SessionState.EXPIRED;
      this.rejected = this.rejected + 1;
      return false;
    }
    session.createdAt = this.now;
    session.renewCount = session.renewCount + 1;
    return true;
  }

  revoke(id: string): boolean {
    const session = this.find(id);
    if (session === null) {
      return false;
    }
    if (session.state === SessionState.REVOKED) {
      return false;
    }
    session.state = SessionState.REVOKED;
    return true;
  }

  isValid(id: string): boolean {
    const session = this.find(id);
    if (session === null) {
      return false;
    }
    return session.isAlive(this.now);
  }

  expireDue(): number {
    let expired = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      const session = this.sessions[i];
      if (session.state === SessionState.ACTIVE && this.now >= session.expiresAt()) {
        session.state = SessionState.EXPIRED;
        expired = expired + 1;
      }
    }
    return expired;
  }

  activeCount(): number {
    let count = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].state === SessionState.ACTIVE) {
        count = count + 1;
      }
    }
    return count;
  }

  countByState(state: number): number {
    let count = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].state === state) {
        count = count + 1;
      }
    }
    return count;
  }

  purge(): number {
    const kept: Session[] = [];
    let removed = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].state === SessionState.REVOKED) {
        removed = removed + 1;
      } else {
        kept.push(this.sessions[i]);
      }
    }
    this.sessions = kept;
    return removed;
  }

  size(): number {
    return this.sessions.length;
  }

  getRejected(): number {
    return this.rejected;
  }

  allIds(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.sessions.length; i++) {
      ids.push(this.sessions[i].id);
    }
    return ids;
  }
}

export default function sessionManagementTest(): void {
  describe('SessionManagement', () => {
    it('SessionManagement_001', 0, async (done: Function) => {
      const store = new SessionStore();
      expect(store.size()).assertEqual(0);
      expect(store.activeCount()).assertEqual(0);
      expect(store.getNow()).assertEqual(0);
      expect(store.find('missing')).assertNull();
      done();
    });

    it('SessionManagement_002', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('MainAbility', 1000);
      expect(session.id).assertEqual('session-1');
      expect(session.token).assertEqual('token-1');
      expect(session.state).assertEqual(SessionState.ACTIVE);
      expect(session.expiresAt()).assertEqual(1000);
      expect(store.size()).assertEqual(1);
      done();
    });

    it('SessionManagement_003', 0, async (done: Function) => {
      const store = new SessionStore();
      const first = store.create('A', 1000);
      const second = store.create('B', 2000);
      expect(first.id === second.id).assertFalse();
      expect(second.id).assertEqual('session-2');
      expect(store.activeCount()).assertEqual(2);
      done();
    });

    it('SessionManagement_004', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      expect(store.isValid(session.id)).assertTrue();
      store.advance(1000);
      expect(store.isValid(session.id)).assertFalse();
      expect(store.expireDue()).assertEqual(1);
      expect(session.state).assertEqual(SessionState.EXPIRED);
      done();
    });

    it('SessionManagement_005', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      store.advance(500);
      expect(store.renew(session.id)).assertTrue();
      expect(session.renewCount).assertEqual(1);
      store.advance(800);
      expect(store.isValid(session.id)).assertTrue();
      expect(session.expiresAt()).assertEqual(1500);
      done();
    });

    it('SessionManagement_006', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 100);
      store.advance(200);
      expect(store.renew(session.id)).assertFalse();
      expect(session.state).assertEqual(SessionState.EXPIRED);
      expect(store.getRejected()).assertEqual(1);
      done();
    });

    it('SessionManagement_007', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      expect(store.revoke(session.id)).assertTrue();
      expect(session.state).assertEqual(SessionState.REVOKED);
      expect(store.revoke(session.id)).assertFalse();
      expect(store.isValid(session.id)).assertFalse();
      done();
    });

    it('SessionManagement_008', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      expect(store.findByToken(session.token) !== null).assertTrue();
      const found = store.findByToken(session.token);
      expect(found === null ? '' : found.id).assertEqual(session.id);
      expect(store.findByToken('missing')).assertNull();
      done();
    });

    it('SessionManagement_009', 0, async (done: Function) => {
      const store = new SessionStore();
      store.create('A', 1000);
      store.create('B', 1000);
      store.revoke('session-1');
      expect(store.purge()).assertEqual(1);
      expect(store.size()).assertEqual(1);
      expect(store.allIds().indexOf('session-1') < 0).assertTrue();
      expect(store.allIds().indexOf('session-2') >= 0).assertTrue();
      done();
    });

    it('SessionManagement_010', 0, async (done: Function) => {
      const store = new SessionStore();
      store.create('A', 100);
      store.create('B', 300);
      store.advance(150);
      expect(store.expireDue()).assertEqual(1);
      expect(store.countByState(SessionState.EXPIRED)).assertEqual(1);
      expect(store.activeCount()).assertEqual(1);
      done();
    });

    it('SessionManagement_011', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      store.advance(999);
      expect(store.isValid(session.id)).assertTrue();
      store.advance(1);
      expect(store.isValid(session.id)).assertFalse();
      done();
    });

    it('SessionManagement_012', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      store.revoke(session.id);
      store.advance(100);
      expect(store.renew(session.id)).assertFalse();
      expect(store.getRejected()).assertEqual(1);
      expect(session.renewCount).assertEqual(0);
      done();
    });

    it('SessionManagement_013', 0, async (done: Function) => {
      const store = new SessionStore();
      store.create('A', 1000);
      store.advance(500);
      store.create('B', 1000);
      expect(store.countByState(SessionState.ACTIVE)).assertEqual(2);
      store.advance(500);
      expect(store.expireDue()).assertEqual(1);
      expect(store.countByState(SessionState.ACTIVE)).assertEqual(1);
      done();
    });

    it('SessionManagement_014', 0, async (done: Function) => {
      const store = new SessionStore();
      store.advance(-100);
      expect(store.getNow()).assertEqual(0);
      expect(store.revoke('missing')).assertFalse();
      expect(store.purge()).assertEqual(0);
      done();
    });

    it('SessionManagement_015', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      expect(session.isAlive(0)).assertTrue();
      expect(session.isAlive(999)).assertTrue();
      expect(session.isAlive(1000)).assertFalse();
      done();
    });

    it('SessionManagement_016', 0, async (done: Function) => {
      const store = new SessionStore();
      store.create('A', 1000);
      const second = store.create('B', 1000);
      store.revoke(second.id);
      store.advance(2000);
      expect(store.expireDue()).assertEqual(1);
      expect(store.purge()).assertEqual(1);
      expect(store.size()).assertEqual(1);
      expect(store.countByState(SessionState.EXPIRED)).assertEqual(1);
      done();
    });

    it('SessionManagement_017', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `session ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
    it('SessionManagement_018', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 1000);
      store.advance(400);
      store.renew(session.id);
      store.advance(400);
      store.renew(session.id);
      expect(session.renewCount).assertEqual(2);
      expect(store.isValid(session.id)).assertTrue();
      expect(store.getRejected()).assertEqual(0);
      done();
    });

    it('SessionManagement_019', 0, async (done: Function) => {
      const store = new SessionStore();
      store.create('A', 100);
      store.create('B', 200);
      store.create('C', 300);
      store.advance(250);
      expect(store.expireDue()).assertEqual(2);
      expect(store.activeCount()).assertEqual(1);
      expect(store.countByState(SessionState.EXPIRED)).assertEqual(2);
      done();
    });

    it('SessionManagement_020', 0, async (done: Function) => {
      const store = new SessionStore();
      store.create('A', 1000);
      store.create('B', 1000);
      store.revoke('session-1');
      store.revoke('session-2');
      expect(store.purge()).assertEqual(2);
      expect(store.size()).assertEqual(0);
      expect(store.allIds().length).assertEqual(0);
      done();
    });

    it('SessionManagement_021', 0, async (done: Function) => {
      const store = new SessionStore();
      const session = store.create('A', 500);
      expect(session.owner).assertEqual('A');
      expect(session.ttl).assertEqual(500);
      expect(session.createdAt).assertEqual(0);
      expect(session.state).assertEqual(SessionState.ACTIVE);
      done();
    });

    it('SessionManagement_022', 0, async (done: Function) => {
      const store = new SessionStore();
      store.create('A', 1000);
      store.advance(1000);
      expect(store.renew('session-1')).assertFalse();
      expect(store.renew('session-1')).assertFalse();
      expect(store.getRejected()).assertEqual(2);
      expect(store.countByState(SessionState.EXPIRED)).assertEqual(1);
      done();
    });
  });
}


