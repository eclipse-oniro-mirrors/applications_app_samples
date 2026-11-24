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

/**
 * Request-code contract of the IPC client protocol.
 *
 * The production client always sends request code 1 (Index.ets, sendString).
 * The stub answers only code 1; every other integer is unknown and must be
 * rejected without a value reply. This suite pins down that boundary with
 * independent oracles from SharedDriver and checks the observable client
 * effects (toasts, events, logs, metrics, request counters).
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
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  CONNECT_SUCCESS_TOAST,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  ConnectionModel,
  MessageSequenceModel,
  MessageOptionModel,
  RequestResultModel,
  RemoteStubModel,
  RemoteProxyModel,
  createConnectedSession,
  expectedHandled,
  expectedReplyFor,
  isKnownRequestCode,
  ClientMetrics
} from '../Shared/SharedDriver';

/** Sends an arbitrary code through the attached proxy and reclaims both sequences. */
function probeCode(session: ConnectionModel, code: number): RequestResultModel {
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  const proxy = session.proxy;
  if (proxy === undefined) {
    data.reclaim();
    reply.reclaim();
    return new RequestResultModel(ERROR_PROXY_INVALID, '');
  }
  const result = proxy.sendMessageRequest(code, data, reply, new MessageOptionModel());
  data.reclaim();
  reply.reclaim();
  return result;
}

/** Arms a one-shot send failure on the session proxy. */
function armFailure(session: ConnectionModel, code: number): boolean {
  const proxy = session.proxy;
  if (proxy === undefined) {
    return false;
  }
  proxy.failNextSend = code;
  return true;
}

/** Counts how many of the four unknown codes fail through the oracle. */
function unknownOracleCount(): number {
  const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
  let total = 0;
  for (let index = 0; index < codes.length; index++) {
    if (!expectedHandled(codes[index])) {
      total = total + 1;
    }
  }
  return total;
}

