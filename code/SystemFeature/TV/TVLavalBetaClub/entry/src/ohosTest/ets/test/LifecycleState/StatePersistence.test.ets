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

const MAX_ENTRIES: number = 5;

const TTL_MS: number = 120000;

const CURRENT_VERSION: number = 2;

interface PersistedState {
  page: string;
  scrollOffset: number;
  filter: string;
  savedAt: number;
  version: number;
}

// Encodes persisted state into a key-value string
class PersistenceCodec {
  public static encode(state: PersistedState): string {
    return `v${state.version};${state.page};${state.scrollOffset};${state.filter};${state.savedAt}`;
  }

  public static decode(raw: string): PersistedState | undefined {
    const parts = raw.split(';');
    if (parts.length !== 5 || !parts[0].startsWith('v')) {
      return undefined;
    }
    const version = Number(parts[0].substring(1));
    const scrollOffset = Number(parts[2]);
    const savedAt = Number(parts[4]);
    if (Number.isNaN(version) || Number.isNaN(scrollOffset) || Number.isNaN(savedAt)) {
      return undefined;
    }
    return {
      page: parts[1],
      scrollOffset: scrollOffset,
      filter: parts[3],
      savedAt: savedAt,
      version: version
    };
  }

  public static isCompatible(state: PersistedState): boolean {
    return state.version === CURRENT_VERSION;
  }
}

// Persists page state with TTL and capacity limits
class PersistenceStore {
  private states: Map<string, PersistedState> = new Map<string, PersistedState>();
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public save(page: string, state: PersistedState): boolean {
    if (page.length === 0 || !PersistenceCodec.isCompatible(state)) {
      return false;
    }
    if (!this.states.has(page) && this.states.size >= this.capacity) {
      const oldest = this.oldestPage();
      if (oldest !== '') {
        this.states.delete(oldest);
      }
    }
    this.states.set(page, {
      page: state.page,
      scrollOffset: state.scrollOffset,
      filter: state.filter,
      savedAt: state.savedAt,
      version: state.version
    });
    return true;
  }

  public load(page: string, now: number): PersistedState | undefined {
    const state = this.states.get(page);
    if (state === undefined) {
      return undefined;
    }
    if (now - state.savedAt > TTL_MS) {
      this.states.delete(page);
      return undefined;
    }
    return state;
  }

  public remove(page: string): boolean {
    return this.states.delete(page);
  }

  public size(): number {
    return this.states.size;
  }

  public pages(): string[] {
    const result: string[] = [];
    this.states.forEach((state: PersistedState, page: string) => {
      result.push(page);
    });
    return result;
  }

  public pruneExpired(now: number): number {
    const remove: string[] = [];
    this.states.forEach((state: PersistedState, page: string) => {
      if (now - state.savedAt > TTL_MS) {
        remove.push(page);
      }
    });
    for (let i = 0; i < remove.length; i++) {
      this.states.delete(remove[i]);
    }
    return remove.length;
  }

  public oldestPage(): string {
    let oldestPage: string = '';
    let oldestTime: number = 0;
    this.states.forEach((state: PersistedState, page: string) => {
      if (oldestPage === '' || state.savedAt < oldestTime) {
        oldestPage = page;
        oldestTime = state.savedAt;
      }
    });
    return oldestPage;
  }

  public clear(): void {
    this.states = new Map<string, PersistedState>();
  }
}

// Restores persisted list state into the runtime model
class ListStateRestorer {
  private page: string = '';
  private scrollOffset: number = 0;
  private filter: string = '';

  public restore(state: PersistedState): boolean {
    if (!PersistenceCodec.isCompatible(state) || state.page.length === 0) {
      return false;
    }
    this.page = state.page;
    this.scrollOffset = state.scrollOffset < 0 ? 0 : state.scrollOffset;
    this.filter = state.filter;
    return true;
  }

  public getPage(): string {
    return this.page;
  }

  public getScrollOffset(): number {
    return this.scrollOffset;
  }

