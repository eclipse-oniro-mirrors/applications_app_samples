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
import { statusList } from '../../../../main/ets/pages/IssueReporter/models/IssueDetailInfo';

const SESSION_IDLE: string = 'idle';

const SESSION_ACTIVE: string = 'active';

const SESSION_EXPIRED: string = 'expired';

const SESSION_CLOSED: string = 'closed';

const SESSION_TTL_MS: number = 30000;

const MAX_SESSIONS: number = 4;

interface IssueSession {
  id: string;
  createdAt: number;
  lastActiveAt: number;
  state: string;
}

// Manages issue reporting sessions with TTL and capacity
class SessionManager {
  private sessions: Map<string, IssueSession> = new Map<string, IssueSession>();
  private readonly ttlMs: number;
  private readonly capacity: number;

  constructor(ttlMs: number, capacity: number) {
    this.ttlMs = ttlMs;
    this.capacity = capacity;
  }

  public create(id: string, now: number): boolean {
    if (id.length === 0 || this.sessions.has(id)) {
      return false;
    }
    if (this.sessions.size >= this.capacity) {
      return false;
    }
    this.sessions.set(id, {
      id: id,
      createdAt: now,
      lastActiveAt: now,
      state: SESSION_ACTIVE
    });
    return true;
  }

  public touch(id: string, now: number): boolean {
    const session = this.sessions.get(id);
    if (session === undefined || session.state !== SESSION_ACTIVE) {
      return false;
    }
    if (now - session.lastActiveAt > this.ttlMs) {
      session.state = SESSION_EXPIRED;
      return false;
    }
    session.lastActiveAt = now;
    return true;
  }

  public expire(now: number): string[] {
    const expired: string[] = [];
    this.sessions.forEach((session: IssueSession) => {
      if (session.state === SESSION_ACTIVE && now - session.lastActiveAt > this.ttlMs) {
        session.state = SESSION_EXPIRED;
        expired.push(session.id);
      }
    });
    return expired;
  }

  public close(id: string): boolean {
    const session = this.sessions.get(id);
    if (session === undefined || session.state === SESSION_CLOSED) {
      return false;
    }
    session.state = SESSION_CLOSED;
    return true;
  }

  public getState(id: string): string {
    const session = this.sessions.get(id);
    return session === undefined ? SESSION_IDLE : session.state;
  }

  public isActive(id: string): boolean {
    return this.getState(id) === SESSION_ACTIVE;
  }

  public activeCount(): number {
    let count: number = 0;
    this.sessions.forEach((session: IssueSession) => {
      if (session.state === SESSION_ACTIVE) {
        count++;
      }
    });
    return count;
  }

  public size(): number {
    return this.sessions.size;
  }

  public lastActiveAt(id: string): number {
    const session = this.sessions.get(id);
    return session === undefined ? 0 : session.lastActiveAt;
  }

  public purge(now: number): number {
    const remove: string[] = [];
    this.sessions.forEach((session: IssueSession, id: string) => {
      if (session.state === SESSION_CLOSED || now - session.lastActiveAt > this.ttlMs) {
        remove.push(id);
      }
    });
    for (let i = 0; i < remove.length; i++) {
      this.sessions.delete(remove[i]);
    }
    return remove.length;
  }

  public clear(): void {
    this.sessions = new Map<string, IssueSession>();
  }
}

interface DraftEntry {
  id: string;
  description: string;
  status: string;
  updatedAt: number;
}

// Stores issue drafts keyed by session and purges expired entries
class DraftStore {
  private drafts: Map<string, DraftEntry> = new Map<string, DraftEntry>();

  public save(entry: DraftEntry): boolean {
    if (entry.id.length === 0 || entry.description.length === 0) {
      return false;
    }
    this.drafts.set(entry.id, {
      id: entry.id,
      description: entry.description,
      status: entry.status,
      updatedAt: entry.updatedAt
    });
    return true;
  }

  public load(id: string): DraftEntry | undefined {
    return this.drafts.get(id);
  }

