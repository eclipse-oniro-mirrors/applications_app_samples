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
  STUB_DESCRIPTOR,
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
  textFingerprint,
  expectedHandled,
  expectedReplyFor,
  isKnownRequestCode
} from '../Shared/SharedDriver';

export default function concurrencyControl(): void {
  describe('PerformanceStabilityConcurrencyControl', () => {
    beforeAll(() => {
      logSuite('PerformanceStabilityConcurrencyControl', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PerformanceStabilityConcurrencyControl', 'end');
    });

    /**
     * @tc.name          concurrencyControlInterleavedClientsKeepReplyOwnership
     * @tc.desc          Two clients alternating on one stub keep their own reply lists.
     * @tc.precondition  A fresh stub and two independent clients exist.
     * @tc.steps         1. Send from alpha.
     *                   2. Send from beta.
     *                   3. Send from alpha again.
     * @tc.expected      Each client records only its own replies while the stub sees all three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlInterleavedClientsKeepReplyOwnership', 0, () => {
      const stub = new StubRemoteObjectModel();
      const alpha = new InProcessClient(stub);
      const beta = new InProcessClient(stub);
      const first = alpha.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const second = beta.send(REQUEST_CODE, 'beta payload');
      const third = alpha.send(REQUEST_CODE, 'alpha payload');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(third.replyText).assertEqual(REPLY_PAYLOAD);
      expect(alpha.replies.length).assertEqual(2);
      expect(beta.replies.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(3);
      expect(alpha.sentTexts[1]).assertEqual('alpha payload');
      expect(beta.sentTexts[0]).assertEqual('beta payload');
    });

    /**
     * @tc.name          concurrencyControlTwoClientsShareOneStubLedger
     * @tc.desc          A shared stub appends one ledger record per client request.
     * @tc.precondition  A fresh stub is shared by a left and a right client.
     * @tc.steps         1. Send a handled request from the left client.
     *                   2. Send an unknown code from the right client.
     *                   3. Send one more request from each client.
     * @tc.expected      The ledger keeps four ordered records with correct handled flags.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlTwoClientsShareOneStubLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const left = new InProcessClient(stub);
      const right = new InProcessClient(stub);
      left.send(REQUEST_CODE, 'left-1');
      right.send(UNKNOWN_CODE_TWO, 'right-1');
      left.send(REQUEST_CODE, 'left-2');
      right.send(REQUEST_CODE, 'right-2');
      const ledger: StubRequestRecord[] = stub.requests;
      expect(ledger.length).assertEqual(4);
      expect(ledger[0].text).assertEqual('left-1');
      expect(ledger[1].handled).assertFalse();
      expect(ledger[2].text).assertEqual('left-2');
      expect(ledger[3].text).assertEqual('right-2');
      expect(left.replies.length).assertEqual(2);
      expect(right.replies.length).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual('right-2');
    });

    /**
     * @tc.name          concurrencyControlRoundRobinAlternationIsOrdered
     * @tc.desc          Alternating clients append ledger entries in send order.
     * @tc.precondition  Two clients are bound to the same live stub.
     * @tc.steps         1. Alternate four sends a1, b1, a2, b2.
     *                   2. Read the ledger texts in order.
     *                   3. Compare the joined ledger with the expected sequence.
     * @tc.expected      The ledger reads a1,b1,a2,b2 with no reordering.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlRoundRobinAlternationIsOrdered', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.send(REQUEST_CODE, 'a1');
      second.send(REQUEST_CODE, 'b1');
      first.send(REQUEST_CODE, 'a2');
      second.send(REQUEST_CODE, 'b2');
      const texts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        texts.push(stub.requests[index].text);
      }
      expect(joined(texts, ',')).assertEqual('a1,b1,a2,b2');
      expect(texts.length).assertEqual(4);
      expect(countOf(texts, 'a1')).assertEqual(1);
      expect(countOf(texts, 'b1')).assertEqual(1);
      expect(first.sentTexts[0]).assertEqual('a1');
      expect(second.sentTexts[1]).assertEqual('b2');
    });

    /**
     * @tc.name          concurrencyControlBurstOfMixedCodesCountsOnceEach
     * @tc.desc          A burst of mixed codes yields one ledger entry per send.
     * @tc.precondition  A stub and a single client are prepared.
     * @tc.steps         1. Send five alternating codes.
     *                   2. Count handled results.
     *                   3. Count ledger records.
     * @tc.expected      Three handled results and five ledger records.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlBurstOfMixedCodesCountsOnceEach', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE];
      let handled = 0;
      for (let index = 0; index < codes.length; index++) {
        if (client.send(codes[index], REQUEST_PAYLOAD).isSuccess()) {
          handled = handled + 1;
        }
      }
      expect(handled).assertEqual(3);
      expect(stub.requestCount()).assertEqual(5);
      expect(client.replies.length).assertEqual(3);
      expect(client.sentCodes.length).assertEqual(5);
      expect(expectedHandled(codes[1])).assertFalse();
      expect(client.results[1].errCode).assertEqual(ERROR_STUB_REJECTED);
    });

    /**
     * @tc.name          concurrencyControlThreeClientsKeepSeparateReplyTraces
     * @tc.desc          Three clients record disjoint reply traces over one stub.
     * @tc.precondition  A shared stub and three clients are created.
     * @tc.steps         1. Give each client a distinct payload.
     *                   2. Join each client trace.
     *                   3. Compare traces with the expected literals.
     * @tc.expected      Every client trace contains only its own two replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlThreeClientsKeepSeparateReplyTraces', 0, () => {
      const stub = new StubRemoteObjectModel();
      const red = new InProcessClient(stub);
      const green = new InProcessClient(stub);
      const blue = new InProcessClient(stub);
      red.send(REQUEST_CODE, 'red-1');
      green.send(REQUEST_CODE, 'green-1');
      blue.send(REQUEST_CODE, 'blue-1');
      red.send(REQUEST_CODE, 'red-2');
      green.send(REQUEST_CODE, 'green-2');
      blue.send(REQUEST_CODE, 'blue-2');
      expect(red.trace()).assertEqual(REPLY_PAYLOAD + '|' + REPLY_PAYLOAD);
      expect(green.trace()).assertEqual(REPLY_PAYLOAD + '|' + REPLY_PAYLOAD);
      expect(blue.trace()).assertEqual(REPLY_PAYLOAD + '|' + REPLY_PAYLOAD);
      expect(red.sentTexts.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(6);
      expect(red.replies[0]).assertEqual(expectedReplyFor(REQUEST_CODE));
    });

    /**
     * @tc.name          concurrencyControlPayloadsStayPairedWithTheirCodes
     * @tc.desc          Each recorded ledger row keeps the payload of its own send.
     * @tc.precondition  One client sends payloads whose text encodes their index.
     * @tc.steps         1. Send four distinct payloads.
     *                   2. Read each ledger row text.
     *                   3. Verify the row order matches the send order.
     * @tc.expected      Ledger rows read alpha,bravo,charlie,delta in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlPayloadsStayPairedWithTheirCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const payloads: string[] = ['alpha', 'bravo', 'charlie', 'delta'];
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const rows: StubRequestRecord[] = stub.requests;
      expect(rows.length).assertEqual(4);
      expect(rows[0].text).assertEqual('alpha');
      expect(rows[1].text).assertEqual('bravo');
      expect(rows[2].text).assertEqual('charlie');
      expect(rows[3].text).assertEqual('delta');
      expect(rows[0].code).assertEqual(REQUEST_CODE);
      expect(rows[3].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          concurrencyControlRejectedCodeDoesNotConsumePeerReply
     * @tc.desc          A rejected send on one client leaves the peer reply stream intact.
     * @tc.precondition  A stub is shared by a probe client and a worker client.
     * @tc.steps         1. Send one handled request from the worker.
     *                   2. Send an unknown code from the probe.
     *                   3. Send a handled request from the probe.
     * @tc.expected      Only the valid probe send produces a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlRejectedCodeDoesNotConsumePeerReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const probe = new InProcessClient(stub);
      const worker = new InProcessClient(stub);
      worker.send(REQUEST_CODE, 'worker-1');
      const rejected = probe.send(UNKNOWN_CODE_NEGATIVE, 'probe-1');
      const accepted = probe.send(REQUEST_CODE, 'probe-2');
      expect(rejected.isSuccess()).assertFalse();
      expect(rejected.replyText).assertEqual('');
      expect(accepted.replyText).assertEqual(REPLY_PAYLOAD);
      expect(probe.replies.length).assertEqual(1);
      expect(worker.replies.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[1].handled).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlStubKilledMidBatchStopsLaterHandling
     * @tc.desc          Killing a stub between sends rejects the in-flight window only.
     * @tc.precondition  A client has already completed one request.
     * @tc.steps         1. Send before the kill.
     *                   2. Kill the stub and send again.
     *                   3. Revive and send a final request.
     * @tc.expected      The middle request fails, the last request succeeds again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlStubKilledMidBatchStopsLaterHandling', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const before = client.send(REQUEST_CODE, 'before');
      stub.kill();
      const during = client.send(REQUEST_CODE, 'during');
      stub.revive();
      const after = client.send(REQUEST_CODE, 'after');
      expect(before.isSuccess()).assertTrue();
      expect(during.isSuccess()).assertFalse();
      expect(during.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(after.isSuccess()).assertTrue();
      expect(stub.alive).assertTrue();
      expect(client.sentCodes.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[1].text).assertEqual('');
    });

    /**
     * @tc.name          concurrencyControlRepeatedKillReviveKeepsServing
     * @tc.desc          Repeated kill and revive cycles do not corrupt the stub.
     * @tc.precondition  A stub and client are freshly constructed.
     * @tc.steps         1. Kill and revive the stub twice.
     *                   2. Send two valid requests.
     *                   3. Inspect the descriptor and alive flag.
     * @tc.expected      Both requests succeed and the descriptor is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlRepeatedKillReviveKeepsServing', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      stub.kill();
      stub.revive();
      stub.kill();
      stub.revive();
      const first = client.send(REQUEST_CODE, 'cycle-1');
      const second = client.send(REQUEST_CODE, 'cycle-2');
      expect(first.isSuccess()).assertTrue();
      expect(second.isSuccess()).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.alive).assertTrue();
      expect(client.replies.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlUnknownCodesLeaveEmptyReplies
     * @tc.desc          Every unknown code is rejected with an empty reply text.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send four distinct unknown codes.
     *                   2. Inspect each result and reply list.
     *                   3. Check the client trace literal.
     * @tc.expected      No replies are recorded and the trace is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlUnknownCodesLeaveEmptyReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      for (let index = 0; index < codes.length; index++) {
        const result = client.send(codes[index], REQUEST_PAYLOAD);
        expect(result.isSuccess()).assertFalse();
        expect(result.replyText).assertEqual('');
      }
      expect(client.replies.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(4);
      expect(client.trace()).assertEqual('');
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlPerRequestOptionIsRecordedIndependently
     * @tc.desc          Each request row stores the option supplied for that call.
     * @tc.precondition  A stub and two message sequences are available.
     * @tc.steps         1. Send with a sync option.
     *                   2. Send with an async option.
     *                   3. Compare recorded option strings.
     * @tc.expected      Rows read 0/0/true and 1/5/false respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlPerRequestOptionIsRecordedIndependently', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('opt');
      const syncOption = new MessageOptionModel(OPTION_FLAG_SYNC, 0, true);
      const asyncOption = new MessageOptionModel(OPTION_FLAG_ASYNC, 5, false);
      expect(syncOption.isSync()).assertTrue();
      expect(asyncOption.isSync()).assertFalse();
      expect(stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, syncOption)).assertTrue();
      expect(stub.requests[0].option).assertEqual('0/0/true');
      expect(stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, asyncOption)).assertTrue();
      expect(stub.requests[1].option).assertEqual('1/5/false');
      expect(stub.requests[1].text).assertEqual('');
      expect(reply.size()).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlMetricsAfterInterleavingMatchLedger
     * @tc.desc          Aggregate metrics equal a manual recount of the shared ledger.
     * @tc.precondition  Two clients have produced a mixed workload.
     * @tc.steps         1. Send three valid, one unknown, two valid, one valid.
     *                   2. Build metrics from the stub.
     *                   3. Compare every counter with the ledger.
     * @tc.expected      Seven requests, six handled, one rejected, six replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlMetricsAfterInterleavingMatchLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.sendMany(3);
      second.send(UNKNOWN_CODE_ZERO);
      second.sendMany(2);
      first.send(REQUEST_CODE, 'tail');
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(7);
      expect(metrics.handled).assertEqual(6);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertEqual(6);
      expect(metrics.successRatio()).assertEqual(6 / 7);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('7:6:1:6'));
    });

    /**
     * @tc.name          concurrencyControlAlternatingSuccessAndRejectRatios
     * @tc.desc          A known alternating pattern yields a 0.6 success ratio.
     * @tc.precondition  One client sends a ten-entry code plan.
     * @tc.steps         1. Replay the plan on a fresh stub.
     *                   2. Read the aggregate metrics.
     *                   3. Compare the ratio with the arithmetic oracle.
     * @tc.expected      Six handled, four rejected and ratio 0.6.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlAlternatingSuccessAndRejectRatios', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [
        REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_TWO,
        REQUEST_CODE, UNKNOWN_CODE_NEGATIVE, REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_LARGE
      ];
      const replay = replayCodes(stub, codes);
      const metrics = StubMetrics.from(stub);
      expect(replay.results.length).assertEqual(10);
      expect(metrics.requests).assertEqual(10);
      expect(metrics.handled).assertEqual(6);
      expect(metrics.rejected).assertEqual(4);
      expect(metrics.successRatio()).assertEqual(0.6);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          concurrencyControlSharedStubResetBetweenClientWaves
     * @tc.desc          Resetting a shared stub clears the ledger between waves.
     * @tc.precondition  Two clients completed a first wave of traffic.
     * @tc.steps         1. Reset the stub.
     *                   2. Send a second wave from both clients.
     *                   3. Inspect the new ledger and metrics.
     * @tc.expected      The ledger holds only the second wave and counts restart.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlSharedStubResetBetweenClientWaves', 0, () => {
      const stub = new StubRemoteObjectModel();
      const left = new InProcessClient(stub);
      const right = new InProcessClient(stub);
      left.sendMany(2);
      right.sendMany(2);
      expect(stub.requestCount()).assertEqual(4);
      stub.reset();
      const afterLeft = left.send(REQUEST_CODE, 'wave-2-left');
      const afterRight = right.send(REQUEST_CODE, 'wave-2-right');
      expect(afterLeft.isSuccess()).assertTrue();
      expect(afterRight.isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('wave-2-left');
      expect(stub.requests[1].text).assertEqual('wave-2-right');
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          concurrencyControlAlternatingClientsPreserveSentCodes
     * @tc.desc          Each client keeps the code sequence it personally sent.
     * @tc.precondition  Two clients alternate valid and unknown codes.
     * @tc.steps         1. Alternate five sends.
     *                   2. Join each client code list.
     *                   3. Compare with the expected literals.
     * @tc.expected      The first client reads 1,0,1 and the second reads 1,1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlAlternatingClientsPreserveSentCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.send(REQUEST_CODE);
      second.send(REQUEST_CODE);
      first.send(UNKNOWN_CODE_ZERO);
      first.send(REQUEST_CODE);
      second.send(REQUEST_CODE);
      const firstCodes: string[] = [];
      for (let index = 0; index < first.sentCodes.length; index++) {
        firstCodes.push(String(first.sentCodes[index]));
      }
      const secondCodes: string[] = [];
      for (let index = 0; index < second.sentCodes.length; index++) {
        secondCodes.push(String(second.sentCodes[index]));
      }
      expect(joined(firstCodes, ',')).assertEqual('1,0,1');
      expect(joined(secondCodes, ',')).assertEqual('1,1');
      expect(first.results[1].isSuccess()).assertFalse();
      expect(second.results[0].isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(5);
    });

    /**
     * @tc.name          concurrencyControlFiftyRequestsSharedLedgerLength
     * @tc.desc          A fifty-request batch yields fifty ledger records.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send fifty valid requests.
     *                   2. Read the ledger length and metrics.
     *                   3. Inspect first and last rows.
     * @tc.expected      Counts reach fifty and the last payload is the default literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlFiftyRequestsSharedLedgerLength', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(50);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(50);
      expect(stub.requestCount()).assertEqual(50);
      expect(client.replies.length).assertEqual(50);
      expect(client.results.length).assertEqual(50);
      expect(metrics.replies).assertEqual(50);
      expect(stub.requests[49].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlRejectListBlocksOnlyListedCodes
     * @tc.desc          The stub reject list suppresses exactly the listed codes.
     * @tc.precondition  A stub with a populated reject list exists.
     * @tc.steps         1. Reject code 1 and an unknown code.
     *                   2. Send both codes.
     *                   3. Shrink the list and send code 1 again.
     * @tc.expected      Only the final send is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlRejectListBlocksOnlyListedCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes = [REQUEST_CODE, UNKNOWN_CODE_TWO];
      const blockedOne = client.send(REQUEST_CODE);
      const blockedTwo = client.send(UNKNOWN_CODE_TWO);
      expect(blockedOne.isSuccess()).assertFalse();
      expect(blockedTwo.isSuccess()).assertFalse();
      expect(stub.requestCount()).assertEqual(2);
      stub.rejectCodes = [UNKNOWN_CODE_TWO];
      const allowed = client.send(REQUEST_CODE);
      expect(allowed.isSuccess()).assertTrue();
      expect(allowed.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[2].handled).assertTrue();
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlCustomReplyTextAppliesToAllClients
     * @tc.desc          A customized stub reply is returned to every client.
     * @tc.precondition  A shared stub has its reply text overridden.
     * @tc.steps         1. Set the reply to custom-rpc.
     *                   2. Send from two clients.
     *                   3. Compare reply traces.
     * @tc.expected      Both clients observe custom-rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlCustomReplyTextAppliesToAllClients', 0, () => {
      const stub = new StubRemoteObjectModel();
      const alpha = new InProcessClient(stub);
      const beta = new InProcessClient(stub);
      stub.replyText = 'custom-rpc';
      const first = alpha.send(REQUEST_CODE, 'one');
      const second = beta.send(REQUEST_CODE, 'two');
      const third = alpha.send(REQUEST_CODE, 'three');
      expect(first.replyText).assertEqual('custom-rpc');
      expect(second.replyText).assertEqual('custom-rpc');
      expect(third.replyText).assertEqual('custom-rpc');
      expect(alpha.replies.length).assertEqual(2);
      expect(beta.replies.length).assertEqual(1);
      expect(stub.requests[2].replyText).assertEqual('custom-rpc');
    });

    /**
     * @tc.name          concurrencyControlInterleavedRepliesTraceMatchesLedger
     * @tc.desc          The joined client trace length matches the handled ledger rows.
     * @tc.precondition  Two clients interleave six sends.
     * @tc.steps         1. Alternate six sends.
     *                   2. Join the combined reply trace.
     *                   3. Count separators and compare with metrics.
     * @tc.expected      Six replies appear and five separators join them.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlInterleavedRepliesTraceMatchesLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.send(REQUEST_CODE, 'f1');
      second.send(REQUEST_CODE, 's1');
      first.send(REQUEST_CODE, 'f2');
      second.send(REQUEST_CODE, 's2');
      first.send(REQUEST_CODE, 'f3');
      second.send(REQUEST_CODE, 's3');
      const combined = first.trace() + '|' + second.trace();
      const parts: string[] = combined.split('|');
      const metrics = StubMetrics.from(stub);
      expect(parts.length).assertEqual(6);
      expect(countOf(parts, REPLY_PAYLOAD)).assertEqual(6);
      expect(combined.length).assertEqual(REPLY_PAYLOAD.length * 6 + 5);
      expect(metrics.handled).assertEqual(6);
      expect(metrics.replies).assertEqual(6);
    });

    /**
     * @tc.name          concurrencyControlPerClientBatchCountsIndependent
     * @tc.desc          sendMany counts are scoped to the calling client.
     * @tc.precondition  Two clients share one stub.
     * @tc.steps         1. Send three requests from the first client.
     *                   2. Send four from the second.
     *                   3. Compare each result list with its batch size.
     * @tc.expected      Counts read three and four with seven shared rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlPerClientBatchCountsIndependent', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      const firstHandled = first.sendMany(3);
      const secondHandled = second.sendMany(4);
      expect(firstHandled).assertEqual(3);
      expect(secondHandled).assertEqual(4);
      expect(first.results.length).assertEqual(3);
      expect(second.results.length).assertEqual(4);
      expect(stub.requestCount()).assertEqual(7);
      expect(StubMetrics.from(stub).handled).assertEqual(7);
    });

    /**
     * @tc.name          concurrencyControlUnknownCodeBetweenSuccessesKeepsOrder
     * @tc.desc          An unknown code in the middle does not reorder ledger rows.
     * @tc.precondition  A client sends 1, 0, 1 in that order.
     * @tc.steps         1. Send the three codes.
     *                   2. Join the recorded code column.
     *                   3. Verify handled flags row by row.
     * @tc.expected      The code column reads 1,0,1 with flags true, false, true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlUnknownCodeBetweenSuccessesKeepsOrder', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'first');
      client.send(UNKNOWN_CODE_ZERO, 'middle');
      client.send(REQUEST_CODE, 'last');
      const codes: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        codes.push(String(stub.requests[index].code));
      }
      expect(joined(codes, ',')).assertEqual('1,0,1');
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.requests[2].handled).assertTrue();
      expect(stub.requests[1].replyText).assertEqual('');
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlClientResetClearsSharedLedger
     * @tc.desc          Resetting one client also resets the stub it holds.
     * @tc.precondition  Two clients share a stub that already has traffic.
     * @tc.steps         1. Send from both clients.
     *                   2. Reset the first client.
     *                   3. Inspect the peer view and shared ledger.
     * @tc.expected      The first client is empty, the peer keeps history, the ledger is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlClientResetClearsSharedLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const peer = new InProcessClient(stub);
      first.sendMany(2);
      peer.sendMany(2);
      first.reset();
      expect(first.results.length).assertEqual(0);
      expect(first.replies.length).assertEqual(0);
      expect(first.sentCodes.length).assertEqual(0);
      expect(peer.sentCodes.length).assertEqual(2);
      expect(peer.replies.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlFingerprintIndependentOfClientOrder
     * @tc.desc          Equal request multisets produce equal metric fingerprints.
     * @tc.precondition  Two stubs receive the same multiset in different orders.
     * @tc.steps         1. Drive the first stub with two clients.
     *                   2. Drive the second stub with one client in reverse order.
     *                   3. Compare metric fingerprints.
     * @tc.expected      Fingerprints match although ledger orders differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlFingerprintIndependentOfClientOrder', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const alpha = new InProcessClient(firstStub);
      const beta = new InProcessClient(firstStub);
      alpha.send(REQUEST_CODE);
      beta.send(UNKNOWN_CODE_ZERO);
      alpha.send(REQUEST_CODE);
      const secondStub = new StubRemoteObjectModel();
      const solo = new InProcessClient(secondStub);
      solo.send(UNKNOWN_CODE_ZERO);
      solo.send(REQUEST_CODE);
      solo.send(REQUEST_CODE);
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.successRatio()).assertEqual(2 / 3);
      expect(secondMetrics.successRatio()).assertEqual(2 / 3);
      expect(firstMetrics.requests).assertEqual(3);
      expect(secondMetrics.requests).assertEqual(3);
    });

    /**
     * @tc.name          concurrencyControlDuplicatePayloadsAreNotDeduplicated
     * @tc.desc          Repeated identical payloads still create separate ledger rows.
     * @tc.precondition  A client can send the same payload several times.
     * @tc.steps         1. Send dup five times.
     *                   2. Count ledger rows and distinct payloads.
     *                   3. Compare the reply count.
     * @tc.expected      Five rows, one distinct payload value and five replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDuplicatePayloadsAreNotDeduplicated', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 5; index++) {
        client.send(REQUEST_CODE, 'dup');
      }
      const texts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        texts.push(stub.requests[index].text);
      }
      const distinct: string[] = [];
      for (let index = 0; index < texts.length; index++) {
        if (distinct.indexOf(texts[index]) < 0) {
          distinct.push(texts[index]);
        }
      }
      expect(texts.length).assertEqual(5);
      expect(distinct.length).assertEqual(1);
      expect(distinct[0]).assertEqual('dup');
      expect(stub.requestCount()).assertEqual(5);
      expect(client.replies.length).assertEqual(5);
      expect(StubMetrics.from(stub).replies).assertEqual(5);
    });

    /**
     * @tc.name          concurrencyControlHighVolumeAlternatingRatioHolds
     * @tc.desc          Forty alternating sends keep an exact 0.5 success ratio.
     * @tc.precondition  A stub and a single client are prepared.
     * @tc.steps         1. Send forty alternating codes.
     *                   2. Build aggregate metrics.
     *                   3. Verify handled, rejected and ratio.
     * @tc.expected      Twenty handled, twenty rejected and ratio 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlHighVolumeAlternatingRatioHolds', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 40; index++) {
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO;
        client.send(code, 'payload-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(40);
      expect(metrics.handled).assertEqual(20);
      expect(metrics.rejected).assertEqual(20);
      expect(metrics.replies).assertEqual(20);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.replies.length).assertEqual(20);
      expect(client.results[39].isSuccess()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlLateJoinerSeesOnlyItsOwnReplies
     * @tc.desc          A client created after prior traffic starts with an empty view.
     * @tc.precondition  One client has already sent three requests.
     * @tc.steps         1. Record the pre-existing ledger length.
     *                   2. Create a late client and send once.
     *                   3. Inspect the late client view.
     * @tc.expected      The late client holds exactly one reply and one send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlLateJoinerSeesOnlyItsOwnReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const early = new InProcessClient(stub);
      early.sendMany(3);
      const baseline = stub.requestCount();
      const late = new InProcessClient(stub);
      expect(late.results.length).assertEqual(0);
      expect(late.trace()).assertEqual('');
      const first = late.send(REQUEST_CODE, 'late');
      expect(first.isSuccess()).assertTrue();
      expect(late.results.length).assertEqual(1);
      expect(late.replies.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(baseline + 1);
      expect(early.replies.length).assertEqual(3);
    });

    /**
     * @tc.name          concurrencyControlRequestCodesPreservedInLedger
     * @tc.desc          The ledger stores each raw request code without translation.
     * @tc.precondition  A client sends the four canonical unknown codes and code 1.
     * @tc.steps         1. Send the five codes.
     *                   2. Read the ledger code column.
     *                   3. Compare with the expected literal list.
     * @tc.expected      Codes read 0,2,-1,99,1 in send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlRequestCodesPreservedInLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'code-' + String(codes[index]));
      }
      const ledger: StubRequestRecord[] = stub.requests;
      expect(ledger.length).assertEqual(5);
      expect(ledger[0].code).assertEqual(UNKNOWN_CODE_ZERO);
      expect(ledger[1].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(ledger[2].code).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(ledger[3].code).assertEqual(UNKNOWN_CODE_LARGE);
      expect(ledger[4].code).assertEqual(REQUEST_CODE);
      expect(ledger[4].handled).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlConcurrentConnectYieldsDistinctStubs
     * @tc.desc          Each onConnect call returns an independent stub instance.
     * @tc.precondition  A service lifecycle model is created.
     * @tc.steps         1. Connect twice.
     *                   2. Send traffic through each returned stub.
     *                   3. Compare counts and descriptors.
     * @tc.expected      The two stubs keep separate ledgers with equal descriptors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlConcurrentConnectYieldsDistinctStubs', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const second = service.onConnect();
      const firstClient = new InProcessClient(first);
      const secondClient = new InProcessClient(second);
      firstClient.sendMany(2);
      secondClient.sendMany(3);
      expect(first === second).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(first.requestCount()).assertEqual(2);
      expect(second.requestCount()).assertEqual(3);
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(service.events.countOf('onConnect')).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlSequentialResetCyclesKeepCountsAccurate
     * @tc.desc          Three send-reset cycles leave no residual ledger rows.
     * @tc.precondition  A client and stub are prepared.
     * @tc.steps         1. Send two requests, then reset.
     *                   2. Repeat the cycle twice more.
     *                   3. Verify the final state is empty.
     * @tc.expected      Every cycle reports two rows and every reset reports zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlSequentialResetCyclesKeepCountsAccurate', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let cycle = 0; cycle < 3; cycle++) {
        const handled = client.sendMany(2);
        expect(handled).assertEqual(2);
        expect(stub.requestCount()).assertEqual(2);
        client.reset();
        expect(stub.requestCount()).assertEqual(0);
      }
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          concurrencyControlThirtyTwoClientRoundRobin
     * @tc.desc          Eight clients sending four times each yield thirty-two rows.
     * @tc.precondition  Eight clients share one stub.
     * @tc.steps         1. Round-robin four sends per client.
     *                   2. Sum per-client reply counts.
     *                   3. Compare with the shared ledger.
     * @tc.expected      Each client holds four replies and the stub holds thirty-two rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlThirtyTwoClientRoundRobin', 0, () => {
      const stub = new StubRemoteObjectModel();
      const clients: InProcessClient[] = [];
      for (let index = 0; index < 8; index++) {
        clients.push(new InProcessClient(stub));
      }
      for (let round = 0; round < 4; round++) {
        for (let index = 0; index < clients.length; index++) {
          clients[index].send(REQUEST_CODE, 'c' + String(index) + '-r' + String(round));
        }
      }
      let replies = 0;
      for (let index = 0; index < clients.length; index++) {
        expect(clients[index].replies.length).assertEqual(4);
        replies = replies + clients[index].replies.length;
      }
      expect(replies).assertEqual(32);
      expect(stub.requestCount()).assertEqual(32);
      expect(stub.requests[0].text).assertEqual('c0-r0');
      expect(stub.requests[31].text).assertEqual('c7-r3');
    });

    /**
     * @tc.name          concurrencyControlMixedBatchSuccessAccounting
     * @tc.desc          A mixed batch reports four successes among seven requests.
     * @tc.precondition  A fresh stub and client exist.
     * @tc.steps         1. Send the seven-code plan.
     *                   2. Count successes and failures in the result list.
     *                   3. Compare with metrics.
     * @tc.expected      Four successes, three failures and ratio four sevenths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlMixedBatchSuccessAccounting', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE,
        UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, REQUEST_CODE];
      let successes = 0;
      let failures = 0;
      for (let index = 0; index < codes.length; index++) {
        if (client.send(codes[index]).isSuccess()) {
          successes = successes + 1;
        } else {
          failures = failures + 1;
        }
      }
      const metrics = StubMetrics.from(stub);
      expect(successes).assertEqual(4);
      expect(failures).assertEqual(3);
      expect(metrics.requests).assertEqual(7);
      expect(metrics.handled).assertEqual(4);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(4 / 7);
    });

    /**
     * @tc.name          concurrencyControlLedgerHandledFlagMirrorsOracle
     * @tc.desc          Every ledger handled flag equals the oracle for its code.
     * @tc.precondition  A workload containing all canonical codes has run.
     * @tc.steps         1. Send each canonical code.
     *                   2. Walk the ledger rows.
     *                   3. Compare each flag with expectedHandled.
     * @tc.expected      All five rows agree with the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlLedgerHandledFlagMirrorsOracle', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index]);
      }
      let agreements = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        const row = stub.requests[index];
        expect(row.handled).assertEqual(expectedHandled(row.code));
        if (row.handled === expectedHandled(row.code)) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(5);
      expect(agreements).assertEqual(stub.requests.length);
      expect(stub.requests[4].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual('');
    });

    /**
     * @tc.name          concurrencyControlNoCrossTalkBetweenTwoStubs
     * @tc.desc          Traffic on one stub never appears in another stub ledger.
     * @tc.precondition  Two independent stubs each have a client.
     * @tc.steps         1. Send three requests to the first stub.
     *                   2. Send one request to the second stub.
     *                   3. Compare both ledgers and metrics.
     * @tc.expected      Counts stay three and one with different fingerprints.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlNoCrossTalkBetweenTwoStubs', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      firstClient.sendMany(3);
      secondClient.send(REQUEST_CODE, 'second-only');
      expect(firstStub.requestCount()).assertEqual(3);
      expect(secondStub.requestCount()).assertEqual(1);
      expect(secondStub.requests[0].text).assertEqual('second-only');
      expect(firstStub.requests[2].text).assertEqual(REQUEST_PAYLOAD);
      expect(StubMetrics.from(firstStub).fingerprint())
        .assertEqual(textFingerprint('3:3:0:3'));
      expect(StubMetrics.from(secondStub).fingerprint())
        .assertEqual(textFingerprint('1:1:0:1'));
    });

    /**
     * @tc.name          concurrencyControlEmptyBatchLeavesStateUntouched
     * @tc.desc          A zero-length batch changes neither ledger nor client state.
     * @tc.precondition  A fresh stub and client exist.
     * @tc.steps         1. Call sendMany with zero.
     *                   2. Read metrics and trace.
     *                   3. Confirm the stub remains alive.
     * @tc.expected      Zero handled, zero rows and an empty trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlEmptyBatchLeavesStateUntouched', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(0);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(0);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(client.results.length).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlServicePipelineConnectThenConcurrentClients
     * @tc.desc          A service connection exposes a stub usable by two clients.
     * @tc.precondition  A service lifecycle model has been created.
     * @tc.steps         1. Call onConnect.
     *                   2. Bind two clients to the returned stub.
     *                   3. Send three requests per client.
     * @tc.expected      Six handled rows and one connect event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlServicePipelineConnectThenConcurrentClients', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      const firstHandled = first.sendMany(3);
      const secondHandled = second.sendMany(3);
      expect(firstHandled).assertEqual(3);
      expect(secondHandled).assertEqual(3);
      expect(stub.requestCount()).assertEqual(6);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.events.countOf('onConnect')).assertEqual(1);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlRerunsProduceStableMetricFingerprints
     * @tc.desc          Replaying one plan on two stubs yields identical metrics.
     * @tc.precondition  The same mixed code plan is replayed twice.
     * @tc.steps         1. Run the plan on the first stub.
     *                   2. Run it again on a second stub.
     *                   3. Compare fingerprints and ratios.
     * @tc.expected      Both runs share one fingerprint and one ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlRerunsProduceStableMetricFingerprints', 0, () => {
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_TWO];
      const firstStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      for (let index = 0; index < codes.length; index++) {
        firstClient.send(codes[index]);
      }
      const secondStub = new StubRemoteObjectModel();
      const secondClient = new InProcessClient(secondStub);
      for (let index = 0; index < codes.length; index++) {
        secondClient.send(codes[index]);
      }
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.successRatio()).assertEqual(0.6);
      expect(secondMetrics.successRatio()).assertEqual(0.6);
      expect(firstClient.trace()).assertEqual(secondClient.trace());
      expect(firstStub.requestCount()).assertEqual(secondStub.requestCount());
    });

    /**
     * @tc.name          concurrencyControlPayloadGrowthDoesNotAffectReplyLiteral
     * @tc.desc          Longer request payloads still receive the fixed reply.
     * @tc.precondition  A stub and client are prepared.
     * @tc.steps         1. Send payloads of length one, ten and one hundred.
     *                   2. Read every reply.
     *                   3. Compare reply text and recorded payloads.
     * @tc.expected      All replies equal hello rpc while payloads differ in length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlPayloadGrowthDoesNotAffectReplyLiteral', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const shortText = 'x';
      const mediumText = '0123456789';
      let longText = '';
      for (let index = 0; index < 100; index++) {
        longText = longText + 'y';
      }
      const replies: string[] = [];
      replies.push(client.send(REQUEST_CODE, shortText).replyText);
      replies.push(client.send(REQUEST_CODE, mediumText).replyText);
      replies.push(client.send(REQUEST_CODE, longText).replyText);
      for (let index = 0; index < replies.length; index++) {
        expect(replies[index]).assertEqual(REPLY_PAYLOAD);
      }
      expect(stub.requests[0].text.length).assertEqual(1);
      expect(stub.requests[1].text.length).assertEqual(10);
      expect(stub.requests[2].text.length).assertEqual(100);
      expect(stub.requests[2].replyText.length).assertEqual(REPLY_PAYLOAD.length);
    });

    /**
     * @tc.name          concurrencyControlLedgerFingerprintIsDeterministic
     * @tc.desc          Joining ledger payloads yields a reproducible fingerprint.
     * @tc.precondition  Two clients send the same ordered payload list.
     * @tc.steps         1. Capture joined payloads from the first run.
     *                   2. Repeat the run on a second stub.
     *                   3. Compare fingerprints and joined texts.
     * @tc.expected      Both joined texts and fingerprints are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlLedgerFingerprintIsDeterministic', 0, () => {
      const payloads: string[] = ['one', 'two', 'three', 'four'];
      const firstStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      for (let index = 0; index < payloads.length; index++) {
        firstClient.send(REQUEST_CODE, payloads[index]);
      }
      const secondStub = new StubRemoteObjectModel();
      const secondClient = new InProcessClient(secondStub);
      for (let index = 0; index < payloads.length; index++) {
        secondClient.send(REQUEST_CODE, payloads[index]);
      }
      const firstText = joined(payloads, '|');
      const secondText = joined(payloads, '|');
      expect(firstText).assertEqual(secondText);
      expect(textFingerprint(firstText)).assertEqual(textFingerprint(secondText));
      expect(textFingerprint(firstText) === textFingerprint('one|two|three')).assertFalse();
      expect(firstStub.requests[3].text).assertEqual('four');
      expect(secondStub.requests[3].text).assertEqual('four');
    });

    /**
     * @tc.name          concurrencyControlRejectionDuringReviveWindow
     * @tc.desc          Sends between kill and revive are rejected, not queued.
     * @tc.precondition  A client holds a stub that can be killed.
     * @tc.steps         1. Kill the stub and send twice.
     *                   2. Revive and send once.
     *                   3. Compare result flags and reply count.
     * @tc.expected      The two dark-window sends fail and only the final send replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlRejectionDuringReviveWindow', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const firstDark = client.send(REQUEST_CODE, 'dark-1');
      const secondDark = client.send(REQUEST_CODE, 'dark-2');
      stub.revive();
      const lit = client.send(REQUEST_CODE, 'lit');
      expect(firstDark.isSuccess()).assertFalse();
      expect(secondDark.isSuccess()).assertFalse();
      expect(firstDark.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(lit.isSuccess()).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[0].text).assertEqual('');
    });

    /**
     * @tc.name          concurrencyControlTrafficAfterDisconnectStillReachesStub
     * @tc.desc          onDisconnect does not invalidate the previously returned stub.
     * @tc.precondition  A service has connected and returned a live stub.
     * @tc.steps         1. Send two requests while connected.
     *                   2. Call onDisconnect.
     *                   3. Send one more request through the same stub.
     * @tc.expected      The stub still handles traffic while the service is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlTrafficAfterDisconnectStillReachesStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(2);
      service.onDisconnect();
      const after = client.send(REQUEST_CODE, 'after-disconnect');
      expect(service.state).assertEqual('disconnected');
      expect(after.isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[2].text).assertEqual('after-disconnect');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.last()).assertEqual('onDisconnect');
    });

    /**
     * @tc.name          concurrencyControlHighCodeValuesAreNotSpecial
     * @tc.desc          Large positive and negative codes are treated as unknown.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send four extreme integer codes.
     *                   2. Confirm every send is rejected.
     *                   3. Read the stored codes back.
     * @tc.expected      All extreme codes fail and are preserved verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlHighCodeValuesAreNotSpecial', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const extremeCodes: number[] = [1000, 65535, 999999, -2000000000];
      for (let index = 0; index < extremeCodes.length; index++) {
        const result = client.send(extremeCodes[index], 'extreme');
        expect(result.isSuccess()).assertFalse();
      }
      expect(stub.requestCount()).assertEqual(4);
      expect(stub.requests[0].code).assertEqual(1000);
      expect(stub.requests[1].code).assertEqual(65535);
      expect(stub.requests[2].code).assertEqual(999999);
      expect(stub.requests[3].code).assertEqual(-2000000000);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          concurrencyControlReplySequenceSizeTracksCustomReply
     * @tc.desc          The reply sequence holds exactly one custom string.
     * @tc.precondition  A stub with a custom reply text exists.
     * @tc.steps         1. Build data and reply sequences.
     *                   2. Invoke the stub with the custom reply.
     *                   3. Read the reply sequence.
     * @tc.expected      The sequence size is one and its only value is the custom text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlReplySequenceSizeTracksCustomReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.replyText = 'sequence-reply';
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 3, false);
      data.writeString('sequence-request');
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertTrue();
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual('sequence-reply');
      expect(reply.readString()).assertEqual('');
      expect(data.size()).assertEqual(1);
      expect(data.trace()).assertEqual('sequence-request#1');
      expect(stub.requests[0].replyText).assertEqual('sequence-reply');
    });

    /**
     * @tc.name          concurrencyControlTwoStubsAlternatingTrafficIsolation
     * @tc.desc          Alternating traffic across two stubs stays isolated.
     * @tc.precondition  Two stubs with one client each exist.
     * @tc.steps         1. Alternate two sends per stub.
     *                   2. Compare per-stub ledger lengths.
     *                   3. Compare per-stub reply traces.
     * @tc.expected      Each stub holds two rows and two replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlTwoStubsAlternatingTrafficIsolation', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      firstStub.replyText = 'first-reply';
      secondStub.replyText = 'second-reply';
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      firstClient.send(REQUEST_CODE, 'fa');
      secondClient.send(REQUEST_CODE, 'sa');
      firstClient.send(REQUEST_CODE, 'fb');
      secondClient.send(REQUEST_CODE, 'sb');
      expect(firstStub.requestCount()).assertEqual(2);
      expect(secondStub.requestCount()).assertEqual(2);
      expect(firstClient.replies.length).assertEqual(2);
      expect(secondClient.trace()).assertEqual('second-reply|second-reply');
      expect(firstClient.replies[0]).assertEqual('first-reply');
      expect(secondClient.replies[1]).assertEqual('second-reply');
      expect(firstStub.requests[1].text).assertEqual('fb');
    });

    /**
     * @tc.name          concurrencyControlConnectResetConnectCycleCounts
     * @tc.desc          A connect-reset-connect cycle restarts stub counters.
     * @tc.precondition  A service lifecycle model is available.
     * @tc.steps         1. Connect and send two requests.
     *                   2. Reset the first stub.
     *                   3. Connect again and send one request.
     * @tc.expected      The second stub is fresh and connect count reaches two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlConnectResetConnectCycleCounts', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const firstStub = service.onConnect();
      const firstClient = new InProcessClient(firstStub);
      firstClient.sendMany(2);
      firstStub.reset();
      const secondStub = service.onConnect();
      const secondClient = new InProcessClient(secondStub);
      secondClient.send(REQUEST_CODE, 'second-cycle');
      expect(firstStub.requestCount()).assertEqual(0);
      expect(secondStub.requestCount()).assertEqual(1);
      expect(service.connectCount).assertEqual(2);
      expect(service.events.countOf('onConnect')).assertEqual(2);
      expect(secondStub.requests[0].text).assertEqual('second-cycle');
      expect(secondStub !== firstStub).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlLargeBatchFiftyMixedRatio
     * @tc.desc          A fifty-entry half-valid plan keeps an exact 0.5 ratio.
     * @tc.precondition  A fresh stub and client are prepared.
     * @tc.steps         1. Send fifty requests with alternating validity.
     *                   2. Build metrics from the ledger.
     *                   3. Compare ratio and both counts.
     * @tc.expected      Twenty-five handled, twenty-five rejected, ratio 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlLargeBatchFiftyMixedRatio', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 50; index++) {
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_LARGE;
        client.send(code, 'mixed-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(50);
      expect(metrics.handled).assertEqual(25);
      expect(metrics.rejected).assertEqual(25);
      expect(metrics.replies).assertEqual(25);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.results.length).assertEqual(50);
      expect(stub.requests[49].code).assertEqual(UNKNOWN_CODE_LARGE);
    });

    /**
     * @tc.name          concurrencyControlOptionMixDoesNotAffectHandling
     * @tc.desc          Synchronous and asynchronous options both allow handling.
     * @tc.precondition  A stub and three message sequences are prepared.
     * @tc.steps         1. Invoke the stub with sync, async and default options.
     *                   2. Read the recorded option strings.
     *                   3. Count handled rows.
     * @tc.expected      Three rows are handled with distinct option descriptors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlOptionMixDoesNotAffectHandling', 0, () => {
      const stub = new StubRemoteObjectModel();
      const syncOption = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      const asyncOption = new MessageOptionModel(OPTION_FLAG_ASYNC, 12, true);
      const defaultOption = new MessageOptionModel();
      const first = MessageSequenceModel.create();
      const second = MessageSequenceModel.create();
      const third = MessageSequenceModel.create();
      first.writeString('sync');
      second.writeString('async');
      third.writeString('default');
      expect(stub.onRemoteMessageRequest(REQUEST_CODE, first, MessageSequenceModel.create(), syncOption)).assertTrue();
      expect(stub.onRemoteMessageRequest(REQUEST_CODE, second, MessageSequenceModel.create(), asyncOption)).assertTrue();
      expect(stub.onRemoteMessageRequest(REQUEST_CODE, third, MessageSequenceModel.create(), defaultOption)).assertTrue();
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/12/true');
      expect(stub.requests[2].option).assertEqual('0/0/false');
    });

    /**
     * @tc.name          concurrencyControlSeparatorPayloadPreservedVerbatim
     * @tc.desc          Payload text containing separators is stored unchanged.
     * @tc.precondition  A client sends a payload with pipe, hash and comma characters.
     * @tc.steps         1. Send the separator payload.
     *                   2. Read the ledger row text.
     *                   3. Compare with the original literal.
     * @tc.expected      The row text equals the original payload byte for byte.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlSeparatorPayloadPreservedVerbatim', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const tricky = 'left|middle#tail,extra';
      const result = client.send(REQUEST_CODE, tricky);
      const row = stub.requests[0];
      expect(result.isSuccess()).assertTrue();
      expect(row.text).assertEqual(tricky);
      expect(row.text.length).assertEqual(22);
      expect(row.text.split('|').length).assertEqual(2);
      expect(row.text.split('#').length).assertEqual(2);
      expect(row.text.indexOf(',')).assertEqual(16);
      expect(row.code).assertEqual(REQUEST_CODE);
      expect(row.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          concurrencyControlDifferentHandledCountsChangeFingerprint
     * @tc.desc          Metric fingerprints differ when handled counts differ.
     * @tc.precondition  Two stubs receive different numbers of valid requests.
     * @tc.steps         1. Give the first stub three valid requests.
     *                   2. Give the second stub two valid and one invalid.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints and handled counters differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDifferentHandledCountsChangeFingerprint', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(firstStub);
      const secondClient = new InProcessClient(secondStub);
      firstClient.sendMany(3);
      secondClient.sendMany(2);
      secondClient.send(UNKNOWN_CODE_TWO);
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.requests).assertEqual(3);
      expect(secondMetrics.requests).assertEqual(3);
      expect(firstMetrics.handled).assertEqual(3);
      expect(secondMetrics.handled).assertEqual(2);
      expect(firstMetrics.fingerprint() === secondMetrics.fingerprint()).assertFalse();
      expect(firstMetrics.successRatio()).assertEqual(1);
      expect(secondMetrics.successRatio()).assertEqual(2 / 3);
    });

    /**
     * @tc.name          concurrencyControlDestroyDoesNotInvalidateReturnedStub
     * @tc.desc          A stub survives service destruction in the in-process model.
     * @tc.precondition  A connected service has returned a stub with traffic.
     * @tc.steps         1. Send one request while connected.
     *                   2. Call onDestroy on the service.
     *                   3. Send another request through the old stub.
     * @tc.expected      The second request is still handled while the service is destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDestroyDoesNotInvalidateReturnedStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, 'before-destroy');
      service.onDestroy();
      const second = client.send(REQUEST_CODE, 'after-destroy');
      expect(first.isSuccess()).assertTrue();
      expect(second.isSuccess()).assertTrue();
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.alive).assertTrue();
      expect(service.events.last()).assertEqual('onDestroy');
    });

    /**
     * @tc.name          concurrencyControlReplyLengthMatchesEveryLedgerRow
     * @tc.desc          Every handled ledger row carries a full length reply.
     * @tc.precondition  A client produced a mix of handled and rejected requests.
     * @tc.steps         1. Send a mixed plan of eight codes.
     *                   2. Walk all ledger rows.
     *                   3. Check reply lengths against the handled flag.
     * @tc.expected      Handled rows hold six characters and rejected rows hold none.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlReplyLengthMatchesEveryLedgerRow', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO,
        REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_NEGATIVE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'len-' + String(index));
      }
      let handledRows = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        const row = stub.requests[index];
        if (row.handled) {
          handledRows = handledRows + 1;
          expect(row.replyText.length).assertEqual(REPLY_PAYLOAD.length);
        } else {
          expect(row.replyText.length).assertEqual(0);
        }
      }
      expect(handledRows).assertEqual(5);
      expect(stub.requestCount()).assertEqual(8);
      expect(client.replies.length).assertEqual(5);
      expect(StubMetrics.from(stub).rejected).assertEqual(3);
    });

    /**
     * @tc.name          concurrencyControlAlternatingStubsPreserveIndependentTraces
     * @tc.desc          Traces stay separated when two stubs alternate requests.
     * @tc.precondition  Two stubs have distinct reply literals.
     * @tc.steps         1. Alternate three sends across both stubs.
     *                   2. Join each trace.
     *                   3. Compare with per-stub expected literals.
     * @tc.expected      Each trace repeats only its own reply literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlAlternatingStubsPreserveIndependentTraces', 0, () => {
      const leftStub = new StubRemoteObjectModel();
      const rightStub = new StubRemoteObjectModel();
      leftStub.replyText = 'L';
      rightStub.replyText = 'R';
      const left = new InProcessClient(leftStub);
      const right = new InProcessClient(rightStub);
      left.send(REQUEST_CODE, 'l1');
      right.send(REQUEST_CODE, 'r1');
      left.send(REQUEST_CODE, 'l2');
      right.send(REQUEST_CODE, 'r2');
      left.send(REQUEST_CODE, 'l3');
      expect(left.trace()).assertEqual('L|L|L');
      expect(right.trace()).assertEqual('R|R');
      expect(leftStub.requestCount()).assertEqual(3);
      expect(rightStub.requestCount()).assertEqual(2);
      expect(leftStub.lastRequest()?.text).assertEqual('l3');
      expect(rightStub.requests[0].replyText).assertEqual('R');
    });
  });
}