  public getFilter(): string {
    return this.filter;
  }

  public isRestored(): boolean {
    return this.page.length > 0;
  }

  public reset(): void {
    this.page = '';
    this.scrollOffset = 0;
    this.filter = '';
  }
}

export default function statePersistenceTest() {
  describe('StatePersistence_Test', () => {

    it('codec_should_round_trip_state', 0, () => {
      const state: PersistedState = {
        page: 'list', scrollOffset: 240, filter: 'processing', savedAt: 1000, version: CURRENT_VERSION
      };
      const raw = PersistenceCodec.encode(state);
      expect(raw).assertContain('list');
      const decoded = PersistenceCodec.decode(raw) as PersistedState;
      expect(decoded.page).assertEqual('list');
      expect(decoded.scrollOffset).assertEqual(240);
      expect(decoded.filter).assertEqual('processing');
      expect(decoded.version).assertEqual(CURRENT_VERSION);
    });

    it('codec_should_reject_malformed_payload', 0, () => {
      expect(PersistenceCodec.decode('') === undefined).assertTrue();
      expect(PersistenceCodec.decode('list;240') === undefined).assertTrue();
      expect(PersistenceCodec.decode('v2;list;x;filter;1') === undefined).assertTrue();
      expect(PersistenceCodec.decode('2;list;0;filter;1') === undefined).assertTrue();
      expect(PersistenceCodec.decode('v2;list;0;filter;1') !== undefined).assertTrue();
    });

    it('codec_should_check_version', 0, () => {
      expect(PersistenceCodec.isCompatible({
        page: 'list', scrollOffset: 0, filter: '', savedAt: 0, version: CURRENT_VERSION
      })).assertTrue();
      expect(PersistenceCodec.isCompatible({
        page: 'list', scrollOffset: 0, filter: '', savedAt: 0, version: CURRENT_VERSION + 1
      })).assertFalse();
    });

    it('store_should_save_and_load', 0, () => {
      const store = new PersistenceStore(MAX_ENTRIES);
      expect(store.save('list', {
        page: 'list', scrollOffset: 100, filter: '', savedAt: 1000, version: CURRENT_VERSION
      })).assertTrue();
      expect(store.size()).assertEqual(1);
      const loaded = store.load('list', 2000) as PersistedState;
      expect(loaded.scrollOffset).assertEqual(100);
      expect(store.load('missing', 2000) === undefined).assertTrue();
    });

    it('store_should_expire_entries', 0, () => {
      const store = new PersistenceStore(MAX_ENTRIES);
      store.save('list', {
        page: 'list', scrollOffset: 0, filter: '', savedAt: 1000, version: CURRENT_VERSION
      });
      expect(store.load('list', 1000 + TTL_MS) !== undefined).assertTrue();
      expect(store.load('list', 1000 + TTL_MS + 1) === undefined).assertTrue();
      expect(store.size()).assertEqual(0);
    });

    it('store_should_reject_invalid_save', 0, () => {
      const store = new PersistenceStore(MAX_ENTRIES);
      expect(store.save('', {
        page: '', scrollOffset: 0, filter: '', savedAt: 0, version: CURRENT_VERSION
      })).assertFalse();
      expect(store.save('list', {
        page: 'list', scrollOffset: 0, filter: '', savedAt: 0, version: 1
      })).assertFalse();
      expect(store.size()).assertEqual(0);
    });

    it('store_should_enforce_capacity', 0, () => {
      const store = new PersistenceStore(2);
      store.save('a', { page: 'a', scrollOffset: 0, filter: '', savedAt: 100, version: CURRENT_VERSION });
      store.save('b', { page: 'b', scrollOffset: 0, filter: '', savedAt: 200, version: CURRENT_VERSION });
      store.save('c', { page: 'c', scrollOffset: 0, filter: '', savedAt: 300, version: CURRENT_VERSION });
      expect(store.size()).assertEqual(2);
      expect(store.load('a', 400) === undefined).assertTrue();
      expect(store.load('c', 400) !== undefined).assertTrue();
    });

    it('store_should_prune_expired_entries', 0, () => {
      const store = new PersistenceStore(MAX_ENTRIES);
      store.save('a', { page: 'a', scrollOffset: 0, filter: '', savedAt: 100, version: CURRENT_VERSION });
      store.save('b', { page: 'b', scrollOffset: 0, filter: '', savedAt: 500, version: CURRENT_VERSION });
      expect(store.pruneExpired(100 + TTL_MS + 1)).assertEqual(1);
      expect(store.size()).assertEqual(1);
      expect(store.pages()).assertDeepEquals(['b']);
      expect(store.remove('b')).assertTrue();
      expect(store.remove('b')).assertFalse();
      expect(store.size()).assertEqual(0);
    });

    it('store_should_find_oldest_page', 0, () => {
      const store = new PersistenceStore(MAX_ENTRIES);
      expect(store.oldestPage()).assertEqual('');
      store.save('a', { page: 'a', scrollOffset: 0, filter: '', savedAt: 300, version: CURRENT_VERSION });
      store.save('b', { page: 'b', scrollOffset: 0, filter: '', savedAt: 100, version: CURRENT_VERSION });
      expect(store.oldestPage()).assertEqual('b');
      store.clear();
      expect(store.size()).assertEqual(0);
      expect(store.oldestPage()).assertEqual('');
    });

    it('restorer_should_apply_state', 0, () => {
      const restorer = new ListStateRestorer();
      expect(restorer.isRestored()).assertFalse();
      expect(restorer.restore({
        page: 'list', scrollOffset: 320, filter: 'resolved', savedAt: 1000, version: CURRENT_VERSION
      })).assertTrue();
      expect(restorer.getPage()).assertEqual('list');
      expect(restorer.getScrollOffset()).assertEqual(320);
      expect(restorer.getFilter()).assertEqual('resolved');
      expect(restorer.isRestored()).assertTrue();
      restorer.reset();
      expect(restorer.isRestored()).assertFalse();
    });

    it('restorer_should_reject_incompatible_state', 0, () => {
      const restorer = new ListStateRestorer();
      expect(restorer.restore({
        page: 'list', scrollOffset: 10, filter: '', savedAt: 0, version: 1
      })).assertFalse();
      expect(restorer.restore({
        page: '', scrollOffset: 10, filter: '', savedAt: 0, version: CURRENT_VERSION
      })).assertFalse();
      expect(restorer.isRestored()).assertFalse();
    });

    it('restorer_should_clamp_negative_scroll', 0, () => {
      const restorer = new ListStateRestorer();
      restorer.restore({
        page: 'list', scrollOffset: -50, filter: 'draft', savedAt: 0, version: CURRENT_VERSION
      });
      expect(restorer.getScrollOffset()).assertEqual(0);
      expect(restorer.getFilter()).assertEqual('draft');
    });

    it('persistence_flow_should_restore_list', 0, () => {
      const store = new PersistenceStore(MAX_ENTRIES);
      const restorer = new ListStateRestorer();
      const state: PersistedState = {
        page: 'list', scrollOffset: 640, filter: 'processing', savedAt: 1000, version: CURRENT_VERSION
      };
      expect(store.save(state.page, state)).assertTrue();
      const loaded = store.load('list', 2000);
      expect(loaded !== undefined).assertTrue();
      expect(restorer.restore(loaded as PersistedState)).assertTrue();
      expect(PersistenceCodec.decode(PersistenceCodec.encode(loaded as PersistedState)) !== undefined)
        .assertTrue();
      expect(restorer.getScrollOffset()).assertEqual(640);
    });

    it('state_persistence_constants_should_be_stable', 0, () => {
      expect(MAX_ENTRIES).assertEqual(5);
      expect(TTL_MS).assertEqual(120000);
      expect(CURRENT_VERSION).assertEqual(2);
    });
  });
}

