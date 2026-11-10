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

const SNAPSHOT_VERSION: number = 1;

const MAX_SNAPSHOTS: number = 3;

const MAX_DRAFT_LENGTH: number = 1024;

const MAX_SCROLL_OFFSET: number = 1000000;

interface AppSnapshot {
  version: number;
  page: string;
  draftId: string;
  scrollOffset: number;
  focusIndex: number;
  savedAt: number;
}

interface SnapshotPayload {
  version: number;
  page: string;
  draftId: string;
  scrollOffset: number;
  focusIndex: number;
  savedAt: number;
}

// Serializes snapshots into a compact string format
class SnapshotSerializer {
  public static serialize(snapshot: AppSnapshot): string {
    return `${snapshot.version}|${snapshot.page}|${snapshot.draftId}|${snapshot.scrollOffset}|` +
      `${snapshot.focusIndex}|${snapshot.savedAt}`;
  }

  public static deserialize(raw: string): AppSnapshot | undefined {
    const parts = raw.split('|');
    if (parts.length !== 6) {
      return undefined;
    }
    const version = Number(parts[0]);
    const scrollOffset = Number(parts[3]);
    const focusIndex = Number(parts[4]);
    const savedAt = Number(parts[5]);
    if (Number.isNaN(version) || Number.isNaN(scrollOffset) ||
      Number.isNaN(focusIndex) || Number.isNaN(savedAt)) {
      return undefined;
    }
    return {
      version: version,
      page: parts[1],
      draftId: parts[2],
      scrollOffset: scrollOffset,
      focusIndex: focusIndex,
      savedAt: savedAt
    };
  }

  public static isRoundTrippable(snapshot: AppSnapshot): boolean {
    const restored = SnapshotSerializer.deserialize(SnapshotSerializer.serialize(snapshot));
    return restored !== undefined && restored.page === snapshot.page &&
      restored.draftId === snapshot.draftId && restored.scrollOffset === snapshot.scrollOffset;
  }
}

// Validates snapshots before they are restored
class RecoveryValidator {
  public static isVersionSupported(version: number): boolean {
    return version === SNAPSHOT_VERSION;
  }

  public static isPageValid(page: string): boolean {
    return page.length > 0 && page.indexOf(' ') < 0;
  }

  public static isScrollValid(offset: number): boolean {
    return offset >= 0 && offset <= MAX_SCROLL_OFFSET;
  }

  public static isFocusValid(index: number): boolean {
    return index >= -1 && index <= 1000;
  }

  public static isDraftValid(draftId: string): boolean {
    return draftId.length <= MAX_DRAFT_LENGTH;
  }

  public static validate(snapshot: AppSnapshot): string[] {
    const issues: string[] = [];
    if (!RecoveryValidator.isVersionSupported(snapshot.version)) {
      issues.push('version');
    }
    if (!RecoveryValidator.isPageValid(snapshot.page)) {
      issues.push('page');
    }
    if (!RecoveryValidator.isScrollValid(snapshot.scrollOffset)) {
      issues.push('scroll');
    }
    if (!RecoveryValidator.isFocusValid(snapshot.focusIndex)) {
      issues.push('focus');
    }
    if (!RecoveryValidator.isDraftValid(snapshot.draftId)) {
      issues.push('draft');
    }
    return issues;
  }
}

// Stores a bounded history of snapshots
class SnapshotStore {
  private snapshots: AppSnapshot[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public save(snapshot: AppSnapshot): boolean {
    if (RecoveryValidator.validate(snapshot).length > 0) {
      return false;
    }
    if (this.snapshots.length >= this.capacity) {
      this.snapshots.shift();
    }
    this.snapshots.push({
      version: snapshot.version,
      page: snapshot.page,
      draftId: snapshot.draftId,
      scrollOffset: snapshot.scrollOffset,
      focusIndex: snapshot.focusIndex,
      savedAt: snapshot.savedAt
    });
    return true;
  }

  public restoreLatest(): AppSnapshot | undefined {
    return this.snapshots.length === 0 ? undefined :
      this.snapshots[this.snapshots.length - 1];
  }

  public restorePage(page: string): AppSnapshot | undefined {
    for (let i = this.snapshots.length - 1; i >= 0; i--) {
      if (this.snapshots[i].page === page) {
        return this.snapshots[i];
      }
    }
    return undefined;
  }

  public size(): number {
    return this.snapshots.length;
  }

  public pruneBefore(timestamp: number): number {
    const keep: AppSnapshot[] = [];
    for (let i = 0; i < this.snapshots.length; i++) {
      if (this.snapshots[i].savedAt >= timestamp) {
        keep.push(this.snapshots[i]);
      }
    }
    const removed = this.snapshots.length - keep.length;
    this.snapshots = keep;
    return removed;
  }

  public clear(): void {
    this.snapshots = [];
  }
}

// Rebuilds runtime state from a snapshot
class StateRestorer {
  private page: string = '';
  private scrollOffset: number = 0;
  private focusIndex: number = -1;

