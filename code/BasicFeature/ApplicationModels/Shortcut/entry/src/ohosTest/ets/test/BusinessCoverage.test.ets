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

import { describe, expect, it } from '@ohos/hypium';
import { BusinessStore, localDateKey, NoteItem, TodoItem } from '../../../main/ets/business/BusinessStore';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { Deferred, FixtureError } from '../support/ShortcutFixture';
import { ControlledBusinessStorage, createBusiness, loadBusiness, StoredBusinessFixture,
  StoredDayFixture, waitBusiness } from '../support/CoverageFixture';

export default function businessCoverageTests(): void {
  describe('BusinessCoverage', () => {
    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0100
     * @tc.name      testBusinessCoverage0001
     * @tc.desc      Verify empty initialize idempotent and retry without context
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const store = createBusiness(scope, io, clock.now);
        store.retry();
        expect(io.reads).assertEqual(0);
        expect(store.snapshot().ready).assertFalse();
        store.initialize(getTestContext());
        store.initialize(getTestContext());
        await waitBusiness(scope, store);
        store.initialize(getTestContext());
        store.retry();
        expect(io.reads).assertEqual(1);
        expect(io.writes).assertEqual(0);
        expect(store.snapshot().todos.length).assertEqual(3);
        expect(store.snapshot().collections.length).assertEqual(3);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0200
     * @tc.name      testBusinessCoverage0002
     * @tc.desc      Verify read rejection and invalid json can retry without overwrite
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        for (const raw of [
          '{',
          'null',
          '[]',
          '{"version":2,"notes":[],"draftTitle":"","draftBody":"","todoDays":[]}',
          '{"version":1}'
        ]) {
          const io = new ControlledBusinessStorage();
          io.value = raw;
          const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
          expect(store.snapshot().ready).assertFalse();
          expect(store.errorText()).assertEqual('读取失败，请重试');
          expect(io.value).assertEqual(raw);
          expect(io.writes).assertEqual(0);
          io.value = '';
          store.retry();
          await waitBusiness(scope, store);
          expect(store.snapshot().ready).assertTrue();
          expect(store.errorText()).assertEqual('');
          expect(io.reads).assertEqual(2);
        }
        const io = new ControlledBusinessStorage();
        io.failRead = true;
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready).assertFalse();
        io.failRead = false;
        store.retry();
        await waitBusiness(scope, store);
        expect(store.snapshot().ready).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0300
     * @tc.name      testBusinessCoverage0003
     * @tc.desc      Verify invalid note schema duplicates and limits reject atomically
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0003', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const invalid: string[] = [
          '[null]', '[{"id":"","title":"t","body":"b","createdAt":0}]',
          '[{"id":"a","title":2,"body":"b","createdAt":0}]',
          '[{"id":"a","title":"t","body":false,"createdAt":0}]',
          '[{"id":"a","title":"t","body":"b","createdAt":null}]',
          '[{"id":"a","title":"t","body":"b","createdAt":0},{"id":"a","title":"t","body":"b","createdAt":1}]'
        ];
        for (const notes of invalid) {
          const io = new ControlledBusinessStorage();
          io.value = `{"version":1,"notes":${notes},"draftTitle":"","draftBody":"","todoDays":[]}`;
          const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
          expect(store.snapshot().ready).assertFalse();
          expect(store.snapshot().notes.length).assertEqual(0);
          expect(io.writes).assertEqual(0);
        }
        for (const kind of [0, 1, 2, 3, 4]) {
          const data = new StoredBusinessFixture();
          data.notes = [new NoteItem('one', 'ok', 'ok', 1)];
          if (kind === 0) { data.notes[0].title = 'x'.repeat(61); }
          if (kind === 1) { data.notes[0].body = 'x'.repeat(4001); }
          if (kind === 2) { data.draftTitle = 'x'.repeat(61); }
          if (kind === 3) { data.draftBody = 'x'.repeat(4001); }
          if (kind === 4) {
            data.notes = [];
            for (let i = 0; i < 51; i++) { data.notes.push(new NoteItem(`${i}`, 't', 'b', i)); }
          }
          const io = new ControlledBusinessStorage();
          io.value = JSON.stringify(data);
          const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
          expect(store.snapshot().ready).assertFalse();
          expect(io.writes).assertEqual(0);
        }
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0400
     * @tc.name      testBusinessCoverage0004
     * @tc.desc      Verify invalid todo schema dates ids count and boolean reject
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0004', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const badDays: string[] = [
          '[null]',
          '[{"date":"2026-1-2","items":[' +
          '{"id":"a","title":"t","done":false},{"id":"b","title":"t","done":false},' +
          '{"id":"c","title":"t","done":false}]}]',
          '[{"date":"2026-11-02","items":[]}]',
          '[{"date":"2026-11-02","items":[null,null,null]}]',
          '[{"date":"2026-11-02","items":[' +
          '{"id":"a","title":"t","done":true},{"id":"a","title":"t","done":false},' +
          '{"id":"c","title":"t","done":false}]}]',
          '[{"date":"2026-11-02","items":[' +
          '{"id":"a","title":"t","done":1},{"id":"b","title":"t","done":false},' +
          '{"id":"c","title":"t","done":false}]}]'
        ];
        for (const days of badDays) {
          const io = new ControlledBusinessStorage();
          io.value = `{"version":1,"notes":[],"draftTitle":"","draftBody":"","todoDays":${days}}`;
          const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
          expect(store.snapshot().ready).assertFalse();
          expect(io.writes).assertEqual(0);
        }
        const data = new StoredBusinessFixture();
        data.todoDays = [new StoredDayFixture(), new StoredDayFixture()];
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        expect((await loadBusiness(scope, io, new FixedBusinessClock().now)).snapshot().ready).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0500
     * @tc.name      testBusinessCoverage0005
     * @tc.desc      Verify valid maximum lengths and fifty notes load without write
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0005', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const data = new StoredBusinessFixture();
        data.draftTitle = '中'.repeat(60);
        data.draftBody = '文'.repeat(4000);
        for (let i = 0; i < 50; i++) { data.notes.push(new NoteItem(`${i}`, 't'.repeat(60), 'b'.repeat(4000), i)); }
        data.todoDays = [new StoredDayFixture()];
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready).assertTrue();
        expect(store.snapshot().notes.length).assertEqual(50);
        expect(store.snapshot().draftBody.length).assertEqual(4000);
        expect(store.snapshot().todos[0].id).assertEqual('plan');
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0600
     * @tc.name      testBusinessCoverage0006
     * @tc.desc      Verify draft truncation reverting to saved value clears dirty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0006', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        store.setDraftTitle('标'.repeat(61));
        store.setDraftBody('文'.repeat(4001));
        expect(store.snapshot().draftTitle.length).assertEqual(60);
        expect(store.snapshot().draftBody.length).assertEqual(4000);
        expect(await store.keepDraft()).assertTrue();
        const writes = io.writes;
        store.setDraftTitle('changed');
        expect(store.hasDraftChanges()).assertTrue();
        store.setDraftTitle('标'.repeat(60));
        expect(store.hasDraftChanges()).assertFalse();
        expect(await store.keepDraft()).assertTrue();
        expect(io.writes).assertEqual(writes);
        store.openNote();
        expect(store.snapshot().draftTitle).assertEqual('标'.repeat(60));
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0700
     * @tc.name      testBusinessCoverage0007
     * @tc.desc      Verify body only title fallback trims and same tick ids are unique
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0007', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const store = await loadBusiness(scope, io, clock.now);
        store.setDraftBody('  ' + '首'.repeat(30) + '\n第二行  ');
        expect(await store.saveNote()).assertTrue();
        const first = store.snapshot().notes[0];
        expect(first.title).assertEqual('首'.repeat(24));
        expect(first.body).assertEqual('首'.repeat(30) + '\n第二行');
        store.setDraftTitle('  仅标题  ');
        expect(await store.saveNote()).assertTrue();
        const state = store.snapshot();
        expect(state.notes[0].title).assertEqual('仅标题');
        expect(state.notes[0].body).assertEqual('');
        expect(state.notes[0].createdAt).assertEqual(first.createdAt);
        expect(state.notes[0].id === first.id).assertFalse();
        expect(state.draftKept).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0800
     * @tc.name      testBusinessCoverage0008
     * @tc.desc      Verify note capacity rejects without write and delete reopens slot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0008', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const data = new StoredBusinessFixture();
        for (let i = 0; i < 50; i++) { data.notes.push(new NoteItem(`old-${i}`, 't', 'b', i)); }
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        store.setDraftTitle('new');
        expect(await store.saveNote()).assertFalse();
        expect(store.errorText()).assertEqual('便签已满，请先删除');
        expect(io.writes).assertEqual(0);
        expect(store.snapshot().draftTitle).assertEqual('new');
        expect(await store.deleteNote('does-not-exist')).assertFalse();
        expect(io.writes).assertEqual(0);
        expect(await store.deleteNote('old-0')).assertTrue();
        expect(await store.saveNote()).assertTrue();
        expect(store.snapshot().notes.length).assertEqual(50);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_0900
     * @tc.name      testBusinessCoverage0009
     * @tc.desc      Verify snapshot notes todos and collections are deep copies
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0009', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const store = await loadBusiness(scope, new ControlledBusinessStorage(), new FixedBusinessClock().now);
        store.setDraftTitle('original');
        await store.saveNote();
        const state = store.snapshot();
        state.notes[0].title = 'mutated';
        state.todos[0].done = true;
        state.collections[0].title = 'mutated';
        state.collections[0].content = '';
        state.notes.length = 0;
        state.todos.length = 0;
        const fresh = store.snapshot();
        expect(fresh.notes.length).assertEqual(1);
        expect(fresh.notes[0].title).assertEqual('original');
        expect(fresh.todos.length).assertEqual(3);
        expect(fresh.todos[0].done).assertFalse();
        expect(fresh.collections[0].title).assertEqual('每日计划清单');
        expect(fresh.collections[0].content.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1000
     * @tc.name      testBusinessCoverage0010
     * @tc.desc      Verify duplicate subscription unsubscribe and dispose clear listeners
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0010', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const store = await loadBusiness(scope, new ControlledBusinessStorage(), new FixedBusinessClock().now);
        let events = 0;
        const listener = (): void => { events++; };
        store.subscribe(listener);
        store.subscribe(listener);
        store.setDraftTitle('one');
        expect(events).assertEqual(1);
        store.unsubscribe(listener);
        store.setDraftTitle('two');
        expect(events).assertEqual(1);
        store.subscribe(listener);
        store.dispose();
        store.openNote();
        expect(events).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1100
     * @tc.name      testBusinessCoverage0011
     * @tc.desc      Verify not ready and loading gate blocks mutations and double read
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0011', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        io.readGate = new Deferred<string>();
        const store = createBusiness(scope, io, new FixedBusinessClock().now);
        store.setDraftTitle('ignored');
        expect(store.snapshot().draftTitle).assertEqual('');
        expect(await store.discardDraft()).assertFalse();
        expect(store.errorText()).assertEqual('存储不可用，请重试');
        store.initialize(getTestContext());
        store.initialize(getTestContext());
        store.setDraftBody('ignored');
        expect(await store.resetToday()).assertFalse();
        expect(store.errorText()).assertEqual('正在读取');
        expect(io.reads).assertEqual(1);
        expect(io.writes).assertEqual(0);
        io.readGate.resolve('');
        await waitBusiness(scope, store);
        expect(store.snapshot().ready).assertTrue();
        expect(store.snapshot().draftBody).assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1200
     * @tc.name      testBusinessCoverage0012
     * @tc.desc      Verify pending write blocks second commit and editor changes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0012', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        io.writeGate = new Deferred<void>();
        store.setDraftTitle('frozen');
        const pending = store.saveNote();
        expect(store.snapshot().busy).assertTrue();
        store.setDraftTitle('ignored');
        store.setDraftBody('ignored');
        expect(await store.keepDraft()).assertFalse();
        expect(await store.resetToday()).assertFalse();
        expect(io.writes).assertEqual(1);
        expect(store.snapshot().draftTitle).assertEqual('frozen');
        expect(store.snapshot().draftBody).assertEqual('');
        io.writeGate.resolve(undefined);
        expect(await pending).assertTrue();
        expect(store.snapshot().notes.length).assertEqual(1);
        expect(store.snapshot().notes[0].title).assertEqual('frozen');
        expect(store.snapshot().busy).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1300
     * @tc.name      testBusinessCoverage0013
     * @tc.desc      Verify dispose during write ignores late success and late error
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0013', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        for (const reject of [false, true]) {
          const io = new ControlledBusinessStorage();
          const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
          io.writeGate = new Deferred<void>();
          store.setDraftTitle('old');
          const pending = store.saveNote();
          store.dispose();
          if (reject) {
            io.writeGate.reject(new FixtureError(1, 'late'));
          } else {
            io.writeGate.resolve(undefined);
          }
          expect(await pending).assertFalse();
          const state = store.snapshot();
          expect(state.ready).assertFalse();
          expect(state.busy).assertFalse();
          expect(state.notes.length).assertEqual(0);
          expect(state.message).assertEqual('');
          expect(state.error).assertEqual('');
        }
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1400
     * @tc.name      testBusinessCoverage0014
     * @tc.desc      Verify old load cannot overwrite reinitialized store
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0014', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const old = new Deferred<string>();
        io.readGate = old;
        const store = createBusiness(scope, io, new FixedBusinessClock().now);
        store.initialize(getTestContext());
        await Promise.resolve(); // Start the controlled read after the storage-drain barrier.
        store.dispose();
        io.readGate = undefined;
        const data = new StoredBusinessFixture();
        data.draftTitle = 'new-generation';
        io.value = JSON.stringify(data);
        store.initialize(getTestContext());
        await waitBusiness(scope, store);
        old.resolve('malformed old data');
        await Promise.resolve();
        await Promise.resolve();
        expect(io.reads).assertEqual(2);
        expect(store.snapshot().ready).assertTrue();
        expect(store.snapshot().draftTitle).assertEqual('new-generation');
        expect(store.errorText()).assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1500
     * @tc.name      testBusinessCoverage0015
     * @tc.desc      Verify midnight stale todo refreshes but never marks old id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0015', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock(2026, 12, 31);
        const store = await loadBusiness(scope, io, clock.now);
        const oldId = store.snapshot().todos[0].id;
        clock.setDate(2027, 1, 1);
        expect(await store.setTodoDone(oldId, true)).assertFalse();
        expect(store.snapshot().todoDate).assertEqual('2027-01-01');
        expect(store.errorText()).assertEqual('日期已更新，请重新选择');
        expect(store.snapshot().todos.every((item: TodoItem) => !item.done)).assertTrue();
        expect(io.writes).assertEqual(1);
        expect(await store.setTodoDone(store.snapshot().todos[0].id, true)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1600
     * @tc.name      testBusinessCoverage0016
     * @tc.desc      Verify same todo value is idempotent and missing id never writes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0016', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(await store.setTodoDone(store.snapshot().todos[0].id, false)).assertTrue();
        expect(await store.setTodoDone('missing', true)).assertFalse();
        expect(io.writes).assertEqual(0);
        expect(store.errorText()).assertEqual('待办已更新，请刷新');
        const id = store.snapshot().todos[0].id;
        expect(await store.setTodoDone(id, true)).assertTrue();
        expect(await store.setTodoDone(id, true)).assertTrue();
        expect(io.writes).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1700
     * @tc.name      testBusinessCoverage0017
     * @tc.desc      Verify date refresh and reset write failure preserve committed state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0017', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const store = await loadBusiness(scope, io, clock.now);
        await store.setTodoDone(store.snapshot().todos[0].id, true);
        const saved = io.value;
        io.failWrite = true;
        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos()).assertFalse();
        expect(store.snapshot().todoDate).assertEqual('2026-11-02');
        expect(store.snapshot().todos[0].done).assertTrue();
        expect(io.value).assertEqual(saved);
        clock.setDate(2026, 11, 2);
        expect(await store.resetToday()).assertFalse();
        expect(store.snapshot().todos[0].done).assertTrue();
        io.failWrite = false;
        expect(await store.resetToday()).assertTrue();
        expect(store.snapshot().todos.every((item: TodoItem) => !item.done)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1800
     * @tc.name      testBusinessCoverage0018
     * @tc.desc      Verify local date key handles leap day month year and single digits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0018', 0, async () => {
      await runCase(async () => {
        expect(localDateKey(new Date(2024, 1, 29, 0, 0, 0).getTime())).assertEqual('2024-02-29');
        expect(localDateKey(new Date(2026, 0, 2, 23, 59, 59).getTime())).assertEqual('2026-01-02');
        expect(localDateKey(new Date(2026, 11, 31, 23, 59, 59).getTime())).assertEqual('2026-12-31');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_1900
     * @tc.name      testBusinessCoverage0019
     * @tc.desc      Verify reopened same timestamp never creates duplicate note ids
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0019', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const first = await loadBusiness(scope, io, clock.now);
        first.setDraftTitle('first');
        expect(await first.saveNote()).assertTrue();
        const originalId = first.snapshot().notes[0].id;
        first.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        reopened.setDraftTitle('second');
        expect(await reopened.saveNote()).assertTrue();
        const notes = reopened.snapshot().notes;
        expect(notes.length).assertEqual(2);
        expect(notes[0].id === originalId).assertFalse();
        reopened.dispose();
        const verified = await loadBusiness(scope, io, clock.now);
        expect(verified.snapshot().ready).assertTrue();
        expect(verified.snapshot().notes.length).assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSCOVERAGE_2000
     * @tc.name      testBusinessCoverage0020
     * @tc.desc      Verify restored ids with sequence gaps are never overwritten
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBusinessCoverage0020', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const clock = new FixedBusinessClock();
        const data = new StoredBusinessFixture();
        data.notes = [new NoteItem(`${clock.now()}-1`, 'old-one', 'kept', clock.now()),
          new NoteItem(`${clock.now()}-3`, 'old-three', 'kept', clock.now())];
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        const store = await loadBusiness(scope, io, clock.now);
        store.setDraftTitle('new-two');
        expect(await store.saveNote()).assertTrue();
        store.setDraftTitle('new-four');
        expect(await store.saveNote()).assertTrue();
        const notes = store.snapshot().notes;
        expect(notes.length).assertEqual(4);
        expect(notes[0].id).assertEqual(`${clock.now()}-4`);
        expect(notes[1].id).assertEqual(`${clock.now()}-2`);
        expect(notes[2].title).assertEqual('old-one');
        expect(notes[3].title).assertEqual('old-three');
        const ids = notes.map((note: NoteItem) => note.id);
        expect(new Set(ids).size).assertEqual(4);
      });
    });
  });
}
