import { afterEach, beforeEach, describe, expect, it } from '@ohos/hypium';
import { QueryPhase, RefreshSource, SupportState } from '../../../main/ets/autostart/AutoStartupTypes';
import { statusLabel } from '../../../main/ets/components/QueryPresentation';
import { AutoStartupFixture, flushMicrotasks, TestBusinessError } from '../support/TestSupport';

export default function autoStartupTest(): void {
  describe('AutoStartupQueries', () => {
    let fixture: AutoStartupFixture = new AutoStartupFixture();

    beforeEach(() => {
      fixture = new AutoStartupFixture();
    });

    afterEach(async () => {
      fixture.service.dispose();
      const remainingTimers: number = fixture.clock.pendingCount();
      fixture.clock.clearAll();
      fixture.api.finishPending();
      await flushMicrotasks();
      expect(remainingTimers).assertEqual(0);
      expect(fixture.api.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0100
     * @tc.name      testAutoStartupQueries0001
     * @tc.desc      Verify supported true shows enabled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0001', 0, async () => {
      const f = fixture;
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.IDLE);
      f.service.refresh(RefreshSource.INITIAL);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
      expect(f.service.snapshot().pending).assertTrue();
      expect(statusLabel(f.service.snapshot())).assertEqual('正在查询');
      expect(f.api.probeCalls).assertEqual(1);
      expect(f.api.queryCalls).assertEqual(1);
      f.clock.advance(25);
      f.api.resolveNext(true);
      await flushMicrotasks();

      const snapshot = f.service.snapshot();
      expect(snapshot.phase).assertEqual(QueryPhase.SUCCEEDED);
      expect(snapshot.support).assertEqual(SupportState.SUPPORTED);
      expect(snapshot.value).assertTrue();
      expect(snapshot.lastValue).assertTrue();
      expect(snapshot.sampleTime).assertEqual(f.clock.now());
      expect(snapshot.lastSampleTime).assertEqual(snapshot.sampleTime);
      expect(snapshot.pending).assertFalse();
      expect(snapshot.supportResult).assertEqual('true');
      expect(snapshot.statusResult).assertEqual('true');
      expect(statusLabel(snapshot)).assertEqual('本应用已开启');
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].source).assertEqual(RefreshSource.INITIAL);
      expect(f.service.records()[0].result).assertEqual('已开启');
      expect(f.service.records()[0].durationMillis).assertEqual(25);
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0200
     * @tc.name      testAutoStartupQueries0002
     * @tc.desc      Verify supported false shows disabled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0002', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(12);
      f.api.resolveNext(false);
      await flushMicrotasks();

      const snapshot = f.service.snapshot();
      expect(snapshot.phase).assertEqual(QueryPhase.SUCCEEDED);
      expect(snapshot.support).assertEqual(SupportState.SUPPORTED);
      expect(snapshot.value).assertFalse();
      expect(snapshot.lastValue).assertFalse();
      expect(snapshot.pending).assertFalse();
      expect(snapshot.supportResult).assertEqual('true');
      expect(snapshot.statusResult).assertEqual('false');
      expect(snapshot.errorCode).assertEqual('');
      expect(statusLabel(snapshot)).assertEqual('本应用未开启');
      expect(f.service.records()[0].result).assertEqual('未开启');
      expect(f.service.records()[0].statusResult).assertEqual('false');
      expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0300
     * @tc.name      testAutoStartupQueries0003
     * @tc.desc      Verify unsupported probe skips status query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0003', 0, () => {
      const f = fixture;
      f.api.supported = false;
      f.service.refresh(RefreshSource.INITIAL);

      const snapshot = f.service.snapshot();
      expect(snapshot.phase).assertEqual(QueryPhase.UNSUPPORTED);
      expect(snapshot.support).assertEqual(SupportState.UNSUPPORTED);
      expect(snapshot.value).assertNull();
      expect(snapshot.pending).assertFalse();
      expect(snapshot.supportResult).assertEqual('false');
      expect(snapshot.statusResult).assertEqual('未调用');
      expect(statusLabel(snapshot)).assertEqual('设备不支持');
      expect(f.api.probeCalls).assertEqual(1);
      expect(f.api.queryCalls).assertEqual(0);
      expect(f.api.pendingCount()).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].statusResult).assertEqual('未调用');
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0400
     * @tc.name      testAutoStartupQueries0004
     * @tc.desc      Verify probe exception fails without status query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0004', 0, () => {
      const f = fixture;
      f.api.probeError = new TestBusinessError(16000050, 'probe unavailable');
      f.service.refresh(RefreshSource.INITIAL);

      const snapshot = f.service.snapshot();
      expect(snapshot.phase).assertEqual(QueryPhase.FAILED);
      expect(snapshot.support).assertEqual(SupportState.FAILED);
      expect(snapshot.value).assertNull();
      expect(snapshot.pending).assertFalse();
      expect(snapshot.supportResult).assertEqual('异常');
      expect(snapshot.statusResult).assertEqual('未调用');
      expect(snapshot.errorCode).assertEqual('16000050');
      expect(snapshot.errorMessage).assertEqual('probe unavailable');
      expect(statusLabel(snapshot)).assertEqual('检测失败');
      expect(f.api.probeCalls).assertEqual(1);
      expect(f.api.queryCalls).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].errorMessage).assertEqual('probe unavailable');
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0500
     * @tc.name      testAutoStartupQueries0005
     * @tc.desc      Verify query801 keeps successful support probe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0005', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.api.rejectNext(new TestBusinessError(801, 'status unsupported'));
      await flushMicrotasks();

      const snapshot = f.service.snapshot();
      expect(snapshot.phase).assertEqual(QueryPhase.UNSUPPORTED);
      expect(snapshot.support).assertEqual(SupportState.SUPPORTED);
      expect(snapshot.value).assertNull();
      expect(snapshot.pending).assertFalse();
      expect(snapshot.supportResult).assertEqual('true');
      expect(snapshot.statusResult).assertEqual('801');
      expect(snapshot.errorCode).assertEqual('801');
      expect(snapshot.errorMessage).assertEqual('status unsupported');
      expect(statusLabel(snapshot)).assertEqual('查询暂不可用');
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].result).assertEqual('查询不支持');
      expect(f.service.records()[0].supportResult).assertEqual('true');
      expect(f.service.records()[0].errorCode).assertEqual('801');
      expect(f.service.records()[0].errorMessage).assertEqual('status unsupported');
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0600
     * @tc.name      testAutoStartupQueries0006
     * @tc.desc      Verify query failure preserves last successful sample
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0006', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(17);
      f.api.resolveNext(true);
      await flushMicrotasks();
      const successful = f.service.snapshot();

      f.clock.advance(100);
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(7);
      f.api.rejectNext(new TestBusinessError(16000050, 'status unavailable'));
      await flushMicrotasks();

      const failed = f.service.snapshot();
      expect(failed.phase).assertEqual(QueryPhase.FAILED);
      expect(failed.support).assertEqual(SupportState.SUPPORTED);
      expect(failed.value).assertNull();
      expect(failed.lastValue).assertEqual(successful.value);
      expect(failed.lastSampleTime).assertEqual(successful.sampleTime);
      expect(failed.sampleTime).assertEqual(f.clock.now());
      expect(failed.pending).assertFalse();
      expect(failed.statusResult).assertEqual('16000050');
      expect(failed.errorCode).assertEqual('16000050');
      expect(failed.errorMessage).assertEqual('status unavailable');
      expect(statusLabel(failed)).assertEqual('查询失败');
      expect(f.service.records().length).assertEqual(2);
      expect(f.service.records()[0].errorCode).assertEqual('16000050');

      f.api.queryError = new TestBusinessError(16000050, 'synchronous status failure');
      f.service.refresh(RefreshSource.MANUAL);
      const synchronous = f.service.snapshot();
      expect(synchronous.phase).assertEqual(QueryPhase.FAILED);
      expect(synchronous.support).assertEqual(SupportState.SUPPORTED);
      expect(synchronous.errorCode).assertEqual(failed.errorCode);
      expect(synchronous.errorMessage).assertEqual('synchronous status failure');
      expect(synchronous.lastValue).assertEqual(successful.value);
      expect(synchronous.lastSampleTime).assertEqual(successful.sampleTime);
      expect(synchronous.pending).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0700
     * @tc.name      testAutoStartupQueries0007
     * @tc.desc      Verify repeated refresh keeps one in flight query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0007', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      for (let index = 0; index < 10; index++) {
        f.service.refresh(RefreshSource.MANUAL);
        f.service.refresh(RefreshSource.INITIAL);
      }
      expect(f.api.probeCalls).assertEqual(1);
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.api.pendingCount()).assertEqual(1);
      expect(f.clock.pendingCount()).assertEqual(1);
      expect(f.service.records().length).assertEqual(0);
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(f.api.queryCalls).assertEqual(1);
      expect(f.api.pendingCount()).assertEqual(0);
      expect(f.service.snapshot().pending).assertFalse();
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].source).assertEqual(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.INITIAL);
      expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0800
     * @tc.name      testAutoStartupQueries0008
     * @tc.desc      Verify settings and foreground merge into one follow up
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0008', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.FOREGROUND);
      f.service.refresh(RefreshSource.SETTINGS);
      f.service.onBackground();
      f.service.onForeground();
      f.service.refresh(RefreshSource.SETTINGS);
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.api.pendingCount()).assertEqual(1);
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(f.api.probeCalls).assertEqual(2);
      expect(f.api.queryCalls).assertEqual(2);
      expect(f.api.pendingCount()).assertEqual(1);
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.snapshot().pending).assertTrue();
      f.clock.advance(10);
      f.api.resolveNext(false);
      await flushMicrotasks();

      expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
      expect(f.service.snapshot().value).assertFalse();
      expect(f.service.snapshot().pending).assertFalse();
      expect(f.api.queryCalls).assertEqual(2);
      expect(f.service.records().length).assertEqual(2);
      expect(f.service.records()[0].source).assertEqual(RefreshSource.SETTINGS);
      expect(f.service.records()[0].result).assertEqual('未开启');
      expect(f.service.records()[1].source).assertEqual(RefreshSource.INITIAL);
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_0900
     * @tc.name      testAutoStartupQueries0009
     * @tc.desc      Verify timeout keeps pending and discards late result
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0009', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(4999);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
      expect(f.service.records().length).assertEqual(0);
      f.clock.advance(1);

      const timedOut = f.service.snapshot();
      expect(timedOut.phase).assertEqual(QueryPhase.TIMEOUT);
      expect(timedOut.support).assertEqual(SupportState.SUPPORTED);
      expect(timedOut.value).assertNull();
      expect(timedOut.pending).assertTrue();
      expect(timedOut.errorCode).assertEqual('TIMEOUT');
      expect(statusLabel(timedOut)).assertEqual('查询超时');
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].durationMillis).assertEqual(5000);
      f.service.refresh(RefreshSource.MANUAL);
      expect(f.api.queryCalls).assertEqual(1);
      f.api.resolveNext(true);
      await flushMicrotasks();

      const late = f.service.snapshot();
      expect(late.phase).assertEqual(QueryPhase.TIMEOUT);
      expect(late.value).assertNull();
      expect(late.pending).assertFalse();
      expect(late.sampleTime).assertEqual(timedOut.sampleTime);
      expect(late.supportResult).assertEqual(timedOut.supportResult);
      expect(late.statusResult).assertEqual(timedOut.statusResult);
      expect(late.errorCode).assertEqual(timedOut.errorCode);
      expect(late.lastValue).assertNull();
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].errorCode).assertEqual('TIMEOUT');
      expect(f.api.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPQUERIES_1000
     * @tc.name      testAutoStartupQueries0010
     * @tc.desc      Verify history is bounded copied and cleared independently
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupQueries0010', 0, async () => {
      const f = fixture;
      for (let index = 0; index < 21; index++) {
        f.clock.advance(10);
        f.service.refresh(index === 0 ? RefreshSource.INITIAL : RefreshSource.MANUAL);
        f.api.resolveNext(index % 2 === 0);
        await flushMicrotasks();
      }
      const records = f.service.records();
      expect(records.length).assertEqual(20);
      expect(records[0].id).assertEqual(21);
      expect(records[19].id).assertEqual(2);
      for (let index = 0; index < records.length - 1; index++) {
        expect(records[index].timestamp > records[index + 1].timestamp).assertTrue();
        expect(records[index].id > records[index + 1].id).assertTrue();
      }
      records[0].id = -1;
      records[0].result = 'modified';
      records[0].errorMessage = 'modified';
      records.pop();
      const unchanged = f.service.records();
      expect(unchanged.length).assertEqual(20);
      expect(unchanged[0].id).assertEqual(21);
      expect(unchanged[0].result).assertEqual('已开启');
      expect(unchanged[0].errorMessage).assertEqual('');

      const beforeClear = f.service.snapshot();
      const snapshotCopy = f.service.snapshot();
      snapshotCopy.value = false;
      snapshotCopy.phase = QueryPhase.FAILED;
      expect(f.service.snapshot().value).assertTrue();
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
      f.service.clearRecords();
      const afterClear = f.service.snapshot();
      expect(f.service.records().length).assertEqual(0);
      expect(afterClear.phase).assertEqual(beforeClear.phase);
      expect(afterClear.value).assertEqual(beforeClear.value);
      expect(afterClear.sampleTime).assertEqual(beforeClear.sampleTime);
      expect(afterClear.lastValue).assertEqual(beforeClear.lastValue);
      expect(afterClear.lastSampleTime).assertEqual(beforeClear.lastSampleTime);
      expect(afterClear.supportResult).assertEqual(beforeClear.supportResult);
      expect(afterClear.statusResult).assertEqual(beforeClear.statusResult);
      expect(afterClear.pending).assertFalse();
      expect(f.api.queryCalls).assertEqual(21);
      expect(f.clock.pendingCount()).assertEqual(0);
    });
  });
}