  public apply(snapshot: AppSnapshot): boolean {
    if (RecoveryValidator.validate(snapshot).length > 0) {
      return false;
    }
    this.page = snapshot.page;
    this.scrollOffset = snapshot.scrollOffset;
    this.focusIndex = snapshot.focusIndex;
    return true;
  }

  public getPage(): string {
    return this.page;
  }

  public getScrollOffset(): number {
    return this.scrollOffset;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public isRecovered(): boolean {
    return this.page.length > 0;
  }

  public reset(): void {
    this.page = '';
    this.scrollOffset = 0;
    this.focusIndex = -1;
  }
}

export default function stateRecoveryTest() {
  describe('StateRecovery_Test', () => {

    it('serializer_should_round_trip_snapshot', 0, () => {
      const snapshot: AppSnapshot = {
        version: SNAPSHOT_VERSION,
        page: 'IssueReporterHome',
        draftId: 'draft-1',
        scrollOffset: 320,
        focusIndex: 2,
        savedAt: 1000
      };
      const raw = SnapshotSerializer.serialize(snapshot);
      expect(raw).assertContain('IssueReporterHome');
      const restored = SnapshotSerializer.deserialize(raw) as AppSnapshot;
      expect(restored.page).assertEqual('IssueReporterHome');
      expect(restored.draftId).assertEqual('draft-1');
      expect(restored.scrollOffset).assertEqual(320);
      expect(restored.focusIndex).assertEqual(2);
      expect(SnapshotSerializer.isRoundTrippable(snapshot)).assertTrue();
    });

    it('serializer_should_reject_malformed_payload', 0, () => {
      expect(SnapshotSerializer.deserialize('') === undefined).assertTrue();
      expect(SnapshotSerializer.deserialize('1|page') === undefined).assertTrue();
      expect(SnapshotSerializer.deserialize('a|b|c|d|e|f') === undefined).assertTrue();
      expect(SnapshotSerializer.deserialize('1|page|d|0|0|x') === undefined).assertTrue();
      expect(SnapshotSerializer.deserialize('1|page|d|0|0|100') !== undefined).assertTrue();
    });

    it('validator_should_accept_valid_snapshot', 0, () => {
      const snapshot: AppSnapshot = {
        version: SNAPSHOT_VERSION, page: 'home', draftId: '',
        scrollOffset: 0, focusIndex: -1, savedAt: 1
      };
      expect(RecoveryValidator.validate(snapshot).length).assertEqual(0);
      expect(RecoveryValidator.isVersionSupported(SNAPSHOT_VERSION)).assertTrue();
      expect(RecoveryValidator.isPageValid('home')).assertTrue();
      expect(RecoveryValidator.isScrollValid(0)).assertTrue();
      expect(RecoveryValidator.isFocusValid(-1)).assertTrue();
    });

    it('validator_should_report_each_issue', 0, () => {
      const snapshot: AppSnapshot = {
        version: 99, page: '', draftId: '', scrollOffset: -1, focusIndex: -2, savedAt: 1
      };
      const issues = RecoveryValidator.validate(snapshot);
      expect(issues.length).assertEqual(4);
      expect(issues.includes('version')).assertTrue();
      expect(issues.includes('page')).assertTrue();
      expect(issues.includes('scroll')).assertTrue();
      expect(issues.includes('focus')).assertTrue();
      expect(RecoveryValidator.isVersionSupported(0)).assertFalse();
      expect(RecoveryValidator.isScrollValid(MAX_SCROLL_OFFSET + 1)).assertFalse();
    });

    it('validator_should_limit_draft_length', 0, () => {
      expect(RecoveryValidator.isDraftValid('a'.repeat(MAX_DRAFT_LENGTH))).assertTrue();
      expect(RecoveryValidator.isDraftValid('a'.repeat(MAX_DRAFT_LENGTH + 1))).assertFalse();
      expect(RecoveryValidator.isDraftValid('')).assertTrue();
      expect(RecoveryValidator.isFocusValid(1001)).assertFalse();
      expect(RecoveryValidator.isFocusValid(1000)).assertTrue();
    });

    it('store_should_save_and_restore_latest', 0, () => {
      const store = new SnapshotStore(MAX_SNAPSHOTS);
      expect(store.save({
        version: SNAPSHOT_VERSION, page: 'home', draftId: 'a',
        scrollOffset: 0, focusIndex: 0, savedAt: 100
      })).assertTrue();
      expect(store.save({
        version: SNAPSHOT_VERSION, page: 'list', draftId: 'b',
        scrollOffset: 100, focusIndex: 1, savedAt: 200
      })).assertTrue();
      expect(store.size()).assertEqual(2);
      const latest = store.restoreLatest() as AppSnapshot;
      expect(latest.page).assertEqual('list');
      expect(latest.scrollOffset).assertEqual(100);
    });

    it('store_should_reject_invalid_snapshot', 0, () => {
      const store = new SnapshotStore(MAX_SNAPSHOTS);
      expect(store.save({
        version: 2, page: 'home', draftId: '', scrollOffset: 0,
        focusIndex: 0, savedAt: 1
      })).assertFalse();
      expect(store.size()).assertEqual(0);
      expect(store.restoreLatest() === undefined).assertTrue();
      expect(store.restorePage('home') === undefined).assertTrue();
    });

    it('store_should_restore_by_page', 0, () => {
      const store = new SnapshotStore(MAX_SNAPSHOTS);
      store.save({
        version: SNAPSHOT_VERSION, page: 'home', draftId: 'a',
        scrollOffset: 10, focusIndex: 0, savedAt: 100
      });
      store.save({
        version: SNAPSHOT_VERSION, page: 'list', draftId: 'b',
        scrollOffset: 20, focusIndex: 1, savedAt: 200
      });
      store.save({
        version: SNAPSHOT_VERSION, page: 'home', draftId: 'c',
        scrollOffset: 30, focusIndex: 2, savedAt: 300
      });
      const home = store.restorePage('home') as AppSnapshot;
      expect(home.scrollOffset).assertEqual(30);
      expect(store.restorePage('missing') === undefined).assertTrue();
    });

    it('store_should_evict_oldest_snapshot', 0, () => {
      const store = new SnapshotStore(2);
      for (let i = 0; i < 4; i++) {
        store.save({
          version: SNAPSHOT_VERSION, page: `page-${i}`, draftId: '',
          scrollOffset: i, focusIndex: 0, savedAt: i + 1
        });
      }
      expect(store.size()).assertEqual(2);
      expect(store.restorePage('page-0') === undefined).assertTrue();
      expect(store.restorePage('page-3') !== undefined).assertTrue();
    });

    it('store_should_prune_old_snapshots', 0, () => {
      const store = new SnapshotStore(MAX_SNAPSHOTS);
      store.save({
        version: SNAPSHOT_VERSION, page: 'a', draftId: '', scrollOffset: 0,
        focusIndex: 0, savedAt: 100
      });
      store.save({
        version: SNAPSHOT_VERSION, page: 'b', draftId: '', scrollOffset: 0,
        focusIndex: 0, savedAt: 500
      });
      expect(store.pruneBefore(300)).assertEqual(1);
      expect(store.size()).assertEqual(1);
      expect(store.restoreLatest() !== undefined).assertTrue();
      store.clear();
      expect(store.size()).assertEqual(0);
    });

    it('restorer_should_apply_snapshot', 0, () => {
      const restorer = new StateRestorer();
      expect(restorer.isRecovered()).assertFalse();
      const applied = restorer.apply({
        version: SNAPSHOT_VERSION, page: 'detail', draftId: 'd',
        scrollOffset: 88, focusIndex: 3, savedAt: 1000
      });
      expect(applied).assertTrue();
      expect(restorer.getPage()).assertEqual('detail');
      expect(restorer.getScrollOffset()).assertEqual(88);
      expect(restorer.getFocusIndex()).assertEqual(3);
      expect(restorer.isRecovered()).assertTrue();
    });

    it('restorer_should_reject_invalid_snapshot', 0, () => {
      const restorer = new StateRestorer();
      expect(restorer.apply({
        version: 0, page: '', draftId: '', scrollOffset: -1, focusIndex: -5, savedAt: 0
      })).assertFalse();
      expect(restorer.isRecovered()).assertFalse();
      expect(restorer.getPage()).assertEqual('');
      expect(restorer.getScrollOffset()).assertEqual(0);
      expect(restorer.getFocusIndex()).assertEqual(-1);
      restorer.reset();
      expect(restorer.isRecovered()).assertFalse();
    });

    it('recovery_flow_should_restore_page_and_focus', 0, () => {
      const store = new SnapshotStore(MAX_SNAPSHOTS);
      const restorer = new StateRestorer();
      store.save({
        version: SNAPSHOT_VERSION, page: 'IssueReporterList', draftId: 'd1',
        scrollOffset: 640, focusIndex: 4, savedAt: 2000
      });
      const latest = store.restoreLatest();
      expect(latest !== undefined).assertTrue();
      expect(restorer.apply(latest as AppSnapshot)).assertTrue();
      expect(restorer.getPage()).assertEqual('IssueReporterList');
      expect(restorer.getFocusIndex()).assertEqual(4);
      expect(RecoveryValidator.validate(latest as AppSnapshot).length).assertEqual(0);
    });

    it('snapshot_constants_should_be_stable', 0, () => {
      expect(SNAPSHOT_VERSION).assertEqual(1);
      expect(MAX_SNAPSHOTS).assertEqual(3);
      expect(MAX_DRAFT_LENGTH).assertEqual(1024);
      expect(MAX_SCROLL_OFFSET).assertEqual(1000000);
    });
  });
}

