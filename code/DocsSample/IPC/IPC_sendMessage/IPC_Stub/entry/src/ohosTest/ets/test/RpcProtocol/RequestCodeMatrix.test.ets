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
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  StubRemoteObjectModel,
  InProcessClient,
  MessageSequenceModel,
  MessageOptionModel,
  expectedHandled,
  expectedReplyFor,
  isKnownRequestCode,
  replayCodes,
  countOf,
  joined,
  textFingerprint,
  StubMetrics
} from '../Shared/SharedDriver';

/**
 * Request code matrix for the IPC stub protocol.
 *
 * Production anchor: ServiceExtAbility.ets 26-38 accepts code 1 only,
 * reads a string from data, writes 'hello rpc' and returns true; every
 * other code is rejected with false.
 */

function matrixCodes(): number[] {
  return [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
}

function unknownCodes(): number[] {
  return [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
}

function freshClient(): InProcessClient {
  return new InProcessClient(new StubRemoteObjectModel());
}

function handledCountOf(client: InProcessClient): number {
  let total = 0;
  for (let index = 0; index < client.results.length; index++) {
    if (client.results[index].isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

function repliedCountOf(client: InProcessClient): number {
  let total = 0;
  for (let index = 0; index < client.results.length; index++) {
    if (client.results[index].replyText.length > 0) {
      total = total + 1;
    }
  }
  return total;
}

function codeOf(index: number, codes: number[]): number {
  return codes[index];
}

export default function requestCodeMatrixTest(): void {
  describe('RequestCodeMatrixTest', () => {
    beforeAll(() => {
      logSuite('RequestCodeMatrixTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('RequestCodeMatrixTest', 'end');
    });

    /**
     * @tc.name          requestCodeOneIsHandledWithProductionReply
     * @tc.desc          Code 1 is the only handled request and yields 'hello rpc'.
     * @tc.precondition  A fresh stub and an in-process client are available.
     * @tc.steps         1. Send code 1 with 'hello world'.
     *                   2. Inspect the result and the recorded request.
     *                   3. Compare the reply against the production literal.
     * @tc.expected      The result succeeds, reports 0 and returns 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeOneIsHandledWithProductionReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      logStep('requestCodeOneIsHandledWithProductionReply', 'send code 1');
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(REPLY_PAYLOAD).assertEqual('hello rpc');
      expect(stub.requestCount()).assertEqual(1);
      const record = stub.lastRequest();
      expect(record !== undefined).assertTrue();
      if (record !== undefined) {
        expect(record.code).assertEqual(REQUEST_CODE);
        expect(record.text).assertEqual(REQUEST_PAYLOAD);
        expect(record.replyText).assertEqual(REPLY_PAYLOAD);
      }
    });

    /**
     * @tc.name          requestCodeOneRecordsHandledFlagOnTheRequest
     * @tc.desc          The ledger entry for code 1 carries handled true and a reply copy.
     * @tc.precondition  A stub with a single code 1 request.
     * @tc.steps         1. Send code 1 twice.
     *                   2. Read both ledger entries.
     *                   3. Check handled flags and stored reply text.
     * @tc.expected      Both entries are handled and store 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeOneRecordsHandledFlagOnTheRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'first');
      client.send(REQUEST_CODE, 'second');
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertTrue();
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[1].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].text).assertEqual('first');
      expect(stub.requests[1].text).assertEqual('second');
      expect(handledCountOf(client)).assertEqual(2);
    });

    /**
     * @tc.name          requestCodeZeroIsRejected
     * @tc.desc          Code 0 is outside the accepted set and returns false.
     * @tc.precondition  A fresh stub is available.
     * @tc.steps         1. Send code 0.
     *                   2. Inspect result flags and the ledger entry.
     *                   3. Check that no reply text was produced.
     * @tc.expected      The request is rejected with 16000011 and no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeZeroIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      logStep('requestCodeZeroIsRejected', 'send code 0');
      const result = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertFalse();
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(stub.requestCount()).assertEqual(1);
      const record = stub.lastRequest();
      expect(record !== undefined).assertTrue();
      if (record !== undefined) {
        expect(record.code).assertEqual(UNKNOWN_CODE_ZERO);
        expect(record.handled).assertFalse();
        expect(record.replyText).assertEqual('');
      }
    });
    /**
     * @tc.name          requestCodeTwoIsRejected
     * @tc.desc          Code 2 is not part of the protocol and must be refused.
     * @tc.precondition  A fresh stub is available.
     * @tc.steps         1. Send code 2.
     *                   2. Check the result error code.
     *                   3. Confirm the client recorded no reply.
     * @tc.expected      The stub returns false and the error is 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeTwoIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(client.replies.length).assertEqual(0);
      expect(stub.requests.length).assertEqual(1);
      expect(stub.requests[0].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.requests[0].text).assertEqual('');
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
    });

    /**
     * @tc.name          requestCodeNegativeIsRejected
     * @tc.desc          A negative code never matches the literal comparison with 1.
     * @tc.precondition  A fresh stub is available.
     * @tc.steps         1. Send code -1.
     *                   2. Inspect the recorded ledger entry.
     *                   3. Compare with the oracle for -1.
     * @tc.expected      The negative request is rejected and recorded as unhandled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeNegativeIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      logStep('requestCodeNegativeIsRejected', 'send code -1');
      const result = client.send(UNKNOWN_CODE_NEGATIVE, 'negative payload');
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[0].replyText).assertEqual('');
      expect(expectedHandled(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_NEGATIVE)).assertFalse();
    });

    /**
     * @tc.name          requestCodeLargeIsRejected
     * @tc.desc          A large out-of-range code such as 99 is refused.
     * @tc.precondition  A fresh stub is available.
     * @tc.steps         1. Send code 99.
     *                   2. Check the recorded attempt.
     *                   3. Confirm that no reply text is buffered.
     * @tc.expected      The ledger contains one rejected entry for code 99.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeLargeIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(stub.requestCount()).assertEqual(1);
      const record = stub.lastRequest();
      expect(record !== undefined).assertTrue();
      if (record !== undefined) {
        expect(record.code).assertEqual(99);
        expect(record.handled).assertFalse();
        expect(record.option).assertEqual('0/0/false');
      }
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
    });

    /**
     * @tc.name          requestCodeFullMatrixHandlesOnlyCodeOne
     * @tc.desc          Replaying the five-code matrix yields exactly one success.
     * @tc.precondition  The matrix codes 1, 0, 2, -1 and 99 are available.
     * @tc.steps         1. Replay the matrix through one stub.
     *                   2. Count successful and rejected results.
     *                   3. Confirm the success is the first entry.
     * @tc.expected      One success, four rejections, first send is code 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeFullMatrixHandlesOnlyCodeOne', 0, () => {
      const codes = matrixCodes();
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, codes);
      expect(codes.length).assertEqual(5);
      expect(client.results.length).assertEqual(5);
      expect(handledCountOf(client)).assertEqual(1);
      expect(client.results.length - handledCountOf(client)).assertEqual(4);
      expect(client.results[0].isSuccess()).assertTrue();
      expect(client.results[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(5);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          requestCodeMatrixUnknownEntriesHaveNoReply
     * @tc.desc          Only the accepted code produces reply text across the matrix.
     * @tc.precondition  A replayed code matrix is available.
     * @tc.steps         1. Replay codes 1, 0, 2, -1 and 99.
     *                   2. Count results carrying reply text.
     *                   3. Verify positions of empty replies.
     * @tc.expected      Exactly one reply exists and it sits at index 0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeMatrixUnknownEntriesHaveNoReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, matrixCodes());
      expect(repliedCountOf(client)).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.results[1].replyText).assertEqual('');
      expect(client.results[2].replyText).assertEqual('');
      expect(client.results[3].replyText).assertEqual('');
      expect(client.results[4].replyText).assertEqual('');
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          requestCodeOracleAgreesWithStubOnMatrix
     * @tc.desc          expectedHandled must match the stub for every matrix code.
     * @tc.precondition  Matrix codes and the oracle are available.
     * @tc.steps         1. For each matrix code compare oracle with stub return.
     *                   2. Count mismatches.
     *                   3. Check the mismatch total is zero.
     * @tc.expected      The oracle and the stub agree on all five codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeOracleAgreesWithStubOnMatrix', 0, () => {
      const codes = matrixCodes();
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      let mismatches = 0;
      for (let index = 0; index < codes.length; index++) {
        const handled = stub.onRemoteMessageRequest(codes[index], data, reply, new MessageOptionModel());
        if (handled !== expectedHandled(codes[index])) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(stub.requestCount()).assertEqual(5);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.requests[4].handled).assertFalse();
    });
    /**
     * @tc.name          requestCodeKnownHelperAcceptsOnlyCodeOne
     * @tc.desc          isKnownRequestCode is true for 1 and false for the matrix.
     * @tc.precondition  The helper and matrix codes are available.
     * @tc.steps         1. Evaluate the helper for code 1.
     *                   2. Evaluate it for all unknown matrix codes.
     *                   3. Count accepted codes.
     * @tc.expected      Only code 1 is reported known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('requestCodeKnownHelperAcceptsOnlyCodeOne', 0, () => {
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
      let accepted = 0;
      const codes = matrixCodes();
      for (let index = 0; index < codes.length; index++) {
        if (isKnownRequestCode(codes[index])) {
          accepted = accepted + 1;
        }
      }
      expect(accepted).assertEqual(1);
      expect(accepted).assertEqual(handledCountOf(replayCodes(new StubRemoteObjectModel(), codes)));
    });

    /**
     * @tc.name          requestCodeSentCodesMirrorInputOrder
     * @tc.desc          The client records the sent codes in the order supplied.
     * @tc.precondition  A client and a matrix of codes are available.
     * @tc.steps         1. Send codes 2, 1, 0, 99.
     *                   2. Read the client send history.
     *                   3. Compare element by element.
     * @tc.expected      The send history is exactly 2, 1, 0, 99.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeSentCodesMirrorInputOrder', 0, () => {
      const client = freshClient();
      const codes: number[] = [UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_LARGE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      expect(client.sentCodes.length).assertEqual(4);
      expect(client.sentCodes[0]).assertEqual(2);
      expect(client.sentCodes[1]).assertEqual(1);
      expect(client.sentCodes[2]).assertEqual(0);
      expect(client.sentCodes[3]).assertEqual(99);
      expect(client.sentTexts.length).assertEqual(4);
      expect(client.sentTexts[3]).assertEqual(REQUEST_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          requestCodeRepliesTraceContainsSingleEntry
     * @tc.desc          After two sends with one success the reply trace holds one text.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send code 2 then code 1.
     *                   2. Read the reply trace.
     *                   3. Count separators and entries.
     * @tc.expected      The trace is the single literal 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeRepliesTraceContainsSingleEntry', 0, () => {
      const client = freshClient();
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.trace()).assertEqual('hello rpc');
      expect(client.trace().indexOf('|')).assertEqual(-1);
      expect(client.trace().length).assertEqual(9);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(1);
      expect(client.results.length).assertEqual(2);
    });

    /**
     * @tc.name          requestCodeRepeatedCodeOneSendsAccumulate
     * @tc.desc          Three code 1 sends produce three replies and three successes.
     * @tc.precondition  A fresh stub and client are available.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Count handled results and replies.
     *                   3. Verify the ledger size.
     * @tc.expected      Three handled requests, three identical replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeRepeatedCodeOneSendsAccumulate', 0, () => {
      const client = freshClient();
      client.send(REQUEST_CODE, 'alpha');
      client.send(REQUEST_CODE, 'beta');
      client.send(REQUEST_CODE, 'gamma');
      expect(handledCountOf(client)).assertEqual(3);
      expect(repliedCountOf(client)).assertEqual(3);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(client.stub.requests[0].text).assertEqual('alpha');
      expect(client.stub.requests[1].text).assertEqual('beta');
      expect(client.stub.requests[2].text).assertEqual('gamma');
      expect(joined(client.replies, ',')).assertEqual('hello rpc,hello rpc,hello rpc');
      expect(client.results[2].errCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name          requestCodeUnknownFirstThenKnownIsHandled
     * @tc.desc          A prior rejection does not block a later accepted request.
     * @tc.precondition  A client with no requests yet.
     * @tc.steps         1. Send code 0.
     *                   2. Send code 1.
     *                   3. Compare the two results.
     * @tc.expected      The first result fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeUnknownFirstThenKnownIsHandled', 0, () => {
      const client = freshClient();
      const first = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const second = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.isSuccess()).assertFalse();
      expect(first.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(second.isSuccess()).assertTrue();
      expect(second.errCode).assertEqual(ERROR_NONE);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(client.stub.requests[0].handled).assertFalse();
      expect(client.stub.requests[1].handled).assertTrue();
      expect(handledCountOf(client)).assertEqual(1);
    });

    /**
     * @tc.name          requestCodeKnownBetweenUnknownsIsHandled
     * @tc.desc          The accepted code works even when surrounded by rejections.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send code 99, code 1, code -1.
     *                   2. Inspect the middle result.
     *                   3. Count successes and failures.
     * @tc.expected      Only the middle request is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeKnownBetweenUnknownsIsHandled', 0, () => {
      const client = freshClient();
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const middle = client.send(REQUEST_CODE, 'middle payload');
      client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      expect(middle.isSuccess()).assertTrue();
      expect(middle.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.results[0].isSuccess()).assertFalse();
      expect(client.results[2].isSuccess()).assertFalse();
      expect(handledCountOf(client)).assertEqual(1);
      expect(client.stub.requests[1].text).assertEqual('middle payload');
      expect(codeOf(1, client.sentCodes)).assertEqual(REQUEST_CODE);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });
    /**
     * @tc.name          requestCodeAllUnknownLedgerHasNoReplies
     * @tc.desc          A pure rejection run leaves every ledger reply field empty.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send the four unknown codes.
     *                   2. Walk the ledger.
     *                   3. Count non-empty reply fields.
     * @tc.expected      All four entries are unhandled and carry no reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeAllUnknownLedgerHasNoReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, unknownCodes());
      expect(client.results.length).assertEqual(4);
      expect(stub.requestCount()).assertEqual(4);
      let replies = 0;
      let handled = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (stub.requests[index].replyText.length > 0) {
          replies = replies + 1;
        }
        if (stub.requests[index].handled) {
          handled = handled + 1;
        }
      }
      expect(replies).assertEqual(0);
      expect(handled).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(handledCountOf(client)).assertEqual(0);
      expect(repliedCountOf(client)).assertEqual(0);
    });

    /**
     * @tc.name          requestCodeSuccessRatioAfterMixedMatrix
     * @tc.desc          StubMetrics reports one success out of five for the matrix.
     * @tc.precondition  The five-code matrix has been replayed.
     * @tc.steps         1. Build metrics from the stub.
     *                   2. Read the success ratio.
     *                   3. Check the raw counters.
     * @tc.expected      The ratio is 0.2 with one handled request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeSuccessRatioAfterMixedMatrix', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, matrixCodes());
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(4);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.2);
      expect(metrics.successRatio()).assertLarger(0);
      expect(metrics.successRatio()).assertLess(1);
      expect(client.results.length).assertEqual(metrics.requests);
    });

    /**
     * @tc.name          requestCodeMetricsHandledMatchesSuccesses
     * @tc.desc          StubMetrics.handled equals the number of successful results.
     * @tc.precondition  A client with a mixed code history exists.
     * @tc.steps         1. Send 1, 1, 0, 2.
     *                   2. Build metrics.
     *                   3. Compare handled with the client success count.
     * @tc.expected      Both counts are two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeMetricsHandledMatchesSuccesses', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO];
      const client = replayCodes(stub, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.handled).assertEqual(2);
      expect(handledCountOf(client)).assertEqual(2);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.fingerprint()).assertLarger(0);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
    });

    /**
     * @tc.name          requestCodeMetricsRejectedMatchesRejections
     * @tc.desc          StubMetrics.rejected equals the count of false stub returns.
     * @tc.precondition  A client with three rejections exists.
     * @tc.steps         1. Send 0, 2, -1 and 1.
     *                   2. Build metrics.
     *                   3. Compare rejected with the failure count.
     * @tc.expected      Three rejections and one success are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeMetricsRejectedMatchesRejections', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, REQUEST_CODE];
      const client = replayCodes(stub, codes);
      const metrics = StubMetrics.from(stub);
      expect(metrics.rejected).assertEqual(3);
      expect(client.results.length - handledCountOf(client)).assertEqual(3);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.25);
      expect(stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          requestCodeLastRequestIsFinalInput
     * @tc.desc          lastRequest reflects the most recent send even if rejected.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send code 1.
     *                   2. Send code 99.
     *                   3. Inspect lastRequest.
     * @tc.expected      The last request code is 99 and it is unhandled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeLastRequestIsFinalInput', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'first');
      client.send(UNKNOWN_CODE_LARGE, 'last');
      expect(stub.requestCount()).assertEqual(2);
      const last = stub.lastRequest();
      expect(last !== undefined).assertTrue();
      if (last !== undefined) {
        expect(last.code).assertEqual(UNKNOWN_CODE_LARGE);
        expect(last.text).assertEqual('');
        expect(last.handled).assertFalse();
        expect(last.replyText).assertEqual('');
      }
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(client.results[1].errCode).assertEqual(ERROR_STUB_REJECTED);
    });

    /**
     * @tc.name          requestCodeResetClearsRequestLedger
     * @tc.desc          Resetting the stub discards all recorded matrix requests.
     * @tc.precondition  A stub with five recorded requests.
     * @tc.steps         1. Replay the matrix.
     *                   2. Reset the stub.
     *                   3. Read the ledger and counters.
     * @tc.expected      The ledger is empty and the stub is alive again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeResetClearsRequestLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      replayCodes(stub, matrixCodes());
      expect(stub.requestCount()).assertEqual(5);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.lastRequest() === undefined).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0);
    });
    /**
     * @tc.name          requestCodeKillRejectsKnownCode
     * @tc.desc          A dead stub refuses code 1 even though the code is known.
     * @tc.precondition  A stub that has been killed.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code 1.
     *                   3. Inspect the result and ledger.
     * @tc.expected      The request fails with 16000011 and no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeKillRejectsKnownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      logStep('requestCodeKillRejectsKnownCode', 'send to a dead stub');
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.alive).assertFalse();
      expect(result.handled).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(stub.requestCount()).assertEqual(1);
      const record = stub.lastRequest();
      expect(record !== undefined).assertTrue();
      if (record !== undefined) {
        expect(record.code).assertEqual(REQUEST_CODE);
        expect(record.handled).assertFalse();
        expect(record.text).assertEqual('');
      }
    });

    /**
     * @tc.name          requestCodeReviveRestoresKnownCode
     * @tc.desc          Reviving a killed stub restores normal code 1 handling.
     * @tc.precondition  A stub killed after one successful request.
     * @tc.steps         1. Send code 1, kill, then send code 1 again.
     *                   2. Revive the stub.
     *                   3. Send code 1 a third time.
     * @tc.expected      Only the middle request fails; the third succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeReviveRestoresKnownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, 'one');
      stub.kill();
      const second = client.send(REQUEST_CODE, 'two');
      stub.revive();
      const third = client.send(REQUEST_CODE, 'three');
      expect(first.isSuccess()).assertTrue();
      expect(second.isSuccess()).assertFalse();
      expect(third.isSuccess()).assertTrue();
      expect(third.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.requests[2].handled).assertTrue();
      expect(handledCountOf(client)).assertEqual(2);
    });

    /**
     * @tc.name          requestCodeKillStillRecordsAttempt
     * @tc.desc          Rejected attempts on a dead stub are still written to the ledger.
     * @tc.precondition  A stub that has been killed.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code 0 and code 1.
     *                   3. Count ledger entries.
     * @tc.expected      Two unhandled entries exist and no reply was written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeKillStillRecordsAttempt', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.requests[0].replyText).assertEqual('');
      expect(stub.requests[1].replyText).assertEqual('');
      expect(repliedCountOf(client)).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
    });

    /**
     * @tc.name          requestCodeRejectListOverridesKnownCode
     * @tc.desc          An explicit reject entry wins over the built-in code 1 branch.
     * @tc.precondition  The stub reject list contains code 1.
     * @tc.steps         1. Push code 1 onto rejectCodes.
     *                   2. Send code 1.
     *                   3. Inspect the rejection record.
     * @tc.expected      The known code is refused while the list holds it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeRejectListOverridesKnownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[0].text).assertEqual('');
      expect(client.replies.length).assertEqual(0);
      expect(stub.rejectCodes.length).assertEqual(1);
    });

    /**
     * @tc.name          requestCodeRejectListResetRestoresHandling
     * @tc.desc          Clearing the reject list through reset restores code 1.
     * @tc.precondition  A stub whose reject list blocks code 1.
     * @tc.steps         1. Reject code 1 once.
     *                   2. Reset the stub.
     *                   3. Send code 1 again.
     * @tc.expected      The resubmitted code 1 succeeds after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeRejectListResetRestoresHandling', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      const blocked = client.send(REQUEST_CODE, 'blocked');
      expect(blocked.isSuccess()).assertFalse();
      stub.reset();
      expect(stub.rejectCodes.length).assertEqual(0);
      const allowed = client.send(REQUEST_CODE, 'allowed');
      expect(allowed.isSuccess()).assertTrue();
      expect(allowed.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('allowed');
      expect(handledCountOf(client)).assertEqual(1);
    });

    /**
     * @tc.name          requestCodeCustomReplyTextIsObserved
     * @tc.desc          A customized stub reply is returned instead of 'hello rpc'.
     * @tc.precondition  A stub whose replyText has been replaced.
     * @tc.steps         1. Set replyText to 'custom reply'.
     *                   2. Send code 1.
     *                   3. Compare the result and ledger.
     * @tc.expected      The custom text appears in both result and ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeCustomReplyTextIsObserved', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'custom reply';
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('custom reply');
      expect(result.replyText === REPLY_PAYLOAD).assertFalse();
      expect(stub.requests[0].replyText).assertEqual('custom reply');
      expect(client.replies[0]).assertEqual('custom reply');
      expect(client.trace()).assertEqual('custom reply');
      expect(stub.replyText.length).assertEqual(12);
    });
    /**
     * @tc.name          requestCodeEmptyPayloadStillHandled
     * @tc.desc          Code 1 with an empty string payload is still accepted.
     * @tc.precondition  A fresh stub and client are available.
     * @tc.steps         1. Send code 1 with an empty payload.
     *                   2. Read the recorded text and reply.
     *                   3. Confirm the success flags.
     * @tc.expected      The request succeeds and records an empty payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeEmptyPayloadStillHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, '');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[0].text.length).assertEqual(0);
      expect(stub.requests[0].handled).assertTrue();
      expect(client.sentTexts[0]).assertEqual('');
    });

    /**
     * @tc.name          requestCodeLongPayloadIsRecorded
     * @tc.desc          A long payload is preserved verbatim in the ledger entry.
     * @tc.precondition  A fresh stub and client are available.
     * @tc.steps         1. Build a 120-character payload.
     *                   2. Send code 1 with it.
     *                   3. Compare stored text length and content.
     * @tc.expected      The ledger stores the complete long payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeLongPayloadIsRecorded', 0, () => {
      let payload = '';
      for (let index = 0; index < 12; index++) {
        payload = payload + 'abcdefghij';
      }
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, payload);
      expect(payload.length).assertEqual(120);
      expect(result.isSuccess()).assertTrue();
      expect(stub.requests[0].text.length).assertEqual(120);
      expect(stub.requests[0].text).assertEqual(payload);
      expect(stub.requests[0].text).assertContain('abcdefghij');
      expect(client.sentTexts[0]).assertEqual(payload);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(textFingerprint(payload)).assertLarger(0);
    });

    /**
     * @tc.name          requestCodeFingerprintStableForSameMatrix
     * @tc.desc          Replaying the same matrix twice gives identical metrics fingerprints.
     * @tc.precondition  Two independent stubs are available.
     * @tc.steps         1. Replay the matrix on the first stub.
     *                   2. Replay it on the second stub.
     *                   3. Compare metrics fingerprints.
     * @tc.expected      Both stubs report the same fingerprint and counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeFingerprintStableForSameMatrix', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      replayCodes(firstStub, matrixCodes());
      replayCodes(secondStub, matrixCodes());
      const first = StubMetrics.from(firstStub);
      const second = StubMetrics.from(secondStub);
      expect(first.requests).assertEqual(second.requests);
      expect(first.handled).assertEqual(second.handled);
      expect(first.rejected).assertEqual(second.rejected);
      expect(first.replies).assertEqual(second.replies);
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.successRatio()).assertEqual(second.successRatio());
      expect(first.fingerprint()).assertEqual(textFingerprint('5:1:4:1'));
    });

    /**
     * @tc.name          requestCodeSequenceReadCountMatchesHandled
     * @tc.desc          Each handled request performs exactly one data read.
     * @tc.precondition  A common data sequence and separate reply sequences.
     * @tc.steps         1. Write one payload into the data sequence.
     *                   2. Invoke the stub for code 1 and code 0.
     *                   3. Compare read counts and cursor values.
     * @tc.expected      The data sequence records a single read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeSequenceReadCountMatchesHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const firstReply = MessageSequenceModel.create();
      const secondReply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, firstReply, new MessageOptionModel());
      stub.onRemoteMessageRequest(UNKNOWN_CODE_ZERO, data, secondReply, new MessageOptionModel());
      expect(data.readCount).assertEqual(1);
      expect(data.cursor).assertEqual(1);
      expect(data.size()).assertEqual(1);
      expect(data.readString()).assertEqual('');
      expect(firstReply.readCount).assertEqual(0);
      expect(firstReply.size()).assertEqual(1);
      expect(secondReply.size()).assertEqual(0);
      expect(secondReply.readCount).assertEqual(0);
    });

    /**
     * @tc.name          requestCodeSequenceWriteCountMatchesReplies
     * @tc.desc          Only handled requests cause a reply write on the sequence.
     * @tc.precondition  Separate reply sequences for each request.
     * @tc.steps         1. Send code 1 and code 2 directly to the stub.
     *                   2. Inspect write counts on both reply sequences.
     *                   3. Read the buffered reply values.
     * @tc.expected      The first reply holds one write, the second holds none.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeSequenceWriteCountMatchesReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const accepted = MessageSequenceModel.create();
      const refused = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, accepted, new MessageOptionModel());
      stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, refused, new MessageOptionModel());
      expect(accepted.writeCount).assertEqual(1);
      expect(accepted.size()).assertEqual(1);
      expect(accepted.readString()).assertEqual(REPLY_PAYLOAD);
      expect(refused.writeCount).assertEqual(0);
      expect(refused.size()).assertEqual(0);
      expect(refused.readString()).assertEqual('');
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          requestCodeReclaimedDataYieldsEmptyRecord
     * @tc.desc          A reclaimed data sequence makes a handled request record empty text.
     * @tc.precondition  A data sequence that has been reclaimed after writing.
     * @tc.steps         1. Write a payload and reclaim the sequence.
     *                   2. Invoke the stub with code 1.
     *                   3. Inspect the ledger text and reply sequence.
     * @tc.expected      The request is still handled but its recorded text is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeReclaimedDataYieldsEmptyRecord', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      data.reclaim();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(data.reclaimed).assertTrue();
      expect(data.readString()).assertEqual('');
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[0].handled).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
    });
    /**
     * @tc.name          requestCodeReplyReclaimedAfterStubWrite
     * @tc.desc          Reclaiming the reply sequence invalidates later reads.
     * @tc.precondition  A reply sequence that received the production reply.
     * @tc.steps         1. Let the stub write into the reply sequence.
     *                   2. Read the reply once.
     *                   3. Reclaim the sequence and read again.
     * @tc.expected      The first read is 'hello rpc' and the second is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeReplyReclaimedAfterStubWrite', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readCount).assertEqual(1);
      reply.reclaim();
      expect(reply.reclaimed).assertTrue();
      expect(reply.cursor).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(1);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          requestCodeSendManyHandlesEachRequest
     * @tc.desc          sendMany with the known code reports every request handled.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Call sendMany with count 4 and code 1.
     *                   2. Read the handled return value.
     *                   3. Verify the ledger and replies.
     * @tc.expected      Four requests are handled and four replies are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeSendManyHandlesEachRequest', 0, () => {
      const client = freshClient();
      const handled = client.sendMany(4, REQUEST_CODE);
      expect(handled).assertEqual(4);
      expect(client.stub.requestCount()).assertEqual(4);
      expect(client.results.length).assertEqual(4);
      expect(client.replies.length).assertEqual(4);
      expect(handledCountOf(client)).assertEqual(4);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(4);
      expect(client.sentCodes.length).assertEqual(4);
      expect(client.sentCodes[3]).assertEqual(REQUEST_CODE);
    });

    /**
     * @tc.name          requestCodeSendManyWithUnknownHandlesNone
     * @tc.desc          sendMany with code 2 never reports a handled request.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Call sendMany with count 3 and code 2.
     *                   2. Check the returned count.
     *                   3. Inspect the ledger.
     * @tc.expected      The return value is zero and each entry is unhandled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeSendManyWithUnknownHandlesNone', 0, () => {
      const client = freshClient();
      const handled = client.sendMany(3, UNKNOWN_CODE_TWO);
      expect(handled).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(0);
      expect(handledCountOf(client)).assertEqual(0);
      for (let index = 0; index < client.stub.requests.length; index++) {
        expect(client.stub.requests[index].handled).assertFalse();
      }
      expect(client.stub.requests[2].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          requestCodeZeroCountSendManyHandlesNone
     * @tc.desc          sendMany with count zero performs no request at all.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Call sendMany with count 0.
     *                   2. Read the ledger size.
     *                   3. Check the client histories.
     * @tc.expected      Nothing is sent and the ledger stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeZeroCountSendManyHandlesNone', 0, () => {
      const client = freshClient();
      const handled = client.sendMany(0, REQUEST_CODE);
      expect(handled).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.stub.lastRequest() === undefined).assertTrue();
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          requestCodeLedgerDescribeFormat
     * @tc.desc          A handled ledger entry describes code, text, reply and flag.
     * @tc.precondition  One successful code 1 request.
     * @tc.steps         1. Send code 1 with 'probe'.
     *                   2. Ask the entry for its description.
     *                   3. Compare the exact composite string.
     * @tc.expected      The description is '1/probe/hello rpc/true'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeLedgerDescribeFormat', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'probe');
      const record = stub.requests[0];
      expect(record.describe()).assertEqual('1/probe/hello rpc/true');
      expect(record.describe()).assertContain('hello rpc');
      expect(record.describe().startsWith('1/')).assertTrue();
      expect(record.describe().endsWith('/true')).assertTrue();
      expect(record.describe().length).assertEqual(22);
      expect(record.describe()).assertEqual(record.code + '/' + record.text + '/' + record.replyText + '/' +
        String(record.handled));
    });

    /**
     * @tc.name          requestCodeRecordDescribeEmbeddedHandledFlag
     * @tc.desc          A rejected entry describes itself with an empty reply and false.
     * @tc.precondition  One rejected request for code 99.
     * @tc.steps         1. Send code 99.
     *                   2. Read the entry description.
     *                   3. Verify its tail and reply segment.
     * @tc.expected      The description ends with '/false' and has an empty reply slot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeRecordDescribeEmbeddedHandledFlag', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(UNKNOWN_CODE_LARGE, 'ignored');
      const record = stub.requests[0];
      expect(record.describe()).assertEqual('99///false');
      expect(record.describe().endsWith('/false')).assertTrue();
      expect(record.describe().indexOf('/hello rpc/')).assertEqual(-1);
      expect(record.text).assertEqual('');
      expect(record.replyText).assertEqual('');
      expect(record.option).assertEqual('0/0/false');
      expect(record.handled).assertFalse();
    });
    /**
     * @tc.name          requestCodeUnknownReplyOracleIsEmpty
     * @tc.desc          expectedReplyFor returns empty text for every unknown code.
     * @tc.precondition  The reply oracle is available.
     * @tc.steps         1. Query the oracle for the four unknown codes.
     *                   2. Query it for code 1.
     *                   3. Compare lengths.
     * @tc.expected      Unknown codes map to empty replies, code 1 maps to 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeUnknownReplyOracleIsEmpty', 0, () => {
      expect(expectedReplyFor(UNKNOWN_CODE_ZERO)).assertEqual('');
      expect(expectedReplyFor(UNKNOWN_CODE_TWO)).assertEqual('');
      expect(expectedReplyFor(UNKNOWN_CODE_NEGATIVE)).assertEqual('');
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(REPLY_PAYLOAD);
      expect(expectedReplyFor(REQUEST_CODE).length).assertEqual(9);
      expect(expectedReplyFor(UNKNOWN_CODE_ZERO).length).assertEqual(0);
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(expectedReplyFor(1));
    });

    /**
     * @tc.name          requestCodeClientTraceForTwoKnownSends
     * @tc.desc          Two successful sends join the reply trace with a pipe.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Send code 1 twice.
     *                   2. Read the reply trace.
     *                   3. Compare with a manual join.
     * @tc.expected      The trace is 'hello rpc|hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeClientTraceForTwoKnownSends', 0, () => {
      const client = freshClient();
      client.send(REQUEST_CODE, 'a');
      client.send(REQUEST_CODE, 'b');
      const expected = 'hello rpc' + '|' + 'hello rpc';
      expect(client.trace()).assertEqual(expected);
      expect(client.trace()).assertEqual(joined(client.replies, '|'));
      expect(client.trace().length).assertEqual(19);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(2);
      expect(client.results[0].replyText).assertEqual(client.results[1].replyText);
      expect(client.results.length).assertEqual(2);
      expect(repliedCountOf(client)).assertEqual(2);
    });

    /**
     * @tc.name          requestCodeLedgerOrderPreservedAcrossMixedCodes
     * @tc.desc          The ledger preserves the exact mixed send sequence.
     * @tc.precondition  A stub and a mixed code list.
     * @tc.steps         1. Send 0, 1, 2, 1, 99.
     *                   2. Walk the ledger codes.
     *                   3. Compare handled flags per index.
     * @tc.expected      The ledger codes are 0, 1, 2, 1, 99 with flags F,T,F,T,F.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeLedgerOrderPreservedAcrossMixedCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_LARGE];
      replayCodes(stub, codes);
      expect(stub.requestCount()).assertEqual(5);
      for (let index = 0; index < codes.length; index++) {
        expect(stub.requests[index].code).assertEqual(codes[index]);
        expect(stub.requests[index].handled).assertEqual(codes[index] === REQUEST_CODE);
      }
      expect(stub.requests[1].handled).assertTrue();
      expect(stub.requests[3].handled).assertTrue();
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[4].handled).assertFalse();
    });

    /**
     * @tc.name          requestCodeDescriptorUnchangedByRequests
     * @tc.desc          Serving requests never mutates the remote object descriptor.
     * @tc.precondition  A stub with the production descriptor.
     * @tc.steps         1. Record the descriptor.
     *                   2. Replay the matrix.
     *                   3. Compare the descriptor again.
     * @tc.expected      The descriptor is still IPCStubTest after five requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeDescriptorUnchangedByRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const before = stub.descriptor;
      replayCodes(stub, matrixCodes());
      expect(before).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(before);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.requestCount()).assertEqual(5);
      stub.kill();
      expect(stub.descriptor).assertEqual(before);
      stub.reset();
      expect(stub.descriptor).assertEqual(before);
    });

    /**
     * @tc.name          requestCodeStubAliveAfterManyRequests
     * @tc.desc          Many sequential requests do not change the alive flag.
     * @tc.precondition  A fresh stub is available.
     * @tc.steps         1. Send twenty requests with alternating codes.
     *                   2. Check the alive flag.
     *                   3. Count handled entries.
     * @tc.expected      The stub is alive with exactly ten handled entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeStubAliveAfterManyRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 20; index++) {
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO;
        client.send(code, REQUEST_PAYLOAD);
      }
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(20);
      expect(handledCountOf(client)).assertEqual(10);
      expect(client.replies.length).assertEqual(10);
      expect(StubMetrics.from(stub).rejected).assertEqual(10);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0.5);
      const tail = stub.lastRequest();
      expect(tail !== undefined).assertTrue();
      if (tail !== undefined) {
        expect(tail.code).assertEqual(UNKNOWN_CODE_TWO);
      }
    });

    /**
     * @tc.name          requestCodeDoubleResetIsIdempotent
     * @tc.desc          Resetting an already reset stub leaves it empty and alive.
     * @tc.precondition  A stub that was reset once after a matrix run.
     * @tc.steps         1. Replay the matrix and reset.
     *                   2. Reset a second time.
     *                   3. Send code 1 again.
     * @tc.expected      The second reset is harmless and code 1 still works.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeDoubleResetIsIdempotent', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      replayCodes(stub, matrixCodes());
      stub.reset();
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(handledCountOf(client)).assertEqual(1);
    });

    /**
     * @tc.name          requestCodeSeparateStubsDoNotShareLedger
     * @tc.desc          Two stub instances keep independent request histories.
     * @tc.precondition  Two fresh stubs are available.
     * @tc.steps         1. Send code 1 to the first stub.
     *                   2. Send code 2 to the second stub.
     *                   3. Compare their ledgers.
     * @tc.expected      The first ledger holds one success, the second one rejection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeSeparateStubsDoNotShareLedger', 0, () => {
      const first = new InProcessClient(new StubRemoteObjectModel());
      const second = new InProcessClient(new StubRemoteObjectModel());
      first.send(REQUEST_CODE, 'first stub');
      second.send(UNKNOWN_CODE_TWO, 'second stub');
      expect(first.stub.requestCount()).assertEqual(1);
      expect(second.stub.requestCount()).assertEqual(1);
      expect(first.stub.requests[0].handled).assertTrue();
      expect(second.stub.requests[0].handled).assertFalse();
      expect(first.trace()).assertEqual(REPLY_PAYLOAD);
      expect(second.trace()).assertEqual('');
      expect(first.stub === second.stub).assertFalse();
      expect(first.stub.requests.length).assertEqual(1);
    });

    /**
     * @tc.name          requestCodeReplyCustomizationAffectsOnlyNewRequests
     * @tc.desc          Changing replyText leaves earlier ledger entries untouched.
     * @tc.precondition  A stub with one completed request.
     * @tc.steps         1. Send code 1 with default reply.
     *                   2. Change replyText to 'second reply'.
     *                   3. Send code 1 again.
     * @tc.expected      The first entry keeps 'hello rpc', the second gets the new text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeReplyCustomizationAffectsOnlyNewRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, 'one');
      stub.replyText = 'second reply';
      const second = client.send(REQUEST_CODE, 'two');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual('second reply');
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[1].replyText).assertEqual('second reply');
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[1]).assertEqual('second reply');
      expect(client.trace()).assertEqual('hello rpc|second reply');
      expect(handledCountOf(client)).assertEqual(2);
    });

    /**
     * @tc.name          requestCodeUnknownCodeDoesNotConsumePayload
     * @tc.desc          A rejected request never reads the client data sequence.
     * @tc.precondition  A data sequence holding one string.
     * @tc.steps         1. Invoke the stub with code 99.
     *                   2. Read the data cursor and read count.
     *                   3. Invoke with code 1 afterwards.
     * @tc.expected      The unknown call leaves the cursor at zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeUnknownCodeDoesNotConsumePayload', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const rejected = stub.onRemoteMessageRequest(UNKNOWN_CODE_LARGE, data, reply, new MessageOptionModel());
      expect(rejected).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(data.size()).assertEqual(1);
      const accepted = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(accepted).assertTrue();
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[1].text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          requestCodeReplayCodesOrderMatchesInput
     * @tc.desc          replayCodes sends exactly the supplied codes in order.
     * @tc.precondition  A stub and a five-code list.
     * @tc.steps         1. Replay 99, 1, -1, 2, 0.
     *                   2. Compare client send history.
     *                   3. Verify the stub ledger codes.
     * @tc.expected      Both histories equal the supplied order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeReplayCodesOrderMatchesInput', 0, () => {
      const codes: number[] = [UNKNOWN_CODE_LARGE, REQUEST_CODE, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_TWO,
        UNKNOWN_CODE_ZERO];
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, codes);
      expect(client.sentCodes.length).assertEqual(5);
      for (let index = 0; index < codes.length; index++) {
        expect(client.sentCodes[index]).assertEqual(codes[index]);
        expect(stub.requests[index].code).assertEqual(codes[index]);
      }
      expect(stub.requestCount()).assertEqual(5);
      expect(handledCountOf(client)).assertEqual(1);
      expect(client.results[1].isSuccess()).assertTrue();
      expect(client.results[0].isSuccess()).assertFalse();
      expect(client.results[4].isSuccess()).assertFalse();
      expect(client.sentTexts[2]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          requestCodeMatrixClientTextsAllPayload
     * @tc.desc          Every replayed matrix send carries the standard payload.
     * @tc.precondition  A replay of the five-code matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk the sent texts.
     *                   3. Count matches with 'hello world'.
     * @tc.expected      All five send texts equal 'hello world'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeMatrixClientTextsAllPayload', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, matrixCodes());
      expect(client.sentTexts.length).assertEqual(5);
      let matches = 0;
      for (let index = 0; index < client.sentTexts.length; index++) {
        if (client.sentTexts[index] === REQUEST_PAYLOAD) {
          matches = matches + 1;
        }
      }
      expect(matches).assertEqual(5);
      expect(countOf(client.sentTexts, REQUEST_PAYLOAD)).assertEqual(5);
      expect(REQUEST_PAYLOAD).assertEqual('hello world');
      expect(client.sentTexts[0]).assertEqual(client.sentTexts[4]);
      expect(client.sentTexts[2].length).assertEqual(11);
      expect(client.sentCodes.length).assertEqual(client.sentTexts.length);
      expect(stub.requestCount()).assertEqual(5);
    });

    /**
     * @tc.name          requestCodePrewrittenReplySurvivesUnknownCode
     * @tc.desc          A rejected request never appends or clears a prewritten reply.
     * @tc.precondition  A reply sequence preloaded with 'stale'.
     * @tc.steps         1. Write 'stale' into the reply sequence.
     *                   2. Invoke the stub with code 0.
     *                   3. Inspect write count and reads.
     * @tc.expected      The stale text survives and no new write occurs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodePrewrittenReplySurvivesUnknownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      reply.writeString('stale');
      const handled = stub.onRemoteMessageRequest(UNKNOWN_CODE_ZERO, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(reply.writeCount).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual('stale');
      expect(stub.requests[0].replyText).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          requestCodeHandledCodeAppendsToPrewrittenReply
     * @tc.desc          A handled request writes after existing reply content.
     * @tc.precondition  A reply sequence preloaded with 'stale'.
     * @tc.steps         1. Write 'stale' into the reply sequence.
     *                   2. Invoke the stub with code 1.
     *                   3. Read both reply entries.
     * @tc.expected      The first read is 'stale', the second is 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeHandledCodeAppendsToPrewrittenReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      reply.writeString('stale');
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(reply.writeCount).assertEqual(2);
      expect(reply.size()).assertEqual(2);
      expect(reply.readString()).assertEqual('stale');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(2);
      expect(reply.readString()).assertEqual('');
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
    });
    /**
     * @tc.name          requestCodeUnknownRecordOptionIsSync
     * @tc.desc          The client default option is synchronous for rejected codes too.
     * @tc.precondition  A client with one rejected request.
     * @tc.steps         1. Send code 2 through the client.
     *                   2. Read the recorded option string.
     *                   3. Evaluate a default MessageOptionModel.
     * @tc.expected      The recorded option is '0/0/false' and reports sync.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeUnknownRecordOptionIsSync', 0, () => {
      const client = freshClient();
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
      const option = new MessageOptionModel();
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.isSync()).assertTrue();
      expect(option.flags).assertEqual(0);
      expect(option.waitTime).assertEqual(0);
      expect(option.sync).assertFalse();
      expect(client.stub.requests[0].option).assertEqual(option.describe());
    });

    /**
     * @tc.name          requestCodeClientResetClearsResults
     * @tc.desc          Resetting the client clears history and resets the stub.
     * @tc.precondition  A client with one success and one rejection.
     * @tc.steps         1. Send code 1 and code 2.
     *                   2. Reset the client.
     *                   3. Check all histories.
     * @tc.expected      Every client history and the stub ledger are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('requestCodeClientResetClearsResults', 0, () => {
      const client = freshClient();
      client.send(REQUEST_CODE, 'kept?');
      client.send(UNKNOWN_CODE_TWO, 'dropped');
      expect(client.results.length).assertEqual(2);
      client.reset();
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(client.stub.alive).assertTrue();
    });

    /**
     * @tc.name          requestCodeRequestRecordOptionStored
     * @tc.desc          A custom option description is preserved on the ledger entry.
     * @tc.precondition  A stub invoked with an asynchronous option.
     * @tc.steps         1. Build option flags 1, waitTime 250.
     *                   2. Invoke the stub with code 1.
     *                   3. Compare the recorded option.
     * @tc.expected      The entry stores '1/250/false' for the async option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeRequestRecordOptionStored', 0, () => {
      const stub = new StubRemoteObjectModel();
      const option = new MessageOptionModel(1, 250, false);
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(option.describe()).assertEqual('1/250/false');
      expect(stub.requests[0].option).assertEqual('1/250/false');
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(option.waitTime).assertEqual(250);
    });

    /**
     * @tc.name          requestCodeMetricsAfterResetAreZero
     * @tc.desc          Metrics built after a reset report no traffic and ratio zero.
     * @tc.precondition  A stub reset after a matrix replay.
     * @tc.steps         1. Replay the matrix.
     *                   2. Reset the stub.
     *                   3. Rebuild the metrics.
     * @tc.expected      All metric counters are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeMetricsAfterResetAreZero', 0, () => {
      const stub = new StubRemoteObjectModel();
      replayCodes(stub, matrixCodes());
      expect(StubMetrics.from(stub).requests).assertEqual(5);
      stub.reset();
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
      expect(metrics.fingerprint()).assertLess(500000);
    });

    /**
     * @tc.name          requestCodeRejectListWithSeveralCodes
     * @tc.desc          Multiple reject entries block only the listed codes.
     * @tc.precondition  A stub whose reject list holds 0 and 2.
     * @tc.steps         1. Push 0 and 2 into rejectCodes.
     *                   2. Send 0, 2 and 1.
     *                   3. Inspect the results.
     * @tc.expected      Codes 0 and 2 are rejected while code 1 is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('requestCodeRejectListWithSeveralCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(UNKNOWN_CODE_ZERO);
      stub.rejectCodes.push(UNKNOWN_CODE_TWO);
      const zero = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const two = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const one = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(zero.isSuccess()).assertFalse();
      expect(two.isSuccess()).assertFalse();
      expect(one.isSuccess()).assertTrue();
      expect(one.replyText).assertEqual(REPLY_PAYLOAD);
      expect(handledCountOf(client)).assertEqual(1);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[2].handled).assertTrue();
      expect(client.replies.length).assertEqual(1);
    });
  });
}