  public remove(id: string): boolean {
    return this.drafts.delete(id);
  }

  public size(): number {
    return this.drafts.size;
  }

  public byStatus(status: string): DraftEntry[] {
    const result: DraftEntry[] = [];
    this.drafts.forEach((draft: DraftEntry) => {
      if (draft.status === status) {
        result.push(draft);
      }
    });
    return result;
  }

  public purgeOlderThan(cutoff: number): number {
    const stale: string[] = [];
    this.drafts.forEach((draft: DraftEntry, id: string) => {
      if (draft.updatedAt < cutoff) {
        stale.push(id);
      }
    });
    for (let i = 0; i < stale.length; i++) {
      this.drafts.delete(stale[i]);
    }
    return stale.length;
  }

  public newest(): DraftEntry | undefined {
    let newest: DraftEntry | undefined = undefined;
    this.drafts.forEach((draft: DraftEntry) => {
      if (newest === undefined || draft.updatedAt > newest.updatedAt) {
        newest = draft;
      }
    });
    return newest;
  }

  public clear(): void {
    this.drafts = new Map<string, DraftEntry>();
  }
}

interface IssueNotification {
  issueId: string;
  status: string;
  message: string;
  createdAt: number;
  read: boolean;
}

// Deduplicates status notifications for issue updates
class NotificationCenter {
  private notifications: IssueNotification[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public push(issueId: string, status: string, message: string, now: number): boolean {
    if (issueId.length === 0 || message.length === 0) {
      return false;
    }
    for (let i = 0; i < this.notifications.length; i++) {
      if (this.notifications[i].issueId === issueId && this.notifications[i].status === status) {
        return false;
      }
    }
    if (this.notifications.length >= this.capacity) {
      this.notifications.shift();
    }
    this.notifications.push({
      issueId: issueId,
      status: status,
      message: message,
      createdAt: now,
      read: false
    });
    return true;
  }

  public unreadCount(): number {
    return this.notifications.filter((item: IssueNotification) => !item.read).length;
  }

  public markAllRead(): void {
    for (let i = 0; i < this.notifications.length; i++) {
      this.notifications[i].read = true;
    }
  }

  public markRead(issueId: string): boolean {
    let changed: boolean = false;
    for (let i = 0; i < this.notifications.length; i++) {
      if (this.notifications[i].issueId === issueId && !this.notifications[i].read) {
        this.notifications[i].read = true;
        changed = true;
      }
    }
    return changed;
  }

  public latest(): IssueNotification | undefined {
    return this.notifications.length === 0 ? undefined :
      this.notifications[this.notifications.length - 1];
  }

  public size(): number {
    return this.notifications.length;
  }

  public byStatus(status: string): IssueNotification[] {
    return this.notifications.filter((item: IssueNotification) => item.status === status);
  }

  public clear(): void {
    this.notifications = [];
  }
}

export default function issueSessionValidationTest() {
  describe('IssueSessionValidation_Test', () => {

    it('session_manager_should_create_and_touch', 0, () => {
      const manager = new SessionManager(SESSION_TTL_MS, MAX_SESSIONS);
      expect(manager.create('session-1', 1000)).assertTrue();
      expect(manager.create('session-1', 1000)).assertFalse();
      expect(manager.create('', 1000)).assertFalse();
      expect(manager.size()).assertEqual(1);
      expect(manager.isActive('session-1')).assertTrue();
      expect(manager.getState('session-1')).assertEqual(SESSION_ACTIVE);
      expect(manager.touch('session-1', 2000)).assertTrue();
      expect(manager.lastActiveAt('session-1')).assertEqual(2000);
    });

    it('session_manager_should_expire_on_touch', 0, () => {
      const manager = new SessionManager(SESSION_TTL_MS, MAX_SESSIONS);
      manager.create('session-1', 1000);
      expect(manager.touch('session-1', 1000 + SESSION_TTL_MS + 1)).assertFalse();
      expect(manager.getState('session-1')).assertEqual(SESSION_EXPIRED);
      expect(manager.isActive('session-1')).assertFalse();
      expect(manager.touch('session-1', 2000)).assertFalse();
      expect(manager.touch('missing', 2000)).assertFalse();
    });

    it('session_manager_should_batch_expire', 0, () => {
      const manager = new SessionManager(1000, MAX_SESSIONS);
      manager.create('a', 0);
      manager.create('b', 500);
      manager.create('c', 1500);
      const expired = manager.expire(2000);
      expect(expired.length).assertEqual(2);
      expect(expired.includes('a')).assertTrue();
      expect(expired.includes('b')).assertTrue();
      expect(expired.includes('c')).assertFalse();
      expect(manager.activeCount()).assertEqual(1);
    });

    it('session_manager_should_enforce_capacity', 0, () => {
      const manager = new SessionManager(SESSION_TTL_MS, 2);
      expect(manager.create('a', 0)).assertTrue();
      expect(manager.create('b', 0)).assertTrue();
      expect(manager.create('c', 0)).assertFalse();
      expect(manager.size()).assertEqual(2);
      manager.close('a');
      expect(manager.getState('a')).assertEqual(SESSION_CLOSED);
      expect(manager.close('a')).assertFalse();
      expect(manager.create('c', 0)).assertFalse();
    });

    it('session_manager_should_purge_closed_and_stale', 0, () => {
      const manager = new SessionManager(1000, MAX_SESSIONS);
      manager.create('active', 1000);
      manager.create('closed', 1000);
      manager.create('stale', 0);
      manager.close('closed');
      const removed = manager.purge(1500);
      expect(removed).assertEqual(2);
      expect(manager.size()).assertEqual(1);
      expect(manager.isActive('active')).assertTrue();
      expect(manager.getState('stale')).assertEqual(SESSION_IDLE);
      manager.clear();
      expect(manager.size()).assertEqual(0);
    });

    it('draft_store_should_save_and_load', 0, () => {
      const store = new DraftStore();
      expect(store.save({
        id: 'draft-1', description: 'screen flickers', status: 'draft', updatedAt: 1000
      })).assertTrue();
      expect(store.save({
        id: '', description: 'x', status: 'draft', updatedAt: 1
      })).assertFalse();
      expect(store.save({
        id: 'draft-2', description: '', status: 'draft', updatedAt: 1
      })).assertFalse();
      expect(store.size()).assertEqual(1);
      const loaded = store.load('draft-1') as DraftEntry;
      expect(loaded.description).assertEqual('screen flickers');
      expect(store.load('missing') === undefined).assertTrue();
    });

    it('draft_store_should_filter_and_remove', 0, () => {
      const store = new DraftStore();
      store.save({ id: 'a', description: 'a', status: 'draft', updatedAt: 100 });
      store.save({ id: 'b', description: 'b', status: 'submitted', updatedAt: 200 });
      store.save({ id: 'c', description: 'c', status: 'draft', updatedAt: 300 });
      expect(store.byStatus('draft').length).assertEqual(2);
      expect(store.byStatus('submitted').length).assertEqual(1);
      expect(store.byStatus('missing').length).assertEqual(0);
      expect(store.remove('a')).assertTrue();
      expect(store.remove('a')).assertFalse();
      expect(store.size()).assertEqual(2);
      store.clear();
      expect(store.size()).assertEqual(0);
    });

    it('draft_store_should_purge_and_find_newest', 0, () => {
      const store = new DraftStore();
      store.save({ id: 'old', description: 'old', status: 'draft', updatedAt: 100 });
      store.save({ id: 'new', description: 'new', status: 'draft', updatedAt: 300 });
      store.save({ id: 'mid', description: 'mid', status: 'draft', updatedAt: 200 });
      expect((store.newest() as DraftEntry).id).assertEqual('new');
      expect(store.purgeOlderThan(200)).assertEqual(1);
      expect(store.size()).assertEqual(2);
      expect(store.newest() === undefined).assertFalse();
      const empty = new DraftStore();
      expect(empty.newest() === undefined).assertTrue();
      expect(empty.purgeOlderThan(0)).assertEqual(0);
    });

    it('status_catalog_should_cover_notification_states', 0, () => {
      expect(statusList.length).assertEqual(9);
      expect(statusList.includes('提交成功')).assertTrue();
      expect(statusList.includes('提交失败')).assertTrue();
      expect(statusList.includes('上传失败')).assertTrue();
      const center = new NotificationCenter(5);
      expect(center.push('issue-1', statusList[8], 'issue submitted', 1000)).assertTrue();
      expect(center.byStatus(statusList[8]).length).assertEqual(1);
      expect(center.byStatus('unknown').length).assertEqual(0);
    });

    it('notification_center_should_deduplicate', 0, () => {
      const center = new NotificationCenter(5);
      expect(center.push('issue-1', 'resolved', 'resolved', 1000)).assertTrue();
      expect(center.push('issue-1', 'resolved', 'resolved again', 2000)).assertFalse();
      expect(center.push('issue-1', 'processing', 'processing', 3000)).assertTrue();
      expect(center.size()).assertEqual(2);
      expect(center.unreadCount()).assertEqual(2);
      expect((center.latest() as IssueNotification).status).assertEqual('processing');
    });

    it('notification_center_should_mark_read', 0, () => {
      const center = new NotificationCenter(5);
      center.push('issue-1', 'resolved', 'done', 1000);
      center.push('issue-2', 'processing', 'working', 2000);
      expect(center.markRead('issue-1')).assertTrue();
      expect(center.markRead('issue-1')).assertFalse();
      expect(center.unreadCount()).assertEqual(1);
      center.markAllRead();
      expect(center.unreadCount()).assertEqual(0);
      expect(center.push('', 'status', 'message', 1)).assertFalse();
      expect(center.push('issue-3', 'status', '', 1)).assertFalse();
    });

    it('notification_center_should_bound_capacity', 0, () => {
      const center = new NotificationCenter(2);
      expect(center.push('a', 's1', 'm1', 1)).assertTrue();
      expect(center.push('b', 's2', 'm2', 2)).assertTrue();
      expect(center.push('c', 's3', 'm3', 3)).assertTrue();
      expect(center.size()).assertEqual(2);
      expect(center.byStatus('s1').length).assertEqual(0);
      expect((center.latest() as IssueNotification).issueId).assertEqual('c');
      center.clear();
      expect(center.size()).assertEqual(0);
      expect(center.latest() === undefined).assertTrue();
    });

    it('session_draft_notification_flow_should_integrate', 0, () => {
      const manager = new SessionManager(SESSION_TTL_MS, MAX_SESSIONS);
      const store = new DraftStore();
      const center = new NotificationCenter(5);
      manager.create('session-1', 1000);
      store.save({
        id: 'session-1', description: 'black screen', status: 'draft', updatedAt: 1000
      });
      expect(manager.touch('session-1', 2000)).assertTrue();
      expect(store.save({
        id: 'session-1', description: 'black screen after standby', status: 'submitted', updatedAt: 2000
      })).assertTrue();
      expect(center.push('issue-1', statusList[8], 'submit success', 2000)).assertTrue();
      expect(store.byStatus('submitted').length).assertEqual(1);
      expect(center.unreadCount()).assertEqual(1);
      expect(manager.expire(2000 + SESSION_TTL_MS + 1).length).assertEqual(1);
      expect(manager.purge(2000 + SESSION_TTL_MS + 1)).assertEqual(1);
    });

    it('session_constants_should_be_stable', 0, () => {
      expect(SESSION_IDLE).assertEqual('idle');
      expect(SESSION_ACTIVE).assertEqual('active');
      expect(SESSION_EXPIRED).assertEqual('expired');
      expect(SESSION_CLOSED).assertEqual('closed');
      expect(SESSION_TTL_MS).assertEqual(30000);
      expect(MAX_SESSIONS).assertEqual(4);
    });
  });
}

