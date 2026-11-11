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
import { loggedIt as it } from '../support/TestLog';
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
  describe('AutoStartupProductionFlows', (): void => {
    let fixtures: FlowFixture[] = [];
    const create = (): FlowFixture => {
      const fixture = new FlowFixture();
      fixtures.push(fixture);
      return fixture;
    };
    beforeEach((): void => {
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
      const f = create(); const id = await f.arm();
      const beforeId = f.service.revisitSnapshot().before?.id;
      const off = f.service.subscribe((): void => {}); off();
      f.service.onForeground();
      expect(f.service.revisitSnapshot().stage).assertEqual(RevisitStage.GUIDED);
      expect(f.api.queryCalls).assertEqual(1);
      f.service.onBackground(); f.clock.advance(10); f.service.onForeground();
      f.service.retryRevisitQuery(); f.service.refresh(RefreshSource.SETTINGS); f.service.onForeground();
      expect(f.api.queryCalls).assertEqual(2);
      const bound = f.service.revisitSnapshot().expectedQueryId;
      f.api.resolveNext(true); await flushMicrotasks();
      const done = f.service.revisitSnapshot();
      expect(done.sessionId).assertEqual(id); expect(done.before?.id).assertEqual(beforeId);
      expect(done.after?.id).assertEqual(bound); expect(done.after?.source).assertEqual(RefreshSource.SETTINGS);
      expect(done.stage).assertEqual(RevisitStage.RECHECKED); expect(f.service.revisitArchive().length).assertEqual(1);
      f.service.refresh(RefreshSource.SETTINGS); expect(f.api.queryCalls).assertEqual(2);
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
      const f = create(); const id = await f.arm();
      f.service.onBackground(); f.service.onForeground(); f.service.cancelRevisit();
      f.api.resolveNext(true); await flushMicrotasks();
      const cancelled = f.service.revisitArchive()[0];
      expect(cancelled.sessionId).assertEqual(id); expect(cancelled.stage).assertEqual(RevisitStage.CANCELLED);
      expect(cancelled.after).assertEqual(undefined); expect(cancelled.attempts.length).assertEqual(0);
      expect(f.service.beginRevisit()).assertTrue();
      expect(f.service.revisitSnapshot().sessionId === id).assertFalse();
      expect(f.service.revisitSnapshot().after).assertEqual(undefined);
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
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      f.clock.advance(5000); const timed = f.service.revisitSnapshot();
      expect(timed.after?.outcome).assertEqual(QueryOutcome.TIMEOUT);
      f.service.retryRevisitQuery(); expect(f.api.queryCalls).assertEqual(2);
      f.api.resolveNext(true); await flushMicrotasks();
      expect(f.service.revisitSnapshot().after?.id).assertEqual(timed.after?.id);
      f.service.retryRevisitQuery(); f.api.resolveNext(true); await flushMicrotasks();
      const done = f.service.revisitSnapshot();
      expect(done.attempts.length).assertEqual(2); expect(done.attempts[0].outcome).assertEqual(QueryOutcome.TIMEOUT);
      expect(done.attempts[1].outcome).assertEqual(QueryOutcome.SUCCESS);
      expect(done.after?.id === timed.after?.id).assertFalse();
      expect(f.service.revisitArchive().length).assertEqual(1);
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
      const f = create(); await f.arm(); f.service.onBackground(); await f.save();
      const old = f.service.revisitSnapshot(); const next = create();
      next.clock.advance(f.clock.now() - next.clock.now());
      next.revisit.value = f.revisit.value; next.service.attachRevisit(next.revisit);
      next.service.onForeground(); next.api.resolveNext(true); await flushMicrotasks();
      const done = next.service.revisitSnapshot();
      expect(done.sessionId).assertEqual(old.sessionId); expect(done.before?.id).assertEqual(old.before?.id);
      expect((done.after?.id || 0) > (done.before?.id || 0)).assertTrue();
      expect(done.after?.source).assertEqual(RefreshSource.SETTINGS);
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
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground(); await f.save();
      const oldId = f.service.revisitSnapshot().expectedQueryId;
      const next = create(); next.clock.advance(f.clock.now() - next.clock.now());
      next.revisit.value = f.revisit.value; next.service.attachRevisit(next.revisit);
      expect(next.service.revisitSnapshot().expectedQueryId).assertEqual(0);
      next.service.onForeground(); expect(next.service.revisitSnapshot().expectedQueryId > oldId).assertTrue();
      next.api.resolveNext(false); await flushMicrotasks();
      expect(next.service.revisitSnapshot().after?.id === oldId).assertFalse();
      f.api.resolveNext(true); await flushMicrotasks();
      expect(next.service.revisitSnapshot().after?.result).assertEqual('未开启');
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
      const f = create(); await f.arm(); f.service.onBackground(); await f.save();
      const next = create();
      next.clock.advance(REVISIT_TIMEOUT_MS + f.clock.now() - next.clock.now());
      next.revisit.value = f.revisit.value;
      next.service.attachRevisit(next.revisit);
      expect(next.service.revisitSnapshot().stage).assertEqual(RevisitStage.EXPIRED);
      next.service.onForeground(); next.api.resolveNext(true); await flushMicrotasks();
      const archived = next.service.revisitArchive()[0];
      expect(archived.stage).assertEqual(RevisitStage.EXPIRED); expect(archived.after).assertEqual(undefined);
      expect(next.service.records()[0].source === RefreshSource.SETTINGS).assertFalse();
      expect(revisitDetails(archived).join('\n').indexOf('不证明') >= 0).assertTrue();
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
      const saved = create(); await saved.arm(); saved.service.onBackground(); await saved.save();
      const f = create(); f.revisit.value = saved.revisit.value; f.revisit.failRead = true;
      f.service.attachRevisit(f.revisit); await f.sample(true, RefreshSource.INITIAL);
      expect(f.service.beginRevisit()).assertFalse(); f.service.cancelRevisit(); f.service.retryPersistence();
      f.service.onBackground(); f.service.onForeground(); f.service.dispose(); await f.save();
      expect(f.revisit.writes).assertEqual(0); expect(f.revisit.value).assertEqual(saved.revisit.value);
      f.revisit.failRead = false; f.service.retryRevisitRead();
      expect(f.service.revisitReadBlocked()).assertFalse();
      expect(f.service.revisitSnapshot().sessionId).assertEqual(saved.service.revisitSnapshot().sessionId);
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
      const f = create(); f.revisit.value = '{broken'; f.service.attachRevisit(f.revisit);
      f.service.retryPersistence(); await f.save(); expect(f.revisit.value).assertEqual('{broken');
      expect(f.service.revisitReadBlocked()).assertTrue(); f.service.discardUnreadRevisit(); await f.save();
      expect(f.service.revisitReadBlocked()).assertFalse();
      const decoded = new RevisitTracker(); decoded.restore(f.revisit.value, f.clock.now());
      expect(decoded.snapshot().stage).assertEqual(RevisitStage.IDLE);
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
      const f = create(); f.revisit.failWrite = true; await f.arm(); f.service.cancelRevisit(); await f.save();
      expect(f.service.revisitNotice().indexOf('保存失败') >= 0).assertTrue();
      expect(f.service.revisitArchive()[0].stage).assertEqual(RevisitStage.CANCELLED);
      f.revisit.failWrite = false; f.service.retryPersistence(); await f.save();
      const decoded = new RevisitTracker(); decoded.restore(f.revisit.value, f.clock.now());
      expect(decoded.archived()[0].stage).assertEqual(RevisitStage.CANCELLED);
      expect(f.service.revisitNotice().indexOf('保存失败') >= 0).assertFalse();
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
      const f = create(); await f.sample(false, RefreshSource.INITIAL);
      const ids: string[] = [];
      for (let index = 0; index < REVISIT_ARCHIVE_LIMIT + 2; index++) {
        expect(f.service.beginRevisit()).assertTrue(); ids.push(f.service.revisitSnapshot().sessionId);
        f.service.cancelRevisit(); f.clock.advance(1);
      }
      await f.save(); const archive = f.service.revisitArchive();
      expect(archive.length).assertEqual(REVISIT_ARCHIVE_LIMIT);
      expect(archive[0].sessionId).assertEqual(ids[ids.length - 1]);
      expect(archive.find((item: RevisitSession): boolean => item.sessionId === ids[0])).assertEqual(undefined);
      if (archive[0].before !== undefined) {
        archive[0].before.result = 'mutated';
      }
      expect(f.service.revisitArchive()[0].before?.result).assertEqual('未开启');
      const decoded = new RevisitTracker(); decoded.restore(f.revisit.value, f.clock.now());
      expect(decoded.archived().length).assertEqual(REVISIT_ARCHIVE_LIMIT);
      expect(decoded.begin(undefined, 2, f.clock.now()).sessionId === archive[0].sessionId).assertFalse();
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
      const f = create(); await f.sample(false, RefreshSource.INITIAL); f.service.beginRevisit();
      f.revisit.failRead = true; f.service.attachRevisit(f.revisit); await f.save();
      expect(f.service.revisitReadBlocked()).assertTrue(); expect(f.revisit.writes).assertEqual(0);
      const external = new RevisitTracker();
      external.begin(undefined, 2, f.clock.now() - 1);
      external.cancel(f.clock.now());
      f.revisit.value = external.serialize(); const actual = f.revisit.value;
      f.revisit.failRead = false; f.service.retryRevisitRead(); await f.save();
      expect(f.revisit.value).assertEqual(actual); expect(f.revisit.writes).assertEqual(0);
      expect(f.service.revisitSnapshot().sessionId).assertEqual(external.snapshot().sessionId);
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
      const f = create(); f.revisit.hold = true; await f.arm(); await flushMicrotasks();
      expect(f.revisit.writes).assertEqual(1);
      f.service.cancelRevisit(); f.service.attachRevisit(f.revisit);
      expect(f.service.revisitReadBlocked()).assertTrue(); expect(f.revisit.reads).assertEqual(1);
      f.revisit.release(); await f.save();
      expect(f.revisit.writes).assertEqual(1); expect(f.revisit.reads).assertEqual(2);
      expect(f.service.revisitReadBlocked()).assertFalse();
      const actual = new RevisitTracker(); actual.restore(f.revisit.value, f.clock.now());
      expect(f.service.revisitSnapshot().stage).assertEqual(actual.snapshot().stage);
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
      const f = create(); const now = f.clock.now();
      f.history.value = serializeHistory([row(4, now - 5, RefreshSource.MANUAL, QueryOutcome.SUCCESS),
        row(3, now - 10, RefreshSource.SETTINGS, QueryOutcome.FAILURE),
        row(2, now - 15, RefreshSource.MANUAL, QueryOutcome.SUCCESS),
        row(1, now - 7200000, RefreshSource.MANUAL, QueryOutcome.SUCCESS)], now);
      f.service.attachHistory(f.history);
      const scope = f.service.historyScope(new HistoryFilter('success', RefreshSource.MANUAL, RangePreset.HOUR));
      expect(scope.records.length).assertEqual(2); expect(scope.summary.total).assertEqual(2);
      expect(scope.summary.failure).assertEqual(0); expect(scope.latestValid?.id).assertEqual(4);
      expect(scope.comparison.beforeId).assertEqual(2); expect(scope.comparison.afterId).assertEqual(4);
      expect(scope.exportText.indexOf('#1 |')).assertEqual(-1);
      expect(scope.exportText.indexOf('#3 |')).assertEqual(-1);
      scope.records[0].result = 'mutated'; expect(f.service.records()[0].result).assertEqual('已开启');
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
      const f = create(); await f.sample(true, RefreshSource.INITIAL);
      const scope = f.service.historyScope(new HistoryFilter('failure', RefreshSource.SETTINGS, RangePreset.HOUR));
      expect(scope.records.length).assertEqual(0); expect(scope.summary.total).assertEqual(0);
      expect(scope.latestValid).assertEqual(undefined); expect(scope.comparison.afterId).assertEqual(-1);
      expect(scope.exportText.indexOf('记录数：0') >= 0).assertTrue();
      expect(scope.exportText.indexOf('#1 |')).assertEqual(-1);
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
      const f = create(); const now = f.clock.now();
      f.history.value = serializeHistory([row(3, now, RefreshSource.MANUAL, QueryOutcome.FAILURE),
        row(2, now - 1, RefreshSource.SETTINGS, QueryOutcome.SUCCESS),
        row(1, now - 2, RefreshSource.MANUAL, QueryOutcome.SUCCESS)], now);
      f.service.attachHistory(f.history);
      const scope = f.service.historyScope(new HistoryFilter(), 1, 3);
      expect(scope.comparison.beforeId).assertEqual(1); expect(scope.comparison.afterId).assertEqual(3);
      expect(scope.comparisonText.join('\n').indexOf('无法比较') >= 0).assertTrue();
      expect(scope.comparisonText.join('\n').indexOf('状态已变化')).assertEqual(-1);
      expect(scope.exportText.indexOf('person@example.com')).assertEqual(-1);
      expect(detailLines(scope.records[0]).join('\n').indexOf('本机错误说明') >= 0).assertTrue();
      const hidden = f.service.historyScope(new HistoryFilter('', RefreshSource.SETTINGS), 1, 3);
      expect(hidden.comparisonText[0].indexOf('不在当前范围') >= 0).assertTrue();
      expect(hidden.comparison.afterId).assertEqual(-1);
      const same = f.service.historyScope(new HistoryFilter(), 1, 1);
      expect(same.comparisonText[0].indexOf('不同记录') >= 0).assertTrue();
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
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      const old = f.service.revisitSnapshot().expectedQueryId;
      f.service.dispose(); f.service.onForeground(); expect(f.api.queryCalls).assertEqual(2);
      f.api.resolveNext(true); await flushMicrotasks();
      expect(f.api.queryCalls).assertEqual(3); expect(f.service.revisitSnapshot().expectedQueryId > old).assertTrue();
      expect(f.service.revisitSnapshot().after).assertEqual(undefined);
      f.api.resolveNext(false); await flushMicrotasks();
      expect(f.service.revisitSnapshot().after?.result).assertEqual('未开启');
      expect(f.service.records().find((record: QueryRecord): boolean => record.id === old)).assertEqual(undefined);
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
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      for (let index = 0; index < REVISIT_ATTEMPT_LIMIT + 1; index++) {
        f.api.rejectNext(new TestBusinessError(16000050, 'controlled'));
        await flushMicrotasks();
        if (index < REVISIT_ATTEMPT_LIMIT) {
          f.service.retryRevisitQuery();
        }
      }
      expect(f.service.revisitSnapshot().attempts.length).assertEqual(REVISIT_ATTEMPT_LIMIT);
      const calls = f.api.queryCalls;
      f.clock.advance(REVISIT_TIMEOUT_MS); f.service.retryRevisitQuery();
      expect(f.api.queryCalls).assertEqual(calls);
      expect(f.service.revisitArchive()[0].stage).assertEqual(RevisitStage.EXPIRED);
      expect(f.service.revisitArchive()[0].conclusion.indexOf('未完成') >= 0).assertTrue();
      await f.save(); const restored = new RevisitTracker(); restored.restore(f.revisit.value, f.clock.now());
      expect(restored.archived()[0].attempts.length).assertEqual(REVISIT_ATTEMPT_LIMIT);
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
      const f = create(); await f.arm(); f.service.onBackground();
      const legacy = JSON.stringify({ schema: 1, session: f.service.revisitSnapshot() })
        .replace(/,"lastQueryId":\d+/, '').replace(/,"attempts":\[\]/, '');
      const next = create(); next.clock.advance(f.clock.now() - next.clock.now());
      next.revisit.value = legacy; next.service.attachRevisit(next.revisit);
      expect(next.service.revisitReadBlocked()).assertFalse();
      next.service.onForeground(); next.api.resolveNext(true); await flushMicrotasks();
      expect(next.service.revisitSnapshot().stage).assertEqual(RevisitStage.RECHECKED);
      expect(next.service.revisitArchive()[0].after?.source).assertEqual(RefreshSource.SETTINGS);
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
      const f = create(); await f.arm(); f.service.onBackground(); f.service.onForeground();
      f.api.resolveNext(true); await flushMicrotasks(); await f.save();
      const next = create(); next.clock.advance(f.clock.now() - next.clock.now());
      next.revisit.value = f.revisit.value.replace('"source":"设置后查询"', '"source":"手动刷新"');
      const damaged = next.revisit.value; next.service.attachRevisit(next.revisit);
      expect(next.service.revisitReadBlocked()).assertTrue();
      next.service.retryPersistence(); await next.save(); expect(next.revisit.value).assertEqual(damaged);
      expect(next.service.revisitArchive().length).assertEqual(0);
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
      const api = new ControlledAutoStartupApi(); const clock = new ManualQueryClock();
      const diagnostic = new CapabilityDiagnostic(new RuntimeProbePort(api), (): number => clock.now(), 3000, clock);
      const request = diagnostic.runStatusProbe(); clock.advance(3000);
      expect((await request).stage).assertEqual(ProbeStage.TIMEOUT);
      await diagnostic.runStatusProbe(); expect(api.queryCalls).assertEqual(1);
      diagnostic.dispose(); api.resolveNext(true); await flushMicrotasks();
      expect(diagnostic.reportSnapshot().status.stage).assertEqual(ProbeStage.IDLE);
      const retry = diagnostic.runStatusProbe(); api.resolveNext(false);
      expect((await retry).value).assertFalse(); expect(api.queryCalls).assertEqual(2);
      diagnostic.dispose(); expect(clock.pendingCount()).assertEqual(0);
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
      const api = new ControlledAutoStartupApi(); api.supported = false; const clock = new ManualQueryClock();
      const diagnostic = new CapabilityDiagnostic(new RuntimeProbePort(api), (): number => clock.now(), 3000, clock);
      expect((await diagnostic.runAbilityProbe()).stage).assertEqual(ProbeStage.UNSUPPORTED);
      const status = diagnostic.runStatusProbe(); api.rejectNext(new TestBusinessError(16000050, 'controlled'));
      expect((await status).stage).assertEqual(ProbeStage.FAILED);
      expect(api.probeCalls).assertEqual(1); expect(api.queryCalls).assertEqual(1); diagnostic.dispose();
    });
  });
}
