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
  StubMetrics,
  expectedHandled,
  expectedReplyFor,
  isKnownRequestCode,
  replayCodes,
  countOf,
  textFingerprint
} from '../Shared/SharedDriver';

/**
 * Unknown code matrix for the IPC stub protocol.
 *
 * Production anchor: ServiceExtAbility.ets 35-38 logs the unknown code and
 * returns false. Every code other than 1 must be refused without reading
 * data or writing a reply.
 */

function unknownMatrix(): number[] {
  return [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
}

function mixedMatrix(): number[] {
  return [UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO, UNKNOWN_CODE_LARGE];
}

function matrixClient(): InProcessClient {
  return new InProcessClient(new StubRemoteObjectModel());
}

function successCount(client: InProcessClient): number {
  let total = 0;
  for (let index = 0; index < client.results.length; index++) {
    if (client.results[index].isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

function rejectedCount(client: InProcessClient): number {
  return client.results.length - successCount(client);
}

function countOfNumbers(values: number[], target: number): number {
  let total = 0;
  for (let index = 0; index < values.length; index++) {
    if (values[index] === target) {
      total = total + 1;
    }
  }
  return total;
}

function codeAt(codes: number[], index: number): number {
  return codes[index];
}

function replayMatrix(codes: number[]): InProcessClient {
  return replayCodes(new StubRemoteObjectModel(), codes);
}

export default function unknownCodeMatrixTest(): void {
  describe('UnknownCodeMatrixTest', () => {
    beforeAll(() => {
      logSuite('UnknownCodeMatrixTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('UnknownCodeMatrixTest', 'end');
    });

    /**
     * @tc.name          unknownCodeZeroRejected
     * @tc.desc          Code 0 is refused by the stub.
     * @tc.precondition  A fresh stub and client.
     * @tc.steps         1. Send code 0.
     *                   2. Read the result fields.
     *                   3. Compare with the rejection oracle.
     * @tc.expected      The request is unhandled with error 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('unknownCodeZeroRejected', 0, () => {
      const client = matrixClient();
      const result = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(client.stub.requests[0].handled).assertFalse();
      expect(client.replies.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          unknownCodeTwoRejected
     * @tc.desc          Code 2 is refused by the stub.
     * @tc.precondition  A fresh stub and client.
     * @tc.steps         1. Send code 2.
     *                   2. Read the ledger entry.
     *                   3. Compare with the rejection oracle.
     * @tc.expected      The entry records code 2 with handled false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('unknownCodeTwoRejected', 0, () => {
      const client = matrixClient();
      const result = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      const record = client.stub.requests[0];
      expect(record.code).assertEqual(UNKNOWN_CODE_TWO);
      expect(record.handled).assertFalse();
      expect(record.replyText).assertEqual('');
      expect(record.describe()).assertEqual('2///false');
      expect(expectedHandled(2)).assertFalse();
    });

    /**
     * @tc.name          unknownCodeNegativeRejected
     * @tc.desc          Code -1 is refused by the stub.
     * @tc.precondition  A fresh stub and client.
     * @tc.steps         1. Send code -1.
     *                   2. Compare the result and ledger.
     *                   3. Check the payload was not read.
     * @tc.expected      The request is unhandled and stores no text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('unknownCodeNegativeRejected', 0, () => {
      const client = matrixClient();
      const result = client.send(UNKNOWN_CODE_NEGATIVE, 'negative payload');
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(client.stub.requests[0].code).assertEqual(-1);
      expect(client.stub.requests[0].text).assertEqual('');
      expect(client.sentTexts[0]).assertEqual('negative payload');
      expect(expectedHandled(-1)).assertFalse();
      expect(expectedReplyFor(-1)).assertEqual('');
    });

    /**
     * @tc.name          unknownCodeLargeRejected
     * @tc.desc          Code 99 is refused by the stub.
     * @tc.precondition  A fresh stub and client.
     * @tc.steps         1. Send code 99.
     *                   2. Read the result and record.
     *                   3. Compare the option and reply fields.
     * @tc.expected      Code 99 is recorded as unhandled with no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('unknownCodeLargeRejected', 0, () => {
      const client = matrixClient();
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.stub.requests[0].code).assertEqual(99);
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
      expect(client.stub.requests[0].replyText).assertEqual('');
      expect(expectedHandled(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(client.results.length).assertEqual(1);
    });
    /**
     * @tc.name          unknownCodeAllFourRejected
     * @tc.desc          The four representative unknown codes are all refused.
     * @tc.precondition  A client replaying the unknown matrix.
     * @tc.steps         1. Replay the unknown matrix.
     *                   2. Count successful results.
     *                   3. Compare with zero.
     * @tc.expected      No request in the matrix succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('unknownCodeAllFourRejected', 0, () => {
      const client = replayMatrix(unknownMatrix());
      expect(client.results.length).assertEqual(4);
      expect(successCount(client)).assertEqual(0);
      expect(rejectedCount(client)).assertEqual(4);
      expect(client.replies.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(4);
      for (let index = 0; index < client.results.length; index++) {
        expect(client.results[index].handled).assertFalse();
        expect(client.results[index].errCode).assertEqual(ERROR_STUB_REJECTED);
      }
      expect(StubMetrics.from(client.stub).handled).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeMatrixHandledCountZero
     * @tc.desc          expectedHandled is false for every matrix entry.
     * @tc.precondition  The unknown matrix and oracle are available.
     * @tc.steps         1. Walk the matrix.
     *                   2. Evaluate the oracle per entry.
     *                   3. Count handled codes.
     * @tc.expected      The oracle reports zero handled codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixHandledCountZero', 0, () => {
      const codes = unknownMatrix();
      let handled = 0;
      for (let index = 0; index < codes.length; index++) {
        if (expectedHandled(codeAt(codes, index))) {
          handled = handled + 1;
        }
      }
      expect(handled).assertEqual(0);
      expect(codes.length).assertEqual(4);
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
    });

    /**
     * @tc.name          unknownCodeMatrixRepliesEmpty
     * @tc.desc          No matrix request produces reply text.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk each result reply.
     *                   3. Compare total reply length with zero.
     * @tc.expected      Every reply is empty and the trace is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixRepliesEmpty', 0, () => {
      const client = replayMatrix(unknownMatrix());
      let totalLength = 0;
      for (let index = 0; index < client.results.length; index++) {
        expect(client.results[index].replyText).assertEqual('');
        totalLength = totalLength + client.results[index].replyText.length;
      }
      expect(totalLength).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(0);
      expect(StubMetrics.from(client.stub).replies).assertEqual(0);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeMatrixLedgerSize
     * @tc.desc          The ledger contains one rejected entry per matrix code.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Compare ledger size and stub counter.
     *                   3. Count unhandled entries.
     * @tc.expected      Four unhandled entries exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixLedgerSize', 0, () => {
      const client = replayMatrix(unknownMatrix());
      expect(client.stub.requests.length).assertEqual(4);
      expect(client.stub.requestCount()).assertEqual(4);
      expect(client.stub.requests.length).assertEqual(client.results.length);
      let unhandled = 0;
      for (let index = 0; index < client.stub.requests.length; index++) {
        if (!client.stub.requests[index].handled) {
          unhandled = unhandled + 1;
        }
      }
      expect(unhandled).assertEqual(4);
      expect(unhandled).assertEqual(client.stub.requests.length);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(4);
    });

    /**
     * @tc.name          unknownCodeMatrixOrderPreserved
     * @tc.desc          The ledger keeps the matrix order even when all codes fail.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk the ledger codes.
     *                   3. Compare each with the matrix.
     * @tc.expected      The ledger codes equal the matrix codes in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixOrderPreserved', 0, () => {
      const codes = unknownMatrix();
      const client = replayMatrix(codes);
      for (let index = 0; index < codes.length; index++) {
        expect(client.stub.requests[index].code).assertEqual(codes[index]);
        expect(client.sentCodes[index]).assertEqual(codes[index]);
      }
      expect(client.stub.requests[0].code).assertEqual(0);
      expect(client.stub.requests[1].code).assertEqual(2);
      expect(client.stub.requests[2].code).assertEqual(-1);
      expect(client.stub.requests[3].code).assertEqual(99);
      expect(client.stub.requests[3].code).assertEqual(codes[codes.length - 1]);
      expect(client.sentCodes.length).assertEqual(codes.length);
    });

    /**
     * @tc.name          unknownCodeMatrixOracleAgrees
     * @tc.desc          The oracle matches the stub for all matrix codes.
     * @tc.precondition  A manual stub invocation loop.
     * @tc.steps         1. Invoke the stub once per matrix code.
     *                   2. Compare each return with the oracle.
     *                   3. Count disagreements.
     * @tc.expected      No disagreement appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixOracleAgrees', 0, () => {
      const codes = unknownMatrix();
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      let disagreements = 0;
      for (let index = 0; index < codes.length; index++) {
        const handled = stub.onRemoteMessageRequest(codes[index], data, MessageSequenceModel.create(),
          new MessageOptionModel());
        if (handled !== expectedHandled(codes[index])) {
          disagreements = disagreements + 1;
        }
      }
      expect(disagreements).assertEqual(0);
      expect(stub.requestCount()).assertEqual(4);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[3].handled).assertFalse();
      expect(data.readCount).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeMatrixUniqueCodes
     * @tc.desc          The matrix contains four distinct unknown codes.
     * @tc.precondition  The matrix helper is available.
     * @tc.steps         1. Read the matrix.
     *                   2. Collect unique values.
     *                   3. Compare lengths.
     * @tc.expected      Four unique codes remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixUniqueCodes', 0, () => {
      const codes = unknownMatrix();
      const unique: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        if (unique.indexOf(codes[index]) < 0) {
          unique.push(codes[index]);
        }
      }
      expect(unique.length).assertEqual(codes.length);
      expect(unique.length).assertEqual(4);
      expect(codes.indexOf(REQUEST_CODE)).assertEqual(-1);
      expect(codes[0] === codes[1]).assertFalse();
      expect(codes[4 - 1]).assertEqual(UNKNOWN_CODE_LARGE);
      expect(unique.indexOf(99)).assertEqual(3);
      expect(unique.indexOf(0)).assertEqual(0);
      expect(unique.indexOf(-1)).assertEqual(2);
    });

    /**
     * @tc.name          unknownCodeMatrixMetricsRatioZero
     * @tc.desc          An all-unknown run reports a zero success ratio.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Build metrics.
     *                   3. Compare ratio and counters.
     * @tc.expected      The ratio is zero with four requests and four rejections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixMetricsRatioZero', 0, () => {
      const client = replayMatrix(unknownMatrix());
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(4);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.successRatio()).assertLess(0.01);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('4:0:4:0'));
      expect(metrics.requests).assertEqual(client.stub.requestCount());
    });

    /**
     * @tc.name          unknownCodeMatrixFingerprintStable
     * @tc.desc          Two identical unknown matrices share one metrics fingerprint.
     * @tc.precondition  Two independent stubs.
     * @tc.steps         1. Replay the matrix on both stubs.
     *                   2. Build both metrics.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints and counters match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeMatrixFingerprintStable', 0, () => {
      const first = replayMatrix(unknownMatrix());
      const second = replayMatrix(unknownMatrix());
      const firstMetrics = StubMetrics.from(first.stub);
      const secondMetrics = StubMetrics.from(second.stub);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.fingerprint()).assertEqual(textFingerprint('4:0:4:0'));
      expect(firstMetrics.rejected).assertEqual(secondMetrics.rejected);
      expect(firstMetrics.handled).assertEqual(0);
      expect(firstMetrics.successRatio()).assertEqual(0);
      expect(first.stub.requestCount()).assertEqual(second.stub.requestCount());
      expect(first.trace()).assertEqual(second.trace());
      expect(first.results.length).assertEqual(second.results.length);
    });

    /**
     * @tc.name          unknownCodeRepeatedCodeTwoAccumulates
     * @tc.desc          Repeating code 2 adds one rejection entry per attempt.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send code 2 four times.
     *                   2. Compare ledger size.
     *                   3. Count rejected entries.
     * @tc.expected      Four rejection entries exist with no replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeRepeatedCodeTwoAccumulates', 0, () => {
      const client = matrixClient();
      client.sendMany(4, UNKNOWN_CODE_TWO);
      expect(client.stub.requestCount()).assertEqual(4);
      expect(client.results.length).assertEqual(4);
      expect(rejectedCount(client)).assertEqual(4);
      expect(successCount(client)).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(4);
      expect(countOfNumbers(client.sentCodes, 2)).assertEqual(4);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(4);
    });

    /**
     * @tc.name          unknownCodeMixedMatrixOneSuccess
     * @tc.desc          A mixed matrix with one code 1 request yields one success.
     * @tc.precondition  The mixed matrix is available.
     * @tc.steps         1. Replay 0, 1, 2 and 99.
     *                   2. Count successes and rejections.
     *                   3. Compare the reply trace.
     * @tc.expected      Exactly one request succeeds with 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMixedMatrixOneSuccess', 0, () => {
      const client = replayMatrix(mixedMatrix());
      expect(successCount(client)).assertEqual(1);
      expect(rejectedCount(client)).assertEqual(3);
      expect(client.results[1].isSuccess()).assertTrue();
      expect(client.results[1].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0.25);
      expect(client.stub.requests[1].handled).assertTrue();
    });

    /**
     * @tc.name          unknownCodeUnknownBeforeKnown
     * @tc.desc          An unknown code before code 1 does not prevent success.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send code 0.
     *                   2. Send code 1.
     *                   3. Compare both results.
     * @tc.expected      The first fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeUnknownBeforeKnown', 0, () => {
      const client = matrixClient();
      const first = client.send(UNKNOWN_CODE_ZERO, 'first payload');
      const second = client.send(REQUEST_CODE, 'second payload');
      expect(first.isSuccess()).assertFalse();
      expect(first.replyText).assertEqual('');
      expect(second.isSuccess()).assertTrue();
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requests[0].handled).assertFalse();
      expect(client.stub.requests[1].handled).assertTrue();
      expect(client.stub.requests[1].text).assertEqual('second payload');
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(1);
    });

    /**
     * @tc.name          unknownCodeKnownAfterAllUnknowns
     * @tc.desc          Code 1 still works after the whole unknown matrix.
     * @tc.precondition  A client that replayed the unknown matrix.
     * @tc.steps         1. Replay the four unknown codes.
     *                   2. Send code 1.
     *                   3. Compare the final result.
     * @tc.expected      The final result succeeds after four failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeKnownAfterAllUnknowns', 0, () => {
      const client = replayMatrix(unknownMatrix());
      const last = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(last.isSuccess()).assertTrue();
      expect(last.errCode).assertEqual(ERROR_NONE);
      expect(last.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(5);
      expect(client.results.length).assertEqual(5);
      expect(successCount(client)).assertEqual(1);
      expect(rejectedCount(client)).assertEqual(4);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0.2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          unknownCodeUnknownAfterKnown
     * @tc.desc          A trailing unknown code does not erase the earlier reply.
     * @tc.precondition  A client with one success.
     * @tc.steps         1. Send code 1.
     *                   2. Send code 99.
     *                   3. Compare the reply trace.
     * @tc.expected      The trace keeps the single success while the last fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeUnknownAfterKnown', 0, () => {
      const client = matrixClient();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const last = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(last.isSuccess()).assertFalse();
      expect(last.replyText).assertEqual('');
      expect(client.replies.length).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(client.results[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requests[1].handled).assertFalse();
      expect(client.stub.requestCount()).assertEqual(2);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      expect(StubMetrics.from(client.stub).handled).assertEqual(1);
    });

    /**
     * @tc.name          unknownCodeAlternatingMatrix
     * @tc.desc          Alternating known and unknown codes yields half successes.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send 0, 1, 2, 1, -1, 1.
     *                   2. Count successes.
     *                   3. Compare the ratio.
     * @tc.expected      Three successes and three rejections appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeAlternatingMatrix', 0, () => {
      const client = matrixClient();
      const codes: number[] = [UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE,
        UNKNOWN_CODE_NEGATIVE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      expect(client.results.length).assertEqual(6);
      expect(successCount(client)).assertEqual(3);
      expect(rejectedCount(client)).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(client.trace()).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0.5);
      expect(client.stub.requests[0].handled).assertFalse();
      expect(client.stub.requests[5].handled).assertTrue();
    });

    /**
     * @tc.name          unknownCodeSentCodesRecorded
     * @tc.desc          The send history stores every unknown code in order.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Read the send history.
     *                   3. Compare with the matrix.
     * @tc.expected      The history equals the matrix exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeSentCodesRecorded', 0, () => {
      const codes = unknownMatrix();
      const client = replayMatrix(codes);
      expect(client.sentCodes.length).assertEqual(4);
      expect(client.sentCodes[0]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(client.sentCodes[1]).assertEqual(UNKNOWN_CODE_TWO);
      expect(client.sentCodes[2]).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(client.sentCodes[3]).assertEqual(UNKNOWN_CODE_LARGE);
      expect(client.sentCodes.length).assertEqual(codes.length);
      expect(client.sentCodes[3]).assertEqual(codes[3]);
      expect(client.sentTexts.length).assertEqual(4);
      expect(client.sentCodes.indexOf(REQUEST_CODE)).assertEqual(-1);
    });

    /**
     * @tc.name          unknownCodeSentTextsRecorded
     * @tc.desc          Payloads sent with unknown codes stay in the send history.
     * @tc.precondition  A client using custom payloads.
     * @tc.steps         1. Send three unknown codes with distinct payloads.
     *                   2. Read the sent text history.
     *                   3. Compare with the payloads.
     * @tc.expected      The payload history mirrors the inputs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeSentTextsRecorded', 0, () => {
      const client = matrixClient();
      client.send(UNKNOWN_CODE_ZERO, 'zero payload');
      client.send(UNKNOWN_CODE_TWO, 'two payload');
      client.send(UNKNOWN_CODE_LARGE, 'large payload');
      expect(client.sentTexts.length).assertEqual(3);
      expect(client.sentTexts[0]).assertEqual('zero payload');
      expect(client.sentTexts[1]).assertEqual('two payload');
      expect(client.sentTexts[2]).assertEqual('large payload');
      expect(client.sentTexts[2].length).assertEqual(13);
      expect(client.stub.requests[0].text).assertEqual('');
      expect(client.stub.requests[1].text).assertEqual('');
      expect(countOf(client.sentTexts, 'two payload')).assertEqual(1);
    });

    /**
     * @tc.name          unknownCodeNoDataRead
     * @tc.desc          Refused requests never read the data sequence.
     * @tc.precondition  Manual sequences holding one payload.
     * @tc.steps         1. Invoke the stub with each unknown code.
     *                   2. Compare the data cursor and read count.
     *                   3. Check the payload remains readable.
     * @tc.expected      The data sequence is untouched.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeNoDataRead', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const codes = unknownMatrix();
      for (let index = 0; index < codes.length; index++) {
        stub.onRemoteMessageRequest(codes[index], data, MessageSequenceModel.create(), new MessageOptionModel());
      }
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(data.size()).assertEqual(1);
      expect(data.trace()).assertEqual('hello world#0');
      expect(data.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requestCount()).assertEqual(4);
      expect(stub.requests[3].text).assertEqual('');
    });

    /**
     * @tc.name          unknownCodeNoReplyWrite
     * @tc.desc          Refused requests never write into the reply sequence.
     * @tc.precondition  A shared empty reply sequence.
     * @tc.steps         1. Invoke the stub with each unknown code.
     *                   2. Compare the reply write count and size.
     *                   3. Attempt a reply read.
     * @tc.expected      The reply stays empty with zero writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeNoReplyWrite', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const codes = unknownMatrix();
      for (let index = 0; index < codes.length; index++) {
        stub.onRemoteMessageRequest(codes[index], data, reply, new MessageOptionModel());
      }
      expect(reply.writeCount).assertEqual(0);
      expect(reply.size()).assertEqual(0);
      expect(reply.values.length).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(0);
      expect(reply.trace()).assertEqual('#0');
      expect(stub.requestCount()).assertEqual(4);
      expect(stub.requests[0].replyText).assertEqual('');
    });

    /**
     * @tc.name          unknownCodeRecordTextEmpty
     * @tc.desc          The ledger stores no request text for unknown codes.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk the ledger request texts.
     *                   3. Sum their lengths.
     * @tc.expected      Every request text is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeRecordTextEmpty', 0, () => {
      const client = replayMatrix(unknownMatrix());
      let totalLength = 0;
      for (let index = 0; index < client.stub.requests.length; index++) {
        expect(client.stub.requests[index].text).assertEqual('');
        totalLength = totalLength + client.stub.requests[index].text.length;
      }
      expect(totalLength).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(4);
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.stub.requests[0].text === REQUEST_PAYLOAD).assertFalse();
      expect(client.stub.requests[3].text.length).assertEqual(0);
      expect(client.stub.requests.length).assertEqual(4);
    });

    /**
     * @tc.name          unknownCodeRecordReplyEmpty
     * @tc.desc          The ledger stores no reply text for unknown codes.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk the ledger reply texts.
     *                   3. Count non-empty replies.
     * @tc.expected      All reply text fields are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeRecordReplyEmpty', 0, () => {
      const client = replayMatrix(unknownMatrix());
      let nonEmpty = 0;
      for (let index = 0; index < client.stub.requests.length; index++) {
        expect(client.stub.requests[index].replyText).assertEqual('');
        if (client.stub.requests[index].replyText.length > 0) {
          nonEmpty = nonEmpty + 1;
        }
      }
      expect(nonEmpty).assertEqual(0);
      expect(client.stub.requests[0].replyText === REPLY_PAYLOAD).assertFalse();
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(0);
      expect(client.stub.requests[3].replyText.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).replies).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeRecordHandledFalse
     * @tc.desc          Every unknown ledger entry reports handled false.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk the handled flags.
     *                   3. Count true flags.
     * @tc.expected      No entry reports handled true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeRecordHandledFalse', 0, () => {
      const client = replayMatrix(unknownMatrix());
      let handledTrue = 0;
      for (let index = 0; index < client.stub.requests.length; index++) {
        expect(client.stub.requests[index].handled).assertFalse();
        if (client.stub.requests[index].handled) {
          handledTrue = handledTrue + 1;
        }
      }
      expect(handledTrue).assertEqual(0);
      expect(client.stub.requests[0].describe().endsWith('/false')).assertTrue();
      expect(client.stub.requests[1].describe()).assertEqual('2///false');
      expect(client.stub.requests[2].describe()).assertEqual('-1///false');
      expect(client.stub.requests[3].describe()).assertEqual('99///false');
      expect(StubMetrics.from(client.stub).handled).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeOptionDefault
     * @tc.desc          Unknown code entries record the default synchronous option.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk the option strings.
     *                   3. Compare with the default description.
     * @tc.expected      Every entry records '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeOptionDefault', 0, () => {
      const client = replayMatrix(unknownMatrix());
      const defaultDescription = new MessageOptionModel().describe();
      for (let index = 0; index < client.stub.requests.length; index++) {
        expect(client.stub.requests[index].option).assertEqual('0/0/false');
        expect(client.stub.requests[index].option).assertEqual(defaultDescription);
      }
      expect(defaultDescription).assertEqual('0/0/false');
      expect(countOf([client.stub.requests[0].option], defaultDescription)).assertEqual(1);
      expect(client.stub.requests[0].option).assertEqual(client.stub.requests[3].option);
      expect(client.stub.requests[3].option.length).assertEqual(9);
      expect(new MessageOptionModel().isSync()).assertTrue();
    });

    /**
     * @tc.name          unknownCodeErrorCodeRejected
     * @tc.desc          Every unknown result maps to the rejection error code.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Walk the result error codes.
     *                   3. Count mismatches with the constant.
     * @tc.expected      Four rejection codes and no other value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeErrorCodeRejected', 0, () => {
      const client = replayMatrix(unknownMatrix());
      let mismatches = 0;
      for (let index = 0; index < client.results.length; index++) {
        if (client.results[index].errCode !== ERROR_STUB_REJECTED) {
          mismatches = mismatches + 1;
        }
        expect(client.results[index].isSuccess()).assertFalse();
      }
      expect(mismatches).assertEqual(0);
      expect(client.results.length).assertEqual(4);
      expect(client.results[0].errCode).assertEqual(16000011);
      expect(client.results[3].errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(countOfNumbers([client.results[0].errCode], ERROR_NONE)).assertEqual(0);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeResultNotSuccess
     * @tc.desc          No unknown result satisfies the success predicate.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Evaluate isSuccess per result.
     *                   3. Count successful results.
     * @tc.expected      Zero results are successful.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeResultNotSuccess', 0, () => {
      const client = replayMatrix(unknownMatrix());
      let successes = 0;
      for (let index = 0; index < client.results.length; index++) {
        expect(client.results[index].isSuccess()).assertFalse();
        if (client.results[index].isSuccess()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(0);
      expect(successes).assertEqual(client.results.length - rejectedCount(client));
      expect(client.results[0].handled).assertFalse();
      expect(client.results[3].handled).assertFalse();
      expect(client.results[2].replyText).assertEqual('');
      expect(successCount(client)).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeKilledStubMatrix
     * @tc.desc          A killed stub refuses the whole matrix without replying.
     * @tc.precondition  A killed stub and a client.
     * @tc.steps         1. Kill the stub.
     *                   2. Replay the unknown matrix.
     *                   3. Compare the ledger and replies.
     * @tc.expected      Four entries appear with no handled request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeKilledStubMatrix', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const codes = unknownMatrix();
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      expect(stub.requestCount()).assertEqual(4);
      expect(successCount(client)).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[3].handled).assertFalse();
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
      expect(stub.alive).assertFalse();
    });

    /**
     * @tc.name          unknownCodeRejectListMatrix
     * @tc.desc          Reject-list entries add nothing to the unknown matrix outcome.
     * @tc.precondition  A stub whose reject list holds code 1.
     * @tc.steps         1. Add code 1 to the reject list.
     *                   2. Replay the unknown matrix.
     *                   3. Compare the rejection totals.
     * @tc.expected      All four matrix requests remain rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeRejectListMatrix', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      const codes = unknownMatrix();
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      expect(rejectedCount(client)).assertEqual(4);
      expect(successCount(client)).assertEqual(0);
      expect(stub.rejectCodes.length).assertEqual(1);
      expect(stub.rejectCodes[0]).assertEqual(REQUEST_CODE);
      expect(stub.requestCount()).assertEqual(4);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeResetThenKnown
     * @tc.desc          A reset after the unknown matrix restores code 1 handling.
     * @tc.precondition  A client that replayed the matrix.
     * @tc.steps         1. Replay the unknown matrix.
     *                   2. Reset the stub.
     *                   3. Send code 1.
     * @tc.expected      The post-reset request is the only ledger entry and succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeResetThenKnown', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      replayCodes(stub, unknownMatrix());
      expect(stub.requestCount()).assertEqual(4);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].handled).assertTrue();
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          unknownCodeReviveThenKnown
     * @tc.desc          Reviving after a killed matrix restores code 1 handling.
     * @tc.precondition  A killed stub after a matrix replay.
     * @tc.steps         1. Kill the stub and replay the matrix.
     *                   2. Revive the stub.
     *                   3. Send code 1.
     * @tc.expected      Only the revived request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeReviveThenKnown', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      replayCodes(stub, unknownMatrix());
      expect(stub.requestCount()).assertEqual(4);
      stub.revive();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(5);
      expect(stub.requests[4].handled).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(successCount(client)).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
    });

    /**
     * @tc.name          unknownCodeKillReviveMatrix
     * @tc.desc          A kill-revive cycle around the matrix yields one success.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send code 0 while alive.
     *                   2. Kill, send code 2, revive, send code 1.
     *                   3. Compare the results.
     * @tc.expected      Only the last request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeKillReviveMatrix', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(UNKNOWN_CODE_ZERO, 'alive unknown');
      stub.kill();
      const second = client.send(UNKNOWN_CODE_TWO, 'dead unknown');
      stub.revive();
      const third = client.send(REQUEST_CODE, 'revived known');
      expect(first.isSuccess()).assertFalse();
      expect(second.isSuccess()).assertFalse();
      expect(third.isSuccess()).assertTrue();
      expect(third.replyText).assertEqual(REPLY_PAYLOAD);
      expect(successCount(client)).assertEqual(1);
      expect(rejectedCount(client)).assertEqual(2);
      expect(client.replies.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[2].text).assertEqual('revived known');
    });

    /**
     * @tc.name          unknownCodeDescriptorStable
     * @tc.desc          The descriptor never changes while unknown codes are refused.
     * @tc.precondition  A stub with the production descriptor.
     * @tc.steps         1. Record the descriptor.
     *                   2. Replay the unknown matrix.
     *                   3. Compare the descriptor again.
     * @tc.expected      The descriptor stays IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeDescriptorStable', 0, () => {
      const stub = new StubRemoteObjectModel();
      const before = stub.descriptor;
      replayCodes(stub, unknownMatrix());
      expect(stub.descriptor).assertEqual(before);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(before).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requestCount()).assertEqual(4);
      stub.kill();
      expect(stub.descriptor).assertEqual(before);
      stub.reset();
      expect(stub.descriptor).assertEqual(before);
    });

    /**
     * @tc.name          unknownCodeAliveAfterMatrix
     * @tc.desc          Refusing four unknown codes leaves the stub alive.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Replay the unknown matrix.
     *                   2. Read the alive flag.
     *                   3. Send code 1 afterwards.
     * @tc.expected      The stub stays alive and still accepts code 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeAliveAfterMatrix', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      replayCodes(stub, unknownMatrix());
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(4);
      const known = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(known.isSuccess()).assertTrue();
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(5);
      expect(stub.requests[4].handled).assertTrue();
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
    });

    /**
     * @tc.name          unknownCodeClientResetClears
     * @tc.desc          A client reset removes the unknown matrix history.
     * @tc.precondition  A client with four rejections.
     * @tc.steps         1. Replay the matrix.
     *                   2. Reset the client.
     *                   3. Read all histories.
     * @tc.expected      Results, replies, sends and ledger are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeClientResetClears', 0, () => {
      const client = replayMatrix(unknownMatrix());
      expect(client.results.length).assertEqual(4);
      client.reset();
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.trace()).assertEqual('');
      const known = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(known.isSuccess()).assertTrue();
    });

    /**
     * @tc.name          unknownCodeSendManyZero
     * @tc.desc          sendMany with count zero performs no unknown request.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Call sendMany with count 0 and code 99.
     *                   2. Read the return value.
     *                   3. Compare the ledger.
     * @tc.expected      Nothing is sent and zero is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeSendManyZero', 0, () => {
      const client = matrixClient();
      const handled = client.sendMany(0, UNKNOWN_CODE_LARGE);
      expect(handled).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(client.stub.lastRequest() === undefined).assertTrue();
      expect(StubMetrics.from(client.stub).requests).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeSendManyUnknown
     * @tc.desc          sendMany with an unknown code reports zero handled.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Call sendMany with count 5 and code -1.
     *                   2. Read the return value.
     *                   3. Count ledger entries.
     * @tc.expected      Five entries exist and the handled return value is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeSendManyUnknown', 0, () => {
      const client = matrixClient();
      const handled = client.sendMany(5, UNKNOWN_CODE_NEGATIVE);
      expect(handled).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(5);
      expect(client.results.length).assertEqual(5);
      expect(client.sentCodes.length).assertEqual(5);
      expect(rejectedCount(client)).assertEqual(5);
      expect(client.stub.requests[0].code).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(client.stub.requests[4].code).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(5);
    });

    /**
     * @tc.name          unknownCodeManualSequencesUntouched
     * @tc.desc          A refused request leaves both manual sequences unchanged.
     * @tc.precondition  Manual data and reply sequences with content.
     * @tc.steps         1. Preload both sequences.
     *                   2. Invoke the stub with code 0.
     *                   3. Compare both traces.
     * @tc.expected      The data and reply contents are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeManualSequencesUntouched', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('untouched data');
      reply.writeString('untouched reply');
      const handled = stub.onRemoteMessageRequest(UNKNOWN_CODE_ZERO, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(data.trace()).assertEqual('untouched data#0');
      expect(reply.trace()).assertEqual('untouched reply#0');
      expect(data.readCount).assertEqual(0);
      expect(reply.readCount).assertEqual(0);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.readString()).assertEqual('untouched reply');
      expect(stub.requests[0].replyText).assertEqual('');
    });

    /**
     * @tc.name          unknownCodeReplySequenceEmpty
     * @tc.desc          A fresh reply sequence remains empty after a refusal.
     * @tc.precondition  A fresh reply sequence.
     * @tc.steps         1. Invoke the stub with code 2.
     *                   2. Compare reply size and trace.
     *                   3. Read the reply once.
     * @tc.expected      The reply stays empty with zero writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeReplySequenceEmpty', 0, () => {
      const reply = MessageSequenceModel.create();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const stub = new StubRemoteObjectModel();
      stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(0);
      expect(reply.writeCount).assertEqual(0);
      expect(reply.trace()).assertEqual('#0');
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(0);
      expect(reply.values.length).assertEqual(0);
      expect(stub.requests[0].replyText).assertEqual('');
      expect(reply.reclaimed).assertFalse();
    });

    /**
     * @tc.name          unknownCodeDataCursorZero
     * @tc.desc          A refused request leaves the data cursor at zero.
     * @tc.precondition  A data sequence with two values.
     * @tc.steps         1. Invoke the stub with code 99.
     *                   2. Compare the cursor.
     *                   3. Send code 1 afterwards.
     * @tc.expected      The cursor stays 0 until an accepted request reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeDataCursorZero', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString('value one');
      data.writeString('value two');
      stub.onRemoteMessageRequest(UNKNOWN_CODE_LARGE, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(data.trace()).assertEqual('value one|value two#0');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(stub.requests[1].text).assertEqual('value one');
      expect(stub.requests[0].text).assertEqual('');
    });

    /**
     * @tc.name          unknownCodeFiveCodeLedger
     * @tc.desc          A five-code ledger keeps every entry distinct and rejected.
     * @tc.precondition  A client with five unknown codes including a duplicate.
     * @tc.steps         1. Send 0, 2, -1, 99 and 0.
     *                   2. Read the ledger codes.
     *                   3. Compare the duplicate positions.
     * @tc.expected      The ledger holds five rejected entries with code 0 repeated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeFiveCodeLedger', 0, () => {
      const codes: number[] = [0, 2, -1, 99, 0];
      const client = replayMatrix(codes);
      expect(client.stub.requestCount()).assertEqual(5);
      for (let index = 0; index < codes.length; index++) {
        expect(client.stub.requests[index].code).assertEqual(codes[index]);
        expect(client.stub.requests[index].handled).assertFalse();
      }
      expect(client.stub.requests[0].code).assertEqual(client.stub.requests[4].code);
      expect(client.stub.requests[0] === client.stub.requests[4]).assertFalse();
      expect(countOfNumbers([client.stub.requests[0].code, client.stub.requests[4].code], 0)).assertEqual(2);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(5);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          unknownCodeAllPairwiseDistinct
     * @tc.desc          The four unknown codes differ pairwise from each other and from 1.
     * @tc.precondition  The unknown matrix is available.
     * @tc.steps         1. Compare each pair.
     *                   2. Compare each code with 1.
     *                   3. Count comparisons.
     * @tc.expected      Every comparison is unequal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeAllPairwiseDistinct', 0, () => {
      const codes = unknownMatrix();
      let comparisons = 0;
      for (let left = 0; left < codes.length; left++) {
        expect(codes[left] === REQUEST_CODE).assertFalse();
        for (let right = left + 1; right < codes.length; right++) {
          expect(codes[left] === codes[right]).assertFalse();
          comparisons = comparisons + 1;
        }
      }
      expect(comparisons).assertEqual(6);
      expect(codes.length).assertEqual(4);
      expect(codes[0]).assertEqual(0);
      expect(codes[1]).assertEqual(2);
      expect(codes[2]).assertEqual(-1);
      expect(codes[3]).assertEqual(99);
    });

    /**
     * @tc.name          unknownCodeNotEqualToRequestCode
     * @tc.desc          No unknown matrix code equals the accepted request code.
     * @tc.precondition  The unknown matrix is available.
     * @tc.steps         1. Walk the matrix.
     *                   2. Compare each code with REQUEST_CODE.
     *                   3. Count matches.
     * @tc.expected      No matrix code equals 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('unknownCodeNotEqualToRequestCode', 0, () => {
      const codes = unknownMatrix();
      let matches = 0;
      for (let index = 0; index < codes.length; index++) {
        if (codes[index] === REQUEST_CODE) {
          matches = matches + 1;
        }
        expect(codes[index] === 1).assertFalse();
      }
      expect(matches).assertEqual(0);
      expect(REQUEST_CODE).assertEqual(1);
      expect(codes.indexOf(REQUEST_CODE)).assertEqual(-1);
      expect(codes.length).assertEqual(4);
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(codes[0])).assertFalse();
      expect(codes[3]).assertEqual(99);
    });

    /**
     * @tc.name          unknownCodeNoNegativeHandled
     * @tc.desc          Negative codes are never accepted by the stub.
     * @tc.precondition  A range of negative codes.
     * @tc.steps         1. Evaluate codes -1, -2 and -100.
     *                   2. Invoke the stub with each.
     *                   3. Count handled results.
     * @tc.expected      Every negative code is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeNoNegativeHandled', 0, () => {
      const negatives: number[] = [-1, -2, -100];
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      let handled = 0;
      for (let index = 0; index < negatives.length; index++) {
        const result = stub.onRemoteMessageRequest(negatives[index], data, MessageSequenceModel.create(),
          new MessageOptionModel());
        if (result) {
          handled = handled + 1;
        }
        expect(result).assertFalse();
      }
      expect(handled).assertEqual(0);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[2].code).assertEqual(-100);
      expect(stub.requests[0].handled).assertFalse();
      expect(data.readCount).assertEqual(0);
      expect(expectedHandled(-100)).assertFalse();
    });

    /**
     * @tc.name          unknownCodeLargeNotHandled
     * @tc.desc          Large codes above the protocol range are refused.
     * @tc.precondition  A list of large codes.
     * @tc.steps         1. Evaluate 99, 1000 and 2147483647.
     *                   2. Invoke the stub with each.
     *                   3. Count successes.
     * @tc.expected      No large code is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeLargeNotHandled', 0, () => {
      const larges: number[] = [99, 1000, 2147483647];
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      let successes = 0;
      for (let index = 0; index < larges.length; index++) {
        const handled = stub.onRemoteMessageRequest(larges[index], data, MessageSequenceModel.create(),
          new MessageOptionModel());
        if (handled) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(0);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[2].code).assertEqual(2147483647);
      expect(stub.requests[2].handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(expectedHandled(1000)).assertFalse();
      expect(isKnownRequestCode(2147483647)).assertFalse();
    });

    /**
     * @tc.name          unknownCodeIsKnownHelperFalse
     * @tc.desc          The known-code helper rejects every matrix entry.
     * @tc.precondition  The helper and matrix are available.
     * @tc.steps         1. Evaluate the helper per matrix code.
     *                   2. Count known results.
     *                   3. Compare with code 1.
     * @tc.expected      No matrix code is reported known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeIsKnownHelperFalse', 0, () => {
      const codes = unknownMatrix();
      let known = 0;
      for (let index = 0; index < codes.length; index++) {
        if (isKnownRequestCode(codes[index])) {
          known = known + 1;
        }
        expect(isKnownRequestCode(codes[index])).assertFalse();
      }
      expect(known).assertEqual(0);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(99)).assertFalse();
      expect(known).assertEqual(codes.length - codes.length);
      expect(isKnownRequestCode(1)).assertTrue();
    });

    /**
     * @tc.name          unknownCodeExpectedHandledFalseMatrix
     * @tc.desc          The handled oracle is false for the whole matrix.
     * @tc.precondition  The oracle and matrix are available.
     * @tc.steps         1. Evaluate the oracle per code.
     *                   2. Count true values.
     *                   3. Compare with REQUEST_CODE.
     * @tc.expected      The oracle is true only for code 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeExpectedHandledFalseMatrix', 0, () => {
      const codes = unknownMatrix();
      let trueCount = 0;
      for (let index = 0; index < codes.length; index++) {
        if (expectedHandled(codes[index])) {
          trueCount = trueCount + 1;
        }
      }
      expect(trueCount).assertEqual(0);
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(1)).assertTrue();
      expect(expectedHandled(0)).assertEqual(isKnownRequestCode(0));
      expect(expectedHandled(2)).assertEqual(isKnownRequestCode(2));
      expect(expectedHandled(-1)).assertEqual(isKnownRequestCode(-1));
      expect(expectedHandled(99)).assertEqual(isKnownRequestCode(99));
      expect(trueCount + 1).assertEqual(1);
    });

    /**
     * @tc.name          unknownCodeExpectedReplyEmptyMatrix
     * @tc.desc          The reply oracle is empty for the whole matrix.
     * @tc.precondition  The oracle and matrix are available.
     * @tc.steps         1. Evaluate the reply oracle per code.
     *                   2. Sum the reply lengths.
     *                   3. Compare code 1 with the literal.
     * @tc.expected      All unknown replies are empty and code 1 is 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeExpectedReplyEmptyMatrix', 0, () => {
      const codes = unknownMatrix();
      let totalLength = 0;
      for (let index = 0; index < codes.length; index++) {
        const reply = expectedReplyFor(codes[index]);
        expect(reply).assertEqual('');
        totalLength = totalLength + reply.length;
      }
      expect(totalLength).assertEqual(0);
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(REPLY_PAYLOAD);
      expect(expectedReplyFor(REQUEST_CODE).length).assertEqual(9);
      expect(expectedReplyFor(99) === REPLY_PAYLOAD).assertFalse();
      expect(expectedReplyFor(0).length).assertEqual(0);
      expect(expectedReplyFor(-1).length).assertEqual(0);
      expect(codes.length).assertEqual(4);
    });

    /**
     * @tc.name          unknownCodeMetricsRepliesZero
     * @tc.desc          The replies metric stays zero for an all-unknown run.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Build metrics.
     *                   3. Compare the replies counter.
     * @tc.expected      The replies counter and ratio are both zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMetricsRepliesZero', 0, () => {
      const client = replayMatrix(unknownMatrix());
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(4);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.replies).assertEqual(metrics.handled);
      expect(client.replies.length).assertEqual(metrics.replies);
      expect(client.trace()).assertEqual('');
      expect(metrics.fingerprint()).assertEqual(textFingerprint('4:0:4:0'));
    });

    /**
     * @tc.name          unknownCodeMetricsRequestsCount
     * @tc.desc          The requests metric equals the number of matrix sends.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Compare requests with the send history.
     *                   3. Compare with the ledger size.
     * @tc.expected      All three counts equal four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMetricsRequestsCount', 0, () => {
      const client = replayMatrix(unknownMatrix());
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.requests).assertEqual(client.sentCodes.length);
      expect(metrics.requests).assertEqual(client.stub.requests.length);
      expect(metrics.requests).assertEqual(client.results.length);
      expect(metrics.requests).assertEqual(unknownMatrix().length);
      expect(metrics.handled + metrics.rejected).assertEqual(metrics.requests);
      expect(metrics.requests).assertLarger(0);
      expect(metrics.rejected).assertEqual(4);
    });
    /**
     * @tc.name          unknownCodeDoubleRunComparison
     * @tc.desc          Two consecutive matrix runs produce identical rejection profiles.
     * @tc.precondition  A single client used twice.
     * @tc.steps         1. Replay the matrix.
     *                   2. Replay it again.
     *                   3. Compare the two halves.
     * @tc.expected      Both halves hold four rejections and no replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('unknownCodeDoubleRunComparison', 0, () => {
      const client = matrixClient();
      replayCodes(client.stub, unknownMatrix());
      const firstCodes: number[] = [];
      for (let index = 0; index < 4; index++) {
        firstCodes.push(client.stub.requests[index].code);
      }
      replayCodes(client.stub, unknownMatrix());
      expect(client.stub.requestCount()).assertEqual(8);
      for (let index = 0; index < 4; index++) {
        expect(client.stub.requests[index].code).assertEqual(client.stub.requests[index + 4].code);
        expect(client.stub.requests[index + 4].handled).assertFalse();
      }
      expect(firstCodes.length).assertEqual(4);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(8);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0);
      expect(client.stub.requests[4].code).assertEqual(0);
      expect(client.stub.requests[7].code).assertEqual(99);
    });

    /**
     * @tc.name          unknownCodeSeparateStubsIndependent
     * @tc.desc          Each stub keeps an independent unknown-code ledger.
     * @tc.precondition  Two fresh clients.
     * @tc.steps         1. Replay two codes on the first.
     *                   2. Replay one code on the second.
     *                   3. Compare both ledgers.
     * @tc.expected      The ledgers keep their own sizes and codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeSeparateStubsIndependent', 0, () => {
      const first = matrixClient();
      const second = matrixClient();
      first.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      first.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      second.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(first.stub.requestCount()).assertEqual(2);
      expect(second.stub.requestCount()).assertEqual(1);
      expect(first.stub === second.stub).assertFalse();
      expect(first.stub.requests[1].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(second.stub.requests[0].code).assertEqual(UNKNOWN_CODE_LARGE);
      expect(first.stub.requests[0].code).assertEqual(UNKNOWN_CODE_ZERO);
      expect(StubMetrics.from(first.stub).rejected).assertEqual(2);
      expect(StubMetrics.from(second.stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          unknownCodeMatrixTraceEmpty
     * @tc.desc          An all-unknown client trace stays empty.
     * @tc.precondition  A replayed unknown matrix.
     * @tc.steps         1. Replay the matrix.
     *                   2. Read the reply trace.
     *                   3. Compare with the joined replies.
     * @tc.expected      The trace equals the empty join.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixTraceEmpty', 0, () => {
      const client = replayMatrix(unknownMatrix());
      expect(client.trace()).assertEqual('');
      expect(client.trace().length).assertEqual(0);
      expect(client.trace().indexOf('|')).assertEqual(-1);
      expect(client.trace().indexOf(REPLY_PAYLOAD)).assertEqual(-1);
      expect(client.trace() === REPLY_PAYLOAD).assertFalse();
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(textFingerprint(client.trace())).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name          unknownCodeMatrixResultsCount
     * @tc.desc          The result list grows by one per matrix send.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send the matrix one code at a time.
     *                   2. Read the result count after each send.
     *                   3. Compare with the send index.
     * @tc.expected      After each send the result count equals the send count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeMatrixResultsCount', 0, () => {
      const client = matrixClient();
      const codes = unknownMatrix();
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
        expect(client.results.length).assertEqual(index + 1);
        expect(client.sentCodes.length).assertEqual(index + 1);
        expect(client.stub.requestCount()).assertEqual(index + 1);
      }
      expect(client.results.length).assertEqual(4);
      expect(client.results[3].isSuccess()).assertFalse();
      expect(successCount(client)).assertEqual(0);
      expect(rejectedCount(client)).assertEqual(4);
    });

    /**
     * @tc.name          unknownCodeSequenceOfThree
     * @tc.desc          A three-code unknown sequence yields three rejection codes.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send 2, -1 and 99.
     *                   2. Read the error code sequence.
     *                   3. Compare each entry with the constant.
     * @tc.expected      The sequence holds three rejection codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('unknownCodeSequenceOfThree', 0, () => {
      const client = matrixClient();
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const codes: number[] = [];
      for (let index = 0; index < client.results.length; index++) {
        codes.push(client.results[index].errCode);
      }
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(codes[1]).assertEqual(ERROR_STUB_REJECTED);
      expect(codes[2]).assertEqual(ERROR_STUB_REJECTED);
      expect(countOfNumbers(codes, ERROR_STUB_REJECTED)).assertEqual(3);
      expect(client.replies.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0);
    });
  });
}



