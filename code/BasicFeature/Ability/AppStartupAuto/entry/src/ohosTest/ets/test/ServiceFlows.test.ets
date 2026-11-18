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

import { afterEach, beforeEach, describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import { HistoryStorage, serializeHistory } from '../../../main/ets/autostart/AutoStartupHistory';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { HistoryFilter, RangePreset, detailLines } from '../../../main/ets/autostart/history/HistoryView';
import { REVISIT_ARCHIVE_LIMIT, REVISIT_ATTEMPT_LIMIT, REVISIT_TIMEOUT_MS,
  RevisitSession, RevisitStage, RevisitTracker } from '../../../main/ets/autostart/revisit/RevisitTracker';
import { revisitDetails } from '../../../main/ets/autostart/revisit/RevisitView';
import { CapabilityDiagnostic, ProbeStage } from '../../../main/ets/autostart/diagnostics/CapabilityProbe';
import { RuntimeProbePort } from '../../../main/ets/autostart/diagnostics/DiagnosticRuntime';
import { ControlledAutoStartupApi, ManualQueryClock, TestBusinessError, flushMicrotasks } from '../support/TestSupport';

class FlowStore implements HistoryStorage {
  public value: string = '';
  public failRead: boolean = false;
  public failWrite: boolean = false;
  public hold: boolean = false;
  public reads: number = 0;
  public writes: number = 0;
  private releaseWrite: (() => void) | undefined = undefined;
  read(): string {
    this.reads++;
    if (this.failRead) {
      throw new Error('controlled read failure');
    }
    return this.value;
  }
  async write(value: string): Promise<void> {
    this.writes++;
    if (this.hold) {
      await new Promise<void>((resolve): void => {
        this.releaseWrite = resolve;
      });
    }
    if (this.failWrite) {
      throw new Error('controlled write failure');
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
class FlowFixture {
  public api: ControlledAutoStartupApi = new ControlledAutoStartupApi();
  public clock: ManualQueryClock = new ManualQueryClock();
  public history: FlowStore = new FlowStore();
  public revisit: FlowStore = new FlowStore();
  public service: AutoStartupService;
  constructor() {
    this.service = new AutoStartupService(this.api, this.clock, this.history);
    this.service.attachRevisit(this.revisit);
  }
  async sample(value: boolean, source: RefreshSource = RefreshSource.MANUAL): Promise<void> {
    this.service.refresh(source);
    this.clock.advance(3);
    this.api.resolveNext(value);
    await flushMicrotasks();
  }
  async arm(): Promise<string> {
    await this.sample(false, RefreshSource.INITIAL);
    if (!this.service.beginRevisit()) {
      throw new Error('Expected successful arm');
    }
    return this.service.revisitSnapshot().sessionId;
  }
  async save(): Promise<void> {
    await this.service.whenSaved(); await this.service.whenRevisitSaved();
  }
}
function row(id: number, time: number, source: RefreshSource, outcome: QueryOutcome): QueryRecord {
  const record = new QueryRecord();
  record.id = id; record.timestamp = time; record.source = source; record.outcome = outcome;
  record.result = outcome === QueryOutcome.SUCCESS ? (id % 2 === 0 ? '已开启' : '未开启') : '查询失败';
  record.supportResult = 'true'; record.statusResult = outcome === QueryOutcome.SUCCESS ? 'true' : '16000050';
  record.durationMillis = 3;
  record.errorMessage = outcome === QueryOutcome.FAILURE ? 'private person@example.com 13800138000' : '';
  return record;
}

export default function serviceFlowsTest(): void {
  configureTestText();
  describe('AutoStartupProductionFlows', (): void => {
    let fixtures: FlowFixture[] = [];
    const create = (): FlowFixture => {
      const fixture = new FlowFixture();
      fixtures.push(fixture);
      return fixture;
    };
    beforeEach((): void => {
      configureTestText();
      fixtures = [];
    });
    afterEach(async (): Promise<void> => {
      fixtures.forEach((fixture: FlowFixture): void => {
        fixture.revisit.release(); fixture.history.release(); fixture.service.dispose(); fixture.api.finishPending();
      });
      await flushMicrotasks();
      for (const fixture of fixtures) {
        await fixture.save();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0100
     * @tc.name      testAutoStartupProductionFlows0001
     * @tc.desc      Verify fLOW 01 only ability background arms return and settings query is single flight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0001', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); const id = await f.arm();
      const beforeId = f.service.revisitSnapshot().before?.id;
      const off = f.service.subscribe((): void => {}); off();
      f.service.onForeground();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0001|assertEqual|actual', f.service.revisitSnapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0001|assertEqual|expected', RevisitStage.GUIDED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0002|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0002|assertEqual|expected', 1));
      f.service.onBackground(); f.clock.advance(10); f.service.onForeground();
      f.service.retryRevisitQuery(); f.service.refresh(RefreshSource.SETTINGS); f.service.onForeground();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0003|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0003|assertEqual|expected', 2));
      const bound = f.service.revisitSnapshot().expectedQueryId;
      f.api.resolveNext(true); await flushMicrotasks();
      const done = f.service.revisitSnapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0004|assertEqual|actual', done.sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0004|assertEqual|expected', id)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0005|assertEqual|actual', done.before?.id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0005|assertEqual|expected', beforeId));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0006|assertEqual|actual', done.after?.id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0006|assertEqual|expected', bound)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0007|assertEqual|actual', done.after?.source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0007|assertEqual|expected', RefreshSource.SETTINGS));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0008|assertEqual|actual', done.stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0008|assertEqual|expected', RevisitStage.RECHECKED)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0009|assertEqual|actual', f.service.revisitArchive().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0009|assertEqual|expected', 1));
      f.service.refresh(RefreshSource.SETTINGS); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0010|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0001|ServiceFlows.test.ets|assert0010|assertEqual|expected', 2));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0200
     * @tc.name      testAutoStartupProductionFlows0002
     * @tc.desc      Verify fLOW 02 cancelled session rejects late query and next round has new identity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0002', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); const id = await f.arm();
      f.service.onBackground(); f.service.onForeground(); f.service.cancelRevisit();
      f.api.resolveNext(true); await flushMicrotasks();
      const cancelled = f.service.revisitArchive()[0];
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0011|assertEqual|actual', cancelled.sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0011|assertEqual|expected', id)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0012|assertEqual|actual', cancelled.stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0012|assertEqual|expected', RevisitStage.CANCELLED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0013|assertEqual|actual', cancelled.after)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0013|assertEqual|expected', undefined)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0014|assertEqual|actual', cancelled.attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0014|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0015|assertTrue|actual|expected=true', f.service.beginRevisit())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0016|assertFalse|actual|expected=false', f.service.revisitSnapshot().sessionId === id)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0017|assertEqual|actual', f.service.revisitSnapshot().after)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0002|ServiceFlows.test.ets|assert0017|assertEqual|expected', undefined));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0300
     * @tc.name      testAutoStartupProductionFlows0003
     * @tc.desc      Verify fLOW 03 timeout retains native slot late result cannot replace retry facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0003', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      f.clock.advance(5000); const timed = f.service.revisitSnapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0018|assertEqual|actual', timed.after?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0018|assertEqual|expected', QueryOutcome.TIMEOUT));
      f.service.retryRevisitQuery(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0019|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0019|assertEqual|expected', 2));
      f.api.resolveNext(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0020|assertEqual|actual', f.service.revisitSnapshot().after?.id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0020|assertEqual|expected', timed.after?.id));
      f.service.retryRevisitQuery(); f.api.resolveNext(true); await flushMicrotasks();
      const done = f.service.revisitSnapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0021|assertEqual|actual', done.attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0021|assertEqual|expected', 2)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0022|assertEqual|actual', done.attempts[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0022|assertEqual|expected', QueryOutcome.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0023|assertEqual|actual', done.attempts[1].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0023|assertEqual|expected', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0024|assertFalse|actual|expected=false', done.after?.id === timed.after?.id)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0025|assertEqual|actual', f.service.revisitArchive().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0003|ServiceFlows.test.ets|assert0025|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0400
     * @tc.name      testAutoStartupProductionFlows0004
     * @tc.desc      Verify fLOW 04 reopen left round rebases queries without history
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0004', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground(); await f.save();
      const old = f.service.revisitSnapshot(); const next = create();
      next.clock.advance(f.clock.now() - next.clock.now());
      next.revisit.value = f.revisit.value; next.service.attachRevisit(next.revisit);
      next.service.onForeground(); next.api.resolveNext(true); await flushMicrotasks();
      const done = next.service.revisitSnapshot();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0004|ServiceFlows.test.ets|assert0026|assertEqual|actual', done.sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0004|ServiceFlows.test.ets|assert0026|assertEqual|expected', old.sessionId)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0004|ServiceFlows.test.ets|assert0027|assertEqual|actual', done.before?.id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0004|ServiceFlows.test.ets|assert0027|assertEqual|expected', old.before?.id));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0004|ServiceFlows.test.ets|assert0028|assertTrue|actual|expected=true', (done.after?.id || 0) > (done.before?.id || 0))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0004|ServiceFlows.test.ets|assert0029|assertEqual|actual', done.after?.source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0004|ServiceFlows.test.ets|assert0029|assertEqual|expected', RefreshSource.SETTINGS));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0500
     * @tc.name      testAutoStartupProductionFlows0005
     * @tc.desc      Verify fLOW 05 reopen returned round clears binding but never reuses allocated query id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0005', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground(); await f.save();
      const oldId = f.service.revisitSnapshot().expectedQueryId;
      const next = create(); next.clock.advance(f.clock.now() - next.clock.now());
      next.revisit.value = f.revisit.value; next.service.attachRevisit(next.revisit);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0005|ServiceFlows.test.ets|assert0030|assertEqual|actual', next.service.revisitSnapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0005|ServiceFlows.test.ets|assert0030|assertEqual|expected', 0));
      next.service.onForeground(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0005|ServiceFlows.test.ets|assert0031|assertTrue|actual|expected=true', next.service.revisitSnapshot().expectedQueryId > oldId)).assertTrue();
      next.api.resolveNext(false); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0005|ServiceFlows.test.ets|assert0032|assertFalse|actual|expected=false', next.service.revisitSnapshot().after?.id === oldId)).assertFalse();
      f.api.resolveNext(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0005|ServiceFlows.test.ets|assert0033|assertEqual|actual', next.service.revisitSnapshot().after?.result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0005|ServiceFlows.test.ets|assert0033|assertEqual|expected', '未开启'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0600
     * @tc.name      testAutoStartupProductionFlows0006
     * @tc.desc      Verify fLOW 06 reopen expired round archives unknown without settings evidence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0006', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground(); await f.save();
      const next = create();
      next.clock.advance(REVISIT_TIMEOUT_MS + f.clock.now() - next.clock.now());
      next.revisit.value = f.revisit.value;
      next.service.attachRevisit(next.revisit);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0034|assertEqual|actual', next.service.revisitSnapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0034|assertEqual|expected', RevisitStage.EXPIRED));
      next.service.onForeground(); next.api.resolveNext(true); await flushMicrotasks();
      const archived = next.service.revisitArchive()[0];
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0035|assertEqual|actual', archived.stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0035|assertEqual|expected', RevisitStage.EXPIRED)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0036|assertEqual|actual', archived.after)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0036|assertEqual|expected', undefined));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0037|assertFalse|actual|expected=false', next.service.records()[0].source === RefreshSource.SETTINGS)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0006|ServiceFlows.test.ets|assert0038|assertTrue|actual|expected=true', revisitDetails(archived).join('\n').indexOf('不证明') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0700
     * @tc.name      testAutoStartupProductionFlows0007
     * @tc.desc      Verify fLOW 07 read failure blocks every revisit mutation and write until retry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0007', 0, async (): Promise<void> => {
      configureTestText();
      const saved = create(); await saved.arm(); saved.service.onBackground(); await saved.save();
      const f = create(); f.revisit.value = saved.revisit.value; f.revisit.failRead = true;
      f.service.attachRevisit(f.revisit); await f.sample(true, RefreshSource.INITIAL);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0039|assertFalse|actual|expected=false', f.service.beginRevisit())).assertFalse(); f.service.cancelRevisit(); f.service.retryPersistence();
      f.service.onBackground(); f.service.onForeground(); f.service.dispose(); await f.save();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0040|assertEqual|actual', f.revisit.writes)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0040|assertEqual|expected', 0)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0041|assertEqual|actual', f.revisit.value)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0041|assertEqual|expected', saved.revisit.value));
      f.revisit.failRead = false; f.service.retryRevisitRead();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0042|assertFalse|actual|expected=false', f.service.revisitReadBlocked())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0043|assertEqual|actual', f.service.revisitSnapshot().sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0007|ServiceFlows.test.ets|assert0043|assertEqual|expected', saved.service.revisitSnapshot().sessionId));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0800
     * @tc.name      testAutoStartupProductionFlows0008
     * @tc.desc      Verify fLOW 08 corrupt read is atomic and needs explicit discard to overwrite
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0008', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); f.revisit.value = '{broken'; f.service.attachRevisit(f.revisit);
      f.service.retryPersistence(); await f.save(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0008|ServiceFlows.test.ets|assert0044|assertEqual|actual', f.revisit.value)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0008|ServiceFlows.test.ets|assert0044|assertEqual|expected', '{broken'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0008|ServiceFlows.test.ets|assert0045|assertTrue|actual|expected=true', f.service.revisitReadBlocked())).assertTrue(); f.service.discardUnreadRevisit(); await f.save();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0008|ServiceFlows.test.ets|assert0046|assertFalse|actual|expected=false', f.service.revisitReadBlocked())).assertFalse();
      const decoded = new RevisitTracker(); decoded.restore(f.revisit.value, f.clock.now());
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0008|ServiceFlows.test.ets|assert0047|assertEqual|actual', decoded.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0008|ServiceFlows.test.ets|assert0047|assertEqual|expected', RevisitStage.IDLE));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_0900
     * @tc.name      testAutoStartupProductionFlows0009
     * @tc.desc      Verify fLOW 09 write failure keeps terminal memory and explicit save retries latest round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0009', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); f.revisit.failWrite = true; await f.arm(); f.service.cancelRevisit(); await f.save();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0009|ServiceFlows.test.ets|assert0048|assertTrue|actual|expected=true', f.service.revisitNotice().indexOf('保存失败') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0009|ServiceFlows.test.ets|assert0049|assertEqual|actual', f.service.revisitArchive()[0].stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0009|ServiceFlows.test.ets|assert0049|assertEqual|expected', RevisitStage.CANCELLED));
      f.revisit.failWrite = false; f.service.retryPersistence(); await f.save();
      const decoded = new RevisitTracker(); decoded.restore(f.revisit.value, f.clock.now());
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0009|ServiceFlows.test.ets|assert0050|assertEqual|actual', decoded.archived()[0].stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0009|ServiceFlows.test.ets|assert0050|assertEqual|expected', RevisitStage.CANCELLED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0009|ServiceFlows.test.ets|assert0051|assertFalse|actual|expected=false', f.service.revisitNotice().indexOf('保存失败') >= 0)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1000
     * @tc.name      testAutoStartupProductionFlows0010
     * @tc.desc      Verify fLOW 10 archive capacity and clone isolation survive reopen
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0010', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.sample(false, RefreshSource.INITIAL);
      const ids: string[] = [];
      for (let index = 0; index < REVISIT_ARCHIVE_LIMIT + 2; index++) {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0052|assertTrue|actual|expected=true', f.service.beginRevisit())).assertTrue(); ids.push(f.service.revisitSnapshot().sessionId);
        f.service.cancelRevisit(); f.clock.advance(1);
      }
      await f.save(); const archive = f.service.revisitArchive();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0053|assertEqual|actual', archive.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0053|assertEqual|expected', REVISIT_ARCHIVE_LIMIT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0054|assertEqual|actual', archive[0].sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0054|assertEqual|expected', ids[ids.length - 1]));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0055|assertEqual|actual', archive.find((item: RevisitSession): boolean => item.sessionId === ids[0]))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0055|assertEqual|expected', undefined));
      if (archive[0].before !== undefined) {
        archive[0].before.result = 'mutated';
      }
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0056|assertEqual|actual', f.service.revisitArchive()[0].before?.result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0056|assertEqual|expected', '未开启'));
      const decoded = new RevisitTracker(); decoded.restore(f.revisit.value, f.clock.now());
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0057|assertEqual|actual', decoded.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0057|assertEqual|expected', REVISIT_ARCHIVE_LIMIT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0010|ServiceFlows.test.ets|assert0058|assertFalse|actual|expected=false', decoded.begin(undefined, 2, f.clock.now()).sessionId === archive[0].sessionId)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1100
     * @tc.name      testAutoStartupProductionFlows0011
     * @tc.desc      Verify fLOW 11 same store queued snapshot cannot overwrite successful reread
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0011', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.sample(false, RefreshSource.INITIAL); f.service.beginRevisit();
      f.revisit.failRead = true; f.service.attachRevisit(f.revisit); await f.save();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0059|assertTrue|actual|expected=true', f.service.revisitReadBlocked())).assertTrue(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0060|assertEqual|actual', f.revisit.writes)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0060|assertEqual|expected', 0));
      const external = new RevisitTracker();
      external.begin(undefined, 2, f.clock.now() - 1);
      external.cancel(f.clock.now());
      f.revisit.value = external.serialize(); const actual = f.revisit.value;
      f.revisit.failRead = false; f.service.retryRevisitRead(); await f.save();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0061|assertEqual|actual', f.revisit.value)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0061|assertEqual|expected', actual)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0062|assertEqual|actual', f.revisit.writes)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0062|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0063|assertEqual|actual', f.service.revisitSnapshot().sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0011|ServiceFlows.test.ets|assert0063|assertEqual|expected', external.snapshot().sessionId));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1200
     * @tc.name      testAutoStartupProductionFlows0012
     * @tc.desc      Verify fLOW 12 in flight write is drained then actually reread before unblocking
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0012', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); f.revisit.hold = true; await f.arm(); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0064|assertEqual|actual', f.revisit.writes)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0064|assertEqual|expected', 1));
      f.service.cancelRevisit(); f.service.attachRevisit(f.revisit);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0065|assertTrue|actual|expected=true', f.service.revisitReadBlocked())).assertTrue(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0066|assertEqual|actual', f.revisit.reads)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0066|assertEqual|expected', 1));
      f.revisit.release(); await f.save();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0067|assertEqual|actual', f.revisit.writes)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0067|assertEqual|expected', 1)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0068|assertEqual|actual', f.revisit.reads)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0068|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0069|assertFalse|actual|expected=false', f.service.revisitReadBlocked())).assertFalse();
      const actual = new RevisitTracker(); actual.restore(f.revisit.value, f.clock.now());
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0070|assertEqual|actual', f.service.revisitSnapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0012|ServiceFlows.test.ets|assert0070|assertEqual|expected', actual.snapshot().stage));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1300
     * @tc.name      testAutoStartupProductionFlows0013
     * @tc.desc      Verify fLOW 13 scope unifies rows summary latest comparison and export
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */


    it('testAutoStartupProductionFlows0013', 0, (): void => {
      configureTestText();
      const f = create(); const now = f.clock.now();
      f.history.value = serializeHistory([row(4, now - 5, RefreshSource.MANUAL, QueryOutcome.SUCCESS),
        row(3, now - 10, RefreshSource.SETTINGS, QueryOutcome.FAILURE),
        row(2, now - 15, RefreshSource.MANUAL, QueryOutcome.SUCCESS),
        row(1, now - 7200000, RefreshSource.MANUAL, QueryOutcome.SUCCESS)], now);
      f.service.attachHistory(f.history);
      const scope = f.service.historyScope(new HistoryFilter('success', RefreshSource.MANUAL, RangePreset.HOUR));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0071|assertEqual|actual', scope.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0071|assertEqual|expected', 2)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0072|assertEqual|actual', scope.summary.total)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0072|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0073|assertEqual|actual', scope.summary.failure)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0073|assertEqual|expected', 0)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0074|assertEqual|actual', scope.latestValid?.id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0074|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0075|assertEqual|actual', scope.comparison.beforeId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0075|assertEqual|expected', 2)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0076|assertEqual|actual', scope.comparison.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0076|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0077|assertEqual|actual', scope.exportText.indexOf('#1 |'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0077|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0078|assertEqual|actual', scope.exportText.indexOf('#3 |'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0078|assertEqual|expected', -1));
      scope.records[0].result = 'mutated'; expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0079|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0013|ServiceFlows.test.ets|assert0079|assertEqual|expected', '已开启'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1400
     * @tc.name      testAutoStartupProductionFlows0014
     * @tc.desc      Verify fLOW 14 empty scope never falls back to full history
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0014', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.sample(true, RefreshSource.INITIAL);
      const scope = f.service.historyScope(new HistoryFilter('failure', RefreshSource.SETTINGS, RangePreset.HOUR));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0080|assertEqual|actual', scope.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0080|assertEqual|expected', 0)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0081|assertEqual|actual', scope.summary.total)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0081|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0082|assertEqual|actual', scope.latestValid)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0082|assertEqual|expected', undefined)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0083|assertEqual|actual', scope.comparison.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0083|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0084|assertTrue|actual|expected=true', scope.exportText.indexOf('记录数：0') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0085|assertEqual|actual', scope.exportText.indexOf('#1 |'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0014|ServiceFlows.test.ets|assert0085|assertEqual|expected', -1));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1500
     * @tc.name      testAutoStartupProductionFlows0015
     * @tc.desc      Verify fLOW 15 selected comparison is range bound and failures are not state changes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0015', 0, (): void => {
      configureTestText();
      const f = create(); const now = f.clock.now();
      f.history.value = serializeHistory([row(3, now, RefreshSource.MANUAL, QueryOutcome.FAILURE),
        row(2, now - 1, RefreshSource.SETTINGS, QueryOutcome.SUCCESS),
        row(1, now - 2, RefreshSource.MANUAL, QueryOutcome.SUCCESS)], now);
      f.service.attachHistory(f.history);
      const scope = f.service.historyScope(new HistoryFilter(), 1, 3);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0086|assertEqual|actual', scope.comparison.beforeId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0086|assertEqual|expected', 1)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0087|assertEqual|actual', scope.comparison.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0087|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0088|assertTrue|actual|expected=true', scope.comparisonText.join('\n').indexOf('无法比较') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0089|assertEqual|actual', scope.comparisonText.join('\n').indexOf('状态已变化'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0089|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0090|assertEqual|actual', scope.exportText.indexOf('person@example.com'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0090|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0091|assertTrue|actual|expected=true', detailLines(scope.records[0]).join('\n').indexOf('本机错误说明') >= 0)).assertTrue();
      const hidden = f.service.historyScope(new HistoryFilter('', RefreshSource.SETTINGS), 1, 3);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0092|assertTrue|actual|expected=true', hidden.comparisonText[0].indexOf('不在当前范围') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0093|assertEqual|actual', hidden.comparison.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0093|assertEqual|expected', -1));
      const same = f.service.historyScope(new HistoryFilter(), 1, 1);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0015|ServiceFlows.test.ets|assert0094|assertTrue|actual|expected=true', same.comparisonText[0].indexOf('不同记录') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1600
     * @tc.name      testAutoStartupProductionFlows0016
     * @tc.desc      Verify fLOW 16 dispose and reenter ignore old native generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0016', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      const old = f.service.revisitSnapshot().expectedQueryId;
      f.service.dispose(); f.service.onForeground(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0095|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0095|assertEqual|expected', 2));
      f.api.resolveNext(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0096|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0096|assertEqual|expected', 3)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0097|assertTrue|actual|expected=true', f.service.revisitSnapshot().expectedQueryId > old)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0098|assertEqual|actual', f.service.revisitSnapshot().after)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0098|assertEqual|expected', undefined));
      f.api.resolveNext(false); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0099|assertEqual|actual', f.service.revisitSnapshot().after?.result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0099|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0100|assertEqual|actual', f.service.records().find((record: QueryRecord): boolean => record.id === old))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0016|ServiceFlows.test.ets|assert0100|assertEqual|expected', undefined));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1700
     * @tc.name      testAutoStartupProductionFlows0017
     * @tc.desc      Verify fLOW 19 retry facts are bounded and late retry expires without new query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0017', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      for (let index = 0; index < REVISIT_ATTEMPT_LIMIT + 1; index++) {
        f.api.rejectNext(new TestBusinessError(16000050, 'controlled'));
        await flushMicrotasks();
        if (index < REVISIT_ATTEMPT_LIMIT) {
          f.service.retryRevisitQuery();
        }
      }
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0101|assertEqual|actual', f.service.revisitSnapshot().attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0101|assertEqual|expected', REVISIT_ATTEMPT_LIMIT));
      const calls = f.api.queryCalls;
      f.clock.advance(REVISIT_TIMEOUT_MS); f.service.retryRevisitQuery();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0102|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0102|assertEqual|expected', calls));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0103|assertEqual|actual', f.service.revisitArchive()[0].stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0103|assertEqual|expected', RevisitStage.EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0104|assertTrue|actual|expected=true', f.service.revisitArchive()[0].conclusion.indexOf('未完成') >= 0)).assertTrue();
      await f.save(); const restored = new RevisitTracker(); restored.restore(f.revisit.value, f.clock.now());
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0105|assertEqual|actual', restored.archived()[0].attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0017|ServiceFlows.test.ets|assert0105|assertEqual|expected', REVISIT_ATTEMPT_LIMIT));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1800
     * @tc.name      testAutoStartupProductionFlows0018
     * @tc.desc      Verify fLOW 20 legacy single session schema one remains recoverable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0018', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground();
      const legacy = JSON.stringify({ schema: 1, session: f.service.revisitSnapshot() })
        .replace(/,"lastQueryId":\d+/, '').replace(/,"attempts":\[\]/, '');
      const next = create(); next.clock.advance(f.clock.now() - next.clock.now());
      next.revisit.value = legacy; next.service.attachRevisit(next.revisit);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0018|ServiceFlows.test.ets|assert0106|assertFalse|actual|expected=false', next.service.revisitReadBlocked())).assertFalse();
      next.service.onForeground(); next.api.resolveNext(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0018|ServiceFlows.test.ets|assert0107|assertEqual|actual', next.service.revisitSnapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0018|ServiceFlows.test.ets|assert0107|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0018|ServiceFlows.test.ets|assert0108|assertEqual|actual', next.service.revisitArchive()[0].after?.source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0018|ServiceFlows.test.ets|assert0108|assertEqual|expected', RefreshSource.SETTINGS));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_1900
     * @tc.name      testAutoStartupProductionFlows0019
     * @tc.desc      Verify fLOW 21 invalid stored query source is rejected without overwrite
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0019', 0, async (): Promise<void> => {
      configureTestText();
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      f.api.resolveNext(true); await flushMicrotasks(); await f.save();
      const next = create(); next.clock.advance(f.clock.now() - next.clock.now());
      const validStored: string = f.revisit.value;
      const settingsSource: string = `"source":"${RefreshSource.SETTINGS}"`;
      if (validStored.indexOf(settingsSource) < 0) {
        throw new Error('Expected canonical settings source in the persisted revisit fixture');
      }
      next.revisit.value = validStored.replace(settingsSource, `"source":"${RefreshSource.MANUAL}"`);
      if (next.revisit.value === validStored) {
        throw new Error('The invalid-source fixture did not change the stored document');
      }
      const damaged = next.revisit.value; next.service.attachRevisit(next.revisit);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0019|ServiceFlows.test.ets|assert0109|assertTrue|actual|expected=true', next.service.revisitReadBlocked())).assertTrue();
      next.service.retryPersistence(); await next.save(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0019|ServiceFlows.test.ets|assert0110|assertEqual|actual', next.revisit.value)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0019|ServiceFlows.test.ets|assert0110|assertEqual|expected', damaged));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0019|ServiceFlows.test.ets|assert0111|assertEqual|actual', next.service.revisitArchive().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0019|ServiceFlows.test.ets|assert0111|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_2000
     * @tc.name      testAutoStartupProductionFlows0020
     * @tc.desc      Verify fLOW 17 real probe adapter timeout and page dispose keep native single flight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0020', 0, async (): Promise<void> => {
      configureTestText();
      const api = new ControlledAutoStartupApi(); const clock = new ManualQueryClock();
      const diagnostic = new CapabilityDiagnostic(new RuntimeProbePort(api), (): number => clock.now(), 3000, clock);
      const request = diagnostic.runStatusProbe(); clock.advance(3000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0112|assertEqual|actual', (await request).stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0112|assertEqual|expected', ProbeStage.TIMEOUT));
      await diagnostic.runStatusProbe(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0113|assertEqual|actual', api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0113|assertEqual|expected', 1));
      diagnostic.dispose(); api.resolveNext(true); await flushMicrotasks();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0114|assertEqual|actual', diagnostic.reportSnapshot().status.stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0114|assertEqual|expected', ProbeStage.IDLE));
      const retry = diagnostic.runStatusProbe(); api.resolveNext(false);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0115|assertFalse|actual|expected=false', (await retry).value)).assertFalse(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0116|assertEqual|actual', api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0116|assertEqual|expected', 2));
      diagnostic.dispose(); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0117|assertEqual|actual', clock.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0020|ServiceFlows.test.ets|assert0117|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPPRODUCTIONFLOWS_2100
     * @tc.name      testAutoStartupProductionFlows0021
     * @tc.desc      Verify fLOW 18 independent probe does not gate status on unsupported ability
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testAutoStartupProductionFlows0021', 0, async (): Promise<void> => {
      configureTestText();
      const api = new ControlledAutoStartupApi(); api.supported = false; const clock = new ManualQueryClock();
      const diagnostic = new CapabilityDiagnostic(new RuntimeProbePort(api), (): number => clock.now(), 3000, clock);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0118|assertEqual|actual', (await diagnostic.runAbilityProbe()).stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0118|assertEqual|expected', ProbeStage.UNSUPPORTED));
      const status = diagnostic.runStatusProbe(); api.rejectNext(new TestBusinessError(16000050, 'controlled'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0119|assertEqual|actual', (await status).stage)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0119|assertEqual|expected', ProbeStage.FAILED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0120|assertEqual|actual', api.probeCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0120|assertEqual|expected', 1)); expect(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0121|assertEqual|actual', api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupProductionFlows_0021|ServiceFlows.test.ets|assert0121|assertEqual|expected', 1)); diagnostic.dispose();
    });
  });
}
