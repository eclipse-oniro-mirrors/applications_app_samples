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
import {
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  RequestResultModel,
  ClientSnapshot,
  ClientMetrics,
  MessageSequenceModel,
  MessageOptionModel,
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  CONNECT_SUCCESS_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  INITIAL_CONNECT_ID,
  countOf
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

/** One measurement window inside a long run. */
class PeriodStat {
  public round: number;
  public ok: number;
  public fail: number;
  public logSize: number;
  public toastTotal: number;

  constructor(round: number, ok: number, fail: number, logSize: number, toastTotal: number) {
    this.round = round;
    this.ok = ok;
    this.fail = fail;
    this.logSize = logSize;
    this.toastTotal = toastTotal;
  }

  public attempted(): number {
    return this.ok + this.fail;
  }

  public describe(): string {
    return String(this.round) + ':' + String(this.ok) + ':' + String(this.fail) + ':' + String(this.logSize);
  }
}

function newClient(): ConnectionModel {
  return new ConnectionModel();
}

function openConnection(client: ConnectionModel, id: number, reply: string = REPLY_PAYLOAD): RemoteProxyModel {
  client.connect(id);
  const stub: RemoteStubModel = new RemoteStubModel();
  stub.replyText = reply;
  const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
  client.onConnect(proxy);
  return proxy;
}

function sendBurst(client: ConnectionModel, times: number, payload: string = REQUEST_PAYLOAD): RequestResultModel[] {
  const results: RequestResultModel[] = [];
  for (let index = 0; index < times; index++) {
    results.push(client.sendString(payload));
  }
  return results;
}

function successCount(results: RequestResultModel[]): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

function failCount(results: RequestResultModel[]): number {
  return results.length - successCount(results);
}

function codeCount(results: RequestResultModel[], code: number): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].errCode === code) {
      total = total + 1;
    }
  }
  return total;
}

function toastCount(client: ConnectionModel, text: string): number {
  return countOf(client.toasts, text);
}

function eventCount(client: ConnectionModel, kind: string): number {
  return client.events.countOf(kind);
}

function capturePeriod(client: ConnectionModel, round: number, ok: number, fail: number): PeriodStat {
  return new PeriodStat(round, ok, fail, client.logs.size(), client.toasts.length);
}

/** Deterministic latency model: base cost plus a small per-request jitter. */
function modeledLatency(index: number, base: number): number {
  return base + (index % 7);
}

function modeledTotalLatency(count: number, base: number): number {
  let total = 0;
  for (let index = 0; index < count; index++) {
    total = total + modeledLatency(index, base);
  }
  return total;
}

