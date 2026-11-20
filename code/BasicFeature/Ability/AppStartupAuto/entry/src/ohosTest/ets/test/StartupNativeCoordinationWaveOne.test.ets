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
  configureTestText();
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
      configureTestText();
      const f = sharedFixture();
      const first = f.shared.getAutoStartupStatusForSelf();
      const joined = f.shared.getAutoStartupStatusForSelf();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0001|assertTrue|actual|expected=true', first === joined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0002|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0002|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0003|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0003|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0004|assertTrue|actual|expected=true', f.shared.nativeStatus().pending)).assertTrue();
      f.api.resolveNext(true);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0005|assertTrue|actual|expected=true', await first)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0006|assertTrue|actual|expected=true', await joined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0001|StartupNativeCoordinationWaveOne.test.ets|assert0007|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse();
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
      configureTestText();
      const f = sharedFixture(); const started = f.clock.now();
      const first = f.shared.getAutoStartupStatusForSelf(); f.shared.getAutoStartupStatusForSelf();
      f.clock.advance(7); f.api.resolveNext(true); await first;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0008|assertEqual|actual', f.shared.nativeStatus().finishedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0008|assertEqual|expected', started + 7));
      f.clock.advance(9); const next = f.shared.getAutoStartupStatusForSelf();
      const running = f.shared.nativeStatus();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0009|assertEqual|actual', running.requestId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0009|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0010|assertEqual|actual', running.startedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0010|assertEqual|expected', started + 16));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0011|assertEqual|actual', running.finishedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0011|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0012|assertEqual|actual', running.joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0012|assertEqual|expected', 0));
      f.api.resolveNext(false); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0013|assertFalse|actual|expected=false', await next)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0014|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0002|StartupNativeCoordinationWaveOne.test.ets|assert0014|assertEqual|expected', 2));
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
      configureTestText();
      const f = sharedFixture(); const failures: Object[] = [];
      const first = f.shared.getAutoStartupStatusForSelf().catch((error: Object): boolean => {
        failures.push(error); return false;
      });
      const joined = f.shared.getAutoStartupStatusForSelf().catch((error: Object): boolean => {
        failures.push(error); return false;
      });
      const error = new TestBusinessError(16000050, 'native denied');
      f.clock.advance(13); f.api.rejectNext(error); await first; await joined;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0015|assertTrue|actual|expected=true', failures[0] === error)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0016|assertTrue|actual|expected=true', failures[1] === error)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0017|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0018|assertEqual|actual', f.shared.nativeStatus().finishedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0018|assertEqual|expected', f.clock.now()));
      const retry = f.shared.getAutoStartupStatusForSelf(); f.api.resolveNext(true);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0019|assertTrue|actual|expected=true', await retry)).assertTrue(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0020|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0003|StartupNativeCoordinationWaveOne.test.ets|assert0020|assertEqual|expected', 2));
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
      configureTestText();
      const f = sharedFixture(); const error = new TestBusinessError(801, 'sync unsupported');
      f.api.queryError = error; const failures: Object[] = [];
      try {
        f.shared.getAutoStartupStatusForSelf();
      } catch (caught) {
        failures.push(caught as Object);
      }
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0021|assertTrue|actual|expected=true', failures[0] === error)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0022|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0023|assertEqual|actual', f.shared.nativeStatus().finishedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0023|assertEqual|expected', f.clock.now()));
      f.api.queryError = null; const retry = f.shared.getAutoStartupStatusForSelf();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0024|assertEqual|actual', f.shared.nativeStatus().requestId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0024|assertEqual|expected', 2));
      f.api.resolveNext(false); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0025|assertFalse|actual|expected=false', await retry)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0026|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0004|StartupNativeCoordinationWaveOne.test.ets|assert0026|assertEqual|expected', 2));
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
      configureTestText();
      const f = sharedFixture(); const status = f.shared.getAutoStartupStatusForSelf();
      f.api.supported = false;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0027|assertFalse|actual|expected=false', f.shared.isAutoStartupSupported())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0028|assertEqual|actual', f.api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0028|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0029|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0029|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0030|assertTrue|actual|expected=true', f.shared.nativeStatus().pending)).assertTrue();
      f.api.resolveNext(true); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0031|assertTrue|actual|expected=true', await status)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0032|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0005|StartupNativeCoordinationWaveOne.test.ets|assert0032|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(); const status = f.shared.getAutoStartupStatusForSelf();
      const error = new TestBusinessError(16000050, 'capability unavailable'); f.api.probeError = error;
      const failures: Object[] = [];
      try {
        f.shared.isAutoStartupSupported();
      } catch (caught) {
        failures.push(caught as Object);
      }
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0006|StartupNativeCoordinationWaveOne.test.ets|assert0033|assertTrue|actual|expected=true', failures[0] === error)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0006|StartupNativeCoordinationWaveOne.test.ets|assert0034|assertTrue|actual|expected=true', f.shared.nativeStatus().pending)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0006|StartupNativeCoordinationWaveOne.test.ets|assert0035|assertEqual|actual', f.shared.nativeStatus().requestId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0006|StartupNativeCoordinationWaveOne.test.ets|assert0035|assertEqual|expected', 1));
      f.api.resolveNext(false); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0006|StartupNativeCoordinationWaveOne.test.ets|assert0036|assertFalse|actual|expected=false', await status)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0006|StartupNativeCoordinationWaveOne.test.ets|assert0037|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0006|StartupNativeCoordinationWaveOne.test.ets|assert0037|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(); const started = f.clock.now();
      const request = f.shared.getAutoStartupStatusForSelf();
      const copy: NativeStatusSnapshot = f.shared.nativeStatus();
      copy.pending = false; copy.requestId = 99; copy.joins = 50; copy.startedAt = 0;
      const actual = f.shared.nativeStatus();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0038|assertTrue|actual|expected=true', actual.pending)).assertTrue(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0039|assertEqual|actual', actual.requestId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0039|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0040|assertEqual|actual', actual.joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0040|assertEqual|expected', 0)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0041|assertEqual|actual', actual.startedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0041|assertEqual|expected', started));
      f.clock.advance(5); f.api.resolveNext(true); await request;
      copy.finishedAt = -1;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0042|assertEqual|actual', f.shared.nativeStatus().finishedAt)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0007|StartupNativeCoordinationWaveOne.test.ets|assert0042|assertEqual|expected', started + 5));
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
      configureTestText();
      const f = sharedFixture(); let badCalls = 0; const observed: string[] = [];
      const offBad = f.shared.subscribe((): void => {
        badCalls++;
        throw new Error('observer failed');
      });
      const offGood = f.shared.subscribe((): void => {
        const state = f.shared.nativeStatus(); observed.push(`${state.pending}:${state.joins}`);
      });
      const request = f.shared.getAutoStartupStatusForSelf(); f.shared.getAutoStartupStatusForSelf();
      f.api.resolveNext(true); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0008|StartupNativeCoordinationWaveOne.test.ets|assert0043|assertTrue|actual|expected=true', await request)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0008|StartupNativeCoordinationWaveOne.test.ets|assert0044|assertEqual|actual', observed.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0008|StartupNativeCoordinationWaveOne.test.ets|assert0044|assertEqual|expected', 'true:0,true:1,false:1'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0008|StartupNativeCoordinationWaveOne.test.ets|assert0045|assertEqual|actual', badCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0008|StartupNativeCoordinationWaveOne.test.ets|assert0045|assertEqual|expected', 3)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0008|StartupNativeCoordinationWaveOne.test.ets|assert0046|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0008|StartupNativeCoordinationWaveOne.test.ets|assert0046|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(); let removed = 0; const retained: boolean[] = [];
      const off = f.shared.subscribe((): void => {
        removed++;
      });
      const offRetained = f.shared.subscribe((): void => {
        retained.push(f.shared.nativeStatus().pending);
      });
      const request = f.shared.getAutoStartupStatusForSelf(); off(); off();
      f.shared.getAutoStartupStatusForSelf(); f.api.resolveNext(false); await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0047|assertEqual|actual', removed)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0047|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0048|assertEqual|actual', retained.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0048|assertEqual|expected', 'true,true,false'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0049|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0049|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0050|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0009|StartupNativeCoordinationWaveOne.test.ets|assert0050|assertEqual|expected', 1)); offRetained();
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
      configureTestText();
      const f = sharedFixture(); const next: Promise<boolean>[] = [];
      const off = f.shared.subscribe((): void => {
        const state = f.shared.nativeStatus();
        if (!state.pending && state.requestId === 1) {
          next.push(f.shared.getAutoStartupStatusForSelf());
        }
      });
      const first = f.shared.getAutoStartupStatusForSelf(); f.api.resolveNext(true);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0051|assertTrue|actual|expected=true', await first)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0052|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0052|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0053|assertEqual|actual', f.shared.nativeStatus().requestId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0053|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0054|assertTrue|actual|expected=true', f.shared.nativeStatus().pending)).assertTrue();
      f.api.resolveNext(false); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0055|assertFalse|actual|expected=false', await next[0])).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0010|StartupNativeCoordinationWaveOne.test.ets|assert0056|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse(); off();
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
      configureTestText();
      const f = diagnosticFixture(); const status = f.diagnostic.runStatusProbe();
      const blocked = await f.diagnostic.runAbilityProbe();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0057|assertEqual|actual', blocked.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0057|assertEqual|expected', ProbeStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0058|assertEqual|actual', f.port.abilityCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0058|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0059|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0059|assertEqual|expected', 1));
      f.port.status(true); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0060|assertEqual|actual', (await status).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0060|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0061|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0061|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0011|StartupNativeCoordinationWaveOne.test.ets|assert0062|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
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
      configureTestText();
      const f = diagnosticFixture(); const ability = f.diagnostic.runAbilityProbe();
      const blocked = await f.diagnostic.runStatusProbe();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0063|assertEqual|actual', blocked.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0063|assertEqual|expected', ProbeStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0064|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0064|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0065|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0065|assertEqual|expected', 1));
      f.port.ability(true); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0066|assertEqual|actual', (await ability).conclusion)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0066|assertEqual|expected', '设备能力检测返回支持'));
      const status = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0067|assertFalse|actual|expected=false', (await status).value)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0068|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0012|StartupNativeCoordinationWaveOne.test.ets|assert0068|assertEqual|expected', 1));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(2999); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0069|assertEqual|actual', f.diagnostic.reportSnapshot().status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0069|assertEqual|expected', ProbeStage.RUNNING));
      f.clock.advance(1); const timed = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0070|assertEqual|actual', timed.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0070|assertEqual|expected', 3000));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0071|assertEqual|actual', timed.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0071|assertEqual|expected', ProbeStage.TIMEOUT));
      await f.diagnostic.runStatusProbe(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0072|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0072|assertEqual|expected', 1));
      f.port.rejectStatus(new TestBusinessError(801, 'late unsupported')); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0073|assertEqual|actual', f.diagnostic.reportSnapshot().status.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0073|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0074|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
      const retry = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0075|assertFalse|actual|expected=false', (await retry).value)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0076|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0013|StartupNativeCoordinationWaveOne.test.ets|assert0076|assertEqual|expected', 2));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runAbilityProbe();
      f.clock.advance(3000); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0077|assertEqual|actual', (await request).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0077|assertEqual|expected', ProbeStage.TIMEOUT));
      const blocked = await f.diagnostic.runAll();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0078|assertEqual|actual', blocked.status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0078|assertEqual|expected', ProbeStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0079|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0079|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0080|assertTrue|actual|expected=true', f.diagnostic.isRunning())).assertTrue();
      f.port.ability(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0081|assertEqual|actual', f.diagnostic.reportSnapshot().ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0081|assertEqual|expected', ProbeStage.TIMEOUT));
      const retry = f.diagnostic.runAbilityProbe(); f.port.ability(false);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0082|assertEqual|actual', (await retry).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0082|assertEqual|expected', ProbeStage.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0083|assertEqual|actual', f.port.abilityCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0014|StartupNativeCoordinationWaveOne.test.ets|assert0083|assertEqual|expected', 2));
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
      configureTestText();
      const f = diagnosticFixture(); f.port.statusError = new TestBusinessError(801, 'sync unavailable');
      const result = await f.diagnostic.runStatusProbe();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0084|assertEqual|actual', result.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0084|assertEqual|expected', ProbeStage.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0085|assertEqual|actual', result.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0085|assertEqual|expected', 'sync unavailable'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0086|assertTrue|actual|expected=true', result.unsupportedEvidence)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0087|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0087|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0088|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0089|assertEqual|actual', f.trace.ends.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0015|StartupNativeCoordinationWaveOne.test.ets|assert0089|assertEqual|expected', 'diagnostic_status:1:unsupported'));
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
      configureTestText();
      const f = diagnosticFixture(); f.port.abilityError = new Error('plain capability error');
      const result = await f.diagnostic.runAbilityProbe();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0090|assertEqual|actual', result.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0090|assertEqual|expected', ProbeStage.FAILED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0091|assertEqual|actual', result.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0091|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0092|assertEqual|actual', result.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0092|assertEqual|expected', 'plain capability error'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0093|assertNull|actual|expected=null', result.value)).assertNull(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0094|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0094|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0095|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0016|StartupNativeCoordinationWaveOne.test.ets|assert0095|assertEqual|expected', 0));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(19); f.port.rejectStatus(null); const result = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0096|assertEqual|actual', result.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0096|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0097|assertEqual|actual', result.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0097|assertEqual|expected', '未提供错误信息'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0098|assertEqual|actual', result.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0098|assertEqual|expected', 19));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0099|assertEqual|actual', result.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0099|assertEqual|expected', ProbeStage.FAILED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0100|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0017|StartupNativeCoordinationWaveOne.test.ets|assert0100|assertEqual|expected', 0));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(23); f.port.rejectStatus(new NumericProbeFailure()); const result = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0101|assertEqual|actual', result.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0101|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0102|assertEqual|actual', result.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0102|assertEqual|expected', '42'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0103|assertEqual|actual', result.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0103|assertEqual|expected', 23));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0104|assertEqual|actual', result.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0104|assertEqual|expected', ProbeStage.FAILED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0018|StartupNativeCoordinationWaveOne.test.ets|assert0105|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(29); f.port.rejectStatus(new TestBusinessError(16000050, 'x'.repeat(200) + '尾'));
      const result = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0106|assertEqual|actual', result.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0106|assertEqual|expected', 'x'.repeat(200)));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0107|assertEqual|actual', result.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0107|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0108|assertEqual|actual', result.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0108|assertEqual|expected', 29));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0109|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0109|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0110|assertEqual|actual', f.trace.ends.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0019|StartupNativeCoordinationWaveOne.test.ets|assert0110|assertEqual|expected', 'diagnostic_status:1:failed'));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(11); f.port.status(true); const result = await request;
      result.stage = ProbeStage.FAILED; result.value = false; result.errorCode = 'changed'; result.elapsedMillis = 999;
      const retained = f.diagnostic.reportSnapshot().status;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0111|assertEqual|actual', retained.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0111|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0112|assertTrue|actual|expected=true', retained.value)).assertTrue(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0113|assertEqual|actual', retained.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0113|assertEqual|expected', '0'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0114|assertEqual|actual', retained.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0114|assertEqual|expected', 11));
      const retry = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0115|assertFalse|actual|expected=false', (await retry).value)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0116|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0020|StartupNativeCoordinationWaveOne.test.ets|assert0116|assertEqual|expected', 2));
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
      configureTestText();
      const f = diagnosticFixture();
      f.diagnostic.configure(new CapabilityQuery(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY));
      const all = f.diagnostic.runAll(); f.port.ability(true); await flushMicrotasks();
      f.port.status(false); await all;
      const snapshot = f.diagnostic.reportSnapshot();
      snapshot.query.apiLevel = 1; snapshot.ability.value = false; snapshot.status.errorCode = 'mutated';
      snapshot.status.stage = ProbeStage.FAILED;
      const retained = f.diagnostic.reportSnapshot();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0117|assertEqual|actual', retained.query.apiLevel)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0117|assertEqual|expected', 18));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0118|assertTrue|actual|expected=true', retained.ability.value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0119|assertEqual|actual', retained.status.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0119|assertEqual|expected', '0'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0120|assertEqual|actual', retained.status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0120|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0021|StartupNativeCoordinationWaveOne.test.ets|assert0121|assertTrue|actual|expected=true', retained.consistent)).assertTrue();
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0122|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0122|assertEqual|expected', 0));
      f.port.rejectAbility(new TestBusinessError(16000050, 'ability failed')); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0123|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0123|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0124|assertEqual|actual', f.diagnostic.reportSnapshot().status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0124|assertEqual|expected', ProbeStage.RUNNING));
      f.port.status(true); const report = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0125|assertEqual|actual', report.ability.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0125|assertEqual|expected', '16000050'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0126|assertTrue|actual|expected=true', report.status.value)).assertTrue(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0127|assertFalse|actual|expected=false', report.consistent)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0128|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0022|StartupNativeCoordinationWaveOne.test.ets|assert0128|assertEqual|expected', 0));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      f.clock.advance(3000); const report = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0129|assertEqual|actual', report.ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0129|assertEqual|expected', ProbeStage.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0130|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0130|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0131|assertTrue|actual|expected=true', f.diagnostic.isRunning())).assertTrue();
      f.port.rejectAbility(new Error('late failure')); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0132|assertEqual|actual', f.diagnostic.reportSnapshot().ability.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0132|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0133|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
      const retry = f.diagnostic.runAll(); f.port.ability(true); await flushMicrotasks();
      f.port.status(false); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0134|assertFalse|actual|expected=false', (await retry).status.value)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0135|assertEqual|actual', f.port.abilityCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0023|StartupNativeCoordinationWaveOne.test.ets|assert0135|assertEqual|expected', 2));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      f.clock.advance(17); f.diagnostic.dispose(); const report = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0136|assertEqual|actual', report.ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0136|assertEqual|expected', ProbeStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0137|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0137|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0138|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0138|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0139|assertTrue|actual|expected=true', f.diagnostic.isRunning())).assertTrue();
      f.port.ability(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0140|assertEqual|actual', f.diagnostic.reportSnapshot().headline)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0140|assertEqual|expected', '尚未诊断'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0024|StartupNativeCoordinationWaveOne.test.ets|assert0141|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runAll();
      f.port.ability(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0142|assertEqual|actual', f.diagnostic.reportSnapshot().ability.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0142|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0143|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0143|assertEqual|expected', 1));
      f.diagnostic.dispose(); const report = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0144|assertEqual|actual', report.status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0144|assertEqual|expected', ProbeStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0145|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0145|assertEqual|expected', 0));
      f.port.rejectStatus(new TestBusinessError(801, 'late status')); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0146|assertEqual|actual', f.diagnostic.reportSnapshot().status.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0146|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0025|StartupNativeCoordinationWaveOne.test.ets|assert0147|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(31); f.diagnostic.dispose(); const cancelled = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0148|assertEqual|actual', cancelled.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0148|assertEqual|expected', 'CANCELLED'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0149|assertEqual|actual', cancelled.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0149|assertEqual|expected', 31));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0150|assertTrue|actual|expected=true', f.diagnostic.isRunning())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0151|assertEqual|actual', (await f.diagnostic.runStatusProbe()).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0151|assertEqual|expected', ProbeStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0152|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0152|assertEqual|expected', 1));
      f.port.status(true); await flushMicrotasks();
      const retry = f.diagnostic.runStatusProbe(); f.port.status(false);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0153|assertFalse|actual|expected=false', (await retry).value)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0154|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0026|StartupNativeCoordinationWaveOne.test.ets|assert0154|assertEqual|expected', 2));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.diagnostic.dispose(); f.diagnostic.dispose();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0155|assertEqual|actual', (await request).errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0155|assertEqual|expected', 'CANCELLED'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0156|assertEqual|actual', f.trace.ends.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0156|assertEqual|expected', 'diagnostic_status:1:failed'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0157|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0157|assertEqual|expected', 0));
      f.port.status(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0158|assertEqual|actual', f.trace.ends.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0158|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0159|assertNull|actual|expected=null', f.diagnostic.reportSnapshot().status.value)).assertNull();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0027|StartupNativeCoordinationWaveOne.test.ets|assert0160|assertFalse|actual|expected=false', f.diagnostic.isRunning())).assertFalse();
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
      configureTestText();
      const f = diagnosticFixture(); let badCalls = 0; const observed: ProbeStage[] = [];
      const offBad = f.diagnostic.subscribe((): void => {
        badCalls++;
        throw new Error('diagnostic observer');
      });
      const off = f.diagnostic.subscribe((): void => {
        observed.push(f.diagnostic.reportSnapshot().status.stage);
      });
      const request = f.diagnostic.runStatusProbe(); f.port.status(true);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0161|assertEqual|actual', (await request).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0161|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0162|assertEqual|actual', observed.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0162|assertEqual|expected', 'running,succeeded,succeeded'));
      off(); off(); offBad();
      const next = f.diagnostic.runStatusProbe(); f.port.status(false); await next;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0163|assertEqual|actual', observed.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0163|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0164|assertEqual|actual', badCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0164|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0165|assertEqual|actual', f.port.statusCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0028|StartupNativeCoordinationWaveOne.test.ets|assert0165|assertEqual|expected', 2));
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
      configureTestText();
      const f = diagnosticFixture(); f.trace.throws = true;
      const request = f.diagnostic.runStatusProbe(); f.clock.advance(37); f.port.status(true);
      const result = await request;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0166|assertEqual|actual', result.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0166|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0167|assertEqual|actual', result.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0167|assertEqual|expected', 37));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0168|assertEqual|actual', f.trace.starts.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0168|assertEqual|expected', 'diagnostic_status:1'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0169|assertEqual|actual', f.trace.ends.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0169|assertEqual|expected', 'diagnostic_status:1:succeeded'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0170|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0170|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0171|assertEqual|actual', f.diagnostic.reportSnapshot().status.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0029|StartupNativeCoordinationWaveOne.test.ets|assert0171|assertEqual|expected', '0'));
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
      configureTestText();
      const f = diagnosticFixture(); const request = f.diagnostic.runStatusProbe();
      f.clock.advance(3000); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0172|assertEqual|actual', (await request).errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0172|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0173|assertEqual|actual', f.trace.ends.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0173|assertEqual|expected', 'diagnostic_status:1:timeout'));
      f.port.rejectStatus(new Error('after deadline')); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0174|assertEqual|actual', f.trace.ends.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0174|assertEqual|expected', 1));
      const retry = f.diagnostic.runStatusProbe(); f.port.status(true); await retry;
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0175|assertEqual|actual', f.trace.starts.join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0175|assertEqual|expected', 'diagnostic_status:1,diagnostic_status:2'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0176|assertEqual|actual', f.trace.ends[1])).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0176|assertEqual|expected', 'diagnostic_status:2:succeeded'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0030|StartupNativeCoordinationWaveOne.test.ets|assert0177|assertTrue|actual|expected=true', f.diagnostic.reportSnapshot().status.value)).assertTrue();
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
      configureTestText();
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0178|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0178|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0179|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0179|assertEqual|expected', 1));
      f.clock.advance(41); f.api.resolveNext(true); const result = await diagnostic; await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0180|assertTrue|actual|expected=true', result.value)).assertTrue(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0181|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0181|assertEqual|expected', QueryPhase.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0182|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0182|assertEqual|expected', 41));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0183|assertEqual|actual', f.service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0183|assertEqual|expected', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0184|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0031|StartupNativeCoordinationWaveOne.test.ets|assert0184|assertEqual|expected', 0));
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
      configureTestText();
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.service.refresh(RefreshSource.MANUAL); f.api.resolveNext(false);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0185|assertFalse|actual|expected=false', (await diagnostic).value)).assertFalse(); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0186|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0186|assertEqual|expected', RefreshSource.MANUAL));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0187|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0187|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0188|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0188|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0189|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0190|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0032|StartupNativeCoordinationWaveOne.test.ets|assert0190|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe(); f.clock.advance(3000);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0191|assertEqual|actual', (await diagnostic).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0191|assertEqual|expected', ProbeStage.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0192|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0192|assertEqual|expected', QueryPhase.QUERYING));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0193|assertTrue|actual|expected=true', f.shared.nativeStatus().pending)).assertTrue();
      f.clock.advance(1000); f.api.resolveNext(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0194|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0194|assertEqual|expected', 4000));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0195|assertEqual|actual', f.service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0195|assertEqual|expected', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0196|assertEqual|actual', f.diagnostic.reportSnapshot().status.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0196|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0197|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0198|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0033|StartupNativeCoordinationWaveOne.test.ets|assert0198|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(7000); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe(); f.clock.advance(5000);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0199|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0199|assertEqual|expected', QueryPhase.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0200|assertEqual|actual', f.diagnostic.reportSnapshot().status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0200|assertEqual|expected', ProbeStage.RUNNING));
      f.clock.advance(1000); f.api.resolveNext(false);
      const result = await diagnostic; await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0201|assertEqual|actual', result.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0201|assertEqual|expected', ProbeStage.SUCCEEDED)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0202|assertEqual|actual', result.elapsedMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0202|assertEqual|expected', 6000));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0203|assertEqual|actual', f.service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0203|assertEqual|expected', QueryOutcome.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0204|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0204|assertEqual|expected', 5000));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0205|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0205|assertEqual|expected', 1)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0206|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0034|StartupNativeCoordinationWaveOne.test.ets|assert0206|assertEqual|expected', 0));
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
      configureTestText();
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe(); f.service.dispose();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0207|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0207|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0208|assertTrue|actual|expected=true', f.shared.nativeStatus().pending)).assertTrue();
      f.api.resolveNext(true); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0209|assertTrue|actual|expected=true', (await diagnostic).value)).assertTrue(); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0210|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0210|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0211|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0211|assertEqual|expected', QueryPhase.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0212|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0213|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0035|StartupNativeCoordinationWaveOne.test.ets|assert0213|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.service.refresh(RefreshSource.INITIAL); f.diagnostic.dispose();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0214|assertEqual|actual', (await diagnostic).errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0214|assertEqual|expected', 'CANCELLED'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0215|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0215|assertEqual|expected', 1));
      f.api.resolveNext(false); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0216|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0216|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0217|assertEqual|actual', f.diagnostic.reportSnapshot().status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0217|assertEqual|expected', ProbeStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0218|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0219|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0036|StartupNativeCoordinationWaveOne.test.ets|assert0219|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(); f.api.supported = false; f.service.refresh(RefreshSource.INITIAL);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0220|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0220|assertEqual|expected', 0));
      const diagnostic = f.diagnostic.runStatusProbe(); f.api.resolveNext(true);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0221|assertEqual|actual', (await diagnostic).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0221|assertEqual|expected', ProbeStage.SUCCEEDED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0222|assertEqual|actual', f.service.snapshot().support)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0222|assertEqual|expected', SupportState.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0223|assertEqual|actual', f.service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0223|assertEqual|expected', QueryOutcome.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0224|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0224|assertEqual|expected', 0)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0225|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0037|StartupNativeCoordinationWaveOne.test.ets|assert0225|assertEqual|expected', 1));
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
      configureTestText();
      const f = sharedFixture(); f.service.refresh(RefreshSource.INITIAL);
      const diagnostic = f.diagnostic.runStatusProbe();
      f.api.rejectNext(new TestBusinessError(801, 'status unavailable'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0226|assertEqual|actual', (await diagnostic).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0226|assertEqual|expected', ProbeStage.UNSUPPORTED)); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0227|assertEqual|actual', f.service.snapshot().support)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0227|assertEqual|expected', SupportState.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0228|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0228|assertEqual|expected', QueryPhase.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0229|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0229|assertEqual|expected', '查询不支持'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0230|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0230|assertEqual|expected', 1)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0231|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0232|assertEqual|actual', f.clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0038|StartupNativeCoordinationWaveOne.test.ets|assert0232|assertEqual|expected', 0));
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
      configureTestText();
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.api.probeError = new TestBusinessError(16000050, 'capability failed'); f.service.refresh(RefreshSource.INITIAL);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0233|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0233|assertEqual|expected', QueryPhase.FAILED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0234|assertEqual|actual', f.service.snapshot().support)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0234|assertEqual|expected', SupportState.FAILED));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0235|assertTrue|actual|expected=true', f.shared.nativeStatus().pending)).assertTrue(); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0236|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0236|assertEqual|expected', 0));
      f.api.resolveNext(false); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0237|assertFalse|actual|expected=false', (await diagnostic).value)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0238|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0238|assertEqual|expected', 1)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0039|StartupNativeCoordinationWaveOne.test.ets|assert0239|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse();
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
      configureTestText();
      const f = sharedFixture(); const diagnostic = f.diagnostic.runStatusProbe();
      f.clock.advance(3000); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0240|assertEqual|actual', (await diagnostic).stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0240|assertEqual|expected', ProbeStage.TIMEOUT));
      f.clock.advance(100); f.service.refresh(RefreshSource.MANUAL);
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0241|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0241|assertEqual|expected', 1)); expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0242|assertEqual|actual', f.shared.nativeStatus().joins)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0242|assertEqual|expected', 1));
      f.clock.advance(100); f.api.resolveNext(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0243|assertEqual|actual', f.service.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0243|assertEqual|expected', 100));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0244|assertTrue|actual|expected=true', f.service.snapshot().value)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0245|assertEqual|actual', f.diagnostic.reportSnapshot().status.errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0245|assertEqual|expected', 'TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_StartupNativeCoordinationWaveOne_0040|StartupNativeCoordinationWaveOne.test.ets|assert0246|assertFalse|actual|expected=false', f.shared.nativeStatus().pending)).assertFalse();
    });
  });
}
