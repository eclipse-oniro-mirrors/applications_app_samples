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
  ERROR_STUB_REJECTED,
  EVENT_ON_CREATE,
  EVENT_ON_CONNECT,
  EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY,
  EVENT_ON_REMOTE_DIED,
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
  textFingerprint,
  clampInt
} from '../Shared/SharedDriver';

function payloadSeries(count: number, prefix: string): string[] {
  const values: string[] = [];
  for (let index = 0; index < count; index++) {
    values.push(prefix + String(index));
  }
  return values;
}

function sumInts(values: number[]): number {
  let total = 0;
  for (let index = 0; index < values.length; index++) {
    total = total + values[index];
  }
  return total;
}

function handledRowCount(stub: StubRemoteObjectModel): number {
  let total = 0;
  for (let index = 0; index < stub.requests.length; index++) {
    if (stub.requests[index].handled) {
      total = total + 1;
    }
  }
  return total;
}

export default function longTermStability(): void {
  describe('PerformanceStabilityLongTerm', () => {
    beforeAll(() => {
      logSuite('PerformanceStabilityLongTerm', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PerformanceStabilityLongTerm', 'end');
    });

    /**
     * @tc.name          longTermStabilityThousandRequestsKeepCountersExact
     * @tc.desc          A thousand-request run keeps ledger and client counters exact.
     * @tc.precondition  A stub and a single client are constructed.
     * @tc.steps         1. Send one thousand valid requests.
     *                   2. Read ledger, reply and result lengths.
     *                   3. Compare aggregate metrics.
     * @tc.expected      All counters read one thousand with no drift.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityThousandRequestsKeepCountersExact', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(1000);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(1000);
      expect(stub.requestCount()).assertEqual(1000);
      expect(client.replies.length).assertEqual(1000);
      expect(client.results.length).assertEqual(1000);
      expect(metrics.handled).assertEqual(1000);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.sentTexts.length).assertEqual(1000);
    });

    /**
     * @tc.name          longTermStabilityThousandRequestsSustainReplies
     * @tc.desc          Every reply in a long run equals the production literal.
     * @tc.precondition  A thousand valid requests have completed.
     * @tc.steps         1. Sample replies at both ends and in the middle.
     *                   2. Compute the reply text length.
     *                   3. Compare with the reply literal length.
     * @tc.expected      Sampled replies all equal hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityThousandRequestsSustainReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(1000);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[250]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[500]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[750]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[999]).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[999].replyText.length).assertEqual(REPLY_PAYLOAD.length);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(1000);
    });

    /**
     * @tc.name          longTermStabilitySustainedMixedRatioStable
     * @tc.desc          A three-hundred-entry mixed plan keeps a two-thirds ratio.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send three hundred requests, rejecting every third.
     *                   2. Build metrics.
     *                   3. Compare handled and rejected counts.
     * @tc.expected      Two hundred handled, one hundred rejected, ratio two thirds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilitySustainedMixedRatioStable', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 300; index++) {
        const code = index % 3 === 0 ? UNKNOWN_CODE_ZERO : REQUEST_CODE;
        client.send(code, 'sustained-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(300);
      expect(metrics.handled).assertEqual(200);
      expect(metrics.rejected).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(2 / 3);
      expect(client.results.length).assertEqual(300);
      expect(handledRowCount(stub)).assertEqual(200);
    });

    /**
     * @tc.name          longTermStabilityLogBufferBoundedAcrossThousandEvents
     * @tc.desc          The service log buffer never exceeds its configured limit.
     * @tc.precondition  A service model with a 128-line log limit exists.
     * @tc.steps         1. Record one thousand onRequest events.
     *                   2. Read the log size and level counts.
     *                   3. Check for the newest and oldest fragments.
     * @tc.expected      The log holds 128 lines, keeps the newest and drops the oldest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLogBufferBoundedAcrossThousandEvents', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 1000; index++) {
        service.onRequest(index + 1);
      }
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(service.logs.contains('onRequest 1000')).assertTrue();
      expect(service.logs.contains('onRequest 873')).assertTrue();
      expect(service.logs.contains('onRequest 872')).assertFalse();
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.requestCount).assertEqual(1000);
      expect(service.logs.lines.length).assertEqual(128);
    });

    /**
     * @tc.name          longTermStabilityLogLevelCountsAfterOverflow
     * @tc.desc          Level counters stay consistent after buffer trimming.
     * @tc.precondition  A ten-line log buffer is created.
     * @tc.steps         1. Push twelve entries with mixed levels.
     *                   2. Read size and per-level counts.
     *                   3. Sum the level counts.
     * @tc.expected      Ten lines remain with four info, three warn and three error entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLogLevelCountsAfterOverflow', 0, () => {
      const logs = new LogBuffer(10);
      for (let index = 0; index < 12; index++) {
        const remainder = index % 3;
        if (remainder === 0) {
          logs.error('entry-' + String(index));
        } else if (remainder === 1) {
          logs.warn('entry-' + String(index));
        } else {
          logs.info('entry-' + String(index));
        }
      }
      const total = logs.countLevel(LEVEL_INFO) + logs.countLevel(LEVEL_WARN) + logs.countLevel(LEVEL_ERROR);
      expect(logs.size()).assertEqual(10);
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(3);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(3);
      expect(total).assertEqual(10);
      expect(logs.contains('entry-11')).assertTrue();
      expect(logs.contains('entry-0')).assertFalse();
    });

    /**
     * @tc.name          longTermStabilityRepeatedCreateDestroyCycles
     * @tc.desc          One hundred create-destroy cycles accumulate lifecycle counters.
     * @tc.precondition  A fresh service lifecycle model exists.
     * @tc.steps         1. Repeat onCreate and onDestroy one hundred times.
     *                   2. Count lifecycle events.
     *                   3. Inspect the final state.
     * @tc.expected      Both counters read one hundred and the state is destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityRepeatedCreateDestroyCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      for (let index = 0; index < 100; index++) {
        service.onCreate();
        service.onDestroy();
      }
      expect(service.destroyCount).assertEqual(100);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(100);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(100);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.size()).assertEqual(200);
      expect(service.logs.contains('onDestroy')).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityRepeatedConnectDisconnectCycles
     * @tc.desc          Fifty connect-disconnect cycles keep both counters aligned.
     * @tc.precondition  A service model has been created once.
     * @tc.steps         1. Repeat connect then disconnect fifty times.
     *                   2. Compare connect and disconnect counters.
     *                   3. Read the final state and last event.
     * @tc.expected      Both counters read fifty and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityRepeatedConnectDisconnectCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 50; index++) {
        const stub = service.onConnect();
        expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
        service.onDisconnect();
      }
      expect(service.connectCount).assertEqual(50);
      expect(service.disconnectCount).assertEqual(50);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(50);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(50);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          longTermStabilityLifecycleEventOrderSurvivesCycles
     * @tc.desc          A full lifecycle records events in production order.
     * @tc.precondition  A fresh service lifecycle model exists.
     * @tc.steps         1. Drive create, request, connect, request, disconnect, destroy.
     *                   2. Read the trace.
     *                   3. Compare with the expected ordered literal.
     * @tc.expected      The trace matches the production callback order exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityLifecycleEventOrderSurvivesCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      const stub = service.onConnect();
      stub.requests = [];
      service.onRequest(2);
      service.onDisconnect();
      service.onDestroy();
      const expected = 'onCreate>onRequest:1>onConnect:' + STUB_DESCRIPTOR +
        '>onRequest:2>onDisconnect>onDestroy';
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.size()).assertEqual(6);
      expect(service.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(service.destroyCount).assertEqual(1);
      expect(service.requestCount).assertEqual(2);
    });

    /**
     * @tc.name          longTermStabilityServiceStateAfterManyCycles
     * @tc.desc          State transitions remain correct through twenty cycles.
     * @tc.precondition  A service model is created and connected.
     * @tc.steps         1. Repeat connect and disconnect twenty times.
     *                   2. Sample the state after each half cycle.
     *                   3. Read the stub.
     * @tc.expected      State alternates connected and disconnected without deviation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityServiceStateAfterManyCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      let connectedSamples = 0;
      let disconnectedSamples = 0;
      for (let index = 0; index < 20; index++) {
        const stub = service.onConnect();
        if (service.state === 'connected') {
          connectedSamples = connectedSamples + 1;
        }
        service.onDisconnect();
        if (service.state === 'disconnected') {
          disconnectedSamples = disconnectedSamples + 1;
        }
        expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      }
      expect(connectedSamples).assertEqual(20);
      expect(disconnectedSamples).assertEqual(20);
      expect(service.connectCount).assertEqual(20);
      expect(service.disconnectCount).assertEqual(20);
      expect(service.requestCount).assertEqual(0);
      expect(service.logs.size() > 0).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityResetThenRerunCountsRestart
     * @tc.desc          Resetting a stub restarts ledger counts while client history remains.
     * @tc.precondition  A client has sent ten requests through a stub.
     * @tc.steps         1. Reset the stub.
     *                   2. Send five more requests.
     *                   3. Compare stub and client counters.
     * @tc.expected      The stub holds five rows while the client holds fifteen sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityResetThenRerunCountsRestart', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(10);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      const handled = client.sendMany(5);
      expect(handled).assertEqual(5);
      expect(stub.requestCount()).assertEqual(5);
      expect(client.sentCodes.length).assertEqual(15);
      expect(client.replies.length).assertEqual(15);
      expect(client.results.length).assertEqual(15);
      expect(StubMetrics.from(stub).requests).assertEqual(5);
    });

    /**
     * @tc.name          longTermStabilityHundredResetsLeaveEmptyState
     * @tc.desc          A hundred reset cycles leave no residual state.
     * @tc.precondition  A client and stub are constructed.
     * @tc.steps         1. Send one request and reset one hundred times.
     *                   2. Inspect both objects afterwards.
     *                   3. Confirm the descriptor survives.
     * @tc.expected      Ledger and client arrays are empty with the descriptor intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityHundredResetsLeaveEmptyState', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 100; index++) {
        client.send(REQUEST_CODE, 'reset-' + String(index));
        client.reset();
      }
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilitySequenceReuseAcrossRequests
     * @tc.desc          A message sequence can be rewound and read again.
     * @tc.precondition  A fresh message sequence exists.
     * @tc.steps         1. Write and read one string.
     *                   2. Rewind and read again.
     *                   3. Append a second string and inspect the trace.
     * @tc.expected      Both reads yield the first value and the trace shows two values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilitySequenceReuseAcrossRequests', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString('first')).assertTrue();
      expect(sequence.readString()).assertEqual('first');
      sequence.rewind();
      expect(sequence.readString()).assertEqual('first');
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.writeString('second')).assertTrue();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.trace()).assertEqual('first|second#1');
    });

    /**
     * @tc.name          longTermStabilityReclaimedSequenceRejectsWrites
     * @tc.desc          A reclaimed message sequence accepts no further writes or reads.
     * @tc.precondition  A sequence holds one written string.
     * @tc.steps         1. Write and reclaim the sequence.
     *                   2. Attempt another write.
     *                   3. Attempt a read.
     * @tc.expected      The write returns false and the read returns an empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityReclaimedSequenceRejectsWrites', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('kept');
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.writeString('lost')).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.size()).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('kept#0');
      expect(sequence.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityReplySequenceRewindAllowsReread
     * @tc.desc          A reply sequence can be rewound after the stub writes it.
     * @tc.precondition  A stub and message sequences are prepared.
     * @tc.steps         1. Invoke the stub.
     *                   2. Read the reply once.
     *                   3. Rewind and read it again.
     * @tc.expected      Both reads return hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityReplySequenceRewindAllowsReread', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('rewind-request');
      expect(stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel())).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      reply.rewind();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readCount).assertEqual(2);
      expect(reply.size()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('rewind-request');
    });

    /**
     * @tc.name          longTermStabilityMonotonicRequestIdsRecorded
     * @tc.desc          onRequest stores the supplied start id in event order.
     * @tc.precondition  A fresh service model exists.
     * @tc.steps         1. Call onRequest with ids ten, twenty and thirty.
     *                   2. Join the event trace.
     *                   3. Compare with the expected literal.
     * @tc.expected      The trace reads onRequest:10, onRequest:20, onRequest:30.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityMonotonicRequestIdsRecorded', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onRequest(10);
      service.onRequest(20);
      service.onRequest(30);
      expect(service.events.trace()).assertEqual('onRequest:10>onRequest:20>onRequest:30');
      expect(service.events.size()).assertEqual(3);
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.logs.contains('onRequest 30')).assertTrue();
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          longTermStabilityEventRecorderFingerprintStable
     * @tc.desc          Identical event sequences produce identical fingerprints.
     * @tc.precondition  Two independent event recorders are created.
     * @tc.steps         1. Record the same four events on both.
     *                   2. Compare fingerprints.
     *                   3. Record a different event on the second recorder.
     * @tc.expected      Fingerprints match first and diverge after the change.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityEventRecorderFingerprintStable', 0, () => {
      const first = new ServiceEventRecorder();
      const second = new ServiceEventRecorder();
      const kinds: string[] = [EVENT_ON_CREATE, EVENT_ON_CONNECT, EVENT_ON_DISCONNECT, EVENT_ON_DESTROY];
      for (let index = 0; index < kinds.length; index++) {
        first.record(kinds[index]);
        second.record(kinds[index]);
      }
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.size()).assertEqual(4);
      expect(first.trace()).assertEqual(second.trace());
      second.record(EVENT_ON_REMOTE_DIED);
      expect(first.fingerprint() === second.fingerprint()).assertFalse();
      expect(second.size()).assertEqual(5);
      expect(second.last()).assertEqual(EVENT_ON_REMOTE_DIED);
    });

    /**
     * @tc.name          longTermStabilityEventRecorderClearedBetweenRuns
     * @tc.desc          Clearing a recorder returns it to the empty baseline.
     * @tc.precondition  A recorder has collected several events.
     * @tc.steps         1. Record three events.
     *                   2. Clear the recorder.
     *                   3. Compare with a fresh recorder.
     * @tc.expected      Size is zero and both fingerprints match the empty literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityEventRecorderClearedBetweenRuns', 0, () => {
      const recorder = new ServiceEventRecorder();
      recorder.record(EVENT_ON_CREATE);
      recorder.record(EVENT_ON_CONNECT, STUB_DESCRIPTOR);
      recorder.record(EVENT_ON_DESTROY);
      expect(recorder.size()).assertEqual(3);
      recorder.clear();
      const fresh = new ServiceEventRecorder();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
      expect(recorder.fingerprint()).assertEqual(fresh.fingerprint());
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name          longTermStabilityLongRunFingerprintDeterministic
     * @tc.desc          Two identical two-hundred-request runs share one fingerprint.
     * @tc.precondition  Two stubs and two clients exist.
     * @tc.steps         1. Run the same plan on both stubs.
     *                   2. Build metrics for each.
     *                   3. Compare fingerprints and counters.
     * @tc.expected      Fingerprints, handled counts and ratios all match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLongRunFingerprintDeterministic', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      for (let index = 0; index < 200; index++) {
        const code = index % 4 === 0 ? UNKNOWN_CODE_TWO : REQUEST_CODE;
        firstClient.send(code, 'run-' + String(index));
        secondClient.send(code, 'run-' + String(index));
      }
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.handled).assertEqual(150);
      expect(secondMetrics.rejected).assertEqual(50);
      expect(firstMetrics.successRatio()).assertEqual(0.75);
      expect(firstClient.replies.length).assertEqual(150);
      expect(secondClient.replies.length).assertEqual(150);
    });

    /**
     * @tc.name          longTermStabilityAlternatingKillReviveHundredTimes
     * @tc.desc          One hundred kill-revive cycles keep a half-success workload.
     * @tc.precondition  A stub and client are constructed.
     * @tc.steps         1. Alternate kill with a send and revive with a send.
     *                   2. Read ledger metrics.
     *                   3. Check the final alive flag.
     * @tc.expected      One hundred replies, one hundred rejects and two hundred rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityAlternatingKillReviveHundredTimes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 100; index++) {
        stub.kill();
        const dark = client.send(REQUEST_CODE, 'dark-' + String(index));
        expect(dark.errCode).assertEqual(ERROR_STUB_REJECTED);
        stub.revive();
        const lit = client.send(REQUEST_CODE, 'lit-' + String(index));
        expect(lit.isSuccess()).assertTrue();
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(200);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.rejected).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.replies.length).assertEqual(100);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityKillReviveKeepsLedgerLength
     * @tc.desc          A kill-revive pair adds no extra ledger rows.
     * @tc.precondition  A stub has been killed and revived once.
     * @tc.steps         1. Kill and revive the stub.
     *                   2. Send five valid requests.
     *                   3. Count ledger rows and distinct payloads.
     * @tc.expected      Exactly five rows exist with five distinct payloads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityKillReviveKeepsLedgerLength', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      stub.revive();
      const payloads = payloadSeries(5, 'revive-');
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const texts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        texts.push(stub.requests[index].text);
      }
      expect(stub.requestCount()).assertEqual(5);
      expect(texts.length).assertEqual(5);
      expect(texts[0]).assertEqual('revive-0');
      expect(texts[4]).assertEqual('revive-4');
      expect(StubMetrics.from(stub).rejected).assertEqual(0);
      expect(client.replies.length).assertEqual(5);
    });

    /**
     * @tc.name          longTermStabilitySustainedUnknownCodesNoReplies
     * @tc.desc          Five hundred unknown sends produce no replies at all.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send five hundred unknown codes.
     *                   2. Read client reply list and trace.
     *                   3. Build metrics.
     * @tc.expected      Zero replies, five hundred rejects and ratio zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilitySustainedUnknownCodesNoReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 500; index++) {
        client.send(UNKNOWN_CODE_LARGE, 'unknown-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(metrics.requests).assertEqual(500);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(500);
      expect(metrics.successRatio()).assertEqual(0);
      expect(stub.requests[499].code).assertEqual(UNKNOWN_CODE_LARGE);
    });

    /**
     * @tc.name          longTermStabilityLongRunLastRowMatchesLatestPayload
     * @tc.desc          The final ledger row tracks the most recent payload.
     * @tc.precondition  A client can send a generated payload series.
     * @tc.steps         1. Send three hundred generated payloads.
     *                   2. Read the first and last rows.
     *                   3. Compare reply counts.
     * @tc.expected      The last row text is series299 and the first is series0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLongRunLastRowMatchesLatestPayload', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const payloads = payloadSeries(300, 'series');
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      expect(stub.requests[0].text).assertEqual('series0');
      expect(stub.requests[299].text).assertEqual('series299');
      expect(stub.requests[299].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(300);
      expect(client.sentTexts[299]).assertEqual('series299');
      expect(client.replies.length).assertEqual(300);
    });

    /**
     * @tc.name          longTermStabilityBatchLoopMaintainsPerClientCounts
     * @tc.desc          A ten-round interleave keeps every client count at ten.
     * @tc.precondition  Ten clients are bound to one stub.
     * @tc.steps         1. For each round, send once from every client.
     *                   2. Sum per-client reply counts.
     *                   3. Compare with the stub ledger.
     * @tc.expected      Each client holds ten replies and the stub holds one hundred rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityBatchLoopMaintainsPerClientCounts', 0, () => {
      const stub = new StubRemoteObjectModel();
      const clients: InProcessClient[] = [];
      for (let index = 0; index < 10; index++) {
        clients.push(new InProcessClient(stub));
      }
      for (let round = 0; round < 10; round++) {
        for (let index = 0; index < clients.length; index++) {
          clients[index].send(REQUEST_CODE, 'r' + String(round) + 'c' + String(index));
        }
      }
      const counts: number[] = [];
      for (let index = 0; index < clients.length; index++) {
        counts.push(clients[index].replies.length);
      }
      const countTexts: string[] = [];
      for (let index = 0; index < counts.length; index++) {
        countTexts.push(String(counts[index]));
      }
      expect(sumInts(counts)).assertEqual(100);
      expect(countOf(countTexts, '10')).assertEqual(10);
      expect(stub.requestCount()).assertEqual(100);
      expect(stub.requests[0].text).assertEqual('r0c0');
      expect(stub.requests[99].text).assertEqual('r9c9');
    });

    /**
     * @tc.name          longTermStabilityTenClientsHundredRequestsAudit
     * @tc.desc          Alternating valid and invalid clients split the ledger evenly.
     * @tc.precondition  Ten clients exist, five valid and five invalid.
     * @tc.steps         1. Send ten requests from each client.
     *                   2. Build metrics.
     *                   3. Compare client reply totals.
     * @tc.expected      Fifty handled, fifty rejected and five clients with no replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityTenClientsHundredRequestsAudit', 0, () => {
      const stub = new StubRemoteObjectModel();
      const emptyClients: number[] = [];
      let handledClients = 0;
      for (let index = 0; index < 10; index++) {
        const client = new InProcessClient(stub);
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_ZERO;
        client.sendMany(10, code);
        if (client.replies.length === 10) {
          handledClients = handledClients + 1;
        } else {
          emptyClients.push(client.replies.length);
        }
      }
      const metrics = StubMetrics.from(stub);
      expect(handledClients).assertEqual(5);
      expect(emptyClients.length).assertEqual(5);
      expect(sumInts(emptyClients)).assertEqual(0);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(50);
      expect(metrics.rejected).assertEqual(50);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          longTermStabilitySnapshotStableDuringIdlePeriod
     * @tc.desc          Two snapshots taken without traffic compare equal.
     * @tc.precondition  A service is created and connected.
     * @tc.steps         1. Capture a snapshot.
     *                   2. Capture another without changing state.
     *                   3. Compare snapshots and descriptions.
     * @tc.expected      Both snapshots are identical and describe the same counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilitySnapshotStableDuringIdlePeriod', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const first = new ServiceSnapshot(service);
      const second = new ServiceSnapshot(service);
      expect(first.sameAs(second)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.state).assertEqual('connected');
      expect(first.connects).assertEqual(1);
      expect(first.disconnects).assertEqual(0);
      expect(first.requests).assertEqual(0);
      expect(first.destroys).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilitySnapshotDetectsStateChange
     * @tc.desc          A disconnect after a snapshot makes the next snapshot differ.
     * @tc.precondition  A connected service has a captured snapshot.
     * @tc.steps         1. Capture the connected snapshot.
     *                   2. Disconnect the service.
     *                   3. Capture and compare a second snapshot.
     * @tc.expected      The snapshots differ in state and disconnect count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilitySnapshotDetectsStateChange', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const before = new ServiceSnapshot(service);
      service.onDisconnect();
      const after = new ServiceSnapshot(service);
      expect(before.sameAs(after)).assertFalse();
      expect(before.state).assertEqual('connected');
      expect(after.state).assertEqual('disconnected');
      expect(after.disconnects).assertEqual(1);
      expect(before.disconnects).assertEqual(0);
      expect(before.describe() === after.describe()).assertFalse();
      expect(after.connects).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityLogBufferClearResetsSize
     * @tc.desc          Clearing a bounded log resets every counter.
     * @tc.precondition  A five-line log has overflowed.
     * @tc.steps         1. Push eight entries.
     *                   2. Clear the log.
     *                   3. Read size, levels and trace.
     * @tc.expected      Size and every level count return to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityLogBufferClearResetsSize', 0, () => {
      const logs = new LogBuffer(5);
      for (let index = 0; index < 8; index++) {
        logs.info('line-' + String(index));
      }
      expect(logs.size()).assertEqual(5);
      logs.clear();
      expect(logs.size()).assertEqual(0);
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(logs.trace()).assertEqual('');
      expect(logs.contains('line-7')).assertFalse();
    });

    /**
     * @tc.name          longTermStabilityWarnAndErrorLevelsBounded
     * @tc.desc          Warning and error entries share the bounded capacity.
     * @tc.precondition  A four-line log buffer is created.
     * @tc.steps         1. Push ten alternating warn and error entries.
     *                   2. Read each level count.
     *                   3. Check the retained fragments.
     * @tc.expected      Four entries remain with two warnings and two errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityWarnAndErrorLevelsBounded', 0, () => {
      const logs = new LogBuffer(4);
      for (let index = 0; index < 10; index++) {
        if (index % 2 === 0) {
          logs.warn('warn-' + String(index));
        } else {
          logs.error('error-' + String(index));
        }
      }
      expect(logs.size()).assertEqual(4);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(logs.contains('error-9')).assertTrue();
      expect(logs.contains('warn-0')).assertFalse();
      expect(logs.lines[3]).assertEqual('ERROR error-9');
    });

    /**
     * @tc.name          longTermStabilityAlternatingLevelsBounded
     * @tc.desc          A repeating info-warn-error cycle retains two of each level.
     * @tc.precondition  A six-line log buffer is created.
     * @tc.steps         1. Push twelve entries in level order.
     *                   2. Read size and level counts.
     *                   3. Compare the retained suffix.
     * @tc.expected      Six entries remain with two of each level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityAlternatingLevelsBounded', 0, () => {
      const logs = new LogBuffer(6);
      for (let index = 0; index < 4; index++) {
        logs.info('info-' + String(index));
        logs.warn('warn-' + String(index));
        logs.error('error-' + String(index));
      }
      expect(logs.size()).assertEqual(6);
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(logs.lines[0]).assertEqual('INFO info-2');
      expect(logs.lines[5]).assertEqual('ERROR error-3');
      expect(logs.contains('info-1')).assertFalse();
    });

    /**
     * @tc.name          longTermStabilityLogLimitOneKeepsLatestLine
     * @tc.desc          A one-line log keeps only the newest entry.
     * @tc.precondition  A one-line log buffer is created.
     * @tc.steps         1. Push three entries of different levels.
     *                   2. Read size and trace.
     *                   3. Check the retained level.
     * @tc.expected      Exactly one error line remains and it names the last entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLogLimitOneKeepsLatestLine', 0, () => {
      const logs = new LogBuffer(1);
      logs.info('first');
      logs.warn('second');
      logs.error('third');
      expect(logs.size()).assertEqual(1);
      expect(logs.trace()).assertEqual('ERROR third');
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(logs.contains('third')).assertTrue();
      expect(logs.contains('first')).assertFalse();
      expect(logs.levels[0]).assertEqual(LEVEL_ERROR);
    });

    /**
     * @tc.name          longTermStabilityTenThousandRequestSweep
     * @tc.desc          A ten-thousand-request sweep keeps every counter exact.
     * @tc.precondition  A stub and client are constructed.
     * @tc.steps         1. Send ten thousand valid requests.
     *                   2. Read ledger and metrics.
     *                   3. Sample first and last ledger rows.
     * @tc.expected      All counters read ten thousand with one hundred percent success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityTenThousandRequestSweep', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(10000);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(10000);
      expect(stub.requestCount()).assertEqual(10000);
      expect(metrics.handled).assertEqual(10000);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[9999].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          longTermStabilityMetricsReplyCountMatchesHandled
     * @tc.desc          Replies counted by metrics equal the handled row count.
     * @tc.precondition  A ninety-request mixed workload is prepared.
     * @tc.steps         1. Reject every fifth request.
     *                   2. Build metrics.
     *                   3. Compare handled and reply counters.
     * @tc.expected      Seventy-two handled rows and seventy-two replies agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityMetricsReplyCountMatchesHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 90; index++) {
        const code = index % 5 === 0 ? UNKNOWN_CODE_TWO : REQUEST_CODE;
        client.send(code, 'metric-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(90);
      expect(metrics.handled).assertEqual(72);
      expect(metrics.rejected).assertEqual(18);
      expect(metrics.replies).assertEqual(72);
      expect(metrics.replies).assertEqual(handledRowCount(stub));
      expect(client.replies.length).assertEqual(72);
      expect(metrics.successRatio()).assertEqual(0.8);
    });

    /**
     * @tc.name          longTermStabilityClampBoundsAppliedToCounters
     * @tc.desc          clampInt enforces lower and upper bounds on sampled counters.
     * @tc.precondition  The shared clamp helper is imported.
     * @tc.steps         1. Clamp an oversized counter to one hundred.
     *                   2. Clamp a negative counter to zero.
     *                   3. Clamp an in-range counter unchanged.
     * @tc.expected      Clamped values read 100, 0 and 50 respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityClampBoundsAppliedToCounters', 0, () => {
      expect(clampInt(150, 0, 100)).assertEqual(100);
      expect(clampInt(-5, 0, 100)).assertEqual(0);
      expect(clampInt(50, 0, 100)).assertEqual(50);
      expect(clampInt(75, 10, 60)).assertEqual(60);
      expect(clampInt(10, 10, 60)).assertEqual(10);
      expect(clampInt(9, 10, 60)).assertEqual(10);
      expect(clampInt(60, 10, 60)).assertEqual(60);
    });

    /**
     * @tc.name          longTermStabilityResetKeepsDescriptorAndReply
     * @tc.desc          Reset restores the default reply but keeps the descriptor.
     * @tc.precondition  A stub has a customized reply and recorded traffic.
     * @tc.steps         1. Customize the reply and send.
     *                   2. Reset the stub.
     *                   3. Send again with a fresh client.
     * @tc.expected      The descriptor survives and the default reply returns.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityResetKeepsDescriptorAndReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.replyText = 'custom-before-reset';
      const client = new InProcessClient(stub);
      expect(client.send(REQUEST_CODE).replyText).assertEqual('custom-before-reset');
      stub.reset();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      const after = new InProcessClient(stub).send(REQUEST_CODE);
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityManyResetCyclesWithTraffic
     * @tc.desc          Two hundred traffic-reset cycles leave a clean stub.
     * @tc.precondition  A stub and client are constructed.
     * @tc.steps         1. Send two requests and reset two hundred times.
     *                   2. Confirm every cycle handled both sends.
     *                   3. Audit the final state.
     * @tc.expected      The final ledger is empty and the client sent four hundred times.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityManyResetCyclesWithTraffic', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let fullCycles = 0;
      for (let cycle = 0; cycle < 200; cycle++) {
        if (client.sendMany(2) === 2) {
          fullCycles = fullCycles + 1;
        }
        stub.reset();
      }
      expect(fullCycles).assertEqual(200);
      expect(stub.requestCount()).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(400);
      expect(client.replies.length).assertEqual(400);
      expect(client.results.length).assertEqual(400);
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          longTermStabilityDenseBurstNoLostRows
     * @tc.desc          A dense unique-payload burst records every row exactly once.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send two hundred fifty unique payloads.
     *                   2. Rebuild the payload list from the ledger.
     *                   3. Compare joined fingerprint and distinct count.
     * @tc.expected      All two hundred fifty rows are distinct and in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityDenseBurstNoLostRows', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const payloads = payloadSeries(250, 'burst-');
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const texts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        texts.push(stub.requests[index].text);
      }
      expect(texts.length).assertEqual(250);
      expect(textFingerprint(joined(texts, '|'))).assertEqual(textFingerprint(joined(payloads, '|')));
      expect(texts[0]).assertEqual('burst-0');
      expect(texts[249]).assertEqual('burst-249');
      expect(StubMetrics.from(stub).replies).assertEqual(250);
      expect(stub.requests[125].text).assertEqual('burst-125');
    });

    /**
     * @tc.name          longTermStabilityServiceRequestLogBoundedAtScale
     * @tc.desc          Five thousand requests keep the service log at its limit.
     * @tc.precondition  A service model with a 128-line log exists.
     * @tc.steps         1. Record five thousand onRequest calls.
     *                   2. Read log size and event count.
     *                   3. Check the retained newest fragment.
     * @tc.expected      The log stays at 128 lines while events count five thousand.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityServiceRequestLogBoundedAtScale', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 5000; index++) {
        service.onRequest(index + 1);
      }
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(service.events.size()).assertEqual(5001);
      expect(service.requestCount).assertEqual(5000);
      expect(service.logs.contains('onRequest 5000')).assertTrue();
      expect(service.logs.contains('onRequest 4873')).assertTrue();
      expect(service.logs.contains('onRequest 4000')).assertFalse();
    });

    /**
     * @tc.name          longTermStabilitySequenceReclaimAfterLongWrite
     * @tc.desc          Reclaiming a heavily used sequence clears read and write access.
     * @tc.precondition  A sequence has one hundred written strings.
     * @tc.steps         1. Read half of the values.
     *                   2. Reclaim the sequence.
     *                   3. Attempt a read and a write.
     * @tc.expected      The sequence keeps its size but refuses new reads and writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilitySequenceReclaimAfterLongWrite', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 100; index++) {
        sequence.writeString('seq-' + String(index));
      }
      for (let index = 0; index < 50; index++) {
        sequence.readString();
      }
      expect(sequence.writeCount).assertEqual(100);
      expect(sequence.readCount).assertEqual(50);
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.size()).assertEqual(100);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.writeString('after-reclaim')).assertFalse();
      expect(sequence.cursor).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilityAlternatingPayloadFingerprintStable
     * @tc.desc          Rebuilt payload sequences fingerprint identically to originals.
     * @tc.precondition  One hundred alternating payloads are generated.
     * @tc.steps         1. Send each payload alternate ways.
     *                   2. Rebuild the payload list from the ledger.
     *                   3. Compare fingerprints.
     * @tc.expected      The rebuilt and original sequences share one fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityAlternatingPayloadFingerprintStable', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const originals: string[] = [];
      for (let index = 0; index < 100; index++) {
        const payload = index % 2 === 0 ? 'even-' + String(index) : 'odd-' + String(index);
        originals.push(payload);
        client.send(REQUEST_CODE, payload);
      }
      const rebuilt: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        rebuilt.push(stub.requests[index].text);
      }
      expect(rebuilt.length).assertEqual(100);
      expect(textFingerprint(joined(originals, '|'))).assertEqual(textFingerprint(joined(rebuilt, '|')));
      expect(textFingerprint(joined(rebuilt, '|')) === textFingerprint('even-0')).assertFalse();
      expect(rebuilt[0]).assertEqual('even-0');
      expect(rebuilt[99]).assertEqual('odd-99');
      expect(client.replies.length).assertEqual(100);
    });

    /**
     * @tc.name          longTermStabilityTwoHundredFiftyMixedLedgerAudit
     * @tc.desc          A quarter-invalid ledger reconciles with aggregate metrics.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send two hundred fifty requests, rejecting every fourth.
     *                   2. Recount handled and rejected rows manually.
     *                   3. Compare with metrics.
     * @tc.expected      One hundred eighty-seven handled and sixty-three rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityTwoHundredFiftyMixedLedgerAudit', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 250; index++) {
        const code = index % 4 === 0 ? UNKNOWN_CODE_ZERO : REQUEST_CODE;
        client.send(code, 'audit-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      let handled = 0;
      let rejected = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (stub.requests[index].handled) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      expect(handled).assertEqual(187);
      expect(rejected).assertEqual(63);
      expect(metrics.handled).assertEqual(187);
      expect(metrics.rejected).assertEqual(63);
      expect(stub.requestCount()).assertEqual(250);
      expect(metrics.successRatio()).assertEqual(187 / 250);
    });

    /**
     * @tc.name          longTermStabilitySnapshotAfterLongLifecycle
     * @tc.desc          A snapshot after ten lifecycle cycles reports exact counters.
     * @tc.precondition  A service model is available.
     * @tc.steps         1. Run ten connect-disconnect cycles and five requests.
     *                   2. Destroy the service.
     *                   3. Capture and inspect the snapshot.
     * @tc.expected      The snapshot reads ten connects, ten disconnects, five requests, one destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilitySnapshotAfterLongLifecycle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 10; index++) {
        service.onConnect();
        service.onDisconnect();
      }
      for (let index = 0; index < 5; index++) {
        service.onRequest(index + 1);
      }
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(10);
      expect(snapshot.disconnects).assertEqual(10);
      expect(snapshot.requests).assertEqual(5);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/10/10/5/1');
    });

    /**
     * @tc.name          longTermStabilityLogContainsRecentFragmentOnly
     * @tc.desc          A trimmed log answers contains only for retained lines.
     * @tc.precondition  An eight-line log buffer is created.
     * @tc.steps         1. Push twenty numbered lines.
     *                   2. Probe retained and dropped fragments.
     *                   3. Read the line count.
     * @tc.expected      Lines twelve through nineteen are retained and earlier ones dropped.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLogContainsRecentFragmentOnly', 0, () => {
      const logs = new LogBuffer(8);
      for (let index = 0; index < 20; index++) {
        logs.info('line-' + String(index));
      }
      expect(logs.size()).assertEqual(8);
      expect(logs.contains('line-19')).assertTrue();
      expect(logs.contains('line-12')).assertTrue();
      expect(logs.contains('line-11')).assertFalse();
      expect(logs.contains('line-0')).assertFalse();
      expect(logs.lines[0]).assertEqual('INFO line-12');
      expect(logs.lines[7]).assertEqual('INFO line-19');
    });

    /**
     * @tc.name          longTermStabilityLifecycleCountersIndependent
     * @tc.desc          One pass through each callback increments only its own counter.
     * @tc.precondition  A fresh service lifecycle model exists.
     * @tc.steps         1. Invoke every lifecycle callback once.
     *                   2. Read each counter.
     *                   3. Compare the snapshot description.
     * @tc.expected      Each counter reads one and the description matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityLifecycleCountersIndependent', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(7);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/1/1');
      expect(service.events.size()).assertEqual(5);
    });

    /**
     * @tc.name          longTermStabilityReplyConstantAcrossOptionLevels
     * @tc.desc          Option flags never change the reply text.
     * @tc.precondition  A stub and three prepared sequences exist.
     * @tc.steps         1. Invoke the stub with three different options.
     *                   2. Read the recorded reply texts.
     *                   3. Count the handled rows.
     * @tc.expected      All rows carry the same reply literal and are handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityReplyConstantAcrossOptionLevels', 0, () => {
      const stub = new StubRemoteObjectModel();
      const options: MessageOptionModel[] = [
        new MessageOptionModel(0, 0, false),
        new MessageOptionModel(1, 25, false),
        new MessageOptionModel(1, 0, true)
      ];
      for (let index = 0; index < options.length; index++) {
        const data = MessageSequenceModel.create();
        const reply = MessageSequenceModel.create();
        data.writeString('option-' + String(index));
        expect(stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, options[index])).assertTrue();
        expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      }
      expect(stub.requestCount()).assertEqual(3);
      expect(handledRowCount(stub)).assertEqual(3);
      expect(stub.requests[2].replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).replies).assertEqual(3);
    });

    /**
     * @tc.name          longTermStabilityStubRejectsAfterKillUntilRevive
     * @tc.desc          A killed stub rejects every send until explicitly revived.
     * @tc.precondition  A stub has been killed and left dead.
     * @tc.steps         1. Send ten requests while dead.
     *                   2. Revive and send once.
     *                   3. Build metrics.
     * @tc.expected      Ten rejects followed by one handled request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityStubRejectsAfterKillUntilRevive', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      for (let index = 0; index < 10; index++) {
        expect(client.send(REQUEST_CODE, 'dead-' + String(index)).isSuccess()).assertFalse();
      }
      expect(stub.alive).assertFalse();
      expect(stub.requestCount()).assertEqual(10);
      stub.revive();
      expect(client.send(REQUEST_CODE, 'revived').isSuccess()).assertTrue();
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(11);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(10);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityHundredClientsOneRequest
     * @tc.desc          One hundred independent clients each send exactly once.
     * @tc.precondition  A shared stub is available.
     * @tc.steps         1. Create one hundred clients and send once each.
     *                   2. Sum replies and distinct payloads.
     *                   3. Compare with the shared ledger.
     * @tc.expected      One hundred replies and one hundred ledger rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityHundredClientsOneRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      const clients: InProcessClient[] = [];
      for (let index = 0; index < 100; index++) {
        const client = new InProcessClient(stub);
        clients.push(client);
        client.send(REQUEST_CODE, 'client-' + String(index));
      }
      let replies = 0;
      let singles = 0;
      for (let index = 0; index < clients.length; index++) {
        replies = replies + clients[index].replies.length;
        if (clients[index].results.length === 1) {
          singles = singles + 1;
        }
      }
      expect(replies).assertEqual(100);
      expect(singles).assertEqual(100);
      expect(stub.requestCount()).assertEqual(100);
      expect(stub.requests[0].text).assertEqual('client-0');
      expect(stub.requests[99].text).assertEqual('client-99');
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityMetricsFingerprintAfterMixedScale
     * @tc.desc          A five-hundred-request mix produces an exact stable fingerprint.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Reject every fifth request across five hundred sends.
     *                   2. Build metrics.
     *                   3. Compare the fingerprint with the manual literal.
     * @tc.expected      The fingerprint equals the hash of 500:400:100:400.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityMetricsFingerprintAfterMixedScale', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 500; index++) {
        const code = index % 5 === 0 ? UNKNOWN_CODE_TWO : REQUEST_CODE;
        client.send(code, 'scale-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(500);
      expect(metrics.handled).assertEqual(400);
      expect(metrics.rejected).assertEqual(100);
      expect(metrics.replies).assertEqual(400);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('500:400:100:400'));
      expect(metrics.successRatio()).assertEqual(0.8);
    });

    /**
     * @tc.name          longTermStabilityEventRecorderDetailFormat
     * @tc.desc          Event details are appended after a colon in the trace.
     * @tc.precondition  An empty event recorder exists.
     * @tc.steps         1. Record one event with detail and one without.
     *                   2. Count each kind.
     *                   3. Read the trace and last entry.
     * @tc.expected      The trace reads onConnect:IPCStubTest>onCreate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityEventRecorderDetailFormat', 0, () => {
      const recorder = new ServiceEventRecorder();
      recorder.record(EVENT_ON_CONNECT, STUB_DESCRIPTOR);
      recorder.record(EVENT_ON_CREATE);
      expect(recorder.size()).assertEqual(2);
      expect(recorder.trace()).assertEqual('onConnect:' + STUB_DESCRIPTOR + '>onCreate');
      expect(recorder.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(recorder.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(recorder.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(recorder.last()).assertEqual(EVENT_ON_CREATE);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(recorder.trace()));
    });

    /**
     * @tc.name          longTermStabilityZeroRequestBaseline
     * @tc.desc          A fresh stub reports a zeroed metric baseline.
     * @tc.precondition  A new stub is constructed with no traffic.
     * @tc.steps         1. Build metrics immediately.
     *                   2. Read each counter.
     *                   3. Compare the fingerprint with the zero literal.
     * @tc.expected      Every counter is zero and the ratio is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityZeroRequestBaseline', 0, () => {
      const stub = new StubRemoteObjectModel();
      const metrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(0);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
    });

    /**
     * @tc.name          longTermStabilityFinalConsistencyAudit
     * @tc.desc          Service, stub and client states agree at the end of a session.
     * @tc.precondition  A service with one connection and mixed traffic exists.
     * @tc.steps         1. Connect and send twenty mixed requests.
     *                   2. Disconnect and destroy.
     *                   3. Cross-check every observable.
     * @tc.expected      All counters and flags agree with the recorded work.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityFinalConsistencyAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 20; index++) {
        const code = index % 4 === 0 ? UNKNOWN_CODE_LARGE : REQUEST_CODE;
        client.send(code, 'audit-' + String(index));
      }
      service.onDisconnect();
      service.onDestroy();
      const metrics = StubMetrics.from(stub);
      const snapshot = new ServiceSnapshot(service);
      expect(metrics.requests).assertEqual(20);
      expect(metrics.handled).assertEqual(15);
      expect(metrics.rejected).assertEqual(5);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/0/1');
      expect(client.replies.length).assertEqual(15);
      expect(stub.requestCount()).assertEqual(20);
    });

    /**
     * @tc.name          longTermStabilityLogCapacityPreservedAfterClear
     * @tc.desc          Clearing a log does not change its configured capacity.
     * @tc.precondition  A three-line log has been filled and cleared.
     * @tc.steps         1. Push five entries and clear.
     *                   2. Push two more entries.
     *                   3. Read the size and limit.
     * @tc.expected      The limit stays three and two entries are retained.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLogCapacityPreservedAfterClear', 0, () => {
      const logs = new LogBuffer(3);
      for (let index = 0; index < 5; index++) {
        logs.info('before-' + String(index));
      }
      expect(logs.size()).assertEqual(3);
      logs.clear();
      logs.warn('after-one');
      logs.error('after-two');
      expect(logs.limit).assertEqual(3);
      expect(logs.size()).assertEqual(2);
      expect(logs.contains('after-two')).assertTrue();
      expect(logs.contains('before-4')).assertFalse();
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(1);
    });
  });
}
