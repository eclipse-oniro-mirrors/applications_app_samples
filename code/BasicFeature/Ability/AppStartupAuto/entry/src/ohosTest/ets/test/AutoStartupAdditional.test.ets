import { afterEach, beforeEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { AutoStartupApi } from '../../../main/ets/autostart/AutoStartupRuntime';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import { QueryPhase, QuerySnapshot, RefreshSource, SupportState } from '../../../main/ets/autostart/AutoStartupTypes';
import {
  apiResultLabel, formatQueryTime, sourceLabel, statusLabel, supportLabel
} from '../../../main/ets/components/QueryPresentation';
import { AutoStartupFixture, flushMicrotasks, ManualQueryClock, TestBusinessError } from '../support/TestSupport';

// A rejected native promise need not carry a BusinessError payload.
class EmptyRejectionApi implements AutoStartupApi {
  probeCalls: number = 0;
  queryCalls: number = 0;

  isAutoStartupSupported(): boolean {
    this.probeCalls++;
    return true;
  }

  getAutoStartupStatusForSelf(): Promise<boolean> {
    this.queryCalls++;
    return Promise.reject<boolean>(null);
  }
}

export default function autoStartupAdditionalTest(): void {
  describe('AutoStartupAdditionalBranches', () => {
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
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0100
     * @tc.name      testAutoStartupAdditionalBranches0001
     * @tc.desc      Verify disposed service ignores refresh and late completion until foreground
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0001', 0, async () => {
      const f = fixture;
      let notifications: number = 0;
      f.service.subscribe((): void => { notifications++; });
      f.service.refresh(RefreshSource.INITIAL);
      expect(notifications).assertEqual(1);
      f.service.dispose();
      f.service.dispose();
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.MANUAL);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.IDLE);
      expect(f.service.snapshot().pending).assertTrue();
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.api.queryCalls).assertEqual(1);
      f.clock.advance(6000);
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(f.service.snapshot().phase).assertEqual(QueryPhase.IDLE);
      expect(f.service.snapshot().pending).assertFalse();
      expect(f.service.snapshot().value).assertNull();
      expect(f.service.records().length).assertEqual(0);
      expect(notifications).assertEqual(1);
      f.service.onForeground();
      f.service.onForeground();
      expect(f.api.queryCalls).assertEqual(2);
      f.api.resolveNext(false);
      await flushMicrotasks();
      expect(f.service.snapshot().value).assertFalse();
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].id).assertEqual(2);
      expect(notifications).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0200
     * @tc.name      testAutoStartupAdditionalBranches0002
     * @tc.desc      Verify resubscribe before late success preserves native single flight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0002', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.SETTINGS);
      f.service.dispose();
      let notifications: number = 0;
      const unsubscribe = f.service.subscribe((): void => { notifications++; });
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.MANUAL);
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.api.pendingCount()).assertEqual(1);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(notifications).assertEqual(0);
      f.api.resolveNext(true);
      await flushMicrotasks();

      expect(f.api.probeCalls).assertEqual(2);
      expect(f.api.queryCalls).assertEqual(2);
      expect(f.api.pendingCount()).assertEqual(1);
      expect(f.clock.pendingCount()).assertEqual(1);
      expect(f.service.records().length).assertEqual(0);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
      expect(f.service.snapshot().value).assertNull();
      expect(f.service.snapshot().lastValue).assertNull();
      expect(notifications).assertEqual(1);
      f.api.resolveNext(false);
      await flushMicrotasks();
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].id).assertEqual(2);
      expect(f.service.records()[0].source).assertEqual(RefreshSource.INITIAL);
      expect(f.service.snapshot().value).assertFalse();
      expect(notifications).assertEqual(2);
      unsubscribe();
      unsubscribe();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0300
     * @tc.name      testAutoStartupAdditionalBranches0003
     * @tc.desc      Verify foreground before late failure restarts only after native release
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0003', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.dispose();
      f.service.onForeground();
      f.service.onForeground();
      expect(f.api.probeCalls).assertEqual(1);
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.IDLE);
      expect(f.service.snapshot().pending).assertTrue();
      f.clock.advance(7000);
      expect(f.service.records().length).assertEqual(0);
      f.api.rejectNext(new TestBusinessError(801, 'obsolete native rejection'));
      await flushMicrotasks();

      expect(f.api.queryCalls).assertEqual(2);
      expect(f.api.pendingCount()).assertEqual(1);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
      expect(f.service.snapshot().errorCode).assertEqual('');
      expect(f.service.snapshot().errorMessage).assertEqual('');
      expect(f.service.records().length).assertEqual(0);
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].id).assertEqual(2);
      expect(f.service.records()[0].source).assertEqual(RefreshSource.INITIAL);
      expect(f.service.snapshot().value).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0400
     * @tc.name      testAutoStartupAdditionalBranches0004
     * @tc.desc      Verify background completion does not schedule deferred refresh
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0004', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.SETTINGS);
      f.service.onBackground();
      f.api.rejectNext(new TestBusinessError(16000050, 'completed in background'));
      await flushMicrotasks();

      expect(f.api.queryCalls).assertEqual(1);
      expect(f.api.pendingCount()).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.FAILED);
      expect(f.service.snapshot().pending).assertFalse();
      expect(f.service.records().length).assertEqual(1);
      f.clock.advance(10000);
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.service.records().length).assertEqual(1);
      f.service.onForeground();
      f.service.onForeground();
      expect(f.api.queryCalls).assertEqual(2);
      expect(f.api.pendingCount()).assertEqual(1);
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(f.service.snapshot().value).assertTrue();
      expect(f.service.records().length).assertEqual(2);
      expect(f.service.records()[0].source).assertEqual(RefreshSource.FOREGROUND);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0500
     * @tc.name      testAutoStartupAdditionalBranches0005
     * @tc.desc      Verify timeout discards late failure and retains last good sample
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0005', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(19);
      f.api.resolveNext(false);
      await flushMicrotasks();
      const successful = f.service.snapshot();
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(5000);
      const timedOut = f.service.snapshot();
      expect(timedOut.phase).assertEqual(QueryPhase.TIMEOUT);
      expect(timedOut.lastValue).assertFalse();
      expect(timedOut.lastSampleTime).assertEqual(successful.sampleTime);
      expect(timedOut.pending).assertTrue();
      expect(timedOut.errorMessage).assertEqual('系统响应等待超时');
      f.clock.advance(3000);
      f.api.rejectNext(new TestBusinessError(801, 'arrived after timeout'));
      await flushMicrotasks();

      const late = f.service.snapshot();
      expect(late.phase).assertEqual(QueryPhase.TIMEOUT);
      expect(late.pending).assertFalse();
      expect(late.value).assertNull();
      expect(late.lastValue).assertFalse();
      expect(late.lastSampleTime).assertEqual(successful.sampleTime);
      expect(late.sampleTime).assertEqual(timedOut.sampleTime);
      expect(late.errorCode).assertEqual('TIMEOUT');
      expect(late.errorMessage).assertEqual(timedOut.errorMessage);
      expect(late.statusResult).assertEqual(timedOut.statusResult);
      expect(f.service.records().length).assertEqual(2);
      expect(f.service.records()[0].errorCode).assertEqual('TIMEOUT');
      expect(f.service.records()[0].durationMillis).assertEqual(5000);
      expect(f.clock.pendingCount()).assertEqual(0);
      f.service.refresh(RefreshSource.MANUAL);
      expect(f.api.queryCalls).assertEqual(3);
      expect(f.service.snapshot().errorCode).assertEqual('');
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(f.service.snapshot().value).assertTrue();
      expect(f.service.records().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0600
     * @tc.name      testAutoStartupAdditionalBranches0006
     * @tc.desc      Verify timed out request holds deferred settings until late rejection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0006', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.service.refresh(RefreshSource.SETTINGS);
      f.clock.advance(5000);
      f.service.refresh(RefreshSource.FOREGROUND);
      f.service.refresh(RefreshSource.MANUAL);
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.api.pendingCount()).assertEqual(1);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.TIMEOUT);
      f.api.rejectNext(new TestBusinessError(16000050, 'late failure releases slot'));
      await flushMicrotasks();

      expect(f.api.queryCalls).assertEqual(2);
      expect(f.api.pendingCount()).assertEqual(1);
      expect(f.clock.pendingCount()).assertEqual(1);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
      expect(f.service.snapshot().pending).assertTrue();
      expect(f.service.snapshot().errorCode).assertEqual('');
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].result).assertEqual('等待超时');
      f.clock.advance(8);
      f.api.resolveNext(false);
      await flushMicrotasks();
      expect(f.service.records().length).assertEqual(2);
      expect(f.service.records()[0].source).assertEqual(RefreshSource.SETTINGS);
      expect(f.service.records()[0].durationMillis).assertEqual(8);
      expect(f.service.records()[1].errorCode).assertEqual('TIMEOUT');
      expect(f.api.pendingCount()).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0700
     * @tc.name      testAutoStartupAdditionalBranches0007
     * @tc.desc      Verify throwing subscriber does not block other listeners or query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0007', 0, async () => {
      const f = fixture;
      let throwingCalls: number = 0;
      let observerCalls: number = 0;
      const unsubscribeThrowing = f.service.subscribe((): void => {
        throwingCalls++;
        throw new Error('page callback failure');
      });
      const unsubscribeObserver = f.service.subscribe((): void => { observerCalls++; });
      f.service.refresh(RefreshSource.INITIAL);
      expect(throwingCalls).assertEqual(1);
      expect(observerCalls).assertEqual(1);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
      f.api.resolveNext(true);
      await flushMicrotasks();
      expect(throwingCalls).assertEqual(2);
      expect(observerCalls).assertEqual(2);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
      expect(f.service.snapshot().errorCode).assertEqual('');
      expect(f.service.records().length).assertEqual(1);
      unsubscribeThrowing();
      unsubscribeThrowing();
      f.service.clearRecords();
      expect(throwingCalls).assertEqual(2);
      expect(observerCalls).assertEqual(3);
      expect(f.service.snapshot().value).assertTrue();
      unsubscribeObserver();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0800
     * @tc.name      testAutoStartupAdditionalBranches0008
     * @tc.desc      Verify subscription changes during notify respect snapshot and identity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0008', 0, () => {
      const f = fixture;
      let removedCalls: number = 0;
      let addedCalls: number = 0;
      let duplicateCalls: number = 0;
      let removeSecond: () => void = (): void => {};
      let removeAdded: () => void = (): void => {};
      let added: boolean = false;
      const removeFirst = f.service.subscribe((): void => {
        removeSecond();
        if (!added) {
          added = true;
          removeAdded = f.service.subscribe((): void => { addedCalls++; });
        }
      });
      removeSecond = f.service.subscribe((): void => { removedCalls++; });
      const duplicate = (): void => { duplicateCalls++; };
      const removeDuplicateOne = f.service.subscribe(duplicate);
      const removeDuplicateTwo = f.service.subscribe(duplicate);
      f.service.clearRecords();
      expect(removedCalls).assertEqual(0);
      expect(addedCalls).assertEqual(0);
      expect(duplicateCalls).assertEqual(2);
      removeFirst();
      removeDuplicateOne();
      removeDuplicateOne();
      f.service.clearRecords();
      expect(removedCalls).assertEqual(0);
      expect(addedCalls).assertEqual(1);
      expect(duplicateCalls).assertEqual(3);
      removeSecond();
      removeAdded();
      removeDuplicateTwo();
      f.service.clearRecords();
      expect(addedCalls).assertEqual(1);
      expect(duplicateCalls).assertEqual(3);
      expect(f.api.probeCalls).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_0900
     * @tc.name      testAutoStartupAdditionalBranches0009
     * @tc.desc      Verify probe801 maps to device unsupported without status call
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0009', 0, () => {
      const f = fixture;
      f.api.probeError = new TestBusinessError(801, 'capability unavailable');
      f.service.refresh(RefreshSource.INITIAL);
      const snapshot = f.service.snapshot();
      expect(snapshot.phase).assertEqual(QueryPhase.UNSUPPORTED);
      expect(snapshot.support).assertEqual(SupportState.UNSUPPORTED);
      expect(snapshot.supportResult).assertEqual('异常');
      expect(snapshot.statusResult).assertEqual('未调用');
      expect(snapshot.errorCode).assertEqual('801');
      expect(snapshot.errorMessage).assertEqual('capability unavailable');
      expect(snapshot.pending).assertFalse();
      expect(statusLabel(snapshot)).assertEqual('设备不支持');
      expect(f.api.probeCalls).assertEqual(1);
      expect(f.api.queryCalls).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].result).assertEqual('设备不支持');
      expect(f.service.records()[0].errorCode).assertEqual('801');
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1000
     * @tc.name      testAutoStartupAdditionalBranches0010
     * @tc.desc      Verify plain error without business code uses unknown and message
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0010', 0, async () => {
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(31);
      f.api.rejectNext(new Error('untyped native failure') as BusinessError);
      await flushMicrotasks();
      const snapshot = f.service.snapshot();
      expect(snapshot.phase).assertEqual(QueryPhase.FAILED);
      expect(snapshot.support).assertEqual(SupportState.SUPPORTED);
      expect(snapshot.supportResult).assertEqual('true');
      expect(snapshot.statusResult).assertEqual('UNKNOWN');
      expect(snapshot.errorCode).assertEqual('UNKNOWN');
      expect(snapshot.errorMessage).assertEqual('untyped native failure');
      expect(snapshot.pending).assertFalse();
      expect(f.service.records().length).assertEqual(1);
      expect(f.service.records()[0].result).assertEqual('查询失败');
      expect(f.service.records()[0].durationMillis).assertEqual(31);
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1100
     * @tc.name      testAutoStartupAdditionalBranches0011
     * @tc.desc      Verify null rejection uses safe unknown fallback and releases timer
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0011', 0, async () => {
      const api = new EmptyRejectionApi();
      const clock = new ManualQueryClock();
      const service = new AutoStartupService(api, clock);
      try {
        service.refresh(RefreshSource.INITIAL);
        expect(clock.pendingCount()).assertEqual(1);
        await flushMicrotasks();
        const snapshot = service.snapshot();
        expect(snapshot.phase).assertEqual(QueryPhase.FAILED);
        expect(snapshot.support).assertEqual(SupportState.SUPPORTED);
        expect(snapshot.errorCode).assertEqual('UNKNOWN');
        expect(snapshot.errorMessage).assertEqual('null');
        expect(snapshot.statusResult).assertEqual('UNKNOWN');
        expect(snapshot.pending).assertFalse();
        expect(api.probeCalls).assertEqual(1);
        expect(api.queryCalls).assertEqual(1);
        expect(clock.pendingCount()).assertEqual(0);
        expect(service.records().length).assertEqual(1);
        expect(service.records()[0].errorMessage).assertEqual('null');
      } finally {
        service.dispose();
        clock.clearAll();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1200
     * @tc.name      testAutoStartupAdditionalBranches0012
     * @tc.desc      Verify status presentation maps incomplete and terminal states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0012', 0, () => {
      const snapshot = new QuerySnapshot();
      expect(statusLabel(snapshot)).assertEqual('等待查询');
      snapshot.phase = QueryPhase.CHECKING;
      expect(statusLabel(snapshot)).assertEqual('正在查询');
      snapshot.phase = QueryPhase.QUERYING;
      expect(statusLabel(snapshot)).assertEqual('正在查询');
      snapshot.phase = QueryPhase.SUCCEEDED;
      expect(statusLabel(snapshot)).assertEqual('等待查询');
      snapshot.value = true;
      expect(statusLabel(snapshot)).assertEqual('本应用已开启');
      snapshot.value = false;
      expect(statusLabel(snapshot)).assertEqual('本应用未开启');
      snapshot.phase = QueryPhase.UNSUPPORTED;
      snapshot.support = SupportState.UNSUPPORTED;
      expect(statusLabel(snapshot)).assertEqual('设备不支持');
      snapshot.support = SupportState.SUPPORTED;
      expect(statusLabel(snapshot)).assertEqual('查询暂不可用');
      snapshot.phase = QueryPhase.FAILED;
      snapshot.support = SupportState.FAILED;
      expect(statusLabel(snapshot)).assertEqual('检测失败');
      snapshot.support = SupportState.SUPPORTED;
      expect(statusLabel(snapshot)).assertEqual('查询失败');
      snapshot.phase = QueryPhase.TIMEOUT;
      expect(statusLabel(snapshot)).assertEqual('查询超时');
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1300
     * @tc.name      testAutoStartupAdditionalBranches0013
     * @tc.desc      Verify metadata labels cover sources support and uncalled api results
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testAutoStartupAdditionalBranches0013', 0, () => {
      expect(sourceLabel(RefreshSource.INITIAL)).assertEqual('首次进入');
      expect(sourceLabel(RefreshSource.MANUAL)).assertEqual('手动刷新');
      expect(sourceLabel(RefreshSource.FOREGROUND)).assertEqual('返回前台');
      expect(sourceLabel(RefreshSource.SETTINGS)).assertEqual('设置后查询');
      expect(sourceLabel('UNRECOGNIZED' as RefreshSource)).assertEqual('查询');
      expect(supportLabel(SupportState.UNKNOWN)).assertEqual('待检测');
      expect(supportLabel(SupportState.SUPPORTED)).assertEqual('支持');
      expect(supportLabel(SupportState.UNSUPPORTED)).assertEqual('不支持');
      expect(supportLabel(SupportState.FAILED)).assertEqual('检测失败');
      expect(apiResultLabel('')).assertEqual('未调用');
      expect(apiResultLabel('待调用')).assertEqual('未调用');
      expect(apiResultLabel('true')).assertEqual('true');
      expect(apiResultLabel('false')).assertEqual('false');
      expect(apiResultLabel('调用中')).assertEqual('调用中');
      expect(apiResultLabel('801')).assertEqual('801');
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPADDITIONALBRANCHES_1400
     * @tc.name      testAutoStartupAdditionalBranches0014
     * @tc.desc      Verify query time uses local calendar padding and nonpositive sentinel
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupAdditionalBranches0014', 0, () => {
      expect(formatQueryTime(0)).assertEqual('未查询');
      expect(formatQueryTime(-1)).assertEqual('未查询');
      // Construct local wall-clock values, so assertions do not depend on device timezone.
      const padded = new Date(2026, 0, 2, 3, 4, 5).getTime();
      const unpadded = new Date(2026, 10, 12, 13, 24, 35).getTime();
      expect(formatQueryTime(padded)).assertEqual('01-02 03:04:05');
      expect(formatQueryTime(unpadded)).assertEqual('11-12 13:24:35');
    });
  });
}
