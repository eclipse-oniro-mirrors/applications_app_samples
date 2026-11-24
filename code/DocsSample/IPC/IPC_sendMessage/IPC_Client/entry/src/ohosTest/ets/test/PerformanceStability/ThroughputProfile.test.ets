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
  ClientMetrics,
  ClientSnapshot,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  STATE_CONNECTED,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  countOf
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

/** One throughput measurement window. */
class ThroughputWindow {
  public round: number;
  public requests: number;
  public replies: number;
  public failures: number;
  public elapsedMs: number;

  constructor(round: number, requests: number, replies: number, failures: number, elapsedMs: number) {
    this.round = round;
    this.requests = requests;
    this.replies = replies;
    this.failures = failures;
    this.elapsedMs = elapsedMs;
  }

  public throughputPerSecond(): number {
    if (this.elapsedMs <= 0) {
      return 0;
    }
    return this.replies * 1000 / this.elapsedMs;
  }

  public successRatio(): number {
    if (this.requests === 0) {
      return 0;
    }
    return this.replies / this.requests;
  }

  public describe(): string {
    return String(this.round) + '/' + String(this.requests) + '/' + String(this.replies) + '/' +
      String(this.failures) + '/' + String(this.elapsedMs);
  }
}

function windowOf(round: number, requests: number, replies: number, elapsedMs: number): ThroughputWindow {
  return new ThroughputWindow(round, requests, replies, requests - replies, elapsedMs);
}

function bucketOf(elapsedMs: number): string {
  if (elapsedMs <= 8) {
    return 'fast';
  }
  if (elapsedMs <= 20) {
    return 'normal';
  }
  return 'slow';
}

function modeledSize(text: string): number {
  return 16 + text.length * 2;
}

function meanOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let total = 0;
  for (let index = 0; index < values.length; index++) {
    total = total + values[index];
  }
  return total / values.length;
}

