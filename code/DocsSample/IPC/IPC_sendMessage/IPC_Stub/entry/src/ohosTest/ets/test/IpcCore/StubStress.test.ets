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
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  EVENT_ON_CONNECT,
  LEVEL_INFO,
  ServiceLifecycleModel,
  ServiceSnapshot,
  ServiceEventRecorder,
  LogBuffer,
  MessageSequenceModel,
  StubRemoteObjectModel,
  InProcessClient,
  StubMetrics,
  replayCodes,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint
} from '../Shared/SharedDriver';

export default function stubStressTest(): void {
  describe('StubStress', () => {
    beforeAll(() => {
      logSuite('StubStress', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubStress', 'end');
    });

    /**
     * @tc.name   stubStressSendManyHundred
     * @tc.desc   One hundred accepted sends keep every ledger consistent.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Call sendMany with one hundred.
     *                   2. Compare the ledger lengths.
     *                   3. Read the metrics.
     * @tc.expected      One hundred requests are handled with one hundred replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSendManyHundred', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      logStep('stubStressSendManyHundred', 'start 100 sends');
      const handled = client.sendMany(100, REQUEST_CODE);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(100);
      expect(client.sentCodes.length).assertEqual(100);
      expect(client.replies.length).assertEqual(100);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   stubStressSendManyTwoFifty
     * @tc.desc   Two hundred fifty sends stay exact in the stub ledger.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send two hundred fifty requests.
     *                   2. Read the stub request count.
     *                   3. Compare the reply trace segments.
     * @tc.expected      The ledger and trace both hold two hundred fifty entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSendManyTwoFifty', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(250, REQUEST_CODE);
      expect(handled).assertEqual(250);
      expect(stub.requestCount()).assertEqual(250);
      expect(stub.requests.length).assertEqual(250);
      expect(client.replies.length).assertEqual(250);
      expect(client.trace().split('|').length).assertEqual(250);
      expect(stub.lastRequest()?.code).assertEqual(REQUEST_CODE);
      expect(StubMetrics.from(stub).replies).assertEqual(250);
    });

    /**
     * @tc.name   stubStressAlternatingFiveHundred
     * @tc.desc   Five hundred alternating codes split evenly into handled halves.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send five hundred alternating codes.
     *                   2. Read the metrics counters.
     *                   3. Compare the success ratio.
     * @tc.expected      Half the requests are handled and half rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressAlternatingFiveHundred', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 500; index++) {
        client.send(index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(500);
      expect(metrics.handled).assertEqual(250);
      expect(metrics.rejected).assertEqual(250);
      expect(metrics.replies).assertEqual(250);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.replies.length).assertEqual(250);
      expect(stub.requestCount()).assertEqual(500);
    });

    /**
     * @tc.name   stubStressLargeRejectedRun
     * @tc.desc   Three hundred rejected codes leave no replies behind.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send three hundred unknown codes.
     *                   2. Read the reply ledger and trace.
     *                   3. Compare the metrics.
     * @tc.expected      The reply ledger stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLargeRejectedRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(300, UNKNOWN_CODE_LARGE);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(metrics.rejected).assertEqual(300);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
    });

    /**
     * @tc.name   stubStressRequestCountAfterBulk
     * @tc.desc   requestCount tracks a bulk run exactly.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send one hundred twenty requests.
     *                   2. Compare the count with the ledger length.
     *                   3. Compare with the client sent-code length.
     * @tc.expected      All three lengths agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressRequestCountAfterBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(120, REQUEST_CODE);
      expect(stub.requestCount()).assertEqual(120);
      expect(stub.requestCount()).assertEqual(stub.requests.length);
      expect(stub.requestCount()).assertEqual(client.sentCodes.length);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[119].handled).assertTrue();
      expect(stub.lastRequest()).assertEqual(stub.requests[119]);
      expect(stub.requests[119].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubStressSequenceTwoHundredWrites
     * @tc.desc   A sequence stores two hundred values without loss.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write two hundred indexed values.
     *                   2. Read the size and counters.
     *                   3. Compare the first and last values.
     * @tc.expected      Two hundred values are stored in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceTwoHundredWrites', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 200; index++) {
        expect(sequence.writeString('s' + String(index))).assertTrue();
      }
      expect(sequence.size()).assertEqual(200);
      expect(sequence.writeCount).assertEqual(200);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.values[0]).assertEqual('s0');
      expect(sequence.values[199]).assertEqual('s199');
      expect(sequence.trace().endsWith('#0')).assertTrue();
    });

    /**
     * @tc.name   stubStressSequenceDrainAll
     * @tc.desc   Draining a large sequence returns every value once.
     * @tc.precondition  A sequence with one hundred fifty values.
     * @tc.steps         1. Write one hundred fifty values.
     *                   2. Drain them and count the matches.
     *                   3. Over-read once.
     * @tc.expected      Every value is returned and the extra read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceDrainAll', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 150; index++) {
        sequence.writeString('d' + String(index));
      }
      let matched = 0;
      for (let index = 0; index < 150; index++) {
        if (sequence.readString() === 'd' + String(index)) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(150);
      expect(sequence.readCount).assertEqual(150);
      expect(sequence.cursor).assertEqual(150);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(150);
      expect(sequence.cursor).assertEqual(150);
      expect(sequence.size()).assertEqual(150);
    });

    /**
     * @tc.name   stubStressSequenceRewindBulk
     * @tc.desc   A large sequence can be drained and replayed after a rewind.
     * @tc.precondition  A sequence with one hundred values.
     * @tc.steps         1. Write and drain one hundred values.
     *                   2. Rewind and drain again.
     *                   3. Compare the read counters.
     * @tc.expected      The second drain doubles the read counter to two hundred.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceRewindBulk', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 100; index++) {
        sequence.writeString('r' + String(index));
      }
      for (let index = 0; index < 100; index++) {
        sequence.readString();
      }
      const firstPass = sequence.readCount;
      sequence.rewind();
      for (let index = 0; index < 100; index++) {
        expect(sequence.readString()).assertEqual('r' + String(index));
      }
      expect(firstPass).assertEqual(100);
      expect(sequence.readCount).assertEqual(200);
      expect(sequence.cursor).assertEqual(100);
      expect(sequence.writeCount).assertEqual(100);
      expect(sequence.size()).assertEqual(100);
      expect(sequence.trace().endsWith('#100')).assertTrue();
    });

    /**
     * @tc.name   stubStressClientTraceLarge
     * @tc.desc   The client trace of sixty accepted sends has sixty segments.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send sixty accepted requests.
     *                   2. Split the trace.
     *                   3. Count the reply segments.
     * @tc.expected      Sixty identical segments appear in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressClientTraceLarge', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(60, REQUEST_CODE);
      const parts = client.trace().split('|');
      expect(parts.length).assertEqual(60);
      expect(countOf(parts, REPLY_PAYLOAD)).assertEqual(60);
      expect(uniqueStrings(parts).length).assertEqual(1);
      expect(client.replies.length).assertEqual(60);
      expect(stub.requestCount()).assertEqual(60);
      expect(client.results.length).assertEqual(60);
      expect(parts[59]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubStressClientResetBulk
     * @tc.desc   Resetting after a bulk run clears one hundred entries.
     * @tc.precondition  A client with one hundred sends.
     * @tc.steps         1. Send one hundred requests.
     *                   2. Reset the client.
     *                   3. Send a single request again.
     * @tc.expected      The ledgers restart from one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressClientResetBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(100, REQUEST_CODE);
      expect(client.replies.length).assertEqual(100);
      client.reset();
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubStressTwoClientsBulk
     * @tc.desc   Two clients each send fifty requests to one stub.
     * @tc.precondition  One stub and two clients.
     * @tc.steps         1. Send fifty requests from each client.
     *                   2. Read the shared stub count.
     *                   3. Compare each client ledger.
     * @tc.expected      The stub sees one hundred requests total.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressTwoClientsBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.sendMany(50, REQUEST_CODE);
      second.sendMany(50, REQUEST_CODE);
      expect(stub.requestCount()).assertEqual(100);
      expect(first.replies.length).assertEqual(50);
      expect(second.replies.length).assertEqual(50);
      expect(first.sentCodes.length).assertEqual(50);
      expect(second.sentCodes.length).assertEqual(50);
      expect(StubMetrics.from(stub).handled).assertEqual(100);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[99].handled).assertTrue();
    });

    /**
     * @tc.name   stubStressKillMidRun
     * @tc.desc   Killing the stub mid-run rejects the remaining requests.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send forty requests.
     *                   2. Kill the stub and send twenty more.
     *                   3. Read the metrics.
     * @tc.expected      Forty requests are handled and twenty are rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressKillMidRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(40, REQUEST_CODE);
      stub.kill();
      client.sendMany(20, REQUEST_CODE);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(60);
      expect(metrics.handled).assertEqual(40);
      expect(metrics.rejected).assertEqual(20);
      expect(metrics.replies).assertEqual(40);
      expect(client.replies.length).assertEqual(40);
      expect(stub.alive).assertFalse();
      expect(stub.requests[59].handled).assertFalse();
    });

    /**
     * @tc.name   stubStressReviveMidRun
     * @tc.desc   Reviving mid-run restores handling for later requests.
     * @tc.precondition  A killed stub with a pending client.
     * @tc.steps         1. Send ten requests after a kill.
     *                   2. Revive and send ten more.
     *                   3. Compare the handled counts.
     * @tc.expected      Only the revived batch is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressReviveMidRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      client.sendMany(10, REQUEST_CODE);
      stub.revive();
      client.sendMany(10, REQUEST_CODE);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(20);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(10);
      expect(client.replies.length).assertEqual(10);
      expect(stub.requests[9].handled).assertFalse();
      expect(stub.requests[10].handled).assertTrue();
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name   stubStressRejectListMidRun
     * @tc.desc   Adding a code to the reject list mid-run changes later results.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send twenty accepted requests.
     *                   2. Reject code 1 and send twenty more.
     *                   3. Compare the handled counts.
     * @tc.expected      The second batch is fully rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressRejectListMidRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(20, REQUEST_CODE);
      stub.rejectCodes.push(REQUEST_CODE);
      client.sendMany(20, REQUEST_CODE);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(40);
      expect(metrics.handled).assertEqual(20);
      expect(metrics.rejected).assertEqual(20);
      expect(stub.requests[19].handled).assertTrue();
      expect(stub.requests[20].handled).assertFalse();
      expect(client.replies.length).assertEqual(20);
      expect(stub.rejectCodes.length).assertEqual(1);
    });

    /**
     * @tc.name   stubStressServiceConnectCycles
     * @tc.desc   Twenty connect and disconnect cycles keep the counters exact.
     * @tc.precondition  A fresh lifecycle service.
     * @tc.steps         1. Run twenty connect and disconnect cycles.
     *                   2. Read the connect and disconnect counters.
     *                   3. Compare the event counts.
     * @tc.expected      Both counters equal twenty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressServiceConnectCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 20; index++) {
        service.onConnect();
        service.onDisconnect();
      }
      expect(service.connectCount).assertEqual(20);
      expect(service.disconnectCount).assertEqual(20);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(20);
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.size()).assertEqual(41);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.size()).assertEqual(41);
    });

    /**
     * @tc.name   stubStressServiceRequestBulk
     * @tc.desc   One hundred service requests keep the lifecycle counters aligned.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Call onRequest one hundred times.
     *                   2. Read the request counter.
     *                   3. Compare the event and log sizes.
     * @tc.expected      The request counter and sizes all agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressServiceRequestBulk', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 1; index <= 100; index++) {
        service.onRequest(index);
      }
      expect(service.requestCount).assertEqual(100);
      expect(service.events.size()).assertEqual(101);
      expect(service.logs.size()).assertEqual(101);
      expect(service.events.countOf('onRequest')).assertEqual(100);
      expect(service.events.last()).assertEqual('onRequest:100');
      expect(service.logs.contains('onRequest 100')).assertTrue();
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name   stubStressServiceSnapshotBulk
     * @tc.desc   A snapshot after a bulk lifecycle mirrors the model counters.
     * @tc.precondition  A service with many events.
     * @tc.steps         1. Run fifty requests and five connects.
     *                   2. Build a snapshot.
     *                   3. Compare every snapshot field.
     * @tc.expected      The snapshot matches the model exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressServiceSnapshotBulk', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 50; index++) {
        service.onRequest(index);
      }
      for (let index = 0; index < 5; index++) {
        service.onConnect();
      }
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.requests).assertEqual(50);
      expect(snapshot.connects).assertEqual(5);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.describe()).assertEqual('connected/5/0/50/0');
      expect(snapshot.sameAs(new ServiceSnapshot(service))).assertTrue();
    });

    /**
     * @tc.name   stubStressLifecycleResetCycles
     * @tc.desc   Five reset and replay cycles end in the same state each time.
     * @tc.precondition  A fresh lifecycle service.
     * @tc.steps         1. Run a full lifecycle five times with a reset between.
     *                   2. Read the snapshot after each cycle.
     *                   3. Deduplicate the descriptions.
     * @tc.expected      Every cycle produces the same snapshot description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressLifecycleResetCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      const descriptions: string[] = [];
      for (let index = 0; index < 5; index++) {
        service.onCreate();
        service.onRequest(index);
        service.onConnect();
        service.onDisconnect();
        service.onDestroy();
        descriptions.push(new ServiceSnapshot(service).describe());
        service.reset();
      }
      expect(descriptions.length).assertEqual(5);
      expect(uniqueStrings(descriptions).length).assertEqual(1);
      expect(descriptions[0]).assertEqual('destroyed/1/1/1/1');
      expect(service.state).assertEqual('idle');
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name   stubStressLogBufferPressure
     * @tc.desc   A bounded log buffer keeps only its newest lines under pressure.
     * @tc.precondition  A log buffer limited to ten lines.
     * @tc.steps         1. Push fifty info lines.
     *                   2. Read the size and first retained line.
     *                   3. Confirm the oldest lines were dropped.
     * @tc.expected      Exactly ten newest lines remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLogBufferPressure', 0, () => {
      const logs = new LogBuffer(10);
      for (let index = 0; index < 50; index++) {
        logs.info('line-' + String(index));
      }
      expect(logs.size()).assertEqual(10);
      expect(logs.contains('line-0')).assertFalse();
      expect(logs.contains('line-39')).assertFalse();
      expect(logs.contains('line-40')).assertTrue();
      expect(logs.contains('line-49')).assertTrue();
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(10);
      expect(logs.lines[0]).assertEqual('INFO line-40');
      expect(logs.lines[9]).assertEqual('INFO line-49');
    });

    /**
     * @tc.name   stubStressLogBufferEvictionOrder
     * @tc.desc   Evicted lines leave no gaps in the retained tail.
     * @tc.precondition  A log buffer limited to five lines.
     * @tc.steps         1. Push twelve lines.
     *                   2. Read the trace.
     *                   3. Split and compare the segments.
     * @tc.expected      The trace holds the last five lines in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLogBufferEvictionOrder', 0, () => {
      const logs = new LogBuffer(5);
      for (let index = 0; index < 12; index++) {
        logs.info('e' + String(index));
      }
      const parts = logs.trace().split('|');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('INFO e7');
      expect(parts[4]).assertEqual('INFO e11');
      expect(sameStringArray(parts, ['INFO e7', 'INFO e8', 'INFO e9', 'INFO e10', 'INFO e11'])).assertTrue();
      expect(logs.size()).assertEqual(5);
      expect(logs.contains('e6')).assertFalse();
    });

    /**
     * @tc.name   stubStressRecorderBulkEvents
     * @tc.desc   A recorder stores one hundred ordered events without loss.
     * @tc.precondition  A fresh ServiceEventRecorder.
     * @tc.steps         1. Record one hundred mixed events.
     *                   2. Read the size and first entry.
     *                   3. Compare the last entry.
     * @tc.expected      One hundred entries are preserved in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressRecorderBulkEvents', 0, () => {
      const recorder = new ServiceEventRecorder();
      for (let index = 0; index < 100; index++) {
        if (index % 2 === 0) {
          recorder.record('onRequest', String(index));
        } else {
          recorder.record('onConnect', STUB_DESCRIPTOR);
        }
      }
      expect(recorder.size()).assertEqual(100);
      expect(recorder.countOf('onRequest')).assertEqual(50);
      expect(recorder.countOf('onConnect')).assertEqual(50);
      expect(recorder.last()).assertEqual('onConnect:IPCStubTest');
      expect(recorder.entries[0]).assertEqual('onRequest:0');
      expect(recorder.entries[99]).assertEqual('onConnect:IPCStubTest');
      expect(recorder.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name   stubStressRecorderCountsBulk
     * @tc.desc   Kind counts stay correct across a mixed bulk recording.
     * @tc.precondition  A fresh ServiceEventRecorder.
     * @tc.steps         1. Record ten of each of five kinds.
     *                   2. Count every kind.
     *                   3. Compare the total with the size.
     * @tc.expected      Each kind counts ten and the total is fifty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressRecorderCountsBulk', 0, () => {
      const recorder = new ServiceEventRecorder();
      const kinds: string[] = ['onCreate', 'onRequest', 'onConnect', 'onDisconnect', 'onDestroy'];
      for (let index = 0; index < 10; index++) {
        for (let kind = 0; kind < kinds.length; kind++) {
          recorder.record(kinds[kind]);
        }
      }
      expect(recorder.size()).assertEqual(50);
      for (let kind = 0; kind < kinds.length; kind++) {
        expect(recorder.countOf(kinds[kind])).assertEqual(10);
      }
      expect(recorder.countOf('onRemoteDied')).assertEqual(0);
      expect(recorder.entries.length).assertEqual(50);
      expect(recorder.last()).assertEqual('onDestroy');
      expect(recorder.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name   stubStressFingerprintStability
     * @tc.desc   Identical bulk runs produce identical metric fingerprints.
     * @tc.precondition  Two stubs driven with the same code pattern.
     * @tc.steps         1. Replay eighty identical codes on both stubs.
     *                   2. Build metrics for both.
     *                   3. Compare the fingerprints.
     * @tc.expected      The fingerprints match and stay in range.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressFingerprintStability', 0, () => {
      const left = new StubRemoteObjectModel();
      const right = new StubRemoteObjectModel();
      const codes: number[] = [];
      for (let index = 0; index < 80; index++) {
        codes.push(index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO);
      }
      replayCodes(left, codes);
      replayCodes(right, codes);
      const leftMetrics = StubMetrics.from(left);
      const rightMetrics = StubMetrics.from(right);
      expect(leftMetrics.fingerprint()).assertEqual(rightMetrics.fingerprint());
      expect(leftMetrics.fingerprint()).assertLarger(0);
      expect(leftMetrics.fingerprint()).assertLess(1000003);
      expect(leftMetrics.handled).assertEqual(40);
      expect(rightMetrics.rejected).assertEqual(40);
      expect(leftMetrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name   stubStressFingerprintDifference
     * @tc.desc   Different bulk mixes produce different fingerprints.
     * @tc.precondition  Two stubs with different bulk patterns.
     * @tc.steps         1. Replay an accepted-heavy list on the left.
     *                   2. Replay a rejected-heavy list on the right.
     *                   3. Compare the fingerprints.
     * @tc.expected      The fingerprints differ while totals match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressFingerprintDifference', 0, () => {
      const accepted = new StubRemoteObjectModel();
      const rejected = new StubRemoteObjectModel();
      const leftCodes: number[] = [];
      const rightCodes: number[] = [];
      for (let index = 0; index < 60; index++) {
        leftCodes.push(REQUEST_CODE);
        rightCodes.push(UNKNOWN_CODE_LARGE);
      }
      replayCodes(accepted, leftCodes);
      replayCodes(rejected, rightCodes);
      const left = StubMetrics.from(accepted);
      const right = StubMetrics.from(rejected);
      expect(left.requests).assertEqual(right.requests);
      expect(left.fingerprint() === right.fingerprint()).assertFalse();
      expect(left.handled).assertEqual(60);
      expect(right.handled).assertEqual(0);
      expect(left.successRatio()).assertEqual(1);
      expect(right.successRatio()).assertEqual(0);
      expect(left.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name   stubStressLedgerDescriptionsBulk
     * @tc.desc   Fifty records yield fifty ordered descriptions.
     * @tc.precondition  A stub with fifty accepted records.
     * @tc.steps         1. Send fifty requests.
     *                   2. Describe every record.
     *                   3. Deduplicate the descriptions.
     * @tc.expected      Fifty identical descriptions appear in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLedgerDescriptionsBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(50, REQUEST_CODE);
      const descriptions: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        descriptions.push(stub.requests[index].describe());
      }
      expect(descriptions.length).assertEqual(50);
      expect(uniqueStrings(descriptions).length).assertEqual(1);
      expect(descriptions[0]).assertEqual('1/hello world/hello rpc/true');
      expect(descriptions[49]).assertEqual(descriptions[0]);
      expect(countOf(descriptions, descriptions[0])).assertEqual(50);
      expect(stub.requests.length).assertEqual(50);
      expect(StubMetrics.from(stub).replies).assertEqual(50);
    });

    /**
     * @tc.name   stubStressLedgerLastRequestBulk
     * @tc.desc   lastRequest stays aligned with the ledger tail in a bulk run.
     * @tc.precondition  A stub with one hundred records.
     * @tc.steps         1. Send one hundred requests.
     *                   2. Read the last request.
     *                   3. Compare with the final ledger element.
     * @tc.expected      The last request is the final element.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLedgerLastRequestBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(100, REQUEST_CODE);
      const last = stub.lastRequest();
      expect(last).assertEqual(stub.requests[99]);
      expect(last?.code).assertEqual(REQUEST_CODE);
      expect(last?.handled).assertTrue();
      expect(last?.text).assertEqual(REQUEST_PAYLOAD);
      expect(last?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests.length).assertEqual(100);
      expect(stub.requests[98] === last).assertFalse();
    });

    /**
     * @tc.name   stubStressMixedBulkDistribution
     * @tc.desc   A four-code rotation produces a known counter distribution.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send forty rotations of four codes.
     *                   2. Read the metrics.
     *                   3. Compare the handled and rejected counts.
     * @tc.expected      Ten handled and thirty rejected requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressMixedBulkDistribution', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [1, 0, 2, 99];
      for (let rotation = 0; rotation < 10; rotation++) {
        for (let index = 0; index < codes.length; index++) {
          client.send(codes[index], REQUEST_PAYLOAD);
        }
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(40);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(30);
      expect(metrics.replies).assertEqual(10);
      expect(metrics.successRatio()).assertEqual(0.25);
      expect(stub.requestCount()).assertEqual(40);
      expect(client.results.length).assertEqual(40);
    });

    /**
     * @tc.name   stubStressMetricsRatioCheck
     * @tc.desc   A seventy percent success run reports the right ratio.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send seventy accepted and thirty rejected requests.
     *                   2. Build metrics.
     *                   3. Compare the ratio with 0.7.
     * @tc.expected      The ratio equals seven tenths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressMetricsRatioCheck', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(70, REQUEST_CODE);
      client.sendMany(30, UNKNOWN_CODE_TWO);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(70);
      expect(metrics.rejected).assertEqual(30);
      expect(metrics.successRatio()).assertEqual(0.7);
      expect(metrics.replies).assertEqual(70);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('100:70:30:70'));
      expect(client.replies.length).assertEqual(70);
    });

    /**
     * @tc.name   stubStressSequenceInterleavedBulk
     * @tc.desc   Interleaved writes and reads over one hundred values stay ordered.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Alternate a write and a read one hundred times.
     *                   2. Compare every read with its write.
     *                   3. Read the final counters.
     * @tc.expected      Every value round-trips and the counters reach one hundred.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceInterleavedBulk', 0, () => {
      const sequence = MessageSequenceModel.create();
      let matched = 0;
      for (let index = 0; index < 100; index++) {
        const value = 'i' + String(index);
        sequence.writeString(value);
        if (sequence.readString() === value) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(100);
      expect(sequence.writeCount).assertEqual(100);
      expect(sequence.readCount).assertEqual(100);
      expect(sequence.size()).assertEqual(100);
      expect(sequence.cursor).assertEqual(100);
      expect(sequence.trace().endsWith('#100')).assertTrue();
      expect(sequence.trace().split('|').length).assertEqual(100);
    });

    /**
     * @tc.name   stubStressCustomReplyBulk
     * @tc.desc   A custom reply serves fifty requests unchanged.
     * @tc.precondition  A stub with a custom reply.
     * @tc.steps         1. Set a custom reply text.
     *                   2. Send fifty requests.
     *                   3. Compare the reply ledger.
     * @tc.expected      Every reply carries the custom text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressCustomReplyBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'bulk custom reply';
      client.sendMany(50, REQUEST_CODE);
      expect(client.replies.length).assertEqual(50);
      expect(uniqueStrings(client.replies).length).assertEqual(1);
      expect(countOf(client.replies, 'bulk custom reply')).assertEqual(50);
      expect(stub.requests[49].replyText).assertEqual('bulk custom reply');
      expect(StubMetrics.from(stub).replies).assertEqual(50);
      expect(stub.replyText).assertEqual('bulk custom reply');
      expect(client.trace().split('|').length).assertEqual(50);
    });

    /**
     * @tc.name   stubStressEmptyPayloadBulk
     * @tc.desc   Forty empty payloads are all handled and recorded.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send forty empty payloads.
     *                   2. Read the sent texts and records.
     *                   3. Compare the reply ledger.
     * @tc.expected      All sends are handled with empty request texts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressEmptyPayloadBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 40; index++) {
        client.send(REQUEST_CODE, '');
      }
      expect(client.sentTexts.length).assertEqual(40);
      expect(countOf(client.sentTexts, '')).assertEqual(40);
      expect(stub.requests.length).assertEqual(40);
      expect(stub.requests[39].text).assertEqual('');
      expect(stub.requests[0].handled).assertTrue();
      expect(client.replies.length).assertEqual(40);
      expect(StubMetrics.from(stub).handled).assertEqual(40);
    });

    /**
     * @tc.name   stubStressLongPayloadBulk
     * @tc.desc   Thirty long payloads are stored whole in the ledger.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Build a 120-character payload.
     *                   2. Send it thirty times.
     *                   3. Compare the record text lengths.
     * @tc.expected      Every record text has the full payload length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLongPayloadBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let payload = '';
      for (let index = 0; index < 12; index++) {
        payload = payload + 'abcdefghij';
      }
      for (let index = 0; index < 30; index++) {
        client.send(REQUEST_CODE, payload);
      }
      expect(payload.length).assertEqual(120);
      expect(stub.requests.length).assertEqual(30);
      for (let index = 0; index < 30; index++) {
        expect(stub.requests[index].text.length).assertEqual(120);
      }
      expect(stub.requests[29].text).assertEqual(payload);
      expect(client.replies.length).assertEqual(30);
      expect(StubMetrics.from(stub).replies).assertEqual(30);
    });

    /**
     * @tc.name   stubStressReplayCodesBulk
     * @tc.desc   Replaying one hundred codes records them all in order.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Build a one hundred element code list.
     *                   2. Replay the list.
     *                   3. Compare the ledger ends and metrics.
     * @tc.expected      One hundred records follow the replay order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressReplayCodesBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [];
      for (let index = 0; index < 100; index++) {
        codes.push(index % 3 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO);
      }
      replayCodes(stub, codes);
      expect(stub.requests.length).assertEqual(100);
      expect(stub.requestCount()).assertEqual(100);
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(stub.requests[99].code).assertEqual(REQUEST_CODE);
      expect(StubMetrics.from(stub).requests).assertEqual(100);
      expect(StubMetrics.from(stub).handled).assertEqual(34);
      expect(StubMetrics.from(stub).rejected).assertEqual(66);
      expect(stub.requests[99].handled).assertTrue();
    });

    /**
     * @tc.name   stubStressClientResultsBulk
     * @tc.desc   A bulk client run keeps results aligned with codes.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send eighty mixed requests.
     *                   2. Compare every result flag with the code.
     *                   3. Read the reply ledger.
     * @tc.expected      Only code 1 sends report handled results.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressClientResultsBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 80; index++) {
        client.send(index % 4 === 0 ? REQUEST_CODE : UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      }
      let mismatches = 0;
      for (let index = 0; index < client.results.length; index++) {
        const expected = client.sentCodes[index] === REQUEST_CODE;
        if (client.results[index].handled !== expected) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(client.results.length).assertEqual(80);
      expect(client.replies.length).assertEqual(20);
      expect(StubMetrics.from(stub).handled).assertEqual(20);
      expect(StubMetrics.from(stub).rejected).assertEqual(60);
      expect(stub.requestCount()).assertEqual(80);
      expect(client.trace().split('|').length).assertEqual(20);
    });

    /**
     * @tc.name   stubStressSequenceReclaimBulk
     * @tc.desc   Reclaiming a large sequence blocks all later operations.
     * @tc.precondition  A sequence with one hundred values.
     * @tc.steps         1. Write one hundred values and reclaim.
     *                   2. Attempt ten reads and ten writes.
     *                   3. Read the counters.
     * @tc.expected      No operation succeeds after the reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceReclaimBulk', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 100; index++) {
        sequence.writeString('k' + String(index));
      }
      sequence.reclaim();
      for (let index = 0; index < 10; index++) {
        expect(sequence.readString()).assertEqual('');
        expect(sequence.writeString('late')).assertFalse();
      }
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.size()).assertEqual(100);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.writeCount).assertEqual(100);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.values[0]).assertEqual('k0');
    });

    /**
     * @tc.name   stubStressLifecycleManyConnects
     * @tc.desc   Thirty connects each produce a fresh stub reference.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Connect thirty times.
     *                   2. Count the connect events.
     *                   3. Confirm the final stub is alive.
     * @tc.expected      Thirty connects are recorded and the stub is usable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLifecycleManyConnects', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      let previousRequests = -1;
      for (let index = 0; index < 30; index++) {
        const stub = service.onConnect();
        expect(stub.requestCount()).assertEqual(0);
        previousRequests = stub.requestCount();
      }
      expect(service.connectCount).assertEqual(30);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(30);
      expect(previousRequests).assertEqual(0);
      expect(service.stub?.alive).assertTrue();
      expect(service.state).assertEqual('connected');
      expect(service.logs.size()).assertEqual(31);
    });

    /**
     * @tc.name   stubStressTwoServicesBulk
     * @tc.desc   Two services handle bulk lifecycles without interference.
     * @tc.precondition  Two lifecycle services.
     * @tc.steps         1. Send twenty requests on each service.
     *                   2. Destroy only the second service.
     *                   3. Compare both snapshots.
     * @tc.expected      The snapshots differ only in the destroy state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressTwoServicesBulk', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      right.onCreate();
      for (let index = 0; index < 20; index++) {
        left.onRequest(index);
        right.onRequest(index);
      }
      right.onDestroy();
      const leftSnapshot = new ServiceSnapshot(left);
      const rightSnapshot = new ServiceSnapshot(right);
      expect(leftSnapshot.requests).assertEqual(20);
      expect(rightSnapshot.requests).assertEqual(20);
      expect(leftSnapshot.destroys).assertEqual(0);
      expect(rightSnapshot.destroys).assertEqual(1);
      expect(leftSnapshot.sameAs(rightSnapshot)).assertFalse();
      expect(left.isAlive()).assertTrue();
      expect(right.isAlive()).assertFalse();
    });

    /**
     * @tc.name   stubStressStubResetBulk
     * @tc.desc   Ten reset cycles keep the stub reusable with a clean ledger.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send twenty requests, then reset ten times.
     *                   2. Send one request after the loop.
     *                   3. Read the ledger.
     * @tc.expected      Only the final request remains in the ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressStubResetBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(20, REQUEST_CODE);
      for (let index = 0; index < 10; index++) {
        stub.reset();
      }
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(stub.requests.length).assertEqual(1);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.alive).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubStressSequenceSizeBulk
     * @tc.desc   The sequence size equals the write count after bulk writes.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write three hundred values.
     *                   2. Compare the size with the write count.
     *                   3. Read a few spot values.
     * @tc.expected      The size and write counter both equal three hundred.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceSizeBulk', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 300; index++) {
        sequence.writeString('z' + String(index));
      }
      expect(sequence.size()).assertEqual(300);
      expect(sequence.writeCount).assertEqual(300);
      expect(sequence.size()).assertEqual(sequence.writeCount);
      expect(sequence.values[0]).assertEqual('z0');
      expect(sequence.values[150]).assertEqual('z150');
      expect(sequence.values[299]).assertEqual('z299');
      expect(sequence.cursor).assertEqual(0);
    });

    /**
     * @tc.name   stubStressLogBufferTraceBulk
     * @tc.desc   A busy service log trace stays bounded and ordered.
     * @tc.precondition  A service with a log limit of 128 lines.
     * @tc.steps         1. Send two hundred requests to the service.
     *                   2. Read the log size and trace.
     *                   3. Confirm the oldest lines were dropped.
     * @tc.expected      The log keeps the newest lines within its limit.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressLogBufferTraceBulk', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 1; index <= 200; index++) {
        service.onRequest(index);
      }
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.contains('onCreate')).assertFalse();
      expect(service.logs.contains('onRequest 200')).assertTrue();
      expect(service.logs.contains('onRequest 50')).assertFalse();
      expect(service.logs.trace().split('|').length).assertEqual(128);
      expect(service.events.size()).assertEqual(201);
      expect(service.requestCount).assertEqual(200);
    });

    /**
     * @tc.name   stubStressRecorderFingerprintBulk
     * @tc.desc   Two bulk recordings with the same pattern share a fingerprint.
     * @tc.precondition  Two recorders.
     * @tc.steps         1. Record the same two hundred events on both.
     *                   2. Read both fingerprints.
     *                   3. Compare with a trace oracle.
     * @tc.expected      Both fingerprints match the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressRecorderFingerprintBulk', 0, () => {
      const left = new ServiceEventRecorder();
      const right = new ServiceEventRecorder();
      for (let index = 0; index < 200; index++) {
        left.record('onRequest', String(index));
        right.record('onRequest', String(index));
      }
      expect(left.fingerprint()).assertEqual(right.fingerprint());
      expect(left.fingerprint()).assertEqual(textFingerprint(left.trace()));
      expect(left.size()).assertEqual(200);
      expect(right.size()).assertEqual(200);
      expect(left.trace()).assertEqual(right.trace());
      expect(left.fingerprint()).assertLarger(0);
      expect(left.countOf('onRequest')).assertEqual(200);
    });

    /**
     * @tc.name   stubStressClientSentTextsBulk
     * @tc.desc   The sent-text ledger matches the code ledger for a bulk run.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send one hundred indexed payloads.
     *                   2. Compare the sent-text length with the code length.
     *                   3. Read the first and last texts.
     * @tc.expected      Every payload is recorded in send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressClientSentTextsBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 100; index++) {
        client.send(REQUEST_CODE, 'bulk-' + String(index));
      }
      expect(client.sentTexts.length).assertEqual(100);
      expect(client.sentTexts.length).assertEqual(client.sentCodes.length);
      expect(client.sentTexts[0]).assertEqual('bulk-0');
      expect(client.sentTexts[99]).assertEqual('bulk-99');
      expect(stub.requests[50].text).assertEqual('bulk-50');
      expect(uniqueStrings(client.sentTexts).length).assertEqual(100);
      expect(stub.requestCount()).assertEqual(100);
    });

    /**
     * @tc.name   stubStressBatchLoopFingerprint
     * @tc.desc   Each batch of ten requests changes the metrics fingerprint.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send ten requests and fingerprint the metrics.
     *                   2. Send ten more and fingerprint again.
     *                   3. Compare both fingerprints.
     * @tc.expected      The two fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressBatchLoopFingerprint', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(10, REQUEST_CODE);
      const first = StubMetrics.from(stub).fingerprint();
      client.sendMany(10, REQUEST_CODE);
      const second = StubMetrics.from(stub).fingerprint();
      expect(first === second).assertFalse();
      expect(StubMetrics.from(stub).requests).assertEqual(20);
      expect(StubMetrics.from(stub).handled).assertEqual(20);
      expect(second).assertEqual(textFingerprint('20:20:0:20'));
      expect(first).assertEqual(textFingerprint('10:10:0:10'));
      expect(client.replies.length).assertEqual(20);
    });

    /**
     * @tc.name   stubStressRepeatedKillCycles
     * @tc.desc   Ten kill and revive cycles leave alternating handled flags.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Repeat kill, send, revive, send ten times.
     *                   2. Count the handled and rejected records.
     *                   3. Confirm the final state.
     * @tc.expected      Twenty records split evenly between handled and rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressRepeatedKillCycles', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 10; index++) {
        stub.kill();
        client.send(REQUEST_CODE, REQUEST_PAYLOAD);
        stub.revive();
        client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(20);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(10);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[1].handled).assertTrue();
      expect(stub.alive).assertTrue();
      expect(client.replies.length).assertEqual(10);
    });

    /**
     * @tc.name   stubStressMetricsRepliesBulk
     * @tc.desc   The replies counter equals the handled count in a bulk run.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send fifty accepted and fifty rejected requests.
     *                   2. Read the metrics replies and handled counters.
     *                   3. Compare with the client ledger.
     * @tc.expected      Replies and handled both equal fifty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressMetricsRepliesBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(50, REQUEST_CODE);
      client.sendMany(50, UNKNOWN_CODE_NEGATIVE);
      const metrics = StubMetrics.from(stub);
      expect(metrics.handled).assertEqual(50);
      expect(metrics.replies).assertEqual(50);
      expect(metrics.replies).assertEqual(metrics.handled);
      expect(client.replies.length).assertEqual(metrics.replies);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(stub.requestCount()).assertEqual(100);
    });

    /**
     * @tc.name   stubStressSequenceCursorBulk
     * @tc.desc   The sequence cursor equals the read count across a bulk drain.
     * @tc.precondition  A sequence with two hundred values.
     * @tc.steps         1. Write two hundred values.
     *                   2. Read one hundred fifty.
     *                   3. Compare the cursor with the read count.
     * @tc.expected      The cursor and read counter both equal one hundred fifty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceCursorBulk', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 200; index++) {
        sequence.writeString('c' + String(index));
      }
      for (let index = 0; index < 150; index++) {
        sequence.readString();
      }
      expect(sequence.cursor).assertEqual(150);
      expect(sequence.readCount).assertEqual(150);
      expect(sequence.cursor).assertEqual(sequence.readCount);
      expect(sequence.size()).assertEqual(200);
      expect(sequence.readString()).assertEqual('c150');
      expect(sequence.cursor).assertEqual(151);
      expect(sequence.trace().endsWith('#151')).assertTrue();
    });

    /**
     * @tc.name   stubStressServiceMetricsLink
     * @tc.desc   Service lifecycle counters link to stub metrics after a bulk run.
     * @tc.precondition  A connected lifecycle service.
     * @tc.steps         1. Connect and send one hundred requests.
     *                   2. Build stub metrics and a snapshot.
     *                   3. Compare the independent counters.
     * @tc.expected      The request counters agree across all views.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressServiceMetricsLink', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(100, REQUEST_CODE);
      service.onRequest(1);
      const metrics = StubMetrics.from(stub);
      const snapshot = new ServiceSnapshot(service);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.state).assertEqual('connected');
      expect(client.replies.length).assertEqual(100);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name   stubStressClientMixedBulk
     * @tc.desc   A five hundred request mixed run ends with consistent ledgers.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send five hundred requests with three codes.
     *                   2. Compare the client ledgers with the stub ledger.
     *                   3. Read the metrics.
     * @tc.expected      All ledgers and counters stay consistent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressClientMixedBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 500; index++) {
        client.send(index % 5 === 0 ? REQUEST_CODE : UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(stub);
      expect(client.sentCodes.length).assertEqual(500);
      expect(client.results.length).assertEqual(500);
      expect(client.replies.length).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.rejected).assertEqual(400);
      expect(stub.requests.length).assertEqual(500);
      expect(client.trace().split('|').length).assertEqual(100);
    });

    /**
     * @tc.name   stubStressFinalLedgerConsistency
     * @tc.desc   A long alternating run leaves every ledger count consistent.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send two hundred alternating requests.
     *                   2. Compare the stub and client ledgers.
     *                   3. Confirm the last record.
     * @tc.expected      Every count agrees and the last record is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressFinalLedgerConsistency', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 200; index++) {
        client.send(index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      }
      expect(stub.requests.length).assertEqual(200);
      expect(stub.requests.length).assertEqual(client.sentCodes.length);
      expect(stub.requests.length).assertEqual(client.results.length);
      expect(client.replies.length).assertEqual(100);
      expect(stub.lastRequest()?.code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.lastRequest()?.handled).assertFalse();
      expect(StubMetrics.from(stub).handled).assertEqual(100);
    });

    /**
     * @tc.name   stubStressFullStackCombined
     * @tc.desc   A combined lifecycle, stub and sequence run reports consistent state.
     * @tc.precondition  A service, a stub and a sequence.
     * @tc.steps         1. Connect the service and send fifty requests.
     *                   2. Write and drain fifty sequence values.
     *                   3. Compare all counters.
     * @tc.expected      Every component reports its expected total.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressFullStackCombined', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(50, REQUEST_CODE);
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 50; index++) {
        sequence.writeString('combo-' + String(index));
      }
      for (let index = 0; index < 50; index++) {
        sequence.readString();
      }
      expect(stub.requestCount()).assertEqual(50);
      expect(StubMetrics.from(stub).handled).assertEqual(50);
      expect(client.replies.length).assertEqual(50);
      expect(sequence.readCount).assertEqual(50);
      expect(sequence.cursor).assertEqual(50);
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name   stubStressSequenceTraceAfterRewindBulk
     * @tc.desc   A bulk rewind returns the trace cursor to zero.
     * @tc.precondition  A drained sequence with one hundred values.
     * @tc.steps         1. Write and drain one hundred values.
     *                   2. Rewind the sequence.
     *                   3. Read the trace tail.
     * @tc.expected      The trace ends with the zero cursor marker.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressSequenceTraceAfterRewindBulk', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 100; index++) {
        sequence.writeString('t' + String(index));
      }
      for (let index = 0; index < 100; index++) {
        sequence.readString();
      }
      expect(sequence.trace().endsWith('#100')).assertTrue();
      sequence.rewind();
      expect(sequence.trace().endsWith('#0')).assertTrue();
      expect(sequence.trace().split('|').length).assertEqual(100);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(100);
      expect(sequence.size()).assertEqual(100);
      expect(sequence.readString()).assertEqual('t0');
    });

    /**
     * @tc.name   stubStressZeroThenBulk
     * @tc.desc   A zero-length run followed by a bulk run behaves normally.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Call sendMany with zero.
     *                   2. Call sendMany with sixty.
     *                   3. Compare the ledgers.
     * @tc.expected      Only the sixty-request run is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubStressZeroThenBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const empty = client.sendMany(0, REQUEST_CODE);
      expect(empty).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      const handled = client.sendMany(60, REQUEST_CODE);
      expect(handled).assertEqual(60);
      expect(client.sentCodes.length).assertEqual(60);
      expect(stub.requestCount()).assertEqual(60);
      expect(StubMetrics.from(stub).handled).assertEqual(60);
      expect(client.replies.length).assertEqual(60);
      expect(client.trace().split('|').length).assertEqual(60);
    });

    /**
     * @tc.name   stubStressBoundaryCodesBulk
     * @tc.desc   Boundary codes around one are rejected across repeated runs.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send twenty cycles of boundary codes.
     *                   2. Count the rejected results.
     *                   3. Confirm the accepted count.
     * @tc.expected      All boundary codes are rejected and the ratio is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubStressBoundaryCodesBulk', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const boundaries: number[] = [-1, 0, 2, 99];
      for (let cycle = 0; cycle < 20; cycle++) {
        for (let index = 0; index < boundaries.length; index++) {
          client.send(boundaries[index], REQUEST_PAYLOAD);
        }
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(80);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(80);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(stub.lastRequest()?.code).assertEqual(99);
      expect(stub.requests[0].code).assertEqual(-1);
    });
  });
}
