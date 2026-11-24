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
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  MessageSequenceModel,
  MessageOptionModel,
  InProcessClient,
  StubRemoteObjectModel,
  ServiceLifecycleModel,
  StubMetrics,
  StubRequestRecord,
  countOf,
  joined,
  replayCodes,
  textFingerprint
} from '../Shared/SharedDriver';

function patternCodes(count: number, rejectEvery: number, rejectCode: number): number[] {
  const codes: number[] = [];
  for (let index = 0; index < count; index++) {
    codes.push(index % rejectEvery === 0 ? rejectCode : REQUEST_CODE);
  }
  return codes;
}

function runPlan(client: InProcessClient, codes: number[]): number {
  let handled = 0;
  for (let index = 0; index < codes.length; index++) {
    if (client.send(codes[index], 'plan-' + String(index)).isSuccess()) {
      handled = handled + 1;
    }
  }
  return handled;
}

function ledgerHandled(stub: StubRemoteObjectModel): number {
  let total = 0;
  for (let index = 0; index < stub.requests.length; index++) {
    if (stub.requests[index].handled) {
      total = total + 1;
    }
  }
  return total;
}

export default function throughputProfile(): void {
  describe('PerformanceStabilityThroughput', () => {
    beforeAll(() => {
      logSuite('PerformanceStabilityThroughput', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PerformanceStabilityThroughput', 'end');
    });

    /**
     * @tc.name          throughputProfileHundredValidRequests
     * @tc.desc          One hundred valid requests report a full success profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send one hundred valid requests.
     *                   2. Build metrics.
     *                   3. Compare every counter.
     * @tc.expected      One hundred handled, zero rejected and ratio one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfileHundredValidRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(100);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(100);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          throughputProfileHundredMixedRequests
     * @tc.desc          A quarter-invalid hundred-request plan reports 75 percent.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Reject every fourth request.
     *                   2. Build metrics.
     *                   3. Compare handled and rejected counts.
     * @tc.expected      Seventy-five handled and twenty-five rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfileHundredMixedRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(100, 4, UNKNOWN_CODE_ZERO);
      const handled = runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(75);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(75);
      expect(metrics.rejected).assertEqual(25);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(metrics.replies).assertEqual(75);
    });

    /**
     * @tc.name          throughputProfileSuccessRatioExact
     * @tc.desc          A seven-of-ten plan yields an exact 0.7 success ratio.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send a plan with three rejects.
     *                   2. Build metrics.
     *                   3. Compare the ratio with the arithmetic value.
     * @tc.expected      The ratio equals 0.7 with seven handled rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileSuccessRatioExact', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE, REQUEST_CODE,
        UNKNOWN_CODE_NEGATIVE, REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_LARGE, REQUEST_CODE, REQUEST_CODE];
      const handled = runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(7);
      expect(metrics.successRatio()).assertEqual(0.7);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('10:7:3:7'));
      expect(metrics.handled + metrics.rejected).assertEqual(metrics.requests);
      expect(client.results.length).assertEqual(10);
    });

    /**
     * @tc.name          throughputProfileRejectRatioExact
     * @tc.desc          A thirty-percent reject plan yields a 0.3 failure ratio.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Reject three of every ten requests.
     *                   2. Build metrics.
     *                   3. Compute one minus the success ratio.
     * @tc.expected      The failure ratio equals 0.3.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRejectRatioExact', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(100, 10, UNKNOWN_CODE_TWO);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.rejected).assertEqual(10);
      expect(metrics.handled).assertEqual(90);
      expect(Math.abs(1 - metrics.successRatio() - 0.1)).assertLess(1e-12);
      expect(metrics.successRatio()).assertEqual(0.9);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.replies).assertEqual(90);
    });

    /**
     * @tc.name          throughputProfileReplyCountMatchesHandled
     * @tc.desc          The reply counter equals the number of handled rows.
     * @tc.precondition  A mixed plan has been executed.
     * @tc.steps         1. Send sixty mixed requests.
     *                   2. Compare metrics replies with handled rows.
     *                   3. Compare client replies.
     * @tc.expected      All three reply measures agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileReplyCountMatchesHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(60, 3, UNKNOWN_CODE_ZERO);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(60);
      expect(metrics.handled).assertEqual(40);
      expect(metrics.replies).assertEqual(40);
      expect(metrics.replies).assertEqual(ledgerHandled(stub));
      expect(client.replies.length).assertEqual(40);
      expect(metrics.rejected).assertEqual(20);
    });

    /**
     * @tc.name          throughputProfileFingerprintMatchesCounts
     * @tc.desc          The fingerprint is the hash of the four metric counters.
     * @tc.precondition  A stub has a known mixed workload.
     * @tc.steps         1. Send twelve requests with three rejects.
     *                   2. Build the manual counter literal.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprint equals the hash of 12:9:3:9.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFingerprintMatchesCounts', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(12, 4, UNKNOWN_CODE_LARGE);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(12);
      expect(metrics.handled).assertEqual(9);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.replies).assertEqual(9);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('12:9:3:9'));
      expect(metrics.fingerprint() === textFingerprint('12:9:3:8')).assertFalse();
    });

    /**
     * @tc.name          throughputProfilePerClientThroughputSplit
     * @tc.desc          Two clients with different volumes report their own totals.
     * @tc.precondition  A shared stub with two clients exists.
     * @tc.steps         1. Send forty requests from the first client.
     *                   2. Send ten from the second.
     *                   3. Compare per-client and shared totals.
     * @tc.expected      Client totals read forty and ten with fifty shared rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfilePerClientThroughputSplit', 0, () => {
      const stub = new StubRemoteObjectModel();
      const heavy = new InProcessClient(stub);
      const light = new InProcessClient(stub);
      expect(heavy.sendMany(40)).assertEqual(40);
      expect(light.sendMany(10)).assertEqual(10);
      expect(heavy.replies.length).assertEqual(40);
      expect(light.replies.length).assertEqual(10);
      expect(stub.requestCount()).assertEqual(50);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          throughputProfileTwoClientsEqualShares
     * @tc.desc          Equal client volumes produce equal reply shares.
     * @tc.precondition  Two clients share one stub.
     * @tc.steps         1. Send twenty-five requests from each client.
     *                   2. Compare reply counts.
     *                   3. Compare the aggregate request count.
     * @tc.expected      Both clients hold twenty-five replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileTwoClientsEqualShares', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.sendMany(25);
      second.sendMany(25);
      const difference = first.replies.length - second.replies.length;
      expect(difference).assertEqual(0);
      expect(first.replies.length).assertEqual(25);
      expect(second.replies.length).assertEqual(25);
      expect(stub.requestCount()).assertEqual(50);
      expect(first.sentCodes.length).assertEqual(25);
      expect(StubMetrics.from(stub).handled).assertEqual(50);
    });

    /**
     * @tc.name          throughputProfileUnevenClientShares
     * @tc.desc          Three clients with thirty, twenty and ten sends keep exact shares.
     * @tc.precondition  Three clients share one stub.
     * @tc.steps         1. Send thirty, twenty and ten requests.
     *                   2. Read each reply count.
     *                   3. Compare the combined total.
     * @tc.expected      Shares read thirty, twenty and ten for a total of sixty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileUnevenClientShares', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      const third = new InProcessClient(stub);
      first.sendMany(30);
      second.sendMany(20);
      third.sendMany(10);
      expect(first.replies.length).assertEqual(30);
      expect(second.replies.length).assertEqual(20);
      expect(third.replies.length).assertEqual(10);
      expect(first.replies.length + second.replies.length + third.replies.length).assertEqual(60);
      expect(stub.requestCount()).assertEqual(60);
      expect(countOf(first.replies, REPLY_PAYLOAD)).assertEqual(30);
    });

    /**
     * @tc.name          throughputProfileBatchSizeOne
     * @tc.desc          A single-request batch reports the smallest nonzero profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send a batch of one.
     *                   2. Build metrics.
     *                   3. Verify the ledger.
     * @tc.expected      Every counter reads one and the ratio is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfileBatchSizeOne', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      expect(client.sendMany(1)).assertEqual(1);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          throughputProfileBatchSizeTen
     * @tc.desc          A ten-request batch reports ten handled rows.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send a batch of ten.
     *                   2. Build metrics.
     *                   3. Compare the fingerprint literal.
     * @tc.expected      Counters read ten and the fingerprint matches 10:10:0:10.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfileBatchSizeTen', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      expect(client.sendMany(10)).assertEqual(10);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(10);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.replies).assertEqual(10);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('10:10:0:10'));
      expect(client.results.length).assertEqual(10);
      expect(ledgerHandled(stub)).assertEqual(10);
    });

    /**
     * @tc.name          throughputProfileBatchSizeHundred
     * @tc.desc          A hundred-request batch reports a saturated success profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send a batch of one hundred.
     *                   2. Build metrics.
     *                   3. Compare counts and ratio.
     * @tc.expected      One hundred handled rows with ratio one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileBatchSizeHundred', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      expect(client.sendMany(100)).assertEqual(100);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('100:100:0:100'));
      expect(stub.requests[99].handled).assertTrue();
      expect(client.replies.length).assertEqual(100);
    });

    /**
     * @tc.name          throughputProfileZeroBatchMetrics
     * @tc.desc          A zero-request batch produces the zero metric baseline.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send a batch of zero.
     *                   2. Build metrics.
     *                   3. Verify the fingerprint.
     * @tc.expected      All counters are zero with the zero fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('throughputProfileZeroBatchMetrics', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      expect(client.sendMany(0)).assertEqual(0);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
    });

    /**
     * @tc.name          throughputProfileMixedBatchSeven
     * @tc.desc          A seven-request mixed batch reports four handled and three rejected.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send a known seven-code plan.
     *                   2. Build metrics.
     *                   3. Compare the ratio.
     * @tc.expected      Counts read seven, four and three with ratio four sevenths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMixedBatchSeven', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE,
        UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_LARGE];
      const handled = runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(4);
      expect(metrics.requests).assertEqual(7);
      expect(metrics.handled).assertEqual(4);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(4 / 7);
      expect(client.results[1].errCode).assertEqual(ERROR_STUB_REJECTED);
    });

    /**
     * @tc.name          throughputProfileAllRejectRun
     * @tc.desc          A fully rejected run reports a zero success profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send fifty unknown codes.
     *                   2. Build metrics.
     *                   3. Verify no replies exist.
     * @tc.expected      Fifty rejected, zero replies and ratio zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileAllRejectRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(50, UNKNOWN_CODE_NEGATIVE);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(0);
      expect(metrics.requests).assertEqual(50);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(50);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          throughputProfileAllSuccessRun
     * @tc.desc          A fully handled run reports a saturated profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send fifty valid requests.
     *                   2. Build metrics.
     *                   3. Verify the ratio and replies.
     * @tc.expected      Fifty handled with fifty replies and ratio one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileAllSuccessRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(50);
      const metrics = StubMetrics.from(stub);
      expect(metrics.handled).assertEqual(50);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(50);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('50:50:0:50'));
      expect(ledgerHandled(stub)).assertEqual(50);
    });

    /**
     * @tc.name          throughputProfileAlternatingRun
     * @tc.desc          Alternating valid and invalid requests split the profile evenly.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send thirty alternating requests.
     *                   2. Build metrics.
     *                   3. Verify the half ratio.
     * @tc.expected      Fifteen handled and fifteen rejected with ratio 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileAlternatingRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 30; index++) {
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO;
        client.send(code, 'alt-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(30);
      expect(metrics.handled).assertEqual(15);
      expect(metrics.rejected).assertEqual(15);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(15);
      expect(metrics.replies).assertEqual(15);
    });

    /**
     * @tc.name          throughputProfileQuarterRejectRun
     * @tc.desc          A quarter-reject run over eighty sends reports sixty handled.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Reject every fourth request.
     *                   2. Build metrics.
     *                   3. Verify the ratio.
     * @tc.expected      Sixty handled and twenty rejected with ratio 0.75.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileQuarterRejectRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(80, 4, UNKNOWN_CODE_ZERO);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(80);
      expect(metrics.handled).assertEqual(60);
      expect(metrics.rejected).assertEqual(20);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('80:60:20:60'));
      expect(client.results.length).assertEqual(80);
    });

    /**
     * @tc.name          throughputProfileSixthRejectRun
     * @tc.desc          Rejecting every sixth of sixty sends reports fifty handled.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Apply the sixth-reject plan.
     *                   2. Build metrics.
     *                   3. Compare handled and rejected counts.
     * @tc.expected      Fifty handled and ten rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileSixthRejectRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(60, 6, UNKNOWN_CODE_LARGE);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(60);
      expect(metrics.handled).assertEqual(50);
      expect(metrics.rejected).assertEqual(10);
      expect(metrics.successRatio()).assertEqual(5 / 6);
      expect(metrics.replies).assertEqual(50);
      expect(stub.requests[59].handled).assertTrue();
    });

    /**
     * @tc.name          throughputProfilePayloadLengthDoesNotChangeCounts
     * @tc.desc          Short and long payloads produce identical throughput counts.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send ten short payloads.
     *                   2. Send ten long payloads.
     *                   3. Compare metrics after each phase.
     * @tc.expected      Both phases add ten handled requests and ten replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfilePayloadLengthDoesNotChangeCounts', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 10; index++) {
        client.send(REQUEST_CODE, 's');
      }
      const afterShort = StubMetrics.from(stub);
      let longPayload = '';
      for (let index = 0; index < 2000; index++) {
        longPayload = longPayload + 'q';
      }
      for (let index = 0; index < 10; index++) {
        client.send(REQUEST_CODE, longPayload);
      }
      const afterLong = StubMetrics.from(stub);
      expect(afterShort.handled).assertEqual(10);
      expect(afterLong.handled).assertEqual(20);
      expect(afterLong.requests).assertEqual(20);
      expect(afterLong.replies).assertEqual(20);
      expect(afterLong.successRatio()).assertEqual(1);
      expect(stub.requests[19].text.length).assertEqual(2000);
    });

    /**
     * @tc.name          throughputProfileCustomReplyDoesNotChangeCounts
     * @tc.desc          A custom reply literal leaves counters untouched.
     * @tc.precondition  A stub with a custom reply and client exist.
     * @tc.steps         1. Send one hundred requests with the custom reply.
     *                   2. Build metrics.
     *                   3. Verify the reply literal in rows.
     * @tc.expected      Counters remain one hundred and every row carries the custom text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileCustomReplyDoesNotChangeCounts', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.replyText = 'profile-custom';
      const client = new InProcessClient(stub);
      client.sendMany(100);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.replies).assertEqual(100);
      expect(stub.requests[0].replyText).assertEqual('profile-custom');
      expect(stub.requests[99].replyText).assertEqual('profile-custom');
      expect(countOf(client.replies, 'profile-custom')).assertEqual(100);
    });

    /**
     * @tc.name          throughputProfileOptionFlagsDoNotChangeCounts
     * @tc.desc          Sync and async options produce identical handled totals.
     * @tc.precondition  A stub and three sequences are prepared.
     * @tc.steps         1. Send with sync, async and default options.
     *                   2. Build metrics.
     *                   3. Compare the handled counter.
     * @tc.expected      All three sends are handled regardless of option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileOptionFlagsDoNotChangeCounts', 0, () => {
      const stub = new StubRemoteObjectModel();
      const options: MessageOptionModel[] = [
        new MessageOptionModel(OPTION_FLAG_SYNC, 0, false),
        new MessageOptionModel(OPTION_FLAG_ASYNC, 8, false),
        new MessageOptionModel(OPTION_FLAG_ASYNC, 0, true)
      ];
      for (let index = 0; index < options.length; index++) {
        const data = MessageSequenceModel.create();
        const reply = MessageSequenceModel.create();
        data.writeString('option-' + String(index));
        expect(stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, options[index])).assertTrue();
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(1);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[2].option).assertEqual('1/0/true');
    });

    /**
     * @tc.name          throughputProfileKillWindowCountsRejects
     * @tc.desc          Requests sent while the stub is dead count as rejects.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Kill the stub and send twenty requests.
     *                   2. Revive and send twenty more.
     *                   3. Build metrics.
     * @tc.expected      Twenty rejected followed by twenty handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileKillWindowCountsRejects', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      client.sendMany(20);
      stub.revive();
      client.sendMany(20);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(40);
      expect(metrics.handled).assertEqual(20);
      expect(metrics.rejected).assertEqual(20);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[39].handled).assertTrue();
    });

    /**
     * @tc.name          throughputProfileRejectListAffectsRatio
     * @tc.desc          A populated reject list lowers the observed success ratio.
     * @tc.precondition  A stub rejects code one.
     * @tc.steps         1. Send ten requests before rejection.
     *                   2. Add code one to the reject list.
     *                   3. Send ten more and build metrics.
     * @tc.expected      Ten handled and ten rejected with ratio 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRejectListAffectsRatio', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(10);
      stub.rejectCodes = [REQUEST_CODE];
      client.sendMany(10);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(20);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(10);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.replies).assertEqual(10);
      expect(stub.requests[19].handled).assertFalse();
    });

    /**
     * @tc.name          throughputProfilePerStubIsolation
     * @tc.desc          Metrics are scoped to one stub, not shared globally.
     * @tc.precondition  Two independent stubs each have a client.
     * @tc.steps         1. Send twenty to the first stub.
     *                   2. Send five to the second.
     *                   3. Compare both metric sets.
     * @tc.expected      Each stub reports only its own traffic.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfilePerStubIsolation', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      firstClient.sendMany(20);
      secondClient.sendMany(5);
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.requests).assertEqual(20);
      expect(secondMetrics.requests).assertEqual(5);
      expect(firstMetrics.fingerprint() === secondMetrics.fingerprint()).assertFalse();
      expect(firstMetrics.successRatio()).assertEqual(1);
      expect(secondMetrics.replies).assertEqual(5);
      expect(firstStub.requestCount() + secondStub.requestCount()).assertEqual(25);
    });

    /**
     * @tc.name          throughputProfileMetricsAfterResetBaseline
     * @tc.desc          Metrics after reset equal a fresh zero profile.
     * @tc.precondition  A stub has run a mixed plan and then reset.
     * @tc.steps         1. Run traffic and reset.
     *                   2. Build metrics.
     *                   3. Compare with a fresh stub.
     * @tc.expected      Both fingerprints equal the zero baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMetricsAfterResetBaseline', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(15);
      client.send(UNKNOWN_CODE_ZERO);
      stub.reset();
      const metrics = StubMetrics.from(stub);
      const freshMetrics = StubMetrics.from(new StubRemoteObjectModel());
      expect(metrics.requests).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(freshMetrics.fingerprint());
      expect(stub.requestCount()).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(16);
      expect(client.replies.length).assertEqual(15);
    });

    /**
     * @tc.name          throughputProfileMetricsAfterResetReplay
     * @tc.desc          Replaying after reset reproduces the original profile exactly.
     * @tc.precondition  A stub has an initial profile that is then reset.
     * @tc.steps         1. Run a mixed plan and record metrics.
     *                   2. Reset and replay the identical plan.
     *                   3. Compare both metric fingerprints.
     * @tc.expected      The two fingerprints match after replay.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMetricsAfterResetReplay', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(24, 3, UNKNOWN_CODE_TWO);
      runPlan(client, codes);
      const before = StubMetrics.from(stub);
      expect(before.requests).assertEqual(24);
      expect(before.handled).assertEqual(16);
      stub.reset();
      runPlan(client, codes);
      const after = StubMetrics.from(stub);
      expect(after.fingerprint()).assertEqual(before.fingerprint());
      expect(after.requests).assertEqual(24);
      expect(after.successRatio()).assertEqual(2 / 3);
      expect(stub.requestCount()).assertEqual(24);
    });

    /**
     * @tc.name          throughputProfileTenRoundProfile
     * @tc.desc          Ten rounds of ten sends produce a hundred handled requests.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Run ten rounds of sendMany ten.
     *                   2. Build metrics.
     *                   3. Verify the total and fingerprint.
     * @tc.expected      One hundred handled with the 100:100:0:100 fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileTenRoundProfile', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let rounds = 0;
      for (let round = 0; round < 10; round++) {
        if (client.sendMany(10) === 10) {
          rounds = rounds + 1;
        }
      }
      const metrics = StubMetrics.from(stub);
      expect(rounds).assertEqual(10);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('100:100:0:100'));
      expect(client.results.length).assertEqual(100);
      expect(stub.requests[99].text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          throughputProfileDenseUniquePayloadProfile
     * @tc.desc          Unique payloads do not change the throughput profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send one hundred unique payloads.
     *                   2. Build metrics.
     *                   3. Read all distinct payloads from the ledger.
     * @tc.expected      Counters read one hundred and one hundred distinct payloads exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileDenseUniquePayloadProfile', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 100; index++) {
        client.send(REQUEST_CODE, 'unique-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      const distinct: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        const text = stub.requests[index].text;
        if (distinct.indexOf(text) < 0) {
          distinct.push(text);
        }
      }
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(distinct.length).assertEqual(100);
      expect(distinct[0]).assertEqual('unique-0');
      expect(distinct[99]).assertEqual('unique-99');
      expect(metrics.fingerprint()).assertEqual(textFingerprint('100:100:0:100'));
    });

    /**
     * @tc.name          throughputProfileLedgerRowCountEqualsSends
     * @tc.desc          Every send contributes exactly one ledger row.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send thirty-seven requests with mixed codes.
     *                   2. Compare the ledger length with the send count.
     *                   3. Build metrics.
     * @tc.expected      The ledger holds thirty-seven rows matching the send count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileLedgerRowCountEqualsSends', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(37, 5, UNKNOWN_CODE_LARGE);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(37);
      expect(stub.requests.length).assertEqual(client.sentCodes.length);
      expect(metrics.requests).assertEqual(37);
      expect(metrics.handled).assertEqual(29);
      expect(metrics.rejected).assertEqual(8);
      expect(client.results.length).assertEqual(37);
    });

    /**
     * @tc.name          throughputProfileRepliesEqualHandledRows
     * @tc.desc          Every handled row carries exactly one reply.
     * @tc.precondition  A mixed plan has run on a stub.
     * @tc.steps         1. Send forty mixed requests.
     *                   2. Count handled rows and reply-bearing rows.
     *                   3. Compare both with the metrics reply counter.
     * @tc.expected      Handled rows, reply rows and the metric all agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRepliesEqualHandledRows', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(40, 8, UNKNOWN_CODE_ZERO);
      runPlan(client, codes);
      let handled = 0;
      let withReply = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        const row = stub.requests[index];
        if (row.handled) {
          handled = handled + 1;
          if (row.replyText.length > 0) {
            withReply = withReply + 1;
          }
        }
      }
      expect(handled).assertEqual(35);
      expect(withReply).assertEqual(35);
      expect(StubMetrics.from(stub).replies).assertEqual(35);
      expect(client.replies.length).assertEqual(35);
      expect(StubMetrics.from(stub).rejected).assertEqual(5);
    });

    /**
     * @tc.name          throughputProfileRejectedRowsHaveNoReply
     * @tc.desc          Rejected rows never carry reply text in the client view.
     * @tc.precondition  A client sends a mix of unknown codes.
     * @tc.steps         1. Send four unknown codes and two valid codes.
     *                   2. Walk the ledger rows.
     *                   3. Check rejected reply text lengths.
     * @tc.expected      All rejected rows have empty reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRejectedRowsHaveNoReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE,
        UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      runPlan(client, codes);
      let rejected = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        const row = stub.requests[index];
        if (!row.handled) {
          rejected = rejected + 1;
          expect(row.replyText).assertEqual('');
        }
      }
      expect(rejected).assertEqual(4);
      expect(stub.requestCount()).assertEqual(6);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(client.results[0].replyText).assertEqual('');
    });

    /**
     * @tc.name          throughputProfileHandledRowsCarryReply
     * @tc.desc          Every handled row carries the production reply literal.
     * @tc.precondition  A valid workload has run.
     * @tc.steps         1. Send twenty valid requests.
     *                   2. Walk the ledger rows.
     *                   3. Compare each reply with the literal.
     * @tc.expected      All twenty rows carry hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileHandledRowsCarryReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(20);
      let matches = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        const row: StubRequestRecord = stub.requests[index];
        expect(row.handled).assertTrue();
        expect(row.replyText).assertEqual(REPLY_PAYLOAD);
        if (row.replyText === REPLY_PAYLOAD) {
          matches = matches + 1;
        }
      }
      expect(matches).assertEqual(20);
      expect(StubMetrics.from(stub).replies).assertEqual(20);
      expect(stub.requestCount()).assertEqual(20);
    });

    /**
     * @tc.name          throughputProfilePairRunRatio
     * @tc.desc          One valid and one invalid request produce a half ratio.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send one valid and one invalid request.
     *                   2. Build metrics.
     *                   3. Compare each counter.
     * @tc.expected      Requests two, handled one, rejected one, ratio 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('throughputProfilePairRunRatio', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'valid');
      client.send(UNKNOWN_CODE_ZERO, 'invalid');
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('2:1:1:1'));
    });

    /**
     * @tc.name          throughputProfileFingerprintSensitivityToHandled
     * @tc.desc          A different handled count changes the metric fingerprint.
     * @tc.precondition  Two stubs receive equal request counts with different outcomes.
     * @tc.steps         1. Handle all requests on the first stub.
     *                   2. Reject one request on the second.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFingerprintSensitivityToHandled', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      firstClient.sendMany(5);
      secondClient.sendMany(5);
      expect(StubMetrics.from(firstStub).handled).assertEqual(5);
      secondStub.rejectCodes = [REQUEST_CODE];
      secondClient.send(REQUEST_CODE);
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.fingerprint() === secondMetrics.fingerprint()).assertFalse();
      expect(secondMetrics.requests).assertEqual(6);
      expect(secondMetrics.handled).assertEqual(5);
      expect(secondMetrics.rejected).assertEqual(1);
    });

    /**
     * @tc.name          throughputProfileFingerprintSensitivityToRequests
     * @tc.desc          An extra request changes the fingerprint even with equal successes.
     * @tc.precondition  Two stubs receive different request totals.
     * @tc.steps         1. Send four requests to the first stub.
     *                   2. Send five to the second.
     *                   3. Compare fingerprints.
     * @tc.expected      Both have full ratios but different fingerprints.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFingerprintSensitivityToRequests', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      firstClient.sendMany(4);
      secondClient.sendMany(5);
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.successRatio()).assertEqual(1);
      expect(secondMetrics.successRatio()).assertEqual(1);
      expect(firstMetrics.requests).assertEqual(4);
      expect(secondMetrics.requests).assertEqual(5);
      expect(firstMetrics.fingerprint() === secondMetrics.fingerprint()).assertFalse();
      expect(secondMetrics.replies).assertEqual(5);
    });

    /**
     * @tc.name          throughputProfileClientBatchCountsMatch
     * @tc.desc          Three client batches sum exactly to the shared profile.
     * @tc.precondition  Three clients share one stub.
     * @tc.steps         1. Send batches of seven, ten and thirteen.
     *                   2. Sum the client reply counts.
     *                   3. Compare with the stub metrics.
     * @tc.expected      Client replies sum to thirty and match the ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileClientBatchCountsMatch', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      const third = new InProcessClient(stub);
      first.sendMany(7);
      second.sendMany(10);
      third.sendMany(13);
      const clientTotal = first.replies.length + second.replies.length + third.replies.length;
      const metrics = StubMetrics.from(stub);
      expect(clientTotal).assertEqual(30);
      expect(metrics.requests).assertEqual(30);
      expect(metrics.replies).assertEqual(30);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('30:30:0:30'));
      expect(stub.requestCount()).assertEqual(30);
    });

    /**
     * @tc.name          throughputProfileTwoStubCombinedTotals
     * @tc.desc          Two stub profiles combine into the expected aggregate.
     * @tc.precondition  Two stubs receive different volumes.
     * @tc.steps         1. Send twelve requests to the first stub.
     *                   2. Send eight to the second.
     *                   3. Sum both metric sets.
     * @tc.expected      Combined requests and handled counts read twenty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileTwoStubCombinedTotals', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      new InProcessClient(firstStub).sendMany(12);
      new InProcessClient(secondStub).sendMany(8);
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.requests + secondMetrics.requests).assertEqual(20);
      expect(firstMetrics.handled + secondMetrics.handled).assertEqual(20);
      expect(firstMetrics.replies + secondMetrics.replies).assertEqual(20);
      expect(firstMetrics.rejected + secondMetrics.rejected).assertEqual(0);
      expect(firstMetrics.requests).assertEqual(12);
      expect(secondMetrics.requests).assertEqual(8);
    });

    /**
     * @tc.name          throughputProfileHundredClientsSingleSends
     * @tc.desc          One hundred clients with one send each produce a hundred rows.
     * @tc.precondition  A shared stub is available.
     * @tc.steps         1. Send once from each of one hundred clients.
     *                   2. Build metrics.
     *                   3. Verify the profile fingerprint.
     * @tc.expected      One hundred handled with the saturated fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileHundredClientsSingleSends', 0, () => {
      const stub = new StubRemoteObjectModel();
      for (let index = 0; index < 100; index++) {
        new InProcessClient(stub).send(REQUEST_CODE, 'single-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('100:100:0:100'));
      expect(stub.requests[0].text).assertEqual('single-0');
      expect(stub.requests[99].text).assertEqual('single-99');
    });

    /**
     * @tc.name          throughputProfileMixedScaleProfile
     * @tc.desc          A three-hundred-request mix with twenty percent rejects profiles exactly.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Reject every fifth request.
     *                   2. Build metrics.
     *                   3. Compare the fingerprint.
     * @tc.expected      Two hundred forty handled and sixty rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMixedScaleProfile', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(300, 5, UNKNOWN_CODE_TWO);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(300);
      expect(metrics.handled).assertEqual(240);
      expect(metrics.rejected).assertEqual(60);
      expect(metrics.replies).assertEqual(240);
      expect(metrics.successRatio()).assertEqual(0.8);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('300:240:60:240'));
    });

    /**
     * @tc.name          throughputProfileServiceRequestCountIndependence
     * @tc.desc          Service request counters stay independent from stub throughput.
     * @tc.precondition  A service is connected with a traffic-bearing stub.
     * @tc.steps         1. Call onRequest five times.
     *                   2. Send thirty stub requests.
     *                   3. Compare service and stub counters.
     * @tc.expected      Service requests read five while the stub reports thirty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileServiceRequestCountIndependence', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 5; index++) {
        service.onRequest(index + 1);
      }
      const stub = service.onConnect();
      new InProcessClient(stub).sendMany(30);
      expect(service.requestCount).assertEqual(5);
      expect(service.connectCount).assertEqual(1);
      expect(stub.requestCount()).assertEqual(30);
      expect(StubMetrics.from(stub).requests).assertEqual(30);
      expect(StubMetrics.from(stub).handled).assertEqual(30);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          throughputProfileLogDoesNotAffectThroughput
     * @tc.desc          Writing logs leaves the stub throughput profile unchanged.
     * @tc.precondition  Two runs are performed, one with logging.
     * @tc.steps         1. Run fifty requests without logging.
     *                   2. Run fifty with service logging active.
     *                   3. Compare fingerprints.
     * @tc.expected      Both runs share the same metric fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileLogDoesNotAffectThroughput', 0, () => {
      const quietStub = new StubRemoteObjectModel();
      new InProcessClient(quietStub).sendMany(50);
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 50; index++) {
        service.onRequest(index + 1);
      }
      const busyStub = service.onConnect();
      new InProcessClient(busyStub).sendMany(50);
      expect(StubMetrics.from(quietStub).fingerprint()).assertEqual(StubMetrics.from(busyStub).fingerprint());
      expect(StubMetrics.from(busyStub).handled).assertEqual(50);
      expect(service.logs.size()).assertEqual(52);
      expect(service.events.size()).assertEqual(52);
      expect(busyStub.requestCount()).assertEqual(50);
    });

    /**
     * @tc.name          throughputProfileMetricsRecountConsistency
     * @tc.desc          A manual recount of the ledger matches every metric field.
     * @tc.precondition  A fifty-request mixed plan has run.
     * @tc.steps         1. Send fifty mixed requests.
     *                   2. Recount handled and rejected rows.
     *                   3. Compare with the metric object.
     * @tc.expected      All counters reconcile without drift.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileMetricsRecountConsistency', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(50, 5, UNKNOWN_CODE_NEGATIVE);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      const handled = ledgerHandled(stub);
      const rejected = stub.requestCount() - handled;
      expect(metrics.handled).assertEqual(handled);
      expect(metrics.rejected).assertEqual(rejected);
      expect(metrics.replies).assertEqual(handled);
      expect(metrics.requests).assertEqual(handled + rejected);
      expect(metrics.successRatio()).assertEqual(40 / 50);
      expect(metrics.requests).assertEqual(50);
    });

    /**
     * @tc.name          throughputProfileRowOrderPreserved
     * @tc.desc          Ledger payload order follows the exact send order.
     * @tc.precondition  A client sends an indexed payload series.
     * @tc.steps         1. Send eighty indexed payloads.
     *                   2. Rebuild the payload list from the ledger.
     *                   3. Compare the joined literals.
     * @tc.expected      The rebuilt order matches the original exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRowOrderPreserved', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const originals: string[] = [];
      for (let index = 0; index < 80; index++) {
        const payload = 'ordered-' + String(index);
        originals.push(payload);
        client.send(REQUEST_CODE, payload);
      }
      const rebuilt: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        rebuilt.push(stub.requests[index].text);
      }
      expect(joined(rebuilt, ',')).assertEqual(joined(originals, ','));
      expect(rebuilt.length).assertEqual(80);
      expect(rebuilt[0]).assertEqual('ordered-0');
      expect(rebuilt[79]).assertEqual('ordered-79');
      expect(textFingerprint(joined(rebuilt, ','))).assertEqual(textFingerprint(joined(originals, ',')));
    });

    /**
     * @tc.name          throughputProfileRepeatedSamePayloadCounts
     * @tc.desc          Forty identical payloads each count as one handled request.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send the same payload forty times.
     *                   2. Build metrics.
     *                   3. Count occurrences in the ledger.
     * @tc.expected      Forty rows carry the same payload and forty requests are handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileRepeatedSamePayloadCounts', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 40; index++) {
        client.send(REQUEST_CODE, 'same-payload');
      }
      const texts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        texts.push(stub.requests[index].text);
      }
      const metrics = StubMetrics.from(stub);
      expect(texts.length).assertEqual(40);
      expect(countOf(texts, 'same-payload')).assertEqual(40);
      expect(metrics.requests).assertEqual(40);
      expect(metrics.replies).assertEqual(40);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('40:40:0:40'));
    });

    /**
     * @tc.name          throughputProfileThirtyTwoRoundProfile
     * @tc.desc          Four rounds across thirty-two clients yield one hundred twenty-eight rows.
     * @tc.precondition  Thirty-two clients share one stub.
     * @tc.steps         1. Send once per client per round for four rounds.
     *                   2. Build metrics.
     *                   3. Verify the profile count.
     * @tc.expected      One hundred twenty-eight handled requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileThirtyTwoRoundProfile', 0, () => {
      const stub = new StubRemoteObjectModel();
      const clients: InProcessClient[] = [];
      for (let index = 0; index < 32; index++) {
        clients.push(new InProcessClient(stub));
      }
      for (let round = 0; round < 4; round++) {
        for (let index = 0; index < clients.length; index++) {
          clients[index].send(REQUEST_CODE, 'c' + String(index));
        }
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(128);
      expect(metrics.handled).assertEqual(128);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('128:128:0:128'));
      expect(stub.requestCount()).assertEqual(128);
      expect(clients[0].replies.length).assertEqual(4);
      expect(clients[31].replies.length).assertEqual(4);
    });

    /**
     * @tc.name          throughputProfileFiveHundredMixedProfile
     * @tc.desc          A five-hundred-request ten-percent-reject profile is exact.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Reject every tenth request.
     *                   2. Build metrics.
     *                   3. Compare every counter.
     * @tc.expected      Four hundred fifty handled and fifty rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFiveHundredMixedProfile', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes = patternCodes(500, 10, UNKNOWN_CODE_LARGE);
      runPlan(client, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(500);
      expect(metrics.handled).assertEqual(450);
      expect(metrics.rejected).assertEqual(50);
      expect(metrics.replies).assertEqual(450);
      expect(metrics.successRatio()).assertEqual(0.9);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('500:450:50:450'));
    });

    /**
     * @tc.name          throughputProfileFingerprintDeterministicAcrossRuns
     * @tc.desc          Three identical runs produce one metric fingerprint.
     * @tc.precondition  Three stubs are prepared.
     * @tc.steps         1. Run the same mixed plan on each stub.
     *                   2. Build all three metrics.
     *                   3. Compare fingerprints pairwise.
     * @tc.expected      All three fingerprints match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFingerprintDeterministicAcrossRuns', 0, () => {
      const codes = patternCodes(36, 6, UNKNOWN_CODE_ZERO);
      const fingerprints: number[] = [];
      for (let run = 0; run < 3; run++) {
        const stub = new StubRemoteObjectModel();
        const client = new InProcessClient(stub);
        runPlan(client, codes);
        fingerprints.push(StubMetrics.from(stub).fingerprint());
      }
      expect(fingerprints.length).assertEqual(3);
      expect(fingerprints[0]).assertEqual(fingerprints[1]);
      expect(fingerprints[1]).assertEqual(fingerprints[2]);
      expect(fingerprints[0]).assertEqual(textFingerprint('36:30:6:30'));
      expect(StubMetrics.from(new StubRemoteObjectModel()).fingerprint())
        .assertEqual(textFingerprint('0:0:0:0'));
    });

    /**
     * @tc.name          throughputProfileZeroRepliesAfterAllRejects
     * @tc.desc          A reject-only run never increments the reply counter.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send seventy-five unknown codes.
     *                   2. Build metrics.
     *                   3. Check the reply and ratio fields.
     * @tc.expected      Zero replies and zero ratio with seventy-five rejects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileZeroRepliesAfterAllRejects', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(75, UNKNOWN_CODE_TWO);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(75);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(75);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          throughputProfileOptionMixProfileFingerprint
     * @tc.desc          Mixed option usage contributes to one combined profile.
     * @tc.precondition  A stub is driven directly and through a client.
     * @tc.steps         1. Send three direct requests with differing options.
     *                   2. Send five client requests.
     *                   3. Build the combined metrics.
     * @tc.expected      Eight requests are handled with a saturated fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileOptionMixProfileFingerprint', 0, () => {
      const stub = new StubRemoteObjectModel();
      const options: MessageOptionModel[] = [
        new MessageOptionModel(OPTION_FLAG_SYNC, 0, false),
        new MessageOptionModel(OPTION_FLAG_ASYNC, 15, false),
        new MessageOptionModel(OPTION_FLAG_SYNC, 9, true)
      ];
      for (let index = 0; index < options.length; index++) {
        const data = MessageSequenceModel.create();
        data.writeString('direct-' + String(index));
        stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), options[index]);
      }
      new InProcessClient(stub).sendMany(5);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(8);
      expect(metrics.handled).assertEqual(8);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('8:8:0:8'));
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/15/false');
    });

    /**
     * @tc.name          throughputProfileKillReviveProfile
     * @tc.desc          A kill and revive cycle yields a half success profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send ten requests while dead.
     *                   2. Revive and send ten more.
     *                   3. Build metrics.
     * @tc.expected      Twenty requests, ten handled, ten rejected and ratio 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileKillReviveProfile', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      client.sendMany(10);
      stub.revive();
      client.sendMany(10);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(20);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(10);
      expect(metrics.replies).assertEqual(10);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('20:10:10:10'));
    });

    /**
     * @tc.name          throughputProfileFinalAudit
     * @tc.desc          Five clients with mixed codes reconcile with the shared profile.
     * @tc.precondition  Five clients share one stub.
     * @tc.steps         1. Send twenty requests from each client with mixed codes.
     *                   2. Build metrics.
     *                   3. Reconcile totals and fingerprints.
     * @tc.expected      One hundred requests, seventy-five handled and twenty-five rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileFinalAudit', 0, () => {
      const stub = new StubRemoteObjectModel();
      let clientReplies = 0;
      for (let index = 0; index < 5; index++) {
        const client = new InProcessClient(stub);
        const codes = patternCodes(20, 4, UNKNOWN_CODE_ZERO);
        runPlan(client, codes);
        clientReplies = clientReplies + client.replies.length;
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(75);
      expect(metrics.rejected).assertEqual(25);
      expect(clientReplies).assertEqual(75);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('100:75:25:75'));
    });

    /**
     * @tc.name          throughputProfileSingleClientRepeatability
     * @tc.desc          Repeated single-client batches keep an additive profile.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send four batches of twelve requests.
     *                   2. Read metrics after each batch.
     *                   3. Confirm the increments are equal.
     * @tc.expected      The request counter grows by twelve per batch to forty-eight.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('throughputProfileSingleClientRepeatability', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const increments: number[] = [];
      let previous = 0;
      for (let batch = 0; batch < 4; batch++) {
        client.sendMany(12);
        const current = StubMetrics.from(stub).requests;
        increments.push(current - previous);
        previous = current;
      }
      const incrementTexts: string[] = [];
      for (let index = 0; index < increments.length; index++) {
        incrementTexts.push(String(increments[index]));
      }
      expect(increments.length).assertEqual(4);
      expect(countOf(incrementTexts, '12')).assertEqual(4);
      expect(previous).assertEqual(48);
      expect(StubMetrics.from(stub).handled).assertEqual(48);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
      expect(client.replies.length).assertEqual(48);
      expect(stub.requestCount()).assertEqual(48);
    });
  });
}