function sumOf(values: number[]): number {
  let total = 0;
  for (let index = 0; index < values.length; index++) {
    total = total + values[index];
  }
  return total;
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

export default function throughputProfile(): void {
  describe('ThroughputProfile', () => {
    beforeAll(() => {
      logSuite('ThroughputProfile', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ThroughputProfile', 'end');
    });

    /**
     * @tc.name          throughputProfileFirstWindowRate
     * @tc.desc          A window of one hundred replies in two hundred milliseconds yields five hundred per second.
     * @tc.precondition  A synthetic window record.
     * @tc.steps         1. Build the window.
     *                   2. Compute the per-second rate.
     *                   3. Check ratio and description.
     * @tc.expected      The rate is five hundred and the ratio is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfileFirstWindowRate', 0, () => {
      logStep('throughputProfileFirstWindowRate', 'begin');
      const window: ThroughputWindow = windowOf(1, 100, 100, 200);
      expect(window.round).assertEqual(1);
      expect(window.requests).assertEqual(100);
      expect(window.replies).assertEqual(100);
      expect(window.failures).assertEqual(0);
      expect(window.throughputPerSecond()).assertEqual(500);
      expect(window.successRatio()).assertEqual(1);
      expect(window.describe()).assertEqual('1/100/100/0/200');
    });

    /**
     * @tc.name          throughputProfileWindowRatio
     * @tc.desc          A window with partial failures reports the correct success ratio.
     * @tc.precondition  A window of eighty requests and sixty replies.
     * @tc.steps         1. Build the window.
     *                   2. Compare failures and ratio.
     *                   3. Compute the throughput from the reply count.
     * @tc.expected      Failures read twenty, the ratio is three quarters and the rate is exact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfileWindowRatio', 0, () => {
      logStep('throughputProfileWindowRatio', 'begin');
      const window: ThroughputWindow = windowOf(2, 80, 60, 400);
      expect(window.failures).assertEqual(20);
      expect(window.successRatio()).assertEqual(0.75);
      expect(window.throughputPerSecond()).assertEqual(150);
      expect(window.requests - window.failures).assertEqual(window.replies);
      expect(window.describe()).assertEqual('2/80/60/20/400');
      expect(window.throughputPerSecond() > 0).assertTrue();
      expect(window.successRatio() < 1).assertTrue();
    });

    /**
     * @tc.name          throughputProfileZeroRequestWindow
     * @tc.desc          An idle window reports zero rate and zero ratio without dividing by zero.
     * @tc.precondition  A window with no requests.
     * @tc.steps         1. Build the empty window.
     *                   2. Evaluate ratio and rate.
     *                   3. Build a window with requests but zero elapsed time.
     * @tc.expected      Both divisions are guarded and return zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileZeroRequestWindow', 0, () => {
      logStep('throughputProfileZeroRequestWindow', 'begin');
      const empty: ThroughputWindow = windowOf(0, 0, 0, 100);
      const instant: ThroughputWindow = windowOf(1, 5, 5, 0);
      expect(empty.successRatio()).assertEqual(0);
      expect(empty.throughputPerSecond()).assertEqual(0);
      expect(empty.failures).assertEqual(0);
      expect(instant.throughputPerSecond()).assertEqual(0);
      expect(instant.successRatio()).assertEqual(1);
      expect(empty.describe()).assertEqual('0/0/0/0/100');
      expect(instant.describe()).assertEqual('1/5/5/0/0');
    });

    /**
     * @tc.name          throughputProfileLatencyBuckets
     * @tc.desc          Latency samples map to the fast, normal and slow buckets by boundary.
     * @tc.precondition  A pure bucket classifier.
     * @tc.steps         1. Classify boundary samples.
     *                   2. Classify samples inside each band.
     *                   3. Compare with the expected labels.
     * @tc.expected      Samples eight or below are fast, up to twenty normal and the rest slow.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileLatencyBuckets', 0, () => {
      logStep('throughputProfileLatencyBuckets', 'begin');
      expect(bucketOf(1)).assertEqual('fast');
      expect(bucketOf(8)).assertEqual('fast');
      expect(bucketOf(9)).assertEqual('normal');
      expect(bucketOf(20)).assertEqual('normal');
      expect(bucketOf(21)).assertEqual('slow');
      expect(bucketOf(200)).assertEqual('slow');
      expect(bucketOf(7)).assertEqual('fast');
    });

    /**
     * @tc.name          throughputProfileBucketDistribution
     * @tc.desc          A fixed latency series produces a stable bucket distribution.
     * @tc.precondition  A series of twelve modeled samples.
     * @tc.steps         1. Classify every sample.
     *                   2. Count each bucket.
     *                   3. Sum the counts.
     * @tc.expected      The three bucket counts sum to twelve with fast dominating.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileBucketDistribution', 0, () => {
      logStep('throughputProfileBucketDistribution', 'begin');
      const samples: number[] = [3, 5, 5, 12, 9, 25, 4, 7, 18, 30, 2, 11];
      const buckets: string[] = [];
      for (let index = 0; index < samples.length; index++) {
        buckets.push(bucketOf(samples[index]));
      }
      expect(countOf(buckets, 'fast')).assertEqual(6);
      expect(countOf(buckets, 'normal')).assertEqual(4);
      expect(countOf(buckets, 'slow')).assertEqual(2);
      expect(countOf(buckets, 'fast') + countOf(buckets, 'normal') + countOf(buckets, 'slow'))
        .assertEqual(12);
      expect(buckets[0]).assertEqual('fast');
      expect(buckets[9]).assertEqual('slow');
      expect(meanOf(samples) > 8).assertTrue();
    });

    /**
     * @tc.name          throughputProfilePayloadSizeModel
     * @tc.desc          The payload size model charges a fixed header plus two bytes per character.
     * @tc.precondition  A pure size function.
     * @tc.steps         1. Measure the empty payload.
     *                   2. Measure the standard request payload.
     *                   3. Compare both with the expected sizes.
     * @tc.expected      The empty payload is sixteen bytes and the request payload is thirty-eight.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfilePayloadSizeModel', 0, () => {
      logStep('throughputProfilePayloadSizeModel', 'begin');
      expect(modeledSize('')).assertEqual(16);
      expect(modeledSize(REQUEST_PAYLOAD)).assertEqual(38);
      expect(modeledSize(REPLY_PAYLOAD)).assertEqual(34);
      expect(modeledSize('a')).assertEqual(18);
      expect(modeledSize(REQUEST_PAYLOAD) > modeledSize(REPLY_PAYLOAD)).assertTrue();
      expect(modeledSize('') < modeledSize('a')).assertTrue();
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(REPLY_PAYLOAD.length).assertEqual(9);
    });

    /**
     * @tc.name          throughputProfilePayloadScaling
     * @tc.desc          Each additional character adds exactly two bytes to the modeled size.
     * @tc.precondition  A base text of ten characters.
     * @tc.steps         1. Measure the base text.
     *                   2. Extend it five times.
     *                   3. Confirm a constant increment of two.
     * @tc.expected      Every extension adds two bytes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfilePayloadScaling', 0, () => {
      logStep('throughputProfilePayloadScaling', 'begin');
      let text: string = '0123456789';
      const base: number = modeledSize(text);
      const increments: number[] = [];
      for (let index = 0; index < 5; index++) {
        const before: number = modeledSize(text);
        text = text + 'x';
        increments.push(modeledSize(text) - before);
      }
      expect(base).assertEqual(36);
      expect(increments.length).assertEqual(5);
      expect(increments[0]).assertEqual(2);
      expect(increments[4]).assertEqual(2);
      expect(sumOf(increments)).assertEqual(10);
      expect(modeledSize(text)).assertEqual(46);
      expect(text.length).assertEqual(15);
    });

    /**
     * @tc.name          throughputProfileBurstCountsProxy
     * @tc.desc          A burst of thirty requests is fully visible in proxy and stub counters.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send thirty requests.
     *                   2. Compare send calls, request list and stub counts.
     *                   3. Reconcile with metrics.
     * @tc.expected      Every counter reads thirty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileBurstCountsProxy', 0, () => {
      logStep('throughputProfileBurstCountsProxy', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1101);
      const results: RequestResultModel[] = sendBurst(client, 30);
      expect(successCount(results)).assertEqual(30);
      expect(proxy.sendCalls).assertEqual(30);
      expect(proxy.requests.length).assertEqual(30);
      expect(proxy.stub.requestCount()).assertEqual(30);
      expect(proxy.stub.receivedTexts.length).assertEqual(30);
      expect(ClientMetrics.from(client).sends).assertEqual(30);
      expect(ClientMetrics.from(client).replies).assertEqual(30);
      expect(client.toasts.length).assertEqual(31);
    });

    /**
     * @tc.name          throughputProfileMetricsEquation
     * @tc.desc          Sends always equal replies plus failures in a mixed burst.
     * @tc.precondition  A connected client with three armed failures.
     * @tc.steps         1. Send twenty requests with three failures.
     *                   2. Read the metrics.
     *                   3. Check the equation and ratio.
     * @tc.expected      Twenty sends split into seventeen replies and three failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMetricsEquation', 0, () => {
      logStep('throughputProfileMetricsEquation', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1102);
      for (let index = 0; index < 20; index++) {
        if (index % 7 === 0) {
          proxy.failNextSend = ERROR_SEND;
        }
        client.sendString('profile-' + String(index));
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(20);
      expect(metrics.replies).assertEqual(17);
      expect(metrics.failures).assertEqual(3);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(metrics.successRatio()).assertEqual(0.85);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(3);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(17);
    });

    /**
     * @tc.name          throughputProfileFailureWindow
     * @tc.desc          A failure-heavy window reports a low ratio and a reduced rate.
     * @tc.precondition  Two windows with the same duration and request count.
     * @tc.steps         1. Build a clean and a degraded window.
     *                   2. Compare their rates.
     *                   3. Verify the degraded ratio.
     * @tc.expected      The degraded window reports half the rate of the clean one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFailureWindow', 0, () => {
      logStep('throughputProfileFailureWindow', 'begin');
      const clean: ThroughputWindow = windowOf(3, 50, 50, 250);
      const degraded: ThroughputWindow = windowOf(4, 50, 25, 250);
      expect(clean.throughputPerSecond()).assertEqual(200);
      expect(degraded.throughputPerSecond()).assertEqual(100);
      expect(degraded.successRatio()).assertEqual(0.5);
      expect(degraded.failures).assertEqual(25);
      expect(clean.throughputPerSecond() / degraded.throughputPerSecond()).assertEqual(2);
      expect(degraded.describe()).assertEqual('4/50/25/25/250');
      expect(clean.successRatio() > degraded.successRatio()).assertTrue();
    });

    /**
     * @tc.name          throughputProfileCumulativeTenRounds
     * @tc.desc          Ten rounds of twenty requests produce a linear cumulative reply ladder.
     * @tc.precondition  A connected client and a ten-round plan.
     * @tc.steps         1. Send twenty requests per round.
     *                   2. Record the cumulative replies.
     *                   3. Verify the final total and the step size.
     * @tc.expected      The ladder ends at two hundred with a constant step of twenty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileCumulativeTenRounds', 0, () => {
      logStep('throughputProfileCumulativeTenRounds', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1103);
      const ladder: number[] = [];
      for (let round = 0; round < 10; round++) {
        sendBurst(client, 20);
        ladder.push(ClientMetrics.from(client).replies);
      }
      const steps: number[] = [];
      for (let index = 1; index < ladder.length; index++) {
        steps.push(ladder[index] - ladder[index - 1]);
      }
      expect(ladder[0]).assertEqual(20);
      expect(ladder[9]).assertEqual(200);
      expect(ladder.length).assertEqual(10);
      expect(steps.length).assertEqual(9);
      expect(steps[0]).assertEqual(20);
      expect(steps[8]).assertEqual(20);
      expect(sumOf(steps)).assertEqual(180);
      expect(ClientMetrics.from(client).sends).assertEqual(200);
    });

    /**
     * @tc.name          throughputProfileAverageLatency
     * @tc.desc          The mean of a fixed latency series matches the hand-computed value.
     * @tc.precondition  A six-sample latency series.
     * @tc.steps         1. Compute the mean.
     *                   2. Compare with the manual sum.
     *                   3. Verify the minimum and maximum membership.
     * @tc.expected      The mean equals the expected value and the total is exact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileAverageLatency', 0, () => {
      logStep('throughputProfileAverageLatency', 'begin');
      const samples: number[] = [4, 6, 8, 10, 12, 14];
      const mean: number = meanOf(samples);
      expect(sumOf(samples)).assertEqual(54);
      expect(mean).assertEqual(9);
      expect(meanOf([])).assertEqual(0);
      expect(meanOf([7])).assertEqual(7);
      expect(mean > samples[0]).assertTrue();
      expect(mean < samples[5]).assertTrue();
      expect(bucketOf(mean)).assertEqual('normal');
    });

    /**
     * @tc.name          throughputProfileMonotonicRateRounds
     * @tc.desc          Shrinking elapsed time with a fixed reply count raises the rate monotonically.
     * @tc.precondition  Four synthetic windows.
     * @tc.steps         1. Build windows with decreasing durations.
     *                   2. Compute each rate.
     *                   3. Confirm the sequence increases.
     * @tc.expected      Rates ascend as durations shrink and the last is the largest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMonotonicRateRounds', 0, () => {
      logStep('throughputProfileMonotonicRateRounds', 'begin');
      const windows: ThroughputWindow[] = [
        windowOf(1, 40, 40, 400),
        windowOf(2, 40, 40, 200),
        windowOf(3, 40, 40, 100),
        windowOf(4, 40, 40, 80)
      ];
      const rates: number[] = [];
      for (let index = 0; index < windows.length; index++) {
        rates.push(windows[index].throughputPerSecond());
      }
      let ascending: boolean = true;
      for (let index = 1; index < rates.length; index++) {
        if (rates[index] <= rates[index - 1]) {
          ascending = false;
        }
      }
      expect(ascending).assertTrue();
      expect(rates[0]).assertEqual(100);
      expect(rates[1]).assertEqual(200);
      expect(rates[2]).assertEqual(400);
      expect(rates[3]).assertEqual(500);
      expect(rates[3] / rates[0]).assertEqual(5);
      expect(windows[3].successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          throughputProfileUniformWindows
     * @tc.desc          Five identical windows report identical rates and a mean equal to that rate.
     * @tc.precondition  Five synthetic windows with the same inputs.
     * @tc.steps         1. Build and evaluate five windows.
     *                   2. Collect the rates.
     *                   3. Compare the mean with the single rate.
     * @tc.expected      All rates are equal and the mean matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileUniformWindows', 0, () => {
      logStep('throughputProfileUniformWindows', 'begin');
      const windows: ThroughputWindow[] = [];
      for (let round = 0; round < 5; round++) {
        windows.push(windowOf(round, 25, 25, 125));
      }
      const rates: number[] = [];
      for (let index = 0; index < windows.length; index++) {
        rates.push(windows[index].throughputPerSecond());
      }
      expect(rates[0]).assertEqual(200);
      expect(rates[4]).assertEqual(200);
      expect(meanOf(rates)).assertEqual(200);
      expect(countOf(rates.map((value: number) => String(value)), '200')).assertEqual(5);
      expect(windows[2].describe()).assertEqual('2/25/25/0/125');
      expect(windows[4].round).assertEqual(4);
      expect(windows[0].failures).assertEqual(0);
    });

    /**
     * @tc.name          throughputProfileMaxBurstRate
     * @tc.desc          Two hundred replies in one hundred milliseconds model two thousand per second.
     * @tc.precondition  A synthetic peak window.
     * @tc.steps         1. Build the peak window.
     *                   2. Compute the rate.
     *                   3. Compare with a baseline window.
     * @tc.expected      The rate is two thousand and ten times the baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMaxBurstRate', 0, () => {
      logStep('throughputProfileMaxBurstRate', 'begin');
      const peak: ThroughputWindow = windowOf(9, 200, 200, 100);
      const baseline: ThroughputWindow = windowOf(1, 20, 20, 100);
      expect(peak.throughputPerSecond()).assertEqual(2000);
      expect(baseline.throughputPerSecond()).assertEqual(200);
      expect(peak.throughputPerSecond() / baseline.throughputPerSecond()).assertEqual(10);
      expect(peak.successRatio()).assertEqual(1);
      expect(peak.failures).assertEqual(0);
      expect(peak.requests).assertEqual(200);
      expect(peak.describe()).assertEqual('9/200/200/0/100');
    });

    /**
     * @tc.name          throughputProfileRateAfterReconnect
     * @tc.desc          Reconnecting after a session preserves the aggregate reply count.
     * @tc.precondition  An empty client and two sessions of forty sends.
     * @tc.steps         1. Open the first session and send forty.
     *                   2. Close and reconnect.
     *                   3. Send forty and inspect the aggregate.
     * @tc.expected      The aggregate holds eighty replies with matching toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRateAfterReconnect', 0, () => {
      logStep('throughputProfileRateAfterReconnect', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1104);
      sendBurst(client, 40);
      const firstPhase: number = ClientMetrics.from(client).replies;
      client.onDisconnect();
      openConnection(client, 1105);
      sendBurst(client, 40);
      expect(firstPhase).assertEqual(40);
      expect(ClientMetrics.from(client).replies).assertEqual(80);
      expect(ClientMetrics.from(client).sends).assertEqual(80);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
      expect(client.toasts.length).assertEqual(83);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectCalls).assertEqual(2);
    });

    /**
     * @tc.name          throughputProfileFailureShare
     * @tc.desc          The failure share equals failures divided by attempts for a mixed run.
     * @tc.precondition  A connected client with ten armed failures among forty sends.
     * @tc.steps         1. Send forty requests with periodic failures.
     *                   2. Compute the failure share.
     *                   3. Verify the complementary success share.
     * @tc.expected      The failure share is one quarter and the success share three quarters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFailureShare', 0, () => {
      logStep('throughputProfileFailureShare', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1106);
      for (let index = 0; index < 40; index++) {
        if (index % 4 === 0) {
          proxy.failNextSend = ERROR_SEND;
        }
        client.sendString('share-' + String(index));
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      const failureShare: number = metrics.failures / metrics.sends;
      expect(metrics.sends).assertEqual(40);
      expect(metrics.failures).assertEqual(10);
      expect(metrics.replies).assertEqual(30);
      expect(failureShare).assertEqual(0.25);
      expect(1 - failureShare).assertEqual(0.75);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(10);
    });

    /**
     * @tc.name          throughputProfileDescriptionFormat
     * @tc.desc          Window descriptions join all five fields with slashes.
     * @tc.precondition  A window with distinct field values.
     * @tc.steps         1. Build the window.
     *                   2. Split the description.
     *                   3. Compare each segment.
     * @tc.expected      The description has five segments matching the fields.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileDescriptionFormat', 0, () => {
      logStep('throughputProfileDescriptionFormat', 'begin');
      const window: ThroughputWindow = windowOf(7, 90, 81, 300);
      const segments: string[] = window.describe().split('/');
      expect(segments.length).assertEqual(5);
      expect(segments[0]).assertEqual('7');
      expect(segments[1]).assertEqual('90');
      expect(segments[2]).assertEqual('81');
      expect(segments[3]).assertEqual('9');
      expect(segments[4]).assertEqual('300');
      expect(window.failures).assertEqual(9);
      expect(window.describe()).assertEqual('7/90/81/9/300');
    });

    /**
     * @tc.name          throughputProfileSuccessPercentBoundaries
     * @tc.desc          Success ratios at the boundary windows are computed without rounding error.
     * @tc.precondition  Four synthetic windows with exact fractions.
     * @tc.steps         1. Build windows at full, half, quarter and zero success.
     *                   2. Compare each ratio.
     *                   3. Verify the complement.
     * @tc.expected      The ratios are one, one half, one quarter and zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileSuccessPercentBoundaries', 0, () => {
      logStep('throughputProfileSuccessPercentBoundaries', 'begin');
      const full: ThroughputWindow = windowOf(1, 16, 16, 80);
      const half: ThroughputWindow = windowOf(2, 16, 8, 80);
      const quarter: ThroughputWindow = windowOf(3, 16, 4, 80);
      const none: ThroughputWindow = windowOf(4, 16, 0, 80);
      expect(full.successRatio()).assertEqual(1);
      expect(half.successRatio()).assertEqual(0.5);
      expect(quarter.successRatio()).assertEqual(0.25);
      expect(none.successRatio()).assertEqual(0);
      expect(none.failures).assertEqual(16);
      expect(half.throughputPerSecond()).assertEqual(100);
      expect(full.throughputPerSecond()).assertEqual(200);
    });

    /**
     * @tc.name          throughputProfileReplySizeConstant
     * @tc.desc          The reply size stays constant for every result in a burst.
     * @tc.precondition  A connected client with sixty sends.
     * @tc.steps         1. Send sixty requests.
     *                   2. Compare every reply text with the payload.
     *                   3. Confirm the modeled size is uniform.
     * @tc.expected      All replies read the same payload and share one modeled size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileReplySizeConstant', 0, () => {
      logStep('throughputProfileReplySizeConstant', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1107);
      const results: RequestResultModel[] = sendBurst(client, 60);
      let uniform: boolean = true;
      for (let index = 0; index < results.length; index++) {
        if (results[index].replyText !== REPLY_PAYLOAD) {
          uniform = false;
        }
      }
      expect(uniform).assertTrue();
      expect(modeledSize(results[0].replyText)).assertEqual(34);
      expect(modeledSize(results[59].replyText)).assertEqual(34);
      expect(results.length).assertEqual(60);
      expect(ClientMetrics.from(client).replies).assertEqual(60);
      expect(client.toasts.length).assertEqual(61);
      expect(client.logs.size()).assertEqual(62);
    });

    /**
     * @tc.name          throughputProfileBurstOfHundred
     * @tc.desc          One hundred sends map to a four hundred per second window.
     * @tc.precondition  A connected client and a synthetic window.
     * @tc.steps         1. Send one hundred requests.
     *                   2. Build a matching window of two hundred and fifty milliseconds.
     *                   3. Compare the window with the client metrics.
     * @tc.expected      The window reports four hundred per second and one hundred replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileBurstOfHundred', 0, () => {
      logStep('throughputProfileBurstOfHundred', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1108);
      sendBurst(client, 100);
      const window: ThroughputWindow = windowOf(5, 100, ClientMetrics.from(client).replies, 250);
      expect(window.replies).assertEqual(100);
      expect(window.failures).assertEqual(0);
      expect(window.throughputPerSecond()).assertEqual(400);
      expect(window.successRatio()).assertEqual(1);
      expect(window.requests).assertEqual(ClientMetrics.from(client).sends);
      expect(window.describe()).assertEqual('5/100/100/0/250');
      expect(window.elapsedMs > 0).assertTrue();
    });

    /**
     * @tc.name          throughputProfileMixedPayloadTotal
     * @tc.desc          The total modeled payload size matches the sum of per-request sizes.
     * @tc.precondition  A connected client and four distinct payloads.
     * @tc.steps         1. Send four payloads of different lengths.
     *                   2. Sum their modeled sizes.
     *                   3. Verify against the stub receipts.
     * @tc.expected      The total equals the sum computed from the received texts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileMixedPayloadTotal', 0, () => {
      logStep('throughputProfileMixedPayloadTotal', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1109);
      const payloads: string[] = ['a', 'bb', 'ccc', 'dddd'];
      let expected: number = 0;
      for (let index = 0; index < payloads.length; index++) {
        expected = expected + modeledSize(payloads[index]);
        client.sendString(payloads[index]);
      }
      let actual: number = 0;
      for (let index = 0; index < proxy.stub.receivedTexts.length; index++) {
        actual = actual + modeledSize(proxy.stub.receivedTexts[index]);
      }
      expect(proxy.stub.receivedTexts.length).assertEqual(4);
      expect(expected).assertEqual(84);
      expect(actual).assertEqual(expected);
      expect(modeledSize('a')).assertEqual(18);
      expect(modeledSize('dddd')).assertEqual(24);
      expect(ClientMetrics.from(client).replies).assertEqual(4);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          throughputProfileRecoveryWindow
     * @tc.desc          A degraded window is followed by a recovered window with a higher rate.
     * @tc.precondition  A connected client and one armed failure phase.
     * @tc.steps         1. Send fifteen requests with five failures.
     *                   2. Send fifteen clean requests.
     *                   3. Compare the two modeled windows.
     * @tc.expected      The recovery window reports a full ratio and double the degraded rate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRecoveryWindow', 0, () => {
      logStep('throughputProfileRecoveryWindow', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1110);
      let degraded: number = 0;
      for (let index = 0; index < 15; index++) {
        if (index % 3 === 0) {
          proxy.failNextSend = ERROR_SEND;
        }
        if (!client.sendString('degraded-' + String(index)).isSuccess()) {
          degraded = degraded + 1;
        }
      }
      const recovered: RequestResultModel[] = sendBurst(client, 15);
      const degradedWindow: ThroughputWindow = windowOf(1, 15, 15 - degraded, 300);
      const recoveryWindow: ThroughputWindow = windowOf(2, 15, successCount(recovered), 300);
      expect(degraded).assertEqual(5);
      expect(degradedWindow.successRatio()).assertEqual(2 / 3);
      expect(recoveryWindow.successRatio()).assertEqual(1);
      expect(recoveryWindow.throughputPerSecond() > degradedWindow.throughputPerSecond()).assertTrue();
      expect(ClientMetrics.from(client).replies).assertEqual(25);
      expect(ClientMetrics.from(client).failures).assertEqual(5);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(5);
    });

    /**
     * @tc.name          throughputProfileWindowIndexOrdering
     * @tc.desc          Window round indices are preserved in the order they were built.
     * @tc.precondition  A list of four windows.
     * @tc.steps         1. Build windows with rounds two through five.
     *                   2. Collect the round indices.
     *                   3. Compare with the expected order.
     * @tc.expected      The indices read two, three, four and five in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileWindowIndexOrdering', 0, () => {
      logStep('throughputProfileWindowIndexOrdering', 'begin');
      const windows: ThroughputWindow[] = [];
      for (let round = 2; round < 6; round++) {
        windows.push(windowOf(round, 10, 10, 100));
      }
      const rounds: number[] = [];
      for (let index = 0; index < windows.length; index++) {
        rounds.push(windows[index].round);
      }
      expect(rounds.join(',')).assertEqual('2,3,4,5');
      expect(rounds[0]).assertEqual(2);
      expect(rounds[3]).assertEqual(5);
      expect(windows[1].round).assertEqual(3);
      expect(windows[2].throughputPerSecond()).assertEqual(100);
      expect(windows.length).assertEqual(4);
      expect(sumOf(rounds)).assertEqual(14);
    });

    /**
     * @tc.name          throughputProfileExactFractions
     * @tc.desc          Ratios of five eighths and seven eighths are represented exactly.
     * @tc.precondition  Two windows with eight requests each.
     * @tc.steps         1. Build the two windows.
     *                   2. Compare the ratios.
     *                   3. Verify the failure counts.
     * @tc.expected      The ratios equal five eighths and seven eighths respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileExactFractions', 0, () => {
      logStep('throughputProfileExactFractions', 'begin');
      const fiveOfEight: ThroughputWindow = windowOf(1, 8, 5, 40);
      const sevenOfEight: ThroughputWindow = windowOf(2, 8, 7, 40);
      expect(fiveOfEight.successRatio()).assertEqual(5 / 8);
      expect(sevenOfEight.successRatio()).assertEqual(7 / 8);
      expect(fiveOfEight.failures).assertEqual(3);
      expect(sevenOfEight.failures).assertEqual(1);
      expect(fiveOfEight.throughputPerSecond()).assertEqual(125);
      expect(sevenOfEight.throughputPerSecond()).assertEqual(175);
      expect(sevenOfEight.successRatio() > fiveOfEight.successRatio()).assertTrue();
    });

    /**
     * @tc.name          throughputProfileEmptyClientBaseline
     * @tc.desc          A fresh client reports an empty throughput profile.
     * @tc.precondition  A new client.
     * @tc.steps         1. Build metrics for the fresh client.
     *                   2. Compute the derived values.
     *                   3. Compare with zeroed expectations.
     * @tc.expected      Sends, replies, ratio and events are all zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfileEmptyClientBaseline', 0, () => {
      logStep('throughputProfileEmptyClientBaseline', 'begin');
      const client: ConnectionModel = newClient();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.connects).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(windowOf(0, metrics.sends, metrics.replies, 100).throughputPerSecond()).assertEqual(0);
    });

    /**
     * @tc.name          throughputProfileOneRequestProfile
     * @tc.desc          A single request produces a well defined one-request profile.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send one request.
     *                   2. Build metrics and a one-request window.
     *                   3. Compare all derived values.
     * @tc.expected      One send and reply with a ratio of one and a finite rate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileOneRequestProfile', 0, () => {
      logStep('throughputProfileOneRequestProfile', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1111);
      const result: RequestResultModel = client.sendString(REQUEST_PAYLOAD);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      const window: ThroughputWindow = windowOf(1, 1, 1, 10);
      expect(result.isSuccess()).assertTrue();
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1);
      expect(window.throughputPerSecond()).assertEqual(100);
      expect(window.successRatio()).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          throughputProfileHalfRateClient
     * @tc.desc          Alternating success and failure on a live client yields a half ratio.
     * @tc.precondition  A connected client and twelve alternating requests.
     * @tc.steps         1. Arm a failure on every even index and send twelve times.
     *                   2. Read the metrics.
     *                   3. Compare toasts and ratio.
     * @tc.expected      Six replies and six failures produce a ratio of one half.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileHalfRateClient', 0, () => {
      logStep('throughputProfileHalfRateClient', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1112);
      for (let index = 0; index < 12; index++) {
        if (index % 2 === 0) {
          proxy.failNextSend = ERROR_SEND;
        }
        client.sendString('alternating-' + String(index));
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(12);
      expect(metrics.replies).assertEqual(6);
      expect(metrics.failures).assertEqual(6);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(6);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(6);
      expect(proxy.sendCalls).assertEqual(12);
      expect(proxy.stub.receivedTexts.length).assertEqual(6);
    });

    /**
     * @tc.name          throughputProfileMeanWindowRate
     * @tc.desc          The mean window rate over four rounds matches the hand-computed average.
     * @tc.precondition  A connected client and four rounds of ten sends.
     * @tc.steps         1. Run four rounds and build a window per round.
     *                   2. Collect the rates.
     *                   3. Compare their mean.
     * @tc.expected      The rates are one hundred and twenty five with a mean of the same value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileMeanWindowRate', 0, () => {
      logStep('throughputProfileMeanWindowRate', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1113);
      const windows: ThroughputWindow[] = [];
      for (let round = 0; round < 4; round++) {
        sendBurst(client, 10);
        windows.push(windowOf(round, 10, 10, 80));
      }
      const rates: number[] = [];
      for (let index = 0; index < windows.length; index++) {
        rates.push(windows[index].throughputPerSecond());
      }
      expect(rates[0]).assertEqual(125);
      expect(rates[3]).assertEqual(125);
      expect(meanOf(rates)).assertEqual(125);
      expect(sumOf(rates)).assertEqual(500);
      expect(windows.length).assertEqual(4);
      expect(ClientMetrics.from(client).replies).assertEqual(40);
      expect(windows[3].successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          throughputProfileSlowBucketSamples
     * @tc.desc          Samples above the normal band are classified as slow without upper limits.
     * @tc.precondition  A pure bucket classifier.
     * @tc.steps         1. Classify samples just above and far above the boundary.
     *                   2. Classify the exact boundary values.
     *                   3. Confirm the bucket labels.
     * @tc.expected      Values above twenty are slow and the boundary values stay normal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileSlowBucketSamples', 0, () => {
      logStep('throughputProfileSlowBucketSamples', 'begin');
      expect(bucketOf(20)).assertEqual('normal');
      expect(bucketOf(21)).assertEqual('slow');
      expect(bucketOf(100)).assertEqual('slow');
      expect(bucketOf(1000)).assertEqual('slow');
      expect(bucketOf(19)).assertEqual('normal');
      expect(bucketOf(8)).assertEqual('fast');
      expect(bucketOf(0)).assertEqual('fast');
      expect(bucketOf(-5)).assertEqual('fast');
    });

    /**
     * @tc.name          throughputProfileFastestSlowestWindow
     * @tc.desc          Among five windows the fastest and slowest are identified by rate.
     * @tc.precondition  Five synthetic windows with distinct durations.
     * @tc.steps         1. Build the windows.
     *                   2. Scan for the maximum and minimum rate.
     *                   3. Compare their indices.
     * @tc.expected      The maximum occurs at the shortest duration and the minimum at the longest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileFastestSlowestWindow', 0, () => {
      logStep('throughputProfileFastestSlowestWindow', 'begin');
      const durations: number[] = [500, 250, 125, 100, 400];
      const windows: ThroughputWindow[] = [];
      for (let index = 0; index < durations.length; index++) {
        windows.push(windowOf(index, 20, 20, durations[index]));
      }
      let fastestIndex: number = 0;
      let slowestIndex: number = 0;
      for (let index = 1; index < windows.length; index++) {
        if (windows[index].throughputPerSecond() > windows[fastestIndex].throughputPerSecond()) {
          fastestIndex = index;
        }
        if (windows[index].throughputPerSecond() < windows[slowestIndex].throughputPerSecond()) {
          slowestIndex = index;
        }
      }
      expect(fastestIndex).assertEqual(3);
      expect(slowestIndex).assertEqual(0);
      expect(windows[3].throughputPerSecond()).assertEqual(200);
      expect(windows[0].throughputPerSecond()).assertEqual(40);
      expect(windows[2].throughputPerSecond()).assertEqual(160);
      expect(windows[3].throughputPerSecond() / windows[0].throughputPerSecond()).assertEqual(5);
      expect(durations.length).assertEqual(5);
    });

    /**
     * @tc.name          throughputProfileFingerprintChangesWithLoad
     * @tc.desc          Client metric fingerprints differ between light and heavy load.
     * @tc.precondition  Two connected clients with different send counts.
     * @tc.steps         1. Send five requests on the first and fifty on the second.
     *                   2. Build both metrics.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints differ and the send counts are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileFingerprintChangesWithLoad', 0, () => {
      logStep('throughputProfileFingerprintChangesWithLoad', 'begin');
      const light: ConnectionModel = newClient();
      const heavy: ConnectionModel = newClient();
      openConnection(light, 1120);
      openConnection(heavy, 1121);
      sendBurst(light, 5);
      sendBurst(heavy, 50);
      const lightMetrics: ClientMetrics = ClientMetrics.from(light);
      const heavyMetrics: ClientMetrics = ClientMetrics.from(heavy);
      expect(lightMetrics.fingerprint() === heavyMetrics.fingerprint()).assertFalse();
      expect(lightMetrics.sends).assertEqual(5);
      expect(heavyMetrics.sends).assertEqual(50);
      expect(lightMetrics.successRatio()).assertEqual(1);
      expect(heavyMetrics.successRatio()).assertEqual(1);
      expect(heavy.toasts.length / light.toasts.length).assertEqual(51 / 6);
      expect(heavy.logs.size() > light.logs.size()).assertTrue();
    });

    /**
     * @tc.name          throughputProfileCumulativeFailureShare
     * @tc.desc          Failure shares across two windows combine into the overall share.
     * @tc.precondition  Two windows with different failure counts.
     * @tc.steps         1. Build a window with two failures out of ten.
     *                   2. Build a window with six failures out of thirty.
     *                   3. Combine the counts.
     * @tc.expected      The combined share is eight failures out of forty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileCumulativeFailureShare', 0, () => {
      logStep('throughputProfileCumulativeFailureShare', 'begin');
      const first: ThroughputWindow = windowOf(1, 10, 8, 100);
      const second: ThroughputWindow = windowOf(2, 30, 24, 100);
      const totalRequests: number = first.requests + second.requests;
      const totalFailures: number = first.failures + second.failures;
      expect(first.failures).assertEqual(2);
      expect(second.failures).assertEqual(6);
      expect(totalRequests).assertEqual(40);
      expect(totalFailures).assertEqual(8);
      expect(totalFailures / totalRequests).assertEqual(0.2);
      expect(first.successRatio()).assertEqual(0.8);
      expect(second.successRatio()).assertEqual(0.8);
    });

    /**
     * @tc.name          throughputProfileZeroRateAfterDisconnect
     * @tc.desc          After disconnection no further replies are produced for throughput accounting.
     * @tc.precondition  A client that connected, sent and disconnected.
     * @tc.steps         1. Send ten requests and disconnect.
     *                   2. Send ten more requests.
     *                   3. Compare the reply count before and after.
     * @tc.expected      The reply count stays at ten and the new window rate is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileZeroRateAfterDisconnect', 0, () => {
      logStep('throughputProfileZeroRateAfterDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1122);
      sendBurst(client, 10);
      const before: number = ClientMetrics.from(client).replies;
      client.onDisconnect();
      const after: RequestResultModel[] = sendBurst(client, 10);
      const window: ThroughputWindow = windowOf(2, 10, 0, 200);
      expect(before).assertEqual(10);
      expect(codeCount(after, ERROR_PROXY_INVALID)).assertEqual(10);
      expect(ClientMetrics.from(client).replies).assertEqual(10);
      expect(ClientMetrics.from(client).sends).assertEqual(10);
      expect(window.replies).assertEqual(0);
      expect(window.throughputPerSecond()).assertEqual(0);
      expect(window.successRatio()).assertEqual(0);
    });

    /**
     * @tc.name          throughputProfileDegradedDescription
     * @tc.desc          A degraded window description encodes its failure count exactly.
     * @tc.precondition  A window with thirty requests and seventeen replies.
     * @tc.steps         1. Build the window.
     *                   2. Derive the failure count.
     *                   3. Compare the description.
     * @tc.expected      The description reports thirteen failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileDegradedDescription', 0, () => {
      logStep('throughputProfileDegradedDescription', 'begin');
      const window: ThroughputWindow = windowOf(6, 30, 17, 170);
      expect(window.failures).assertEqual(13);
      expect(window.describe()).assertEqual('6/30/17/13/170');
      expect(window.successRatio()).assertEqual(17 / 30);
      expect(window.throughputPerSecond()).assertEqual(100);
      expect(window.requests - window.replies).assertEqual(window.failures);
      expect(window.failures > window.replies).assertFalse();
      expect(window.requests > window.replies).assertTrue();
    });

    /**
     * @tc.name          throughputProfileTotalRequestsSum
     * @tc.desc          Total requests across six windows equals the sum of per-window counts.
     * @tc.precondition  Six windows with varying request counts.
     * @tc.steps         1. Build the windows.
     *                   2. Sum their request fields.
     *                   3. Compare with the expected total.
     * @tc.expected      The total is ninety while every individual count is preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileTotalRequestsSum', 0, () => {
      logStep('throughputProfileTotalRequestsSum', 'begin');
      const windows: ThroughputWindow[] = [
        windowOf(1, 5, 5, 50),
        windowOf(2, 10, 10, 100),
        windowOf(3, 15, 15, 150),
        windowOf(4, 20, 20, 200),
        windowOf(5, 25, 25, 250),
        windowOf(6, 15, 15, 150)
      ];
      let total: number = 0;
      for (let index = 0; index < windows.length; index++) {
        total = total + windows[index].requests;
      }
      expect(windows.length).assertEqual(6);
      expect(total).assertEqual(90);
      expect(windows[0].requests).assertEqual(5);
      expect(windows[4].requests).assertEqual(25);
      expect(windows[5].requests).assertEqual(15);
      expect(sumOf([5, 10, 15, 20, 25, 15])).assertEqual(total);
      expect(windows[3].throughputPerSecond()).assertEqual(100);
    });

    /**
     * @tc.name          throughputProfileMiddleWindowRate
     * @tc.desc          The middle window rate of a sorted five-window sample is the median.
     * @tc.precondition  Five windows with unsorted durations.
     * @tc.steps         1. Build the windows.
     *                   2. Extract and sort the rates.
     *                   3. Read the middle element.
     * @tc.expected      The median rate is the third element after sorting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileMiddleWindowRate', 0, () => {
      logStep('throughputProfileMiddleWindowRate', 'begin');
      const durations: number[] = [200, 50, 100, 25, 400];
      const rates: number[] = [];
      for (let index = 0; index < durations.length; index++) {
        rates.push(windowOf(index, 20, 20, durations[index]).throughputPerSecond());
      }
      const sorted: number[] = rates.slice().sort((left: number, right: number) => left - right);
      expect(sorted.length).assertEqual(5);
      expect(sorted[0]).assertEqual(50);
      expect(sorted[4]).assertEqual(800);
      expect(sorted[2]).assertEqual(200);
      expect(meanOf(sorted) > sorted[2]).assertTrue();
      expect(rates.indexOf(800) >= 0).assertTrue();
      expect(rates[1]).assertEqual(400);
    });

    /**
     * @tc.name          throughputProfileLatencyPerRequest
     * @tc.desc          Average latency per request equals elapsed time divided by replies.
     * @tc.precondition  A window of one hundred replies over two hundred milliseconds.
     * @tc.steps         1. Build the window.
     *                   2. Compute latency per reply.
     *                   3. Compare with the rate reciprocal.
     * @tc.expected      The latency is two milliseconds and consistent with the rate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileLatencyPerRequest', 0, () => {
      logStep('throughputProfileLatencyPerRequest', 'begin');
      const window: ThroughputWindow = windowOf(1, 100, 100, 200);
      const latency: number = window.elapsedMs / window.replies;
      expect(latency).assertEqual(2);
      expect(window.throughputPerSecond()).assertEqual(500);
      expect(1000 / window.throughputPerSecond()).assertEqual(latency);
      expect(bucketOf(latency)).assertEqual('fast');
      expect(window.requests).assertEqual(100);
      expect(window.failures).assertEqual(0);
      expect(window.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          throughputProfileFailureFreeCeiling
     * @tc.desc          Replies never exceed requests and the ratio is capped at one.
     * @tc.precondition  A connected client with forty successful sends.
     * @tc.steps         1. Send forty requests.
     *                   2. Build a window with the observed counts.
     *                   3. Confirm the ceiling.
     * @tc.expected      Replies equal requests and the ratio never exceeds one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFailureFreeCeiling', 0, () => {
      logStep('throughputProfileFailureFreeCeiling', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1123);
      sendBurst(client, 40);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      const window: ThroughputWindow = windowOf(1, metrics.sends, metrics.replies, 400);
      expect(window.replies).assertEqual(window.requests);
      expect(window.failures).assertEqual(0);
      expect(window.successRatio() <= 1).assertTrue();
      expect(window.throughputPerSecond()).assertEqual(100);
      expect(window.replies <= window.requests).assertTrue();
      expect(metrics.failures).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          throughputProfilePayloadPairSizes
     * @tc.desc          Request and reply payload sizes form a stable pair for every request.
     * @tc.precondition  A connected client with a default stub reply.
     * @tc.steps         1. Send twenty requests.
     *                   2. Compute the request and reply sizes.
     *                   3. Verify the constant difference.
     * @tc.expected      The request is thirty-eight bytes and the reply thirty-four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfilePayloadPairSizes', 0, () => {
      logStep('throughputProfilePayloadPairSizes', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1124);
      const results: RequestResultModel[] = sendBurst(client, 20);
      const requestSize: number = modeledSize(REQUEST_PAYLOAD);
      const replySize: number = modeledSize(results[0].replyText);
      expect(requestSize).assertEqual(38);
      expect(replySize).assertEqual(34);
      expect(requestSize - replySize).assertEqual(4);
      expect(requestSize + replySize).assertEqual(72);
      expect(results.length).assertEqual(20);
      expect(ClientMetrics.from(client).replies).assertEqual(20);
      expect(modeledSize(results[19].replyText)).assertEqual(replySize);
    });

    /**
     * @tc.name          throughputProfileSnapshotAfterLoad
     * @tc.desc          A snapshot after a heavy burst reflects load in the toast count only.
     * @tc.precondition  A connected client after ninety sends.
     * @tc.steps         1. Send ninety requests.
     *                   2. Capture the snapshot.
     *                   3. Compare with the pre-burst snapshot.
     * @tc.expected      The state and id are unchanged while the toast count grows by ninety.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileSnapshotAfterLoad', 0, () => {
      logStep('throughputProfileSnapshotAfterLoad', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1125);
      const before: ClientSnapshot = new ClientSnapshot(client);
      sendBurst(client, 90);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.toastCount).assertEqual(before.toastCount + 90);
      expect(after.state).assertEqual(before.state);
      expect(after.connectId).assertEqual(before.connectId);
      expect(after.hasProxy).assertEqual(before.hasProxy);
      expect(after.deathRegistered).assertEqual(before.deathRegistered);
      expect(after.describe()).assertEqual('connected/1125/true/true/91');
      expect(ClientMetrics.from(client).replies).assertEqual(90);
    });

    /**
     * @tc.name          throughputProfileAfterInjectedBurst
     * @tc.desc          A burst of five failures followed by twenty five successes reaches a high ratio.
     * @tc.precondition  A connected client with five armed failures.
     * @tc.steps         1. Send five failing requests.
     *                   2. Send twenty five clean requests.
     *                   3. Compute the overall ratio.
     * @tc.expected      The ratio is five sixths with twenty five replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileAfterInjectedBurst', 0, () => {
      logStep('throughputProfileAfterInjectedBurst', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1126);
      for (let index = 0; index < 5; index++) {
        proxy.failNextSend = ERROR_SEND;
        client.sendString('failing-' + String(index));
      }
      const recovered: RequestResultModel[] = sendBurst(client, 25);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(successCount(recovered)).assertEqual(25);
      expect(metrics.sends).assertEqual(30);
      expect(metrics.replies).assertEqual(25);
      expect(metrics.failures).assertEqual(5);
      expect(metrics.successRatio()).assertEqual(5 / 6);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(5);
      expect(proxy.stub.receivedTexts.length).assertEqual(25);
    });

    /**
     * @tc.name          throughputProfileWindowRoundTrip
     * @tc.desc          A window description parses back into the original numeric fields.
     * @tc.precondition  A window with non-zero values in every field.
     * @tc.steps         1. Describe the window.
     *                   2. Parse each segment to a number.
     *                   3. Compare with the original fields.
     * @tc.expected      Every parsed value equals the source field.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileWindowRoundTrip', 0, () => {
      logStep('throughputProfileWindowRoundTrip', 'begin');
      const window: ThroughputWindow = windowOf(12, 64, 56, 448);
      const parts: string[] = window.describe().split('/');
      const parsedRound: number = Number.parseInt(parts[0], 10);
      const parsedRequests: number = Number.parseInt(parts[1], 10);
      const parsedReplies: number = Number.parseInt(parts[2], 10);
      const parsedFailures: number = Number.parseInt(parts[3], 10);
      expect(parts.length).assertEqual(5);
      expect(parsedRound).assertEqual(window.round);
      expect(parsedRequests).assertEqual(window.requests);
      expect(parsedReplies).assertEqual(window.replies);
      expect(parsedFailures).assertEqual(window.failures);
      expect(Number.parseInt(parts[4], 10)).assertEqual(window.elapsedMs);
      expect(window.throughputPerSecond()).assertEqual(125);
      expect(window.successRatio()).assertEqual(0.875);
    });

    /**
     * @tc.name          throughputProfileTwoClientRateParity
     * @tc.desc          Two clients with identical work report identical throughput figures.
     * @tc.precondition  Two connected clients and one shared plan.
     * @tc.steps         1. Send forty requests on each client.
     *                   2. Build a window for each.
     *                   3. Compare rates, ratios and descriptions.
     * @tc.expected      Both windows are identical and both metric fingerprints match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileTwoClientRateParity', 0, () => {
      logStep('throughputProfileTwoClientRateParity', 'begin');
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      openConnection(left, 1127);
      openConnection(right, 1128);
      sendBurst(left, 40);
      sendBurst(right, 40);
      const leftWindow: ThroughputWindow = windowOf(1, 40, ClientMetrics.from(left).replies, 320);
      const rightWindow: ThroughputWindow = windowOf(1, 40, ClientMetrics.from(right).replies, 320);
      expect(leftWindow.describe()).assertEqual(rightWindow.describe());
      expect(leftWindow.throughputPerSecond()).assertEqual(125);
      expect(rightWindow.throughputPerSecond()).assertEqual(125);
      expect(leftWindow.successRatio()).assertEqual(rightWindow.successRatio());
      expect(ClientMetrics.from(left).fingerprint()).assertEqual(ClientMetrics.from(right).fingerprint());
      expect(left.toasts.length).assertEqual(right.toasts.length);
      expect(left.logs.size()).assertEqual(right.logs.size());
    });

    /**
     * @tc.name          throughputProfileFinalInvariants
     * @tc.desc          A three-phase profile satisfies the counting invariants at every boundary.
     * @tc.precondition  An empty client and a three-phase plan.
     * @tc.steps         1. Run clean, degraded and recovered phases.
     *                   2. Capture metrics once.
     *                   3. Verify totals and shares.
     * @tc.expected      Sends equal replies plus failures with a ratio of twenty eight thirtieths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileFinalInvariants', 0, () => {
      logStep('throughputProfileFinalInvariants', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1129);
      sendBurst(client, 10);
      for (let index = 0; index < 2; index++) {
        proxy.failNextSend = ERROR_SEND;
        client.sendString('degraded-' + String(index));
      }
      sendBurst(client, 18);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(30);
      expect(metrics.replies).assertEqual(28);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(metrics.successRatio()).assertEqual(28 / 30);
      expect(client.toasts.length).assertEqual(31);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(proxy.stub.receivedTexts.length).assertEqual(28);
    });

    /**
     * @tc.name          throughputProfileResetRestoresBaseline
     * @tc.desc          Reset returns every throughput counter to the empty baseline.
     * @tc.precondition  A client that completed a two hundred send profile.
     * @tc.steps         1. Build a heavy profile and reset.
     *                   2. Read metrics and buffers.
     *                   3. Build a window from the zeroed metrics.
     * @tc.expected      All counters are zero and the derived window rate is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileResetRestoresBaseline', 0, () => {
      logStep('throughputProfileResetRestoresBaseline', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1130);
      sendBurst(client, 200);
      client.reset();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      const window: ThroughputWindow = windowOf(0, metrics.sends, metrics.replies, 100);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(window.throughputPerSecond()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          throughputProfileDurationAccumulation
     * @tc.desc          Window durations accumulate into a deterministic total elapsed time.
     * @tc.precondition  Five windows with known durations.
     * @tc.steps         1. Build the windows.
     *                   2. Sum their elapsed times.
     *                   3. Compare with a manual total.
     * @tc.expected      The total is one thousand milliseconds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileDurationAccumulation', 0, () => {
      logStep('throughputProfileDurationAccumulation', 'begin');
      const durations: number[] = [100, 150, 200, 250, 300];
      const windows: ThroughputWindow[] = [];
      for (let index = 0; index < durations.length; index++) {
        windows.push(windowOf(index, 10, 10, durations[index]));
      }
      let total: number = 0;
      for (let index = 0; index < windows.length; index++) {
        total = total + windows[index].elapsedMs;
      }
      expect(total).assertEqual(1000);
      expect(sumOf(durations)).assertEqual(total);
      expect(windows[0].elapsedMs).assertEqual(100);
      expect(windows[4].elapsedMs).assertEqual(300);
      expect(windows[2].throughputPerSecond()).assertEqual(50);
      expect(windows.length).assertEqual(5);
      expect(meanOf(durations)).assertEqual(200);
    });

    /**
     * @tc.name          throughputProfileReconnectBurstRate
     * @tc.desc          A second session reaches the same modeled rate as the first.
     * @tc.precondition  A client that completed one session of thirty sends.
     * @tc.steps         1. Send thirty requests in the first session.
     *                   2. Disconnect, reconnect and send thirty more.
     *                   3. Build matching windows and compare rates.
     * @tc.expected      Both windows report one hundred and fifty per second with full ratios.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileReconnectBurstRate', 0, () => {
      logStep('throughputProfileReconnectBurstRate', 'begin');
      const client: ConnectionModel = newClient();
      const firstProxy: RemoteProxyModel = openConnection(client, 1131);
      sendBurst(client, 30);
      const firstWindow: ThroughputWindow = windowOf(1, 30, 30, 200);
      client.onDisconnect();
      const secondProxy: RemoteProxyModel = openConnection(client, 1132);
      sendBurst(client, 30);
      const secondWindow: ThroughputWindow = windowOf(2, 30, 30, 200);
      expect(firstWindow.throughputPerSecond()).assertEqual(150);
      expect(secondWindow.throughputPerSecond()).assertEqual(150);
      expect(secondWindow.describe()).assertEqual('2/30/30/0/200');
      expect(ClientMetrics.from(client).replies).assertEqual(60);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
      expect(firstProxy.stub.receivedTexts.length).assertEqual(30);
      expect(secondProxy.stub.receivedTexts.length).assertEqual(30);
      expect(client.connectCalls).assertEqual(2);
    });
  });
}