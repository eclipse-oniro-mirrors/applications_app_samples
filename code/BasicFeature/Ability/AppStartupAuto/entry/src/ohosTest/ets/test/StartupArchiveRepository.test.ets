import { afterEach, describe, expect, it } from '@ohos/hypium';
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
      const f = await create(); const row = archiveSample(22, f.clock.now()); row.errorMessage = 'private error';
      const result = await f.repository.save([row]);
      expect(result.added).assertEqual(1);
      expect(f.store.data.value.rows[0].record.id).assertEqual(22);
      expect(f.repository.snapshot().rows[0].record.errorMessage).assertEqual('');
      expect(row.errorMessage).assertEqual('private error');
      expect(f.store.data.value.revision).assertEqual(result.revision);
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
      const f = await create(); const row = archiveSample(1, f.clock.now());
      await f.repository.save([row]); const revision = f.repository.snapshot().revision;
      const repeated = await f.repository.save([row.clone(), row.clone()]);
      expect(repeated.duplicates).assertEqual(2);
      expect(repeated.code).assertEqual(ArchiveActionCode.UNCHANGED);
      expect(f.store.writes).assertEqual(1);
      expect(f.repository.snapshot().revision).assertEqual(revision);
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
      const f = await create(); const invalid = archiveSample(2, f.clock.now());
      invalid.source = 'invalid' as RefreshSource;
      const result = await f.repository.save([archiveSample(1, f.clock.now()), invalid]);
      expect(result.code).assertEqual(ArchiveActionCode.INVALID);
      expect(f.store.writes).assertEqual(0);
      expect(f.repository.view().total).assertEqual(0);
      expect(f.store.data.value.nextId).assertEqual(1);
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
      const f = await create(); await f.repository.save([archiveSample(9, f.clock.now())]);
      const next = archiveSample(9, f.clock.now() + 1, QueryOutcome.SUCCESS, '未开启'); next.statusResult = 'false';
      await f.repository.save([next]); const rows = f.repository.view().rows;
      expect(rows.map((row): number => row.archiveId).join(',')).assertEqual('2,1');
      expect(rows.map((row): number => row.record.id).join(',')).assertEqual('9,9');
      expect(rows[0].record.result).assertEqual('未开启');
      expect(rows[1].record.result).assertEqual('已开启');
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
      const f = await create(); await f.repository.save([archiveSample(3, f.clock.now())]);
      const snapshot = f.repository.snapshot(); snapshot.rows[0].record.result = 'mutated'; snapshot.rows = [];
      const view = f.repository.view(); view.rows[0].archiveId = 900;
      expect(f.repository.snapshot().rows[0].record.result).assertEqual('已开启');
      expect(f.repository.view().rows[0].archiveId).assertEqual(1);
      expect(f.store.data.value.rows[0].record.id).assertEqual(3);
      expect(f.store.writes).assertEqual(1);
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
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now()),
        archiveSample(2, f.clock.now() + 1, QueryOutcome.FAILURE, '查询失败', RefreshSource.SETTINGS)]);
      const query = new ArchiveQuery(); query.source = RefreshSource.MANUAL; query.outcome = QueryOutcome.FAILURE;
      expect(f.repository.view(query).matchedTotal).assertEqual(0);
      expect(f.repository.view(query).dayLines.join(',')).assertEqual('');
      expect(archiveFailureCode((): void => {
        f.repository.exportText(query);
      })).assertEqual('EMPTY');
      expect(f.repository.snapshot().rows[1].record.source).assertEqual(RefreshSource.SETTINGS);
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
      const f = await create(); const first = archiveSample(88, f.clock.now()); first.errorCode = '801';
      const second = archiveSample(1, f.clock.now() + 1); second.errorCode = '16000050';
      await f.repository.save([first, second]); const query = new ArchiveQuery(); query.needle = '801';
      expect(f.repository.view(query).rows[0].record.id).assertEqual(88);
      query.needle = '#2'; expect(f.repository.view(query).rows[0].record.errorCode).assertEqual('16000050');
      query.needle = '#88'; expect(f.repository.view(query).matchedTotal).assertEqual(0);
      query.needle = '160'; expect(f.repository.view(query).matchedTotal).assertEqual(0);
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
      const f = await create(); const midnight = new Date(2026, 10, 7, 0, 0, 0).getTime();
      f.clock.advance(midnight + 3600000 - f.clock.now());
      await f.repository.save([
        archiveSample(1, midnight - 1), archiveSample(2, midnight), archiveSample(3, midnight + 1)]);
      const query = new ArchiveQuery(); query.day = dayKeyOf(midnight, localOffsetMinutes(f.clock.now()));
      const view = f.repository.view(query);
      expect(view.rows.map((row): number => row.record.id).join(',')).assertEqual('3,2');
      expect(view.dayLines.join(',')).assertEqual(`${query.day}：2 条`);
      expect(f.repository.exportText(query).indexOf('#1 |')).assertEqual(-1);
      expect(f.repository.snapshot().rows[0].record.timestamp).assertEqual(midnight - 1);
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
      const f = await create(); const records: QueryRecord[] = [];
      for (let index = 1; index <= 51; index++) {
        records.push(archiveSample(index, f.clock.now() - index));
      }
      await f.repository.save(records); const query = new ArchiveQuery(); query.page = 1;
      const view = f.repository.view(query);
      expect(view.rows[0].archiveId).assertEqual(51);
      expect(view.matchedTotal).assertEqual(51);
      expect(view.pageCount).assertEqual(2);
      expect(f.repository.exportText(query).indexOf('#51 |') >= 0).assertTrue();
      expect(view.dayLines[0].endsWith('：51 条')).assertTrue();
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
      const f = await create(); const records: QueryRecord[] = [];
      for (let index = 1; index <= ARCHIVE_MAX_ENTRIES; index++) {
        records.push(archiveSample(index, f.clock.now() - index));
      }
      const initial = await f.repository.save(records);
      const rejected = await f.repository.save([archiveSample(999, f.clock.now())]);
      expect(initial.added).assertEqual(ARCHIVE_MAX_ENTRIES);
      expect(rejected.code).assertEqual(ArchiveActionCode.CAPACITY);
      expect(f.store.writes).assertEqual(1);
      expect(f.store.data.value.rows[ARCHIVE_MAX_ENTRIES - 1].record.id).assertEqual(ARCHIVE_MAX_ENTRIES);
      expect(f.repository.snapshot().revision).assertEqual(initial.revision);
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
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      f.store.failBefore = true; const result = await f.repository.save([archiveSample(2, f.clock.now() + 1)]);
      expect(result.code).assertEqual(ArchiveActionCode.FAILED);
      expect(f.repository.snapshot().rows.map((row): number => row.record.id).join(',')).assertEqual('1');
      expect(f.store.data.value.revision).assertEqual(1);
      expect(f.repository.snapshot().stage).assertEqual(ArchiveStage.READY);
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
      const f = await create(); f.store.failAfter = true;
      const result = await f.repository.save([archiveSample(7, f.clock.now())]);
      expect(result.success).assertTrue();
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(7);
      expect(f.store.writes).assertEqual(1);
      expect(f.store.reads).assertEqual(2);
      expect(f.repository.snapshot().stage).assertEqual(ArchiveStage.READY);
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
      const f = await create(); const row = archiveSample(1, f.clock.now());
      f.store.failAfter = true; f.store.failConfirmation = true;
      const result = await f.repository.save([row]);
      expect(result.code).assertEqual(ArchiveActionCode.BLOCKED);
      expect(f.repository.snapshot().rows.length).assertEqual(0);
      expect(f.store.data.value.rows[0].record.id).assertEqual(1);
      expect((await f.repository.save([archiveSample(2, f.clock.now() + 1)])).code)
        .assertEqual(ArchiveActionCode.BLOCKED);
      f.store.failRead = false; f.store.failAfter = false;
      await f.repository.reload(); const repeated = await f.repository.save([row]);
      expect(repeated.duplicates).assertEqual(1);
      expect(f.store.writes).assertEqual(1);
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
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      const external = f.store.data.value.clone(); external.revision++; external.operationId = 'external-change';
      external.rows[0].record.result = '未开启'; f.store.data.value = external;
      const result = await f.repository.save([archiveSample(2, f.clock.now() + 1)]);
      expect(result.code).assertEqual(ArchiveActionCode.BLOCKED);
      expect(f.store.data.value.operationId).assertEqual('external-change');
      expect(f.repository.snapshot().rows[0].record.result).assertEqual('已开启');
      await f.repository.reload();
      expect(f.repository.snapshot().rows[0].record.result).assertEqual('未开启');
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
      const f = await create(); await f.repository.save([archiveSample(6, f.clock.now())]);
      f.store.data.value.schema = 99;
      expect(await f.repository.reload()).assertFalse();
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(6);
      expect((await f.repository.clear(1)).code).assertEqual(ArchiveActionCode.BLOCKED);
      expect(f.store.data.value.schema).assertEqual(99);
      expect(f.store.writes).assertEqual(1);
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
      const f = await create(); const age = (defaultRetentionPolicy().maxDays + 3) * DAY_MS;
      await f.repository.save([archiveSample(1, f.clock.now()),
        archiveSample(2, f.clock.now() - age, QueryOutcome.TIMEOUT, '等待超时')]);
      const plan = f.repository.previewCleanup(); await f.repository.save([archiveSample(3, f.clock.now() + 1)]);
      const result = await f.repository.applyCleanup(plan);
      expect(result.code).assertEqual(ArchiveActionCode.STALE);
      expect(f.store.writes).assertEqual(2);
      expect(f.repository.view().rows.map((row): number => row.record.id).join(',')).assertEqual('3,1,2');
      expect(f.store.data.value.rows[1].record.outcome).assertEqual(QueryOutcome.TIMEOUT);
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
      const f = await create(); const age = (defaultRetentionPolicy().maxDays + 3) * DAY_MS;
      await f.repository.save([archiveSample(1, f.clock.now()),
        archiveSample(2, f.clock.now() - age, QueryOutcome.FAILURE, '查询失败'),
        archiveSample(3, f.clock.now() - age - 1, QueryOutcome.TIMEOUT, '等待超时')]);
      const plan = f.repository.previewCleanup();
      expect(plan.preview.deleteCount).assertEqual(2);
      expect(f.store.writes).assertEqual(1);
      const result = await f.repository.applyCleanup(plan);
      expect(result.removed).assertEqual(2);
      expect(f.repository.snapshot().rows.map((row): number => row.record.id).join(',')).assertEqual('1');
      expect(f.store.data.value.revision).assertEqual(2);
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
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      expect((await f.repository.clear(0)).code).assertEqual(ArchiveActionCode.STALE);
      expect(f.store.writes).assertEqual(1);
      expect((await f.repository.clear(1)).removed).assertEqual(1);
      await f.repository.save([archiveSample(99, f.clock.now() + 1)]);
      expect(f.repository.view().rows[0].archiveId).assertEqual(2);
      expect(f.repository.view().rows[0].record.id).assertEqual(99);
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
      const f = await create(); const clipboard = new ArchiveClipboardCapture();
      expect((await f.repository.copy(new ArchiveQuery(), clipboard)).code).assertEqual(ArchiveActionCode.INVALID);
      expect(clipboard.texts.length).assertEqual(0);
      await f.repository.save([archiveSample(1, f.clock.now())]); clipboard.fail = true;
      expect((await f.repository.copy(new ArchiveQuery(), clipboard)).success).assertFalse();
      expect(f.repository.snapshot().notice).assertEqual('复制失败，请重试');
      expect(f.store.writes).assertEqual(1);
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
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      const old = new ArchiveClipboardCapture(); old.hold = true;
      const first = f.repository.copy(new ArchiveQuery(), old); await flushMicrotasks();
      const fresh = new ArchiveClipboardCapture(); fresh.fail = true;
      await f.repository.copy(new ArchiveQuery(), fresh); old.releases[0](); await first;
      expect(f.repository.snapshot().notice).assertEqual('复制失败，请重试');
      expect(old.texts[0].indexOf('不证明实际开机拉起') >= 0).assertTrue();
      expect(fresh.texts[0].indexOf('记录数：1') >= 0).assertTrue();
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(1);
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
      const first = await create(); const selected = await create();
      await selected.repository.save([archiveSample(50, selected.clock.now())]);
      first.store.holdWrites = true; const write = first.repository.save([archiveSample(1, first.clock.now())]);
      await flushMicrotasks(); const attach = first.repository.attach(selected.store);
      first.store.release(); const obsolete = await write; await attach;
      expect(obsolete.code).assertEqual(ArchiveActionCode.STALE);
      expect(first.repository.snapshot().rows[0].record.id).assertEqual(50);
      expect(first.repository.snapshot().notice.indexOf('已读取 1 条') === 0).assertTrue();
      expect(first.store.data.value.rows[0].record.id).assertEqual(1);
      expect(selected.store.writes).assertEqual(1);
    });
  });
}
