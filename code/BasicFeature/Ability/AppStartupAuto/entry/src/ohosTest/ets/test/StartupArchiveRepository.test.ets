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

import { afterEach, describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  ArchiveActionCode, ArchiveClipboardPort, ArchiveQuery, ArchiveStage, ARCHIVE_MAX_ENTRIES
} from '../../../main/ets/autostart/archive/StartupArchive';
import { DAY_MS, dayKeyOf, localOffsetMinutes } from '../../../main/ets/autostart/archive/ArchiveIndex';
import { defaultRetentionPolicy } from '../../../main/ets/autostart/archive/RetentionPolicy';
import { QueryOutcome, RefreshSource, QueryRecord } from '../../../main/ets/autostart/AutoStartupTypes';
import { StartupArchiveFixture, archiveFailureCode, archiveSample } from '../support/StartupArchiveSupport';
import { flushMicrotasks } from '../support/TestSupport';

class ArchiveClipboardCapture implements ArchiveClipboardPort {
  public texts: string[] = [];
  public fail: boolean = false;
  public hold: boolean = false;
  public releases: (() => void)[] = [];
  async writeText(text: string): Promise<void> {
    this.texts.push(text);
    if (this.hold) {
      await new Promise<void>((resolve): void => {
        this.releases.push(resolve);
      });
    }
    if (this.fail) {
      throw new Error('controlled clipboard failure');
    }
  }
}

