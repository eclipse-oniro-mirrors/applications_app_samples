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

import { relationalStore } from '@kit.ArkData';
import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { filterHistoryAdvanced } from '../../../main/ets/autostart/AutoStartupHistory';
import { DAY_MS, dayKeyOf, localOffsetMinutes } from '../../../main/ets/autostart/archive/ArchiveIndex';
import { defaultRetentionPolicy, RetentionPolicy } from '../../../main/ets/autostart/archive/RetentionPolicy';
import { ARCHIVE_MAX_BYTES, ARCHIVE_MAX_ENTRIES, ARCHIVE_PAGE_SIZE, ARCHIVE_SCHEMA, ArchiveAction, ArchiveActionCode,
  ArchiveCleanup, ArchiveDocument, ArchiveQuery, ArchivedQuery, ArchiveStage, ArchiveView,
  StartupArchiveRepository, encodeArchive } from '../../../main/ets/autostart/archive/StartupArchive';
import { ARCHIVE_STATE_TABLE,
  StartupArchiveRdbStorage } from '../../../main/ets/autostart/archive/StartupArchiveRdbStorage';
import { ArchiveNativeQaFixture, ArchiveNativeSqlImage, archiveNativeFailure,
  archiveNativeQaRecord, withArchiveNativeQa } from '../support/ArchiveNativeQaSupport';

