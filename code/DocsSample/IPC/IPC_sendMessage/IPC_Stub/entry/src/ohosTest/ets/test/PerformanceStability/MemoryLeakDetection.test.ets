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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  STUB_DESCRIPTOR,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  MessageSequenceModel,
  MessageOptionModel,
  InProcessClient,
  StubRemoteObjectModel,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  LogBuffer,
  ServiceEventRecorder,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

function fillLogs(logs: LogBuffer, count: number, prefix: string): void {
  for (let index = 0; index < count; index++) {
    logs.info(prefix + String(index));
  }
}

function seqRewindAndRead(sequence: MessageSequenceModel): void {
  sequence.rewind();
  sequence.readString();
  sequence.readString();
}

export default function memoryLeakDetection(): void {
  describe('PerformanceStabilityMemoryLeak', () => {
    beforeAll(() => {
      logSuite('PerformanceStabilityMemoryLeak', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PerformanceStabilityMemoryLeak', 'end');
    });

    /**
     * @tc.name          memoryLeakLogBufferStaysAtLimitAfterThousandWrites
     * @tc.desc          A bounded log never grows past its capacity.
     * @tc.precondition  A sixty-four-line log buffer is created.
     * @tc.steps         1. Write one thousand lines.
     *                   2. Read line and level array lengths.
     *                   3. Check retained fragments.
     * @tc.expected      Both arrays hold sixty-four entries and only recent lines remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakLogBufferStaysAtLimitAfterThousandWrites', 0, () => {
      const logs = new LogBuffer(64);
      fillLogs(logs, 1000, 'grow-');
      expect(logs.size()).assertEqual(64);
      expect(logs.lines.length).assertEqual(64);
      expect(logs.levels.length).assertEqual(64);
      expect(logs.contains('grow-999')).assertTrue();
      expect(logs.contains('grow-936')).assertTrue();
      expect(logs.contains('grow-935')).assertFalse();
      expect(logs.contains('grow-0')).assertFalse();
    });

    /**
     * @tc.name          memoryLeakLogBufferLevelArraysStayAligned
     * @tc.desc          The parallel line and level arrays keep identical lengths.
     * @tc.precondition  A log buffer has overflowed with mixed levels.
     * @tc.steps         1. Write alternating levels to overflow capacity.
     *                   2. Compare array lengths.
     *                   3. Verify each line starts with its level token.
     * @tc.expected      Arrays stay aligned and every line carries a valid prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogBufferLevelArraysStayAligned', 0, () => {
      const logs = new LogBuffer(16);
      for (let index = 0; index < 40; index++) {
        if (index % 3 === 0) {
          logs.error('aligned-' + String(index));
        } else if (index % 3 === 1) {
          logs.warn('aligned-' + String(index));
        } else {
          logs.info('aligned-' + String(index));
        }
      }
      expect(logs.lines.length).assertEqual(16);
      expect(logs.levels.length).assertEqual(16);
      expect(logs.lines.length).assertEqual(logs.levels.length);
      let aligned = 0;
      for (let index = 0; index < logs.lines.length; index++) {
        if (logs.lines[index].startsWith(logs.levels[index] + ' ')) {
          aligned = aligned + 1;
        }
      }
      expect(aligned).assertEqual(16);
      expect(logs.countLevel(LEVEL_INFO) + logs.countLevel(LEVEL_WARN) + logs.countLevel(LEVEL_ERROR)).assertEqual(16);
    });

    /**
     * @tc.name          memoryLeakLogEvictionDropsOldestLine
     * @tc.desc          Overflow removes the oldest entries before newer ones.
     * @tc.precondition  A four-line log buffer is created.
     * @tc.steps         1. Write six numbered lines.
     *                   2. Read the first and last retained lines.
     *                   3. Probe a dropped fragment.
     * @tc.expected      The buffer retains lines two through five only.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogEvictionDropsOldestLine', 0, () => {
      const logs = new LogBuffer(4);
      fillLogs(logs, 6, 'evict-');
      expect(logs.size()).assertEqual(4);
      expect(logs.lines[0]).assertEqual('INFO evict-2');
      expect(logs.lines[3]).assertEqual('INFO evict-5');
      expect(logs.contains('evict-1')).assertFalse();
      expect(logs.contains('evict-2')).assertTrue();
      expect(logs.trace()).assertEqual('INFO evict-2|INFO evict-3|INFO evict-4|INFO evict-5');
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(4);
    });

    /**
     * @tc.name          memoryLeakLogClearReleasesAllLines
     * @tc.desc          Clearing the log releases both line and level arrays.
     * @tc.precondition  A filled log buffer exists.
     * @tc.steps         1. Fill the buffer.
     *                   2. Clear it.
     *                   3. Read all size signals.
     * @tc.expected      Both arrays are empty and no fragment can be found.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakLogClearReleasesAllLines', 0, () => {
      const logs = new LogBuffer(8);
      fillLogs(logs, 8, 'release-');
      expect(logs.size()).assertEqual(8);
      logs.clear();
      expect(logs.size()).assertEqual(0);
      expect(logs.lines.length).assertEqual(0);
      expect(logs.levels.length).assertEqual(0);
      expect(logs.trace()).assertEqual('');
      expect(logs.contains('release-7')).assertFalse();
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakLogClearKeepsLimit
     * @tc.desc          Clearing does not reset the configured capacity.
     * @tc.precondition  A log buffer with a known limit exists.
     * @tc.steps         1. Fill and clear the buffer.
     *                   2. Write two lines.
     *                   3. Compare size and limit.
     * @tc.expected      The limit is unchanged and the new lines fit normally.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogClearKeepsLimit', 0, () => {
      const logs = new LogBuffer(6);
      fillLogs(logs, 10, 'pre-clear-');
      logs.clear();
      logs.warn('post-clear-one');
      logs.error('post-clear-two');
      expect(logs.limit).assertEqual(6);
      expect(logs.size()).assertEqual(2);
      expect(logs.contains('post-clear-two')).assertTrue();
      expect(logs.contains('pre-clear-9')).assertFalse();
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakReclaimedSequenceRefusesGrowth
     * @tc.desc          A reclaimed sequence cannot grow its value list.
     * @tc.precondition  A sequence with two values has been reclaimed.
     * @tc.steps         1. Write two values.
     *                   2. Reclaim the sequence.
     *                   3. Attempt more writes.
     * @tc.expected      The size remains two and every later write fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakReclaimedSequenceRefusesGrowth', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('keep-a');
      sequence.writeString('keep-b');
      sequence.reclaim();
      expect(sequence.writeString('drop-a')).assertFalse();
      expect(sequence.writeString('drop-b')).assertFalse();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.values[0]).assertEqual('keep-a');
      expect(sequence.values[1]).assertEqual('keep-b');
      expect(sequence.writeCount).assertEqual(2);
    });

    /**
     * @tc.name          memoryLeakReclaimedSequenceSizeUnchanged
     * @tc.desc          Reclaiming does not shrink or clear the stored values.
     * @tc.precondition  A sequence holds five values with a moved cursor.
     * @tc.steps         1. Write five values and read three.
     *                   2. Reclaim the sequence.
     *                   3. Read size, cursor and trace.
     * @tc.expected      The value list stays at five while the cursor resets to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakReclaimedSequenceSizeUnchanged', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 5; index++) {
        sequence.writeString('hold-' + String(index));
      }
      sequence.readString();
      sequence.readString();
      sequence.readString();
      expect(sequence.cursor).assertEqual(3);
      sequence.reclaim();
      expect(sequence.size()).assertEqual(5);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('hold-0|hold-1|hold-2|hold-3|hold-4#0');
      expect(sequence.reclaimed).assertTrue();
    });

    /**
     * @tc.name          memoryLeakSequenceRewindDoesNotDuplicateValues
     * @tc.desc          Rewinding moves the cursor without copying the value list.
     * @tc.precondition  A sequence holds two values.
     * @tc.steps         1. Write two values.
     *                   2. Rewind and read both twice.
     *                   3. Compare size and read count.
     * @tc.expected      The size stays two while the read count doubles.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceRewindDoesNotDuplicateValues', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('beta');
      seqRewindAndRead(sequence);
      seqRewindAndRead(sequence);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.values[0]).assertEqual('alpha');
      expect(sequence.values[1]).assertEqual('beta');
      expect(sequence.readCount).assertEqual(4);
      expect(sequence.writeCount).assertEqual(2);
    });

    /**
     * @tc.name          memoryLeakSequenceReadDoesNotRemoveValues
     * @tc.desc          Reading consumes the cursor but never deletes stored values.
     * @tc.precondition  A sequence holds three values.
     * @tc.steps         1. Read all three values.
     *                   2. Inspect the stored array.
     *                   3. Read past the end.
     * @tc.expected      All three values remain stored after being read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceReadDoesNotRemoveValues', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      sequence.writeString('three');
      expect(sequence.readString()).assertEqual('one');
      expect(sequence.readString()).assertEqual('two');
      expect(sequence.readString()).assertEqual('three');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.values.length).assertEqual(3);
    });

    /**
     * @tc.name          memoryLeakRepeatedSequenceReclaimIdempotent
     * @tc.desc          Reclaiming repeatedly leaves the same compact state.
     * @tc.precondition  A reclaimed sequence exists.
     * @tc.steps         1. Reclaim the sequence three more times.
     *                   2. Read size and cursor.
     *                   3. Attempt a write.
     * @tc.expected      Size, cursor and write rejection are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakRepeatedSequenceReclaimIdempotent', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('stable');
      sequence.reclaim();
      sequence.reclaim();
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.values.length).assertEqual(1);
      expect(sequence.writeString('rejected')).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakStubResetDropsRequestRows
     * @tc.desc          Resetting the stub releases every recorded request row.
     * @tc.precondition  A stub holds five request rows.
     * @tc.steps         1. Send five requests.
     *                   2. Reset the stub.
     *                   3. Read ledger and last request.
     * @tc.expected      The ledger is empty and lastRequest is undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakStubResetDropsRequestRows', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(5);
      expect(stub.requestCount()).assertEqual(5);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(StubMetrics.from(stub).fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          memoryLeakStubResetAfterThousandRows
     * @tc.desc          A thousand recorded rows are all released by one reset.
     * @tc.precondition  A stub has accumulated a large ledger.
     * @tc.steps         1. Send one thousand requests.
     *                   2. Reset the stub.
     *                   3. Read ledger and metrics.
     * @tc.expected      The ledger length and every metric return to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakStubResetAfterThousandRows', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(1000);
      expect(stub.requestCount()).assertEqual(1000);
      stub.reset();
      const metrics = StubMetrics.from(stub);
      expect(stub.requests.length).assertEqual(0);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          memoryLeakStubResetRestoresReply
     * @tc.desc          Reset restores the production reply after a custom override.
     * @tc.precondition  A stub reply has been customized.
     * @tc.steps         1. Send with the custom reply.
     *                   2. Reset the stub.
     *                   3. Send again.
     * @tc.expected      The second send returns the stock reply literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakStubResetRestoresReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.replyText = 'temporary-reply';
      const client = new InProcessClient(stub);
      expect(client.send(REQUEST_CODE).replyText).assertEqual('temporary-reply');
      stub.reset();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      const after = client.send(REQUEST_CODE, 'after-restore');
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakStubResetClearsRejectList
     * @tc.desc          Reset releases every configured reject code.
     * @tc.precondition  A stub rejects code one and code two.
     * @tc.steps         1. Confirm code one is blocked.
     *                   2. Reset the stub.
     *                   3. Send code one again.
     * @tc.expected      The reject list is empty and code one is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakStubResetClearsRejectList', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes = [REQUEST_CODE, UNKNOWN_CODE_TWO];
      expect(client.send(REQUEST_CODE).isSuccess()).assertFalse();
      stub.reset();
      expect(stub.rejectCodes.length).assertEqual(0);
      const after = client.send(REQUEST_CODE, 'allowed-now');
      expect(after.isSuccess()).assertTrue();
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          memoryLeakClientResetClearsAllViews
     * @tc.desc          Client reset empties result, reply and send views together.
     * @tc.precondition  A client has completed several requests.
     * @tc.steps         1. Send five requests.
     *                   2. Reset the client.
     *                   3. Read every client array.
     * @tc.expected      All four client arrays are empty and the stub ledger is clear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakClientResetClearsAllViews', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(5);
      expect(client.results.length).assertEqual(5);
      client.reset();
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          memoryLeakClientResetAfterLargeBatch
     * @tc.desc          One hundred result records are released in a single reset.
     * @tc.precondition  A client has sent one hundred requests.
     * @tc.steps         1. Send one hundred requests.
     *                   2. Reset the client.
     *                   3. Confirm every view is empty.
     * @tc.expected      Hundred-entry views collapse to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakClientResetAfterLargeBatch', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(100);
      expect(client.results.length).assertEqual(100);
      expect(stub.requestCount()).assertEqual(100);
      client.reset();
      expect(client.results.length + client.replies.length + client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          memoryLeakServiceLogsBoundedAcrossLifecycle
     * @tc.desc          Lifecycle traffic stays within the service log capacity.
     * @tc.precondition  A service model is created.
     * @tc.steps         1. Record one hundred requests plus lifecycle events.
     *                   2. Read the log size and level count.
     *                   3. Compare with the event count.
     * @tc.expected      The log holds one hundred three lines under its limit of 128.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakServiceLogsBoundedAcrossLifecycle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 100; index++) {
        service.onRequest(index + 1);
      }
      service.onConnect();
      service.onDisconnect();
      expect(service.logs.size()).assertEqual(103);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(103);
      expect(service.logs.contains('onDisconnect')).assertTrue();
      expect(service.events.size()).assertEqual(103);
      expect(service.logs.size() <= service.logs.limit).assertTrue();
      expect(service.requestCount).assertEqual(100);
    });

    /**
     * @tc.name          memoryLeakServiceEventsClearedOnReset
     * @tc.desc          Resetting the service releases its event history.
     * @tc.precondition  A service has recorded lifecycle and request events.
     * @tc.steps         1. Drive several lifecycle callbacks.
     *                   2. Reset the service.
     *                   3. Read the recorder size and trace.
     * @tc.expected      The event recorder is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakServiceEventsClearedOnReset', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      expect(service.events.size()).assertEqual(4);
      service.reset();
      expect(service.events.size()).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.events.last()).assertEqual('');
      expect(service.events.fingerprint()).assertEqual(textFingerprint(''));
      expect(service.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakServiceResetRestoresIdleState
     * @tc.desc          Service reset returns every counter to the idle baseline.
     * @tc.precondition  A service has connected, disconnected and destroyed.
     * @tc.steps         1. Drive a full lifecycle.
     *                   2. Reset the service.
     *                   3. Compare with a fresh service.
     * @tc.expected      State is idle and every counter is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakServiceResetRestoresIdleState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      const fresh = new ServiceLifecycleModel();
      expect(service.state).assertEqual('idle');
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.isAlive()).assertTrue();
      expect(new ServiceSnapshot(service).sameAs(new ServiceSnapshot(fresh))).assertTrue();
    });

    /**
     * @tc.name          memoryLeakServiceResetClearsStubReference
     * @tc.desc          Reset drops the retained stub reference.
     * @tc.precondition  A service is connected and holds a stub.
     * @tc.steps         1. Connect and send one request.
     *                   2. Reset the service.
     *                   3. Read the stub reference.
     * @tc.expected      The stub reference is undefined after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakServiceResetClearsStubReference', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      new InProcessClient(stub).sendMany(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(service.stub === undefined).assertFalse();
      service.reset();
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.state).assertEqual('idle');
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          memoryLeakSnapshotNoGrowthAfterReset
     * @tc.desc          A reset snapshot equals a freshly constructed snapshot.
     * @tc.precondition  A service has accumulated counters.
     * @tc.steps         1. Drive traffic and capture a snapshot.
     *                   2. Reset and capture another snapshot.
     *                   3. Compare descriptions.
     * @tc.expected      The reset snapshot reads idle/0/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSnapshotNoGrowthAfterReset', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      const before = new ServiceSnapshot(service);
      service.reset();
      const after = new ServiceSnapshot(service);
      expect(before.connects).assertEqual(1);
      expect(after.connects).assertEqual(0);
      expect(after.describe()).assertEqual('idle/0/0/0/0');
      expect(after.requests).assertEqual(0);
      expect(after.destroys).assertEqual(0);
      expect(before.sameAs(after)).assertFalse();
      expect(before.state).assertEqual('connected');
    });

    /**
     * @tc.name          memoryLeakEventRecorderClearDropsEntries
     * @tc.desc          Clearing a recorder drops every stored kind and detail.
     * @tc.precondition  A recorder holds five entries.
     * @tc.steps         1. Record five events.
     *                   2. Clear the recorder.
     *                   3. Probe for old entries.
     * @tc.expected      Size, last entry and trace are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakEventRecorderClearDropsEntries', 0, () => {
      const recorder = new ServiceEventRecorder();
      recorder.record('alpha');
      recorder.record('beta', 'detail');
      recorder.record('gamma');
      recorder.record('delta');
      recorder.record('epsilon');
      expect(recorder.size()).assertEqual(5);
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
      expect(recorder.countOf('beta')).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakEventRecorderSizeAfterManyClears
     * @tc.desc          Repeated record-clear cycles never accumulate entries.
     * @tc.precondition  A fresh recorder exists.
     * @tc.steps         1. Record three entries and clear one hundred times.
     *                   2. Read the recorder size.
     *                   3. Compare with a fresh recorder.
     * @tc.expected      The recorder remains empty after every cycle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakEventRecorderSizeAfterManyClears', 0, () => {
      const recorder = new ServiceEventRecorder();
      for (let cycle = 0; cycle < 100; cycle++) {
        recorder.record('cycle-' + String(cycle));
        recorder.record('cycle-' + String(cycle) + '-b');
        recorder.record('cycle-' + String(cycle) + '-c');
        recorder.clear();
      }
      expect(recorder.size()).assertEqual(0);
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(new ServiceEventRecorder().fingerprint());
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
    });

    /**
     * @tc.name          memoryLeakMetricsZeroedAfterReset
     * @tc.desc          Aggregate metrics recomputed after reset report zeros.
     * @tc.precondition  A stub has a mixed workload recorded.
     * @tc.steps         1. Send a mixed plan.
     *                   2. Reset the stub.
     *                   3. Rebuild metrics.
     * @tc.expected      All counters and the fingerprint return to the zero baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakMetricsZeroedAfterReset', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(5);
      client.send(UNKNOWN_CODE_ZERO);
      expect(StubMetrics.from(stub).requests).assertEqual(6);
      stub.reset();
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
    });

    /**
     * @tc.name          memoryLeakMetricsDoNotRetainHistory
     * @tc.desc          Metrics after a reset describe only the new traffic.
     * @tc.precondition  A stub has been reset after prior traffic.
     * @tc.steps         1. Send many requests, then reset.
     *                   2. Send two new requests.
     *                   3. Rebuild metrics.
     * @tc.expected      The request count reads two, not the earlier total.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakMetricsDoNotRetainHistory', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(50);
      stub.reset();
      client.send(REQUEST_CODE, 'new-one');
      client.send(UNKNOWN_CODE_TWO, 'new-two');
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(1);
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('new-one');
      expect(stub.requests[1].text).assertEqual('');
    });

    /**
     * @tc.name          memoryLeakMetricsFingerprintAfterResetMatchesFresh
     * @tc.desc          Reset then replay produces the same fingerprint as a fresh stub.
     * @tc.precondition  A used stub and a fresh stub exist.
     * @tc.steps         1. Reset the used stub.
     *                   2. Replay one plan on both stubs.
     *                   3. Compare fingerprints.
     * @tc.expected      Both fingerprints are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakMetricsFingerprintAfterResetMatchesFresh', 0, () => {
      const used = new StubRemoteObjectModel();
      const usedClient = new InProcessClient(used);
      usedClient.sendMany(9);
      used.reset();
      const fresh = new StubRemoteObjectModel();
      const freshClient = new InProcessClient(fresh);
      for (let index = 0; index < 4; index++) {
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_LARGE;
        usedClient.send(code, 'replay-' + String(index));
        freshClient.send(code, 'replay-' + String(index));
      }
      expect(StubMetrics.from(used).fingerprint()).assertEqual(StubMetrics.from(fresh).fingerprint());
      expect(StubMetrics.from(used).successRatio()).assertEqual(0.5);
      expect(used.requestCount()).assertEqual(4);
      expect(fresh.requestCount()).assertEqual(4);
      expect(used.requests[3].text).assertEqual('');
    });

    /**
     * @tc.name          memoryLeakTwoHundredResetCyclesNoResidualRows
     * @tc.desc          Two hundred full reset cycles leave no residual state.
     * @tc.precondition  A client and stub are constructed.
     * @tc.steps         1. For each cycle, send three and reset the client.
     *                   2. Confirm each cycle started from zero.
     *                   3. Audit the final arrays.
     * @tc.expected      Every cycle ended empty and the client holds no records.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakTwoHundredResetCyclesNoResidualRows', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let cleanEndings = 0;
      for (let cycle = 0; cycle < 200; cycle++) {
        client.sendMany(3);
        client.reset();
        if (stub.requestCount() === 0 && client.results.length === 0) {
          cleanEndings = cleanEndings + 1;
        }
      }
      expect(cleanEndings).assertEqual(200);
      expect(stub.requestCount()).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          memoryLeakClientHistoryBoundedByReset
     * @tc.desc          A client history grows only until it is reset.
     * @tc.precondition  A client is ready for repeated batches.
     * @tc.steps         1. Send fifty requests.
     *                   2. Reset and send ten more.
     *                   3. Compare history lengths.
     * @tc.expected      The history drops from fifty to ten records.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakClientHistoryBoundedByReset', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(50);
      expect(client.results.length).assertEqual(50);
      client.reset();
      client.sendMany(10);
      expect(client.results.length).assertEqual(10);
      expect(client.replies.length).assertEqual(10);
      expect(client.sentCodes.length).assertEqual(10);
      expect(stub.requestCount()).assertEqual(10);
      expect(StubMetrics.from(stub).handled).assertEqual(10);
    });

    /**
     * @tc.name          memoryLeakAlternatingResetKeepsCountsSmall
     * @tc.desc          Resetting after every send keeps all structures minimal.
     * @tc.precondition  A client and stub are constructed.
     * @tc.steps         1. Repeat one hundred times: send then reset.
     *                   2. Sample the count after each reset.
     *                   3. Audit final state.
     * @tc.expected      Every sample reads zero and no array grows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakAlternatingResetKeepsCountsSmall', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let zeroSamples = 0;
      for (let index = 0; index < 100; index++) {
        client.send(REQUEST_CODE, 'ephemeral-' + String(index));
        stub.reset();
        client.results = [];
        client.replies = [];
        client.sentCodes = [];
        client.sentTexts = [];
        if (stub.requestCount() === 0 && client.results.length === 0) {
          zeroSamples = zeroSamples + 1;
        }
      }
      expect(zeroSamples).assertEqual(100);
      expect(stub.requests.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          memoryLeakLogLimitRespectedWithMixedLevels
     * @tc.desc          Mixed-level overflow respects capacity and level accounting.
     * @tc.precondition  A twelve-line log buffer is created.
     * @tc.steps         1. Push sixty entries cycling through all levels.
     *                   2. Read size and level totals.
     *                   3. Verify the totals equal the capacity.
     * @tc.expected      Twelve lines remain and the level counts sum to twelve.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogLimitRespectedWithMixedLevels', 0, () => {
      const logs = new LogBuffer(12);
      for (let index = 0; index < 60; index++) {
        const remainder = index % 3;
        if (remainder === 0) {
          logs.info('mix-' + String(index));
        } else if (remainder === 1) {
          logs.warn('mix-' + String(index));
        } else {
          logs.error('mix-' + String(index));
        }
      }
      const total = logs.countLevel(LEVEL_INFO) + logs.countLevel(LEVEL_WARN) + logs.countLevel(LEVEL_ERROR);
      expect(logs.size()).assertEqual(12);
      expect(total).assertEqual(12);
      expect(logs.lines.length).assertEqual(12);
      expect(logs.contains('mix-59')).assertTrue();
      expect(logs.contains('mix-47')).assertFalse();
      expect(logs.contains('mix-46')).assertFalse();
      expect(logs.limit).assertEqual(12);
    });

    /**
     * @tc.name          memoryLeakWarnBufferBounded
     * @tc.desc          A warning-only stream stays within the log capacity.
     * @tc.precondition  A five-line log buffer is created.
     * @tc.steps         1. Push thirty warning entries.
     *                   2. Read the size and warning count.
     *                   3. Check the retained range.
     * @tc.expected      Five warning lines remain and earlier ones are gone.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakWarnBufferBounded', 0, () => {
      const logs = new LogBuffer(5);
      for (let index = 0; index < 30; index++) {
        logs.warn('warning-' + String(index));
      }
      expect(logs.size()).assertEqual(5);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(5);
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(logs.lines[0]).assertEqual('WARN warning-25');
      expect(logs.lines[4]).assertEqual('WARN warning-29');
      expect(logs.contains('warning-24')).assertFalse();
    });

    /**
     * @tc.name          memoryLeakErrorBufferBounded
     * @tc.desc          An error-only stream stays within the log capacity.
     * @tc.precondition  A four-line log buffer is created.
     * @tc.steps         1. Push forty error entries.
     *                   2. Read the size and error count.
     *                   3. Verify the last entry is retained.
     * @tc.expected      Four error lines remain with the newest retained.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakErrorBufferBounded', 0, () => {
      const logs = new LogBuffer(4);
      for (let index = 0; index < 40; index++) {
        logs.error('failure-' + String(index));
      }
      expect(logs.size()).assertEqual(4);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(4);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(logs.contains('failure-39')).assertTrue();
      expect(logs.contains('failure-36')).assertTrue();
      expect(logs.contains('failure-35')).assertFalse();
      expect(logs.levels[3]).assertEqual(LEVEL_ERROR);
    });

    /**
     * @tc.name          memoryLeakLogContainsDroppedFragmentFalse
     * @tc.desc          Evicted fragments can never be found again.
     * @tc.precondition  A six-line log has overflowed by twenty entries.
     * @tc.steps         1. Push twenty numbered entries.
     *                   2. Probe early, boundary and late fragments.
     *                   3. Read the retained count.
     * @tc.expected      Only entries fourteen through nineteen are found.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogContainsDroppedFragmentFalse', 0, () => {
      const logs = new LogBuffer(6);
      fillLogs(logs, 20, 'probe-');
      expect(logs.contains('probe-0')).assertFalse();
      expect(logs.contains('probe-13')).assertFalse();
      expect(logs.contains('probe-14')).assertTrue();
      expect(logs.contains('probe-19')).assertTrue();
      expect(logs.size()).assertEqual(6);
      expect(logs.lines[0]).assertEqual('INFO probe-14');
      expect(logs.trace()).assertEqual('INFO probe-14|INFO probe-15|INFO probe-16|INFO probe-17|INFO probe-18|INFO probe-19');
    });

    /**
     * @tc.name          memoryLeakSequenceReclaimThenTraceEmptyRead
     * @tc.desc          A reclaimed sequence traces its values but reads nothing.
     * @tc.precondition  A sequence holds two values and is reclaimed.
     * @tc.steps         1. Write two values and reclaim.
     *                   2. Read the trace.
     *                   3. Attempt a read.
     * @tc.expected      The trace shows both values with cursor zero and the read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceReclaimThenTraceEmptyRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('trace-a');
      sequence.writeString('trace-b');
      sequence.reclaim();
      expect(sequence.trace()).assertEqual('trace-a|trace-b#0');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertTrue();
    });

    /**
     * @tc.name          memoryLeakEmptySequenceReadReturnsEmpty
     * @tc.desc          Reading an untouched sequence returns an empty string.
     * @tc.precondition  A new message sequence exists.
     * @tc.steps         1. Read without writing.
     *                   2. Read a second time.
     *                   3. Inspect counters.
     * @tc.expected      Both reads are empty and no read is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakEmptySequenceReadReturnsEmpty', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.size()).assertEqual(0);
      expect(sequence.reclaimed).assertFalse();
    });

    /**
     * @tc.name          memoryLeakEmptySequenceSizeZero
     * @tc.desc          A fresh sequence has an empty trace and zero size.
     * @tc.precondition  A new message sequence exists.
     * @tc.steps         1. Read size and trace.
     *                   2. Write one value.
     *                   3. Confirm size becomes one.
     * @tc.expected      The sequence starts at zero and grows to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakEmptySequenceSizeZero', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.values.length).assertEqual(0);
      sequence.writeString('only');
      expect(sequence.size()).assertEqual(1);
      expect(sequence.trace()).assertEqual('only#0');
      expect(sequence.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakFreshStubHasEmptyLedger
     * @tc.desc          A newly constructed stub owns no request records.
     * @tc.precondition  A stub is constructed without traffic.
     * @tc.steps         1. Read ledger length and last request.
     *                   2. Build metrics.
     *                   3. Confirm the alive flag.
     * @tc.expected      The ledger is empty and metrics read zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakFreshStubHasEmptyLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      expect(stub.requests.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(stub.alive).assertTrue();
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(StubMetrics.from(stub).fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
      expect(stub.rejectCodes.length).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakFreshClientHasEmptyArrays
     * @tc.desc          A newly constructed client holds no history.
     * @tc.precondition  A client is constructed around a fresh stub.
     * @tc.steps         1. Read all four client arrays.
     *                   2. Read the trace.
     *                   3. Confirm the stub reference is shared.
     * @tc.expected      Every client array is empty and the trace is blank.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakFreshClientHasEmptyArrays', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(client.stub === stub).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakFreshRecorderFingerprint
     * @tc.desc          An empty recorder fingerprints the empty string.
     * @tc.precondition  A new event recorder exists.
     * @tc.steps         1. Read size, last and trace.
     *                   2. Compute the fingerprint.
     *                   3. Compare with the empty-string hash.
     * @tc.expected      The fingerprint equals the hash of the empty trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakFreshRecorderFingerprint', 0, () => {
      const recorder = new ServiceEventRecorder();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
      expect(recorder.countOf('anything')).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
      expect(recorder.entries.length).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakResetDoesNotAffectDescriptor
     * @tc.desc          Reset leaves the stub descriptor untouched.
     * @tc.precondition  A stub with the production descriptor exists.
     * @tc.steps         1. Reset the stub several times.
     *                   2. Read the descriptor.
     *                   3. Send one request.
     * @tc.expected      The descriptor remains IPCStubTest after every reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakResetDoesNotAffectDescriptor', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.reset();
      stub.reset();
      stub.reset();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      const client = new InProcessClient(stub);
      expect(client.send(REQUEST_CODE).isSuccess()).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakResetRevivesKilledStub
     * @tc.desc          Reset restores the alive flag of a killed stub.
     * @tc.precondition  A stub has been killed.
     * @tc.steps         1. Kill the stub and confirm rejection.
     *                   2. Reset the stub.
     *                   3. Send again.
     * @tc.expected      The reset makes the stub live and the next send succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakResetRevivesKilledStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      expect(client.send(REQUEST_CODE).isSuccess()).assertFalse();
      expect(stub.alive).assertFalse();
      stub.reset();
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
      const after = client.send(REQUEST_CODE, 'post-reset');
      expect(after.isSuccess()).assertTrue();
      expect(stub.requests[0].text).assertEqual('post-reset');
    });

    /**
     * @tc.name          memoryLeakStubResetDoesNotChangeServiceCounters
     * @tc.desc          Resetting the stub leaves service counters independent.
     * @tc.precondition  A connected service has served traffic.
     * @tc.steps         1. Send through the service stub.
     *                   2. Reset only the stub.
     *                   3. Read service counters.
     * @tc.expected      The stub ledger clears while service counters stay unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakStubResetDoesNotChangeServiceCounters', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(4);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(service.connectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.events.size()).assertEqual(3);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          memoryLeakServiceDestroyThenResetToIdle
     * @tc.desc          A destroyed service can be reset back to the idle baseline.
     * @tc.precondition  A service has completed its destroy callback.
     * @tc.steps         1. Destroy the service.
     *                   2. Reset it.
     *                   3. Read state, counters and events.
     * @tc.expected      The service is idle with zero counters and no events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakServiceDestroyThenResetToIdle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(0);
      expect(service.connectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakLogSpliceKeepsExactCapacity
     * @tc.desc          Every overflow trims exactly the excess entries.
     * @tc.precondition  A five-line log buffer is created.
     * @tc.steps         1. Write thirteen entries.
     *                   2. Read size and boundary lines.
     *                   3. Probe the first dropped entry.
     * @tc.expected      The buffer holds entries eight through twelve.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogSpliceKeepsExactCapacity', 0, () => {
      const logs = new LogBuffer(5);
      fillLogs(logs, 13, 'splice-');
      expect(logs.size()).assertEqual(5);
      expect(logs.lines[0]).assertEqual('INFO splice-8');
      expect(logs.lines[4]).assertEqual('INFO splice-12');
      expect(logs.contains('splice-7')).assertFalse();
      expect(logs.contains('splice-8')).assertTrue();
      expect(logs.levels.length).assertEqual(5);
      expect(logs.lines.length).assertEqual(5);
    });

    /**
     * @tc.name          memoryLeakLargePayloadReleasedWithReset
     * @tc.desc          A large payload row is released from the ledger on reset.
     * @tc.precondition  A client sent one very long payload.
     * @tc.steps         1. Send a five-thousand-character payload.
     *                   2. Reset the stub.
     *                   3. Read ledger and client text length.
     * @tc.expected      The ledger is empty while the client keeps its send record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLargePayloadReleasedWithReset', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let payload = '';
      for (let index = 0; index < 5000; index++) {
        payload = payload + 'z';
      }
      const result = client.send(REQUEST_CODE, payload);
      expect(result.isSuccess()).assertTrue();
      expect(stub.requests[0].text.length).assertEqual(5000);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(1);
      expect(client.sentTexts[0].length).assertEqual(5000);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakReclaimPreventsReplyWrite
     * @tc.desc          A reclaimed reply sequence fails the stub write path.
     * @tc.precondition  A reply sequence has been reclaimed before use.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Invoke the stub.
     *                   3. Inspect the result and ledger row.
     * @tc.expected      The stub returns false and the reply sequence stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakReclaimPreventsReplyWrite', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('request');
      reply.reclaim();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(reply.size()).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requestCount()).assertEqual(1);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakDestroyedServiceLogStillBounded
     * @tc.desc          Log capacity holds even when destruction follows heavy traffic.
     * @tc.precondition  A service model is created.
     * @tc.steps         1. Record two hundred requests.
     *                   2. Destroy the service.
     *                   3. Read the log size.
     * @tc.expected      The log remains capped at one hundred twenty-eight lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakDestroyedServiceLogStillBounded', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 200; index++) {
        service.onRequest(index + 1);
      }
      service.onDestroy();
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.logs.contains('onRequest 73')).assertFalse();
      expect(service.events.size()).assertEqual(202);
      expect(service.destroyCount).assertEqual(1);
      expect(service.logs.size() <= service.logs.limit).assertTrue();
    });

    /**
     * @tc.name          memoryLeakRecorderCountsZeroAfterClear
     * @tc.desc          Kind counters report zero once the recorder is cleared.
     * @tc.precondition  A recorder holds detailed entries of two kinds.
     * @tc.steps         1. Record two kinds with details.
     *                   2. Clear the recorder.
     *                   3. Query each kind count.
     * @tc.expected      Every kind count and the total size are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakRecorderCountsZeroAfterClear', 0, () => {
      const recorder = new ServiceEventRecorder();
      recorder.record('onConnect', 'IPCStubTest');
      recorder.record('onConnect', 'second');
      recorder.record('onDisconnect', 'peer');
      expect(recorder.countOf('onConnect')).assertEqual(2);
      expect(recorder.countOf('onDisconnect')).assertEqual(1);
      recorder.clear();
      expect(recorder.countOf('onConnect')).assertEqual(0);
      expect(recorder.countOf('onDisconnect')).assertEqual(0);
      expect(recorder.size()).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.entries.length).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakResetClearsRejectCodesAndReply
     * @tc.desc          Reset clears both the reject list and the custom reply.
     * @tc.precondition  A stub rejects code one and uses a custom reply.
     * @tc.steps         1. Confirm the blocked and custom behavior.
     *                   2. Reset the stub.
     *                   3. Send code one.
     * @tc.expected      The reject list is empty and the stock reply is used.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakResetClearsRejectCodesAndReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes = [REQUEST_CODE];
      stub.replyText = 'stale-reply';
      expect(client.send(REQUEST_CODE).isSuccess()).assertFalse();
      stub.reset();
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      const after = client.send(REQUEST_CODE, 'clean');
      expect(after.isSuccess()).assertTrue();
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakEmptyLogTraceAndContains
     * @tc.desc          A new log buffer answers empty for every query.
     * @tc.precondition  A log buffer is created without entries.
     * @tc.steps         1. Read size and trace.
     *                   2. Probe contains and level counts.
     *                   3. Confirm the capacity.
     * @tc.expected      Size zero, empty trace and no level counts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakEmptyLogTraceAndContains', 0, () => {
      const logs = new LogBuffer(7);
      expect(logs.size()).assertEqual(0);
      expect(logs.trace()).assertEqual('');
      expect(logs.contains('anything')).assertFalse();
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(logs.limit).assertEqual(7);
    });

    /**
     * @tc.name          memoryLeakClientViewRestartsAfterReset
     * @tc.desc          A reset client starts a fresh history for later sends.
     * @tc.precondition  A client has been reset after a large batch.
     * @tc.steps         1. Reset the client.
     *                   2. Send two new requests.
     *                   3. Read the new history lengths.
     * @tc.expected      Only the two new requests appear in the client view.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakClientViewRestartsAfterReset', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(30);
      client.reset();
      client.send(REQUEST_CODE, 'fresh-1');
      client.send(REQUEST_CODE, 'fresh-2');
      expect(client.results.length).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.sentTexts[0]).assertEqual('fresh-1');
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[1].text).assertEqual('fresh-2');
    });

    /**
     * @tc.name          memoryLeakKillReviveRowsAccounted
     * @tc.desc          Every dead and live send owns exactly one ledger row.
     * @tc.precondition  A stub and client are constructed.
     * @tc.steps         1. Repeat kill, dead send, revive and live send.
     *                   2. Compare row counts with send counts.
     *                   3. Build metrics.
     * @tc.expected      Two hundred rows exist for two hundred sends with no extra rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakKillReviveRowsAccounted', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 100; index++) {
        stub.kill();
        client.send(REQUEST_CODE, 'dead-' + String(index));
        stub.revive();
        client.send(REQUEST_CODE, 'live-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(client.sentCodes.length).assertEqual(200);
      expect(stub.requestCount()).assertEqual(200);
      expect(metrics.requests).assertEqual(200);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.rejected).assertEqual(100);
      expect(client.replies.length).assertEqual(100);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          memoryLeakDefaultLogCapacity
     * @tc.desc          The default log capacity is sixty-four lines.
     * @tc.precondition  A log buffer is created without an explicit limit.
     * @tc.steps         1. Read the default limit.
     *                   2. Push seventy entries.
     *                   3. Read the resulting size.
     * @tc.expected      The limit and final size both read sixty-four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakDefaultLogCapacity', 0, () => {
      const logs = new LogBuffer();
      expect(logs.limit).assertEqual(64);
      fillLogs(logs, 70, 'default-');
      expect(logs.size()).assertEqual(64);
      expect(logs.lines.length).assertEqual(64);
      expect(logs.levels.length).assertEqual(64);
      expect(logs.contains('default-69')).assertTrue();
      expect(logs.lines.indexOf('INFO default-5') >= 0).assertFalse();
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(64);
    });

    /**
     * @tc.name          memoryLeakTwoStubResetIsolation
     * @tc.desc          Resetting one stub does not clear another stub ledger.
     * @tc.precondition  Two stubs each hold request rows.
     * @tc.steps         1. Send traffic to both stubs.
     *                   2. Reset only the first.
     *                   3. Compare both ledgers.
     * @tc.expected      The first ledger is empty while the second keeps its rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakTwoStubResetIsolation', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      firstClient.sendMany(4);
      secondClient.sendMany(4);
      firstStub.reset();
      expect(firstStub.requestCount()).assertEqual(0);
      expect(secondStub.requestCount()).assertEqual(4);
      expect(secondClient.replies.length).assertEqual(4);
      expect(secondClient.sentCodes.length).assertEqual(4);
      expect(firstClient.replies.length).assertEqual(4);
      expect(secondStub.requests[3].text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          memoryLeakFinalAuditNoResidualState
     * @tc.desc          All four model structures are empty after a coordinated reset.
     * @tc.precondition  A full session has produced rows, logs and events.
     * @tc.steps         1. Run a connected session with mixed traffic.
     *                   2. Reset service, stub and client.
     *                   3. Audit every structure.
     * @tc.expected      No ledger rows, log lines, events or client records remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakFinalAuditNoResidualState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 25; index++) {
        const code = index % 5 === 0 ? UNKNOWN_CODE_ZERO : REQUEST_CODE;
        client.send(code, 'audit-' + String(index));
      }
      service.onDisconnect();
      stub.reset();
      client.reset();
      service.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.state).assertEqual('idle');
    });

    /**
     * @tc.name          memoryLeakReclaimKeepsHistoricalCounters
     * @tc.desc          Reclaim resets the cursor but preserves write and read totals.
     * @tc.precondition  A sequence has three writes and one read.
     * @tc.steps         1. Write three values and read one.
     *                   2. Reclaim the sequence.
     *                   3. Read both counters.
     * @tc.expected      Write and read counters remain three and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakReclaimKeepsHistoricalCounters', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('count-a');
      sequence.writeString('count-b');
      sequence.writeString('count-c');
      expect(sequence.readString()).assertEqual('count-a');
      sequence.reclaim();
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.values.length).assertEqual(3);
    });
  });
}
