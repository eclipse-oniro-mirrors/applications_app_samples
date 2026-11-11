import { afterEach, describe, expect, it } from '@ohos/hypium';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import { HistoryStorage, parseHistory, serializeHistory } from '../../../main/ets/autostart/AutoStartupHistory';
import { QueryOutcome, QueryPhase, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { ControlledAutoStartupApi, ManualQueryClock, flushMicrotasks } from '../support/TestSupport';

class RecoveryStore implements HistoryStorage {
  public value: string = '';
  public reads: number = 0;
  public writes: string[] = [];
  public failRead: boolean = false;
  public failWrite: boolean = false;
  public hold: boolean = false;
  private releaseWrite: (() => void) | undefined = undefined;
  read(): string {
    this.reads++;
    if (this.failRead) {
      throw new Error('read blocked');
    }
    return this.value;
  }
  async write(value: string): Promise<void> {
    this.writes.push(value);
    if (this.hold) {
      await new Promise<void>((resolve): void => {
        this.releaseWrite = resolve;
      });
    }
    if (this.failWrite) {
      throw new Error('write blocked');
    }
    this.value = value;
  }
  release(): void {
    this.hold = false;
    if (this.releaseWrite !== undefined) {
      this.releaseWrite();
      this.releaseWrite = undefined;
    }
  }
}
class RecoveryFixture {
  public api: ControlledAutoStartupApi = new ControlledAutoStartupApi();
  public clock: ManualQueryClock = new ManualQueryClock();
  public store: RecoveryStore = new RecoveryStore();
  public service: AutoStartupService;
  constructor(blocked: boolean = false) {
    this.store.failRead = blocked;
    this.service = new AutoStartupService(this.api, this.clock, this.store);
  }
  async sample(value: boolean): Promise<void> {
    this.service.refresh(RefreshSource.MANUAL);
    this.clock.advance(7);
    this.api.resolveNext(value);
    await flushMicrotasks();
  }
  rows(): QueryRecord[] {
    return parseHistory(this.store.value, this.clock.now()).records;
  }
}
function recoveryRow(id: number, timestamp: number): QueryRecord {
  const row = new QueryRecord();
  row.id = id; row.timestamp = timestamp; row.source = RefreshSource.INITIAL;
  row.result = '未开启'; row.supportResult = 'true'; row.statusResult = 'false';
  row.outcome = QueryOutcome.SUCCESS; row.durationMillis = 11;
  return row;
}

export default function startupRecoveryB2Test(): void {
  describe('StartupRecoveryB2', (): void => {
    const fixtures: RecoveryFixture[] = [];
    const create = (blocked: boolean = false): RecoveryFixture => {
      const f = new RecoveryFixture(blocked); fixtures.push(f); return f;
    };
    afterEach(async (): Promise<void> => {
      for (const f of fixtures) {
        f.store.release(); f.service.dispose(); f.api.finishPending(); f.clock.clearAll();
        await flushMicrotasks(); await f.service.whenSaved();
      }
      fixtures.splice(0, fixtures.length);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0100
     * @tc.name testStartupRecoveryBatchTwo0001
     * @tc.desc 读取失败期间清空与保存不会覆盖磁盘历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0001', 0, async (): Promise<void> => {
      const f = create(true); const raw = serializeHistory([recoveryRow(8, f.clock.now())], f.clock.now());
      f.store.value = raw; await f.sample(true); f.service.clearRecords(); f.service.retryPersistence();
      await f.service.whenSaved();
      expect(f.store.writes.length).assertEqual(0);
      expect(f.store.value).assertEqual(raw);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
      expect(f.service.records().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0200
     * @tc.name testStartupRecoveryBatchTwo0002
     * @tc.desc 重读合并保留内存结果并重排冲突编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0002', 0, async (): Promise<void> => {
      const f = create(true); await f.sample(true);
      f.store.value = serializeHistory([
        recoveryRow(1, f.clock.now() - 10), recoveryRow(9, f.clock.now() - 20)], f.clock.now());
      f.store.failRead = false; f.service.retryHistoryRead(); await f.service.whenSaved();
      expect(f.rows().map((row: QueryRecord): number => row.id).join(',')).assertEqual('1,10,9');
      expect(f.service.records()[0].result).assertEqual('已开启');
      expect(f.store.writes.length).assertEqual(1);
      await f.sample(false); expect(f.service.records()[0].id).assertEqual(11);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0300
     * @tc.name testStartupRecoveryBatchTwo0003
     * @tc.desc 原生查询未完成时重读不抢占待完成结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0003', 0, async (): Promise<void> => {
      const f = create(true); f.store.failRead = false;
      f.store.value = serializeHistory([recoveryRow(40, f.clock.now() - 5)], f.clock.now());
      f.service.refresh(RefreshSource.MANUAL); f.service.retryHistoryRead();
      expect(f.store.reads).assertEqual(1);
      expect(f.service.snapshot().pending).assertTrue();
      f.api.resolveNext(true); await flushMicrotasks(); f.service.retryHistoryRead(); await f.service.whenSaved();
      expect(f.service.records().map((row: QueryRecord): number => row.id).join(',')).assertEqual('1,40');
      expect(f.store.reads).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0400
     * @tc.name testStartupRecoveryBatchTwo0004
     * @tc.desc 多次重读失败保留已有查询并在恢复后继续保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0004', 0, async (): Promise<void> => {
      const f = create(true); await f.sample(false); f.service.retryHistoryRead(); f.service.retryHistoryRead();
      expect(f.service.records()[0].durationMillis).assertEqual(7);
      expect(f.store.reads).assertEqual(3);
      expect(f.store.writes.length).assertEqual(0);
      expect(f.service.historyNotice().indexOf('内存结果保留') >= 0).assertTrue();
      f.store.failRead = false; f.service.retryHistoryRead(); await f.service.whenSaved();
      expect(f.rows()[0].result).assertEqual('未开启');
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0500
     * @tc.name testStartupRecoveryBatchTwo0005
     * @tc.desc 读取正常时重试读取不会重新加载外部数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0005', 0, async (): Promise<void> => {
      const f = create(); await f.sample(true); await f.service.whenSaved();
      f.store.value = serializeHistory([recoveryRow(99, f.clock.now())], f.clock.now());
      f.service.retryHistoryRead(); await f.service.whenSaved();
      expect(f.store.reads).assertEqual(1);
      expect(f.service.records()[0].id).assertEqual(1);
      expect(f.rows()[0].id).assertEqual(99);
      expect(f.store.writes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0600
     * @tc.name testStartupRecoveryBatchTwo0006
     * @tc.desc 合并满容量历史按时间裁剪且后续查询继续编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0006', 0, async (): Promise<void> => {
      const f = create(true); await f.sample(true);
      const stored: QueryRecord[] = [];
      for (let i = 0; i < 20; i++) {
        stored.push(recoveryRow(100 + i, f.clock.now() - i - 1));
      }
      f.store.value = serializeHistory(stored, f.clock.now()); f.store.failRead = false;
      f.service.retryHistoryRead(); await f.service.whenSaved();
      expect(f.rows().length).assertEqual(20);
      expect(f.rows()[19].id).assertEqual(118);
      expect(f.service.latestValidRecord()?.result).assertEqual('已开启');
      await f.sample(false); expect(f.service.records()[0].id).assertEqual(119);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0700
     * @tc.name testStartupRecoveryBatchTwo0007
     * @tc.desc 重读成功但写入失败时显式重试保存合并结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0007', 0, async (): Promise<void> => {
      const f = create(true); await f.sample(true);
      f.store.value = serializeHistory([recoveryRow(7, f.clock.now() - 1)], f.clock.now());
      f.store.failRead = false; f.store.failWrite = true; f.service.retryHistoryRead(); await f.service.whenSaved();
      expect(f.service.records().length).assertEqual(2);
      expect(f.service.historyNotice().indexOf('保存失败') >= 0).assertTrue();
      expect(f.rows()[0].id).assertEqual(7);
      f.store.failWrite = false; f.service.retryPersistence(); await f.service.whenSaved();
      expect(f.rows().map((row: QueryRecord): number => row.id).join(',')).assertEqual('1,7');
      expect(f.service.historyNotice()).assertEqual('');
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0800
     * @tc.name testStartupRecoveryBatchTwo0008
     * @tc.desc 慢写期间清空随后新查询按排队快照保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0008', 0, async (): Promise<void> => {
      const f = create(); f.store.hold = true; await f.sample(true);
      f.service.clearRecords(); await f.sample(false);
      expect(f.store.writes.length).assertEqual(1);
      expect(f.service.records()[0].id).assertEqual(2);
      f.store.release(); await f.service.whenSaved();
      expect(parseHistory(f.store.writes[1], f.clock.now()).records.length).assertEqual(0);
      expect(f.rows()[0].result).assertEqual('未开启');
      expect(f.store.writes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_0900
     * @tc.name testStartupRecoveryBatchTwo0009
     * @tc.desc 旧写失败不覆盖随后成功写入的提示和内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0009', 0, async (): Promise<void> => {
      const f = create(); f.store.hold = true; f.store.failWrite = true; await f.sample(true);
      const first = f.service.whenSaved(); f.service.clearRecords(); f.store.release();
      await first; f.store.failWrite = false; f.service.retryPersistence(); await f.service.whenSaved();
      expect(f.service.historyNotice()).assertEqual('');
      expect(f.rows().length).assertEqual(0);
      expect(f.service.snapshot().lastValue).assertTrue();
      expect(f.store.writes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_1000
     * @tc.name testStartupRecoveryBatchTwo0010
     * @tc.desc 同一存储重绑后未启动的旧快照不得覆盖重新读取的数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0010', 0, async (): Promise<void> => {
      const f = create(); f.api.supported = false; f.service.refresh(RefreshSource.MANUAL);
      f.store.value = serializeHistory([recoveryRow(80, f.clock.now() - 1)], f.clock.now());
      f.service.attachHistory(f.store); await f.service.whenSaved();
      expect(f.rows()[0].id).assertEqual(80);
      expect(f.service.records()[0].id).assertEqual(80);
      expect(f.store.writes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_1100
     * @tc.name testStartupRecoveryBatchTwo0011
     * @tc.desc 切换存储后旧存储写失败不得污染新存储提示
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0011', 0, async (): Promise<void> => {
      const f = create(); f.store.hold = true; f.store.failWrite = true; await f.sample(true);
      const other = new RecoveryStore();
      other.value = serializeHistory([recoveryRow(60, f.clock.now())], f.clock.now());
      f.service.attachHistory(other); f.store.release(); await f.service.whenSaved();
      expect(f.service.historyNotice()).assertEqual('');
      expect(f.service.records()[0].id).assertEqual(60);
      expect(other.writes.length).assertEqual(0);
      expect(other.reads).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_1200
     * @tc.name testStartupRecoveryBatchTwo0012
     * @tc.desc 同存储正在写入时重绑等待结束再读取真实盘面
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0012', 0, async (): Promise<void> => {
      const f = create(); f.store.hold = true; await f.sample(true);
      f.service.clearRecords(); f.service.attachHistory(f.store);
      expect(f.store.reads).assertEqual(1);
      expect(f.service.historyNotice().indexOf('写入尚在结束') >= 0).assertTrue();
      f.store.release(); await f.service.whenSaved();
      expect(f.store.writes.length).assertEqual(1);
      expect(f.service.records()[0].result).assertEqual('已开启');
      expect(f.store.reads).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_1300
     * @tc.name testStartupRecoveryBatchTwo0013
     * @tc.desc 连续切换存储只恢复最后选定存储并继续编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0013', 0, async (): Promise<void> => {
      const f = create(); f.store.hold = true; await f.sample(true);
      const abandoned = new RecoveryStore();
      abandoned.value = serializeHistory([recoveryRow(90, f.clock.now())], f.clock.now());
      const selected = new RecoveryStore();
      selected.value = serializeHistory([recoveryRow(70, f.clock.now())], f.clock.now());
      f.service.attachHistory(abandoned); f.service.attachHistory(selected);
      f.store.release(); await f.service.whenSaved();
      expect(abandoned.reads).assertEqual(0);
      expect(selected.reads).assertEqual(1);
      expect(f.service.records()[0].id).assertEqual(70);
      await f.sample(false); await f.service.whenSaved();
      expect(parseHistory(selected.value, f.clock.now()).records[0].id).assertEqual(71);
      expect(abandoned.writes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_RECOVERYB2_1400
     * @tc.name testStartupRecoveryBatchTwo0014
     * @tc.desc 重绑等待写入期间点击重读不能提前解除保护
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupRecoveryBatchTwo0014', 0, async (): Promise<void> => {
      const f = create(); f.store.hold = true; await f.sample(true);
      f.service.attachHistory(f.store); f.service.retryHistoryRead(); f.service.retryPersistence();
      expect(f.store.reads).assertEqual(1);
      expect(f.service.historyNotice().indexOf('写入尚在结束') >= 0).assertTrue();
      f.store.release(); await f.service.whenSaved();
      expect(f.store.writes.length).assertEqual(1);
      expect(f.service.records()[0].durationMillis).assertEqual(7);
      expect(f.service.historyNotice()).assertEqual('');
    });
  });
}
