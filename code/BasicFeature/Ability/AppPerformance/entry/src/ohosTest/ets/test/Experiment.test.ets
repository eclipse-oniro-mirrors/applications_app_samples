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

import { describe, expect } from '@ohos/hypium';
import { scenario } from '../support/BoundedCase';
import { FakePlatform, MemoryStore, fixtureError } from '../support/FakePlatform';
import { AppService } from '../../../main/ets/core/AppService';
import { MaintenanceFlow, MaintenanceStep } from '../../../main/ets/core/Types';
import {
  ExperimentLedger, ExperimentRecord, compareRecords, digestLedger, restoreRecords
} from '../../../main/ets/core/ExperimentLedger';
import { recordOfFlow } from '../../../main/ets/core/ExperimentRecorder';
import { FLOW_KEYS, flowMetricSamples, evaluateFlowGate } from '../../../main/ets/core/FlowMetrics';
import { GateVerdict, evaluateGate } from '../../../main/ets/core/RegressionGate';
import { WORKLOADS, verifyWorkload, workloadOf } from '../../../main/ets/core/WorkloadCatalog';

function bytes(text: string): Uint8Array {
  const result = new Uint8Array(text.length);
  for (let index = 0; index < text.length; index++) { result[index] = text.charCodeAt(index); }
  return result;
}

class LabPlatform extends FakePlatform {
  public names: string[] = [];
  public payload: string = 'First note|Body of the first note|2026-11-05\nSecond note|Another body|2026-11-05';
  public failRead: boolean = false;
  public reads: number = 0;
  public changeAfterWarm: boolean = false;

  readResource(name: string = 'sample.txt'): Promise<Uint8Array> {
    this.names.push(name); this.reads++;
    if (this.failRead) { return Promise.reject(fixtureError(12345, 'controlled payload read failure')); }
    return Promise.resolve(bytes(this.payload + (this.changeAfterWarm && this.reads > 1 ? 'x' : '')));
  }
}

function required(record: ExperimentRecord | undefined): ExperimentRecord {
  if (record === undefined) { throw new Error('Expected an accepted production experiment'); }
  return record;
}

async function drain(): Promise<void> {
  for (let index = 0; index < 24; index++) { await Promise.resolve(); }
}

function completeRecord(id: string = 'EXP-1'): ExperimentRecord {
  const flow = new MaintenanceFlow();
  flow.mode = 'control'; flow.startedAt = 1000; flow.endedAt = 1100; flow.status = '已完成';
  flow.beforeBytes = 10; flow.afterBytes = 10; flow.digestBefore = 'abc'; flow.digestAfter = 'abc';
  flow.integrity = '业务资源校验一致';
  FLOW_KEYS.forEach((key: string): void => {
    const step = new MaintenanceStep(); step.key = key; step.label = key; step.status = '成功'; step.elapsed = 10;
    flow.steps.push(step);
  });
  const record = recordOfFlow(flow, 'W-NOTES', '列表', []);
  record.id = id; record.condition = 'same-observed-conditions'; record.asset = 'workloads/notes_list.txt';
  return record;
}

