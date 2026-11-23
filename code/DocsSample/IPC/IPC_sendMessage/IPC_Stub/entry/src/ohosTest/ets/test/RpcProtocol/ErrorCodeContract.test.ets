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
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  ERROR_STUB_NOT_ALIVE,
  ERROR_SEQUENCE_RECLAIMED,
  StubRemoteObjectModel,
  InProcessClient,
  MessageSequenceModel,
  MessageOptionModel,
  RequestResultModel,
  StubMetrics,
  replayCodes,
  textFingerprint
} from '../Shared/SharedDriver';

/**
 * Error code contract of the IPC stub protocol.
 *
 * Production anchor: ServiceExtAbility.ets 29-38 returns false for every
 * code other than 1. The in-process client maps a false return to the
 * 16000011 rejection code, while 0 means success.
 */

function successResult(): RequestResultModel {
  return new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, true);
}

function rejectionResult(): RequestResultModel {
  return new RequestResultModel(ERROR_STUB_REJECTED, '', false);
}

function errorCodesOf(client: InProcessClient): number[] {
  const codes: number[] = [];
  for (let index = 0; index < client.results.length; index++) {
    codes.push(client.results[index].errCode);
  }
  return codes;
}

function uniqueErrorCodes(client: InProcessClient): number[] {
  const codes = errorCodesOf(client);
  const result: number[] = [];
  for (let index = 0; index < codes.length; index++) {
    if (result.indexOf(codes[index]) < 0) {
      result.push(codes[index]);
    }
  }
  return result;
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

function failedClient(codes: number[]): InProcessClient {
  return replayCodes(new StubRemoteObjectModel(), codes);
}

export default function errorCodeContractTest(): void {
  describe('ErrorCodeContractTest', () => {
    beforeAll(() => {
      logSuite('ErrorCodeContractTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ErrorCodeContractTest', 'end');
    });

    /**
     * @tc.name          errorCodeNoneIsZero
     * @tc.desc          The success code is exactly zero.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Read ERROR_NONE.
     *                   2. Compare it with zero.
     *                   3. Use it in a result.
     * @tc.expected      ERROR_NONE equals 0 and marks success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorCodeNoneIsZero', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_NONE).assertLess(1);
      expect(ERROR_STUB_REJECTED).assertLarger(ERROR_NONE);
      expect(new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, true).isSuccess()).assertTrue();
      expect(successResult().errCode).assertEqual(ERROR_NONE);
      expect(successResult().isSuccess()).assertTrue();
      const zero: number = 0;
      expect(ERROR_NONE === zero).assertTrue();
    });

    /**
     * @tc.name          errorCodeStubRejectedValue
     * @tc.desc          The rejection code is the literal 16000011.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Read ERROR_STUB_REJECTED.
     *                   2. Compare with the literal.
     *                   3. Check its decimal digits.
     * @tc.expected      The rejection code is 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorCodeStubRejectedValue', 0, () => {
      expect(ERROR_STUB_REJECTED).assertEqual(16000011);
      expect(String(ERROR_STUB_REJECTED)).assertEqual('16000011');
      expect(String(ERROR_STUB_REJECTED).length).assertEqual(8);
      expect(ERROR_STUB_REJECTED).assertLarger(16000000);
      expect(ERROR_STUB_REJECTED).assertLess(17000000);
      expect(rejectionResult().errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(rejectionResult().isSuccess()).assertFalse();
      expect(rejectionResult().handled).assertFalse();
    });

    /**
     * @tc.name          errorCodeStubNotAliveValue
     * @tc.desc          The not-alive code is the literal 16000012.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Read ERROR_STUB_NOT_ALIVE.
     *                   2. Compare with the literal.
     *                   3. Compare against the rejection code.
     * @tc.expected      The not-alive code is 16000012 and distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorCodeStubNotAliveValue', 0, () => {
      expect(ERROR_STUB_NOT_ALIVE).assertEqual(16000012);
      expect(ERROR_STUB_NOT_ALIVE === ERROR_STUB_REJECTED).assertFalse();
      expect(ERROR_STUB_NOT_ALIVE).assertEqual(ERROR_STUB_REJECTED + 1);
      expect(String(ERROR_STUB_NOT_ALIVE)).assertEqual('16000012');
      expect(ERROR_STUB_NOT_ALIVE).assertLarger(ERROR_NONE);
      expect(ERROR_STUB_NOT_ALIVE).assertLess(17000000);
      expect(new RequestResultModel(ERROR_STUB_NOT_ALIVE, '', false).isSuccess()).assertFalse();
      expect(ERROR_STUB_NOT_ALIVE - ERROR_STUB_REJECTED).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeSequenceReclaimedValue
     * @tc.desc          The reclaimed-sequence code is the literal 16000013.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Read ERROR_SEQUENCE_RECLAIMED.
     *                   2. Compare with nearby codes.
     *                   3. Build a result with the code.
     * @tc.expected      The reclaimed code is 16000013 and marks failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorCodeSequenceReclaimedValue', 0, () => {
      expect(ERROR_SEQUENCE_RECLAIMED).assertEqual(16000013);
      expect(ERROR_SEQUENCE_RECLAIMED).assertEqual(ERROR_STUB_REJECTED + 2);
      expect(ERROR_SEQUENCE_RECLAIMED - ERROR_STUB_NOT_ALIVE).assertEqual(1);
      expect(String(ERROR_SEQUENCE_RECLAIMED)).assertEqual('16000013');
      expect(new RequestResultModel(ERROR_SEQUENCE_RECLAIMED, '', false).isSuccess()).assertFalse();
      expect(ERROR_SEQUENCE_RECLAIMED === ERROR_STUB_NOT_ALIVE).assertFalse();
      expect(ERROR_SEQUENCE_RECLAIMED).assertLarger(ERROR_NONE);
    });

    /**
     * @tc.name          errorCodeRejectedGreaterThanNone
     * @tc.desc          Failure codes are numerically greater than the success code.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Compare each failure code with ERROR_NONE.
     *                   2. Count failures above zero.
     *                   3. Confirm success is the minimum.
     * @tc.expected      All three failure codes exceed zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeRejectedGreaterThanNone', 0, () => {
      const failures: number[] = [ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      let aboveZero = 0;
      for (let index = 0; index < failures.length; index++) {
        expect(failures[index]).assertLarger(ERROR_NONE);
        if (failures[index] > ERROR_NONE) {
          aboveZero = aboveZero + 1;
        }
      }
      expect(aboveZero).assertEqual(3);
      expect(ERROR_NONE).assertLess(ERROR_STUB_REJECTED);
      expect(ERROR_NONE).assertEqual(0);
      expect(Math.min(ERROR_NONE, ERROR_STUB_REJECTED)).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name          errorCodeConstantsDistinct
     * @tc.desc          The four protocol codes are pairwise distinct.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Build an array of the four codes.
     *                   2. Remove duplicates.
     *                   3. Compare lengths and pairs.
     * @tc.expected      Four unique codes remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeConstantsDistinct', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      const unique: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        if (unique.indexOf(codes[index]) < 0) {
          unique.push(codes[index]);
        }
      }
      expect(unique.length).assertEqual(4);
      expect(unique.length).assertEqual(codes.length);
      expect(ERROR_NONE === ERROR_STUB_REJECTED).assertFalse();
      expect(ERROR_NONE === ERROR_SEQUENCE_RECLAIMED).assertFalse();
      expect(ERROR_STUB_REJECTED === ERROR_STUB_NOT_ALIVE).assertFalse();
      expect(ERROR_STUB_NOT_ALIVE === ERROR_SEQUENCE_RECLAIMED).assertFalse();
      expect(codes.indexOf(ERROR_STUB_NOT_ALIVE)).assertEqual(2);
    });

    /**
     * @tc.name          errorCodeOrderingOfConstants
     * @tc.desc          The failure codes form an ascending triple.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Compare rejected with not-alive.
     *                   2. Compare not-alive with reclaimed.
     *                   3. Verify consecutive gaps.
     * @tc.expected      Rejected < not-alive < reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeOrderingOfConstants', 0, () => {
      expect(ERROR_STUB_REJECTED).assertLess(ERROR_STUB_NOT_ALIVE);
      expect(ERROR_STUB_NOT_ALIVE).assertLess(ERROR_SEQUENCE_RECLAIMED);
      expect(ERROR_STUB_REJECTED).assertLess(ERROR_SEQUENCE_RECLAIMED);
      expect(ERROR_STUB_NOT_ALIVE - ERROR_STUB_REJECTED).assertEqual(1);
      expect(ERROR_SEQUENCE_RECLAIMED - ERROR_STUB_NOT_ALIVE).assertEqual(1);
      expect(ERROR_SEQUENCE_RECLAIMED - ERROR_STUB_REJECTED).assertEqual(2);
      expect(ERROR_STUB_REJECTED).assertEqual(16000011);
      expect(ERROR_SEQUENCE_RECLAIMED).assertEqual(16000011 + 2);
    });

    /**
     * @tc.name          errorCodeResultDefaultHandledFalse
     * @tc.desc          A result built without a handled flag is unsuccessful.
     * @tc.precondition  The result model constructor defaults are known.
     * @tc.steps         1. Build a result with only an error code.
     *                   2. Read the fields.
     *                   3. Query isSuccess.
     * @tc.expected      The handled flag defaults to false and success is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeResultDefaultHandledFalse', 0, () => {
      const zeroOnly = new RequestResultModel(ERROR_NONE);
      const rejectedOnly = new RequestResultModel(ERROR_STUB_REJECTED);
      expect(zeroOnly.handled).assertFalse();
      expect(zeroOnly.replyText).assertEqual('');
      expect(zeroOnly.errCode).assertEqual(ERROR_NONE);
      expect(zeroOnly.isSuccess()).assertFalse();
      expect(rejectedOnly.handled).assertFalse();
      expect(rejectedOnly.isSuccess()).assertFalse();
      expect(rejectedOnly.replyText).assertEqual('');
    });

    /**
     * @tc.name          errorCodeResultSuccessRequiresNone
     * @tc.desc          Any non-zero error code prevents a successful result.
     * @tc.precondition  The result model is available.
     * @tc.steps         1. Build results with each failure code.
     *                   2. Mark each handled true.
     *                   3. Compare isSuccess.
     * @tc.expected      All failure-coded results report false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeResultSuccessRequiresNone', 0, () => {
      const rejected = new RequestResultModel(ERROR_STUB_REJECTED, REPLY_PAYLOAD, true);
      const notAlive = new RequestResultModel(ERROR_STUB_NOT_ALIVE, REPLY_PAYLOAD, true);
      const reclaimed = new RequestResultModel(ERROR_SEQUENCE_RECLAIMED, REPLY_PAYLOAD, true);
      expect(rejected.isSuccess()).assertFalse();
      expect(notAlive.isSuccess()).assertFalse();
      expect(reclaimed.isSuccess()).assertFalse();
      expect(rejected.handled).assertTrue();
      expect(rejected.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(notAlive.errCode === ERROR_NONE).assertFalse();
      expect(reclaimed.errCode).assertLarger(0);
    });

    /**
     * @tc.name          errorCodeResultSuccessRequiresHandled
     * @tc.desc          A zero error code alone does not make a result successful.
     * @tc.precondition  The result model is available.
     * @tc.steps         1. Build a zero-coded result with handled false.
     *                   2. Build the same with handled true.
     *                   3. Compare isSuccess.
     * @tc.expected      Only the handled variant succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeResultSuccessRequiresHandled', 0, () => {
      const unhandled = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, false);
      const handled = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, true);
      expect(unhandled.isSuccess()).assertFalse();
      expect(handled.isSuccess()).assertTrue();
      expect(handled.isSuccess()).assertEqual(handled.errCode === ERROR_NONE && handled.handled);
      expect(unhandled.errCode).assertEqual(handled.errCode);
      expect(unhandled.handled === handled.handled).assertFalse();
      expect(handled.replyText).assertEqual(unhandled.replyText);
      expect(handled.isSuccess()).assertEqual(!unhandled.isSuccess());
    });

    /**
     * @tc.name          errorCodeResultFailureWithReplyText
     * @tc.desc          A failure result may still carry reply text without succeeding.
     * @tc.precondition  The result model is available.
     * @tc.steps         1. Build a rejected result with reply text.
     *                   2. Read all fields.
     *                   3. Query isSuccess.
     * @tc.expected      The reply text is preserved while success stays false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeResultFailureWithReplyText', 0, () => {
      const result = new RequestResultModel(ERROR_STUB_REJECTED, 'partial reply', true);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('partial reply');
      expect(result.replyText.length).assertEqual(13);
      expect(result.handled).assertTrue();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode === ERROR_NONE).assertFalse();
      expect(result.replyText === REPLY_PAYLOAD).assertFalse();
      expect(textFingerprint(result.replyText) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
    });
    /**
     * @tc.name          errorCodeClientRejectedOnUnknown
     * @tc.desc          A refused code maps to the 16000011 rejection code.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send code 2.
     *                   2. Read the result error code.
     *                   3. Compare against the constant.
     * @tc.expected      The result carries ERROR_STUB_REJECTED and no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorCodeClientRejectedOnUnknown', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.errCode).assertEqual(16000011);
      expect(result.isSuccess()).assertFalse();
      expect(result.handled).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(errorCodesOf(client).length).assertEqual(1);
      expect(errorCodesOf(client)[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(errorCodesOf(client)[0] === ERROR_NONE).assertFalse();
    });

    /**
     * @tc.name          errorCodeClientRejectedOnDeadStub
     * @tc.desc          A request to a killed stub maps to the rejection code.
     * @tc.precondition  A killed stub and a client.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code 1.
     *                   3. Compare the result error code.
     * @tc.expected      The known code is refused with ERROR_STUB_REJECTED.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeClientRejectedOnDeadStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(result.handled).assertFalse();
      expect(result.errCode === ERROR_STUB_NOT_ALIVE).assertFalse();
      expect(stub.requests.length).assertEqual(1);
      expect(stub.requests[0].handled).assertFalse();
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          errorCodeClientRejectedOnRejectList
     * @tc.desc          A reject-list entry produces the same rejection code.
     * @tc.precondition  A stub whose reject list holds code 1.
     * @tc.steps         1. Add code 1 to rejectCodes.
     *                   2. Send code 1.
     *                   3. Compare the result fields.
     * @tc.expected      The rejection code appears with empty reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeClientRejectedOnRejectList', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.errCode).assertEqual(16000011);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(result.handled).assertFalse();
      const singleCode = errorCodesOf(client);
      expect(singleCode.length).assertEqual(1);
      expect(singleCode[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeClientSuccessHasNone
     * @tc.desc          A handled code 1 request reports the zero error code.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send code 1.
     *                   2. Read the error code.
     *                   3. Compare with the success constant.
     * @tc.expected      The error code is ERROR_NONE and the result succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorCodeClientSuccessHasNone', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.errCode).assertEqual(0);
      expect(result.isSuccess()).assertTrue();
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      const singleSuccess = errorCodesOf(client);
      expect(singleSuccess.length).assertEqual(1);
      expect(singleSuccess[0]).assertEqual(ERROR_NONE);
      expect(errorCodesOf(client)[0] === ERROR_STUB_REJECTED).assertFalse();
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeRejectListMultipleCodes
     * @tc.desc          A two-entry reject list blocks both listed codes only.
     * @tc.precondition  A stub with codes 0 and 2 on the reject list.
     * @tc.steps         1. Send code 0, code 2 and code 1.
     *                   2. Read the error code sequence.
     *                   3. Compare each result.
     * @tc.expected      The codes read rejection, rejection and success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeRejectListMultipleCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(UNKNOWN_CODE_ZERO);
      stub.rejectCodes.push(UNKNOWN_CODE_TWO);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const codes = errorCodesOf(client);
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(codes[1]).assertEqual(ERROR_STUB_REJECTED);
      expect(codes[2]).assertEqual(ERROR_NONE);
      expect(uniqueErrorCodes(client).length).assertEqual(2);
      expect(client.results[2].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.rejectCodes.length).assertEqual(2);
    });

    /**
     * @tc.name          errorCodeRejectListDoesNotAffectOthers
     * @tc.desc          An unrelated reject entry leaves other refusals unchanged.
     * @tc.precondition  A stub whose reject list holds code 0 only.
     * @tc.steps         1. Send code 2 and code 1.
     *                   2. Compare their error codes.
     *                   3. Confirm the reject list entry is untouched.
     * @tc.expected      Code 2 is refused, code 1 succeeds, code 0 stays listed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeRejectListDoesNotAffectOthers', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(UNKNOWN_CODE_ZERO);
      const two = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const one = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(two.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(one.errCode).assertEqual(ERROR_NONE);
      expect(one.isSuccess()).assertTrue();
      expect(two.isSuccess()).assertFalse();
      expect(stub.rejectCodes.length).assertEqual(1);
      expect(stub.rejectCodes[0]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(stub.requestCount()).assertEqual(2);
      expect(one.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          errorCodeResetClearsFailureState
     * @tc.desc          Resetting a failing stub restores the success path.
     * @tc.precondition  A stub with a reject list and one rejection.
     * @tc.steps         1. Reject code 1 once.
     *                   2. Reset the stub.
     *                   3. Send code 1 again.
     * @tc.expected      The second attempt reports ERROR_NONE.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeResetClearsFailureState', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      const blocked = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(blocked.errCode).assertEqual(ERROR_STUB_REJECTED);
      stub.reset();
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.alive).assertTrue();
      const allowed = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(allowed.errCode).assertEqual(ERROR_NONE);
      expect(allowed.isSuccess()).assertTrue();
      const failThenPass = errorCodesOf(client);
      expect(failThenPass.length).assertEqual(2);
      expect(failThenPass[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(failThenPass[1]).assertEqual(ERROR_NONE);
      expect(uniqueErrorCodes(client).length).assertEqual(2);
    });

    /**
     * @tc.name          errorCodeReviveAfterKillRestoresNone
     * @tc.desc          Reviving a killed stub returns the success error code.
     * @tc.precondition  A stub killed after one success.
     * @tc.steps         1. Send code 1, kill and send again.
     *                   2. Revive and send code 1.
     *                   3. Compare the error code sequence.
     * @tc.expected      The codes are success, rejection, success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeReviveAfterKillRestoresNone', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.kill();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const codes = errorCodesOf(client);
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(ERROR_NONE);
      expect(codes[1]).assertEqual(ERROR_STUB_REJECTED);
      expect(codes[2]).assertEqual(ERROR_NONE);
      expect(countOfNumbers(codes, ERROR_NONE)).assertEqual(2);
      expect(countOfNumbers(codes, ERROR_STUB_REJECTED)).assertEqual(1);
      expect(client.replies.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name          errorCodeMetricsRejectedCount
     * @tc.desc          StubMetrics counts every refused request as rejected.
     * @tc.precondition  A stub with three refused codes.
     * @tc.steps         1. Replay three unknown codes.
     *                   2. Build metrics.
     *                   3. Compare the rejected counter.
     * @tc.expected      The rejected counter is 3 with no handled requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeMetricsRejectedCount', 0, () => {
      const client = failedClient([UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_LARGE]);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(errorCodesOf(client).length).assertEqual(3);
      const uniqueFailure = uniqueErrorCodes(client);
      expect(uniqueFailure.length).assertEqual(1);
      expect(uniqueFailure[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(countOfNumbers(errorCodesOf(client), ERROR_STUB_REJECTED)).assertEqual(3);
    });

    /**
     * @tc.name          errorCodeMetricsHandledCount
     * @tc.desc          StubMetrics counts every accepted request as handled.
     * @tc.precondition  A stub with three accepted requests.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Build metrics.
     *                   3. Compare the handled counter.
     * @tc.expected      The handled counter is 3 and rejected is 0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeMetricsHandledCount', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.sendMany(3, REQUEST_CODE);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(1);
      expect(countOfNumbers(errorCodesOf(client), ERROR_NONE)).assertEqual(3);
      expect(countOfNumbers(errorCodesOf(client), ERROR_STUB_REJECTED)).assertEqual(0);
      expect(client.replies.length).assertEqual(3);
    });

    /**
     * @tc.name          errorCodeMetricsRatioAllRejected
     * @tc.desc          An all-rejected run reports a zero success ratio.
     * @tc.precondition  A stub with five refused requests.
     * @tc.steps         1. Replay five unknown codes.
     *                   2. Build metrics.
     *                   3. Compare ratio and fingerprint.
     * @tc.expected      The ratio is zero and no replies are counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeMetricsRatioAllRejected', 0, () => {
      const client = failedClient([0, 2, -1, 99, 0]);
      const metrics = StubMetrics.from(client.stub);
      expect(client.results.length).assertEqual(5);
      expect(metrics.rejected).assertEqual(5);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.successRatio()).assertLess(0.1);
      expect(client.replies.length).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('5:0:5:0'));
      expect(uniqueErrorCodes(client).length).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeMetricsRatioAllHandled
     * @tc.desc          An all-accepted run reports a ratio of one.
     * @tc.precondition  A stub with four accepted requests.
     * @tc.steps         1. Send code 1 four times.
     *                   2. Build metrics.
     *                   3. Compare ratio and counters.
     * @tc.expected      The ratio is one with four replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeMetricsRatioAllHandled', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.sendMany(4, REQUEST_CODE);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.successRatio()).assertLarger(0.9);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(4);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('4:4:0:4'));
      expect(countOfNumbers(errorCodesOf(client), ERROR_NONE)).assertEqual(4);
      expect(client.replies.length).assertEqual(4);
    });

    /**
     * @tc.name          errorCodeMetricsRatioMixed
     * @tc.desc          A mixed run reports the exact success fraction.
     * @tc.precondition  A stub with two successes and three refusals.
     * @tc.steps         1. Send 1, 0, 1, 2, 99.
     *                   2. Build metrics.
     *                   3. Compare the ratio with 0.4.
     * @tc.expected      The ratio is 0.4 with two handled and three rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeMetricsRatioMixed', 0, () => {
      const client = failedClient([REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO,
        UNKNOWN_CODE_LARGE]);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(0.4);
      const mixedCodes = errorCodesOf(client);
      expect(mixedCodes.length).assertEqual(5);
      expect(mixedCodes[0]).assertEqual(ERROR_NONE);
      expect(mixedCodes[1]).assertEqual(ERROR_STUB_REJECTED);
      expect(mixedCodes[2]).assertEqual(ERROR_NONE);
      expect(mixedCodes[3]).assertEqual(ERROR_STUB_REJECTED);
      expect(mixedCodes[4]).assertEqual(ERROR_STUB_REJECTED);
      expect(countOfNumbers(errorCodesOf(client), ERROR_NONE)).assertEqual(2);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('5:2:3:2'));
    });

    /**
     * @tc.name          errorCodeMetricsFingerprintChanges
     * @tc.desc          Different failure profiles produce different fingerprints.
     * @tc.precondition  Two stubs with different code histories.
     * @tc.steps         1. Replay two different code lists.
     *                   2. Build both metrics.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints differ when the profiles differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeMetricsFingerprintChanges', 0, () => {
      const first = failedClient([REQUEST_CODE, UNKNOWN_CODE_ZERO]);
      const second = failedClient([REQUEST_CODE, REQUEST_CODE]);
      const firstMetrics = StubMetrics.from(first.stub);
      const secondMetrics = StubMetrics.from(second.stub);
      expect(firstMetrics.fingerprint() === secondMetrics.fingerprint()).assertFalse();
      expect(firstMetrics.rejected).assertEqual(1);
      expect(secondMetrics.rejected).assertEqual(0);
      expect(firstMetrics.successRatio()).assertEqual(0.5);
      expect(secondMetrics.successRatio()).assertEqual(1);
      expect(firstMetrics.fingerprint()).assertEqual(textFingerprint('2:1:1:1'));
      expect(secondMetrics.fingerprint()).assertEqual(textFingerprint('2:2:0:2'));
    });

    /**
     * @tc.name          errorCodeRejectedResultReplyEmpty
     * @tc.desc          A rejected client result carries no reply text.
     * @tc.precondition  A client with a rejected code.
     * @tc.steps         1. Send code 99.
     *                   2. Read the result fields.
     *                   3. Compare with an empty reply.
     * @tc.expected      The reply text is empty while the error code is set.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeRejectedResultReplyEmpty', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual('');
      expect(result.replyText.length).assertEqual(0);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertFalse();
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(textFingerprint(result.replyText)).assertEqual(textFingerprint(''));
      expect(result.replyText === REPLY_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name          errorCodeKilledResultHasNoReply
     * @tc.desc          A dead-stub request returns no reply and a rejection code.
     * @tc.precondition  A client bound to a killed stub.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code 1.
     *                   3. Compare reply and error code.
     * @tc.expected      The reply is empty and the code is 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeKilledResultHasNoReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual('');
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertFalse();
      expect(stub.requests[0].replyText).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
      expect(StubMetrics.from(stub).replies).assertEqual(0);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });
    /**
     * @tc.name          errorCodeRejectedRecordNotHandled
     * @tc.desc          A refused ledger entry is marked unhandled.
     * @tc.precondition  A stub with one refused request.
     * @tc.steps         1. Send code 2.
     *                   2. Read the ledger entry.
     *                   3. Compare the handled flag.
     * @tc.expected      The entry reports handled false and an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeRejectedRecordNotHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(record.option).assertEqual('0/0/false');
      expect(record.code).assertEqual(UNKNOWN_CODE_TWO);
      expect(record.handled).assertFalse();
      expect(record.replyText).assertEqual('');
      expect(record.text).assertEqual('');
      expect(record.describe()).assertEqual('2///false');
      expect(stub.requestCount()).assertEqual(1);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
    });

    /**
     * @tc.name          errorCodeSuccessRecordHandled
     * @tc.desc          An accepted ledger entry is marked handled with a reply copy.
     * @tc.precondition  A stub with one accepted request.
     * @tc.steps         1. Send code 1.
     *                   2. Read the ledger entry.
     *                   3. Compare the handled flag and reply.
     * @tc.expected      The entry reports handled true and stores 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeSuccessRecordHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'accepted payload');
      const record = stub.requests[0];
      expect(record.handled).assertTrue();
      expect(record.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record.code).assertEqual(REQUEST_CODE);
      expect(record.text).assertEqual('accepted payload');
      expect(record.describe()).assertEqual('1/accepted payload/hello rpc/true');
      expect(record.option).assertEqual('0/0/false');
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).replies).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeRejectedRecordEmptyText
     * @tc.desc          A refused request never stores the payload it was sent.
     * @tc.precondition  A stub receiving a payload with an unknown code.
     * @tc.steps         1. Send code 99 with a payload.
     *                   2. Read the ledger text.
     *                   3. Compare with the payload.
     * @tc.expected      The entry text is empty despite the sent payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeRejectedRecordEmptyText', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(UNKNOWN_CODE_LARGE, 'never read');
      const record = client.stub.requests[0];
      expect(record.text).assertEqual('');
      expect(record.text.length).assertEqual(0);
      expect(record.text === 'never read').assertFalse();
      expect(record.describe()).assertEqual('99///false');
      expect(client.sentTexts[0]).assertEqual('never read');
      expect(client.sentCodes[0]).assertEqual(UNKNOWN_CODE_LARGE);
      expect(record.handled).assertFalse();
    });

    /**
     * @tc.name          errorCodeClientResultsLengthMatchesSends
     * @tc.desc          Every send appends exactly one result with an error code.
     * @tc.precondition  A client with a mixed history.
     * @tc.steps         1. Send five requests.
     *                   2. Compare result and error code lengths.
     *                   3. Compare with the send history.
     * @tc.expected      All three histories have five entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeClientResultsLengthMatchesSends', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const codes: number[] = [1, 2, 0, 1, 99];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      expect(client.results.length).assertEqual(5);
      expect(errorCodesOf(client).length).assertEqual(5);
      expect(client.sentCodes.length).assertEqual(5);
      expect(client.sentCodes.length).assertEqual(client.results.length);
      expect(client.results[0].errCode).assertEqual(ERROR_NONE);
      expect(client.results[1].errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(client.results[3].errCode).assertEqual(ERROR_NONE);
      expect(countOfNumbers(errorCodesOf(client), ERROR_NONE)).assertEqual(2);
    });

    /**
     * @tc.name          errorCodeEveryUnknownRejected
     * @tc.desc          Each representative unknown code yields a rejection result.
     * @tc.precondition  A client and four unknown codes.
     * @tc.steps         1. Send each unknown code.
     *                   2. Read the error codes.
     *                   3. Count successes.
     * @tc.expected      Four rejections and no success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeEveryUnknownRejected', 0, () => {
      const client = failedClient([UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE,
        UNKNOWN_CODE_LARGE]);
      const codes = errorCodesOf(client);
      expect(codes.length).assertEqual(4);
      let successes = 0;
      for (let index = 0; index < codes.length; index++) {
        expect(codes[index]).assertEqual(ERROR_STUB_REJECTED);
        if (codes[index] === ERROR_NONE) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(0);
      expect(countOfNumbers(codes, ERROR_STUB_REJECTED)).assertEqual(4);
      expect(client.replies.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          errorCodeNegativeCodeRejected
     * @tc.desc          A negative request code produces the rejection error code.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send code -1.
     *                   2. Read the error code and flags.
     *                   3. Compare with the oracle code.
     * @tc.expected      The result is rejected with 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeNegativeCodeRejected', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.errCode).assertLarger(0);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.stub.requests[0].code).assertEqual(-1);
      expect(client.stub.requests[0].handled).assertFalse();
      const singleCode = errorCodesOf(client);
      expect(singleCode.length).assertEqual(1);
      expect(singleCode[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(result.errCode === ERROR_SEQUENCE_RECLAIMED).assertFalse();
    });

    /**
     * @tc.name          errorCodeLargeCodeRejected
     * @tc.desc          A large unknown code produces the rejection error code.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send code 99.
     *                   2. Read the error code.
     *                   3. Compare the rejection constant.
     * @tc.expected      The result is rejected before any data read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeLargeCodeRejected', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.errCode === ERROR_NONE).assertFalse();
      expect(result.handled).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(client.stub.requests[0].text).assertEqual('');
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
      expect(client.results.length).assertEqual(1);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeZeroCodeRejected
     * @tc.desc          Code 0 is refused even though its number matches ERROR_NONE.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send request code 0.
     *                   2. Read the result error code.
     *                   3. Compare request code with error code.
     * @tc.expected      The request code 0 yields error code 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeZeroCodeRejected', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      expect(UNKNOWN_CODE_ZERO).assertEqual(ERROR_NONE);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.errCode === UNKNOWN_CODE_ZERO).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(result.handled).assertFalse();
      expect(client.stub.requests[0].code).assertEqual(0);
      expect(client.stub.requests[0].handled).assertFalse();
      expect(client.replies.length).assertEqual(0);
    });
    /**
     * @tc.name          errorCodeErrorCodesPositive
     * @tc.desc          Failure codes are positive while the success code is zero.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Check each failure code for positivity.
     *                   2. Check ERROR_NONE for zero.
     *                   3. Count positive codes.
     * @tc.expected      Exactly three positive codes exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeErrorCodesPositive', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      let positive = 0;
      for (let index = 0; index < codes.length; index++) {
        if (codes[index] > 0) {
          positive = positive + 1;
        }
      }
      expect(positive).assertEqual(3);
      expect(ERROR_NONE === 0).assertTrue();
      expect(ERROR_STUB_REJECTED > 0).assertTrue();
      expect(ERROR_STUB_NOT_ALIVE > 0).assertTrue();
      expect(ERROR_SEQUENCE_RECLAIMED > 0).assertTrue();
      expect(codes.length - positive).assertEqual(1);
      expect(codes[0]).assertEqual(0);
    });

    /**
     * @tc.name          errorCodeErrorCodesFitInteger
     * @tc.desc          Every protocol code is a small positive integer.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Round each code down.
     *                   2. Compare with the original.
     *                   3. Compare with the 32-bit maximum.
     * @tc.expected      All codes are integers below 2^31.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeErrorCodesFitInteger', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      for (let index = 0; index < codes.length; index++) {
        expect(Math.floor(codes[index])).assertEqual(codes[index]);
        expect(codes[index]).assertLess(2147483647);
      }
      expect(Math.floor(ERROR_STUB_REJECTED / 1)).assertEqual(ERROR_STUB_REJECTED);
      expect(ERROR_STUB_REJECTED % 1).assertEqual(0);
      expect(ERROR_SEQUENCE_RECLAIMED % 1).assertEqual(0);
      expect(ERROR_NONE % 1).assertEqual(0);
      expect(codes.length).assertEqual(4);
    });

    /**
     * @tc.name          errorCodeRejectedInSixteenMillionRange
     * @tc.desc          The rejection code sits in the 16,000,0xx range.
     * @tc.precondition  The rejection constant is loaded.
     * @tc.steps         1. Compare the lower bound.
     *                   2. Compare the upper bound.
     *                   3. Check the tail digits.
     * @tc.expected      The code lies between 16000000 and 16000100.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeRejectedInSixteenMillionRange', 0, () => {
      expect(ERROR_STUB_REJECTED).assertLarger(15999999);
      expect(ERROR_STUB_REJECTED).assertLess(16000100);
      expect(ERROR_STUB_REJECTED - 16000000).assertEqual(11);
      expect(String(ERROR_STUB_REJECTED).startsWith('160000')).assertTrue();
      expect(String(ERROR_STUB_REJECTED).endsWith('11')).assertTrue();
      expect(ERROR_STUB_NOT_ALIVE - 16000000).assertEqual(12);
      expect(ERROR_SEQUENCE_RECLAIMED - 16000000).assertEqual(13);
      expect(ERROR_NONE).assertLess(16000000);
    });

    /**
     * @tc.name          errorCodeNotAliveNotUsedByClient
     * @tc.desc          The in-process client maps dead-stub failures to rejection.
     * @tc.precondition  A stub killed before a request.
     * @tc.steps         1. Kill the stub and send code 1.
     *                   2. Read the error code.
     *                   3. Count not-alive codes.
     * @tc.expected      No result uses ERROR_STUB_NOT_ALIVE.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeNotAliveNotUsedByClient', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const codes = errorCodesOf(client);
      expect(codes.length).assertEqual(2);
      expect(countOfNumbers(codes, ERROR_STUB_NOT_ALIVE)).assertEqual(0);
      expect(countOfNumbers(codes, ERROR_STUB_REJECTED)).assertEqual(2);
      const uniqueFailure = uniqueErrorCodes(client);
      expect(uniqueFailure.length).assertEqual(1);
      expect(uniqueFailure[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(ERROR_STUB_NOT_ALIVE).assertEqual(16000012);
      expect(codes[0] === ERROR_STUB_NOT_ALIVE).assertFalse();
      expect(codes[1] === ERROR_STUB_NOT_ALIVE).assertFalse();
    });

    /**
     * @tc.name          errorCodeReclaimedNotUsedByClient
     * @tc.desc          The reclaimed-sequence code never appears in client results.
     * @tc.precondition  A client with a mixed history.
     * @tc.steps         1. Send 1, 0, 2 and 1.
     *                   2. Walk the error codes.
     *                   3. Count reclaimed codes.
     * @tc.expected      No result uses ERROR_SEQUENCE_RECLAIMED.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeReclaimedNotUsedByClient', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const errorCodes = errorCodesOf(client);
      expect(errorCodes.length).assertEqual(4);
      expect(countOfNumbers(errorCodes, ERROR_SEQUENCE_RECLAIMED)).assertEqual(0);
      expect(countOfNumbers(errorCodes, ERROR_STUB_NOT_ALIVE)).assertEqual(0);
      expect(countOfNumbers(errorCodes, ERROR_NONE)).assertEqual(2);
      expect(countOfNumbers(errorCodes, ERROR_STUB_REJECTED)).assertEqual(2);
      expect(ERROR_SEQUENCE_RECLAIMED).assertEqual(16000013);
      expect(uniqueErrorCodes(client).length).assertEqual(2);
    });

    /**
     * @tc.name          errorCodeClientUsesOnlyTwoCodes
     * @tc.desc          Client results draw only from success and rejection codes.
     * @tc.precondition  A client with accepted and refused requests.
     * @tc.steps         1. Send a six-request mixed history.
     *                   2. Collect unique error codes.
     *                   3. Verify the subset.
     * @tc.expected      Only ERROR_NONE and ERROR_STUB_REJECTED appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeClientUsesOnlyTwoCodes', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const codes: number[] = [1, 0, -1, 99, 2, 1];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const unique = uniqueErrorCodes(client);
      expect(unique.length).assertEqual(2);
      expect(unique.indexOf(ERROR_NONE)).assertLarger(-1);
      expect(unique.indexOf(ERROR_STUB_REJECTED)).assertLarger(-1);
      expect(unique.indexOf(ERROR_STUB_NOT_ALIVE)).assertEqual(-1);
      expect(unique.indexOf(ERROR_SEQUENCE_RECLAIMED)).assertEqual(-1);
      expect(errorCodesOf(client).length).assertEqual(6);
      expect(client.results[5].errCode).assertEqual(ERROR_NONE);
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name          errorCodeIsSuccessMatrix
     * @tc.desc          isSuccess matches the conjunction of zero code and handled flag.
     * @tc.precondition  The result model is available.
     * @tc.steps         1. Build all four flag combinations.
     *                   2. Compare isSuccess with the oracle.
     *                   3. Count successes.
     * @tc.expected      Only zero code plus handled true succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeIsSuccessMatrix', 0, () => {
      const noneHandled = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, true);
      const noneUnhandled = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD, false);
      const rejectedHandled = new RequestResultModel(ERROR_STUB_REJECTED, REPLY_PAYLOAD, true);
      const rejectedUnhandled = new RequestResultModel(ERROR_STUB_REJECTED, '', false);
      expect(noneHandled.isSuccess()).assertTrue();
      expect(noneUnhandled.isSuccess()).assertFalse();
      expect(rejectedHandled.isSuccess()).assertFalse();
      expect(rejectedUnhandled.isSuccess()).assertFalse();
      let successes = 0;
      const results: RequestResultModel[] = [noneHandled, noneUnhandled, rejectedHandled, rejectedUnhandled];
      for (let index = 0; index < results.length; index++) {
        if (results[index].isSuccess()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(1);
      expect(noneHandled.isSuccess()).assertEqual(noneHandled.errCode === ERROR_NONE && noneHandled.handled);
      expect(rejectedHandled.isSuccess()).assertEqual(false);
    });

    /**
     * @tc.name          errorCodeResultFieldsPreserved
     * @tc.desc          The result constructor stores arbitrary error codes and text.
     * @tc.precondition  The result model is available.
     * @tc.steps         1. Build a result with a custom code and text.
     *                   2. Read each field.
     *                   3. Compare with the inputs.
     * @tc.expected      Every supplied field is preserved verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeResultFieldsPreserved', 0, () => {
      const result = new RequestResultModel(12345, 'custom text', true);
      expect(result.errCode).assertEqual(12345);
      expect(result.replyText).assertEqual('custom text');
      expect(result.replyText.length).assertEqual(11);
      expect(result.handled).assertTrue();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode === ERROR_NONE).assertFalse();
      expect(result.replyText.endsWith('text')).assertTrue();
      expect(textFingerprint(result.replyText)).assertEqual(textFingerprint('custom text'));
    });

    /**
     * @tc.name          errorCodeRepeatedFailuresAccumulate
     * @tc.desc          Repeated refusals accumulate one result and metric per attempt.
     * @tc.precondition  A stub with three refused attempts.
     * @tc.steps         1. Send code 2 three times.
     *                   2. Compare result count and rejected metric.
     *                   3. Compare the error code list.
     * @tc.expected      Three rejections are recorded with no replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeRepeatedFailuresAccumulate', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.sendMany(3, UNKNOWN_CODE_TWO);
      const metrics = StubMetrics.from(client.stub);
      expect(client.results.length).assertEqual(3);
      expect(errorCodesOf(client).length).assertEqual(3);
      expect(countOfNumbers(errorCodesOf(client), ERROR_STUB_REJECTED)).assertEqual(3);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          errorCodeFailuresDoNotStopLaterSuccess
     * @tc.desc          Earlier failures do not change a later accepted request.
     * @tc.precondition  A stub with two prior refusals.
     * @tc.steps         1. Send codes 0 and 2.
     *                   2. Send code 1.
     *                   3. Compare the final result.
     * @tc.expected      The final result reports ERROR_NONE with a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeFailuresDoNotStopLaterSuccess', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const last = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(last.errCode).assertEqual(ERROR_NONE);
      expect(last.isSuccess()).assertTrue();
      expect(last.replyText).assertEqual(REPLY_PAYLOAD);
      const threeCodes = errorCodesOf(client);
      expect(threeCodes.length).assertEqual(3);
      expect(threeCodes[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(threeCodes[1]).assertEqual(ERROR_STUB_REJECTED);
      expect(threeCodes[2]).assertEqual(ERROR_NONE);
      expect(client.stub.requests[2].handled).assertTrue();
      expect(StubMetrics.from(client.stub).rejected).assertEqual(2);
      expect(StubMetrics.from(client.stub).handled).assertEqual(1);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1 / 3);
    });

    /**
     * @tc.name          errorCodeSuccessAfterManyFailures
     * @tc.desc          A success recorded after five failures is the only success.
     * @tc.precondition  A client with five refused requests.
     * @tc.steps         1. Send five unknown codes.
     *                   2. Send code 1.
     *                   3. Count successes and rejections.
     * @tc.expected      One success and five rejections are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeSuccessAfterManyFailures', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const failures: number[] = [0, 2, -1, 99, 2];
      for (let index = 0; index < failures.length; index++) {
        client.send(failures[index], REQUEST_PAYLOAD);
      }
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const codes = errorCodesOf(client);
      expect(codes.length).assertEqual(6);
      expect(countOfNumbers(codes, ERROR_NONE)).assertEqual(1);
      expect(countOfNumbers(codes, ERROR_STUB_REJECTED)).assertEqual(5);
      expect(codes[5]).assertEqual(ERROR_NONE);
      expect(client.results[5].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1 / 6);
      expect(client.stub.requestCount()).assertEqual(6);
    });

    /**
     * @tc.name          errorCodeFailureReplyStillReadable
     * @tc.desc          A prewritten reply survives a refused request but does not succeed.
     * @tc.precondition  A reply sequence preloaded with text.
     * @tc.steps         1. Write 'prewritten' into the reply.
     *                   2. Invoke the stub with code 2.
     *                   3. Read the reply and build a result.
     * @tc.expected      The text is readable while the mapped result fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeFailureReplyStillReadable', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      reply.writeString('prewritten');
      const handled = stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, reply, new MessageOptionModel());
      const text = reply.readString();
      const result = new RequestResultModel(handled ? ERROR_NONE : ERROR_STUB_REJECTED, text, handled);
      expect(handled).assertFalse();
      expect(text).assertEqual('prewritten');
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('prewritten');
      expect(stub.requests[0].replyText).assertEqual('');
      expect(reply.writeCount).assertEqual(1);
      expect(reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeResetClearsMetrics
     * @tc.desc          Metrics built after a reset contain no failures.
     * @tc.precondition  A stub reset after three rejections.
     * @tc.steps         1. Send three unknown codes.
     *                   2. Reset the stub.
     *                   3. Build metrics.
     * @tc.expected      Every metric counter is zero after the reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeResetClearsMetrics', 0, () => {
      const stub = new StubRemoteObjectModel();
      replayCodes(stub, [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_LARGE]);
      expect(StubMetrics.from(stub).rejected).assertEqual(3);
      stub.reset();
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          errorCodeFailureFingerprintStable
     * @tc.desc          Identical failure histories share one metrics fingerprint.
     * @tc.precondition  Two stubs with three refusals each.
     * @tc.steps         1. Replay the same codes on both stubs.
     *                   2. Build both metrics.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeFailureFingerprintStable', 0, () => {
      const first = new StubRemoteObjectModel();
      const second = new StubRemoteObjectModel();
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE];
      replayCodes(first, codes);
      replayCodes(second, codes);
      const firstMetrics = StubMetrics.from(first);
      const secondMetrics = StubMetrics.from(second);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.rejected).assertEqual(3);
      expect(secondMetrics.rejected).assertEqual(3);
      expect(firstMetrics.successRatio()).assertEqual(0);
      expect(firstMetrics.fingerprint()).assertEqual(textFingerprint('3:0:3:0'));
      expect(firstMetrics.handled).assertEqual(secondMetrics.handled);
      expect(first.requestCount()).assertEqual(second.requestCount());
    });

    /**
     * @tc.name          errorCodeConstantFingerprintsDistinct
     * @tc.desc          The string forms of the four codes hash differently.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Fingerprint each code string.
     *                   2. Compare pairwise.
     *                   3. Count unique fingerprints.
     * @tc.expected      Four distinct code-string fingerprints exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeConstantFingerprintsDistinct', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      const prints: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        prints.push(textFingerprint(String(codes[index])));
      }
      const unique: number[] = [];
      for (let index = 0; index < prints.length; index++) {
        expect(prints[index]).assertLarger(0);
        if (unique.indexOf(prints[index]) < 0) {
          unique.push(prints[index]);
        }
      }
      expect(prints.length).assertEqual(4);
      expect(unique.length).assertEqual(4);
      expect(prints[0] === prints[1]).assertFalse();
      expect(prints[1] === prints[2]).assertFalse();
      expect(prints[2] === prints[3]).assertFalse();
      expect(textFingerprint(String(ERROR_STUB_REJECTED))).assertEqual(prints[1]);
    });

    /**
     * @tc.name          errorCodeErrCodeIndependentOfReplyLength
     * @tc.desc          The error code does not depend on the reply text length.
     * @tc.precondition  The result model is available.
     * @tc.steps         1. Build results with different reply texts.
     *                   2. Compare their error codes.
     *                   3. Compare their success flags.
     * @tc.expected      The codes stay identical while the texts vary.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeErrCodeIndependentOfReplyLength', 0, () => {
      const empty = new RequestResultModel(ERROR_STUB_REJECTED, '', false);
      const shortText = new RequestResultModel(ERROR_STUB_REJECTED, 'x', false);
      const longText = new RequestResultModel(ERROR_STUB_REJECTED, 'a long reply body for comparison', false);
      expect(empty.errCode).assertEqual(shortText.errCode);
      expect(shortText.errCode).assertEqual(longText.errCode);
      expect(empty.replyText.length).assertEqual(0);
      expect(shortText.replyText.length).assertEqual(1);
      expect(longText.replyText.length).assertEqual(32);
      expect(empty.isSuccess()).assertEqual(shortText.isSuccess());
      expect(longText.isSuccess()).assertEqual(false);
      expect(longText.errCode).assertEqual(ERROR_STUB_REJECTED);
    });
    /**
     * @tc.name          errorCodeReclaimedReplyCausesRejection
     * @tc.desc          A reclaimed reply sequence makes a known code fail to handle.
     * @tc.precondition  A reply sequence that was reclaimed before the request.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Invoke the stub with code 1.
     *                   3. Map the boolean to an error code.
     * @tc.expected      The write fails, the request is unhandled and maps to rejection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeReclaimedReplyCausesRejection', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      reply.reclaim();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(new RequestResultModel(handled ? ERROR_NONE : ERROR_STUB_REJECTED, '', handled).errCode)
        .assertEqual(ERROR_STUB_REJECTED);
      expect(reply.writeCount).assertEqual(0);
      expect(reply.reclaimed).assertTrue();
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeReclaimedDataDoesNotCauseRejection
     * @tc.desc          A reclaimed data sequence still allows a handled request.
     * @tc.precondition  A data sequence that was reclaimed before the request.
     * @tc.steps         1. Reclaim the data sequence.
     *                   2. Invoke the stub with code 1.
     *                   3. Map the boolean to an error code.
     * @tc.expected      The request succeeds with an empty recorded payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeReclaimedDataDoesNotCauseRejection', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      data.reclaim();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(new RequestResultModel(handled ? ERROR_NONE : ERROR_STUB_REJECTED, '', handled).errCode)
        .assertEqual(ERROR_NONE);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[0].handled).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(0);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeErrorCodeSequencePreserved
     * @tc.desc          The result error codes preserve the request code order.
     * @tc.precondition  A client sending codes 2, 1 and 0.
     * @tc.steps         1. Send the three codes.
     *                   2. Read the error code sequence.
     *                   3. Compare each entry.
     * @tc.expected      The error codes read rejection, success, rejection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeErrorCodeSequencePreserved', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const codes = errorCodesOf(client);
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(ERROR_STUB_REJECTED);
      expect(codes[1]).assertEqual(ERROR_NONE);
      expect(codes[2]).assertEqual(ERROR_STUB_REJECTED);
      expect(client.results[1].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.results[0].replyText).assertEqual('');
      expect(client.results[2].replyText).assertEqual('');
      expect(uniqueErrorCodes(client).length).assertEqual(2);
      expect(countOfNumbers(codes, ERROR_NONE)).assertEqual(1);
    });

    /**
     * @tc.name          errorCodeResultHandledFalseWithNone
     * @tc.desc          A zero-coded unhandled result is not a success.
     * @tc.precondition  The result model is available.
     * @tc.steps         1. Build a zero-coded unhandled result.
     *                   2. Read all fields.
     *                   3. Compare with a fresh default result.
     * @tc.expected      The result reports zero but is unsuccessful.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeResultHandledFalseWithNone', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, '', false);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.handled).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(result.errCode === ERROR_NONE).assertTrue();
      expect(result.isSuccess()).assertEqual(result.errCode === ERROR_NONE && result.handled);
      expect(result.handled).assertEqual(false);
      expect(result.replyText.length).assertEqual(0);
    });

    /**
     * @tc.name          errorCodeFailureRepliesZeroInMetrics
     * @tc.desc          Refused requests contribute nothing to the reply metric.
     * @tc.precondition  A stub with two successes and two refusals.
     * @tc.steps         1. Send 1, 2, 1, 0.
     *                   2. Build metrics.
     *                   3. Compare the replies counter.
     * @tc.expected      The replies counter is 2, matching the successes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeFailureRepliesZeroInMetrics', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_ZERO];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.replies).assertEqual(metrics.handled);
      expect(client.replies.length).assertEqual(2);
      expect(countOfNumbers(errorCodesOf(client), ERROR_STUB_REJECTED)).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          errorCodeConstantsAreNumbers
     * @tc.desc          The error constants behave as ordinary finite numbers.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Check finiteness through arithmetic.
     *                   2. Check integrality.
     *                   3. Check string round-trips.
     * @tc.expected      All four constants are finite integers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorCodeConstantsAreNumbers', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
      for (let index = 0; index < codes.length; index++) {
        const doubled = codes[index] * 2;
        expect(doubled / 2).assertEqual(codes[index]);
        expect(Math.floor(codes[index])).assertEqual(codes[index]);
        expect(String(codes[index]).length).assertLarger(0);
        expect(Number(String(codes[index]))).assertEqual(codes[index]);
      }
      expect(ERROR_NONE * 2).assertEqual(0);
      expect(ERROR_STUB_REJECTED + ERROR_NONE).assertEqual(ERROR_STUB_REJECTED);
      expect(ERROR_STUB_NOT_ALIVE - ERROR_STUB_REJECTED).assertEqual(1);
      expect(codes.length).assertEqual(4);
    });

    /**
     * @tc.name          errorCodeRejectionAfterManyRequests
     * @tc.desc          A single rejection is reported correctly after a long success run.
     * @tc.precondition  A client with ten prior successes.
     * @tc.steps         1. Send code 1 ten times.
     *                   2. Send code 99 once.
     *                   3. Compare the final result and metrics.
     * @tc.expected      The final result is the only rejection in eleven attempts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeRejectionAfterManyRequests', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.sendMany(10, REQUEST_CODE);
      const last = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(client.stub);
      expect(last.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(last.isSuccess()).assertFalse();
      expect(metrics.requests).assertEqual(11);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(10 / 11);
      expect(countOfNumbers(errorCodesOf(client), ERROR_STUB_REJECTED)).assertEqual(1);
      expect(client.replies.length).assertEqual(10);
    });

    /**
     * @tc.name          errorCodeFailureProfileFingerprintDiffers
     * @tc.desc          Failure-heavy and success-heavy profiles hash differently.
     * @tc.precondition  Two stubs with different profiles.
     * @tc.steps         1. Replay a failure-heavy profile.
     *                   2. Replay a success-heavy profile.
     *                   3. Compare fingerprints.
     * @tc.expected      The metrics fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorCodeFailureProfileFingerprintDiffers', 0, () => {
      const failing = new StubRemoteObjectModel();
      const succeeding = new StubRemoteObjectModel();
      replayCodes(failing, [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_LARGE]);
      replayCodes(succeeding, [REQUEST_CODE, REQUEST_CODE, REQUEST_CODE]);
      const failingMetrics = StubMetrics.from(failing);
      const succeedingMetrics = StubMetrics.from(succeeding);
      expect(failingMetrics.fingerprint() === succeedingMetrics.fingerprint()).assertFalse();
      expect(failingMetrics.rejected).assertEqual(3);
      expect(succeedingMetrics.rejected).assertEqual(0);
      expect(failingMetrics.successRatio()).assertEqual(0);
      expect(succeedingMetrics.successRatio()).assertEqual(1);
      expect(failingMetrics.fingerprint()).assertEqual(textFingerprint('3:0:3:0'));
      expect(succeedingMetrics.fingerprint()).assertEqual(textFingerprint('3:3:0:3'));
    });
  });
}





