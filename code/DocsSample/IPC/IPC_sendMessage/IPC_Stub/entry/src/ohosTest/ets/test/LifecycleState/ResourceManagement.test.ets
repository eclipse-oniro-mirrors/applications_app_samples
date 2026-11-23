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
import { logSuite, logStep } from '../Shared/Support';
import {
  EVENT_ON_CONNECT,
  EVENT_ON_DESTROY,
  EVENT_ON_DISCONNECT,
  EVENT_ON_REQUEST,
  LEVEL_ERROR,
  LEVEL_INFO,
  LEVEL_WARN,
  REPLY_PAYLOAD,
  STUB_DESCRIPTOR,
  InProcessClient,
  LogBuffer,
  MessageSequenceModel,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  StubRemoteObjectModel
} from '../Shared/SharedDriver';

function newSequence(): MessageSequenceModel {
  return MessageSequenceModel.create();
}

function filledSequence(values: string[]): MessageSequenceModel {
  const sequence = MessageSequenceModel.create();
  for (let index = 0; index < values.length; index++) {
    sequence.writeString(values[index]);
  }
  return sequence;
}

function newStub(): StubRemoteObjectModel {
  return new StubRemoteObjectModel();
}

function resetModel(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function stubUsed(stub: StubRemoteObjectModel, count: number): void {
  const client = new InProcessClient(stub);
  for (let index = 0; index < count; index++) {
    client.send(1, 'payload-' + String(index));
  }
}

export default function resourceManagement(): void {
  describe('ResourceManagement', () => {
    beforeAll(() => {
      logSuite('ResourceManagement', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ResourceManagement', 'end');
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimReleasesValues
     * @tc.desc          Reclaiming a sequence releases it from further writes.
     * @tc.precondition  A sequence with two written strings is available.
     * @tc.steps         1. Write two strings.
     *                   2. Reclaim the sequence.
     *                   3. Attempt a third write.
     * @tc.expected      The reclaim flag is set, the write fails and the size holds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceReclaimReleasesValues', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['a', 'b']);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertFalse();
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.writeString('c')).assertFalse();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.values[1]).assertEqual('b');
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimResetsCursor
     * @tc.desc          Reclaim rewinds the cursor to the released baseline.
     * @tc.precondition  A sequence has been read once.
     * @tc.steps         1. Write two strings and read one.
     *                   2. Reclaim the sequence.
     *                   3. Read the cursor and reclaimed flag.
     * @tc.expected      The cursor resets to zero and reads stop advancing it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceReclaimResetsCursor', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['x', 'y']);
      expect(sequence.readString()).assertEqual('x');
      expect(sequence.cursor).assertEqual(1);
      sequence.reclaim();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimBlocksWrites
     * @tc.desc          Every write after reclaim fails without touching storage.
     * @tc.precondition  A reclaimed empty sequence is available.
     * @tc.steps         1. Reclaim a fresh sequence.
     *                   2. Attempt three writes.
     *                   3. Read the size and write count.
     * @tc.expected      All three writes fail and the storage stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceReclaimBlocksWrites', 0, () => {
      const sequence: MessageSequenceModel = newSequence();
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.writeString('a')).assertFalse();
      expect(sequence.writeString('b')).assertFalse();
      expect(sequence.writeString('c')).assertFalse();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.values.length).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimBlocksReads
     * @tc.desc          Every read after reclaim returns an empty string.
     * @tc.precondition  A sequence with three values is reclaimed.
     * @tc.steps         1. Write three values.
     *                   2. Reclaim the sequence.
     *                   3. Read three times.
     * @tc.expected      All reads are empty and the read count stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceReclaimBlocksReads', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['p', 'q', 'r']);
      sequence.reclaim();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.values[2]).assertEqual('r');
      expect(sequence.trace()).assertEqual('p|q|r#0');
    });

    /**
     * @tc.name          resourceManagementSequenceReadCountPersists
     * @tc.desc          The read counter accumulates across reads until reclaim.
     * @tc.precondition  A sequence with two values is available.
     * @tc.steps         1. Read both values.
     *                   2. Read once beyond the end.
     *                   3. Compare the read count.
     * @tc.expected      The read count is two and the overshoot read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceReadCountPersists', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['one', 'two']);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.readString()).assertEqual('one');
      expect(sequence.readString()).assertEqual('two');
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
    });

    /**
     * @tc.name          resourceManagementSequenceWriteCountPersists
     * @tc.desc          The write counter tracks every accepted write.
     * @tc.precondition  A fresh sequence is available.
     * @tc.steps         1. Write four values.
     *                   2. Read the write count.
     *                   3. Rewind and read all values.
     * @tc.expected      The write count stays four after reading.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceWriteCountPersists', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['a', 'b', 'c', 'd']);
      expect(sequence.writeCount).assertEqual(4);
      expect(sequence.size()).assertEqual(4);
      sequence.readString();
      sequence.readString();
      expect(sequence.writeCount).assertEqual(4);
      sequence.rewind();
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.writeCount).assertEqual(4);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.values.length).assertEqual(4);
    });

    /**
     * @tc.name          resourceManagementSequenceRewindReleasesCursor
     * @tc.desc          Rewind releases the cursor without releasing values.
     * @tc.precondition  A fully read sequence is available.
     * @tc.steps         1. Read both values.
     *                   2. Invoke rewind.
     *                   3. Read the first value again.
     * @tc.expected      The cursor restarts and values remain intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceRewindReleasesCursor', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['m', 'n']);
      expect(sequence.readString()).assertEqual('m');
      expect(sequence.readString()).assertEqual('n');
      expect(sequence.cursor).assertEqual(2);
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('m');
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertFalse();
      expect(sequence.values[0]).assertEqual('m');
      expect(sequence.values[1]).assertEqual('n');
    });

    /**
     * @tc.name          resourceManagementSequenceMultipleBatches
     * @tc.desc          Separate sequences keep independent resource lifecycles.
     * @tc.precondition  Two fresh sequences are available.
     * @tc.steps         1. Fill the first and reclaim it.
     *                   2. Fill and read the second.
     *                   3. Compare both states.
     * @tc.expected      The reclaimed sequence rejects writes while the second works.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceMultipleBatches', 0, () => {
      const released: MessageSequenceModel = filledSequence(['old']);
      const active: MessageSequenceModel = filledSequence(['new-1', 'new-2']);
      released.reclaim();
      expect(released.writeString('ignored')).assertFalse();
      expect(active.writeString('new-3')).assertTrue();
      expect(active.size()).assertEqual(3);
      expect(active.readString()).assertEqual('new-1');
      expect(active.readString()).assertEqual('new-2');
      expect(active.readString()).assertEqual('new-3');
      expect(released.readString()).assertEqual('');
      expect(released.size()).assertEqual(1);
      expect(released.reclaimed).assertTrue();
    });

    /**
     * @tc.name          resourceManagementLogBufferCapsAtLimit
     * @tc.desc          The log buffer never exceeds its configured limit.
     * @tc.precondition  A log buffer with limit eight is available.
     * @tc.steps         1. Push ten info lines.
     *                   2. Read the buffer size.
     *                   3. Read the retained trace.
     * @tc.expected      The size is eight and the oldest two lines are gone.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementLogBufferCapsAtLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(8);
      for (let index = 1; index <= 10; index++) {
        buffer.info('line-' + String(index));
      }
      expect(buffer.size()).assertEqual(8);
      expect(buffer.limit).assertEqual(8);
      expect(buffer.size()).assertEqual(buffer.limit);
      expect(buffer.lines.indexOf('INFO line-1') >= 0).assertFalse();
      expect(buffer.contains('line-2')).assertFalse();
      expect(buffer.contains('line-3')).assertTrue();
      expect(buffer.contains('line-10')).assertTrue();
      expect(buffer.lines[0]).assertEqual('INFO line-3');
      expect(buffer.lines[7]).assertEqual('INFO line-10');
    });

    /**
     * @tc.name          resourceManagementLogBufferTrimKeepsNewest
     * @tc.desc          Trimming preserves the newest entries in order.
     * @tc.precondition  A log buffer with limit four is available.
     * @tc.steps         1. Push six warning lines.
     *                   2. Read the buffer.
     *                   3. Count the retained level.
     * @tc.expected      The last four warnings persist in push order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferTrimKeepsNewest', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      for (let index = 1; index <= 6; index++) {
        buffer.warn('w' + String(index));
      }
      expect(buffer.size()).assertEqual(4);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(4);
      expect(buffer.lines[0]).assertEqual('WARN w3');
      expect(buffer.lines[3]).assertEqual('WARN w6');
      expect(buffer.contains('w2')).assertFalse();
      expect(buffer.contains('w3')).assertTrue();
      expect(buffer.levels.length).assertEqual(4);
      expect(buffer.trace()).assertEqual('WARN w3|WARN w4|WARN w5|WARN w6');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementLogBufferClearReleases
     * @tc.desc          Clear releases both the line and level arrays.
     * @tc.precondition  A buffer with mixed levels is available.
     * @tc.steps         1. Push info, warning and error lines.
     *                   2. Clear the buffer.
     *                   3. Read sizes and counts.
     * @tc.expected      Both arrays are empty and every level count is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferClearReleases', 0, () => {
      const buffer: LogBuffer = new LogBuffer(16);
      buffer.info('i1');
      buffer.warn('w1');
      buffer.error('e1');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.levels.length).assertEqual(3);
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(buffer.contains('i1')).assertFalse();
      expect(buffer.trace()).assertEqual('');
      expect(buffer.limit).assertEqual(16);
    });

    /**
     * @tc.name          resourceManagementLogBufferLevelCounts
     * @tc.desc          Level counters track each severity independently.
     * @tc.precondition  A buffer with default limit is available.
     * @tc.steps         1. Push two info, one warning and one error.
     *                   2. Count each level.
     *                   3. Sum the counts.
     * @tc.expected      The counts are two, one and one and sum to four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferLevelCounts', 0, () => {
      const buffer: LogBuffer = new LogBuffer(32);
      buffer.info('a');
      buffer.info('b');
      buffer.warn('c');
      buffer.error('d');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel('DEBUG')).assertEqual(0);
      expect(buffer.size()).assertEqual(4);
      expect(buffer.levels.length).assertEqual(4);
      expect(buffer.trace()).assertEqual('INFO a|INFO b|WARN c|ERROR d');
      expect(buffer.contains('WARN c')).assertTrue();
      expect(buffer.contains('DEBUG')).assertFalse();
    });

    /**
     * @tc.name          resourceManagementStubResetClearsRequests
     * @tc.desc          Resetting a stub releases its full request ledger.
     * @tc.precondition  A stub has served three requests.
     * @tc.steps         1. Send three code-one requests.
     *                   2. Reset the stub.
     *                   3. Read the ledger and counters.
     * @tc.expected      The ledger is empty and the request count is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementStubResetClearsRequests', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      stubUsed(stub, 3);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests.length).assertEqual(3);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(stub.alive).assertTrue();
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(stub.rejectCodes.length).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementStubResetKeepsDescriptor
     * @tc.desc          Reset preserves the stub descriptor and reply literal.
     * @tc.precondition  A stub with a custom reply text is available.
     * @tc.steps         1. Change the reply text and send a request.
     *                   2. Reset the stub.
     *                   3. Read descriptor and reply text.
     * @tc.expected      The descriptor holds and the reply literal returns to default.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementStubResetKeepsDescriptor', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      stub.replyText = 'custom-reply';
      const result = new InProcessClient(stub).send(1, 'x');
      expect(result.replyText).assertEqual('custom-reply');
      stub.reset();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(0);
      const again = new InProcessClient(stub).send(1, 'y');
      expect(again.replyText).assertEqual(REPLY_PAYLOAD);
      expect(again.isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementStubResetKeepsAlive
     * @tc.desc          Reset revives no killed stub and keeps a live stub live.
     * @tc.precondition  One live and one killed stub are available.
     * @tc.steps         1. Kill the second stub.
     *                   2. Reset both stubs.
     *                   3. Read both alive flags.
     * @tc.expected      The live stub stays alive and the killed stub stays dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubResetKeepsAlive', 0, () => {
      const live: StubRemoteObjectModel = newStub();
      const killed: StubRemoteObjectModel = newStub();
      killed.kill();
      expect(killed.alive).assertFalse();
      live.reset();
      killed.reset();
      expect(live.alive).assertTrue();
      expect(killed.alive).assertTrue();
      expect(live.requestCount()).assertEqual(0);
      expect(killed.requestCount()).assertEqual(0);
      expect(live.rejectCodes.length).assertEqual(0);
      expect(killed.rejectCodes.length).assertEqual(0);
      expect(live.descriptor).assertEqual(killed.descriptor);
    });

    /**
     * @tc.name          resourceManagementStubResetClearsRejects
     * @tc.desc          Reset releases configured reject codes.
     * @tc.precondition  A stub rejects code one.
     * @tc.steps         1. Add code one to the reject list.
     *                   2. Confirm the request is rejected.
     *                   3. Reset and resend.
     * @tc.expected      After reset the same code is handled successfully.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubResetClearsRejects', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      stub.rejectCodes.push(1);
      const blocked = new InProcessClient(stub).send(1, 'blocked');
      expect(blocked.isSuccess()).assertFalse();
      expect(stub.requestCount()).assertEqual(1);
      stub.reset();
      expect(stub.rejectCodes.length).assertEqual(0);
      const allowed = new InProcessClient(stub).send(1, 'allowed');
      expect(allowed.isSuccess()).assertTrue();
      expect(allowed.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementClientResetClearsLedger
     * @tc.desc          Client reset releases every ledger array.
     * @tc.precondition  A client has sent two requests.
     * @tc.steps         1. Send two requests.
     *                   2. Reset the client.
     *                   3. Read every ledger length.
     * @tc.expected      All ledger arrays are empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetClearsLedger', 0, () => {
      const client: InProcessClient = new InProcessClient(newStub());
      client.send(1, 'a');
      client.send(1, 'b');
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      client.reset();
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          resourceManagementClientResetResetsStub
     * @tc.desc          Client reset also resets the driven stub resources.
     * @tc.precondition  A client with a used stub is available.
     * @tc.steps         1. Add a reject code and send a request.
     *                   2. Reset the client.
     *                   3. Send a valid request.
     * @tc.expected      The stub ledger restarts and the invalid reject is gone.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementClientResetResetsStub', 0, () => {
      const client: InProcessClient = new InProcessClient(newStub());
      client.stub.rejectCodes.push(1);
      client.send(1, 'blocked');
      expect(client.stub.rejectCodes.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      client.reset();
      expect(client.stub.rejectCodes.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.stub.alive).assertTrue();
      const allowed = client.send(1, 'allowed');
      expect(allowed.isSuccess()).assertTrue();
      expect(allowed.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementLifecycleResetClearsStub
     * @tc.desc          Lifecycle reset releases the bound stub reference.
     * @tc.precondition  A connected service holds a stub.
     * @tc.steps         1. Connect the service.
     *                   2. Reset the service.
     *                   3. Read the stub field and state.
     * @tc.expected      The stub field is undefined and the state is idle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLifecycleResetClearsStub', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(service.stub === stub).assertTrue();
      service.reset();
      expect(service.stub).assertUndefined();
      expect(service.state).assertEqual('idle');
      expect(service.connectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.logs.contains('onConnect')).assertFalse();
      expect(service.isAlive()).assertTrue();
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          resourceManagementLifecycleResetClearsCounters
     * @tc.desc          Lifecycle reset zeroes every counter resource.
     * @tc.precondition  A service has walked all callbacks.
     * @tc.steps         1. Walk all callbacks.
     *                   2. Reset the service.
     *                   3. Read all counters.
     * @tc.expected      Every counter is zero after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLifecycleResetClearsCounters', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onRequest(2);
      service.onDisconnect();
      service.onDestroy();
      expect(service.requestCount).assertEqual(2);
      service.reset();
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(new ServiceSnapshot(service).describe()).assertEqual('idle/0/0/0/0');
      expect(service.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementLifecycleResetClearsEvents
     * @tc.desc          Lifecycle reset releases the event recorder contents.
     * @tc.precondition  A service has recorded several events.
     * @tc.steps         1. Create, connect and request.
     *                   2. Reset the service.
     *                   3. Read the recorder.
     * @tc.expected      The recorder is empty with a zero fingerprint baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLifecycleResetClearsEvents', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      const before: number = service.events.fingerprint();
      expect(service.events.size()).assertEqual(3);
      service.reset();
      expect(service.events.size()).assertEqual(0);
      expect(service.events.entries.length).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.events.last()).assertEqual('');
      expect(service.events.fingerprint() === before).assertFalse();
      expect(service.events.fingerprint()).assertEqual(new ServiceLifecycleModel().events.fingerprint());
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementLifecycleResetClearsLogs
     * @tc.desc          Lifecycle reset releases the log buffer resources.
     * @tc.precondition  A service has written several log lines.
     * @tc.steps         1. Create and connect twice.
     *                   2. Reset the service.
     *                   3. Read the log buffer.
     * @tc.expected      The log buffer is empty and retains its capacity.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLifecycleResetClearsLogs', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      service.onConnect();
      expect(service.logs.size()).assertEqual(3);
      service.reset();
      expect(service.logs.size()).assertEqual(0);
      expect(service.logs.lines.length).assertEqual(0);
      expect(service.logs.levels.length).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(service.logs.trace()).assertEqual('');
      expect(service.logs.contains('onConnect')).assertFalse();
      expect(service.logs.limit).assertEqual(128);
      service.onCreate();
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
    });

    /**
     * @tc.name          resourceManagementMetricsZeroForFreshStub
     * @tc.desc          A fresh stub reports zero metrics.
     * @tc.precondition  A new stub is available.
     * @tc.steps         1. Compute metrics from the fresh stub.
     *                   2. Read each metric field.
     *                   3. Read the success ratio.
     * @tc.expected      All counters are zero and the ratio is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementMetricsZeroForFreshStub', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(newStub()).fingerprint());
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          resourceManagementMetricsAfterRejects
     * @tc.desc          Metrics split handled and rejected requests correctly.
     * @tc.precondition  A stub is wrapped in a client.
     * @tc.steps         1. Send two valid and two unknown codes.
     *                   2. Compute metrics.
     *                   3. Read the success ratio.
     * @tc.expected      Requests are four with two handled and two rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementMetricsAfterRejects', 0, () => {
      const client: InProcessClient = new InProcessClient(newStub());
      client.send(1, 'ok-1');
      client.send(0, 'bad-1');
      client.send(1, 'ok-2');
      client.send(2, 'bad-2');
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.successRatio()).assertLarger(0.4);
      expect(metrics.successRatio()).assertLess(0.6);
      expect(client.stub.requestCount()).assertEqual(4);
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name          resourceManagementMetricsFingerprint
     * @tc.desc          Metrics fingerprints distinguish different request mixes.
     * @tc.precondition  Two stubs with different ledgers are available.
     * @tc.steps         1. Drive only valid requests on the first stub.
     *                   2. Drive one invalid request on the second.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints differ while request counts may match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementMetricsFingerprint', 0, () => {
      const valid: StubRemoteObjectModel = newStub();
      const mixed: StubRemoteObjectModel = newStub();
      new InProcessClient(valid).send(1, 'v');
      const mixedClient: InProcessClient = new InProcessClient(mixed);
      mixedClient.send(1, 'v');
      mixedClient.send(9, 'x');
      const validMetrics: StubMetrics = StubMetrics.from(valid);
      const mixedMetrics: StubMetrics = StubMetrics.from(mixed);
      expect(validMetrics.requests).assertEqual(1);
      expect(mixedMetrics.requests).assertEqual(2);
      expect(validMetrics.fingerprint() === mixedMetrics.fingerprint()).assertFalse();
      expect(validMetrics.handled).assertEqual(1);
      expect(mixedMetrics.handled).assertEqual(1);
      expect(mixedMetrics.rejected).assertEqual(1);
      expect(validMetrics.replies).assertEqual(1);
      expect(mixedMetrics.replies).assertEqual(1);
      expect(validMetrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementMetricsSuccessRatio
     * @tc.desc          The success ratio reflects handled over total requests.
     * @tc.precondition  A stub has served three of four requests.
     * @tc.steps         1. Send three valid and one invalid request.
     *                   2. Compute metrics.
     *                   3. Read the ratio.
     * @tc.expected      The ratio is 0.75 within comparison tolerance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementMetricsSuccessRatio', 0, () => {
      const client: InProcessClient = new InProcessClient(newStub());
      client.send(1, 'a');
      client.send(1, 'b');
      client.send(1, 'c');
      client.send(-1, 'd');
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.successRatio()).assertLarger(0.7);
      expect(metrics.successRatio()).assertLess(0.8);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(metrics.replies).assertEqual(3);
      expect(client.stub.requestCount()).assertEqual(4);
      expect(client.results[3].isSuccess()).assertFalse();
    });

    /**
     * @tc.name          resourceManagementStubKillReleasesHandling
     * @tc.desc          Killing a stub releases it from handling requests.
     * @tc.precondition  A live stub is available.
     * @tc.steps         1. Kill the stub.
     *                   2. Send a code-one request.
     *                   3. Read the result and ledger.
     * @tc.expected      The request fails and is still recorded in the ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubKillReleasesHandling', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      const client: InProcessClient = new InProcessClient(stub);
      stub.kill();
      const result = client.send(1, 'dead');
      expect(stub.alive).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(result.handled).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(result.errCode).assertLarger(0);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.handled).assertFalse();
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementStubReviveRestoresHandling
     * @tc.desc          Reviving a stub restores request handling.
     * @tc.precondition  A killed stub is available.
     * @tc.steps         1. Kill and revive the stub.
     *                   2. Send a code-one request.
     *                   3. Read the reply and metrics.
     * @tc.expected      The request succeeds after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubReviveRestoresHandling', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      stub.kill();
      stub.revive();
      expect(stub.alive).assertTrue();
      const result = new InProcessClient(stub).send(1, 'revived');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.handled).assertTrue();
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimIdempotent
     * @tc.desc          Reclaiming twice keeps the released state stable.
     * @tc.precondition  A sequence with one value is reclaimed.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Reclaim it again.
     *                   3. Read the flags and storage.
     * @tc.expected      The second reclaim changes nothing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceReclaimIdempotent', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['only']);
      sequence.reclaim();
      const sizeAfterFirst: number = sequence.size();
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.size()).assertEqual(sizeAfterFirst);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.writeString('blocked')).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace()).assertEqual('only#0');
    });

    /**
     * @tc.name          resourceManagementLogBufferClearIdempotent
     * @tc.desc          Clearing an empty buffer remains harmless.
     * @tc.precondition  An empty buffer is available.
     * @tc.steps         1. Clear the buffer twice.
     *                   2. Read sizes and limit.
     *                   3. Push one line afterwards.
     * @tc.expected      The buffer stays empty and remains usable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementLogBufferClearIdempotent', 0, () => {
      const buffer: LogBuffer = new LogBuffer(12);
      buffer.clear();
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.limit).assertEqual(12);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      buffer.info('resume');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO resume');
      expect(buffer.contains('resume')).assertTrue();
      expect(buffer.trace()).assertEqual('INFO resume');
    });

    /**
     * @tc.name          resourceManagementResetIdempotent
     * @tc.desc          Resetting twice keeps the service at the idle baseline.
     * @tc.precondition  A service has completed create and connect callbacks.
     * @tc.steps         1. Walk some callbacks.
     *                   2. Reset twice.
     *                   3. Read state and containers.
     * @tc.expected      Both resets leave the same idle baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementResetIdempotent', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      service.reset();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.isAlive()).assertTrue();
      expect(service.logs.limit).assertEqual(128);
      expect(new ServiceSnapshot(service).describe()).assertEqual('idle/0/0/0/0');
    });

    /**
     * @tc.name          resourceManagementStubResetIdempotent
     * @tc.desc          Resetting a clean stub twice changes nothing.
     * @tc.precondition  A used stub has already been reset.
     * @tc.steps         1. Use and reset the stub.
     *                   2. Reset it again.
     *                   3. Read the ledger and metrics.
     * @tc.expected      The second reset leaves a zero ledger and stable metrics.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubResetIdempotent', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      stubUsed(stub, 2);
      stub.reset();
      const fingerprint: number = StubMetrics.from(stub).fingerprint();
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(StubMetrics.from(stub).fingerprint()).assertEqual(fingerprint);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.alive).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          resourceManagementResourceIsolationModels
     * @tc.desc          Lifecycle resources are isolated between service instances.
     * @tc.precondition  Two service models are available.
     * @tc.steps         1. Connect the first model.
     *                   2. Reset the first model.
     *                   3. Read the second model resources.
     * @tc.expected      The second model is unaffected by the first reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementResourceIsolationModels', 0, () => {
      const first: ServiceLifecycleModel = resetModel();
      const second: ServiceLifecycleModel = resetModel();
      second.onCreate();
      second.onConnect();
      first.onConnect();
      first.reset();
      expect(first.stub).assertUndefined();
      expect(first.connectCount).assertEqual(0);
      expect(second.stub === undefined).assertFalse();
      expect(second.connectCount).assertEqual(1);
      expect(second.events.size()).assertEqual(2);
      expect(second.logs.size()).assertEqual(2);
      expect(second.state).assertEqual('connected');
      expect(second.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(first.events === second.events).assertFalse();
      expect(first.logs === second.logs).assertFalse();
    });

    /**
     * @tc.name          resourceManagementResourceIsolationStubs
     * @tc.desc          Stub ledgers are isolated between stub instances.
     * @tc.precondition  Two stubs are available.
     * @tc.steps         1. Use the first stub three times.
     *                   2. Reset the first stub.
     *                   3. Read the second stub ledger.
     * @tc.expected      The second stub ledger is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementResourceIsolationStubs', 0, () => {
      const first: StubRemoteObjectModel = newStub();
      const second: StubRemoteObjectModel = newStub();
      stubUsed(first, 3);
      new InProcessClient(second).send(1, 'second-only');
      expect(first.requestCount()).assertEqual(3);
      expect(second.requestCount()).assertEqual(1);
      first.reset();
      expect(first.requestCount()).assertEqual(0);
      expect(second.requestCount()).assertEqual(1);
      expect(second.lastRequest()?.text).assertEqual('second-only');
      expect(second.alive).assertTrue();
      expect(first === second).assertFalse();
      expect(first.requests === second.requests).assertFalse();
      expect(StubMetrics.from(second).handled).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementBoundedRecorderSize
     * @tc.desc          The event recorder grows with callbacks and is cleared by reset.
     * @tc.precondition  A service model is available.
     * @tc.steps         1. Walk five callbacks.
     *                   2. Read the recorder size.
     *                   3. Reset and read again.
     * @tc.expected      The recorder holds five entries then zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementBoundedRecorderSize', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.size()).assertEqual(5);
      expect(service.events.entries.length).assertEqual(5);
      expect(service.logs.size()).assertEqual(5);
      service.reset();
      expect(service.events.size()).assertEqual(0);
      expect(service.events.entries.length).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.events.fingerprint()).assertEqual(new ServiceLifecycleModel().events.fingerprint());
      expect(service.state).assertEqual('idle');
    });

    /**
     * @tc.name          resourceManagementLogBufferLimitCustom
     * @tc.desc          A custom limit bounds the buffer exactly.
     * @tc.precondition  A buffer with limit three is available.
     * @tc.steps         1. Push five error lines.
     *                   2. Read the size and levels.
     *                   3. Read the retained trace.
     * @tc.expected      Three error lines remain and the limit holds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementLogBufferLimitCustom', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      for (let index = 1; index <= 5; index++) {
        buffer.error('err-' + String(index));
      }
      expect(buffer.size()).assertEqual(3);
      expect(buffer.limit).assertEqual(3);
      expect(buffer.levels.length).assertEqual(3);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.lines[0]).assertEqual('ERROR err-3');
      expect(buffer.lines[2]).assertEqual('ERROR err-5');
      expect(buffer.contains('err-2')).assertFalse();
      expect(buffer.contains('err-3')).assertTrue();
      expect(buffer.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          resourceManagementSequenceTraceAfterReclaim
     * @tc.desc          A reclaimed sequence keeps a stable diagnostic trace.
     * @tc.precondition  A sequence with two values is reclaimed.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Read the trace twice.
     *                   3. Attempt a read and re-read the trace.
     * @tc.expected      The trace reports the values with cursor zero each time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceTraceAfterReclaim', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['t1', 't2']);
      sequence.reclaim();
      const first: string = sequence.trace();
      const second: string = sequence.trace();
      expect(first).assertEqual(second);
      expect(first).assertEqual('t1|t2#0');
      expect(first.split('#').length).assertEqual(2);
      expect(first.split('|').length).assertEqual(2);
      expect(first.endsWith('#0')).assertTrue();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace()).assertEqual(first);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(2);
    });

    /**
     * @tc.name          resourceManagementStubReplyAfterReset
     * @tc.desc          A reset stub still replies with the default literal.
     * @tc.precondition  A used stub has been reset.
     * @tc.steps         1. Use the stub and reset it.
     *                   2. Send a fresh request.
     *                   3. Compare the reply and ledger.
     * @tc.expected      The reply equals hello rpc and the ledger holds one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubReplyAfterReset', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      stubUsed(stub, 2);
      stub.reset();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(1, 'post-reset');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.errCode).assertEqual(0);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual('post-reset');
      expect(client.sentTexts.length).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      expect(StubMetrics.from(stub).handled).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementClientResetThenSend
     * @tc.desc          A reset client can be reused for a new request batch.
     * @tc.precondition  A client has sent two requests.
     * @tc.steps         1. Send two requests and reset the client.
     *                   2. Send one new request.
     *                   3. Read the ledger and stub.
     * @tc.expected      The ledger restarts at one and the stub ledger matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementClientResetThenSend', 0, () => {
      const client: InProcessClient = new InProcessClient(newStub());
      client.send(1, 'old-1');
      client.send(1, 'old-2');
      expect(client.replies.length).assertEqual(2);
      client.reset();
      expect(client.sentCodes.length).assertEqual(0);
      const result = client.send(1, 'fresh');
      expect(result.isSuccess()).assertTrue();
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.sentTexts[0]).assertEqual('fresh');
      expect(client.replies.length).assertEqual(1);
      expect(client.results.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      expect(client.stub.lastRequest()?.text).assertEqual('fresh');
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          resourceManagementMetricsAfterReset
     * @tc.desc          Metrics return to zero after a stub reset.
     * @tc.precondition  A stub has served two requests and one rejection.
     * @tc.steps         1. Drive three requests.
     *                   2. Reset the stub.
     *                   3. Compute metrics again.
     * @tc.expected      All metric fields return to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementMetricsAfterReset', 0, () => {
      const client: InProcessClient = new InProcessClient(newStub());
      client.send(1, 'a');
      client.send(1, 'b');
      client.send(99, 'bad');
      expect(StubMetrics.from(client.stub).requests).assertEqual(3);
      client.stub.reset();
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(newStub()).fingerprint());
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.stub.alive).assertTrue();
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          resourceManagementLifecycleResetThenWalk
     * @tc.desc          A reset service can rebuild its resources from scratch.
     * @tc.precondition  A used service model is available.
     * @tc.steps         1. Walk several callbacks.
     *                   2. Reset and walk create, connect and request.
     *                   3. Compare with a fresh walk.
     * @tc.expected      The rebuilt resources match a fresh service.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementLifecycleResetThenWalk', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      service.reset();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      const fresh: ServiceLifecycleModel = resetModel();
      fresh.onCreate();
      fresh.onConnect();
      fresh.onRequest(1);
      expect(service.events.trace()).assertEqual(fresh.events.trace());
      expect(service.events.fingerprint()).assertEqual(fresh.events.fingerprint());
      expect(service.logs.trace()).assertEqual(fresh.logs.trace());
      expect(new ServiceSnapshot(service).describe()).assertEqual(
        new ServiceSnapshot(fresh).describe());
      expect(service.connectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          resourceManagementSequenceWriteAfterRewind
     * @tc.desc          Rewound sequences accept additional writes.
     * @tc.precondition  A sequence with two values has been rewound.
     * @tc.steps         1. Write two values and rewind.
     *                   2. Write a third value.
     *                   3. Read all values from the start.
     * @tc.expected      Three values persist in write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceWriteAfterRewind', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['r1', 'r2']);
      sequence.rewind();
      expect(sequence.writeString('r3')).assertTrue();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readString()).assertEqual('r1');
      expect(sequence.readString()).assertEqual('r2');
      expect(sequence.readString()).assertEqual('r3');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.trace()).assertEqual('r1|r2|r3#3');
    });

    /**
     * @tc.name          resourceManagementStubResetThenMetrics
     * @tc.desc          Metrics recompute from the post-reset ledger only.
     * @tc.precondition  A stub has been reset after mixed traffic.
     * @tc.steps         1. Send one valid and one invalid request.
     *                   2. Reset and send one valid request.
     *                   3. Compute metrics.
     * @tc.expected      Metrics report one request and one handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubResetThenMetrics', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(1, 'valid');
      client.send(2, 'invalid');
      expect(StubMetrics.from(stub).requests).assertEqual(2);
      stub.reset();
      new InProcessClient(stub).send(1, 'after');
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual('after');
      expect(stub.alive).assertTrue();
      expect(stub.rejectCodes.length).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementLogBufferTrimThenClear
     * @tc.desc          Clear fully releases an overflowing buffer.
     * @tc.precondition  A small buffer has overflowed.
     * @tc.steps         1. Push six lines into a limit-four buffer.
     *                   2. Clear the buffer.
     *                   3. Read sizes, counts and limit.
     * @tc.expected      Everything is released while the limit holds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementLogBufferTrimThenClear', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      for (let index = 1; index <= 6; index++) {
        buffer.info('zip-' + String(index));
      }
      expect(buffer.size()).assertEqual(4);
      expect(buffer.contains('zip-6')).assertTrue();
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.limit).assertEqual(4);
      expect(buffer.contains('zip-6')).assertFalse();
      expect(buffer.size()).assertLess(buffer.limit);
    });

    /**
     * @tc.name          resourceManagementObservationSummary
     * @tc.desc          The post-reset resource audit is fully consistent.
     * @tc.precondition  A used service model is available.
     * @tc.steps         1. Walk several callbacks.
     *                   2. Reset the service.
     *                   3. Audit every resource container.
     * @tc.expected      All resources report empty or idle baselines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementObservationSummary', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.stub).assertUndefined();
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(new ServiceSnapshot(service).describe()).assertEqual('idle/0/0/0/0');
      expect(service.logs.limit).assertEqual(128);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          resourceManagementResetDeterministic
     * @tc.desc          Three reset rounds leave an identical resource baseline.
     * @tc.precondition  A service model is available.
     * @tc.steps         1. Run three walk-reset rounds.
     *                   2. Capture the describe text per round.
     *                   3. Compare all three.
     * @tc.expected      Every round ends at the idle baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementResetDeterministic', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      const texts: string[] = [];
      for (let round = 0; round < 3; round++) {
        service.onCreate();
        service.onConnect();
        service.onRequest(round + 1);
        service.reset();
        texts.push(new ServiceSnapshot(service).describe());
      }
      expect(texts.length).assertEqual(3);
      expect(texts[0]).assertEqual('idle/0/0/0/0');
      expect(texts[0]).assertEqual(texts[1]);
      expect(texts[1]).assertEqual(texts[2]);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.isAlive()).assertTrue();
      expect(service.requestCount).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementSequenceBatchIsolation
     * @tc.desc          Reclaiming one sequence leaves a sibling intact.
     * @tc.precondition  Two filled sequences are available.
     * @tc.steps         1. Reclaim the first sequence.
     *                   2. Write and read on the second.
     *                   3. Confirm both independent states.
     * @tc.expected      Only the reclaimed sequence refuses writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceBatchIsolation', 0, () => {
      const first: MessageSequenceModel = filledSequence(['b1']);
      const second: MessageSequenceModel = filledSequence(['b2']);
      first.reclaim();
      expect(second.writeString('b3')).assertTrue();
      expect(second.readString()).assertEqual('b2');
      expect(second.readString()).assertEqual('b3');
      expect(first.writeString('blocked')).assertFalse();
      expect(first.readString()).assertEqual('');
      expect(first.reclaimed).assertTrue();
      expect(second.reclaimed).assertFalse();
      expect(second.size()).assertEqual(2);
      expect(first.size()).assertEqual(1);
      expect(first.values[0]).assertEqual('b1');
      expect(second.values[1]).assertEqual('b3');
    });

    /**
     * @tc.name          resourceManagementStubLedgerBounded
     * @tc.desc          The stub ledger grows one record per request and resets.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send five requests.
     *                   2. Read the ledger length and metrics.
     *                   3. Reset and read again.
     * @tc.expected      Five records accumulate then drop to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementStubLedgerBounded', 0, () => {
      const stub: StubRemoteObjectModel = newStub();
      stubUsed(stub, 5);
      expect(stub.requestCount()).assertEqual(5);
      expect(stub.requests.length).assertEqual(5);
      expect(StubMetrics.from(stub).requests).assertEqual(5);
      expect(StubMetrics.from(stub).handled).assertEqual(5);
      expect(stub.requests[0].text).assertEqual('payload-0');
      expect(stub.requests[4].text).assertEqual('payload-4');
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          resourceManagementFinalResourceAudit
     * @tc.desc          The final audit of every resource after a full walk is clean.
     * @tc.precondition  A service and a stub have been used.
     * @tc.steps         1. Walk callbacks and drive the stub.
     *                   2. Release the stub and the service.
     *                   3. Audit all resource counters.
     * @tc.expected      Every resource is empty or at its baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementFinalResourceAudit', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      const stub: StubRemoteObjectModel = service.onConnect();
      stubUsed(stub, 2);
      service.onRequest(1);
      expect(stub.requestCount()).assertEqual(2);
      stub.reset();
      service.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.requestCount).assertEqual(0);
      expect(service.connectCount).assertEqual(0);
      expect(service.logs.limit).assertEqual(128);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          resourceManagementMultipleResetsStable
     * @tc.desc          Five consecutive resets keep the service at the baseline.
     * @tc.precondition  A service has completed create and connect callbacks.
     * @tc.steps         1. Walk create and connect.
     *                   2. Reset five times.
     *                   3. Audit state and containers.
     * @tc.expected      Every reset leaves the same baseline resources.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementMultipleResetsStable', 0, () => {
      const service: ServiceLifecycleModel = resetModel();
      service.onCreate();
      service.onConnect();
      for (let round = 0; round < 5; round++) {
        service.reset();
        expect(service.state).assertEqual('idle');
        expect(service.events.size()).assertEqual(0);
        expect(service.logs.size()).assertEqual(0);
      }
      expect(service.connectCount).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.logs.limit).assertEqual(128);
      expect(service.isAlive()).assertTrue();
      expect(new ServiceSnapshot(service).describe()).assertEqual('idle/0/0/0/0');
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimAfterRead
     * @tc.desc          Reclaiming a partially read sequence releases the cursor first.
     * @tc.precondition  A sequence has been read twice.
     * @tc.steps         1. Write three values and read two.
     *                   2. Reclaim the sequence.
     *                   3. Read cursor and counters.
     * @tc.expected      The cursor resets to zero while history counters hold.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceReclaimAfterRead', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['c1', 'c2', 'c3']);
      expect(sequence.readString()).assertEqual('c1');
      expect(sequence.readString()).assertEqual('c2');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      sequence.reclaim();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('c1|c2|c3#0');
      expect(sequence.reclaimed).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceRewindThenReclaim
     * @tc.desc          Rewind followed by reclaim releases cursor and storage access.
     * @tc.precondition  A sequence with three values is available.
     * @tc.steps         1. Read two values and rewind.
     *                   2. Read one value and reclaim.
     *                   3. Read the trace and counters.
     * @tc.expected      The cursor resets while write and read history persist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceRewindThenReclaim', 0, () => {
      const sequence: MessageSequenceModel = filledSequence(['w1', 'w2', 'w3']);
      sequence.readString();
      sequence.readString();
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('w1');
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.trace()).assertEqual('w1|w2|w3#0');
      expect(sequence.writeString('blocked')).assertFalse();
      expect(sequence.size()).assertEqual(3);
    });
  });
}