export default function clientCodes(): void {
  describe('ClientProtocolCodes', () => {
    beforeAll(() => {
      logSuite('ClientProtocolCodes', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientProtocolCodes', 'end');
    });
    /**
     * @tc.name          clientCodesRequestConstantIsOne
     * @tc.desc          The production client hard-codes request code 1.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read REQUEST_CODE. 2. Compare with the literal 1.
     *                   3. Confirm the oracle accepts the same value.
     * @tc.expected      REQUEST_CODE equals 1 and is a known request code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesRequestConstantIsOne', 0, () => {
      expect(REQUEST_CODE).assertEqual(1);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(REQUEST_CODE - 1)).assertFalse();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientCodesZeroIsUnknown
     * @tc.desc          Code 0 is not handled by the stub.
     * @tc.precondition  Code oracle is available.
     * @tc.steps         1. Evaluate isKnownRequestCode(0).
     *                   2. Evaluate expectedHandled(0) and expectedReplyFor(0).
     *                   3. Compare with code 1.
     * @tc.expected      Code 0 is unknown, unhandled and has no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesZeroIsUnknown', 0, () => {
      expect(UNKNOWN_CODE_ZERO).assertEqual(0);
      expect(isKnownRequestCode(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_ZERO)).assertEqual('');
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
    });

    /**
     * @tc.name          clientCodesTwoIsUnknown
     * @tc.desc          Code 2 sits just above the supported code and is unknown.
     * @tc.precondition  Code oracle is available.
     * @tc.steps         1. Read UNKNOWN_CODE_TWO.
     *                   2. Evaluate both oracles.
     *                   3. Confirm the value differs from REQUEST_CODE.
     * @tc.expected      Code 2 is unhandled and yields an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesTwoIsUnknown', 0, () => {
      expect(UNKNOWN_CODE_TWO).assertEqual(2);
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_TWO)).assertEqual('');
      expect(UNKNOWN_CODE_TWO).assertLarger(REQUEST_CODE);
    });

    /**
     * @tc.name          clientCodesNegativeIsUnknown
     * @tc.desc          A negative request code is rejected like any stranger.
     * @tc.precondition  Code oracle is available.
     * @tc.steps         1. Read UNKNOWN_CODE_NEGATIVE.
     *                   2. Evaluate the handled and reply oracles.
     *                   3. Confirm it is below zero and below code 1.
     * @tc.expected      Negative codes are unknown and produce no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesNegativeIsUnknown', 0, () => {
      expect(UNKNOWN_CODE_NEGATIVE).assertEqual(-1);
      expect(isKnownRequestCode(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_NEGATIVE)).assertEqual('');
      expect(UNKNOWN_CODE_NEGATIVE).assertLess(0);
    });

    /**
     * @tc.name          clientCodesLargeIsUnknown
     * @tc.desc          A far-away code such as 99 is not a protocol command.
     * @tc.precondition  Code oracle is available.
     * @tc.steps         1. Read UNKNOWN_CODE_LARGE.
     *                   2. Evaluate the oracles.
     *                   3. Compare with the supported code.
     * @tc.expected      Code 99 is unknown, unhandled and reply-free.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesLargeIsUnknown', 0, () => {
      expect(UNKNOWN_CODE_LARGE).assertEqual(99);
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
      expect(UNKNOWN_CODE_LARGE).assertLarger(REQUEST_CODE);
    });

    /**
     * @tc.name          clientCodesUnknownConstantsDiffer
     * @tc.desc          The four unknown constants form a four-element set.
     * @tc.precondition  All unknown constants are exported.
     * @tc.steps         1. Build an array of the four values.
     *                   2. Compare each pair by index.
     *                   3. Count distinct oracle rejections.
     * @tc.expected      All four values differ and all four are rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesUnknownConstantsDiffer', 0, () => {
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      expect(codes.length).assertEqual(4);
      expect(codes[0]).assertEqual(0);
      expect(codes[1]).assertEqual(2);
      expect(codes[2]).assertEqual(-1);
      expect(codes[3]).assertEqual(99);
      expect(unknownOracleCount()).assertEqual(4);
      expect(codes.indexOf(REQUEST_CODE)).assertEqual(-1);
    });

    /**
     * @tc.name          clientCodesExpectedHandledOnlyOne
     * @tc.desc          The handled oracle accepts exactly one request code.
     * @tc.precondition  expectedHandled is exported.
     * @tc.steps         1. Evaluate code 1. 2. Evaluate 0, 2, -1, 99.
     *                   3. Count the true results.
     * @tc.expected      Only code 1 returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesExpectedHandledOnlyOne', 0, () => {
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_LARGE)).assertFalse();
    });

    /**
     * @tc.name          clientCodesExpectedReplyOnlyOne
     * @tc.desc          Only the supported code has a non-empty reply oracle.
     * @tc.precondition  expectedReplyFor is exported.
     * @tc.steps         1. Ask the oracle for code 1.
     *                   2. Ask for all four unknown codes.
     *                   3. Compare against REPLY_PAYLOAD.
     * @tc.expected      Code 1 maps to 'hello rpc'; unknown codes map to ''.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesExpectedReplyOnlyOne', 0, () => {
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual('hello rpc');
      expect(expectedReplyFor(UNKNOWN_CODE_ZERO)).assertEqual('');
      expect(expectedReplyFor(UNKNOWN_CODE_TWO)).assertEqual('');
      expect(expectedReplyFor(UNKNOWN_CODE_NEGATIVE)).assertEqual('');
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
    });

    /**
     * @tc.name          clientCodesClientSendsCodeOne
     * @tc.desc          The client send path uses code 1 and succeeds.
     * @tc.precondition  A connected session with a live stub.
     * @tc.steps         1. Create the session. 2. Send the default payload.
     *                   3. Inspect errCode and reply.
     * @tc.expected      errCode is 0 and the reply is 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesClientSendsCodeOne', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientCodesClientRecordsCodeOne
     * @tc.desc          The proxy records the request code on every send.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Read the initial request list.
     *                   2. Send one request.
     *                   3. Read the request list again.
     * @tc.expected      The list grows by one entry equal to 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesClientRecordsCodeOne', 0, () => {
      const session = createConnectedSession();
      expect(session.proxy?.requests.length).assertEqual(0);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.proxy?.requests.length).assertEqual(1);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.requests.indexOf(UNKNOWN_CODE_ZERO)).assertEqual(-1);
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientCodesStubHandlesCodeOneOnce
     * @tc.desc          One request produces exactly one stub handler call.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send one request. 2. Read handledCodes.
     *                   3. Read the stub received text list.
     * @tc.expected      One handled code equal to 1 and one received payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesStubHandlesCodeOneOnce', 0, () => {
      const session = createConnectedSession();
      const stub = session.proxy?.stub;
      session.sendString(REQUEST_PAYLOAD);
      expect(stub?.handledCodes.length).assertEqual(1);
      expect(stub?.handledCodes[0]).assertEqual(REQUEST_CODE);
      expect(stub?.requestCount()).assertEqual(1);
      expect(stub?.receivedTexts.length).assertEqual(1);
      expect(stub?.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          clientCodesReplyPayloadMatchesConstant
     * @tc.desc          The wire reply is the documented 'hello rpc' value.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send code 1. 2. Read the reply through the result.
     *                   3. Compare with the constant.
     * @tc.expected      The reply equals REPLY_PAYLOAD and is not the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCodesReplyPayloadMatchesConstant', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const reply = result.readReply();
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply === REQUEST_PAYLOAD).assertFalse();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientCodesZeroSendFails
     * @tc.desc          Sending code 0 through the proxy is rejected.
     * @tc.precondition  A connected session and the probe helper.
     * @tc.steps         1. Probe code 0. 2. Read errCode and reply.
     *                   3. Check the failure event.
     * @tc.expected      errCode is ERROR_SEND and no reply is produced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesZeroSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probeCode(session, UNKNOWN_CODE_ZERO);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.readReply()).assertEqual('');
      expect(session.proxy?.requests[0]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientCodesTwoSendFails
     * @tc.desc          Sending code 2 is treated as an unknown command.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 2. 2. Inspect errCode.
     *                   3. Confirm the stub recorded the attempt only.
     * @tc.expected      The call fails with ERROR_SEND and no payload is read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesTwoSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probeCode(session, UNKNOWN_CODE_TWO);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(session.proxy?.stub.handledCodes.length).assertEqual(1);
      expect(session.proxy?.stub.handledCodes[0]).assertEqual(UNKNOWN_CODE_TWO);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientCodesNegativeSendFails
     * @tc.desc          A negative code never reaches the reading branch.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code -1. 2. Read the result.
     *                   3. Verify the stub kept no text.
     * @tc.expected      The request fails and the stub text list stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesNegativeSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probeCode(session, UNKNOWN_CODE_NEGATIVE);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.reply.size()).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(session.proxy?.requests.length).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientCodesLargeSendFails
     * @tc.desc          Code 99 is far outside the protocol and fails.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 99. 2. Inspect errCode and handler log.
     *                   3. Check the reply sequence size.
     * @tc.expected      ERROR_SEND is returned and the reply stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesLargeSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probeCode(session, UNKNOWN_CODE_LARGE);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.reply.isEmpty()).assertTrue();
      expect(session.proxy?.stub.handledCodes[0]).assertEqual(UNKNOWN_CODE_LARGE);
      expect(session.proxy?.sendCalls).assertEqual(1);
      expect(session.proxy?.requests[0]).assertEqual(99);
    });

    /**
     * @tc.name          clientCodesUnknownSendHasNoReply
     * @tc.desc          A rejected code leaves the passed reply sequence empty.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 0 with a fresh reply sequence.
     *                   2. Read through the result wrapper.
     *                   3. Confirm the cursor did not advance.
     * @tc.expected      The read returns '' and the cursor stays at zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesUnknownSendHasNoReply', 0, () => {
      const session = createConnectedSession();
      const result = probeCode(session, UNKNOWN_CODE_ZERO);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.readCount).assertEqual(0);
      expect(result.reply.writeCount).assertEqual(0);
      expect(result.reply.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          clientCodesUnknownSendSkipsStubText
     * @tc.desc          The stub does not consume data for unknown codes.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 2. 2. Read stub state.
     *                   3. Probe code 1 for contrast.
     * @tc.expected      The unknown probe stores no text; code 1 stores one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesUnknownSendSkipsStubText', 0, () => {
      const session = createConnectedSession();
      const stub = session.proxy?.stub;
      probeCode(session, UNKNOWN_CODE_TWO);
      expect(stub?.receivedTexts.length).assertEqual(0);
      probeCode(session, REQUEST_CODE);
      expect(stub?.receivedTexts.length).assertEqual(1);
      expect(stub?.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(stub?.handledCodes[1]).assertEqual(REQUEST_CODE);
      expect(stub?.handledCodes.length).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesUnknownSendStillRecordsRequest
     * @tc.desc          Even a rejected code is recorded in the request history.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 99 twice.
     *                   2. Read the request list.
     *                   3. Compare both entries.
     * @tc.expected      Both entries equal 99 and the count is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesUnknownSendStillRecordsRequest', 0, () => {
      const session = createConnectedSession();
      probeCode(session, UNKNOWN_CODE_LARGE);
      probeCode(session, UNKNOWN_CODE_LARGE);
      expect(session.proxy?.requests.length).assertEqual(2);
      expect(session.proxy?.requests[0]).assertEqual(99);
      expect(session.proxy?.requests[1]).assertEqual(99);
      expect(session.proxy?.requests.indexOf(99)).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesUnknownSendCountsSendCalls
     * @tc.desc          Each unknown request increments the proxy send counter.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Record the counter before sending.
     *                   2. Probe codes 0, 2, -1, 99.
     *                   3. Compare the final counter.
     * @tc.expected      The counter grows by four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesUnknownSendCountsSendCalls', 0, () => {
      const session = createConnectedSession();
      expect(session.proxy?.sendCalls).assertEqual(0);
      probeCode(session, UNKNOWN_CODE_ZERO);
      probeCode(session, UNKNOWN_CODE_TWO);
      probeCode(session, UNKNOWN_CODE_NEGATIVE);
      probeCode(session, UNKNOWN_CODE_LARGE);
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.sendCalls).assertEqual(session.proxy?.requests.length);
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
      expect(session.proxy?.requests.length).assertEqual(4);
    });

    /**
     * @tc.name          clientCodesMixedSequenceKeepsOrder
     * @tc.desc          Request codes are preserved in send order.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 1, 0, 2, -1, 99.
     *                   2. Read the recorded list.
     *                   3. Compare element by element.
     * @tc.expected      The recorded order matches the send order exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesMixedSequenceKeepsOrder', 0, () => {
      const session = createConnectedSession();
      probeCode(session, REQUEST_CODE);
      probeCode(session, UNKNOWN_CODE_ZERO);
      probeCode(session, UNKNOWN_CODE_TWO);
      probeCode(session, UNKNOWN_CODE_NEGATIVE);
      probeCode(session, UNKNOWN_CODE_LARGE);
      const sent = session.proxy?.requests;
      expect(sent?.length).assertEqual(5);
      let order = '';
      if (sent !== undefined) {
        for (let index = 0; index < sent.length; index++) {
          if (index > 0) {
            order = order + ',';
          }
          order = order + String(sent[index]);
        }
      }
      expect(order).assertEqual('1,0,2,-1,99');
      expect(session.proxy?.sendCalls).assertEqual(5);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(5);
      expect(session.proxy?.requests.length).assertEqual(5);
    });

    /**
     * @tc.name          clientCodesMixedSequenceSuccessCount
     * @tc.desc          Only the single code-1 probe in a mixed batch succeeds.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe the known code and four unknown codes.
     *                   2. Count successes and failures.
     *                   3. Compare both totals.
     * @tc.expected      One success, four failures and five send calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesMixedSequenceSuccessCount', 0, () => {
      const session = createConnectedSession();
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO,
        UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      let successes = 0;
      let failures = 0;
      for (let index = 0; index < codes.length; index++) {
        const result = probeCode(session, codes[index]);
        if (result.isSuccess()) {
          successes = successes + 1;
        } else {
          failures = failures + 1;
        }
      }
      expect(successes).assertEqual(1);
      expect(failures).assertEqual(4);
      expect(successes + failures).assertEqual(codes.length);
      expect(session.proxy?.sendCalls).assertEqual(5);
      expect(session.proxy?.requests.length).assertEqual(5);
    });

    /**
     * @tc.name          clientCodesAlternatingOutcomes
     * @tc.desc          Known and unknown codes alternate without interference.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 1, then 0, then 1, then 2.
     *                   2. Record each errCode.
     *                   3. Count stub texts.
     * @tc.expected      The errCodes are 0,16000003,0,16000003 and two texts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesAlternatingOutcomes', 0, () => {
      const session = createConnectedSession();
      const first = probeCode(session, REQUEST_CODE);
      const second = probeCode(session, UNKNOWN_CODE_ZERO);
      const third = probeCode(session, REQUEST_CODE);
      const fourth = probeCode(session, UNKNOWN_CODE_TWO);
      expect(first.errCode).assertEqual(ERROR_NONE);
      expect(second.errCode).assertEqual(ERROR_SEND);
      expect(third.errCode).assertEqual(ERROR_NONE);
      expect(fourth.errCode).assertEqual(ERROR_SEND);
      expect(third.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesClientFailureToastOnInjectedError
     * @tc.desc          A non-zero result makes the client show the send-fail toast.
     * @tc.precondition  A connected session whose proxy fails the next send.
     * @tc.steps         1. Arm failNextSend with ERROR_SEND.
     *                   2. Send the default payload.
     *                   3. Read the last toast.
     * @tc.expected      The last toast is the send-fail message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesClientFailureToastOnInjectedError', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          clientCodesClientFailureEventOnInjectedError
     * @tc.desc          A failed send is recorded with the numeric error code.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm failNextSend with ERROR_SEND.
     *                   2. Send once. 3. Read the event trace.
     * @tc.expected      The last event is send-failed:16000003.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesClientFailureEventOnInjectedError', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.events.last()).assertEqual('send-failed:' + String(ERROR_SEND));
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          clientCodesClientFailureLogOnInjectedError
     * @tc.desc          The error log carries the failing errCode text.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm failNextSend. 2. Send once.
     *                   3. Search the log buffer for the code.
     * @tc.expected      The log contains the numeric code and no reply line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesClientFailureLogOnInjectedError', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.contains('16000003')).assertTrue();
      expect(session.logs.contains('reply hello rpc')).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertLarger(0);
      expect(session.logs.trace().indexOf('sendMessageRequest failed')).assertLarger(-1);
      expect(session.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientCodesNoProxyReturnsInvalidError
     * @tc.desc          Without a proxy the client returns ERROR_PROXY_INVALID.
     * @tc.precondition  A connected session whose proxy is cleared.
     * @tc.steps         1. Set proxy to undefined. 2. Send the payload.
     *                   3. Read errCode and toast.
     * @tc.expected      errCode is 16000004 and the send-fail toast appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesNoProxyReturnsInvalidError', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.last()).assertEqual('send-no-proxy:' + REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          clientCodesNoProxyKeepsRequestCountZero
     * @tc.desc          The no-proxy branch never records a request code.
     * @tc.precondition  A connected session with a cleared proxy.
     * @tc.steps         1. Clear the proxy. 2. Send twice.
     *                   3. Inspect the events and log.
     * @tc.expected      Two no-proxy events, zero send calls and an error log.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesNoProxyKeepsRequestCountZero', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      session.sendString();
      session.sendString();
      expect(session.events.countOf('send-no-proxy')).assertEqual(2);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.logs.contains('proxy is invalid')).assertTrue();
      expect(session.logs.countLevel('ERROR')).assertEqual(2);
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          clientCodesDeadProxyFailsSend
     * @tc.desc          A dead remote proxy rejects the request with ERROR_SEND.
     * @tc.precondition  A connected session with a killed proxy.
     * @tc.steps         1. Kill the proxy. 2. Send the payload.
     *                   3. Read the result and request list.
     * @tc.expected      errCode is ERROR_SEND while the code 1 attempt is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesDeadProxyFailsSend', 0, () => {
      const session = createConnectedSession();
      session.proxy?.kill();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.readReply()).assertEqual('');
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(0);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          clientCodesOracleIsStableAcrossCalls
     * @tc.desc          Repeated oracle evaluations return the same verdict.
     * @tc.precondition  Code oracles are pure functions.
     * @tc.steps         1. Evaluate code 1 three times.
     *                   2. Evaluate code 2 three times.
     *                   3. Compare all results pairwise.
     * @tc.expected      Both verdicts are stable and opposite to each other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesOracleIsStableAcrossCalls', 0, () => {
      const first = expectedHandled(REQUEST_CODE);
      const second = expectedHandled(REQUEST_CODE);
      const third = expectedHandled(REQUEST_CODE);
      expect(first).assertTrue();
      expect(second).assertEqual(first);
      expect(third).assertEqual(first);
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertEqual(expectedHandled(UNKNOWN_CODE_TWO));
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(expectedReplyFor(REQUEST_CODE));
    });

    /**
     * @tc.name          clientCodesKnownSetHasOneMember
     * @tc.desc          Scanning a code range finds exactly one accepted code.
     * @tc.precondition  isKnownRequestCode is exported.
     * @tc.steps         1. Scan codes -2 through 4.
     *                   2. Collect the accepted values.
     *                   3. Compare the collection with [1].
     * @tc.expected      Exactly one accepted code exists and it equals 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesKnownSetHasOneMember', 0, () => {
      const accepted: number[] = [];
      for (let code = -2; code <= 4; code++) {
        if (isKnownRequestCode(code)) {
          accepted.push(code);
        }
      }
      expect(accepted.length).assertEqual(1);
      expect(accepted[0]).assertEqual(REQUEST_CODE);
      expect(accepted.indexOf(UNKNOWN_CODE_ZERO)).assertEqual(-1);
      expect(accepted.indexOf(UNKNOWN_CODE_TWO)).assertEqual(-1);
      expect(accepted.indexOf(UNKNOWN_CODE_NEGATIVE)).assertEqual(-1);
      expect(accepted.length === 4).assertFalse();
    });

    /**
     * @tc.name          clientCodesUnknownSetHasFourMembers
     * @tc.desc          The documented unknown codes are all rejected.
     * @tc.precondition  expectedHandled is exported.
     * @tc.steps         1. Build the unknown code list.
     *                   2. Filter values rejected by the oracle.
     *                   3. Compare the filtered count.
     * @tc.expected      Four values are rejected and none is code 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesUnknownSetHasFourMembers', 0, () => {
      const codes: number[] = [0, 2, -1, 99];
      const rejected: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        if (!expectedHandled(codes[index])) {
          rejected.push(codes[index]);
        }
      }
      expect(rejected.length).assertEqual(4);
      expect(rejected.indexOf(REQUEST_CODE)).assertEqual(-1);
      expect(unknownOracleCount()).assertEqual(rejected.length);
      expect(unknownOracleCount()).assertEqual(4);
      expect(isKnownRequestCode(rejected[0])).assertFalse();
    });

    /**
     * @tc.name          clientCodesBoundaryBelowOneRejected
     * @tc.desc          Code 0 is the immediate lower neighbour of the known code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 0. 2. Probe code 1.
     *                   3. Compare errCodes and replies.
     * @tc.expected      Code 0 fails while code 1 succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesBoundaryBelowOneRejected', 0, () => {
      const session = createConnectedSession();
      const below = probeCode(session, REQUEST_CODE - 1);
      const known = probeCode(session, REQUEST_CODE);
      expect(below.errCode).assertEqual(ERROR_SEND);
      expect(known.errCode).assertEqual(ERROR_NONE);
      expect(known.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.requests[0]).assertEqual(0);
      expect(session.proxy?.requests[1]).assertEqual(1);
      expect(session.proxy?.requests.length).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesBoundaryAboveOneRejected
     * @tc.desc          Code 2 is the immediate upper neighbour of the known code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 1. 2. Probe code 2.
     *                   3. Compare both outcomes.
     * @tc.expected      Code 2 fails with ERROR_SEND while code 1 replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesBoundaryAboveOneRejected', 0, () => {
      const session = createConnectedSession();
      const known = probeCode(session, REQUEST_CODE);
      const above = probeCode(session, REQUEST_CODE + 1);
      expect(known.isSuccess()).assertTrue();
      expect(above.isSuccess()).assertFalse();
      expect(above.errCode).assertEqual(ERROR_SEND);
      expect(above.reply.isEmpty()).assertTrue();
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.requests[1]).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesZeroIsNotTheRequestCode
     * @tc.desc          A zero code must never be mistaken for a valid request.
     * @tc.precondition  Constants and oracles are loaded.
     * @tc.steps         1. Compare zero with REQUEST_CODE.
     *                   2. Probe zero and inspect errCode.
     *                   3. Confirm no reply text is readable.
     * @tc.expected      Zero differs from 1 and its probe fails cleanly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesZeroIsNotTheRequestCode', 0, () => {
      const session = createConnectedSession();
      expect(UNKNOWN_CODE_ZERO === REQUEST_CODE).assertFalse();
      const result = probeCode(session, UNKNOWN_CODE_ZERO);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.errCode === ERROR_NONE).assertFalse();
      expect(result.readReply()).assertEqual('');
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.toasts.length).assertEqual(1);
      expect(session.logs.contains('16000003')).assertFalse();
    });

    /**
     * @tc.name          clientCodesSuccessEventTextIsReply
     * @tc.desc          A successful send records the reply text in the event log.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the default payload.
     *                   2. Read the last event. 3. Count send-ok events.
     * @tc.expected      The last event is send-ok:hello rpc and occurs once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesSuccessEventTextIsReply', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(session.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          clientCodesFailureEventTextIsCode
     * @tc.desc          A failed send records the numeric errCode in the event log.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm ERROR_PROXY_INVALID as the next failure.
     *                   2. Send once. 3. Read the last event.
     * @tc.expected      The last event is send-failed:16000004.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesFailureEventTextIsCode', 0, () => {
      const session = createConnectedSession();
      const armed = armFailure(session, ERROR_PROXY_INVALID);
      session.sendString(REQUEST_PAYLOAD);
      expect(armed).assertTrue();
      expect(session.events.last()).assertEqual('send-failed:16000004');
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.events.trace().indexOf(String(ERROR_PROXY_INVALID))).assertLarger(-1);
    });

    /**
     * @tc.name          clientCodesToastAfterKnownSend
     * @tc.desc          A successful send appends the success toast after the connect toast.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Read the toast list after connecting.
     *                   2. Send the payload. 3. Read the toast list again.
     * @tc.expected      The list grows from one to two with the success toast last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesToastAfterKnownSend', 0, () => {
      const session = createConnectedSession();
      expect(session.toasts.length).assertEqual(1);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.lastToast() === SEND_FAIL_TOAST).assertFalse();
    });

    /**
     * @tc.name          clientCodesToastAfterFailedSend
     * @tc.desc          A failed send appends the failure toast instead of the success one.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm ERROR_SEND. 2. Send the payload.
     *                   3. Read the toast list.
     * @tc.expected      The last toast is the send-fail message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesToastAfterFailedSend', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.toasts.length).assertEqual(2);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts.indexOf(SEND_SUCCESS_TOAST)).assertEqual(-1);
      expect(session.lastToast().indexOf('connect to the server first')).assertLarger(-1);
    });

    /**
     * @tc.name          clientCodesLogsRecordReplyOnSuccess
     * @tc.desc          The info log records the received reply text.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload. 2. Search the log buffer.
     *                   3. Count INFO entries.
     * @tc.expected      The log contains 'reply hello rpc' and no ERROR entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesLogsRecordReplyOnSuccess', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(session.logs.contains('sendMessageRequest failed')).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.logs.countLevel('INFO')).assertLarger(1);
      expect(session.logs.size()).assertLarger(2);
      expect(session.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          clientCodesLogsRecordFailureCode
     * @tc.desc          A failed send writes the errCode into the error log.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm ERROR_SEND. 2. Send once.
     *                   3. Search for the code and the reply spelling.
     * @tc.expected      The code appears in the log while the reply text does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesLogsRecordFailureCode', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.contains(String(ERROR_SEND))).assertTrue();
      expect(session.logs.contains('reply hello rpc')).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(session.logs.trace().indexOf('sendMessageRequest failed, errCode is 16000003')).assertLarger(-1);
      expect(session.logs.lines[session.logs.lines.length - 1].startsWith('ERROR')).assertTrue();
    });

    /**
     * @tc.name          clientCodesMetricsCountsReplies
     * @tc.desc          The metrics snapshot counts one reply per successful send.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload three times.
     *                   2. Build metrics from the session.
     *                   3. Compare sends and replies.
     * @tc.expected      Sends equal replies equal three and failures stay zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesMetricsCountsReplies', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.connects).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(3);
    });

    /**
     * @tc.name          clientCodesMetricsCountsFailures
     * @tc.desc          Injected failures are counted by the metrics snapshot.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send once successfully.
     *                   2. Arm and trigger one failure.
     *                   3. Build metrics.
     * @tc.expected      Sends equal two, replies equal one, failures equal one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesMetricsCountsFailures', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientCodesMetricsSuccessRatioOnMixedRun
     * @tc.desc          A three-send mixed run yields a two-thirds success ratio.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send successfully twice with one failure between.
     *                   2. Build metrics. 3. Compare the ratio.
     * @tc.expected      The ratio is 2/3 and the sends total is three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesMetricsSuccessRatioOnMixedRun', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(2 / 3);
      expect(metrics.successRatio() < 1).assertTrue();
      expect(metrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          clientCodesFingerprintDiffersAcrossOutcomes
     * @tc.desc          Success-only and mixed runs hash differently.
     * @tc.precondition  Two connected sessions.
     * @tc.steps         1. Record a success-only fingerprint.
     *                   2. Record a mixed-run fingerprint.
     *                   3. Compare both.
     * @tc.expected      The fingerprints differ while each stays stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesFingerprintDiffersAcrossOutcomes', 0, () => {
      const success = createConnectedSession();
      success.sendString(REQUEST_PAYLOAD);
      const mixed = createConnectedSession();
      mixed.sendString(REQUEST_PAYLOAD);
      armFailure(mixed, ERROR_SEND);
      mixed.sendString(REQUEST_PAYLOAD);
      const successFingerprint = ClientMetrics.from(success).fingerprint();
      const mixedFingerprint = ClientMetrics.from(mixed).fingerprint();
      expect(successFingerprint === mixedFingerprint).assertFalse();
      expect(successFingerprint).assertEqual(ClientMetrics.from(success).fingerprint());
      expect(mixedFingerprint).assertEqual(ClientMetrics.from(mixed).fingerprint());
      expect(successFingerprint).assertLarger(0);
      expect(mixedFingerprint).assertLarger(0);
    });

    /**
     * @tc.name          clientCodesTwoKnownSendsProduceTwoReplies
     * @tc.desc          Repeating code 1 is allowed and duplicates the reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send twice. 2. Read both results.
     *                   3. Count stub texts.
     * @tc.expected      Both replies equal 'hello rpc' and two texts are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesTwoKnownSendsProduceTwoReplies', 0, () => {
      const session = createConnectedSession();
      const first = session.sendString(REQUEST_PAYLOAD);
      const second = session.sendString(REQUEST_PAYLOAD);
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(second.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.reply === second.reply).assertFalse();
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(2);
      expect(session.proxy?.requests.length).assertEqual(2);
      expect(session.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesHandlerCountMatchesSendCalls
     * @tc.desc          The stub handler runs once per recorded send.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Mix two valid and one invalid probe.
     *                   2. Compare handler count with send calls.
     *                   3. Compare handled codes with the request list.
     * @tc.expected      Handler count equals three and every code is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesHandlerCountMatchesSendCalls', 0, () => {
      const session = createConnectedSession();
      probeCode(session, REQUEST_CODE);
      probeCode(session, UNKNOWN_CODE_ZERO);
      probeCode(session, REQUEST_CODE);
      const stub = session.proxy?.stub;
      expect(stub?.handledCodes.length).assertEqual(3);
      expect(session.proxy?.sendCalls).assertEqual(3);
      expect(session.proxy?.requests.length).assertEqual(3);
      expect(stub?.handledCodes[0]).assertEqual(stub?.handledCodes[2]);
      expect(stub?.handledCodes[1]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(stub?.receivedTexts.length).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesEventTraceStartsWithConnect
     * @tc.desc          The first recorded client event is the connect request.
     * @tc.precondition  A freshly created connected session.
     * @tc.steps         1. Read the event trace. 2. Split it on the pipe character.
     *                   3. Compare the first segment.
     * @tc.expected      The trace starts with connect:com.example.ipc_stub/ServiceAbility.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesEventTraceStartsWithConnect', 0, () => {
      const session = createConnectedSession();
      const trace = session.events.trace();
      expect(trace.indexOf('connect:') === 0).assertTrue();
      expect(trace.startsWith('connect:com.example.ipc_stub/ServiceAbility')).assertTrue();
      expect(session.events.entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(session.events.entries[1]).assertEqual('death-register:IPCStubTest');
      expect(session.events.entries[2]).assertEqual('connected:IPCStubTest');
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientCodesEventTraceEndsWithSendOk
     * @tc.desc          A successful send is the last event in the trace.
     * @tc.precondition  A connected session after one send.
     * @tc.steps         1. Send the payload. 2. Read the last entry.
     *                   3. Compare with the expected marker.
     * @tc.expected      The final entry is send-ok:hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesEventTraceEndsWithSendOk', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(session.events.last().startsWith('send-ok:')).assertTrue();
      expect(session.events.size()).assertEqual(4);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.events.trace().endsWith(REPLY_PAYLOAD)).assertTrue();
    });

    /**
     * @tc.name          clientCodesUnknownProbeDoesNotTouchClientLogs
     * @tc.desc          A proxy-level unknown probe leaves the client log untouched.
     * @tc.precondition  A connected session and the probe helper.
     * @tc.steps         1. Record the log size. 2. Probe code 0.
     *                   3. Compare the log size and content.
     * @tc.expected      The log size is unchanged and no reply line exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesUnknownProbeDoesNotTouchClientLogs', 0, () => {
      const session = createConnectedSession();
      const before = session.logs.size();
      probeCode(session, UNKNOWN_CODE_ZERO);
      expect(session.logs.size()).assertEqual(before);
      expect(session.logs.contains('proxy is invalid')).assertFalse();
      expect(session.logs.contains('reply hello rpc')).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.logs.countLevel('INFO')).assertEqual(2);
      expect(session.logs.lines[1]).assertEqual('INFO onConnect');
    });

    /**
     * @tc.name          clientCodesUnknownProbeDoesNotToast
     * @tc.desc          Probe-level rejections never append a toast.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Read the toast count. 2. Probe all four unknown codes.
     *                   3. Compare the toast count.
     * @tc.expected      The count stays at one and the last toast is the connect one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesUnknownProbeDoesNotToast', 0, () => {
      const session = createConnectedSession();
      expect(session.toasts.length).assertEqual(1);
      probeCode(session, UNKNOWN_CODE_ZERO);
      probeCode(session, UNKNOWN_CODE_TWO);
      probeCode(session, UNKNOWN_CODE_NEGATIVE);
      probeCode(session, UNKNOWN_CODE_LARGE);
      expect(session.toasts.length).assertEqual(1);
      expect(session.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(session.toasts.indexOf(SEND_SUCCESS_TOAST)).assertEqual(-1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          clientCodesRepeatedUnknownProbesAreIdempotent
     * @tc.desc          Repeating the same unknown code yields the same error.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 99 three times.
     *                   2. Compare all errCodes.
     *                   3. Count stub handler entries.
     * @tc.expected      All errCodes are ERROR_SEND and handler count is three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesRepeatedUnknownProbesAreIdempotent', 0, () => {
      const session = createConnectedSession();
      const first = probeCode(session, UNKNOWN_CODE_LARGE);
      const second = probeCode(session, UNKNOWN_CODE_LARGE);
      const third = probeCode(session, UNKNOWN_CODE_LARGE);
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(second.errCode).assertEqual(first.errCode);
      expect(third.errCode).assertEqual(first.errCode);
      expect(first.reply.isEmpty()).assertTrue();
      expect(second.reply.isEmpty()).assertTrue();
      expect(third.reply.isEmpty()).assertTrue();
      expect(session.proxy?.stub.handledCodes.length).assertEqual(3);
    });

    /**
     * @tc.name          clientCodesSendAfterResetUsesNoProxy
     * @tc.desc          Reset clears the proxy so the next send takes the no-proxy path.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send once. 2. Reset the client.
     *                   3. Send again and inspect the result.
     * @tc.expected      After reset the send returns 16000004 and logs the invalid proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesSendAfterResetUsesNoProxy', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      session.reset();
      expect(session.proxy === undefined).assertTrue();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(session.logs.contains('proxy is invalid')).assertTrue();
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(session.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          clientCodesSendAfterReconnectUsesCodeOne
     * @tc.desc          A reconnected session still sends request code 1.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Disconnect through the callback.
     *                   2. Reconnect with a fresh proxy.
     *                   3. Send and read the request code.
     * @tc.expected      The new proxy records code 1 and the reply is 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesSendAfterReconnectUsesCodeOne', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      session.connect(9);
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      session.onConnect(proxy);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.requests.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesStubReceivesOnlyKnownPayloads
     * @tc.desc          Rejected codes never leak their payload into the stub.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe the four unknown codes with a payload.
     *                   2. Probe code 1. 3. Compare the stored texts.
     * @tc.expected      Only the code-1 payload reaches the stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesStubReceivesOnlyKnownPayloads', 0, () => {
      const session = createConnectedSession();
      probeCode(session, UNKNOWN_CODE_ZERO);
      probeCode(session, UNKNOWN_CODE_TWO);
      probeCode(session, UNKNOWN_CODE_NEGATIVE);
      probeCode(session, UNKNOWN_CODE_LARGE);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      probeCode(session, REQUEST_CODE);
      const texts = session.proxy?.stub.receivedTexts;
      expect(texts?.length).assertEqual(1);
      expect(texts?.join(',')).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(5);
      expect(session.proxy?.sendCalls).assertEqual(5);
    });

    /**
     * @tc.name          clientCodesSequenceReclaimAfterEachProbe
     * @tc.desc          The probe helper reclaims both sequences on every path.
     * @tc.precondition  A connected session and a cleared proxy.
     * @tc.steps         1. Probe code 1 with a proxy.
     *                   2. Clear the proxy and probe again.
     *                   3. Confirm neither call leaks a live sequence.
     * @tc.expected      Both probes return without touching reclaimed buffers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesSequenceReclaimAfterEachProbe', 0, () => {
      const session = createConnectedSession();
      const first = probeCode(session, REQUEST_CODE);
      expect(first.errCode).assertEqual(ERROR_NONE);
      expect(first.isSuccess()).assertTrue();
      session.proxy = undefined;
      const second = probeCode(session, UNKNOWN_CODE_ZERO);
      expect(second.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(second.reply.isEmpty()).assertTrue();
      expect(second.readReply()).assertEqual('');
      expect(session.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          clientCodesEventFingerprintStableForSameScript
     * @tc.desc          Two identical send scripts produce the same event hash.
     * @tc.precondition  Two independent connected sessions.
     * @tc.steps         1. Run the same probe script on both sessions.
     *                   2. Compute each event fingerprint.
     *                   3. Compare the hashes.
     * @tc.expected      Both fingerprints are equal and non-zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesEventFingerprintStableForSameScript', 0, () => {
      const first = createConnectedSession();
      const second = createConnectedSession();
      first.sendString(REQUEST_PAYLOAD);
      probeCode(first, UNKNOWN_CODE_ZERO);
      second.sendString(REQUEST_PAYLOAD);
      probeCode(second, UNKNOWN_CODE_ZERO);
      const firstHash = first.events.fingerprint();
      const secondHash = second.events.fingerprint();
      expect(firstHash).assertEqual(secondHash);
      expect(firstHash).assertLarger(0);
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          clientCodesRequestListLengthMatchesSendCalls
     * @tc.desc          The request list and the send counter advance together.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Mix valid and invalid probes.
     *                   2. Compare requests.length with sendCalls.
     *                   3. Compare errCodes of the last probe.
     * @tc.expected      Both counters equal the number of probes performed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesRequestListLengthMatchesSendCalls', 0, () => {
      const session = createConnectedSession();
      const codes: number[] = [1, 0, 1, 2, 1, -1, 1, 99];
      for (let index = 0; index < codes.length; index++) {
        probeCode(session, codes[index]);
      }
      expect(session.proxy?.requests.length).assertEqual(codes.length);
      expect(session.proxy?.sendCalls).assertEqual(codes.length);
      expect(codes.length).assertEqual(8);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(4);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(8);
    });

    /**
     * @tc.name          clientCodesUnknownCodesNeverProduceSendOkEvent
     * @tc.desc          No unknown code may be counted as a successful reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send successfully once.
     *                   2. Probe every unknown code.
     *                   3. Count send-ok events.
     * @tc.expected      Exactly one send-ok event exists after the probes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesUnknownCodesNeverProduceSendOkEvent', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      probeCode(session, UNKNOWN_CODE_ZERO);
      probeCode(session, UNKNOWN_CODE_TWO);
      probeCode(session, UNKNOWN_CODE_NEGATIVE);
      probeCode(session, UNKNOWN_CODE_LARGE);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.events.countOf('send-no-proxy')).assertEqual(0);
      expect(ClientMetrics.from(session).replies).assertEqual(1);
      expect(ClientMetrics.from(session).sends).assertEqual(1);
    });

    /**
     * @tc.name          clientCodesMixedTraceCountsAddUp
     * @tc.desc          Event kinds in a mixed run sum to the trace length.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Run two successful sends and one failure.
     *                   2. Count every event kind.
     *                   3. Compare the sum with the trace length.
     * @tc.expected      The counts add up and no unexpected kind appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesMixedTraceCountsAddUp', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      const connects = session.events.countOf('connect');
      const registers = session.events.countOf('death-register');
      const connected = session.events.countOf('connected');
      const ok = session.events.countOf('send-ok');
      const failed = session.events.countOf('send-failed');
      expect(connects).assertEqual(1);
      expect(registers).assertEqual(1);
      expect(connected).assertEqual(1);
      expect(ok).assertEqual(2);
      expect(failed).assertEqual(1);
      expect(connects + registers + connected + ok + failed).assertEqual(session.events.size());
      expect(session.events.size()).assertEqual(6);
    });

    /**
     * @tc.name          clientCodesJunkCodesKeepPayloadIntact
     * @tc.desc          A rejected request does not corrupt the following valid one.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 0 with the sample payload.
     *                   2. Probe code 1 with the same payload.
     *                   3. Read the stored text and reply.
     * @tc.expected      The valid request still stores 'hello world' and replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesJunkCodesKeepPayloadIntact', 0, () => {
      const session = createConnectedSession();
      const rejected = probeCode(session, UNKNOWN_CODE_ZERO);
      const accepted = probeCode(session, REQUEST_CODE);
      expect(rejected.isSuccess()).assertFalse();
      expect(accepted.isSuccess()).assertTrue();
      expect(accepted.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.requests[0]).assertEqual(0);
      expect(session.proxy?.requests[1]).assertEqual(1);
    });

    /**
     * @tc.name          clientCodesOracleMatchesStubHandlerForAllCodes
     * @tc.desc          The independent oracle agrees with the stub for every code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe codes -1 through 3.
     *                   2. Compare each success flag with expectedHandled.
     *                   3. Count agreements.
     * @tc.expected      All five evaluations agree with the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCodesOracleMatchesStubHandlerForAllCodes', 0, () => {
      const session = createConnectedSession();
      let agreements = 0;
      for (let code = -1; code <= 3; code++) {
        const result = probeCode(session, code);
        if (result.isSuccess() === expectedHandled(code)) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(5);
      expect(session.proxy?.requests.length).assertEqual(5);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(5);
      expect(session.proxy?.stub.handledCodes.indexOf(REQUEST_CODE)).assertEqual(2);
    });

    /**
     * @tc.name          clientCodesSendStringDefaultsToSamplePayload
     * @tc.desc          sendString without an argument uses 'hello world'.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Call sendString with no argument.
     *                   2. Read the stub text list.
     *                   3. Read the reply.
     * @tc.expected      The default payload reaches the stub and the reply arrives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCodesSendStringDefaultsToSamplePayload', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString();
      expect(result.isSuccess()).assertTrue();
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('hello world');
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

  });
}
