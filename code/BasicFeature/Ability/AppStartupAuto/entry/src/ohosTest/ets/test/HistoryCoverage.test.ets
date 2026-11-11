import { afterEach, beforeEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { HistoryStorage } from '../../../main/ets/autostart/AutoStartupHistory';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import {
  QueryOutcome, QueryPhase, QueryRecord, QuerySnapshot, RefreshSource
} from '../../../main/ets/autostart/AutoStartupTypes';
import {
  AutoStartupFixture, flushMicrotasks, ManualQueryClock
} from '../support/TestSupport';

class MemoryHistoryStorage implements HistoryStorage {
  public value: string = '';
  public readCount: number = 0;
  public writeCount: number = 0;
  public failRead: boolean = false;
  public failWrite: boolean = false;

  read(): string {
    this.readCount++;
    if (this.failRead) {
      throw new Error('模拟历史读取失败');
    }
    return this.value;
  }

  async write(value: string): Promise<void> {
    this.writeCount++;
    if (this.failWrite) {
      throw new Error('模拟历史写入失败');
    }
    this.value = value;
  }
}

class HistoryFixture {
  public readonly api = new AutoStartupFixture().api;
  public readonly clock: ManualQueryClock = new ManualQueryClock();
  public readonly storage: MemoryHistoryStorage = new MemoryHistoryStorage();
  public readonly service: AutoStartupService;

  constructor() {
    this.service = new AutoStartupService(this.api, this.clock, this.storage);
  }
}

function record(id: number, timestamp: number, result: string, outcome: QueryOutcome,
  message: string = ''): QueryRecord {
  const value = new QueryRecord();
  value.id = id;
  value.timestamp = timestamp;
  value.source = RefreshSource.MANUAL;
  value.result = result;
  value.supportResult = 'true';
  value.statusResult = result;
  value.errorCode = outcome === QueryOutcome.FAILURE ? '16000050' : '';
  value.errorMessage = message;
  value.durationMillis = 12;
  value.outcome = outcome;
  return value;
}

function stored(records: QueryRecord[]): string {
  return JSON.stringify({ schema: 1, savedAt: 1700000000000, records: records });
}

export default function historyCoverageTest(): void {
  describe('AutoStartupHistoryCoverage', () => {
    let fixture: HistoryFixture = new HistoryFixture();

    beforeEach(() => {
      fixture = new HistoryFixture();
    });

    afterEach(async () => {
      fixture.service.dispose();
      fixture.clock.clearAll();
      fixture.api.finishPending();
      await flushMicrotasks();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0100
     * @tc.name      testAutoStartupHistoryCoverage0001
     * @tc.desc      Verify completed query persists and restores outcome
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0001', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(25);
      f.api.resolveNext(false);
      await flushMicrotasks();
      await f.service.whenSaved();

      expect(f.storage.writeCount).assertEqual(1);
      expect(f.storage.value.length > 0).assertTrue();
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].outcome).assertEqual(QueryOutcome.SUCCESS);
      expect(f.service.records('成功').length).assertEqual(1);
      expect(f.service.records('失败').length).assertEqual(0);

      const restored = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        const snapshot: QuerySnapshot = restored.snapshot();
        expect(snapshot.phase).assertEqual(QueryPhase.IDLE);
        expect(restored.records().length).assertEqual(1);
        expect(restored.records()[0].result).assertEqual('未开启');
        expect(restored.records()[0].durationMillis).assertEqual(25);
        expect(restored.historyNotice()).assertEqual('');
        expect(restored.records('成功').length).assertEqual(1);
      } finally {
        restored.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0200
     * @tc.name      testAutoStartupHistoryCoverage0002
     * @tc.desc      Verify corrupt storage is reported and next write recovers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0002', 0, async () => {
      const f = fixture;
      f.storage.value = '{not json';
      const recovered = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(recovered.records().length).assertEqual(0);
        expect(recovered.historyNotice().indexOf('损坏') >= 0).assertTrue();
        recovered.refresh(RefreshSource.MANUAL);
        f.clock.advance(10);
        f.api.resolveNext(true);
        await flushMicrotasks();
        await recovered.whenSaved();
        expect(recovered.records().length).assertEqual(1);
        expect(recovered.historyNotice()).assertEqual('');
      } finally {
        recovered.dispose();
      }
      const reopened = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(reopened.records().length).assertEqual(1);
        expect(reopened.historyNotice()).assertEqual('');
      } finally {
        reopened.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0300
     * @tc.name      testAutoStartupHistoryCoverage0003
     * @tc.desc      Verify write failure keeps business result and can recover
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0003', 0, async () => {
      const f = fixture;
      f.storage.failWrite = true;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(9);
      f.api.resolveNext(true);
      await flushMicrotasks();
      await f.service.whenSaved();
      expect(f.service.snapshot().phase).assertEqual('SUCCEEDED');
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.historyNotice().indexOf('保存失败') >= 0).assertTrue();

      f.storage.failWrite = false;
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(7);
      f.api.resolveNext(false);
      await flushMicrotasks();
      await f.service.whenSaved();
      expect(f.service.historyNotice()).assertEqual('');
      const reopened = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(reopened.records().length).assertEqual(2);
        expect(reopened.records()[0].result).assertEqual('未开启');
      } finally {
        reopened.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0400
     * @tc.name      testAutoStartupHistoryCoverage0004
     * @tc.desc      Verify read failure starts empty without blocking query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0004', 0, async () => {
      const f = fixture;
      f.storage.failRead = true;
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(service.historyNotice().indexOf('读取失败') >= 0).assertTrue();
        service.refresh(RefreshSource.INITIAL);
        f.clock.advance(5);
        f.api.resolveNext(true);
        await flushMicrotasks();
        expect(service.snapshot().phase).assertEqual('SUCCEEDED');
        expect(service.records().length).assertEqual(1);
        await service.whenSaved();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0500
     * @tc.name      testAutoStartupHistoryCoverage0005
     * @tc.desc      Verify expired and duplicate records are dropped on restore
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0005', 0, async () => {
      const f = fixture;
      const now = f.clock.now();
      f.storage.value = stored([
        record(1, now - 31 * 24 * 60 * 60 * 1000, '已开启', QueryOutcome.SUCCESS),
        record(2, now - 1000, '未开启', QueryOutcome.SUCCESS),
        record(2, now - 500, '已开启', QueryOutcome.SUCCESS)
      ]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(service.records().length).assertEqual(1);
        expect(service.records()[0].id).assertEqual(2);
        expect(service.historyNotice().indexOf('30 天') >= 0).assertTrue();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0600
     * @tc.name      testAutoStartupHistoryCoverage0006
     * @tc.desc      Verify restore caps at twenty newest records
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0006', 0, async () => {
      const f = fixture;
      const now = f.clock.now();
      const values: QueryRecord[] = [];
      for (let index = 0; index < 25; index++) {
        values.push(record(index + 1, now - index * 1000, index % 2 === 0 ? '已开启' : '未开启',
          QueryOutcome.SUCCESS));
      }
      f.storage.value = stored(values);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(service.records().length).assertEqual(20);
        expect(service.records()[0].id).assertEqual(1);
        expect(service.records()[19].id).assertEqual(20);
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0700
     * @tc.name      testAutoStartupHistoryCoverage0007
     * @tc.desc      Verify filter and redacted export hide personal numbers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0007', 0, async () => {
      const f = fixture;
      const now = f.clock.now();
      f.storage.value = stored([
        record(1, now - 1000, '查询失败', QueryOutcome.FAILURE, 'account 13800138000 mail a@b.com'),
        record(2, now - 2000, '设备不支持', QueryOutcome.UNSUPPORTED)
      ]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(service.records('全部').length).assertEqual(2);
        expect(service.records('失败').length).assertEqual(1);
        expect(service.records('不支持').length).assertEqual(1);
        expect(service.records('成功').length).assertEqual(0);
        const text: string = service.exportHistory();
        expect(text.indexOf('13800138000')).assertEqual(-1);
        expect(text.indexOf('a@b.com')).assertEqual(-1);
        expect(text.indexOf('[号码]') >= 0).assertTrue();
        expect(text.indexOf('[邮箱]') >= 0).assertTrue();
        expect(text.indexOf('脱敏导出') >= 0).assertTrue();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0800
     * @tc.name      testAutoStartupHistoryCoverage0008
     * @tc.desc      Verify legacy array migrates and clear persists empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0008', 0, async () => {
      const f = fixture;
      const now = f.clock.now();
      const legacy = record(7, now - 1000, '已开启', QueryOutcome.SUCCESS);
      const bag = JSON.parse(JSON.stringify(legacy)) as Record<string, Object>;
      bag['outcome'] = '';
      f.storage.value = JSON.stringify([bag]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(service.records().length).assertEqual(1);
        expect(service.records()[0].outcome).assertEqual(QueryOutcome.SUCCESS);
        expect(service.historyNotice().indexOf('迁移') >= 0).assertTrue();
        service.clearRecords();
        await service.whenSaved();
        expect(service.records().length).assertEqual(0);
        expect(f.storage.value.indexOf('"records":[]') >= 0).assertTrue();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0900
     * @tc.name      testAutoStartupHistoryCoverage0009
     * @tc.desc      Verify restored ids continue above maximum without duplicates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0009', 0, async () => {
      const f = fixture;
      const now = f.clock.now();
      f.storage.value = stored([record(500, now - 1000, '已开启', QueryOutcome.SUCCESS)]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(service.records()[0].id).assertEqual(500);
        service.refresh(RefreshSource.MANUAL);
        f.clock.advance(5);
        f.api.resolveNext(true);
        await flushMicrotasks();
        await service.whenSaved();
        const rows = service.records();
        expect(rows.length).assertEqual(2);
        expect(rows[0].id).assertEqual(501);
        expect(rows[0].id === rows[1].id).assertFalse();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1000
     * @tc.name      testAutoStartupHistoryCoverage0010
     * @tc.desc      Verify long platform message is bounded before and after restore
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0010', 0, async () => {
      const f = fixture;
      const long: BusinessError = new Error('x'.repeat(600)) as BusinessError;
      long.code = 16000050;
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(5);
      f.api.rejectNext(long);
      await flushMicrotasks();
      await f.service.whenSaved();
      const message = f.service.records()[0].errorMessage;
      expect(message.length <= 512).assertTrue();
      expect(f.storage.value.indexOf('x'.repeat(513))).assertEqual(-1);

      const restored = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(restored.records().length).assertEqual(1);
        expect(restored.records()[0].errorMessage.length <= 512).assertTrue();
        expect(restored.historyNotice()).assertEqual('');
      } finally {
        restored.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1100
     * @tc.name      testAutoStartupHistoryCoverage0011
     * @tc.desc      Verify reopen append reopen keeps ids unique and ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0011', 0, async () => {
      const f = fixture;
      const now = f.clock.now();
      const values: QueryRecord[] = [];
      for (let index = 0; index < 20; index++) {
        values.push(record(100 + index, now - (index + 1) * 1000, '未开启', QueryOutcome.SUCCESS));
      }
      f.storage.value = stored(values);
      const first = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        first.refresh(RefreshSource.MANUAL);
        f.clock.advance(5);
        f.api.resolveNext(true);
        await flushMicrotasks();
        await first.whenSaved();
        expect(first.records()[0].id).assertEqual(120);
      } finally {
        first.dispose();
      }
      const second = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(second.records()[0].id).assertEqual(120);
        second.refresh(RefreshSource.SETTINGS);
        f.clock.advance(5);
        f.api.resolveNext(false);
        await flushMicrotasks();
        await second.whenSaved();
        expect(second.records()[0].id).assertEqual(121);
        const ids: number[] = second.records().map((row: QueryRecord): number => row.id);
        const unique: number[] = [];
        ids.forEach((id: number): void => {
          if (unique.indexOf(id) < 0) {
            unique.push(id);
          }
        });
        expect(unique.length).assertEqual(ids.length);
      } finally {
        second.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1200
     * @tc.name      testAutoStartupHistoryCoverage0012
     * @tc.desc      Verify summary comparison and advanced filter use persisted outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0012', 0, async () => {
      const f = fixture;
      const now = f.clock.now();
      const records: QueryRecord[] = [
        record(12, now - 1000, '已开启', QueryOutcome.SUCCESS),
        record(11, now - 2000, '查询失败', QueryOutcome.FAILURE),
        record(10, now - 3000, '未调用', QueryOutcome.UNSUPPORTED)
      ];
      f.storage.value = stored(records);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        const summary = service.historySummary();
        expect(summary.total).assertEqual(3);
        expect(summary.success).assertEqual(1);
        expect(summary.failure).assertEqual(1);
        expect(summary.unsupported).assertEqual(1);
        expect(summary.latestValidId).assertEqual(12);
        const comparison = service.historyComparison();
        expect(comparison.beforeId).assertEqual(11);
        expect(comparison.afterId).assertEqual(12);
        expect(comparison.changed).assertTrue();
        expect(comparison.deltaMillis).assertEqual(1000);
        expect(service.filteredHistory('', QueryOutcome.FAILURE, 0, 0).length).assertEqual(1);
        expect(service.filteredHistory('', '', now - 2500, 0).length).assertEqual(2);
        expect(service.filteredHistory(RefreshSource.MANUAL, '', 0, 0).length).assertEqual(3);
        const latest = service.latestValidRecord();
        expect(latest !== undefined).assertTrue();
        if (latest !== undefined) {
          expect(latest.id).assertEqual(12);
        }
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1300
     * @tc.name      testAutoStartupHistoryCoverage0013
     * @tc.desc      Verify message boundary keeps512 and truncates513
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0013', 0, async () => {
      const first = fixture;
      const exact: BusinessError = new Error('y'.repeat(512)) as BusinessError;
      exact.code = 16000050;
      first.service.refresh(RefreshSource.MANUAL);
      first.clock.advance(5);
      first.api.rejectNext(exact);
      await flushMicrotasks();
      await first.service.whenSaved();
      expect(first.service.records()[0].errorMessage.length).assertEqual(512);

      const second = new HistoryFixture();
      try {
        const longer: BusinessError = new Error('z'.repeat(513)) as BusinessError;
        longer.code = 16000050;
        second.service.refresh(RefreshSource.MANUAL);
        second.clock.advance(5);
        second.api.rejectNext(longer);
        await flushMicrotasks();
        await second.service.whenSaved();
        const message = second.service.records()[0].errorMessage;
        expect(message.length).assertEqual(512);
        expect(message.endsWith('…')).assertTrue();
      } finally {
        second.service.dispose();
        second.clock.clearAll();
        second.api.finishPending();
        await flushMicrotasks();
      }
    });
  });
}
