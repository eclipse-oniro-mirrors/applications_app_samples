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

import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
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

    it(caseName('BusinessCoverage', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0001'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const store = createBusiness(scope, io, clock.now);
        store.retry();
        expect(io.reads, caseName('BusinessCoverage', '0001'), 'BusinessCoverage.test.ets:A0001').assertEqual(0);
        expect(store.snapshot().ready, caseName('BusinessCoverage', '0001'), 'BusinessCoverage.test.ets:A0002').assertFalse();
        store.initialize(getTestContext());
        store.initialize(getTestContext());
        await waitBusiness(scope, store);
        store.initialize(getTestContext());
        store.retry();
        expect(io.reads, caseName('BusinessCoverage', '0001'), 'BusinessCoverage.test.ets:A0003').assertEqual(1);
        expect(io.writes, caseName('BusinessCoverage', '0001'), 'BusinessCoverage.test.ets:A0004').assertEqual(0);
        expect(store.snapshot().todos.length, caseName('BusinessCoverage', '0001'), 'BusinessCoverage.test.ets:A0005').assertEqual(3);
        expect(store.snapshot().collections.length, caseName('BusinessCoverage', '0001'), 'BusinessCoverage.test.ets:A0006').assertEqual(3);
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

    it(caseName('BusinessCoverage', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0002'), async (scope: CaseScope): Promise<void> => {
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
          expect(store.snapshot().ready, caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0007').assertFalse();
          expect(store.errorText(), caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0008').assertEqual('读取失败，请重试');
          expect(io.value, caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0009').assertEqual(raw);
          expect(io.writes, caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0010').assertEqual(0);
          io.value = '';
          store.retry();
          await waitBusiness(scope, store);
          expect(store.snapshot().ready, caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0011').assertTrue();
          expect(store.errorText(), caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0012').assertEqual('');
          expect(io.reads, caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0013').assertEqual(2);
        }
        const io = new ControlledBusinessStorage();
        io.failRead = true;
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready, caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0014').assertFalse();
        io.failRead = false;
        store.retry();
        await waitBusiness(scope, store);
        expect(store.snapshot().ready, caseName('BusinessCoverage', '0002'), 'BusinessCoverage.test.ets:A0015').assertTrue();
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

    it(caseName('BusinessCoverage', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0003'), async (scope: CaseScope): Promise<void> => {
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
          expect(store.snapshot().ready, caseName('BusinessCoverage', '0003'), 'BusinessCoverage.test.ets:A0016').assertFalse();
          expect(store.snapshot().notes.length, caseName('BusinessCoverage', '0003'), 'BusinessCoverage.test.ets:A0017').assertEqual(0);
          expect(io.writes, caseName('BusinessCoverage', '0003'), 'BusinessCoverage.test.ets:A0018').assertEqual(0);
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
          expect(store.snapshot().ready, caseName('BusinessCoverage', '0003'), 'BusinessCoverage.test.ets:A0019').assertFalse();
          expect(io.writes, caseName('BusinessCoverage', '0003'), 'BusinessCoverage.test.ets:A0020').assertEqual(0);
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

    it(caseName('BusinessCoverage', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0004'), async (scope: CaseScope): Promise<void> => {
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
          expect(store.snapshot().ready, caseName('BusinessCoverage', '0004'), 'BusinessCoverage.test.ets:A0021').assertFalse();
          expect(io.writes, caseName('BusinessCoverage', '0004'), 'BusinessCoverage.test.ets:A0022').assertEqual(0);
        }
        const data = new StoredBusinessFixture();
        data.todoDays = [new StoredDayFixture(), new StoredDayFixture()];
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        expect((await loadBusiness(scope, io, new FixedBusinessClock().now)).snapshot().ready, caseName('BusinessCoverage', '0004'), 'BusinessCoverage.test.ets:A0023').assertFalse();
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

    it(caseName('BusinessCoverage', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0005'), async (scope: CaseScope): Promise<void> => {
        const data = new StoredBusinessFixture();
        data.draftTitle = '中'.repeat(60);
        data.draftBody = '文'.repeat(4000);
        for (let i = 0; i < 50; i++) { data.notes.push(new NoteItem(`${i}`, 't'.repeat(60), 'b'.repeat(4000), i)); }
        data.todoDays = [new StoredDayFixture()];
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready, caseName('BusinessCoverage', '0005'), 'BusinessCoverage.test.ets:A0024').assertTrue();
        expect(store.snapshot().notes.length, caseName('BusinessCoverage', '0005'), 'BusinessCoverage.test.ets:A0025').assertEqual(50);
        expect(store.snapshot().draftBody.length, caseName('BusinessCoverage', '0005'), 'BusinessCoverage.test.ets:A0026').assertEqual(4000);
        expect(store.snapshot().todos[0].id, caseName('BusinessCoverage', '0005'), 'BusinessCoverage.test.ets:A0027').assertEqual('plan');
        expect(io.writes, caseName('BusinessCoverage', '0005'), 'BusinessCoverage.test.ets:A0028').assertEqual(0);
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

    it(caseName('BusinessCoverage', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0006'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        store.setDraftTitle('标'.repeat(61));
        store.setDraftBody('文'.repeat(4001));
        expect(store.snapshot().draftTitle.length, caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0029').assertEqual(60);
        expect(store.snapshot().draftBody.length, caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0030').assertEqual(4000);
        expect(await store.keepDraft(), caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0031').assertTrue();
        const writes = io.writes;
        store.setDraftTitle('changed');
        expect(store.hasDraftChanges(), caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0032').assertTrue();
        store.setDraftTitle('标'.repeat(60));
        expect(store.hasDraftChanges(), caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0033').assertFalse();
        expect(await store.keepDraft(), caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0034').assertTrue();
        expect(io.writes, caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0035').assertEqual(writes);
        store.openNote();
        expect(store.snapshot().draftTitle, caseName('BusinessCoverage', '0006'), 'BusinessCoverage.test.ets:A0036').assertEqual('标'.repeat(60));
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

    it(caseName('BusinessCoverage', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0007'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const store = await loadBusiness(scope, io, clock.now);
        store.setDraftBody('  ' + '首'.repeat(30) + '\n第二行  ');
        expect(await store.saveNote(), caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0037').assertTrue();
        const first = store.snapshot().notes[0];
        expect(first.title, caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0038').assertEqual('首'.repeat(24));
        expect(first.body, caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0039').assertEqual('首'.repeat(30) + '\n第二行');
        store.setDraftTitle('  仅标题  ');
        expect(await store.saveNote(), caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0040').assertTrue();
        const state = store.snapshot();
        expect(state.notes[0].title, caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0041').assertEqual('仅标题');
        expect(state.notes[0].body, caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0042').assertEqual('');
        expect(state.notes[0].createdAt, caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0043').assertEqual(first.createdAt);
        expect(state.notes[0].id === first.id, caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0044').assertFalse();
        expect(state.draftKept, caseName('BusinessCoverage', '0007'), 'BusinessCoverage.test.ets:A0045').assertFalse();
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

    it(caseName('BusinessCoverage', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0008'), async (scope: CaseScope): Promise<void> => {
        const data = new StoredBusinessFixture();
        for (let i = 0; i < 50; i++) { data.notes.push(new NoteItem(`old-${i}`, 't', 'b', i)); }
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        store.setDraftTitle('new');
        expect(await store.saveNote(), caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0046').assertFalse();
        expect(store.errorText(), caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0047').assertEqual('便签已满，请先删除');
        expect(io.writes, caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0048').assertEqual(0);
        expect(store.snapshot().draftTitle, caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0049').assertEqual('new');
        expect(await store.deleteNote('does-not-exist'), caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0050').assertFalse();
        expect(io.writes, caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0051').assertEqual(0);
        expect(await store.deleteNote('old-0'), caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0052').assertTrue();
        expect(await store.saveNote(), caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0053').assertTrue();
        expect(store.snapshot().notes.length, caseName('BusinessCoverage', '0008'), 'BusinessCoverage.test.ets:A0054').assertEqual(50);
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

    it(caseName('BusinessCoverage', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0009'), async (scope: CaseScope): Promise<void> => {
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
        expect(fresh.notes.length, caseName('BusinessCoverage', '0009'), 'BusinessCoverage.test.ets:A0055').assertEqual(1);
        expect(fresh.notes[0].title, caseName('BusinessCoverage', '0009'), 'BusinessCoverage.test.ets:A0056').assertEqual('original');
        expect(fresh.todos.length, caseName('BusinessCoverage', '0009'), 'BusinessCoverage.test.ets:A0057').assertEqual(3);
        expect(fresh.todos[0].done, caseName('BusinessCoverage', '0009'), 'BusinessCoverage.test.ets:A0058').assertFalse();
        expect(fresh.collections[0].title, caseName('BusinessCoverage', '0009'), 'BusinessCoverage.test.ets:A0059').assertEqual('每日计划清单');
        expect(fresh.collections[0].content.length > 0, caseName('BusinessCoverage', '0009'), 'BusinessCoverage.test.ets:A0060').assertTrue();
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

    it(caseName('BusinessCoverage', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0010'), async (scope: CaseScope): Promise<void> => {
        const store = await loadBusiness(scope, new ControlledBusinessStorage(), new FixedBusinessClock().now);
        let events = 0;
        const listener = (): void => { events++; };
        store.subscribe(listener);
        store.subscribe(listener);
        store.setDraftTitle('one');
        expect(events, caseName('BusinessCoverage', '0010'), 'BusinessCoverage.test.ets:A0061').assertEqual(1);
        store.unsubscribe(listener);
        store.setDraftTitle('two');
        expect(events, caseName('BusinessCoverage', '0010'), 'BusinessCoverage.test.ets:A0062').assertEqual(1);
        store.subscribe(listener);
        store.dispose();
        store.openNote();
        expect(events, caseName('BusinessCoverage', '0010'), 'BusinessCoverage.test.ets:A0063').assertEqual(1);
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

    it(caseName('BusinessCoverage', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0011'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        io.readGate = new Deferred<string>();
        const store = createBusiness(scope, io, new FixedBusinessClock().now);
        store.setDraftTitle('ignored');
        expect(store.snapshot().draftTitle, caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0064').assertEqual('');
        expect(await store.discardDraft(), caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0065').assertFalse();
        expect(store.errorText(), caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0066').assertEqual('存储不可用，请重试');
        store.initialize(getTestContext());
        store.initialize(getTestContext());
        store.setDraftBody('ignored');
        expect(await store.resetToday(), caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0067').assertFalse();
        expect(store.errorText(), caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0068').assertEqual('正在读取');
        expect(io.reads, caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0069').assertEqual(1);
        expect(io.writes, caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0070').assertEqual(0);
        io.readGate.resolve('');
        await waitBusiness(scope, store);
        expect(store.snapshot().ready, caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0071').assertTrue();
        expect(store.snapshot().draftBody, caseName('BusinessCoverage', '0011'), 'BusinessCoverage.test.ets:A0072').assertEqual('');
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

    it(caseName('BusinessCoverage', '0012'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0012'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        io.writeGate = new Deferred<void>();
        store.setDraftTitle('frozen');
        const pending = store.saveNote();
        expect(store.snapshot().busy, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0073').assertTrue();
        store.setDraftTitle('ignored');
        store.setDraftBody('ignored');
        expect(await store.keepDraft(), caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0074').assertFalse();
        expect(await store.resetToday(), caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0075').assertFalse();
        expect(io.writes, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0076').assertEqual(1);
        expect(store.snapshot().draftTitle, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0077').assertEqual('frozen');
        expect(store.snapshot().draftBody, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0078').assertEqual('');
        io.writeGate.resolve(undefined);
        expect(await pending, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0079').assertTrue();
        expect(store.snapshot().notes.length, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0080').assertEqual(1);
        expect(store.snapshot().notes[0].title, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0081').assertEqual('frozen');
        expect(store.snapshot().busy, caseName('BusinessCoverage', '0012'), 'BusinessCoverage.test.ets:A0082').assertFalse();
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

    it(caseName('BusinessCoverage', '0013'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0013'), async (scope: CaseScope): Promise<void> => {
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
          expect(await pending, caseName('BusinessCoverage', '0013'), 'BusinessCoverage.test.ets:A0083').assertFalse();
          const state = store.snapshot();
          expect(state.ready, caseName('BusinessCoverage', '0013'), 'BusinessCoverage.test.ets:A0084').assertFalse();
          expect(state.busy, caseName('BusinessCoverage', '0013'), 'BusinessCoverage.test.ets:A0085').assertFalse();
          expect(state.notes.length, caseName('BusinessCoverage', '0013'), 'BusinessCoverage.test.ets:A0086').assertEqual(0);
          expect(state.message, caseName('BusinessCoverage', '0013'), 'BusinessCoverage.test.ets:A0087').assertEqual('');
          expect(state.error, caseName('BusinessCoverage', '0013'), 'BusinessCoverage.test.ets:A0088').assertEqual('');
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

    it(caseName('BusinessCoverage', '0014'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0014'), async (scope: CaseScope): Promise<void> => {
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
        expect(io.reads, caseName('BusinessCoverage', '0014'), 'BusinessCoverage.test.ets:A0089').assertEqual(2);
        expect(store.snapshot().ready, caseName('BusinessCoverage', '0014'), 'BusinessCoverage.test.ets:A0090').assertTrue();
        expect(store.snapshot().draftTitle, caseName('BusinessCoverage', '0014'), 'BusinessCoverage.test.ets:A0091').assertEqual('new-generation');
        expect(store.errorText(), caseName('BusinessCoverage', '0014'), 'BusinessCoverage.test.ets:A0092').assertEqual('');
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

    it(caseName('BusinessCoverage', '0015'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0015'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock(2026, 12, 31);
        const store = await loadBusiness(scope, io, clock.now);
        const oldId = store.snapshot().todos[0].id;
        clock.setDate(2027, 1, 1);
        expect(await store.setTodoDone(oldId, true), caseName('BusinessCoverage', '0015'), 'BusinessCoverage.test.ets:A0093').assertFalse();
        expect(store.snapshot().todoDate, caseName('BusinessCoverage', '0015'), 'BusinessCoverage.test.ets:A0094').assertEqual('2027-01-01');
        expect(store.errorText(), caseName('BusinessCoverage', '0015'), 'BusinessCoverage.test.ets:A0095').assertEqual('日期已更新，请重新选择');
        expect(store.snapshot().todos.every((item: TodoItem) => !item.done), caseName('BusinessCoverage', '0015'), 'BusinessCoverage.test.ets:A0096').assertTrue();
        expect(io.writes, caseName('BusinessCoverage', '0015'), 'BusinessCoverage.test.ets:A0097').assertEqual(1);
        expect(await store.setTodoDone(store.snapshot().todos[0].id, true), caseName('BusinessCoverage', '0015'), 'BusinessCoverage.test.ets:A0098').assertTrue();
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

    it(caseName('BusinessCoverage', '0016'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0016'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const store = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(await store.setTodoDone(store.snapshot().todos[0].id, false), caseName('BusinessCoverage', '0016'), 'BusinessCoverage.test.ets:A0099').assertTrue();
        expect(await store.setTodoDone('missing', true), caseName('BusinessCoverage', '0016'), 'BusinessCoverage.test.ets:A0100').assertFalse();
        expect(io.writes, caseName('BusinessCoverage', '0016'), 'BusinessCoverage.test.ets:A0101').assertEqual(0);
        expect(store.errorText(), caseName('BusinessCoverage', '0016'), 'BusinessCoverage.test.ets:A0102').assertEqual('待办已更新，请刷新');
        const id = store.snapshot().todos[0].id;
        expect(await store.setTodoDone(id, true), caseName('BusinessCoverage', '0016'), 'BusinessCoverage.test.ets:A0103').assertTrue();
        expect(await store.setTodoDone(id, true), caseName('BusinessCoverage', '0016'), 'BusinessCoverage.test.ets:A0104').assertTrue();
        expect(io.writes, caseName('BusinessCoverage', '0016'), 'BusinessCoverage.test.ets:A0105').assertEqual(1);
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

    it(caseName('BusinessCoverage', '0017'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0017'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const store = await loadBusiness(scope, io, clock.now);
        await store.setTodoDone(store.snapshot().todos[0].id, true);
        const saved = io.value;
        io.failWrite = true;
        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos(), caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0106').assertFalse();
        expect(store.snapshot().todoDate, caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0107').assertEqual('2026-11-02');
        expect(store.snapshot().todos[0].done, caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0108').assertTrue();
        expect(io.value, caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0109').assertEqual(saved);
        clock.setDate(2026, 11, 2);
        expect(await store.resetToday(), caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0110').assertFalse();
        expect(store.snapshot().todos[0].done, caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0111').assertTrue();
        io.failWrite = false;
        expect(await store.resetToday(), caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0112').assertTrue();
        expect(store.snapshot().todos.every((item: TodoItem) => !item.done), caseName('BusinessCoverage', '0017'), 'BusinessCoverage.test.ets:A0113').assertTrue();
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

    it(caseName('BusinessCoverage', '0018'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0018'), async (): Promise<void> => {
        expect(localDateKey(new Date(2024, 1, 29, 0, 0, 0).getTime()), caseName('BusinessCoverage', '0018'), 'BusinessCoverage.test.ets:A0114').assertEqual('2024-02-29');
        expect(localDateKey(new Date(2026, 0, 2, 23, 59, 59).getTime()), caseName('BusinessCoverage', '0018'), 'BusinessCoverage.test.ets:A0115').assertEqual('2026-01-02');
        expect(localDateKey(new Date(2026, 11, 31, 23, 59, 59).getTime()), caseName('BusinessCoverage', '0018'), 'BusinessCoverage.test.ets:A0116').assertEqual('2026-12-31');
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

    it(caseName('BusinessCoverage', '0019'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0019'), async (scope: CaseScope): Promise<void> => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        const first = await loadBusiness(scope, io, clock.now);
        first.setDraftTitle('first');
        expect(await first.saveNote(), caseName('BusinessCoverage', '0019'), 'BusinessCoverage.test.ets:A0117').assertTrue();
        const originalId = first.snapshot().notes[0].id;
        first.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        reopened.setDraftTitle('second');
        expect(await reopened.saveNote(), caseName('BusinessCoverage', '0019'), 'BusinessCoverage.test.ets:A0118').assertTrue();
        const notes = reopened.snapshot().notes;
        expect(notes.length, caseName('BusinessCoverage', '0019'), 'BusinessCoverage.test.ets:A0119').assertEqual(2);
        expect(notes[0].id === originalId, caseName('BusinessCoverage', '0019'), 'BusinessCoverage.test.ets:A0120').assertFalse();
        reopened.dispose();
        const verified = await loadBusiness(scope, io, clock.now);
        expect(verified.snapshot().ready, caseName('BusinessCoverage', '0019'), 'BusinessCoverage.test.ets:A0121').assertTrue();
        expect(verified.snapshot().notes.length, caseName('BusinessCoverage', '0019'), 'BusinessCoverage.test.ets:A0122').assertEqual(2);
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

    it(caseName('BusinessCoverage', '0020'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessCoverage', '0020'), async (scope: CaseScope): Promise<void> => {
        const clock = new FixedBusinessClock();
        const data = new StoredBusinessFixture();
        data.notes = [new NoteItem(`${clock.now()}-1`, 'old-one', 'kept', clock.now()),
          new NoteItem(`${clock.now()}-3`, 'old-three', 'kept', clock.now())];
        const io = new ControlledBusinessStorage();
        io.value = JSON.stringify(data);
        const store = await loadBusiness(scope, io, clock.now);
        store.setDraftTitle('new-two');
        expect(await store.saveNote(), caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0123').assertTrue();
        store.setDraftTitle('new-four');
        expect(await store.saveNote(), caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0124').assertTrue();
        const notes = store.snapshot().notes;
        expect(notes.length, caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0125').assertEqual(4);
        expect(notes[0].id, caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0126').assertEqual(`${clock.now()}-4`);
        expect(notes[1].id, caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0127').assertEqual(`${clock.now()}-2`);
        expect(notes[2].title, caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0128').assertEqual('old-one');
        expect(notes[3].title, caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0129').assertEqual('old-three');
        const ids = notes.map((note: NoteItem) => note.id);
        expect(new Set(ids).size, caseName('BusinessCoverage', '0020'), 'BusinessCoverage.test.ets:A0130').assertEqual(4);
      });
    });
  });
}
