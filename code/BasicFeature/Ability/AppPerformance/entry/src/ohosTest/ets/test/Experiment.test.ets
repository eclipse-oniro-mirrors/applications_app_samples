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

import { traceParameter } from '../support/TestLog';
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0001 Experiment.test:89 assertTrue actual', verifyWorkload(spec, bytes(padded)).ok)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0001 Experiment.test:90 assertFalse actual', verifyWorkload(spec, bytes('')).ok)).assertFalse();
      });
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0001 Experiment.test:92 assertFalse actual', verifyWorkload(WORKLOADS[1], bytes('Title||2026-11-05\n# padding for size threshold')).ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0001 Experiment.test:93 assertFalse actual', verifyWorkload(WORKLOADS[2], bytes('photo.svg|-1|96')).ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0001 Experiment.test:94 assertFalse actual', verifyWorkload(WORKLOADS[3], bytes('step=1\nname=Alice')).ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0001 Experiment.test:95 assertTrue actual', workloadOf('not-in-package') === undefined)).assertTrue();
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:112 assertEqual actual', ok.status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:112 assertEqual expected', 'success')); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:112 assertTrue actual', ok.dispatched)).assertTrue(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:112 assertFalse actual', ok.inFlight)).assertFalse();
        platform.fileErrorCode = 123;
        const rejected = await service.evictFiles(['entry.hap']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:eviction-rejected-status assertEqual actual', rejected.status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:eviction-rejected-status assertEqual expected', 'rejected')); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:eviction-rejected-code assertEqual actual', rejected.code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:eviction-rejected-code assertEqual expected', 123));
        platform.fileAvailable = false;
        const blocked = await service.evictFiles(['entry.hap']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:118 assertEqual actual', blocked.status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:118 assertEqual expected', 'not-dispatched')); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:118 assertFalse actual', blocked.dispatched)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:119 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:119 assertEqual expected', 2));
        platform.fileAvailable = true; platform.fileErrorCode = -1; platform.deferFile = true;
        const pending = service.evictFiles(['entry.hap']); platform.advance(10000);
        const timeout = await pending;
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:123 assertEqual actual', timeout.status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:123 assertEqual expected', 'timeout')); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:123 assertTrue actual', timeout.inFlight)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:124 assertTrue actual', timeout.dispatched)).assertTrue();
        platform.releaseFile(); await drain(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0002 Experiment.test:125 assertFalse actual', service.isExperimentBusy())).assertFalse();
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:143 assertTrue actual', record.complete())).assertTrue(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:143 assertEqual actual', record.requestStatus)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:143 assertEqual expected', 'not-requested'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:144 assertEqual actual', record.stages.map((stage): string => stage.key).join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:144 assertEqual expected', FLOW_KEYS.join('|')));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:145 assertEqual actual', platform.names.join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:145 assertEqual expected', 'workloads/notes_list.txt|workloads/notes_list.txt'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:control-native-file-call-count assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:control-native-file-call-count assertEqual expected', 0)); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:control-ledger-record-count assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:control-ledger-record-count assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:147 assertTrue actual', record.condition.length > 0)).assertTrue();
        record.note = 'caller mutation'; expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0003 Experiment.test:148 assertFalse actual', service.ledgerRecords()[0].note === 'caller mutation')).assertFalse();
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
          expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:172 assertFalse actual', record.complete())).assertFalse(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:172 assertTrue actual', record.skipped() > 0)).assertTrue();
          expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:173 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:173 assertEqual expected', 1));
          expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:174 assertEqual actual', digestLedger(service.ledgerRecords())[0].medianDuration)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:174 assertEqual expected', -1));
          if (failure < 3) { expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:175 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0004 Experiment.test:175 assertEqual expected', 0)); }
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:195 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:195 assertEqual expected', 1));
        platform.advance(10000); const record = required(await running);
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:197 assertEqual actual', record.stages[3].status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:197 assertEqual expected', '超时')); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:197 assertFalse actual', record.complete())).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-native-quarantine assertTrue actual', service.isQuarantined())).assertTrue(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-experiment-busy assertTrue actual', service.isExperimentBusy())).assertTrue();
        const blocked = await service.evictFiles(['entry.hap']); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:199 assertFalse actual', blocked.dispatched)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:200 assertTrue actual', await service.runExperiment('W-NOTES', 'control') === undefined)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-native-file-call-count assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-native-file-call-count assertEqual expected', 1)); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-ledger-record-count assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-ledger-record-count assertEqual expected', 1));
        platform.releaseFile(); await drain();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:203 assertFalse actual', service.isExperimentBusy())).assertFalse(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:203 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:203 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:204 assertEqual actual', service.ledgerRecords()[0].stages[3].status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:204 assertEqual expected', '超时'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-resource-read-count assertEqual actual', platform.names.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-resource-read-count assertEqual expected', 1)); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-pending-timer-count assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0005 Experiment.test:timeout-pending-timer-count assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:225 assertEqual actual', record.stages[3].status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:225 assertEqual expected', '已取消')); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:225 assertTrue actual', service.isQuarantined())).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:cancellation-pending-timer-count assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:cancellation-pending-timer-count assertEqual expected', 0)); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:cancellation-ledger-record-count assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:cancellation-ledger-record-count assertEqual expected', 1));
        platform.releaseFile(); await drain();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:228 assertFalse actual', service.isExperimentBusy())).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:229 assertEqual actual', service.ledgerRecords()[0].stages[3].status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:229 assertEqual expected', '已取消'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0006 Experiment.test:230 assertTrue actual', service.getState().logs.some((row): boolean =>
          row.code === 678 && row.api === 'evictFilePages'))).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:251 assertEqual actual', reopened.all().map((record): string => record.id).join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:251 assertEqual expected', 'EXP-2|EXP-1'));
      reopened.restore(reopened.all()); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:252 assertEqual actual', reopened.all()[0].id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:252 assertEqual expected', 'EXP-2'));
      const duplicate = reopened.append(first); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:253 assertFalse actual', duplicate.id === 'EXP-1')).assertFalse();
      duplicate.stages[0].status = '失败'; expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:254 assertEqual actual', reopened.all()[0].stages[0].status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:254 assertEqual expected', '成功'));
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:255 assertEqual actual', restoreRecords([first, first]).length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:255 assertEqual expected', 1));
      first.stages[1].status = '跳过'; expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:256 assertFalse actual', first.complete())).assertFalse();
      for (let index = 0; index < 35; index++) { reopened.append(completeRecord()); }
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:258 assertEqual actual', reopened.size())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:258 assertEqual expected', 30));
      const corrupted = completeRecord('bad'); corrupted.stages[0].elapsedMs = Number.NaN;
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:260 assertEqual actual', restoreRecords([corrupted]).length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0007 Experiment.test:260 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:matching-records-comparable assertTrue actual', comparison.comparable)).assertTrue(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:matching-records-same-content assertTrue actual', comparison.sameContent)).assertTrue();
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:277 assertTrue actual', comparison.text().indexOf('校验 一致') >= 0)).assertTrue();
      right.mode = 'files'; expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:278 assertFalse actual', compareRecords(left, right).comparable)).assertFalse(); right.mode = 'control';
      right.condition = 'different'; expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:279 assertFalse actual', compareRecords(left, right).comparable)).assertFalse();
      right.condition = left.condition; right.stages[1].status = '失败'; right.stages[1].elapsedMs = 9000;
      const groups = digestLedger([left, right]);
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-group-count assertEqual actual', groups.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-group-count assertEqual expected', 1)); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-median-duration assertEqual actual', groups[0].medianDuration)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-median-duration assertEqual expected', 60));
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-p90-duration assertEqual actual', groups[0].p90Duration)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-p90-duration assertEqual expected', 60)); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-failed-count assertEqual actual', groups[0].failed)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:same-condition-failed-count assertEqual expected', 1));
      right.condition = 'different'; expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:284 assertEqual actual', digestLedger([left, right]).length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0008 Experiment.test:284 assertEqual expected', 2));
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
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:298 assertEqual actual', flowMetricSamples(undefined).length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:298 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:299 assertEqual actual', evaluateGate([]).verdict())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:299 assertEqual expected', GateVerdict.NOT_EVALUABLE));
      expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:300 assertEqual actual', evaluateFlowGate(undefined).verdict())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:300 assertEqual expected', GateVerdict.NOT_EVALUABLE));
      const platform = new LabPlatform(); const service = AppService.fromPlatform(platform);
      try {
        await service.runExperiment('W-NOTES', 'control'); const flow = service.getState().maintenance;
        const samples = flowMetricSamples(flow);
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:305 assertEqual actual', samples.find((item): boolean => item.key === 'success.ratio')?.value)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:305 assertEqual expected', 100));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:306 assertEqual actual', samples.filter((item): boolean => item.key.indexOf('stage.') === 0).length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:306 assertEqual expected', 6));
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:307 assertEqual actual', evaluateFlowGate(flow).verdict())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:307 assertEqual expected', GateVerdict.PASS));
        if (flow === undefined) { throw new Error('Missing completed flow'); }
        flow.steps[1].status = '跳过';
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:310 assertFalse actual', flowMetricSamples(flow).some((item): boolean => item.key === 'stage.config.ms'))).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0009 Experiment.test:311 assertFalse actual', evaluateFlowGate(flow).verdict() === GateVerdict.PASS)).assertFalse();
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
        const text = service.exportLedger(); expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0010 Experiment.test:333 assertTrue actual', text.indexOf('fixture-board') < 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0010 Experiment.test:334 assertTrue actual', text.indexOf('workloads/notes_list.txt') < 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0010 Experiment.test:335 assertTrue actual', text.indexOf('sample-1') >= 0)).assertTrue();
      } finally { service.dispose(); }
      const reopened = AppService.fromPlatform(new LabPlatform(store));
      try {
        expect(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0010 Experiment.test:339 assertEqual actual', reopened.ledgerRecords().map((record): string => record.id).join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceExperiments_0010 Experiment.test:339 assertEqual expected', before));
      } finally {
        reopened.dispose();
      }
    });
  });
}
