import { afterEach, describe, expect, it } from '@ohos/hypium';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import { NativeStatusSnapshot, SharedAutoStartupApi } from '../../../main/ets/autostart/AutoStartupRuntime';
import { QueryOutcome, QueryPhase, RefreshSource, SupportState } from '../../../main/ets/autostart/AutoStartupTypes';
import { AutoStartupProbePort, CapabilityDiagnostic,
  ProbeStage } from '../../../main/ets/autostart/diagnostics/CapabilityProbe';
import { RuntimeProbePort } from '../../../main/ets/autostart/diagnostics/DiagnosticRuntime';
import { CapabilityQuery, DeviceForm, SystemFlavor } from '../../../main/ets/autostart/rules/CapabilityMatrix';
import { StartupTelemetry } from '../../../main/ets/autostart/Telemetry';
import { ControlledAutoStartupApi, ManualQueryClock, TestBusinessError, flushMicrotasks } from '../support/TestSupport';

// Only platform responses and time are controlled here; all coordination is production code.
class ProbeGate {
  public promise: Promise<boolean>;
  public resolve: (value: boolean) => void = (): void => {};
  public reject: (error: Object | null) => void = (): void => {};
  constructor() {
    this.promise = new Promise<boolean>((resolve, reject): void => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}
class GatedProbePort implements AutoStartupProbePort {
  public abilityCalls: number = 0;
  public statusCalls: number = 0;
  public abilityError: Error | undefined = undefined;
  public statusError: Error | undefined = undefined;
  private abilities: ProbeGate[] = [];
  private statuses: ProbeGate[] = [];
  isSupported(): Promise<boolean> {
    this.abilityCalls++;
    if (this.abilityError !== undefined) {
      throw this.abilityError;
    }
    const gate = new ProbeGate(); this.abilities.push(gate); return gate.promise;
  }
  isEnabledForSelf(): Promise<boolean> {
    this.statusCalls++;
    if (this.statusError !== undefined) {
      throw this.statusError;
    }
    const gate = new ProbeGate(); this.statuses.push(gate); return gate.promise;
  }
  ability(value: boolean): void {
    const gate = this.abilities.shift();
    if (gate === undefined) {
      throw new Error('No pending ability response');
    }
    gate.resolve(value);
  }
  status(value: boolean): void {
    const gate = this.statuses.shift();
    if (gate === undefined) {
      throw new Error('No pending status response');
    }
    gate.resolve(value);
  }
  rejectAbility(error: Object | null): void {
    const gate = this.abilities.shift();
    if (gate === undefined) {
      throw new Error('No pending ability rejection');
    }
    gate.reject(error);
  }
  rejectStatus(error: Object | null): void {
    const gate = this.statuses.shift();
    if (gate === undefined) {
      throw new Error('No pending status rejection');
    }
    gate.reject(error);
  }
  finish(): void {
    this.abilities.forEach((gate: ProbeGate): void => {
      gate.resolve(false);
    });
    this.statuses.forEach((gate: ProbeGate): void => {
      gate.resolve(false);
    });
    this.abilities = []; this.statuses = [];
  }
}
class NumericProbeFailure {
  public code: number = 16000050;
  public message: number = 42;
}
class ProbeTrace implements StartupTelemetry {
  public starts: string[] = [];
  public ends: string[] = [];
  public throws: boolean = false;
  begin(operation: string, id: number): void {
    this.starts.push(`${operation}:${id}`);
    if (this.throws) {
      throw new Error('Trace begin unavailable');
    }
  }
  end(operation: string, id: number, outcome: string): void {
    this.ends.push(`${operation}:${id}:${outcome}`);
    if (this.throws) {
      throw new Error('Trace end unavailable');
    }
  }
  event(_operation: string, _id: number, _outcome: string): void {}
}
class DiagnosticFixture {
  public clock: ManualQueryClock = new ManualQueryClock();
  public port: GatedProbePort = new GatedProbePort();
  public trace: ProbeTrace = new ProbeTrace();
  public diagnostic: CapabilityDiagnostic = new CapabilityDiagnostic(this.port,
    (): number => this.clock.now(), 3000, this.clock, this.trace);
}
class SharedFixture {
  public clock: ManualQueryClock = new ManualQueryClock();
  public api: ControlledAutoStartupApi = new ControlledAutoStartupApi();
  public shared: SharedAutoStartupApi = new SharedAutoStartupApi(this.api, this.clock);
  public trace: ProbeTrace = new ProbeTrace();
  public service: AutoStartupService = new AutoStartupService(this.shared, this.clock, undefined, this.trace);
  public diagnostic: CapabilityDiagnostic;
  constructor(timeout: number = 3000) {
    this.diagnostic = new CapabilityDiagnostic(new RuntimeProbePort(this.shared),
      (): number => this.clock.now(), timeout, this.clock, this.trace);
  }
}

export default function startupNativeCoordinationWaveOneTest(): void {
  describe('StartupNativeCoordinationWaveOne', (): void => {
    const diagnosticFixtures: DiagnosticFixture[] = [];
    const sharedFixtures: SharedFixture[] = [];
    const diagnosticFixture = (): DiagnosticFixture => {
      const fixture = new DiagnosticFixture(); diagnosticFixtures.push(fixture); return fixture;
    };
    const sharedFixture = (timeout: number = 3000): SharedFixture => {
      const fixture = new SharedFixture(timeout); sharedFixtures.push(fixture); return fixture;
    };
    afterEach(async (): Promise<void> => {
      diagnosticFixtures.forEach((f: DiagnosticFixture): void => {
        f.diagnostic.dispose(); f.port.finish(); f.clock.clearAll();
      });
      sharedFixtures.forEach((f: SharedFixture): void => {
        f.diagnostic.dispose(); f.service.dispose(); f.api.finishPending(); f.clock.clearAll();
      });
      await flushMicrotasks();
      diagnosticFixtures.splice(0, diagnosticFixtures.length);
      sharedFixtures.splice(0, sharedFixtures.length);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0100
     * @tc.name testStartupNativeCoordinationWaveOne0001
     * @tc.desc 并发状态调用共用一个原生请求并记录加入次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0001', 0, async (): Promise<void> => {
      const f = sharedFixture();
      const first = f.shared.getAutoStartupStatusForSelf();
      const joined = f.shared.getAutoStartupStatusForSelf();
      expect(first === joined).assertTrue();
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.shared.nativeStatus().joins).assertEqual(1);
      expect(f.shared.nativeStatus().pending).assertTrue();
      f.api.resolveNext(true);
      expect(await first).assertTrue();
      expect(await joined).assertTrue();
      expect(f.shared.nativeStatus().pending).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0200
     * @tc.name testStartupNativeCoordinationWaveOne0002
     * @tc.desc 原生成功释放后下一次请求重新计时并清空加入计数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0002', 0, async (): Promise<void> => {
      const f = sharedFixture(); const started = f.clock.now();
      const first = f.shared.getAutoStartupStatusForSelf(); f.shared.getAutoStartupStatusForSelf();
      f.clock.advance(7); f.api.resolveNext(true); await first;
      expect(f.shared.nativeStatus().finishedAt).assertEqual(started + 7);
      f.clock.advance(9); const next = f.shared.getAutoStartupStatusForSelf();
      const running = f.shared.nativeStatus();
      expect(running.requestId).assertEqual(2);
      expect(running.startedAt).assertEqual(started + 16);
      expect(running.finishedAt).assertEqual(0);
      expect(running.joins).assertEqual(0);
      f.api.resolveNext(false); expect(await next).assertFalse();
      expect(f.api.queryCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0300
     * @tc.name testStartupNativeCoordinationWaveOne0003
     * @tc.desc 原生拒绝传给每个等待者且释放后允许新请求
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0003', 0, async (): Promise<void> => {
      const f = sharedFixture(); const failures: Object[] = [];
      const first = f.shared.getAutoStartupStatusForSelf().catch((error: Object): boolean => {
        failures.push(error); return false;
      });
      const joined = f.shared.getAutoStartupStatusForSelf().catch((error: Object): boolean => {
        failures.push(error); return false;
      });
      const error = new TestBusinessError(16000050, 'native denied');
      f.clock.advance(13); f.api.rejectNext(error); await first; await joined;
      expect(failures[0] === error).assertTrue();
      expect(failures[1] === error).assertTrue();
      expect(f.shared.nativeStatus().pending).assertFalse();
      expect(f.shared.nativeStatus().finishedAt).assertEqual(f.clock.now());
      const retry = f.shared.getAutoStartupStatusForSelf(); f.api.resolveNext(true);
      expect(await retry).assertTrue(); expect(f.api.queryCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0400
     * @tc.name testStartupNativeCoordinationWaveOne0004
     * @tc.desc 原生同步异常释放共享位置并保留下一次请求编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0004', 0, async (): Promise<void> => {
      const f = sharedFixture(); const error = new TestBusinessError(801, 'sync unsupported');
      f.api.queryError = error; const failures: Object[] = [];
      try {
        f.shared.getAutoStartupStatusForSelf();
      } catch (caught) {
        failures.push(caught as Object);
      }
      expect(failures[0] === error).assertTrue();
      expect(f.shared.nativeStatus().pending).assertFalse();
      expect(f.shared.nativeStatus().finishedAt).assertEqual(f.clock.now());
      f.api.queryError = null; const retry = f.shared.getAutoStartupStatusForSelf();
      expect(f.shared.nativeStatus().requestId).assertEqual(2);
      f.api.resolveNext(false); expect(await retry).assertFalse();
      expect(f.api.queryCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0500
     * @tc.name testStartupNativeCoordinationWaveOne0005
     * @tc.desc 状态请求挂起时能力返回不支持不会占用或释放状态位置
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0005', 0, async (): Promise<void> => {
      const f = sharedFixture(); const status = f.shared.getAutoStartupStatusForSelf();
      f.api.supported = false;
      expect(f.shared.isAutoStartupSupported()).assertFalse();
      expect(f.api.probeCalls).assertEqual(1);
      expect(f.shared.nativeStatus().joins).assertEqual(0);
      expect(f.shared.nativeStatus().pending).assertTrue();
      f.api.resolveNext(true); expect(await status).assertTrue();
      expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0600
     * @tc.name testStartupNativeCoordinationWaveOne0006
     * @tc.desc 能力检测抛错不影响已经挂起的共享状态请求
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0006', 0, async (): Promise<void> => {
      const f = sharedFixture(); const status = f.shared.getAutoStartupStatusForSelf();
      const error = new TestBusinessError(16000050, 'capability unavailable'); f.api.probeError = error;
      const failures: Object[] = [];
      try {
        f.shared.isAutoStartupSupported();
      } catch (caught) {
        failures.push(caught as Object);
      }
      expect(failures[0] === error).assertTrue();
      expect(f.shared.nativeStatus().pending).assertTrue();
      expect(f.shared.nativeStatus().requestId).assertEqual(1);
      f.api.resolveNext(false); expect(await status).assertFalse();
      expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0700
     * @tc.name testStartupNativeCoordinationWaveOne0007
     * @tc.desc 修改原生状态快照不能污染共享位置的计数和时间
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0007', 0, async (): Promise<void> => {
      const f = sharedFixture(); const started = f.clock.now();
      const request = f.shared.getAutoStartupStatusForSelf();
      const copy: NativeStatusSnapshot = f.shared.nativeStatus();
      copy.pending = false; copy.requestId = 99; copy.joins = 50; copy.startedAt = 0;
      const actual = f.shared.nativeStatus();
      expect(actual.pending).assertTrue(); expect(actual.requestId).assertEqual(1);
      expect(actual.joins).assertEqual(0); expect(actual.startedAt).assertEqual(started);
      f.clock.advance(5); f.api.resolveNext(true); await request;
      copy.finishedAt = -1;
      expect(f.shared.nativeStatus().finishedAt).assertEqual(started + 5);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0800
     * @tc.name testStartupNativeCoordinationWaveOne0008
     * @tc.desc 共享位置观察者异常不会阻断其他观察者或原生完成
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0008', 0, async (): Promise<void> => {
      const f = sharedFixture(); let badCalls = 0; const observed: string[] = [];
      const offBad = f.shared.subscribe((): void => {
        badCalls++;
        throw new Error('observer failed');
      });
      const offGood = f.shared.subscribe((): void => {
        const state = f.shared.nativeStatus(); observed.push(`${state.pending}:${state.joins}`);
      });
      const request = f.shared.getAutoStartupStatusForSelf(); f.shared.getAutoStartupStatusForSelf();
      f.api.resolveNext(true); expect(await request).assertTrue();
      expect(observed.join(',')).assertEqual('true:0,true:1,false:1');
      expect(badCalls).assertEqual(3); expect(f.api.queryCalls).assertEqual(1);
      offBad(); offGood();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_0900
     * @tc.name testStartupNativeCoordinationWaveOne0009
     * @tc.desc 共享状态观察者退订后不再接收加入和完成事件
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0009', 0, async (): Promise<void> => {
      const f = sharedFixture(); let removed = 0; const retained: boolean[] = [];
      const off = f.shared.subscribe((): void => {
        removed++;
      });
      const offRetained = f.shared.subscribe((): void => {
        retained.push(f.shared.nativeStatus().pending);
      });
      const request = f.shared.getAutoStartupStatusForSelf(); off(); off();
      f.shared.getAutoStartupStatusForSelf(); f.api.resolveNext(false); await request;
      expect(removed).assertEqual(1);
      expect(retained.join(',')).assertEqual('true,true,false');
      expect(f.shared.nativeStatus().joins).assertEqual(1);
      expect(f.api.queryCalls).assertEqual(1); offRetained();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1000
     * @tc.name testStartupNativeCoordinationWaveOne0010
     * @tc.desc 完成通知中开启下一请求不会被上一请求的完成清空
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0010', 0, async (): Promise<void> => {
      const f = sharedFixture(); const next: Promise<boolean>[] = [];
      const off = f.shared.subscribe((): void => {
        const state = f.shared.nativeStatus();
        if (!state.pending && state.requestId === 1) {
          next.push(f.shared.getAutoStartupStatusForSelf());
        }
      });
      const first = f.shared.getAutoStartupStatusForSelf(); f.api.resolveNext(true);
      expect(await first).assertTrue();
      expect(f.api.queryCalls).assertEqual(2);
      expect(f.shared.nativeStatus().requestId).assertEqual(2);
      expect(f.shared.nativeStatus().pending).assertTrue();
      f.api.resolveNext(false); expect(await next[0]).assertFalse();
      expect(f.shared.nativeStatus().pending).assertFalse(); off();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1100
     * @tc.name testStartupNativeCoordinationWaveOne0011
     * @tc.desc 状态诊断运行中请求能力诊断只返回能力快照
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0011', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const status = f.diagnostic.runStatusProbe();
      const blocked = await f.diagnostic.runAbilityProbe();
      expect(blocked.stage).assertEqual(ProbeStage.IDLE);
      expect(f.port.abilityCalls).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(1);
      f.port.status(true); expect((await status).stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(f.port.statusCalls).assertEqual(1);
      expect(f.diagnostic.isRunning()).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1200
     * @tc.name testStartupNativeCoordinationWaveOne0012
     * @tc.desc 能力诊断挂起时阻止状态调用并在结束后允许独立查询
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0012', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const ability = f.diagnostic.runAbilityProbe();
      const blocked = await f.diagnostic.runStatusProbe();
      expect(blocked.stage).assertEqual(ProbeStage.IDLE);
      expect(f.port.statusCalls).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(1);
      f.port.ability(true); expect((await ability).conclusion).assertEqual('设备能力检测返回支持');
      const status = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect((await status).value).assertFalse(); expect(f.port.statusCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1300
     * @tc.name testStartupNativeCoordinationWaveOne0013
     * @tc.desc 状态诊断在三秒边界超时且迟到拒绝只释放原生位置
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0013', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(2999); expect(f.diagnostic.reportSnapshot().status.stage).assertEqual(ProbeStage.RUNNING);
      f.clock.advance(1); const timed = await request;
      expect(timed.elapsedMillis).assertEqual(3000);
      expect(timed.stage).assertEqual(ProbeStage.TIMEOUT);
      await f.diagnostic.runStatusProbe(); expect(f.port.statusCalls).assertEqual(1);
      f.port.rejectStatus(new TestBusinessError(801, 'late unsupported')); await flushMicrotasks();
      expect(f.diagnostic.reportSnapshot().status.errorCode).assertEqual('TIMEOUT');
      expect(f.diagnostic.isRunning()).assertFalse();
      const retry = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect((await retry).value).assertFalse(); expect(f.port.statusCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1400
     * @tc.name testStartupNativeCoordinationWaveOne0014
     * @tc.desc 能力诊断真实超时后组合入口不会越过尚未结束的调用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0014', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runAbilityProbe();
      f.clock.advance(3000); expect((await request).stage).assertEqual(ProbeStage.TIMEOUT);
      const blocked = await f.diagnostic.runAll();
      expect(blocked.status.stage).assertEqual(ProbeStage.IDLE);
      expect(f.port.statusCalls).assertEqual(0);
      expect(f.diagnostic.isRunning()).assertTrue();
      f.port.ability(true); await flushMicrotasks();
      expect(f.diagnostic.reportSnapshot().ability.stage).assertEqual(ProbeStage.TIMEOUT);
      const retry = f.diagnostic.runAbilityProbe(); f.port.ability(false);
      expect((await retry).stage).assertEqual(ProbeStage.UNSUPPORTED);
      expect(f.port.abilityCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1500
     * @tc.name testStartupNativeCoordinationWaveOne0015
     * @tc.desc 状态端口同步抛出不支持错误时取消计时并释放诊断
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0015', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); f.port.statusError = new TestBusinessError(801, 'sync unavailable');
      const result = await f.diagnostic.runStatusProbe();
      expect(result.stage).assertEqual(ProbeStage.UNSUPPORTED);
      expect(result.errorMessage).assertEqual('sync unavailable');
      expect(result.unsupportedEvidence).assertTrue();
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.diagnostic.isRunning()).assertFalse();
      expect(f.trace.ends.join(',')).assertEqual('diagnostic_status:1:unsupported');
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1600
     * @tc.name testStartupNativeCoordinationWaveOne0016
     * @tc.desc 能力端口同步普通异常保留消息而不推断为未开启
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0016', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); f.port.abilityError = new Error('plain capability error');
      const result = await f.diagnostic.runAbilityProbe();
      expect(result.stage).assertEqual(ProbeStage.FAILED);
      expect(result.errorCode).assertEqual('UNKNOWN');
      expect(result.errorMessage).assertEqual('plain capability error');
      expect(result.value).assertNull(); expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.port.statusCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1700
     * @tc.name testStartupNativeCoordinationWaveOne0017
     * @tc.desc 状态诊断拒绝空载荷时提供未知错误并保留真实耗时
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0017', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(19); f.port.rejectStatus(null); const result = await request;
      expect(result.errorCode).assertEqual('UNKNOWN');
      expect(result.errorMessage).assertEqual('未提供错误信息');
      expect(result.elapsedMillis).assertEqual(19);
      expect(result.stage).assertEqual(ProbeStage.FAILED);
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1800
     * @tc.name testStartupNativeCoordinationWaveOne0018
     * @tc.desc 数字错误载荷被转换为可显示文本且不丢失错误分类
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0018', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(23); f.port.rejectStatus(new NumericProbeFailure()); const result = await request;
      expect(result.errorCode).assertEqual('16000050');
      expect(result.errorMessage).assertEqual('42');
      expect(result.elapsedMillis).assertEqual(23);
      expect(result.stage).assertEqual(ProbeStage.FAILED);
      expect(f.diagnostic.isRunning()).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_1900
     * @tc.name testStartupNativeCoordinationWaveOne0019
     * @tc.desc 原生诊断错误消息超过二百字符时截断但保留错误和计时
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0019', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(29); f.port.rejectStatus(new TestBusinessError(16000050, 'x'.repeat(200) + '尾'));
      const result = await request;
      expect(result.errorMessage).assertEqual('x'.repeat(200));
      expect(result.errorCode).assertEqual('16000050');
      expect(result.elapsedMillis).assertEqual(29);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.trace.ends.join(',')).assertEqual('diagnostic_status:1:failed');
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2000
     * @tc.name testStartupNativeCoordinationWaveOne0020
     * @tc.desc 修改诊断返回结果不改变报告且下一次请求独立执行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0020', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(11); f.port.status(true); const result = await request;
      result.stage = ProbeStage.FAILED; result.value = false; result.errorCode = 'changed'; result.elapsedMillis = 999;
      const retained = f.diagnostic.reportSnapshot().status;
      expect(retained.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(retained.value).assertTrue(); expect(retained.errorCode).assertEqual('0');
      expect(retained.elapsedMillis).assertEqual(11);
      const retry = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect((await retry).value).assertFalse(); expect(f.port.statusCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2100
     * @tc.name testStartupNativeCoordinationWaveOne0021
     * @tc.desc 修改报告快照中的查询和两个结果不会改变内部诊断报告
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0021', 0, async (): Promise<void> => {
      const f = diagnosticFixture();
      f.diagnostic.configure(new CapabilityQuery(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY));
      const all = f.diagnostic.runAll(); f.port.ability(true); await flushMicrotasks();
      f.port.status(false); await all;
      const snapshot = f.diagnostic.reportSnapshot();
      snapshot.query.apiLevel = 1; snapshot.ability.value = false; snapshot.status.errorCode = 'mutated';
      snapshot.status.stage = ProbeStage.FAILED;
      const retained = f.diagnostic.reportSnapshot();
      expect(retained.query.apiLevel).assertEqual(18);
      expect(retained.ability.value).assertTrue();
      expect(retained.status.errorCode).assertEqual('0');
      expect(retained.status.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(retained.consistent).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2200
     * @tc.name testStartupNativeCoordinationWaveOne0022
     * @tc.desc 组合诊断能力失败后仍顺序执行独立状态查询
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0022', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      expect(f.port.statusCalls).assertEqual(0);
      f.port.rejectAbility(new TestBusinessError(16000050, 'ability failed')); await flushMicrotasks();
      expect(f.port.statusCalls).assertEqual(1);
      expect(f.diagnostic.reportSnapshot().status.stage).assertEqual(ProbeStage.RUNNING);
      f.port.status(true); const report = await request;
      expect(report.ability.errorCode).assertEqual('16000050');
      expect(report.status.value).assertTrue(); expect(report.consistent).assertFalse();
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2300
     * @tc.name testStartupNativeCoordinationWaveOne0023
     * @tc.desc 组合诊断能力超时结束可见等待但不自动启动状态调用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0023', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      f.clock.advance(3000); const report = await request;
      expect(report.ability.stage).assertEqual(ProbeStage.TIMEOUT);
      expect(f.port.statusCalls).assertEqual(0);
      expect(f.diagnostic.isRunning()).assertTrue();
      f.port.rejectAbility(new Error('late failure')); await flushMicrotasks();
      expect(f.diagnostic.reportSnapshot().ability.errorCode).assertEqual('TIMEOUT');
      expect(f.diagnostic.isRunning()).assertFalse();
      const retry = f.diagnostic.runAll(); f.port.ability(true); await flushMicrotasks();
      f.port.status(false); expect((await retry).status.value).assertFalse();
      expect(f.port.abilityCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2400
     * @tc.name testStartupNativeCoordinationWaveOne0024
     * @tc.desc 组合诊断在能力等待中离开页面后不再启动状态查询
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0024', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      f.clock.advance(17); f.diagnostic.dispose(); const report = await request;
      expect(report.ability.stage).assertEqual(ProbeStage.IDLE);
      expect(f.port.statusCalls).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.diagnostic.isRunning()).assertTrue();
      f.port.ability(true); await flushMicrotasks();
      expect(f.diagnostic.reportSnapshot().headline).assertEqual('尚未诊断');
      expect(f.diagnostic.isRunning()).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2500
     * @tc.name testStartupNativeCoordinationWaveOne0025
     * @tc.desc 组合诊断第二阶段离开页面后迟到错误不回填已重置报告
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0025', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      f.port.ability(true); await flushMicrotasks();
      expect(f.diagnostic.reportSnapshot().ability.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(f.port.statusCalls).assertEqual(1);
      f.diagnostic.dispose(); const report = await request;
      expect(report.status.stage).assertEqual(ProbeStage.IDLE);
      expect(f.clock.pendingCount()).assertEqual(0);
      f.port.rejectStatus(new TestBusinessError(801, 'late status')); await flushMicrotasks();
      expect(f.diagnostic.reportSnapshot().status.errorCode).assertEqual('');
      expect(f.diagnostic.isRunning()).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2600
     * @tc.name testStartupNativeCoordinationWaveOne0026
     * @tc.desc 状态等待中离开页面取消可见等待但重入须等原生调用结束
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0026', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(31); f.diagnostic.dispose(); const cancelled = await request;
      expect(cancelled.errorCode).assertEqual('CANCELLED');
      expect(cancelled.elapsedMillis).assertEqual(31);
      expect(f.diagnostic.isRunning()).assertTrue();
      expect((await f.diagnostic.runStatusProbe()).stage).assertEqual(ProbeStage.IDLE);
      expect(f.port.statusCalls).assertEqual(1);
      f.port.status(true); await flushMicrotasks();
      const retry = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect((await retry).value).assertFalse(); expect(f.port.statusCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2700
     * @tc.name testStartupNativeCoordinationWaveOne0027
     * @tc.desc 重复离开页面只终结一次诊断等待且迟到成功不会再次终结
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0027', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.diagnostic.dispose(); f.diagnostic.dispose();
      expect((await request).errorCode).assertEqual('CANCELLED');
      expect(f.trace.ends.join(',')).assertEqual('diagnostic_status:1:failed');
      expect(f.clock.pendingCount()).assertEqual(0);
      f.port.status(true); await flushMicrotasks();
      expect(f.trace.ends.length).assertEqual(1);
      expect(f.diagnostic.reportSnapshot().status.value).assertNull();
      expect(f.diagnostic.isRunning()).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2800
     * @tc.name testStartupNativeCoordinationWaveOne0028
     * @tc.desc 诊断观察者抛错不阻断完成且退订者不再收到通知
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0028', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); let badCalls = 0; const observed: ProbeStage[] = [];
      const offBad = f.diagnostic.subscribe((): void => {
        badCalls++;
        throw new Error('diagnostic observer');
      });
      const off = f.diagnostic.subscribe((): void => {
        observed.push(f.diagnostic.reportSnapshot().status.stage);
      });
      const request = f.diagnostic.runStatusProbe(); f.port.status(true);
      expect((await request).stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(observed.join(',')).assertEqual('running,succeeded,succeeded');
      off(); off(); offBad();
      const next = f.diagnostic.runStatusProbe(); f.port.status(false); await next;
      expect(observed.length).assertEqual(3);
      expect(badCalls).assertEqual(3);
      expect(f.port.statusCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_2900
     * @tc.name testStartupNativeCoordinationWaveOne0029
     * @tc.desc 诊断开始和结束采集器均异常时查询结果与计时清理仍正常
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0029', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); f.trace.throws = true;
      const request = f.diagnostic.runStatusProbe(); f.clock.advance(37); f.port.status(true);
      const result = await request;
      expect(result.stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(result.elapsedMillis).assertEqual(37);
      expect(f.trace.starts.join(',')).assertEqual('diagnostic_status:1');
      expect(f.trace.ends.join(',')).assertEqual('diagnostic_status:1:succeeded');
      expect(f.clock.pendingCount()).assertEqual(0);
      expect(f.diagnostic.reportSnapshot().status.errorCode).assertEqual('0');
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3000
     * @tc.name testStartupNativeCoordinationWaveOne0030
     * @tc.desc 超时只结束一次采集并在迟到拒绝释放后使用新序号重试
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0030', 0, async (): Promise<void> => {
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(3000); expect((await request).errorCode).assertEqual('TIMEOUT');
      expect(f.trace.ends.join(',')).assertEqual('diagnostic_status:1:timeout');
      f.port.rejectStatus(new Error('after deadline')); await flushMicrotasks();
      expect(f.trace.ends.length).assertEqual(1);
      const retry = f.diagnostic.runStatusProbe(); f.port.status(true); await retry;
      expect(f.trace.starts.join(',')).assertEqual('diagnostic_status:1,diagnostic_status:2');
      expect(f.trace.ends[1]).assertEqual('diagnostic_status:2:succeeded');
      expect(f.diagnostic.reportSnapshot().status.value).assertTrue();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3100
     * @tc.name testStartupNativeCoordinationWaveOne0031
     * @tc.desc 普通服务先查询后独立诊断加入同一原生请求并各自保存结果
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0031', 0, async (): Promise<void> => {
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe();
      expect(f.api.queryCalls).assertEqual(1);
      expect(f.shared.nativeStatus().joins).assertEqual(1);
      f.clock.advance(41); f.api.resolveNext(true); const result = await diagnostic; await flushMicrotasks();
      expect(result.value).assertTrue(); expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
      expect(f.service.records()[0].durationMillis).assertEqual(41);
      expect(f.service.records()[0].outcome).assertEqual(QueryOutcome.SUCCESS);
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3200
     * @tc.name testStartupNativeCoordinationWaveOne0032
     * @tc.desc 诊断先查询后普通服务加入同一请求且未开启结果不变成失败
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0032', 0, async (): Promise<void> => {
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.service.refresh(RefreshSource.MANUAL); f.api.resolveNext(false);
      expect((await diagnostic).value).assertFalse(); await flushMicrotasks();
      expect(f.service.records()[0].source).assertEqual(RefreshSource.MANUAL);
      expect(f.service.records()[0].result).assertEqual('未开启');
      expect(f.shared.nativeStatus().joins).assertEqual(1);
      expect(f.shared.nativeStatus().pending).assertFalse();
      expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3300
     * @tc.name testStartupNativeCoordinationWaveOne0033
     * @tc.desc 诊断先超时而共享原生四秒完成时普通服务仍可成功
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0033', 0, async (): Promise<void> => {
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe(); f.clock.advance(3000);
      expect((await diagnostic).stage).assertEqual(ProbeStage.TIMEOUT);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
      expect(f.shared.nativeStatus().pending).assertTrue();
      f.clock.advance(1000); f.api.resolveNext(true); await flushMicrotasks();
      expect(f.service.records()[0].durationMillis).assertEqual(4000);
      expect(f.service.records()[0].outcome).assertEqual(QueryOutcome.SUCCESS);
      expect(f.diagnostic.reportSnapshot().status.errorCode).assertEqual('TIMEOUT');
      expect(f.shared.nativeStatus().pending).assertFalse(); expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3400
     * @tc.name testStartupNativeCoordinationWaveOne0034
     * @tc.desc 普通服务先超时后较长等待的诊断仍接受同一原生成功
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0034', 0, async (): Promise<void> => {
      const f = sharedFixture(7000); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe(); f.clock.advance(5000);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.TIMEOUT);
      expect(f.diagnostic.reportSnapshot().status.stage).assertEqual(ProbeStage.RUNNING);
      f.clock.advance(1000); f.api.resolveNext(false);
      const result = await diagnostic; await flushMicrotasks();
      expect(result.stage).assertEqual(ProbeStage.SUCCEEDED); expect(result.elapsedMillis).assertEqual(6000);
      expect(f.service.records()[0].outcome).assertEqual(QueryOutcome.TIMEOUT);
      expect(f.service.records()[0].durationMillis).assertEqual(5000);
      expect(f.api.queryCalls).assertEqual(1); expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3500
     * @tc.name testStartupNativeCoordinationWaveOne0035
     * @tc.desc 普通服务离开页面不会取消同一原生请求上的独立诊断
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0035', 0, async (): Promise<void> => {
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe(); f.service.dispose();
      expect(f.clock.pendingCount()).assertEqual(1);
      expect(f.shared.nativeStatus().pending).assertTrue();
      f.api.resolveNext(true); expect((await diagnostic).value).assertTrue(); await flushMicrotasks();
      expect(f.service.records().length).assertEqual(0);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.IDLE);
      expect(f.shared.nativeStatus().pending).assertFalse(); expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3600
     * @tc.name testStartupNativeCoordinationWaveOne0036
     * @tc.desc 诊断离开页面只取消自身等待不会取消普通服务查询
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0036', 0, async (): Promise<void> => {
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.service.refresh(RefreshSource.INITIAL); f.diagnostic.dispose();
      expect((await diagnostic).errorCode).assertEqual('CANCELLED');
      expect(f.clock.pendingCount()).assertEqual(1);
      f.api.resolveNext(false); await flushMicrotasks();
      expect(f.service.records()[0].result).assertEqual('未开启');
      expect(f.diagnostic.reportSnapshot().status.stage).assertEqual(ProbeStage.IDLE);
      expect(f.shared.nativeStatus().pending).assertFalse(); expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3700
     * @tc.name testStartupNativeCoordinationWaveOne0037
     * @tc.desc 服务能力不支持时独立状态诊断仍可通过共享入口查询
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0037', 0, async (): Promise<void> => {
      const f = sharedFixture(); f.api.supported = false; f.service.refresh(RefreshSource.INITIAL);
      expect(f.api.queryCalls).assertEqual(0);
      const diagnostic = f.diagnostic.runStatusProbe(); f.api.resolveNext(true);
      expect((await diagnostic).stage).assertEqual(ProbeStage.SUCCEEDED);
      expect(f.service.snapshot().support).assertEqual(SupportState.UNSUPPORTED);
      expect(f.service.records()[0].outcome).assertEqual(QueryOutcome.UNSUPPORTED);
      expect(f.shared.nativeStatus().joins).assertEqual(0); expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3800
     * @tc.name testStartupNativeCoordinationWaveOne0038
     * @tc.desc 共享原生不支持错误同时分发到服务和诊断且保留成功能力检测
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0038', 0, async (): Promise<void> => {
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe();
      f.api.rejectNext(new TestBusinessError(801, 'status unavailable'));
      expect((await diagnostic).stage).assertEqual(ProbeStage.UNSUPPORTED); await flushMicrotasks();
      expect(f.service.snapshot().support).assertEqual(SupportState.SUPPORTED);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.UNSUPPORTED);
      expect(f.service.records()[0].result).assertEqual('查询不支持');
      expect(f.api.queryCalls).assertEqual(1); expect(f.shared.nativeStatus().pending).assertFalse();
      expect(f.clock.pendingCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_3900
     * @tc.name testStartupNativeCoordinationWaveOne0039
     * @tc.desc 诊断状态挂起时普通服务能力异常不会破坏已有独立查询
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0039', 0, async (): Promise<void> => {
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.api.probeError = new TestBusinessError(16000050, 'capability failed'); f.service.refresh(RefreshSource.INITIAL);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.FAILED);
      expect(f.service.snapshot().support).assertEqual(SupportState.FAILED);
      expect(f.shared.nativeStatus().pending).assertTrue(); expect(f.shared.nativeStatus().joins).assertEqual(0);
      f.api.resolveNext(false); expect((await diagnostic).value).assertFalse();
      expect(f.api.queryCalls).assertEqual(1); expect(f.shared.nativeStatus().pending).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_NATIVECOORDINATIONWAVEONE_4000
     * @tc.name testStartupNativeCoordinationWaveOne0040
     * @tc.desc 诊断可见超时后新进入的普通服务仍加入尚未结束的原生调用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupNativeCoordinationWaveOne0040', 0, async (): Promise<void> => {
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.clock.advance(3000); expect((await diagnostic).stage).assertEqual(ProbeStage.TIMEOUT);
      f.clock.advance(100); f.service.refresh(RefreshSource.MANUAL);
      expect(f.api.queryCalls).assertEqual(1); expect(f.shared.nativeStatus().joins).assertEqual(1);
      f.clock.advance(100); f.api.resolveNext(true); await flushMicrotasks();
      expect(f.service.records()[0].durationMillis).assertEqual(100);
      expect(f.service.snapshot().value).assertTrue();
      expect(f.diagnostic.reportSnapshot().status.errorCode).assertEqual('TIMEOUT');
      expect(f.shared.nativeStatus().pending).assertFalse();
    });
  });
}