export default function longTermStability(): void {
  describe('LongTermStability', () => {
    beforeAll(() => {
      logSuite('LongTermStability', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('LongTermStability', 'end');
    });

    /**
     * @tc.name          longTermStabilityTenRoundsSustain
     * @tc.desc          Ten rounds of four requests each sustain a perfect success ratio.
     * @tc.precondition  A connected client and a ten-round plan.
     * @tc.steps         1. Run four sends per round for ten rounds.
     *                   2. Capture the per-round statistics.
     *                   3. Verify every round reports four successes.
     * @tc.expected      Forty replies accumulate with no failure in any round.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityTenRoundsSustain', 0, () => {
      logStep('longTermStabilityTenRoundsSustain', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 501);
      const periods: PeriodStat[] = [];
      for (let round = 0; round < 10; round++) {
        const results: RequestResultModel[] = sendBurst(client, 4);
        periods.push(capturePeriod(client, round, successCount(results), failCount(results)));
      }
      expect(periods.length).assertEqual(10);
      expect(periods[0].ok).assertEqual(4);
      expect(periods[9].ok).assertEqual(4);
      expect(periods[5].fail).assertEqual(0);
      expect(periods[9].toastTotal).assertEqual(41);
      expect(ClientMetrics.from(client).replies).assertEqual(40);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
      expect(eventCount(client, 'send-ok')).assertEqual(40);
    });

    /**
     * @tc.name          longTermStabilityHundredSendsClean
     * @tc.desc          One hundred sequential sends complete without a single failure.
     * @tc.precondition  A connected client with a live stub.
     * @tc.steps         1. Dispatch one hundred requests.
     *                   2. Count successes, failures and stub receipts.
     *                   3. Confirm the log cap still holds.
     * @tc.expected      All one hundred requests succeed and the log stays bounded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityHundredSendsClean', 0, () => {
      logStep('longTermStabilityHundredSendsClean', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 502);
      const results: RequestResultModel[] = sendBurst(client, 100);
      expect(successCount(results)).assertEqual(100);
      expect(failCount(results)).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(100);
      expect(proxy.stub.receivedTexts.length).assertEqual(100);
      expect(client.logs.size()).assertEqual(102);
      expect(client.toasts.length).assertEqual(101);
      expect(ClientMetrics.from(client).sends).assertEqual(100);
      expect(ClientMetrics.from(client).replies).assertEqual(100);
    });

    /**
     * @tc.name          longTermStabilityLogStaysBounded
     * @tc.desc          A long send run never lets the bounded log exceed its configured limit.
     * @tc.precondition  A connected client whose log limit is 128.
     * @tc.steps         1. Send two hundred and fifty requests.
     *                   2. Sample the log size after each block of fifty.
     *                   3. Verify the size never exceeds the limit.
     * @tc.expected      Every sample is at or below 128 and the final size equals 128.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('longTermStabilityLogStaysBounded', 0, () => {
      logStep('longTermStabilityLogStaysBounded', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 503);
      const samples: number[] = [];
      for (let block = 0; block < 5; block++) {
        sendBurst(client, 50);
        samples.push(client.logs.size());
      }
      expect(samples.length).assertEqual(5);
      expect(samples[0] <= 128).assertTrue();
      expect(samples[2] <= 128).assertTrue();
      expect(samples[4]).assertEqual(128);
      expect(client.logs.limit).assertEqual(128);
      expect(client.logs.levels.length).assertEqual(128);
      expect(client.logs.lines.length).assertEqual(128);
      expect(eventCount(client, 'send-ok')).assertEqual(250);
    });

    /**
     * @tc.name          longTermStabilityToastGrowthLinear
     * @tc.desc          Toast history grows by exactly one entry per send across many rounds.
     * @tc.precondition  A connected client and a nine-round plan of three sends.
     * @tc.steps         1. Record the baseline toast count.
     *                   2. Run nine rounds of three sends.
     *                   3. Compare the growth with the number of sends.
     * @tc.expected      The toast count equals the baseline plus twenty-seven.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityToastGrowthLinear', 0, () => {
      logStep('longTermStabilityToastGrowthLinear', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 504);
      const baseline: number = client.toasts.length;
      for (let round = 0; round < 9; round++) {
        sendBurst(client, 3);
      }
      expect(baseline).assertEqual(1);
      expect(client.toasts.length).assertEqual(baseline + 27);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(27);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(0);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(ClientMetrics.from(client).replies).assertEqual(27);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityCounterMonotonicity
     * @tc.desc          Success, send and reply counters never decrease during a long run.
     * @tc.precondition  A connected client sampled after every round.
     * @tc.steps         1. Run twelve rounds of two sends.
     *                   2. Capture sends and replies after each round.
     *                   3. Confirm both sequences are non-decreasing.
     * @tc.expected      Both sampled sequences are monotonic and end at twenty-four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityCounterMonotonicity', 0, () => {
      logStep('longTermStabilityCounterMonotonicity', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 505);
      const sends: number[] = [];
      const replies: number[] = [];
      for (let round = 0; round < 12; round++) {
        sendBurst(client, 2);
        const metrics: ClientMetrics = ClientMetrics.from(client);
        sends.push(metrics.sends);
        replies.push(metrics.replies);
      }
      let monotonic: boolean = true;
      for (let index = 1; index < sends.length; index++) {
        if (sends[index] < sends[index - 1] || replies[index] < replies[index - 1]) {
          monotonic = false;
        }
      }
      expect(monotonic).assertTrue();
      expect(sends[0]).assertEqual(2);
      expect(sends[11]).assertEqual(24);
      expect(replies[11]).assertEqual(24);
      expect(replies[5]).assertEqual(12);
      expect(sends.length).assertEqual(12);
      expect(replies.length).assertEqual(12);
      expect(sends[7]).assertEqual(16);
    });

    /**
     * @tc.name          longTermStabilityIdenticalRoundsFingerprint
     * @tc.desc          Identical rounds produce identical event fingerprints within a long run.
     * @tc.precondition  A connected client driven by repeated uniform rounds.
     * @tc.steps         1. Run six rounds of three sends.
     *                   2. Snapshot the fingerprint after rounds two and five.
     *                   3. Compare the delta against the expected round signature.
     * @tc.expected      Fingerprints are stable and change only when new events are appended.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityIdenticalRoundsFingerprint', 0, () => {
      logStep('longTermStabilityIdenticalRoundsFingerprint', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 506);
      const prints: number[] = [];
      for (let round = 0; round < 6; round++) {
        sendBurst(client, 3);
        prints.push(client.events.fingerprint());
      }
      expect(prints.length).assertEqual(6);
      expect(prints[0] > 0).assertTrue();
      expect(prints[1] === prints[0]).assertFalse();
      expect(prints[5] === prints[4]).assertFalse();
      expect(client.events.size()).assertEqual(21);
      expect(eventCount(client, 'send-ok')).assertEqual(18);
      expect(client.events.trace().length > 0).assertTrue();
      expect(prints[5] > 0).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityReplyPayloadConstant
     * @tc.desc          The reply payload stays constant across eighty consecutive requests.
     * @tc.precondition  A connected client with a stub configured for the default reply.
     * @tc.steps         1. Send eighty requests.
     *                   2. Collect the reply text of every result.
     *                   3. Compare each text with the expected payload.
     * @tc.expected      Every reply equals the configured payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityReplyPayloadConstant', 0, () => {
      logStep('longTermStabilityReplyPayloadConstant', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 507);
      const results: RequestResultModel[] = sendBurst(client, 80);
      let consistent: boolean = true;
      for (let index = 0; index < results.length; index++) {
        if (results[index].replyText !== REPLY_PAYLOAD) {
          consistent = false;
        }
      }
      expect(consistent).assertTrue();
      expect(results.length).assertEqual(80);
      expect(results[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(results[79].replyText).assertEqual(REPLY_PAYLOAD);
      expect(results[40].isSuccess()).assertTrue();
      expect(ClientMetrics.from(client).replies).assertEqual(80);
      expect(client.toasts.length).assertEqual(81);
    });

    /**
     * @tc.name          longTermStabilityResetCyclesPreserveBaseline
     * @tc.desc          Five reset cycles always return the client to the same empty baseline.
     * @tc.precondition  An empty client and a five-cycle plan.
     * @tc.steps         1. In each cycle connect, send three times and reset.
     *                   2. Capture the snapshot after every reset.
     *                   3. Compare all snapshots with a fresh client.
     * @tc.expected      Every post-reset snapshot equals the fresh baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityResetCyclesPreserveBaseline', 0, () => {
      logStep('longTermStabilityResetCyclesPreserveBaseline', 'begin');
      const client: ConnectionModel = newClient();
      const fresh: ConnectionModel = newClient();
      const freshSnapshot: ClientSnapshot = new ClientSnapshot(fresh);
      let allMatch: boolean = true;
      for (let cycle = 0; cycle < 5; cycle++) {
        openConnection(client, 520 + cycle);
        sendBurst(client, 3);
        client.reset();
        if (!new ClientSnapshot(client).sameAs(freshSnapshot)) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connectCalls).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilityProxyRequestLogGrows
     * @tc.desc          The proxy request log accumulates every dispatched code over a long session.
     * @tc.precondition  A connected client that is never disconnected.
     * @tc.steps         1. Send one hundred and twenty requests.
     *                   2. Inspect the proxy request list length and endpoints.
     *                   3. Verify the stub handled the same count.
     * @tc.expected      The request list holds one hundred and twenty known codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityProxyRequestLogGrows', 0, () => {
      logStep('longTermStabilityProxyRequestLogGrows', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 508);
      const results: RequestResultModel[] = sendBurst(client, 120);
      expect(successCount(results)).assertEqual(120);
      expect(proxy.requests.length).assertEqual(120);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.requests[119]).assertEqual(1);
      expect(proxy.stub.handledCodes.length).assertEqual(120);
      expect(proxy.stub.receivedTexts.length).assertEqual(120);
      expect(proxy.sendCalls).assertEqual(120);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          longTermStabilityPeriodicInjectedFailures
     * @tc.desc          Injecting one failure every ten rounds keeps the ratio near nine tenths.
     * @tc.precondition  A connected client and a ten-round plan.
     * @tc.steps         1. Arm the proxy once per round before sending ten requests.
     *                   2. Accumulate successes and failures.
     *                   3. Compare the final aggregate ratio.
     * @tc.expected      Ninety successes and ten failures produce a ratio of nine tenths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityPeriodicInjectedFailures', 0, () => {
      logStep('longTermStabilityPeriodicInjectedFailures', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 509);
      let ok: number = 0;
      let failed: number = 0;
      for (let round = 0; round < 10; round++) {
        proxy.failNextSend = ERROR_SEND;
        const results: RequestResultModel[] = sendBurst(client, 10);
        ok = ok + successCount(results);
        failed = failed + failCount(results);
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(ok).assertEqual(90);
      expect(failed).assertEqual(10);
      expect(metrics.sends).assertEqual(100);
      expect(metrics.replies).assertEqual(90);
      expect(metrics.failures).assertEqual(10);
      expect(metrics.successRatio()).assertEqual(0.9);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(10);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(90);
    });

    /**
     * @tc.name          longTermStabilityFiftyRoundRatio
     * @tc.desc          Fifty rounds with alternating success and failure rounds land on half ratio.
     * @tc.precondition  A connected client and a fifty-round plan of one request.
     * @tc.steps         1. Arm a failure on every odd round.
     *                   2. Send one request per round.
     *                   3. Compute the aggregate ratio.
     * @tc.expected      Twenty-five replies out of fifty attempts yield a ratio of one half.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityFiftyRoundRatio', 0, () => {
      logStep('longTermStabilityFiftyRoundRatio', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 510);
      let successes: number = 0;
      for (let round = 0; round < 50; round++) {
        if (round % 2 === 1) {
          proxy.failNextSend = ERROR_SEND;
        }
        const result: RequestResultModel = client.sendString('round-' + String(round));
        if (result.isSuccess()) {
          successes = successes + 1;
        }
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(successes).assertEqual(25);
      expect(metrics.sends).assertEqual(50);
      expect(metrics.replies).assertEqual(25);
      expect(metrics.failures).assertEqual(25);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.toasts.length).assertEqual(51);
      expect(client.logs.size() <= 128).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityDisconnectReconnectRounds
     * @tc.desc          Eight full sessions of five sends each keep the reply total exact.
     * @tc.precondition  An empty client and an eight-session plan.
     * @tc.steps         1. Open a session, send five requests and close it.
     *                   2. Repeat the cycle eight times.
     *                   3. Reconcile replies, toasts and lifecycle events.
     * @tc.expected      Forty replies appear with sixteen lifecycle toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityDisconnectReconnectRounds', 0, () => {
      logStep('longTermStabilityDisconnectReconnectRounds', 'begin');
      const client: ConnectionModel = newClient();
      for (let cycle = 0; cycle < 8; cycle++) {
        openConnection(client, 530 + cycle);
        sendBurst(client, 5);
        client.onDisconnect();
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.replies).assertEqual(40);
      expect(metrics.connects).assertEqual(8);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(8);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(8);
      expect(client.toasts.length).assertEqual(56);
      expect(eventCount(client, 'disconnected')).assertEqual(8);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          longTermStabilityStalledPhaseWithoutProxy
     * @tc.desc          A stalled phase of twenty sends without a proxy records only failures.
     * @tc.precondition  An empty client that is never connected.
     * @tc.steps         1. Send twenty requests.
     *                   2. Count invalid-proxy codes.
     *                   3. Compare metrics and error logs.
     * @tc.expected      All twenty attempts fail and the ratio remains zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityStalledPhaseWithoutProxy', 0, () => {
      logStep('longTermStabilityStalledPhaseWithoutProxy', 'begin');
      const client: ConnectionModel = newClient();
      const results: RequestResultModel[] = sendBurst(client, 20);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(codeCount(results, ERROR_PROXY_INVALID)).assertEqual(20);
      expect(successCount(results)).assertEqual(0);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(20);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(20);
      expect(client.events.size()).assertEqual(20);
    });

    /**
     * @tc.name          longTermStabilityDeathAccumulatesPerSession
     * @tc.desc          One death per session accumulates six times on the shared recipient.
     * @tc.precondition  An empty client and six sessions with an early death.
     * @tc.steps         1. Open a session and kill its proxy.
     *                   2. Close the session and repeat six times.
     *                   3. Compare the death count and session count.
     * @tc.expected      Six deaths are recorded and no proxy remains bound.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityDeathAccumulatesPerSession', 0, () => {
      logStep('longTermStabilityDeathAccumulatesPerSession', 'begin');
      const client: ConnectionModel = newClient();
      for (let cycle = 0; cycle < 6; cycle++) {
        const proxy: RemoteProxyModel = openConnection(client, 540 + cycle);
        proxy.notifyDeath();
        client.onDisconnect();
      }
      expect(client.deathRecipient.diedCount).assertEqual(6);
      expect(client.proxy).assertUndefined();
      expect(eventCount(client, 'connected')).assertEqual(6);
      expect(eventCount(client, 'disconnected')).assertEqual(6);
      expect(client.toasts.length).assertEqual(12);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          longTermStabilityWarningFreeRun
     * @tc.desc          A healthy long run emits no warnings and no error-level lines.
     * @tc.precondition  A connected client and one hundred and fifty sends.
     * @tc.steps         1. Dispatch the burst.
     *                   2. Count log levels.
     *                   3. Confirm info lines dominate and warnings are absent.
     * @tc.expected      The warning and error counts stay at zero for the whole run.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityWarningFreeRun', 0, () => {
      logStep('longTermStabilityWarningFreeRun', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 550);
      sendBurst(client, 150);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.countLevel('INFO')).assertEqual(128);
      expect(client.logs.size()).assertEqual(128);
      expect(eventCount(client, 'send-ok')).assertEqual(150);
      expect(client.toasts.length).assertEqual(151);
      expect(ClientMetrics.from(client).failures).assertEqual(0);
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityLogTailKeepsLatestReply
     * @tc.desc          After trimming, the newest log line still records the last reply.
     * @tc.precondition  A connected client that already overflowed its log buffer.
     * @tc.steps         1. Send two hundred requests.
     *                   2. Read the last buffered line.
     *                   3. Confirm the first entry was trimmed away.
     * @tc.expected      The tail holds the latest reply and the oldest connect line is gone.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityLogTailKeepsLatestReply', 0, () => {
      logStep('longTermStabilityLogTailKeepsLatestReply', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 560);
      sendBurst(client, 200);
      const tail: string = client.logs.lines[client.logs.lines.length - 1];
      expect(tail).assertEqual('INFO reply ' + REPLY_PAYLOAD);
      expect(client.logs.contains('onConnect')).assertFalse();
      expect(client.logs.contains('registerDeathRecipient success')).assertFalse();
      expect(client.logs.lines.length).assertEqual(128);
      expect(client.logs.levels[127]).assertEqual('INFO');
      expect(client.logs.size()).assertEqual(128);
      expect(client.logs.trace().indexOf('INFO reply') >= 0).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityPerRoundToastDelta
     * @tc.desc          Each round appends exactly two toasts when two requests are sent.
     * @tc.precondition  A connected client and a ten-round plan of two sends.
     * @tc.steps         1. Sample the toast count before and after each round.
     *                   2. Compute the per-round delta.
     *                   3. Confirm every delta equals two.
     * @tc.expected      All ten deltas equal two and the total reaches the baseline plus twenty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityPerRoundToastDelta', 0, () => {
      logStep('longTermStabilityPerRoundToastDelta', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 570);
      const deltas: number[] = [];
      for (let round = 0; round < 10; round++) {
        const before: number = client.toasts.length;
        sendBurst(client, 2);
        deltas.push(client.toasts.length - before);
      }
      let uniform: boolean = true;
      for (let index = 0; index < deltas.length; index++) {
        if (deltas[index] !== 2) {
          uniform = false;
        }
      }
      expect(uniform).assertTrue();
      expect(deltas.length).assertEqual(10);
      expect(deltas[0]).assertEqual(2);
      expect(deltas[9]).assertEqual(2);
      expect(client.toasts.length).assertEqual(21);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(20);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          longTermStabilityIdleRoundChangesNothing
     * @tc.desc          An idle round with no requests leaves every observable counter unchanged.
     * @tc.precondition  A connected client that has already sent once.
     * @tc.steps         1. Capture events, toasts and sends.
     *                   2. Skip the send phase for one round.
     *                   3. Compare the captured values.
     * @tc.expected      Nothing changes during the idle round.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityIdleRoundChangesNothing', 0, () => {
      logStep('longTermStabilityIdleRoundChangesNothing', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 580);
      sendBurst(client, 1);
      const eventsBefore: number = client.events.size();
      const toastsBefore: number = client.toasts.length;
      const sendsBefore: number = ClientMetrics.from(client).sends;
      const logsBefore: number = client.logs.size();
      expect(eventsBefore).assertEqual(4);
      expect(toastsBefore).assertEqual(2);
      expect(sendsBefore).assertEqual(1);
      expect(client.events.size()).assertEqual(eventsBefore);
      expect(client.toasts.length).assertEqual(toastsBefore);
      expect(ClientMetrics.from(client).sends).assertEqual(sendsBefore);
      expect(client.logs.size()).assertEqual(logsBefore);
    });

    /**
     * @tc.name          longTermStabilityBurstSplitAcrossRounds
     * @tc.desc          A hundred sends split into five rounds produce a cumulative linear ladder.
     * @tc.precondition  A connected client and a five-round plan of twenty sends.
     * @tc.steps         1. Run twenty sends per round.
     *                   2. Record the cumulative reply count after each round.
     *                   3. Compare against the expected ladder.
     * @tc.expected      The ladder reads twenty, forty, sixty, eighty and one hundred.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityBurstSplitAcrossRounds', 0, () => {
      logStep('longTermStabilityBurstSplitAcrossRounds', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 590);
      const ladder: number[] = [];
      for (let round = 0; round < 5; round++) {
        const results: RequestResultModel[] = sendBurst(client, 20);
        expect(successCount(results)).assertEqual(20);
        ladder.push(ClientMetrics.from(client).replies);
      }
      expect(ladder.join(',')).assertEqual('20,40,60,80,100');
      expect(ladder[0]).assertEqual(20);
      expect(ladder[2]).assertEqual(60);
      expect(ladder[4]).assertEqual(100);
      expect(proxy.stub.receivedTexts.length).assertEqual(100);
      expect(proxy.sendCalls).assertEqual(100);
      expect(client.toasts.length).assertEqual(101);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityConnectIdSequence
     * @tc.desc          Each cycle records its own connect id and resets it on close.
     * @tc.precondition  An empty client and a six-cycle plan.
     * @tc.steps         1. In each cycle connect with an increasing id.
     *                   2. Record the id while connected.
     *                   3. Close and confirm the reset.
     * @tc.expected      The recorded sequence ascends and the final id is the initial sentinel.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityConnectIdSequence', 0, () => {
      logStep('longTermStabilityConnectIdSequence', 'begin');
      const client: ConnectionModel = newClient();
      const observed: number[] = [];
      for (let cycle = 0; cycle < 6; cycle++) {
        openConnection(client, 600 + cycle);
        observed.push(client.connectId);
        expect(client.state).assertEqual(STATE_CONNECTED);
        client.onDisconnect();
        expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      }
      expect(observed.length).assertEqual(6);
      expect(observed[0]).assertEqual(600);
      expect(observed[5]).assertEqual(605);
      expect(observed[3]).assertEqual(603);
      expect(client.connectCalls).assertEqual(6);
      expect(client.toasts.length).assertEqual(12);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          longTermStabilityPayloadRotation
     * @tc.desc          Rotating payloads per round reach the stub in the exact generated order.
     * @tc.precondition  A connected client and an eight-round payload plan.
     * @tc.steps         1. Build a payload for each round.
     *                   2. Send it and record the expected text.
     *                   3. Compare the stub log with the expected list.
     * @tc.expected      The stub receives all eight payloads in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityPayloadRotation', 0, () => {
      logStep('longTermStabilityPayloadRotation', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 610);
      const expected: string[] = [];
      for (let round = 0; round < 8; round++) {
        const payload: string = 'payload-' + String(round);
        expected.push(payload);
        const result: RequestResultModel = client.sendString(payload);
        expect(result.isSuccess()).assertTrue();
      }
      expect(proxy.stub.receivedTexts.length).assertEqual(8);
      expect(proxy.stub.receivedTexts[0]).assertEqual('payload-0');
      expect(proxy.stub.receivedTexts[7]).assertEqual('payload-7');
      expect(proxy.stub.receivedTexts.join('|')).assertEqual(expected.join('|'));
      expect(proxy.stub.requestCount()).assertEqual(8);
      expect(eventCount(client, 'send-ok')).assertEqual(8);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilitySnapshotAfterFiftyRounds
     * @tc.desc          A snapshot taken after fifty tidy rounds matches the expected description.
     * @tc.precondition  A connected client and a fifty-round plan of two sends.
     * @tc.steps         1. Run fifty rounds.
     *                   2. Capture the final snapshot.
     *                   3. Compare each field and the description.
     * @tc.expected      The description reads connected, id 620, proxy present and 101 toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilitySnapshotAfterFiftyRounds', 0, () => {
      logStep('longTermStabilitySnapshotAfterFiftyRounds', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 620);
      for (let round = 0; round < 50; round++) {
        sendBurst(client, 2);
      }
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(620);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(101);
      expect(snapshot.describe()).assertEqual('connected/620/true/true/101');
      expect(ClientMetrics.from(client).replies).assertEqual(100);
    });

    /**
     * @tc.name          longTermStabilityFailureStreakRecovery
     * @tc.desc          Three consecutive failures are followed by clean recovery in the same session.
     * @tc.precondition  A connected client with a one-shot failure injector.
     * @tc.steps         1. Inject a failure and send three times.
     *                   2. Send three more without injection.
     *                   3. Compare the streak and the recovered successes.
     * @tc.expected      The first streak fails three times and the second streak succeeds three times.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityFailureStreakRecovery', 0, () => {
      logStep('longTermStabilityFailureStreakRecovery', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 630);
      let streakFailures: number = 0;
      for (let attempt = 0; attempt < 3; attempt++) {
        proxy.failNextSend = ERROR_SEND;
        const result: RequestResultModel = client.sendString('streak');
        if (!result.isSuccess()) {
          streakFailures = streakFailures + 1;
        }
      }
      const recovered: RequestResultModel[] = sendBurst(client, 3);
      expect(streakFailures).assertEqual(3);
      expect(successCount(recovered)).assertEqual(3);
      expect(ClientMetrics.from(client).sends).assertEqual(6);
      expect(ClientMetrics.from(client).replies).assertEqual(3);
      expect(ClientMetrics.from(client).failures).assertEqual(3);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(3);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(3);
      expect(proxy.sendCalls).assertEqual(6);
    });

    /**
     * @tc.name          longTermStabilityLogLevelMix
     * @tc.desc          A mixed run records info lines for successes and error lines for failures.
     * @tc.precondition  A connected client and ten planned failures among thirty sends.
     * @tc.steps         1. Send thirty requests with ten armed failures.
     *                   2. Count info and error lines.
     *                   3. Confirm the level totals sum to the buffer size.
     * @tc.expected      Info and error counts each reconcile with the buffer size and no warning appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityLogLevelMix', 0, () => {
      logStep('longTermStabilityLogLevelMix', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 640);
      for (let index = 0; index < 30; index++) {
        if (index % 3 === 0) {
          proxy.failNextSend = ERROR_SEND;
        }
        client.sendString('mix-' + String(index));
      }
      const info: number = client.logs.countLevel('INFO');
      const errors: number = client.logs.countLevel('ERROR');
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(info + errors).assertEqual(client.logs.size());
      expect(client.logs.size()).assertEqual(32);
      expect(errors).assertEqual(10);
      expect(info).assertEqual(22);
      expect(ClientMetrics.from(client).failures).assertEqual(10);
      expect(ClientMetrics.from(client).replies).assertEqual(20);
    });

    /**
     * @tc.name          longTermStabilityModeledLatencyLadder
     * @tc.desc          The deterministic latency model grows linearly with the request count.
     * @tc.precondition  A pure latency model with base cost ten.
     * @tc.steps         1. Compute totals for one, ten and one hundred requests.
     *                   2. Compare the totals with the closed-form expectation.
     *                   3. Verify the per-request values stay inside the jitter band.
     * @tc.expected      Totals match the closed form and every sample lies in the expected band.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityModeledLatencyLadder', 0, () => {
      logStep('longTermStabilityModeledLatencyLadder', 'begin');
      const one: number = modeledTotalLatency(1, 10);
      const ten: number = modeledTotalLatency(10, 10);
      const hundred: number = modeledTotalLatency(100, 10);
      expect(one).assertEqual(10);
      expect(ten).assertEqual(124);
      expect(hundred).assertEqual(1295);
      expect(hundred > ten).assertTrue();
      expect(modeledLatency(0, 10)).assertEqual(10);
      expect(modeledLatency(6, 10)).assertEqual(16);
      expect(modeledLatency(3, 10)).assertEqual(13);
      expect(modeledLatency(4, 10) <= 16).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityAverageThroughput
     * @tc.desc          Average replies per round stays exact across a forty-round sample.
     * @tc.precondition  A connected client and a uniform round plan.
     * @tc.steps         1. Run forty rounds of five sends.
     *                   2. Compute the average from the accumulated replies.
     *                   3. Compare with the metrics view.
     * @tc.expected      The average is five and the total is two hundred.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityAverageThroughput', 0, () => {
      logStep('longTermStabilityAverageThroughput', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 650);
      const rounds: number = 40;
      for (let round = 0; round < rounds; round++) {
        sendBurst(client, 5);
      }
      const replies: number = ClientMetrics.from(client).replies;
      const average: number = replies / rounds;
      expect(replies).assertEqual(200);
      expect(average).assertEqual(5);
      expect(ClientMetrics.from(client).sends).assertEqual(200);
      expect(client.toasts.length).assertEqual(201);
      expect(client.logs.size()).assertEqual(128);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(eventCount(client, 'send-ok')).assertEqual(200);
    });

    /**
     * @tc.name          longTermStabilityReplayFingerprint
     * @tc.desc          Replaying the same twelve-step script twice yields equal fingerprints.
     * @tc.precondition  Two clients and a deterministic script.
     * @tc.steps         1. Run the script on the first client.
     *                   2. Reset and run it on the second.
     *                   3. Compare fingerprints and traces.
     * @tc.expected      Both runs produce the same fingerprint and trace length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityReplayFingerprint', 0, () => {
      logStep('longTermStabilityReplayFingerprint', 'begin');
      const first: ConnectionModel = newClient();
      openConnection(first, 660);
      sendBurst(first, 5);
      first.onDisconnect();
      first.onFailed(ERROR_CONNECT);
      const firstPrint: number = first.events.fingerprint();
      const second: ConnectionModel = newClient();
      openConnection(second, 661);
      sendBurst(second, 5);
      second.onDisconnect();
      second.onFailed(ERROR_CONNECT);
      const secondPrint: number = second.events.fingerprint();
      expect(firstPrint).assertEqual(secondPrint);
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.size()).assertEqual(second.events.size());
      expect(firstPrint > 0).assertTrue();
      expect(first.toasts.length).assertEqual(second.toasts.length);
      expect(first.state).assertEqual(second.state);
    });

    /**
     * @tc.name          longTermStabilityFiftyDisconnectCallbacks
     * @tc.desc          Fifty disconnect callbacks keep the client stable and disconnected.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Deliver fifty disconnect callbacks.
     *                   2. Count toasts and events.
     *                   3. Confirm the binding stayed cleared.
     * @tc.expected      Fifty disconnect toasts appear and no proxy is ever rebound.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityFiftyDisconnectCallbacks', 0, () => {
      logStep('longTermStabilityFiftyDisconnectCallbacks', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 670);
      for (let index = 0; index < 50; index++) {
        client.onDisconnect();
      }
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(50);
      expect(eventCount(client, 'disconnected')).assertEqual(50);
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(51);
      expect(client.logs.size() <= 128).assertTrue();
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityLogClearMidRun
     * @tc.desc          Clearing the log mid-run frees capacity without touching events or toasts.
     * @tc.precondition  A connected client that has already filled its log buffer.
     * @tc.steps         1. Send two hundred requests.
     *                   2. Clear the log buffer.
     *                   3. Send ten more and compare event and toast totals.
     * @tc.expected      The log restarts near empty while event and toast history is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityLogClearMidRun', 0, () => {
      logStep('longTermStabilityLogClearMidRun', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 680);
      sendBurst(client, 200);
      const eventsBefore: number = client.events.size();
      const toastsBefore: number = client.toasts.length;
      client.logs.clear();
      expect(client.logs.size()).assertEqual(0);
      sendBurst(client, 10);
      expect(client.logs.size()).assertEqual(10);
      expect(client.logs.countLevel('INFO')).assertEqual(10);
      expect(client.events.size()).assertEqual(eventsBefore + 10);
      expect(client.toasts.length).assertEqual(toastsBefore + 10);
      expect(ClientMetrics.from(client).replies).assertEqual(210);
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityFailureStreakResetsOnReconnect
     * @tc.desc          A failure streak does not survive a successful reconnect.
     * @tc.precondition  An empty client and a two-phase session.
     * @tc.steps         1. Open a session and inject two failures.
     *                   2. Close and reconnect.
     *                   3. Send three requests and confirm success.
     * @tc.expected      The reopened session answers every request and metrics count the old failures once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityFailureStreakResetsOnReconnect', 0, () => {
      logStep('longTermStabilityFailureStreakResetsOnReconnect', 'begin');
      const client: ConnectionModel = newClient();
      const firstProxy: RemoteProxyModel = openConnection(client, 690);
      firstProxy.failNextSend = ERROR_SEND;
      client.sendString('bad-one');
      firstProxy.failNextSend = ERROR_SEND;
      client.sendString('bad-two');
      client.onDisconnect();
      const secondProxy: RemoteProxyModel = openConnection(client, 691);
      const recovered: RequestResultModel[] = sendBurst(client, 3);
      expect(successCount(recovered)).assertEqual(3);
      expect(secondProxy.stub.receivedTexts.length).assertEqual(3);
      expect(firstProxy.stub.receivedTexts.length).assertEqual(0);
      expect(ClientMetrics.from(client).failures).assertEqual(2);
      expect(ClientMetrics.from(client).replies).assertEqual(3);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityRepeatedDeathNotifications
     * @tc.desc          Five death notifications on one recipient accumulate five counts.
     * @tc.precondition  A connected client whose proxy is notified repeatedly.
     * @tc.steps         1. Open a session with id 700.
     *                   2. Notify death five times.
     *                   3. Inspect the death count and liveness.
     * @tc.expected      The recipient records five deaths while the proxy stays dead after the first.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityRepeatedDeathNotifications', 0, () => {
      logStep('longTermStabilityRepeatedDeathNotifications', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 700);
      for (let index = 0; index < 5; index++) {
        proxy.notifyDeath();
      }
      expect(client.deathRecipient.diedCount).assertEqual(5);
      expect(proxy.isAlive()).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      const result: RequestResultModel = client.sendString('after-five');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityResetAfterOverflow
     * @tc.desc          Reset after a log overflow restores the full buffer capacity.
     * @tc.precondition  A client whose log buffer is saturated at 128 lines.
     * @tc.steps         1. Send two hundred requests to saturate the buffer.
     *                   2. Reset the client.
     *                   3. Reconnect and send sixty requests.
     * @tc.expected      The new session holds sixty untrimmed log lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityResetAfterOverflow', 0, () => {
      logStep('longTermStabilityResetAfterOverflow', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 710);
      sendBurst(client, 200);
      expect(client.logs.size()).assertEqual(128);
      client.reset();
      expect(client.logs.size()).assertEqual(0);
      openConnection(client, 711);
      sendBurst(client, 60);
      expect(client.logs.size()).assertEqual(62);
      expect(client.logs.size() < 128).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(61);
      expect(ClientMetrics.from(client).replies).assertEqual(60);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          longTermStabilityPeriodStatDescription
     * @tc.desc          Period statistics describe round, outcome and buffer size in a stable format.
     * @tc.precondition  A connected client and a one-round capture.
     * @tc.steps         1. Send two requests.
     *                   2. Capture a period with one success and one failure.
     *                   3. Inspect attempted and describe.
     * @tc.expected      The description joins round, success, failure and log size with colons.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityPeriodStatDescription', 0, () => {
      logStep('longTermStabilityPeriodStatDescription', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 720);
      proxy.failNextSend = ERROR_SEND;
      const results: RequestResultModel[] = sendBurst(client, 2);
      const period: PeriodStat = capturePeriod(client, 4, successCount(results), failCount(results));
      expect(period.round).assertEqual(4);
      expect(period.attempted()).assertEqual(2);
      expect(period.ok).assertEqual(1);
      expect(period.fail).assertEqual(1);
      expect(period.describe()).assertEqual('4:1:1:' + String(client.logs.size()));
      expect(period.logSize).assertEqual(client.logs.size());
      expect(period.toastTotal).assertEqual(3);
    });

    /**
     * @tc.name          longTermStabilityLatencyJitterBand
     * @tc.desc          Every modeled latency sample lies inside the four millisecond jitter band.
     * @tc.precondition  A pure latency model with base cost twenty.
     * @tc.steps         1. Sample one hundred modeled latencies.
     *                   2. Track the minimum and maximum.
     *                   3. Confirm the band boundaries.
     * @tc.expected      All samples fall between twenty and twenty-six inclusive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityLatencyJitterBand', 0, () => {
      logStep('longTermStabilityLatencyJitterBand', 'begin');
      let minimum: number = 1000;
      let maximum: number = 0;
      let sum: number = 0;
      for (let index = 0; index < 100; index++) {
        const sample: number = modeledLatency(index, 20);
        if (sample < minimum) {
          minimum = sample;
        }
        if (sample > maximum) {
          maximum = sample;
        }
        sum = sum + sample;
      }
      expect(minimum).assertEqual(20);
      expect(maximum).assertEqual(26);
      expect(sum).assertEqual(modeledTotalLatency(100, 20));
      expect(minimum >= 20).assertTrue();
      expect(maximum <= 26).assertTrue();
      expect(maximum - minimum).assertEqual(6);
      expect(sum / 100 > 20).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityNoProxyCycleRepeats
     * @tc.desc          Five connect, disconnect and send cycles end in failure without leakage.
     * @tc.precondition  An empty client and a five-cycle plan.
     * @tc.steps         1. Connect, disconnect and send in each cycle.
     *                   2. Count failures and lifecycle toasts.
     *                   3. Confirm no proxy survives.
     * @tc.expected      Five failures appear alongside five connect and five disconnect toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityNoProxyCycleRepeats', 0, () => {
      logStep('longTermStabilityNoProxyCycleRepeats', 'begin');
      const client: ConnectionModel = newClient();
      let failures: number = 0;
      for (let cycle = 0; cycle < 5; cycle++) {
        openConnection(client, 730 + cycle);
        client.onDisconnect();
        const result: RequestResultModel = client.sendString('cycle-' + String(cycle));
        if (result.errCode === ERROR_PROXY_INVALID) {
          failures = failures + 1;
        }
      }
      expect(failures).assertEqual(5);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(5);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(5);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(5);
      expect(client.proxy).assertUndefined();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(15);
      expect(ClientMetrics.from(client).failures).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilityRoundBoundarySnapshot
     * @tc.desc          Round-boundary snapshots differ only in toast count between adjacent rounds.
     * @tc.precondition  A connected client sampled before and after one round.
     * @tc.steps         1. Take a snapshot before the round.
     *                   2. Send three requests and take another snapshot.
     *                   3. Compare the field deltas.
     * @tc.expected      Only the toast count changes and it grows by three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityRoundBoundarySnapshot', 0, () => {
      logStep('longTermStabilityRoundBoundarySnapshot', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 740);
      const before: ClientSnapshot = new ClientSnapshot(client);
      sendBurst(client, 3);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(before.sameAs(after)).assertFalse();
      expect(after.toastCount).assertEqual(before.toastCount + 3);
      expect(after.state).assertEqual(before.state);
      expect(after.connectId).assertEqual(before.connectId);
      expect(after.hasProxy).assertEqual(before.hasProxy);
      expect(after.deathRegistered).assertEqual(before.deathRegistered);
      expect(after.describe()).assertEqual('connected/740/true/true/4');
    });

    /**
     * @tc.name          longTermStabilityToastHistorySurvivesTrim
     * @tc.desc          Log trimming does not truncate the toast history of a long session.
     * @tc.precondition  A connected client after a two-hundred-request burst.
     * @tc.steps         1. Send two hundred requests.
     *                   2. Count success toasts.
     *                   3. Compare with the truncated log size.
     * @tc.expected      All two hundred success toasts survive while the log holds only 128 lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityToastHistorySurvivesTrim', 0, () => {
      logStep('longTermStabilityToastHistorySurvivesTrim', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 750);
      sendBurst(client, 200);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(200);
      expect(client.toasts.length).assertEqual(201);
      expect(client.logs.size()).assertEqual(128);
      expect(client.toasts.length > client.logs.size()).assertTrue();
      expect(client.toasts[200]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityStubCountsMatchReplies
     * @tc.desc          Stub request counts stay equal to the reply count over a long run.
     * @tc.precondition  A connected client with a live stub.
     * @tc.steps         1. Send seventy requests.
     *                   2. Compare stub request count, proxy send calls and replies.
     *                   3. Confirm received text count matches.
     * @tc.expected      All four counters read seventy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityStubCountsMatchReplies', 0, () => {
      logStep('longTermStabilityStubCountsMatchReplies', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 760);
      sendBurst(client, 70);
      expect(proxy.stub.requestCount()).assertEqual(70);
      expect(proxy.sendCalls).assertEqual(70);
      expect(ClientMetrics.from(client).replies).assertEqual(70);
      expect(proxy.stub.receivedTexts.length).assertEqual(70);
      expect(proxy.requests.length).assertEqual(70);
      expect(proxy.stub.handledCodes.length).assertEqual(70);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilityEmptyPayloadRun
     * @tc.desc          Empty payloads are transmitted and echoed without corrupting later sends.
     * @tc.precondition  A connected client with a live stub.
     * @tc.steps         1. Send an empty payload.
     *                   2. Send a normal payload.
     *                   3. Compare stub receipts and reply states.
     * @tc.expected      The stub records an empty string followed by the normal payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityEmptyPayloadRun', 0, () => {
      logStep('longTermStabilityEmptyPayloadRun', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 770);
      const empty: RequestResultModel = client.sendString('');
      const normal: RequestResultModel = client.sendString(REQUEST_PAYLOAD);
      expect(empty.isSuccess()).assertTrue();
      expect(normal.isSuccess()).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('');
      expect(proxy.stub.receivedTexts[1]).assertEqual(REQUEST_PAYLOAD);
      expect(ClientMetrics.from(client).replies).assertEqual(2);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          longTermStabilityVaryingSessionLengths
     * @tc.desc          Sessions of two, four and six sends total twelve replies across three cycles.
     * @tc.precondition  An empty client and a varying session plan.
     * @tc.steps         1. Run sessions with increasing send counts.
     *                   2. Track the per-session reply totals.
     *                   3. Sum the totals.
     * @tc.expected      The session totals are two, four and six for a grand total of twelve.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityVaryingSessionLengths', 0, () => {
      logStep('longTermStabilityVaryingSessionLengths', 'begin');
      const client: ConnectionModel = newClient();
      const totals: number[] = [];
      for (let session = 0; session < 3; session++) {
        openConnection(client, 780 + session);
        const times: number = (session + 1) * 2;
        const results: RequestResultModel[] = sendBurst(client, times);
        totals.push(successCount(results));
        client.onDisconnect();
      }
      expect(totals.length).assertEqual(3);
      expect(totals[0]).assertEqual(2);
      expect(totals[1]).assertEqual(4);
      expect(totals[2]).assertEqual(6);
      expect(totals[0] + totals[1] + totals[2]).assertEqual(12);
      expect(ClientMetrics.from(client).replies).assertEqual(12);
      expect(client.toasts.length).assertEqual(18);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          longTermStabilityMetricsFingerprintLongRun
     * @tc.desc          Metrics fingerprints after a long run are reproducible across clients.
     * @tc.precondition  Two empty clients and a fixed long-run plan.
     * @tc.steps         1. Run twenty sends on each client.
     *                   2. Build metrics on both.
     *                   3. Compare fingerprints and component values.
     * @tc.expected      Both metrics fingerprints match and all components read twenty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityMetricsFingerprintLongRun', 0, () => {
      logStep('longTermStabilityMetricsFingerprintLongRun', 'begin');
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      openConnection(left, 790);
      openConnection(right, 791);
      sendBurst(left, 20);
      sendBurst(right, 20);
      const leftMetrics: ClientMetrics = ClientMetrics.from(left);
      const rightMetrics: ClientMetrics = ClientMetrics.from(right);
      expect(leftMetrics.fingerprint()).assertEqual(rightMetrics.fingerprint());
      expect(leftMetrics.connects).assertEqual(1);
      expect(leftMetrics.sends).assertEqual(20);
      expect(leftMetrics.replies).assertEqual(20);
      expect(leftMetrics.failures).assertEqual(0);
      expect(leftMetrics.successRatio()).assertEqual(1);
      expect(rightMetrics.sends).assertEqual(20);
    });

    /**
     * @tc.name          longTermStabilityWarningsFromDuplicateConnects
     * @tc.desc          Ten refused connect attempts produce ten warnings and no errors.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Attempt ten extra connects.
     *                   2. Count accepted attempts and warnings.
     *                   3. Confirm the session stayed healthy.
     * @tc.expected      No attempt is accepted and each one records one warning line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityWarningsFromDuplicateConnects', 0, () => {
      logStep('longTermStabilityWarningsFromDuplicateConnects', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 800);
      let accepted: number = 0;
      for (let attempt = 0; attempt < 10; attempt++) {
        if (client.connect(801 + attempt)) {
          accepted = accepted + 1;
        }
      }
      const result: RequestResultModel = client.sendString('still-healthy');
      expect(accepted).assertEqual(0);
      expect(client.logs.countLevel('WARN')).assertEqual(10);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.connectId).assertEqual(800);
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(11);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          longTermStabilityCumulativeFailureTracking
     * @tc.desc          Failures accumulate correctly across three separated failure phases.
     * @tc.precondition  A connected client and a three-phase plan.
     * @tc.steps         1. Fail twice, recover, fail three times, recover, fail once.
     *                   2. Send a success between phases.
     *                   3. Sum failures and replies.
     * @tc.expected      Six failures and three replies appear in one session.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityCumulativeFailureTracking', 0, () => {
      logStep('longTermStabilityCumulativeFailureTracking', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 810);
      proxy.failNextSend = ERROR_SEND;
      client.sendString('phase-a1');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('phase-a2');
      client.sendString('recover-a');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('phase-b1');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('phase-b2');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('phase-b3');
      client.sendString('recover-b');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('phase-c1');
      client.sendString('recover-c');
      expect(ClientMetrics.from(client).failures).assertEqual(6);
      expect(ClientMetrics.from(client).replies).assertEqual(3);
      expect(ClientMetrics.from(client).sends).assertEqual(9);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1 / 3);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(6);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(3);
      expect(proxy.stub.receivedTexts.length).assertEqual(3);
    });

    /**
     * @tc.name          longTermStabilitySnapshotResetEquality
     * @tc.desc          A client reset mid-run reports the same snapshot as a fresh instance.
     * @tc.precondition  A client with a saturated log and a long toast history.
     * @tc.steps         1. Build a long history.
     *                   2. Reset the client.
     *                   3. Compare with a fresh client.
     * @tc.expected      The snapshots are identical and both descriptions match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilitySnapshotResetEquality', 0, () => {
      logStep('longTermStabilitySnapshotResetEquality', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 820);
      sendBurst(client, 150);
      client.reset();
      const fresh: ConnectionModel = newClient();
      const resetSnapshot: ClientSnapshot = new ClientSnapshot(client);
      const freshSnapshot: ClientSnapshot = new ClientSnapshot(fresh);
      expect(resetSnapshot.sameAs(freshSnapshot)).assertTrue();
      expect(resetSnapshot.describe()).assertEqual(freshSnapshot.describe());
      expect(resetSnapshot.toastCount).assertEqual(0);
      expect(resetSnapshot.hasProxy).assertFalse();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.logs.size()).assertEqual(0);
      expect(ClientMetrics.from(client).fingerprint()).assertEqual(ClientMetrics.from(fresh).fingerprint());
    });

    /**
     * @tc.name          longTermStabilityLongestSingleSession
     * @tc.desc          A single session of two hundred and fifty sends keeps a consistent state.
     * @tc.precondition  A connected client that never disconnects.
     * @tc.steps         1. Send two hundred and fifty requests.
     *                   2. Inspect counters, state and buffers.
     *                   3. Confirm the session can still serve one more request.
     * @tc.expected      The session stays connected and the final request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('longTermStabilityLongestSingleSession', 0, () => {
      logStep('longTermStabilityLongestSingleSession', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 830);
      sendBurst(client, 250);
      const finalResult: RequestResultModel = client.sendString('final-request');
      expect(finalResult.isSuccess()).assertTrue();
      expect(ClientMetrics.from(client).replies).assertEqual(251);
      expect(proxy.sendCalls).assertEqual(251);
      expect(proxy.stub.receivedTexts.length).assertEqual(251);
      expect(client.logs.size()).assertEqual(128);
      expect(client.toasts.length).assertEqual(252);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          longTermStabilityFinalSummaryInvariants
     * @tc.desc          The final summary of a mixed long run satisfies all counting invariants.
     * @tc.precondition  An empty client and a composite four-phase plan.
     * @tc.steps         1. Run success, failure, recovery and idle phases.
     *                   2. Compute metrics once at the end.
     *                   3. Verify every invariant.
     * @tc.expected      Sends equal replies plus failures and the final state is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('longTermStabilityFinalSummaryInvariants', 0, () => {
      logStep('longTermStabilityFinalSummaryInvariants', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 840);
      sendBurst(client, 30);
      proxy.failNextSend = ERROR_SEND;
      sendBurst(client, 1);
      proxy.failNextSend = ERROR_SEND;
      sendBurst(client, 1);
      sendBurst(client, 20);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(52);
      expect(metrics.replies).assertEqual(50);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(metrics.successRatio() > 0.96).assertTrue();
      expect(client.toasts.length).assertEqual(53);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(eventCount(client, 'send-ok')).assertEqual(50);
    });
  });
}