// NativeOnly. No context/Driver/native API is evaluated while this module is imported.
export default function archiveNativeQaTests(): void {
  configureTestText();
  describe('ArchiveNativeQa', (): void => {
    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0100
     * @tc.name testArchiveNativeQa0001
     * @tc.desc 新私有库只读空态不写单例文档而首次真实保存后可重新打开
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0001', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const empty: StartupArchiveRepository = await f.repository();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0001|assertEqual|actual', empty.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0001|assertEqual|expected', ArchiveStage.READY));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0002|assertFalse|actual|expected=false', empty.snapshot().automatic)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0003|assertEqual|actual', (await f.image()).count)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0003|assertEqual|expected', 0));
        const writer: StartupArchiveRepository = await f.repository();
        const saved: ArchiveAction = await writer.save([archiveNativeQaRecord(1, f.time)]);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0004|assertTrue|actual|expected=true', saved.success)).assertTrue();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0005|assertEqual|actual', reopened.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0005|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0006|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0006|assertEqual|expected', 1));
        const image: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0007|assertEqual|actual', image.count)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0007|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0008|assertEqual|actual', image.version)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0001|ArchiveNativeQa.test.ets|assert0008|assertEqual|expected', ARCHIVE_SCHEMA));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0200
     * @tc.name testArchiveNativeQa0002
     * @tc.desc 原查询编号碰撞的不同证据保存为不同归档编号且重开仍有两个完整记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0002', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const first: QueryRecord = archiveNativeQaRecord(1, f.time - 20);
        const second: QueryRecord = archiveNativeQaRecord(1, f.time - 10, QueryOutcome.TIMEOUT);
        second.errorCode = 'timeout-qa';
        const action: ArchiveAction = await repository.save([first, second]);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0009|assertEqual|actual', action.added)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0009|assertEqual|expected', 2));
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0010|assertEqual|actual', reopened.view().rows.map((row: ArchivedQuery): number => row.archiveId).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0010|assertEqual|expected', '2,1'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0011|assertEqual|actual', reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0011|assertEqual|expected', '1,1'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0012|assertEqual|actual', reopened.view().rows[0].record.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0012|assertEqual|expected', 'timeout-qa'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0013|assertEqual|actual', reopened.view().rows[1].record.timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0002|ArchiveNativeQa.test.ets|assert0013|assertEqual|expected', first.timestamp));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0300
     * @tc.name testArchiveNativeQa0003
     * @tc.desc 按真实历史来源和结果选中的当前范围只保存命中项不改live输入
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0003', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const live: QueryRecord[] = [
          archiveNativeQaRecord(10, f.time - 30, QueryOutcome.FAILURE, RefreshSource.MANUAL),
          archiveNativeQaRecord(11, f.time - 20, QueryOutcome.SUCCESS, RefreshSource.MANUAL),
          archiveNativeQaRecord(12, f.time - 10, QueryOutcome.FAILURE, RefreshSource.FOREGROUND)
        ];
        const before: string = JSON.stringify(live);
        const selected: QueryRecord[] = filterHistoryAdvanced(live, RefreshSource.MANUAL,
          QueryOutcome.FAILURE, 0, 0);
        const repository: StartupArchiveRepository = await f.repository();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0003|ArchiveNativeQa.test.ets|assert0014|assertEqual|actual', (await repository.save(selected)).added)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0003|ArchiveNativeQa.test.ets|assert0014|assertEqual|expected', 1));
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0003|ArchiveNativeQa.test.ets|assert0015|assertEqual|actual', reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0003|ArchiveNativeQa.test.ets|assert0015|assertEqual|expected', '10'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0003|ArchiveNativeQa.test.ets|assert0016|assertEqual|actual', JSON.stringify(live))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0003|ArchiveNativeQa.test.ets|assert0016|assertEqual|expected', before));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0003|ArchiveNativeQa.test.ets|assert0017|assertTrue|actual|expected=true', reopened.view().summary.includes('失败 1'))).assertTrue();
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0400
     * @tc.name testArchiveNativeQa0004
     * @tc.desc 默认未授权及持久化停用后capture均不新增归档或推进revision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0004', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        repository.capture(archiveNativeQaRecord(1, f.time));
        await repository.whenIdle();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0018|assertEqual|actual', repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0018|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0019|assertEqual|actual', repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0019|assertEqual|expected', 0));
        await repository.setAutomatic(true);
        await repository.setAutomatic(false);
        const revision: number = repository.snapshot().revision;
        const reopened: StartupArchiveRepository = await f.reopen();
        reopened.capture(archiveNativeQaRecord(2, f.time + 1));
        await reopened.whenIdle();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0020|assertFalse|actual|expected=false', reopened.snapshot().automatic)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0021|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0021|assertEqual|expected', revision));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0022|assertEqual|actual', reopened.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0022|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0023|assertEqual|actual', reopened.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0004|ArchiveNativeQa.test.ets|assert0023|assertEqual|expected', 0));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0500
     * @tc.name testArchiveNativeQa0005
     * @tc.desc 明确启用后种子去重和后续自动采集真正提交并持久化脱敏设置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0005', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const seed: QueryRecord = archiveNativeQaRecord(1, f.time - 5, QueryOutcome.FAILURE);
        seed.errorMessage = 'qa-private-platform-detail';
        const sameEvidence: QueryRecord = seed.clone();
        sameEvidence.errorMessage = 'different-private-qa-detail';
        const enabled: ArchiveAction = await repository.setAutomatic(true, [seed, sameEvidence]);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0024|assertEqual|actual', enabled.added)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0024|assertEqual|expected', 1));
        repository.capture(archiveNativeQaRecord(2, f.time));
        await repository.whenIdle();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0025|assertTrue|actual|expected=true', reopened.snapshot().automatic)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0026|assertEqual|actual', reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0026|assertEqual|expected', '1,2'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0027|assertEqual|actual', reopened.snapshot().rows[0].record.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0027|assertEqual|expected', ''));
        const image: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0028|assertFalse|actual|expected=false', image.payload.includes('qa-private-platform-detail'))).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0005|ArchiveNativeQa.test.ets|assert0029|assertTrue|actual|expected=true', image.operation.length > 0)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0600
     * @tc.name testArchiveNativeQa0006
     * @tc.desc 重开后重复手动保存与自动采集不再写同一证据或推进事务版本
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0006', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const record: QueryRecord = archiveNativeQaRecord(6, f.time);
        const repository: StartupArchiveRepository = await f.repository();
        await repository.setAutomatic(true, [record]);
        const revision: number = repository.snapshot().revision;
        const reopened: StartupArchiveRepository = await f.reopen();
        const duplicate: ArchiveAction = await reopened.save([record.clone()]);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0030|assertEqual|actual', duplicate.code)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0030|assertEqual|expected', ArchiveActionCode.UNCHANGED));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0031|assertEqual|actual', duplicate.duplicates)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0031|assertEqual|expected', 1));
        reopened.capture(record.clone());
        await reopened.whenIdle();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0032|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0032|assertEqual|expected', revision));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0033|assertEqual|actual', reopened.snapshot().rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0033|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0034|assertEqual|actual', reopened.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0034|assertEqual|expected', 0));
        const image: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0035|assertEqual|actual', image.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0006|ArchiveNativeQa.test.ets|assert0035|assertEqual|expected', revision));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0700
     * @tc.name testArchiveNativeQa0007
     * @tc.desc 真实库重开后来源结果与本地日期组合过滤不混入其它日期记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0007', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const target: QueryRecord = archiveNativeQaRecord(1, f.time, QueryOutcome.FAILURE, RefreshSource.SETTINGS);
        target.errorCode = 'qa-filter-code';
        await repository.save([target,
          archiveNativeQaRecord(2, f.time - DAY_MS, QueryOutcome.FAILURE, RefreshSource.SETTINGS),
          archiveNativeQaRecord(3, f.time, QueryOutcome.SUCCESS, RefreshSource.SETTINGS),
          archiveNativeQaRecord(4, f.time, QueryOutcome.FAILURE, RefreshSource.MANUAL)]);
        const reopened: StartupArchiveRepository = await f.reopen();
        const query: ArchiveQuery = new ArchiveQuery();
        query.day = dayKeyOf(f.time, localOffsetMinutes(f.time));
        query.source = RefreshSource.SETTINGS;
        query.outcome = QueryOutcome.FAILURE;
        const view: ArchiveView = reopened.view(query);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0036|assertEqual|actual', view.rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0036|assertEqual|expected', '1'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0037|assertEqual|actual', view.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0037|assertEqual|expected', 4));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0038|assertEqual|actual', view.dayLines[0])).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0038|assertEqual|expected', `${query.day}：1 条`));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0039|assertTrue|actual|expected=true', view.summary.includes('失败 1'))).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0040|assertEqual|actual', reopened.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0007|ArchiveNativeQa.test.ets|assert0040|assertEqual|expected', 4));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0800
     * @tc.name testArchiveNativeQa0008
     * @tc.desc 错误码和归档编号检索使用真实持久记录且纯文本导出不接触剪贴板
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0008', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const failure: QueryRecord = archiveNativeQaRecord(42, f.time, QueryOutcome.FAILURE);
        failure.errorCode = '16000050';
        failure.errorMessage = 'private-qa-explanation';
        await repository.save([failure, archiveNativeQaRecord(43, f.time + 1)]);
        const reopened: StartupArchiveRepository = await f.reopen();
        const byCode: ArchiveQuery = new ArchiveQuery();
        byCode.needle = '16000050';
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0041|assertEqual|actual', reopened.view(byCode).rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0041|assertEqual|expected', 42));
        const byId: ArchiveQuery = new ArchiveQuery();
        byId.needle = '#2';
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0042|assertEqual|actual', reopened.view(byId).rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0042|assertEqual|expected', 43));
        const text: string = reopened.exportText(byCode);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0043|assertTrue|actual|expected=true', text.includes('#1 |') && !text.includes('16000050'))).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0044|assertFalse|actual|expected=false', text.includes('private-qa-explanation'))).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0045|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0008|ArchiveNativeQa.test.ets|assert0045|assertEqual|expected', 1));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_0900
     * @tc.name testArchiveNativeQa0009
     * @tc.desc 跨页真实归档在重开后按时间稳定分页且末页越界夹取不重复首页
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0009', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const records: QueryRecord[] = [];
        for (let index: number = 0; index < ARCHIVE_PAGE_SIZE + 2; index++) {
          records.push(archiveNativeQaRecord(index + 1, f.time + index));
        }
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save(records);
        const reopened: StartupArchiveRepository = await f.reopen();
        const first: ArchiveView = reopened.view();
        const query: ArchiveQuery = new ArchiveQuery();
        query.page = 999;
        const last: ArchiveView = reopened.view(query);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0046|assertEqual|actual', first.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0046|assertEqual|expected', ARCHIVE_PAGE_SIZE + 2));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0047|assertEqual|actual', last.rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0047|assertEqual|expected', '2,1'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0048|assertEqual|actual', last.page)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0048|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0049|assertEqual|actual', last.pageCount)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0049|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0050|assertFalse|actual|expected=false', first.rows.some((row: ArchivedQuery): boolean => row.archiveId === last.rows[0].archiveId)))
          .assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0051|assertEqual|actual', (await f.image()).revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0009|ArchiveNativeQa.test.ets|assert0051|assertEqual|expected', 1));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1000
     * @tc.name testArchiveNativeQa0010
     * @tc.desc 清空要求最新确认版本且持久清空后不复用旧归档编号或关闭自动设置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0010', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.setAutomatic(true, [archiveNativeQaRecord(1, f.time)]);
        const oldRevision: number = repository.snapshot().revision;
        await repository.save([archiveNativeQaRecord(2, f.time + 1)]);
        const stale: ArchiveAction = await repository.clear(oldRevision);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0052|assertEqual|actual', stale.code)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0052|assertEqual|expected', ArchiveActionCode.STALE));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0053|assertEqual|actual', repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0053|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0054|assertEqual|actual', (await repository.clear(repository.snapshot().revision)).removed)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0054|assertEqual|expected', 2));
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0055|assertTrue|actual|expected=true', reopened.snapshot().automatic)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0056|assertEqual|actual', reopened.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0056|assertEqual|expected', 0));
        await reopened.save([archiveNativeQaRecord(3, f.time + 2)]);
        const final: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0057|assertEqual|actual', final.snapshot().rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0057|assertEqual|expected', 3));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0058|assertEqual|actual', final.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0010|ArchiveNativeQa.test.ets|assert0058|assertEqual|expected', 3));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1100
     * @tc.name testArchiveNativeQa0011
     * @tc.desc 清理预览不写库执行后只删除过期范围并持久保留失败宽限与最近有效项
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0011', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const policy: RetentionPolicy = defaultRetentionPolicy();
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([
          archiveNativeQaRecord(1, f.time - (policy.maxDays + 3) * DAY_MS, QueryOutcome.TIMEOUT),
          archiveNativeQaRecord(2, f.time - (policy.maxDays + policy.failureBonusDays) * DAY_MS, QueryOutcome.FAILURE),
          archiveNativeQaRecord(3, f.time, QueryOutcome.SUCCESS)]);
        const revision: number = repository.snapshot().revision;
        const plan: ArchiveCleanup = repository.previewCleanup();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0059|assertEqual|actual', plan.preview.deletedIds().join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0059|assertEqual|expected', '1'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0060|assertEqual|actual', repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0060|assertEqual|expected', revision));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0061|assertEqual|actual', (await repository.applyCleanup(plan)).removed)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0061|assertEqual|expected', 1));
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0062|assertEqual|actual', reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0062|assertEqual|expected', '2,3'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0063|assertEqual|actual', reopened.previewCleanup().preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0063|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0064|assertEqual|actual', (await f.image()).revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0011|ArchiveNativeQa.test.ets|assert0064|assertEqual|expected', revision + 1));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1200
     * @tc.name testArchiveNativeQa0012
     * @tc.desc 清理预览之后插入新记录会使旧计划失效且重开保留所有未确认项
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0012', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const days: number = defaultRetentionPolicy().maxDays + 10;
        await repository.save([archiveNativeQaRecord(1, f.time - days * DAY_MS, QueryOutcome.TIMEOUT),
          archiveNativeQaRecord(2, f.time)]);
        const stalePlan: ArchiveCleanup = repository.previewCleanup();
        await repository.save([archiveNativeQaRecord(3, f.time + 1)]);
        const action: ArchiveAction = await repository.applyCleanup(stalePlan);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0065|assertFalse|actual|expected=false', action.success)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0066|assertEqual|actual', action.code)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0066|assertEqual|expected', ArchiveActionCode.STALE));
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0067|assertEqual|actual', reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0067|assertEqual|expected', '1,2,3'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0068|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0068|assertEqual|expected', 2));
        const newPlan: ArchiveCleanup = reopened.previewCleanup();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0069|assertEqual|actual', (await reopened.applyCleanup(newPlan)).removed)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0069|assertEqual|expected', 1));
        const confirmed: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0070|assertEqual|actual', confirmed.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0012|ArchiveNativeQa.test.ets|assert0070|assertEqual|expected', '2,3'));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1300
     * @tc.name testArchiveNativeQa0013
     * @tc.desc 剩余单槽时两条批量保存整批拒绝不产生部分插入或消耗归档编号
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArchiveNativeQa0013', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const initial: QueryRecord[] = [];
        for (let index: number = 1; index < ARCHIVE_MAX_ENTRIES; index++) {
          initial.push(archiveNativeQaRecord(index, f.time + index));
        }
        await repository.save(initial);
        const overflow: ArchiveAction = await repository.save([
          archiveNativeQaRecord(ARCHIVE_MAX_ENTRIES, f.time + ARCHIVE_MAX_ENTRIES),
          archiveNativeQaRecord(ARCHIVE_MAX_ENTRIES + 1, f.time + ARCHIVE_MAX_ENTRIES + 1)]);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0071|assertEqual|actual', overflow.code)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0071|assertEqual|expected', ArchiveActionCode.CAPACITY));
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0072|assertEqual|actual', reopened.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0072|assertEqual|expected', ARCHIVE_MAX_ENTRIES - 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0073|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0073|assertEqual|expected', 1));
        const single: ArchiveAction = await reopened.save([
          archiveNativeQaRecord(ARCHIVE_MAX_ENTRIES + 2, f.time + ARCHIVE_MAX_ENTRIES + 2)]);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0074|assertEqual|actual', single.added)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0074|assertEqual|expected', 1));
        const full: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0075|assertEqual|actual', full.view().rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0075|assertEqual|expected', ARCHIVE_MAX_ENTRIES));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0076|assertEqual|actual', full.view().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0013|ArchiveNativeQa.test.ets|assert0076|assertEqual|expected', ARCHIVE_MAX_ENTRIES + 2));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1400
     * @tc.name testArchiveNativeQa0014
     * @tc.desc SQL元数据与合法payload不一致时读取和提交均拒绝且不重置原行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0014', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([archiveNativeQaRecord(1, f.time)]);
        const good: ArchiveNativeSqlImage = await f.image();
        await f.seedRaw(good.payload, good.revision + 1, 'qa-mismatched-operation');
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0077|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0077|assertEqual|expected', 'INVALID'));
        const candidate: ArchiveDocument = new ArchiveDocument();
        candidate.revision = good.revision + 2;
        candidate.operationId = 'must-not-overwrite-mismatch';
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0078|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(good.revision + 1, candidate);
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0078|assertEqual|expected', 'INVALID'));
        const after: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0079|assertEqual|actual', after.payload)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0079|assertEqual|expected', good.payload));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0080|assertEqual|actual', after.operation)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0080|assertEqual|expected', 'qa-mismatched-operation'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0081|assertEqual|actual', after.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0014|ArchiveNativeQa.test.ets|assert0081|assertEqual|expected', good.revision + 1));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1500
     * @tc.name testArchiveNativeQa0015
     * @tc.desc 未来文档schema使repository阻塞且读重试与保存均不覆盖原始内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0015', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const document: ArchiveDocument = new ArchiveDocument();
        document.schema = ARCHIVE_SCHEMA + 1;
        document.revision = 4;
        document.operationId = 'future-schema-qa';
        const payload: string = JSON.stringify(document);
        await f.seedRaw(payload, document.revision, document.operationId);
        const repository: StartupArchiveRepository = await f.repository();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0082|assertEqual|actual', repository.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0082|assertEqual|expected', ArchiveStage.BLOCKED));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0083|assertFalse|actual|expected=false', (await repository.save([archiveNativeQaRecord(1, f.time)])).success)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0084|assertFalse|actual|expected=false', await repository.reload())).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0085|assertFalse|actual|expected=false', repository.snapshot().canWrite)).assertFalse();
        const after: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0086|assertEqual|actual', after.payload)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0086|assertEqual|expected', payload));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0087|assertEqual|actual', after.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0087|assertEqual|expected', 4));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0088|assertEqual|actual', after.operation)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0015|ArchiveNativeQa.test.ets|assert0088|assertEqual|expected', 'future-schema-qa'));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1600
     * @tc.name testArchiveNativeQa0016
     * @tc.desc RDB自身未来user版本拒绝open且专用库内既有行与版本完全保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0016', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([archiveNativeQaRecord(1, f.time)]);
        const before: ArchiveNativeSqlImage = await f.image();
        await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
          store.version = ARCHIVE_SCHEMA + 7;
        });
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0089|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await f.openStorage();
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0089|assertEqual|expected', 'SCHEMA'));
        const after: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0090|assertEqual|actual', after.version)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0090|assertEqual|expected', ARCHIVE_SCHEMA + 7));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0091|assertEqual|actual', after.payload)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0091|assertEqual|expected', before.payload));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0092|assertEqual|actual', after.operation)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0092|assertEqual|expected', before.operation));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0093|assertEqual|actual', after.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0016|ArchiveNativeQa.test.ets|assert0093|assertEqual|expected', before.revision));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1700
     * @tc.name testArchiveNativeQa0017
     * @tc.desc 损坏JSON反复读取均拒绝且finally释放游标后仍能显式修复专用库
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0017', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const broken: string = '{"schema":1,"revision":';
        await f.seedRaw(broken, 8, 'broken-json-qa');
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0094|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0094|assertEqual|expected', 'INVALID'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0095|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0095|assertEqual|expected', 'INVALID'));
        const beforeRepair: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0096|assertEqual|actual', beforeRepair.payload)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0096|assertEqual|expected', broken));
        const restored: ArchiveDocument = new ArchiveDocument();
        restored.revision = 8;
        restored.operationId = 'explicit-qa-repair';
        await f.seedRaw(encodeArchive(restored), restored.revision, restored.operationId);
        const reopened: StartupArchiveRepository = await f.repository();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0097|assertEqual|actual', reopened.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0097|assertEqual|expected', ArchiveStage.READY));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0098|assertEqual|actual', (await reopened.save([archiveNativeQaRecord(1, f.time)])).revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0098|assertEqual|expected', 9));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0099|assertEqual|actual', (await f.image()).count)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0017|ArchiveNativeQa.test.ets|assert0099|assertEqual|expected', 1));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1800
     * @tc.name testArchiveNativeQa0018
     * @tc.desc 直接提交含原始错误说明被正式隐私校验拒绝且旧SQL文档不受影响
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0018', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([archiveNativeQaRecord(1, f.time)]);
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const base: ArchiveDocument = await storage.load();
        const candidate: ArchiveDocument = base.clone();
        candidate.revision++;
        candidate.operationId = 'qa-rejected-private-write';
        candidate.rows[0].record.errorMessage = 'qa-secret-must-not-reach-sql';
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0100|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(base.revision, candidate);
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0100|assertEqual|expected', 'PRIVACY'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0101|assertEqual|actual', (await storage.load()).revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0101|assertEqual|expected', base.revision));
        const image: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0102|assertFalse|actual|expected=false', image.payload.includes('qa-secret-must-not-reach-sql'))).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0103|assertEqual|actual', image.operation)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0103|assertEqual|expected', base.operationId));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0104|assertEqual|actual', image.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0018|ArchiveNativeQa.test.ets|assert0104|assertEqual|expected', base.revision));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_1900
     * @tc.name testArchiveNativeQa0019
     * @tc.desc 非相邻revision提交被拒绝后同一真实adapter仍可接受合法下一版本
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0019', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const candidate: ArchiveDocument = new ArchiveDocument();
        candidate.revision = 2;
        candidate.operationId = 'qa-revision-gap';
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0105|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(0, candidate);
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0105|assertEqual|expected', 'REVISION'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0106|assertEqual|actual', (await storage.load()).revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0106|assertEqual|expected', 0));
        candidate.revision = 1;
        candidate.operationId = 'qa-valid-next-revision';
        candidate.automatic = true;
        await storage.commit(0, candidate);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0107|assertTrue|actual|expected=true', reopened.snapshot().automatic)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0108|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0108|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0109|assertEqual|actual', (await f.image()).operation)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0019|ArchiveNativeQa.test.ets|assert0109|assertEqual|expected', 'qa-valid-next-revision'));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2000
     * @tc.name testArchiveNativeQa0020
     * @tc.desc 两真实存储句柄的旧revision写入冲突不覆盖先提交者刷新后才能提交
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0020', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const left: StartupArchiveRdbStorage = await f.openStorage();
        const right: StartupArchiveRdbStorage = await f.openStorage();
        const first: ArchiveDocument = await left.load();
        const stale: ArchiveDocument = await right.load();
        first.revision = 1;
        first.operationId = 'qa-first-writer';
        first.automatic = true;
        await left.commit(0, first);
        stale.revision = 1;
        stale.operationId = 'qa-stale-writer';
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0110|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await right.commit(0, stale);
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0110|assertEqual|expected', 'CONFLICT'));
        const refreshed: ArchiveDocument = await right.load();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0111|assertEqual|actual', refreshed.operationId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0111|assertEqual|expected', 'qa-first-writer'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0112|assertTrue|actual|expected=true', refreshed.automatic)).assertTrue();
        refreshed.revision++;
        refreshed.operationId = 'qa-refreshed-writer';
        refreshed.rows.push(new ArchivedQuery(1, archiveNativeQaRecord(77, f.time), f.time));
        refreshed.nextId = 2;
        await right.commit(1, refreshed);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0113|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0113|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0114|assertEqual|actual', reopened.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0114|assertEqual|expected', 77));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0020|ArchiveNativeQa.test.ets|assert0115|assertTrue|actual|expected=true', reopened.snapshot().automatic)).assertTrue();
      });
    });
    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2100
     * @tc.name testArchiveNativeQa0021
     * @tc.desc 同一真实adapter排队的同基线提交只接受首个且失败后读取仍可继续
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0021', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const first: ArchiveDocument = new ArchiveDocument();
        first.revision = 1;
        first.operationId = 'qa-queued-first';
        first.automatic = true;
        const second: ArchiveDocument = new ArchiveDocument();
        second.revision = 1;
        second.operationId = 'qa-queued-second';
        const a: Promise<string> = archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(0, first);
        });
        const b: Promise<string> = archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(0, second);
        });
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0116|assertEqual|actual', await a)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0116|assertEqual|expected', ''));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0117|assertEqual|actual', await b)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0117|assertEqual|expected', 'CONFLICT'));
        const loaded: ArchiveDocument = await storage.load();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0118|assertEqual|actual', loaded.operationId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0118|assertEqual|expected', 'qa-queued-first'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0119|assertTrue|actual|expected=true', loaded.automatic)).assertTrue();
        const image: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0120|assertEqual|actual', image.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0120|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0121|assertEqual|actual', image.count)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0021|ArchiveNativeQa.test.ets|assert0121|assertEqual|expected', 1));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2200
     * @tc.name testArchiveNativeQa0022
     * @tc.desc 提交调用时复制候选防止调用者在SQL等待期间修改持久化内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0022', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const candidate: ArchiveDocument = new ArchiveDocument();
        candidate.revision = 1;
        candidate.operationId = 'qa-call-time-operation';
        candidate.nextId = 2;
        candidate.rows.push(new ArchivedQuery(1, archiveNativeQaRecord(91, f.time), f.time));
        const committing: Promise<void> = storage.commit(0, candidate);
        candidate.operationId = 'qa-mutation-after-enqueue';
        candidate.automatic = true;
        candidate.rows[0].record.errorCode = 'must-not-be-written';
        candidate.rows = [];
        await committing;
        const loaded: ArchiveDocument = await storage.load();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0122|assertEqual|actual', loaded.operationId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0122|assertEqual|expected', 'qa-call-time-operation'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0123|assertEqual|actual', loaded.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0123|assertEqual|expected', 91));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0124|assertEqual|actual', loaded.rows[0].record.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0124|assertEqual|expected', ''));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0125|assertFalse|actual|expected=false', loaded.automatic)).assertFalse();
        const image: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0022|ArchiveNativeQa.test.ets|assert0126|assertFalse|actual|expected=false', image.payload.includes('must-not-be-written'))).assertFalse();
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2300
     * @tc.name testArchiveNativeQa0023
     * @tc.desc close等待已受理写入结算并拒绝新请求重开仍能恢复该次提交
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0023', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const candidate: ArchiveDocument = new ArchiveDocument();
        candidate.revision = 1;
        candidate.operationId = 'qa-accepted-before-close';
        candidate.automatic = true;
        const pending: Promise<void> = storage.commit(0, candidate);
        const closing: Promise<void> = storage.close();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0127|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0127|assertEqual|expected', 'CLOSED'));
        await pending;
        await closing;
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0128|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(0, candidate);
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0128|assertEqual|expected', 'CLOSED'));
        await storage.close();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0129|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0129|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0130|assertTrue|actual|expected=true', reopened.snapshot().automatic)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0131|assertEqual|actual', (await f.image()).operation)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0023|ArchiveNativeQa.test.ets|assert0131|assertEqual|expected', 'qa-accepted-before-close'));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2400
     * @tc.name testArchiveNativeQa0024
     * @tc.desc 原生触发器FAIL后外层事务回滚所有先前副作用移除故障后可重新提交
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArchiveNativeQa0024', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const initial: StartupArchiveRepository = await f.repository();
        await initial.save([archiveNativeQaRecord(1, f.time)]);
        const before: ArchiveNativeSqlImage = await f.image();
        await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
          await store.executeSql('CREATE TABLE qa_archive_transaction_audit (marker TEXT NOT NULL)');
          // FAIL intentionally does not undo prior trigger changes; the production transaction must.
          await store.executeSql(`CREATE TRIGGER qa_archive_fail BEFORE INSERT ON ${ARCHIVE_STATE_TABLE} ` +
            'BEGIN INSERT INTO qa_archive_transaction_audit(marker) VALUES (\'must-roll-back\'); ' +
            'SELECT RAISE(FAIL, \'qa-intentional-transaction-failure\'); END');
        });
        const writer: StartupArchiveRepository = await f.repository();
        const failed: ArchiveAction = await writer.save([archiveNativeQaRecord(2, f.time + 1)]);
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0132|assertFalse|actual|expected=false', failed.success)).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0133|assertEqual|actual', failed.code)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0133|assertEqual|expected', ArchiveActionCode.FAILED));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0134|assertEqual|actual', writer.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0134|assertEqual|expected', '1'));
        const after: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0135|assertEqual|actual', after.payload)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0135|assertEqual|expected', before.payload));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0136|assertEqual|actual', after.operation)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0136|assertEqual|expected', before.operation));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0137|assertEqual|actual', after.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0137|assertEqual|expected', before.revision));
        const auditCounts: number[] = [];
        await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
          const rows: relationalStore.ResultSet = await store.querySql(
            'SELECT COUNT(*) AS total FROM qa_archive_transaction_audit');
          try {
            if (!rows.goToFirstRow()) {
              throw new Error('Missing QA audit count');
            }
            auditCounts.push(rows.getLong(rows.getColumnIndex('total')));
          } finally {
            rows.close();
          }
          await store.executeSql('DROP TRIGGER qa_archive_fail');
        });
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0138|assertEqual|actual', auditCounts[0])).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0138|assertEqual|expected', 0));
        const retry: StartupArchiveRepository = await f.repository();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0139|assertTrue|actual|expected=true', (await retry.save([archiveNativeQaRecord(2, f.time + 1)])).success)).assertTrue();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0140|assertEqual|actual', reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0140|assertEqual|expected', '1,2'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0141|assertEqual|actual', reopened.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0024|ArchiveNativeQa.test.ets|assert0141|assertEqual|expected', before.revision + 1));
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2500
     * @tc.name testArchiveNativeQa0025
     * @tc.desc 不同专用RDB的归档清空与删除完全隔离不影响另一库证据
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArchiveNativeQa0025', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (left: ArchiveNativeQaFixture): Promise<void> => {
        const a: StartupArchiveRepository = await left.repository();
        await a.save([archiveNativeQaRecord(101, left.time)]);
        await withArchiveNativeQa(async (right: ArchiveNativeQaFixture): Promise<void> => {
          const b: StartupArchiveRepository = await right.repository();
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0142|assertEqual|actual', b.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0142|assertEqual|expected', 0));
          await b.save([archiveNativeQaRecord(202, right.time)]);
          await b.clear(b.snapshot().revision);
          const reopenedA: StartupArchiveRepository = await left.reopen();
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0143|assertEqual|actual', reopenedA.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0143|assertEqual|expected', 101));
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0144|assertEqual|actual', (await right.image()).count)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0144|assertEqual|expected', 1));
        });
        const survivor: StartupArchiveRepository = await left.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0145|assertEqual|actual', survivor.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0145|assertEqual|expected', '101'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0146|assertEqual|actual', survivor.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0025|ArchiveNativeQa.test.ets|assert0146|assertEqual|expected', 1));
      });
    });
    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2600
     * @tc.name testArchiveNativeQa0026
     * @tc.desc 原生提交失败的pending不迁入异库同库关闭重开后必须明确重试才落盘
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArchiveNativeQa0026', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.setAutomatic(true);
        await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
          await store.executeSql(`CREATE TRIGGER qa_pending_fail BEFORE INSERT ON ${ARCHIVE_STATE_TABLE} ` +
            'BEGIN SELECT RAISE(ABORT, \'qa-pending-write-failure\'); END');
        });
        try {
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0147|assertTrue|actual|expected=true', await repository.attach(await f.openStorage()))).assertTrue();
          const record: QueryRecord = archiveNativeQaRecord(9, f.time);
          repository.capture(record);
          await repository.whenIdle();
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0148|assertEqual|actual', repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0148|assertEqual|expected', 1));
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0149|assertEqual|actual', repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0149|assertEqual|expected', 0));
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0150|assertTrue|actual|expected=true', repository.snapshot().paused)).assertTrue();
          await withArchiveNativeQa(async (other: ArchiveNativeQaFixture): Promise<void> => {
            const foreign: StartupArchiveRdbStorage = await other.openStorage();
            expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0151|assertFalse|actual|expected=false', await repository.attach(foreign))).assertFalse();
            expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0152|assertEqual|actual', (await foreign.load()).rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0152|assertEqual|expected', 0));
          });
          await repository.close();
          await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
            await store.executeSql('DROP TRIGGER qa_pending_fail');
          });
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0153|assertTrue|actual|expected=true', await repository.attach(await f.openStorage()))).assertTrue();
          await repository.whenIdle();
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0154|assertEqual|actual', repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0154|assertEqual|expected', 1));
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0155|assertEqual|actual', repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0155|assertEqual|expected', 0));
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0156|assertTrue|actual|expected=true', repository.snapshot().paused)).assertTrue();
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0157|assertTrue|actual|expected=true', (await repository.retryPending()).success)).assertTrue();
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0158|assertEqual|actual', repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0158|assertEqual|expected', 0));
          const revision: number = repository.snapshot().revision;
          repository.capture(record.clone());
          await repository.whenIdle();
          expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0159|assertEqual|actual', repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0159|assertEqual|expected', revision));
        } finally {
          await repository.close();
        }
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0160|assertEqual|actual', reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0160|assertEqual|expected', '9'));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0026|ArchiveNativeQa.test.ets|assert0161|assertTrue|actual|expected=true', reopened.snapshot().automatic)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVE_NATIVE_QA_2700
     * @tc.name testArchiveNativeQa0027
     * @tc.desc 超字节预算但JSON合法的真实SQL文档拒绝读取不截断可显式恢复合规原文
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArchiveNativeQa0027', 0, async (): Promise<void> => {
      configureTestText();
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const document: ArchiveDocument = new ArchiveDocument();
        document.revision = 2;
        document.operationId = 'qa-oversized-valid-json';
        document.nextId = 2;
        document.rows.push(new ArchivedQuery(1, archiveNativeQaRecord(7, f.time), f.time));
        const canonical: string = encodeArchive(document);
        const oversized: string = canonical + ' '.repeat(ARCHIVE_MAX_BYTES);
        await f.seedRaw(oversized, document.revision, document.operationId);
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0162|assertEqual|actual', await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        }))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0162|assertEqual|expected', 'CAPACITY'));
        const image: ArchiveNativeSqlImage = await f.image();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0163|assertEqual|actual', image.payload)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0163|assertEqual|expected', oversized));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0164|assertEqual|actual', image.revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0164|assertEqual|expected', 2));
        await f.seedRaw(canonical, document.revision, document.operationId);
        const repository: StartupArchiveRepository = await f.repository();
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0165|assertEqual|actual', repository.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0165|assertEqual|expected', ArchiveStage.READY));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0166|assertEqual|actual', repository.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0166|assertEqual|expected', 7));
        expect(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0167|assertEqual|actual', repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveNativeQa_0027|ArchiveNativeQa.test.ets|assert0167|assertEqual|expected', 2));
      });
    });
  });
}
