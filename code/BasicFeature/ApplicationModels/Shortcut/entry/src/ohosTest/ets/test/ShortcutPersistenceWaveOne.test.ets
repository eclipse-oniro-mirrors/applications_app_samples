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
import { BusinessEntryContext, BusinessStore, NoteRevision } from '../../../main/ets/business/BusinessStore';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness, waitBusiness } from '../support/CoverageFixture';

/** Raw persisted input; validation, loading, copying and history remain production operations. */
function persistedArchive(extra: string = ''): string {
  return '{"version":1,"notes":[{"id":"a","title":"当前A","body":"正文A","createdAt":1},' +
    '{"id":"b","title":"当前B","body":"正文B","createdAt":2}],"draftTitle":"独立草稿",' +
    '"draftBody":"独立正文","todoDays":[],"noteHistory":[' +
    '{"revisionId":"ar","noteId":"a","title":"旧A","body":"旧正文A","savedAt":1,"action":"edit"},' +
    '{"revisionId":"br","noteId":"b","title":"旧B","body":"旧正文B","savedAt":2,"action":"create"}]' + extra + '}';
}

export default function shortcutPersistenceWaveOneTests(): void {
  describe('ShortcutPersistenceWaveOne', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0100
     * @tc.name testShortcutPersistenceWaveOne0001
     * @tc.desc 编辑检查点恢复目标便签时同步恢复该目标的基线修订
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = persistedArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        store.beginEditNote('a');
        const checkpoint: BusinessEntryContext = store.entryContext();
        store.beginEditNote('b');
        store.restoreEntryContext(checkpoint);
        expect(store.snapshot().editingNoteId).assertEqual('a');
        expect(store.snapshot().editBaseRevision).assertEqual('ar');
        expect(store.snapshot().draftBody).assertEqual('正文A');
        expect(io.writes).assertEqual(0);
        store.setDraftBody('A的续写');
        await store.keepEditDraft();
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().editBaseRevision).assertEqual('ar');
        expect(reopened.snapshot().draftBody).assertEqual('A的续写');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0200
     * @tc.name testShortcutPersistenceWaveOne0002
     * @tc.desc 编辑存档指向不存在便签时保留原文并允许修正后重读
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = persistedArchive(',"editNoteId":"missing","editTitle":"编辑标题","editBody":"编辑正文"');
        const broken: string = io.value;
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready).assertFalse();
        expect(io.value).assertEqual(broken);
        expect(io.writes).assertEqual(0);
        io.value = persistedArchive(',"editNoteId":"a","editTitle":"编辑标题","editBody":"编辑正文"');
        store.retry();
        await waitBusiness(scope, store);
        expect(store.snapshot().editingNoteId).assertEqual('a');
        expect(store.snapshot().draftBody).assertEqual('编辑正文');
        expect(store.snapshot().notes[0].body).assertEqual('正文A');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0300
     * @tc.name testShortcutPersistenceWaveOne0003
     * @tc.desc 编辑正文类型错误不部分导入便签且修复后恢复编辑缓冲
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = persistedArchive(',"editNoteId":"a","editBaseRevision":"ar","editTitle":"标题","editBody":7');
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().notes.length).assertEqual(0);
        expect(store.errorText()).assertEqual('读取失败，请重试');
        expect(io.writes).assertEqual(0);
        io.value = persistedArchive(',"editNoteId":"a","editBaseRevision":"ar","editTitle":"标题","editBody":"合法编辑正文"');
        store.retry();
        await waitBusiness(scope, store);
        expect(store.snapshot().draftBody).assertEqual('合法编辑正文');
        expect(store.snapshot().editBaseRevision).assertEqual('ar');
        expect(store.hasUnsavedNoteWork()).assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0400
     * @tc.name testShortcutPersistenceWaveOne0004
     * @tc.desc 修订编号重复的历史存档被整体拒绝而不是覆盖较早版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = persistedArchive().replace('"revisionId":"br"', '"revisionId":"ar"');
        const original: string = io.value;
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready).assertFalse();
        expect(store.historyFor('a').length).assertEqual(0);
        expect(io.value).assertEqual(original);
        expect(io.writes).assertEqual(0);
        io.value = persistedArchive();
        store.retry();
        await waitBusiness(scope, store);
        expect(store.historyFor('b')[0].revisionId).assertEqual('br');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0500
     * @tc.name testShortcutPersistenceWaveOne0005
     * @tc.desc 未知历史动作不被当成有效编辑记录加载
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = persistedArchive().replace('"action":"edit"', '"action":"publish"');
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready).assertFalse();
        expect(store.snapshot().notes.length).assertEqual(0);
        expect(io.writes).assertEqual(0);
        io.value = persistedArchive();
        store.retry();
        await waitBusiness(scope, store);
        expect(store.historyFor('a')[0].action).assertEqual('edit');
        expect(await store.restoreRevision('a', 'ar')).assertTrue();
        expect(store.snapshot().notes[0].title).assertEqual('旧A');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0600
     * @tc.name testShortcutPersistenceWaveOne0006
     * @tc.desc 重复或不存在的收藏标识拒绝加载且不覆盖原存档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0006', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        for (const favorites of ['["reading","reading"]', '["missing"]']) {
          const io: ControlledBusinessStorage = new ControlledBusinessStorage();
          io.value = persistedArchive(`,"favorites":${favorites}`);
          const original: string = io.value;
          const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
          expect(store.snapshot().ready).assertFalse();
          expect(io.value).assertEqual(original);
          expect(io.writes).assertEqual(0);
          io.value = persistedArchive(',"favorites":["reading"]');
          store.retry();
          await waitBusiness(scope, store);
          store.setFavoritesOnly(true);
          expect(store.snapshot().visibleCollections.map((item): string => item.id).join(',')).assertEqual('reading');
          expect(store.snapshot().notes[0].id).assertEqual('a');
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0700
     * @tc.name testShortcutPersistenceWaveOne0007
     * @tc.desc 修改返回的历史快照不能污染后续恢复及重新打开后的历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0007', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = persistedArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const history: NoteRevision[] = store.historyFor('a');
        history[0].title = '调用者篡改';
        history[0].body = '调用者篡改正文';
        history.length = 0;
        expect(store.historyFor('a')[0].title).assertEqual('旧A');
        expect(await store.restoreRevision('a', 'ar')).assertTrue();
        expect(store.snapshot().notes[0].body).assertEqual('旧正文A');
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.historyFor('a')[0].body).assertEqual('正文A');
        expect(reopened.historyFor('a')[1].title).assertEqual('旧A');
        expect(reopened.snapshot().notes[1].title).assertEqual('当前B');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_PERSISTENCEWAVEONE_0800
     * @tc.name testShortcutPersistenceWaveOne0008
     * @tc.desc 不能将另一便签的有效修订编号用于当前便签恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutPersistenceWaveOne0008', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = persistedArchive();
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        const original: string = io.value;
        expect(await store.restoreRevision('a', 'br')).assertFalse();
        expect(store.errorText()).assertEqual('历史版本不存在');
        expect(store.snapshot().notes[0].title).assertEqual('当前A');
        expect(store.historyFor('a').length).assertEqual(1);
        expect(io.value).assertEqual(original);
        expect(io.writes).assertEqual(0);
      });
    });
  });
}
