import { relationalStore } from '@kit.ArkData';
import { describe, expect, it } from '@ohos/hypium';
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const empty: StartupArchiveRepository = await f.repository();
        expect(empty.snapshot().stage).assertEqual(ArchiveStage.READY);
        expect(empty.snapshot().automatic).assertFalse();
        expect((await f.image()).count).assertEqual(0);
        const writer: StartupArchiveRepository = await f.repository();
        const saved: ArchiveAction = await writer.save([archiveNativeQaRecord(1, f.time)]);
        expect(saved.success).assertTrue();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().rows[0].record.id).assertEqual(1);
        expect(reopened.snapshot().revision).assertEqual(1);
        const image: ArchiveNativeSqlImage = await f.image();
        expect(image.count).assertEqual(1);
        expect(image.version).assertEqual(ARCHIVE_SCHEMA);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const first: QueryRecord = archiveNativeQaRecord(1, f.time - 20);
        const second: QueryRecord = archiveNativeQaRecord(1, f.time - 10, QueryOutcome.TIMEOUT);
        second.errorCode = 'timeout-qa';
        const action: ArchiveAction = await repository.save([first, second]);
        expect(action.added).assertEqual(2);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.view().rows.map((row: ArchivedQuery): number => row.archiveId).join(',')).assertEqual('2,1');
        expect(reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('1,1');
        expect(reopened.view().rows[0].record.errorCode).assertEqual('timeout-qa');
        expect(reopened.view().rows[1].record.timestamp).assertEqual(first.timestamp);
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
        expect((await repository.save(selected)).added).assertEqual(1);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('10');
        expect(JSON.stringify(live)).assertEqual(before);
        expect(reopened.view().summary.includes('失败 1')).assertTrue();
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        repository.capture(archiveNativeQaRecord(1, f.time));
        await repository.whenIdle();
        expect(repository.snapshot().rows.length).assertEqual(0);
        expect(repository.snapshot().revision).assertEqual(0);
        await repository.setAutomatic(true);
        await repository.setAutomatic(false);
        const revision: number = repository.snapshot().revision;
        const reopened: StartupArchiveRepository = await f.reopen();
        reopened.capture(archiveNativeQaRecord(2, f.time + 1));
        await reopened.whenIdle();
        expect(reopened.snapshot().automatic).assertFalse();
        expect(reopened.snapshot().revision).assertEqual(revision);
        expect(reopened.snapshot().pending).assertEqual(0);
        expect(reopened.snapshot().rows.length).assertEqual(0);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const seed: QueryRecord = archiveNativeQaRecord(1, f.time - 5, QueryOutcome.FAILURE);
        seed.errorMessage = 'qa-private-platform-detail';
        const sameEvidence: QueryRecord = seed.clone();
        sameEvidence.errorMessage = 'different-private-qa-detail';
        const enabled: ArchiveAction = await repository.setAutomatic(true, [seed, sameEvidence]);
        expect(enabled.added).assertEqual(1);
        repository.capture(archiveNativeQaRecord(2, f.time));
        await repository.whenIdle();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().automatic).assertTrue();
        expect(reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('1,2');
        expect(reopened.snapshot().rows[0].record.errorMessage).assertEqual('');
        const image: ArchiveNativeSqlImage = await f.image();
        expect(image.payload.includes('qa-private-platform-detail')).assertFalse();
        expect(image.operation.length > 0).assertTrue();
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const record: QueryRecord = archiveNativeQaRecord(6, f.time);
        const repository: StartupArchiveRepository = await f.repository();
        await repository.setAutomatic(true, [record]);
        const revision: number = repository.snapshot().revision;
        const reopened: StartupArchiveRepository = await f.reopen();
        const duplicate: ArchiveAction = await reopened.save([record.clone()]);
        expect(duplicate.code).assertEqual(ArchiveActionCode.UNCHANGED);
        expect(duplicate.duplicates).assertEqual(1);
        reopened.capture(record.clone());
        await reopened.whenIdle();
        expect(reopened.snapshot().revision).assertEqual(revision);
        expect(reopened.snapshot().rows[0].archiveId).assertEqual(1);
        expect(reopened.snapshot().pending).assertEqual(0);
        const image: ArchiveNativeSqlImage = await f.image();
        expect(image.revision).assertEqual(revision);
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
        expect(view.rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('1');
        expect(view.total).assertEqual(4);
        expect(view.dayLines[0]).assertEqual(`${query.day}：1 条`);
        expect(view.summary.includes('失败 1')).assertTrue();
        expect(reopened.snapshot().rows.length).assertEqual(4);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const failure: QueryRecord = archiveNativeQaRecord(42, f.time, QueryOutcome.FAILURE);
        failure.errorCode = '16000050';
        failure.errorMessage = 'private-qa-explanation';
        await repository.save([failure, archiveNativeQaRecord(43, f.time + 1)]);
        const reopened: StartupArchiveRepository = await f.reopen();
        const byCode: ArchiveQuery = new ArchiveQuery();
        byCode.needle = '16000050';
        expect(reopened.view(byCode).rows[0].record.id).assertEqual(42);
        const byId: ArchiveQuery = new ArchiveQuery();
        byId.needle = '#2';
        expect(reopened.view(byId).rows[0].record.id).assertEqual(43);
        const text: string = reopened.exportText(byCode);
        expect(text.includes('#1 |') && !text.includes('16000050')).assertTrue();
        expect(text.includes('private-qa-explanation')).assertFalse();
        expect(reopened.snapshot().revision).assertEqual(1);
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
        expect(first.rows[0].record.id).assertEqual(ARCHIVE_PAGE_SIZE + 2);
        expect(last.rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('2,1');
        expect(last.page).assertEqual(1);
        expect(last.pageCount).assertEqual(2);
        expect(first.rows.some((row: ArchivedQuery): boolean => row.archiveId === last.rows[0].archiveId))
          .assertFalse();
        expect((await f.image()).revision).assertEqual(1);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.setAutomatic(true, [archiveNativeQaRecord(1, f.time)]);
        const oldRevision: number = repository.snapshot().revision;
        await repository.save([archiveNativeQaRecord(2, f.time + 1)]);
        const stale: ArchiveAction = await repository.clear(oldRevision);
        expect(stale.code).assertEqual(ArchiveActionCode.STALE);
        expect(repository.snapshot().rows.length).assertEqual(2);
        expect((await repository.clear(repository.snapshot().revision)).removed).assertEqual(2);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().automatic).assertTrue();
        expect(reopened.snapshot().rows.length).assertEqual(0);
        await reopened.save([archiveNativeQaRecord(3, f.time + 2)]);
        const final: StartupArchiveRepository = await f.reopen();
        expect(final.snapshot().rows[0].archiveId).assertEqual(3);
        expect(final.snapshot().rows[0].record.id).assertEqual(3);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const policy: RetentionPolicy = defaultRetentionPolicy();
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([
          archiveNativeQaRecord(1, f.time - (policy.maxDays + 3) * DAY_MS, QueryOutcome.TIMEOUT),
          archiveNativeQaRecord(2, f.time - (policy.maxDays + policy.failureBonusDays) * DAY_MS, QueryOutcome.FAILURE),
          archiveNativeQaRecord(3, f.time, QueryOutcome.SUCCESS)]);
        const revision: number = repository.snapshot().revision;
        const plan: ArchiveCleanup = repository.previewCleanup();
        expect(plan.preview.deletedIds().join(',')).assertEqual('1');
        expect(repository.snapshot().revision).assertEqual(revision);
        expect((await repository.applyCleanup(plan)).removed).assertEqual(1);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('2,3');
        expect(reopened.previewCleanup().preview.deleteCount).assertEqual(0);
        expect((await f.image()).revision).assertEqual(revision + 1);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        const days: number = defaultRetentionPolicy().maxDays + 10;
        await repository.save([archiveNativeQaRecord(1, f.time - days * DAY_MS, QueryOutcome.TIMEOUT),
          archiveNativeQaRecord(2, f.time)]);
        const stalePlan: ArchiveCleanup = repository.previewCleanup();
        await repository.save([archiveNativeQaRecord(3, f.time + 1)]);
        const action: ArchiveAction = await repository.applyCleanup(stalePlan);
        expect(action.success).assertFalse();
        expect(action.code).assertEqual(ArchiveActionCode.STALE);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('1,2,3');
        expect(reopened.snapshot().revision).assertEqual(2);
        const newPlan: ArchiveCleanup = reopened.previewCleanup();
        expect((await reopened.applyCleanup(newPlan)).removed).assertEqual(1);
        const confirmed: StartupArchiveRepository = await f.reopen();
        expect(confirmed.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('2,3');
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
        expect(overflow.code).assertEqual(ArchiveActionCode.CAPACITY);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().rows.length).assertEqual(ARCHIVE_MAX_ENTRIES - 1);
        expect(reopened.snapshot().revision).assertEqual(1);
        const single: ArchiveAction = await reopened.save([
          archiveNativeQaRecord(ARCHIVE_MAX_ENTRIES + 2, f.time + ARCHIVE_MAX_ENTRIES + 2)]);
        expect(single.added).assertEqual(1);
        const full: StartupArchiveRepository = await f.reopen();
        expect(full.view().rows[0].archiveId).assertEqual(ARCHIVE_MAX_ENTRIES);
        expect(full.view().rows[0].record.id).assertEqual(ARCHIVE_MAX_ENTRIES + 2);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([archiveNativeQaRecord(1, f.time)]);
        const good: ArchiveNativeSqlImage = await f.image();
        await f.seedRaw(good.payload, good.revision + 1, 'qa-mismatched-operation');
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        })).assertEqual('INVALID');
        const candidate: ArchiveDocument = new ArchiveDocument();
        candidate.revision = good.revision + 2;
        candidate.operationId = 'must-not-overwrite-mismatch';
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(good.revision + 1, candidate);
        })).assertEqual('INVALID');
        const after: ArchiveNativeSqlImage = await f.image();
        expect(after.payload).assertEqual(good.payload);
        expect(after.operation).assertEqual('qa-mismatched-operation');
        expect(after.revision).assertEqual(good.revision + 1);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const document: ArchiveDocument = new ArchiveDocument();
        document.schema = ARCHIVE_SCHEMA + 1;
        document.revision = 4;
        document.operationId = 'future-schema-qa';
        const payload: string = JSON.stringify(document);
        await f.seedRaw(payload, document.revision, document.operationId);
        const repository: StartupArchiveRepository = await f.repository();
        expect(repository.snapshot().stage).assertEqual(ArchiveStage.BLOCKED);
        expect((await repository.save([archiveNativeQaRecord(1, f.time)])).success).assertFalse();
        expect(await repository.reload()).assertFalse();
        expect(repository.snapshot().canWrite).assertFalse();
        const after: ArchiveNativeSqlImage = await f.image();
        expect(after.payload).assertEqual(payload);
        expect(after.revision).assertEqual(4);
        expect(after.operation).assertEqual('future-schema-qa');
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([archiveNativeQaRecord(1, f.time)]);
        const before: ArchiveNativeSqlImage = await f.image();
        await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
          store.version = ARCHIVE_SCHEMA + 7;
        });
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await f.openStorage();
        })).assertEqual('SCHEMA');
        const after: ArchiveNativeSqlImage = await f.image();
        expect(after.version).assertEqual(ARCHIVE_SCHEMA + 7);
        expect(after.payload).assertEqual(before.payload);
        expect(after.operation).assertEqual(before.operation);
        expect(after.revision).assertEqual(before.revision);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const broken: string = '{"schema":1,"revision":';
        await f.seedRaw(broken, 8, 'broken-json-qa');
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        })).assertEqual('INVALID');
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        })).assertEqual('INVALID');
        const beforeRepair: ArchiveNativeSqlImage = await f.image();
        expect(beforeRepair.payload).assertEqual(broken);
        const restored: ArchiveDocument = new ArchiveDocument();
        restored.revision = 8;
        restored.operationId = 'explicit-qa-repair';
        await f.seedRaw(encodeArchive(restored), restored.revision, restored.operationId);
        const reopened: StartupArchiveRepository = await f.repository();
        expect(reopened.snapshot().stage).assertEqual(ArchiveStage.READY);
        expect((await reopened.save([archiveNativeQaRecord(1, f.time)])).revision).assertEqual(9);
        expect((await f.image()).count).assertEqual(1);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.save([archiveNativeQaRecord(1, f.time)]);
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const base: ArchiveDocument = await storage.load();
        const candidate: ArchiveDocument = base.clone();
        candidate.revision++;
        candidate.operationId = 'qa-rejected-private-write';
        candidate.rows[0].record.errorMessage = 'qa-secret-must-not-reach-sql';
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(base.revision, candidate);
        })).assertEqual('PRIVACY');
        expect((await storage.load()).revision).assertEqual(base.revision);
        const image: ArchiveNativeSqlImage = await f.image();
        expect(image.payload.includes('qa-secret-must-not-reach-sql')).assertFalse();
        expect(image.operation).assertEqual(base.operationId);
        expect(image.revision).assertEqual(base.revision);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const candidate: ArchiveDocument = new ArchiveDocument();
        candidate.revision = 2;
        candidate.operationId = 'qa-revision-gap';
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(0, candidate);
        })).assertEqual('REVISION');
        expect((await storage.load()).revision).assertEqual(0);
        candidate.revision = 1;
        candidate.operationId = 'qa-valid-next-revision';
        candidate.automatic = true;
        await storage.commit(0, candidate);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().automatic).assertTrue();
        expect(reopened.snapshot().revision).assertEqual(1);
        expect((await f.image()).operation).assertEqual('qa-valid-next-revision');
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
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await right.commit(0, stale);
        })).assertEqual('CONFLICT');
        const refreshed: ArchiveDocument = await right.load();
        expect(refreshed.operationId).assertEqual('qa-first-writer');
        expect(refreshed.automatic).assertTrue();
        refreshed.revision++;
        refreshed.operationId = 'qa-refreshed-writer';
        refreshed.rows.push(new ArchivedQuery(1, archiveNativeQaRecord(77, f.time), f.time));
        refreshed.nextId = 2;
        await right.commit(1, refreshed);
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().revision).assertEqual(2);
        expect(reopened.snapshot().rows[0].record.id).assertEqual(77);
        expect(reopened.snapshot().automatic).assertTrue();
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
        expect(await a).assertEqual('');
        expect(await b).assertEqual('CONFLICT');
        const loaded: ArchiveDocument = await storage.load();
        expect(loaded.operationId).assertEqual('qa-queued-first');
        expect(loaded.automatic).assertTrue();
        const image: ArchiveNativeSqlImage = await f.image();
        expect(image.revision).assertEqual(1);
        expect(image.count).assertEqual(1);
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
        expect(loaded.operationId).assertEqual('qa-call-time-operation');
        expect(loaded.rows[0].record.id).assertEqual(91);
        expect(loaded.rows[0].record.errorCode).assertEqual('');
        expect(loaded.automatic).assertFalse();
        const image: ArchiveNativeSqlImage = await f.image();
        expect(image.payload.includes('must-not-be-written')).assertFalse();
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const storage: StartupArchiveRdbStorage = await f.openStorage();
        const candidate: ArchiveDocument = new ArchiveDocument();
        candidate.revision = 1;
        candidate.operationId = 'qa-accepted-before-close';
        candidate.automatic = true;
        const pending: Promise<void> = storage.commit(0, candidate);
        const closing: Promise<void> = storage.close();
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        })).assertEqual('CLOSED');
        await pending;
        await closing;
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.commit(0, candidate);
        })).assertEqual('CLOSED');
        await storage.close();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().revision).assertEqual(1);
        expect(reopened.snapshot().automatic).assertTrue();
        expect((await f.image()).operation).assertEqual('qa-accepted-before-close');
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
        expect(failed.success).assertFalse();
        expect(failed.code).assertEqual(ArchiveActionCode.FAILED);
        expect(writer.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('1');
        const after: ArchiveNativeSqlImage = await f.image();
        expect(after.payload).assertEqual(before.payload);
        expect(after.operation).assertEqual(before.operation);
        expect(after.revision).assertEqual(before.revision);
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
        expect(auditCounts[0]).assertEqual(0);
        const retry: StartupArchiveRepository = await f.repository();
        expect((await retry.save([archiveNativeQaRecord(2, f.time + 1)])).success).assertTrue();
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('1,2');
        expect(reopened.snapshot().revision).assertEqual(before.revision + 1);
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
      await withArchiveNativeQa(async (left: ArchiveNativeQaFixture): Promise<void> => {
        const a: StartupArchiveRepository = await left.repository();
        await a.save([archiveNativeQaRecord(101, left.time)]);
        await withArchiveNativeQa(async (right: ArchiveNativeQaFixture): Promise<void> => {
          const b: StartupArchiveRepository = await right.repository();
          expect(b.snapshot().rows.length).assertEqual(0);
          await b.save([archiveNativeQaRecord(202, right.time)]);
          await b.clear(b.snapshot().revision);
          const reopenedA: StartupArchiveRepository = await left.reopen();
          expect(reopenedA.snapshot().rows[0].record.id).assertEqual(101);
          expect((await right.image()).count).assertEqual(1);
        });
        const survivor: StartupArchiveRepository = await left.reopen();
        expect(survivor.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('101');
        expect(survivor.snapshot().revision).assertEqual(1);
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
      await withArchiveNativeQa(async (f: ArchiveNativeQaFixture): Promise<void> => {
        const repository: StartupArchiveRepository = await f.repository();
        await repository.setAutomatic(true);
        await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
          await store.executeSql(`CREATE TRIGGER qa_pending_fail BEFORE INSERT ON ${ARCHIVE_STATE_TABLE} ` +
            'BEGIN SELECT RAISE(ABORT, \'qa-pending-write-failure\'); END');
        });
        try {
          expect(await repository.attach(await f.openStorage())).assertTrue();
          const record: QueryRecord = archiveNativeQaRecord(9, f.time);
          repository.capture(record);
          await repository.whenIdle();
          expect(repository.snapshot().pending).assertEqual(1);
          expect(repository.snapshot().rows.length).assertEqual(0);
          expect(repository.snapshot().paused).assertTrue();
          await withArchiveNativeQa(async (other: ArchiveNativeQaFixture): Promise<void> => {
            const foreign: StartupArchiveRdbStorage = await other.openStorage();
            expect(await repository.attach(foreign)).assertFalse();
            expect((await foreign.load()).rows.length).assertEqual(0);
          });
          await repository.close();
          await f.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
            await store.executeSql('DROP TRIGGER qa_pending_fail');
          });
          expect(await repository.attach(await f.openStorage())).assertTrue();
          await repository.whenIdle();
          expect(repository.snapshot().pending).assertEqual(1);
          expect(repository.snapshot().rows.length).assertEqual(0);
          expect(repository.snapshot().paused).assertTrue();
          expect((await repository.retryPending()).success).assertTrue();
          expect(repository.snapshot().pending).assertEqual(0);
          const revision: number = repository.snapshot().revision;
          repository.capture(record.clone());
          await repository.whenIdle();
          expect(repository.snapshot().revision).assertEqual(revision);
        } finally {
          await repository.close();
        }
        const reopened: StartupArchiveRepository = await f.reopen();
        expect(reopened.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('9');
        expect(reopened.snapshot().automatic).assertTrue();
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
        expect(await archiveNativeFailure(async (): Promise<void> => {
          await storage.load();
        })).assertEqual('CAPACITY');
        const image: ArchiveNativeSqlImage = await f.image();
        expect(image.payload).assertEqual(oversized);
        expect(image.revision).assertEqual(2);
        await f.seedRaw(canonical, document.revision, document.operationId);
        const repository: StartupArchiveRepository = await f.repository();
        expect(repository.snapshot().stage).assertEqual(ArchiveStage.READY);
        expect(repository.snapshot().rows[0].record.id).assertEqual(7);
        expect(repository.snapshot().revision).assertEqual(2);
      });
    });
  });
}