export default function startupArchiveRepositoryTests(): void {
  configureTestText();
  describe('StartupArchiveRepository', (): void => {
    const fixtures: StartupArchiveFixture[] = [];
    const create = async (): Promise<StartupArchiveFixture> => {
      const fixture = new StartupArchiveFixture(); fixtures.push(fixture); await fixture.open(); return fixture;
    };
    afterEach(async (): Promise<void> => {
      fixtures.forEach((fixture: StartupArchiveFixture): void => {
        fixture.store.release();
      });
      for (const fixture of fixtures) {
        await fixture.dispose();
      }
      fixtures.splice(0, fixtures.length);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0100
     * @tc.name testStartupArchiveRepositoryWaveThree0001
     * @tc.desc 手工保存只提交最小查询证据且不改live来源记录
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0001', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const row = archiveSample(22, f.clock.now()); row.errorMessage = 'private error';
      const result = await f.repository.save([row]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0001|assertEqual|actual', result.added)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0001|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0002|assertEqual|actual', f.store.data.value.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0002|assertEqual|expected', 22));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0003|assertEqual|actual', f.repository.snapshot().rows[0].record.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0003|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0004|assertEqual|actual', row.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0004|assertEqual|expected', 'private error'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0005|assertEqual|actual', f.store.data.value.revision)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0001|StartupArchiveRepository.test.ets|assert0005|assertEqual|expected', result.revision));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0200
     * @tc.name testStartupArchiveRepositoryWaveThree0002
     * @tc.desc 重复点击保存返回重复数但不会重复写库或推进版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0002', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const row = archiveSample(1, f.clock.now());
      await f.repository.save([row]); const revision = f.repository.snapshot().revision;
      const repeated = await f.repository.save([row.clone(), row.clone()]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0006|assertEqual|actual', repeated.duplicates)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0006|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0007|assertEqual|actual', repeated.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0007|assertEqual|expected', ArchiveActionCode.UNCHANGED));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0008|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0008|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0009|assertEqual|actual', f.repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0002|StartupArchiveRepository.test.ets|assert0009|assertEqual|expected', revision));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0300
     * @tc.name testStartupArchiveRepositoryWaveThree0003
     * @tc.desc 批次中有一条非法记录时不能先保存合法前缀
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0003', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const invalid = archiveSample(2, f.clock.now());
      invalid.source = 'invalid' as RefreshSource;
      const result = await f.repository.save([archiveSample(1, f.clock.now()), invalid]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0010|assertEqual|actual', result.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0010|assertEqual|expected', ArchiveActionCode.INVALID));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0011|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0011|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0012|assertEqual|actual', f.repository.view().total)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0012|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0013|assertEqual|actual', f.store.data.value.nextId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0003|StartupArchiveRepository.test.ets|assert0013|assertEqual|expected', 1));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0400
     * @tc.name testStartupArchiveRepositoryWaveThree0004
     * @tc.desc 原query编号复用但时间结果不同的两份证据不能互相覆盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0004', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(9, f.clock.now())]);
      const next = archiveSample(9, f.clock.now() + 1, QueryOutcome.SUCCESS, '未开启'); next.statusResult = 'false';
      await f.repository.save([next]); const rows = f.repository.view().rows;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0014|assertEqual|actual', rows.map((row): number => row.archiveId).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0014|assertEqual|expected', '2,1'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0015|assertEqual|actual', rows.map((row): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0015|assertEqual|expected', '9,9'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0016|assertEqual|actual', rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0016|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0017|assertEqual|actual', rows[1].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0004|StartupArchiveRepository.test.ets|assert0017|assertEqual|expected', '已开启'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0500
     * @tc.name testStartupArchiveRepositoryWaveThree0005
     * @tc.desc 外部修改快照与分页行不能污染已提交记录或持久化内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0005', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(3, f.clock.now())]);
      const snapshot = f.repository.snapshot(); snapshot.rows[0].record.result = 'mutated'; snapshot.rows = [];
      const view = f.repository.view(); view.rows[0].archiveId = 900;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0018|assertEqual|actual', f.repository.snapshot().rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0018|assertEqual|expected', '已开启'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0019|assertEqual|actual', f.repository.view().rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0019|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0020|assertEqual|actual', f.store.data.value.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0020|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0021|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0005|StartupArchiveRepository.test.ets|assert0021|assertEqual|expected', 1));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0600
     * @tc.name testStartupArchiveRepositoryWaveThree0006
     * @tc.desc 来源和结果筛选必须命中同一记录而非同日两个桶计数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0006', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now()),
        archiveSample(2, f.clock.now() + 1, QueryOutcome.FAILURE, '查询失败', RefreshSource.SETTINGS)]);
      const query = new ArchiveQuery(); query.source = RefreshSource.MANUAL; query.outcome = QueryOutcome.FAILURE;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0022|assertEqual|actual', f.repository.view(query).matchedTotal)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0022|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0023|assertEqual|actual', f.repository.view(query).dayLines.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0023|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0024|assertEqual|actual', archiveFailureCode((): void => {
        f.repository.exportText(query);
      }))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0024|assertEqual|expected', 'EMPTY'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0025|assertEqual|actual', f.repository.snapshot().rows[1].record.source)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0006|StartupArchiveRepository.test.ets|assert0025|assertEqual|expected', RefreshSource.SETTINGS));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0700
     * @tc.name testStartupArchiveRepositoryWaveThree0007
     * @tc.desc 错误码精确检索和归档编号检索不混淆原query编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0007', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const first = archiveSample(88, f.clock.now()); first.errorCode = '801';
      const second = archiveSample(1, f.clock.now() + 1); second.errorCode = '16000050';
      await f.repository.save([first, second]); const query = new ArchiveQuery(); query.needle = '801';
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0026|assertEqual|actual', f.repository.view(query).rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0026|assertEqual|expected', 88));
      query.needle = '#2'; expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0027|assertEqual|actual', f.repository.view(query).rows[0].record.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0027|assertEqual|expected', '16000050'));
      query.needle = '#88'; expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0028|assertEqual|actual', f.repository.view(query).matchedTotal)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0028|assertEqual|expected', 0));
      query.needle = '160'; expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0029|assertEqual|actual', f.repository.view(query).matchedTotal)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0007|StartupArchiveRepository.test.ets|assert0029|assertEqual|expected', 0));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0800
     * @tc.name testStartupArchiveRepositoryWaveThree0008
     * @tc.desc 日期检索与按日分布使用相同日界口径且不包含相邻日
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0008', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const midnight = new Date(2026, 10, 7, 0, 0, 0).getTime();
      f.clock.advance(midnight + 3600000 - f.clock.now());
      await f.repository.save([
        archiveSample(1, midnight - 1), archiveSample(2, midnight), archiveSample(3, midnight + 1)]);
      const query = new ArchiveQuery(); query.day = dayKeyOf(midnight, localOffsetMinutes(f.clock.now()));
      const view = f.repository.view(query);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0030|assertEqual|actual', view.rows.map((row): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0030|assertEqual|expected', '3,2'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0031|assertEqual|actual', view.dayLines.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0031|assertEqual|expected', `${query.day}：2 条`));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0032|assertEqual|actual', f.repository.exportText(query).indexOf('#1 |'))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0032|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0033|assertEqual|actual', f.repository.snapshot().rows[0].record.timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0008|StartupArchiveRepository.test.ets|assert0033|assertEqual|expected', midnight - 1));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_0900
     * @tc.name testStartupArchiveRepositoryWaveThree0009
     * @tc.desc 同日超过二十条时分页与范围导出不误用索引样本截断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0009', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const records: QueryRecord[] = [];
      for (let index = 1; index <= 51; index++) {
        records.push(archiveSample(index, f.clock.now() - index));
      }
      await f.repository.save(records); const query = new ArchiveQuery(); query.page = 1;
      const view = f.repository.view(query);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0034|assertEqual|actual', view.rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0034|assertEqual|expected', 51));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0035|assertEqual|actual', view.matchedTotal)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0035|assertEqual|expected', 51));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0036|assertEqual|actual', view.pageCount)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0036|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0037|assertTrue|actual|expected=true', f.repository.exportText(query).indexOf('#51 |') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0009|StartupArchiveRepository.test.ets|assert0038|assertTrue|actual|expected=true', view.dayLines[0].endsWith('：51 条'))).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1000
     * @tc.name testStartupArchiveRepositoryWaveThree0010
     * @tc.desc 达到归档容量拒绝新证据且不挤掉已保存最旧样本
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0010', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const records: QueryRecord[] = [];
      for (let index = 1; index <= ARCHIVE_MAX_ENTRIES; index++) {
        records.push(archiveSample(index, f.clock.now() - index));
      }
      const initial = await f.repository.save(records);
      const rejected = await f.repository.save([archiveSample(999, f.clock.now())]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0039|assertEqual|actual', initial.added)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0039|assertEqual|expected', ARCHIVE_MAX_ENTRIES));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0040|assertEqual|actual', rejected.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0040|assertEqual|expected', ArchiveActionCode.CAPACITY));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0041|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0041|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0042|assertEqual|actual', f.store.data.value.rows[ARCHIVE_MAX_ENTRIES - 1].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0042|assertEqual|expected', ARCHIVE_MAX_ENTRIES));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0043|assertEqual|actual', f.repository.snapshot().revision)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0010|StartupArchiveRepository.test.ets|assert0043|assertEqual|expected', initial.revision));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1100
     * @tc.name testStartupArchiveRepositoryWaveThree0011
     * @tc.desc 提交前存储失败保留旧已提交集合并明确返回失败
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0011', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      f.store.failBefore = true; const result = await f.repository.save([archiveSample(2, f.clock.now() + 1)]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0044|assertEqual|actual', result.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0044|assertEqual|expected', ArchiveActionCode.FAILED));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0045|assertEqual|actual', f.repository.snapshot().rows.map((row): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0045|assertEqual|expected', '1'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0046|assertEqual|actual', f.store.data.value.revision)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0046|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0047|assertEqual|actual', f.repository.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0011|StartupArchiveRepository.test.ets|assert0047|assertEqual|expected', ArchiveStage.READY));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1200
     * @tc.name testStartupArchiveRepositoryWaveThree0012
     * @tc.desc 提交成功但响应丢失时重读完整候选确认成功而不重复写入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0012', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); f.store.failAfter = true;
      const result = await f.repository.save([archiveSample(7, f.clock.now())]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0048|assertTrue|actual|expected=true', result.success)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0049|assertEqual|actual', f.repository.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0049|assertEqual|expected', 7));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0050|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0050|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0051|assertEqual|actual', f.store.reads)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0051|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0052|assertEqual|actual', f.repository.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0012|StartupArchiveRepository.test.ets|assert0052|assertEqual|expected', ArchiveStage.READY));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1300
     * @tc.name testStartupArchiveRepositoryWaveThree0013
     * @tc.desc 提交结果无法确认时阻断后续写入并在重读后去重恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0013', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const row = archiveSample(1, f.clock.now());
      f.store.failAfter = true; f.store.failConfirmation = true;
      const result = await f.repository.save([row]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0053|assertEqual|actual', result.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0053|assertEqual|expected', ArchiveActionCode.BLOCKED));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0054|assertEqual|actual', f.repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0054|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0055|assertEqual|actual', f.store.data.value.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0055|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0056|assertEqual|actual', (await f.repository.save([archiveSample(2, f.clock.now() + 1)])).code))
        .assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0056|assertEqual|expected', ArchiveActionCode.BLOCKED));
      f.store.failRead = false; f.store.failAfter = false;
      await f.repository.reload(); const repeated = await f.repository.save([row]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0057|assertEqual|actual', repeated.duplicates)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0057|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0058|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0013|StartupArchiveRepository.test.ets|assert0058|assertEqual|expected', 1));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1400
     * @tc.name testStartupArchiveRepositoryWaveThree0014
     * @tc.desc 外部提交推进版本后本地旧快照不能覆盖且必须重读
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0014', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      const external = f.store.data.value.clone(); external.revision++; external.operationId = 'external-change';
      external.rows[0].record.result = '未开启'; f.store.data.value = external;
      const result = await f.repository.save([archiveSample(2, f.clock.now() + 1)]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0059|assertEqual|actual', result.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0059|assertEqual|expected', ArchiveActionCode.BLOCKED));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0060|assertEqual|actual', f.store.data.value.operationId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0060|assertEqual|expected', 'external-change'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0061|assertEqual|actual', f.repository.snapshot().rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0061|assertEqual|expected', '已开启'));
      await f.repository.reload();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0062|assertEqual|actual', f.repository.snapshot().rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0014|StartupArchiveRepository.test.ets|assert0062|assertEqual|expected', '未开启'));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1500
     * @tc.name testStartupArchiveRepositoryWaveThree0015
     * @tc.desc 重读未来版本不清空已显示证据也不允许写空库覆盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0015', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(6, f.clock.now())]);
      f.store.data.value.schema = 99;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0063|assertFalse|actual|expected=false', await f.repository.reload())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0064|assertEqual|actual', f.repository.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0064|assertEqual|expected', 6));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0065|assertEqual|actual', (await f.repository.clear(1)).code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0065|assertEqual|expected', ArchiveActionCode.BLOCKED));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0066|assertEqual|actual', f.store.data.value.schema)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0066|assertEqual|expected', 99));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0067|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0015|StartupArchiveRepository.test.ets|assert0067|assertEqual|expected', 1));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1600
     * @tc.name testStartupArchiveRepositoryWaveThree0016
     * @tc.desc 预览后新增证据使旧清理计划失效而不能顺手删新数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0016', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const age = (defaultRetentionPolicy().maxDays + 3) * DAY_MS;
      await f.repository.save([archiveSample(1, f.clock.now()),
        archiveSample(2, f.clock.now() - age, QueryOutcome.TIMEOUT, '等待超时')]);
      const plan = f.repository.previewCleanup(); await f.repository.save([archiveSample(3, f.clock.now() + 1)]);
      const result = await f.repository.applyCleanup(plan);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0068|assertEqual|actual', result.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0068|assertEqual|expected', ArchiveActionCode.STALE));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0069|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0069|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0070|assertEqual|actual', f.repository.view().rows.map((row): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0070|assertEqual|expected', '3,1,2'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0071|assertEqual|actual', f.store.data.value.rows[1].record.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0016|StartupArchiveRepository.test.ets|assert0071|assertEqual|expected', QueryOutcome.TIMEOUT));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1700
     * @tc.name testStartupArchiveRepositoryWaveThree0017
     * @tc.desc 确认实际清理事务后才移除过期样本并保留有效证据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0017', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const age = (defaultRetentionPolicy().maxDays + 3) * DAY_MS;
      await f.repository.save([archiveSample(1, f.clock.now()),
        archiveSample(2, f.clock.now() - age, QueryOutcome.FAILURE, '查询失败'),
        archiveSample(3, f.clock.now() - age - 1, QueryOutcome.TIMEOUT, '等待超时')]);
      const plan = f.repository.previewCleanup();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0072|assertEqual|actual', plan.preview.deleteCount)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0072|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0073|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0073|assertEqual|expected', 1));
      const result = await f.repository.applyCleanup(plan);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0074|assertEqual|actual', result.removed)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0074|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0075|assertEqual|actual', f.repository.snapshot().rows.map((row): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0075|assertEqual|expected', '1'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0076|assertEqual|actual', f.store.data.value.revision)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0017|StartupArchiveRepository.test.ets|assert0076|assertEqual|expected', 2));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1800
     * @tc.name testStartupArchiveRepositoryWaveThree0018
     * @tc.desc 清空需当前版本确认且清空后归档编号不能从一重新覆盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0018', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0077|assertEqual|actual', (await f.repository.clear(0)).code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0077|assertEqual|expected', ArchiveActionCode.STALE));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0078|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0078|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0079|assertEqual|actual', (await f.repository.clear(1)).removed)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0079|assertEqual|expected', 1));
      await f.repository.save([archiveSample(99, f.clock.now() + 1)]);
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0080|assertEqual|actual', f.repository.view().rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0080|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0081|assertEqual|actual', f.repository.view().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0018|StartupArchiveRepository.test.ets|assert0081|assertEqual|expected', 99));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_1900
     * @tc.name testStartupArchiveRepositoryWaveThree0019
     * @tc.desc 生成失败不调用剪贴板而平台拒绝不能报复制成功
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0019', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); const clipboard = new ArchiveClipboardCapture();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0082|assertEqual|actual', (await f.repository.copy(new ArchiveQuery(), clipboard)).code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0082|assertEqual|expected', ArchiveActionCode.INVALID));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0083|assertEqual|actual', clipboard.texts.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0083|assertEqual|expected', 0));
      await f.repository.save([archiveSample(1, f.clock.now())]); clipboard.fail = true;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0084|assertFalse|actual|expected=false', (await f.repository.copy(new ArchiveQuery(), clipboard)).success)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0085|assertEqual|actual', f.repository.snapshot().notice)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0085|assertEqual|expected', '复制失败，请重试'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0086|assertEqual|actual', f.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0019|StartupArchiveRepository.test.ets|assert0086|assertEqual|expected', 1));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_2000
     * @tc.name testStartupArchiveRepositoryWaveThree0020
     * @tc.desc 旧复制回调晚到不覆盖新复制的失败反馈
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0020', 0, async (): Promise<void> => {
      configureTestText();
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      const old = new ArchiveClipboardCapture(); old.hold = true;
      const first = f.repository.copy(new ArchiveQuery(), old); await flushMicrotasks();
      const fresh = new ArchiveClipboardCapture(); fresh.fail = true;
      await f.repository.copy(new ArchiveQuery(), fresh); old.releases[0](); await first;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0020|StartupArchiveRepository.test.ets|assert0087|assertEqual|actual', f.repository.snapshot().notice)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0020|StartupArchiveRepository.test.ets|assert0087|assertEqual|expected', '复制失败，请重试'));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0020|StartupArchiveRepository.test.ets|assert0088|assertTrue|actual|expected=true', old.texts[0].indexOf('不证明实际开机拉起') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0020|StartupArchiveRepository.test.ets|assert0089|assertTrue|actual|expected=true', fresh.texts[0].indexOf('记录数：1') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0020|StartupArchiveRepository.test.ets|assert0090|assertEqual|actual', f.repository.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0020|StartupArchiveRepository.test.ets|assert0090|assertEqual|expected', 1));
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVEREPOSITORY_2100
     * @tc.name testStartupArchiveRepositoryWaveThree0021
     * @tc.desc 旧库慢提交结束不能污染重绑新库后的记录和提示
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveRepositoryWaveThree0021', 0, async (): Promise<void> => {
      configureTestText();
      const first = await create(); const selected = await create();
      await selected.repository.save([archiveSample(50, selected.clock.now())]);
      first.store.holdWrites = true; const write = first.repository.save([archiveSample(1, first.clock.now())]);
      await flushMicrotasks(); const attach = first.repository.attach(selected.store);
      first.store.release(); const obsolete = await write; await attach;
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0091|assertEqual|actual', obsolete.code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0091|assertEqual|expected', ArchiveActionCode.STALE));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0092|assertEqual|actual', first.repository.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0092|assertEqual|expected', 50));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0093|assertTrue|actual|expected=true', first.repository.snapshot().notice.indexOf('已读取 1 条') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0094|assertEqual|actual', first.store.data.value.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0094|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0095|assertEqual|actual', selected.store.writes)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveRepositoryWaveThree_0021|StartupArchiveRepository.test.ets|assert0095|assertEqual|expected', 1));
    });
  });
}