export default function experimentTests(): void {
  describe('AppPerformanceExperiments', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0100
     * @tc.name      testAppPerformanceExperiments0001
     * @tc.desc      Verify catalog validation rejects malformed business payloads
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */


    scenario('testAppPerformanceExperiments0001', (): void => {
      const payloads: string[] = ['resource text', 'Title|Body|2026-11-05', 'photo.svg|160|96',
        'step=1\nname=Alice\nphone=10086\naddress=Example\nnote=Draft'];
      WORKLOADS.forEach((spec, index: number): void => {
        const padded: string = payloads[index] + '\n# fixture payload padding';
        expect(verifyWorkload(spec, bytes(padded)).ok).assertTrue();
        expect(verifyWorkload(spec, bytes('')).ok).assertFalse();
      });
      expect(verifyWorkload(WORKLOADS[1], bytes('Title||2026-11-05\n# padding for size threshold')).ok).assertFalse();
      expect(verifyWorkload(WORKLOADS[2], bytes('photo.svg|-1|96')).ok).assertFalse();
      expect(verifyWorkload(WORKLOADS[3], bytes('step=1\nname=Alice')).ok).assertFalse();
      expect(workloadOf('not-in-package') === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0200
     * @tc.name      testAppPerformanceExperiments0002
     * @tc.desc      Verify public eviction reports success rejection and no dispatch separately
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0002', async (): Promise<void> => {
      const platform = new FakePlatform(); const service = AppService.fromPlatform(platform);
      try {
        const ok = await service.evictFiles(['entry.hap']);
        expect(ok.status).assertEqual('success'); expect(ok.dispatched).assertTrue(); expect(ok.inFlight).assertFalse();
        platform.fileErrorCode = 123;
        const rejected = await service.evictFiles(['entry.hap']);
        expect(rejected.status).assertEqual('rejected'); expect(rejected.code).assertEqual(123);
        platform.fileAvailable = false;
        const blocked = await service.evictFiles(['entry.hap']);
        expect(blocked.status).assertEqual('not-dispatched'); expect(blocked.dispatched).assertFalse();
        expect(platform.fileCalls.length).assertEqual(2);
        platform.fileAvailable = true; platform.fileErrorCode = -1; platform.deferFile = true;
        const pending = service.evictFiles(['entry.hap']); platform.advance(10000);
        const timeout = await pending;
        expect(timeout.status).assertEqual('timeout'); expect(timeout.inFlight).assertTrue();
        expect(timeout.dispatched).assertTrue();
        platform.releaseFile(); await drain(); expect(service.isExperimentBusy()).assertFalse();
      } finally { platform.releaseFile(); service.dispose(); }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0300
     * @tc.name      testAppPerformanceExperiments0003
     * @tc.desc      Verify lab and maintenance share six production stages and one ledger
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0003', async (): Promise<void> => {
      const platform = new LabPlatform(); const service = AppService.fromPlatform(platform);
      try {
        const record = required(await service.runExperiment('W-NOTES', 'control'));
        expect(record.complete()).assertTrue(); expect(record.requestStatus).assertEqual('not-requested');
        expect(record.stages.map((stage): string => stage.key).join('|')).assertEqual(FLOW_KEYS.join('|'));
        expect(platform.names.join('|')).assertEqual('workloads/notes_list.txt|workloads/notes_list.txt');
        expect(platform.fileCalls.length).assertEqual(0); expect(service.ledgerRecords().length).assertEqual(1);
        expect(record.condition.length > 0).assertTrue();
        record.note = 'caller mutation'; expect(service.ledgerRecords()[0].note === 'caller mutation').assertFalse();
      } finally { service.dispose(); }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0400
     * @tc.name      testAppPerformanceExperiments0004
     * @tc.desc      Verify all early stops are recorded exactly once without successful samples
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0004', async (): Promise<void> => {
      for (let failure = 0; failure < 4; failure++) {
        const platform = new LabPlatform();
        if (failure === 0) { platform.files = []; platform.modules = []; }
        if (failure === 1) { platform.config = '{bad-json'; }
        if (failure === 2) { platform.payload = 'malformed business row that is long enough'; }
        if (failure === 3) { platform.fileErrorCode = 456; }
        const service = AppService.fromPlatform(platform);
        try {
          const record = required(await service.runExperiment('W-NOTES', 'files'));
          expect(record.complete()).assertFalse(); expect(record.skipped() > 0).assertTrue();
          expect(service.ledgerRecords().length).assertEqual(1);
          expect(digestLedger(service.ledgerRecords())[0].medianDuration).assertEqual(-1);
          if (failure < 3) { expect(platform.fileCalls.length).assertEqual(0); }
        } finally { service.dispose(); }
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0500
     * @tc.name      testAppPerformanceExperiments0005
     * @tc.desc      Verify timeout ends local run but quarantines unsettled native work
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0005', async (): Promise<void> => {
      const platform = new LabPlatform(); platform.deferFile = true;
      const service = AppService.fromPlatform(platform);
      try {
        const running = service.runExperiment('W-NOTES', 'files'); await drain();
        expect(platform.fileCalls.length).assertEqual(1);
        platform.advance(10000); const record = required(await running);
        expect(record.stages[3].status).assertEqual('超时'); expect(record.complete()).assertFalse();
        expect(service.isQuarantined()).assertTrue(); expect(service.isExperimentBusy()).assertTrue();
        const blocked = await service.evictFiles(['entry.hap']); expect(blocked.dispatched).assertFalse();
        expect(await service.runExperiment('W-NOTES', 'control') === undefined).assertTrue();
        expect(platform.fileCalls.length).assertEqual(1); expect(service.ledgerRecords().length).assertEqual(1);
        platform.releaseFile(); await drain();
        expect(service.isExperimentBusy()).assertFalse(); expect(service.ledgerRecords().length).assertEqual(1);
        expect(service.ledgerRecords()[0].stages[3].status).assertEqual('超时');
        expect(platform.names.length).assertEqual(1); expect(platform.pendingTimers()).assertEqual(0);
      } finally { platform.releaseFile(); service.dispose(); }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0600
     * @tc.name      testAppPerformanceExperiments0006
     * @tc.desc      Verify cancellation preserves native exclusion and terminal ledger
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0006', async (): Promise<void> => {
      const platform = new LabPlatform(); platform.deferFile = true; platform.fileErrorCode = 678;
      const service = AppService.fromPlatform(platform);
      try {
        const running = service.runExperiment('W-NOTES', 'files'); await drain();
        service.cancelExperiment(); const record = required(await running);
        expect(record.stages[3].status).assertEqual('已取消'); expect(service.isQuarantined()).assertTrue();
        expect(platform.pendingTimers()).assertEqual(0); expect(service.ledgerRecords().length).assertEqual(1);
        platform.releaseFile(); await drain();
        expect(service.isExperimentBusy()).assertFalse();
        expect(service.ledgerRecords()[0].stages[3].status).assertEqual('已取消');
        expect(service.getState().logs.some((row): boolean =>
          row.code === 678 && row.api === 'evictFilePages')).assertTrue();
      } finally { platform.releaseFile(); service.dispose(); }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0700
     * @tc.name      testAppPerformanceExperiments0007
     * @tc.desc      Verify ledger reopen preserves order identity bounds and deep copies
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0007', (): void => {
      const ledger = new ExperimentLedger();
      const first = completeRecord('EXP-1'); const second = completeRecord('EXP-2');
      ledger.append(first); ledger.append(second);
      const reopened = new ExperimentLedger();
      reopened.restore(restoreRecords(JSON.parse(JSON.stringify(ledger.all()))));
      expect(reopened.all().map((record): string => record.id).join('|')).assertEqual('EXP-2|EXP-1');
      reopened.restore(reopened.all()); expect(reopened.all()[0].id).assertEqual('EXP-2');
      const duplicate = reopened.append(first); expect(duplicate.id === 'EXP-1').assertFalse();
      duplicate.stages[0].status = '失败'; expect(reopened.all()[0].stages[0].status).assertEqual('成功');
      expect(restoreRecords([first, first]).length).assertEqual(1);
      first.stages[1].status = '跳过'; expect(first.complete()).assertFalse();
      for (let index = 0; index < 35; index++) { reopened.append(completeRecord()); }
      expect(reopened.size()).assertEqual(30);
      const corrupted = completeRecord('bad'); corrupted.stages[0].elapsedMs = Number.NaN;
      expect(restoreRecords([corrupted]).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0800
     * @tc.name      testAppPerformanceExperiments0008
     * @tc.desc      Verify comparison uses content and conditions not record identifiers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0008', (): void => {
      const left = completeRecord('left'); const right = completeRecord('right');
      const comparison = compareRecords(left, right);
      expect(comparison.comparable).assertTrue(); expect(comparison.sameContent).assertTrue();
      expect(comparison.text().indexOf('校验 一致') >= 0).assertTrue();
      right.mode = 'files'; expect(compareRecords(left, right).comparable).assertFalse(); right.mode = 'control';
      right.condition = 'different'; expect(compareRecords(left, right).comparable).assertFalse();
      right.condition = left.condition; right.stages[1].status = '失败'; right.stages[1].elapsedMs = 9000;
      const groups = digestLedger([left, right]);
      expect(groups.length).assertEqual(1); expect(groups[0].medianDuration).assertEqual(60);
      expect(groups[0].p90Duration).assertEqual(60); expect(groups[0].failed).assertEqual(1);
      right.condition = 'different'; expect(digestLedger([left, right]).length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_0900
     * @tc.name      testAppPerformanceExperiments0009
     * @tc.desc      Verify real six-stage metrics preserve missing observations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0009', async (): Promise<void> => {
      expect(flowMetricSamples(undefined).length).assertEqual(0);
      expect(evaluateGate([]).verdict()).assertEqual(GateVerdict.NOT_EVALUABLE);
      expect(evaluateFlowGate(undefined).verdict()).assertEqual(GateVerdict.NOT_EVALUABLE);
      const platform = new LabPlatform(); const service = AppService.fromPlatform(platform);
      try {
        await service.runExperiment('W-NOTES', 'control'); const flow = service.getState().maintenance;
        const samples = flowMetricSamples(flow);
        expect(samples.find((item): boolean => item.key === 'success.ratio')?.value).assertEqual(100);
        expect(samples.filter((item): boolean => item.key.indexOf('stage.') === 0).length).assertEqual(6);
        expect(evaluateFlowGate(flow).verdict()).assertEqual(GateVerdict.PASS);
        if (flow === undefined) { throw new Error('Missing completed flow'); }
        flow.steps[1].status = '跳过';
        expect(flowMetricSamples(flow).some((item): boolean => item.key === 'stage.config.ms')).assertFalse();
        expect(evaluateFlowGate(flow).verdict() === GateVerdict.PASS).assertFalse();
      } finally { service.dispose(); }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEEXPERIMENTS_1000
     * @tc.name      testAppPerformanceExperiments0010
     * @tc.desc      Verify persisted service ledger reopens in original order and export is redacted
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    scenario('testAppPerformanceExperiments0010', async (): Promise<void> => {
      const store = new MemoryStore();
      const platform = new LabPlatform(store);
      const service = AppService.fromPlatform(platform);
      let before: string = '';
      try {
        await service.runExperiment('W-NOTES', 'control'); await service.runExperiment('W-NOTES', 'control');
        await service.whenSaved(); before = service.ledgerRecords().map((record): string => record.id).join('|');
        const text = service.exportLedger(); expect(text.indexOf('fixture-board') < 0).assertTrue();
        expect(text.indexOf('workloads/notes_list.txt') < 0).assertTrue();
        expect(text.indexOf('sample-1') >= 0).assertTrue();
      } finally { service.dispose(); }
      const reopened = AppService.fromPlatform(new LabPlatform(store));
      try {
        expect(reopened.ledgerRecords().map((record): string => record.id).join('|')).assertEqual(before);
      } finally {
        reopened.dispose();
      }
    });
  });
}
