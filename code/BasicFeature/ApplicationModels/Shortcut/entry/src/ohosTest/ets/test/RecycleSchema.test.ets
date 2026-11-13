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
import {
  BusinessStore, StoredData, NoteRevision, TodoDay, TodoItem, decodeBusinessDocument
} from '../../../main/ets/business/BusinessStore';
import { MAX_WORKSPACE_BYTES, workspaceUtf8Bytes } from '../../../main/ets/business/NoteRecyclePolicy';
import { CaseScope, runCase } from '../support/CaseScope';
import { RecycleBusinessStorage, recycleInput, openRecycle } from '../support/RecycleBusinessFixture';

/** Pending unified validation; schema inputs are production classes or real serialized roots. */
export default function recycleSchemaTests(): void {
  describe('RecycleSchema', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0100
     * @tc.name testShortcutRecycleSchema0001
     * @tc.desc 合法旧版读取不写盘且首次真实修改才完整写入第二版
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0001'), async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(); data.version = 1;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0001')).assertTrue();
        expect(io.value, caseName('ShortcutRecycleSchema', '0001')).assertEqual(original);
        expect(io.writes, caseName('ShortcutRecycleSchema', '0001')).assertEqual(0);
        expect(await store.toggleFavorite('reading'), caseName('ShortcutRecycleSchema', '0001')).assertTrue();
        const migrated: StoredData = decodeBusinessDocument(io.value);
        expect(migrated.version, caseName('ShortcutRecycleSchema', '0001')).assertEqual(2);
        expect(migrated.notes[0].body, caseName('ShortcutRecycleSchema', '0001')).assertEqual('正式正文0');
        expect(migrated.favorites.join(','), caseName('ShortcutRecycleSchema', '0001')).assertEqual('reading');
        expect(migrated.recycleBin.length, caseName('ShortcutRecycleSchema', '0001')).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0200
     * @tc.name testShortcutRecycleSchema0002
     * @tc.desc 旧版含未知非空回收区时拒绝迁移而不静默丢弃
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0002'), async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1, 1); data.version = 1;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0002')).assertFalse();
        expect(store.snapshot().notes.length, caseName('ShortcutRecycleSchema', '0002')).assertEqual(0);
        expect(io.value, caseName('ShortcutRecycleSchema', '0002')).assertEqual(original);
        expect(io.writes, caseName('ShortcutRecycleSchema', '0002')).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0300
     * @tc.name testShortcutRecycleSchema0003
     * @tc.desc 旧版缺省可选字段和空回收区仍以无回收项加载
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0003'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage();
        io.value = '{"version":1,"notes":[],"draftTitle":"旧草稿","draftBody":"旧正文","todoDays":[],"recycleBin":[]}';
        const store: BusinessStore = await openRecycle(scope, io);
        expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0003')).assertTrue();
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleSchema', '0003')).assertEqual('旧正文');
        expect(store.snapshot().editDraftPersisted, caseName('ShortcutRecycleSchema', '0003')).assertFalse();
        expect(store.snapshot().recycledNotes.length, caseName('ShortcutRecycleSchema', '0003')).assertEqual(0);
        expect(io.writes, caseName('ShortcutRecycleSchema', '0003')).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0400
     * @tc.name testShortcutRecycleSchema0004
     * @tc.desc 第二版同时恢复活动编辑基线和独立回收历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0004'), async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1, 1);
        data.editNoteId = 'active-0'; data.editBaseRevision = 'active-history-0';
        data.editBaseTitle = '正式标题0'; data.editBaseBody = '正式正文0';
        data.editTitle = '编辑标题'; data.editBody = '待续正文';
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io);
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleSchema', '0004')).assertEqual('待续正文');
        expect(store.snapshot().editBaseRevision, caseName('ShortcutRecycleSchema', '0004')).assertEqual('active-history-0');
        expect(store.snapshot().recycledNotes[0].history[0].noteId, caseName('ShortcutRecycleSchema', '0004')).assertEqual('recycled-0');
        expect(decodeBusinessDocument(io.value).editBaseBody, caseName('ShortcutRecycleSchema', '0004')).assertEqual('正式正文0');
        expect(io.writes, caseName('ShortcutRecycleSchema', '0004')).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0500
     * @tc.name testShortcutRecycleSchema0005
     * @tc.desc 第二版缺少回收区或序号非法时不得当成合法旧版读取
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0005'), async (scope: CaseScope): Promise<void> => {
        const raw: string = JSON.stringify(recycleInput(1, 1));
        const invalid: string[] = [raw.replace('"recycleBin":', '"unknownRecycleBin":'),
          raw.replace('"recycleSequence":1', '"recycleSequence":-1'),
          raw.replace('"noteHistory":', '"unknownHistory":')];
        for (const value of invalid) {
          const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = value;
          const store: BusinessStore = await openRecycle(scope, io);
          expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0005')).assertFalse();
          expect(io.value, caseName('ShortcutRecycleSchema', '0005')).assertEqual(value);
          expect(io.writes, caseName('ShortcutRecycleSchema', '0005')).assertEqual(0);
          expect(store.snapshot().recycledNotes.length, caseName('ShortcutRecycleSchema', '0005')).assertEqual(0);
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0600
     * @tc.name testShortcutRecycleSchema0006
     * @tc.desc 活动回收联合便签标识及回收操作标识必须唯一
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0006'), async (scope: CaseScope): Promise<void> => {
        for (const noteCollision of [false, true]) {
          const data: StoredData = recycleInput(1, 2);
          if (noteCollision) {
            data.recycleBin[0].note.id = 'active-0';
            data.recycleBin[0].history[0].noteId = 'active-0';
          } else {
            data.recycleBin[1].trashId = data.recycleBin[0].trashId;
          }
          const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
          const original: string = io.value;
          const store: BusinessStore = await openRecycle(scope, io);
          expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0006')).assertFalse();
          expect(store.snapshot().notes.length, caseName('ShortcutRecycleSchema', '0006')).assertEqual(0);
          expect(io.value, caseName('ShortcutRecycleSchema', '0006')).assertEqual(original);
          expect(io.writes, caseName('ShortcutRecycleSchema', '0006')).assertEqual(0);
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0700
     * @tc.name testShortcutRecycleSchema0007
     * @tc.desc 回收历史不能指向其它便签或复用活动修订编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0007'), async (scope: CaseScope): Promise<void> => {
        for (const revisionCollision of [false, true]) {
          const data: StoredData = recycleInput(1, 1);
          if (revisionCollision) {
            data.recycleBin[0].history[0].revisionId = 'active-history-0';
          } else {
            data.recycleBin[0].history[0].noteId = 'active-0';
          }
          const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
          const store: BusinessStore = await openRecycle(scope, io);
          expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0007')).assertFalse();
          expect(store.historyFor('active-0').length, caseName('ShortcutRecycleSchema', '0007')).assertEqual(0);
          expect(io.writes, caseName('ShortcutRecycleSchema', '0007')).assertEqual(0);
          expect(store.errorText(), caseName('ShortcutRecycleSchema', '0007')).assertEqual('读取失败，请重试');
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0800
     * @tc.name testShortcutRecycleSchema0008
     * @tc.desc 合法五十回收项可读第五十一项则整体拒绝不截断
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0008'), async (scope: CaseScope): Promise<void> => {
        const validIo: RecycleBusinessStorage = new RecycleBusinessStorage();
        validIo.value = JSON.stringify(recycleInput(0, 50));
        const valid: BusinessStore = await openRecycle(scope, validIo);
        expect(valid.snapshot().ready, caseName('ShortcutRecycleSchema', '0008')).assertTrue();
        expect(valid.snapshot().recycledNotes.length, caseName('ShortcutRecycleSchema', '0008')).assertEqual(50);
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(0, 51));
        const original: string = io.value;
        const invalid: BusinessStore = await openRecycle(scope, io);
        expect(invalid.snapshot().ready, caseName('ShortcutRecycleSchema', '0008')).assertFalse();
        expect(io.value, caseName('ShortcutRecycleSchema', '0008')).assertEqual(original);
        expect(io.writes, caseName('ShortcutRecycleSchema', '0008')).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_0900
     * @tc.name testShortcutRecycleSchema0009
     * @tc.desc 回收与活动历史合计超过一百条不能以分区各自未满绕过
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0009'), async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1, 1);
        for (let index: number = 0; index < 99; index++) {
          data.recycleBin[0].history.push(new NoteRevision(`extra-${index}`, 'recycled-0', '历史', '内容', index, 'edit'));
        }
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0009')).assertFalse();
        expect(store.snapshot().notes.length, caseName('ShortcutRecycleSchema', '0009')).assertEqual(0);
        expect(io.value, caseName('ShortcutRecycleSchema', '0009')).assertEqual(original);
        expect(io.writes, caseName('ShortcutRecycleSchema', '0009')).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_1000
     * @tc.name testShortcutRecycleSchema0010
     * @tc.desc 回收标识不能越过持久序号或使用歧义前导零
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0010'), async (scope: CaseScope): Promise<void> => {
        for (const token of ['trash-2', 'trash-01', 'trash-9007199254740992']) {
          const data: StoredData = recycleInput(0, 1); data.recycleBin[0].trashId = token;
          const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
          const store: BusinessStore = await openRecycle(scope, io);
          expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0010')).assertFalse();
          expect(store.snapshot().recycledNotes.length, caseName('ShortcutRecycleSchema', '0010')).assertEqual(0);
          expect(io.writes, caseName('ShortcutRecycleSchema', '0010')).assertEqual(0);
          expect(store.errorText(), caseName('ShortcutRecycleSchema', '0010')).assertEqual('读取失败，请重试');
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_1100
     * @tc.name testShortcutRecycleSchema0011
     * @tc.desc 合法旧版超新预算仍可只读而后续写入失败不删除原文
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0011'), async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1); data.version = 1;
        data.todoDays = [new TodoDay('2026-11-02', [
          new TodoItem('legacy-large', 'x'.repeat(MAX_WORKSPACE_BYTES), false)
        ])];
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0011')).assertTrue();
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleSchema', '0011')).assertEqual('正式正文0');
        expect(await store.toggleFavorite('reading'), caseName('ShortcutRecycleSchema', '0011')).assertFalse();
        expect(store.errorText(), caseName('ShortcutRecycleSchema', '0011')).assertEqual('存档超过8MiB空间预算，未修改原数据');
        expect(io.value, caseName('ShortcutRecycleSchema', '0011')).assertEqual(original);
        expect(io.writes, caseName('ShortcutRecycleSchema', '0011')).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLESCHEMA_1200
     * @tc.name testShortcutRecycleSchema0012
     * @tc.desc 第二版超预算原文受保护且字节预算正确识别中文和表情
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleSchema', '0012'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleSchema', '0012'), async (scope: CaseScope): Promise<void> => {
        const raw: string = JSON.stringify(recycleInput(1));
        const io: RecycleBusinessStorage = new RecycleBusinessStorage();
        io.value = raw.substring(0, raw.length - 1) + ',"padding":"' + 'x'.repeat(MAX_WORKSPACE_BYTES) + '"}';
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(store.snapshot().ready, caseName('ShortcutRecycleSchema', '0012')).assertFalse();
        expect(io.value, caseName('ShortcutRecycleSchema', '0012')).assertEqual(original);
        expect(io.writes, caseName('ShortcutRecycleSchema', '0012')).assertEqual(0);
        expect(workspaceUtf8Bytes('ASCII中😀'), caseName('ShortcutRecycleSchema', '0012')).assertEqual(12);
        expect(workspaceUtf8Bytes(JSON.stringify('\uD800')), caseName('ShortcutRecycleSchema', '0012')).assertEqual(8);
        expect(workspaceUtf8Bytes('é'), caseName('ShortcutRecycleSchema', '0012')).assertEqual(2);
      });
    });
  });
}
