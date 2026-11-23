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
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  MessageSequenceModel,
  MessageOptionModel,
  createConnectedSession,
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_DISCONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  ERROR_DEATH_REGISTER,
  isNonZeroError,
  isKnownRequestCode,
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

export default function errorValidation(): void {
  describe('ErrorValidation', () => {
    beforeAll(() => {
      logSuite('ErrorValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ErrorValidation', 'end');
    });

    /**
     * @tc.name          errorValidationNoneIsZero
     * @tc.desc          The success code is exactly zero.
     * @tc.precondition  ERROR_NONE is exported.
     * @tc.steps         1. Read the constant.
     *                   2. Compare with the literal.
     *                   3. Check the non-zero predicate.
     * @tc.expected      The success code is zero and fails the non-zero predicate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationNoneIsZero', 0, () => {
      logStep('errorValidation', 'none=' + String(ERROR_NONE));
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_NONE === 0).assertTrue();
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(String(ERROR_NONE)).assertEqual('0');
      expect(ERROR_NONE + 1).assertEqual(1);
      expect(ERROR_NONE).assertLess(1);
      expect(ERROR_NONE * 100).assertEqual(0);
    });

    /**
     * @tc.name          errorValidationFiveConstants
     * @tc.desc          The five protocol error constants hold their documented values.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Read each constant.
     *                   2. Compare with the expected numbers.
     *                   3. Deduplicate the values.
     * @tc.expected      The codes run from 16000001 to 16000005.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationFiveConstants', 0, () => {
      expect(ERROR_CONNECT).assertEqual(16000001);
      expect(ERROR_DISCONNECT).assertEqual(16000002);
      expect(ERROR_SEND).assertEqual(16000003);
      expect(ERROR_PROXY_INVALID).assertEqual(16000004);
      expect(ERROR_DEATH_REGISTER).assertEqual(16000005);
      expect(uniqueStrings([String(ERROR_CONNECT), String(ERROR_DISCONNECT), String(ERROR_SEND),
        String(ERROR_PROXY_INVALID), String(ERROR_DEATH_REGISTER)]).length).assertEqual(5);
      expect(ERROR_CONNECT).assertLess(ERROR_DEATH_REGISTER);
    });

    /**
     * @tc.name          errorValidationMonotonicOrder
     * @tc.desc          The error constants increase by exactly one.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Subtract adjacent constants.
     *                   2. Compare each difference.
     *                   3. Check the total span.
     * @tc.expected      Every adjacent difference is one and the span is four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationMonotonicOrder', 0, () => {
      expect(ERROR_DISCONNECT - ERROR_CONNECT).assertEqual(1);
      expect(ERROR_SEND - ERROR_DISCONNECT).assertEqual(1);
      expect(ERROR_PROXY_INVALID - ERROR_SEND).assertEqual(1);
      expect(ERROR_DEATH_REGISTER - ERROR_PROXY_INVALID).assertEqual(1);
      expect(ERROR_DEATH_REGISTER - ERROR_CONNECT).assertEqual(4);
      expect(ERROR_CONNECT).assertLarger(ERROR_NONE);
      expect(ERROR_DEATH_REGISTER).assertLarger(ERROR_PROXY_INVALID);
      expect(ERROR_SEND).assertLess(ERROR_PROXY_INVALID);
    });

    /**
     * @tc.name          errorValidationNonZeroPredicate
     * @tc.desc          The non-zero predicate is true for every protocol error.
     * @tc.precondition  isNonZeroError is exported.
     * @tc.steps         1. Evaluate the predicate for the five codes.
     *                   2. Evaluate it for zero.
     *                   3. Count the true results.
     * @tc.expected      Exactly five codes are non-zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationNonZeroPredicate', 0, () => {
      let trueCount: number = 0;
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 0; index < codes.length; index++) {
        if (isNonZeroError(codes[index])) {
          trueCount = trueCount + 1;
        }
      }
      expect(trueCount).assertEqual(5);
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(-1)).assertTrue();
      expect(isNonZeroError(ERROR_SEND)).assertTrue();
      expect(isNonZeroError(0)).assertFalse();
      expect(isNonZeroError(1)).assertTrue();
    });

    /**
     * @tc.name          errorValidationSendWithoutProxyCode
     * @tc.desc          Sending without a proxy reports the proxy invalid code.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send a payload.
     *                   2. Read the result code.
     *                   3. Compare with the constant.
     * @tc.expected      The code is 16000004.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationSendWithoutProxyCode', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const result = client.sendString('no proxy');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.lastToast().startsWith('sendRequest failed')).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
    });

    /**
     * @tc.name          errorValidationUnknownCodeRejected
     * @tc.desc          The stub rejects request code two with the send error.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Build a data sequence and send code two directly.
     *                   2. Read the result code.
     *                   3. Compare with the stub handled list.
     * @tc.expected      The code is 16000003 and the request was not handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationUnknownCodeRejected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('payload');
      const result = client.proxy?.sendMessageRequest(UNKNOWN_CODE_TWO, data, reply,
        new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_SEND);
      expect(result?.errCode).assertEqual(16000003);
      expect(result?.isSuccess()).assertFalse();
      expect(client.proxy?.stub.handledCodes[0]).assertEqual(2);
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO)).assertFalse();
      expect(isNonZeroError(ERROR_SEND)).assertTrue();
    });

    /**
     * @tc.name          errorValidationFailNextSendPassthrough
     * @tc.desc          A configured failure code is returned unchanged by the proxy.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Set the next failure to the death register code.
     *                   2. Send.
     *                   3. Read the result code.
     * @tc.expected      The result carries 16000005 once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationFailNextSendPassthrough', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_DEATH_REGISTER;
      }
      const result = client.sendString();
      expect(result.errCode).assertEqual(ERROR_DEATH_REGISTER);
      expect(result.errCode).assertEqual(16000005);
      expect(result.replyText).assertEqual('');
      expect(client.proxy?.failNextSend).assertEqual(ERROR_NONE);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.lastToast().startsWith('sendRequest failed')).assertTrue();
      expect(client.logs.contains('sendMessageRequest failed, errCode is 16000005')).assertTrue();
    });

    /**
     * @tc.name          errorValidationDeadProxySendCode
     * @tc.desc          A dead proxy reports the send error even for a valid code.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Kill the proxy.
     *                   2. Send a valid request.
     *                   3. Read the result.
     * @tc.expected      The code is 16000003 and the stub stays untouched.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationDeadProxySendCode', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.proxy?.kill();
      const result = client.sendString('dead');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.errCode).assertEqual(16000003);
      expect(result.isSuccess()).assertFalse();
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(client.proxy?.sendCalls).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.toasts.length).assertEqual(2);
      expect(client.state).assertEqual('connected');
    });

    /**
     * @tc.name          errorValidationOnFailedStoresCode
     * @tc.desc          The connection failure callback stores the numeric code.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect the client.
     *                   2. Fail with the connect error.
     *                   3. Read failedCode.
     * @tc.expected      The stored code is 16000001 and the state is failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationOnFailedStoresCode', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.state).assertEqual('failed');
      expect(client.events.last()).assertEqual('failed:16000001');
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.contains('onFailed code 16000001')).assertTrue();
      expect(isNonZeroError(client.failedCode)).assertTrue();
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          errorValidationFailureLogFormat
     * @tc.desc          The send failure log embeds the decimal error code.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force a failure with the disconnect code.
     *                   2. Send.
     *                   3. Read the log trace.
     * @tc.expected      The log line names the code 16000002.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationFailureLogFormat', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_DISCONNECT;
      }
      client.sendString();
      expect(client.logs.size()).assertEqual(3);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.trace().endsWith(
        'ERROR sendMessageRequest failed, errCode is 16000002')).assertTrue();
      expect(client.logs.contains('errCode is 16000002')).assertTrue();
      expect(client.logs.trace().indexOf(String(ERROR_DISCONNECT))).assertLarger(0);
      expect(client.logs.lines[client.logs.size() - 1].startsWith('ERROR ')).assertTrue();
      expect(client.events.countOf('send-failed')).assertEqual(1);
    });

    /**
     * @tc.name          errorValidationUnknownCodeConstants
     * @tc.desc          The unknown request code constants hold their documented values.
     * @tc.precondition  The unknown code constants are exported.
     * @tc.steps         1. Read each constant.
     *                   2. Compare with the literal values.
     *                   3. Check they differ from the request code.
     * @tc.expected      The unknown codes are zero, two, minus one and ninety-nine.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationUnknownCodeConstants', 0, () => {
      expect(UNKNOWN_CODE_ZERO).assertEqual(0);
      expect(UNKNOWN_CODE_TWO).assertEqual(2);
      expect(UNKNOWN_CODE_NEGATIVE).assertEqual(-1);
      expect(UNKNOWN_CODE_LARGE).assertEqual(99);
      expect(UNKNOWN_CODE_TWO).assertEqual(REQUEST_CODE + 1);
      expect(UNKNOWN_CODE_NEGATIVE).assertLess(0);
      expect(UNKNOWN_CODE_LARGE).assertLarger(REQUEST_CODE);
      expect(uniqueStrings([String(UNKNOWN_CODE_ZERO), String(UNKNOWN_CODE_TWO),
        String(UNKNOWN_CODE_NEGATIVE), String(UNKNOWN_CODE_LARGE)]).length).assertEqual(4);
    });

    /**
     * @tc.name          errorValidationKnownRequestCodeOnlyOne
     * @tc.desc          Only request code one is accepted by the protocol.
     * @tc.precondition  isKnownRequestCode is exported.
     * @tc.steps         1. Evaluate the predicate for one.
     *                   2. Evaluate it for the four unknown codes.
     *                   3. Count the true results.
     * @tc.expected      Exactly one evaluated code is known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationKnownRequestCodeOnlyOne', 0, () => {
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO,
        UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      let trueCount: number = 0;
      for (let index = 0; index < codes.length; index++) {
        if (isKnownRequestCode(codes[index])) {
          trueCount = trueCount + 1;
        }
      }
      expect(trueCount).assertEqual(1);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(REQUEST_CODE).assertEqual(1);
      expect(isKnownRequestCode(1)).assertTrue();
      expect(isKnownRequestCode(999)).assertFalse();
    });

    /**
     * @tc.name          errorValidationValidRequestSucceeds
     * @tc.desc          Request code one returns the success code.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload.
     *                   2. Read the result code.
     *                   3. Compare with the success constant.
     * @tc.expected      The code is zero and isSuccess is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationValidRequestSucceeds', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const result = client.sendString('valid');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.errCode).assertEqual(0);
      expect(result.isSuccess()).assertTrue();
      expect(isNonZeroError(result.errCode)).assertFalse();
      expect(result.replyText).assertEqual('hello rpc');
      expect(client.proxy?.stub.handledCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          errorValidationZeroCodeRejected
     * @tc.desc          Request code zero is rejected by the stub.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send code zero directly.
     *                   2. Read the result.
     *                   3. Check the handled codes.
     * @tc.expected      The result code is 16000003 and no text was read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationZeroCodeRejected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('zero');
      const result = client.proxy?.sendMessageRequest(UNKNOWN_CODE_ZERO, data,
        MessageSequenceModel.create(), new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_SEND);
      expect(result?.isSuccess()).assertFalse();
      expect(client.proxy?.stub.handledCodes.length).assertEqual(1);
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(client.proxy?.requests[0]).assertEqual(0);
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isNonZeroError(result?.errCode ?? ERROR_NONE)).assertTrue();
    });

    /**
     * @tc.name          errorValidationNegativeCodeRejected
     * @tc.desc          Request code minus one is rejected by the stub.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send code minus one directly.
     *                   2. Read the result.
     *                   3. Check the request log.
     * @tc.expected      The result code is 16000003.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationNegativeCodeRejected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('negative');
      const result = client.proxy?.sendMessageRequest(UNKNOWN_CODE_NEGATIVE, data,
        MessageSequenceModel.create(), new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_SEND);
      expect(result?.errCode).assertEqual(16000003);
      expect(client.proxy?.requests[0]).assertEqual(-1);
      expect(client.proxy?.stub.handledCodes[0]).assertEqual(-1);
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(result?.replyText).assertEqual('');
      expect(isKnownRequestCode(-1)).assertFalse();
    });

    /**
     * @tc.name          errorValidationLargeCodeRejected
     * @tc.desc          Request code ninety-nine is rejected by the stub.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send code ninety-nine directly.
     *                   2. Read the result.
     *                   3. Compare with the send error.
     * @tc.expected      The result code is the send error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationLargeCodeRejected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('large');
      const result = client.proxy?.sendMessageRequest(UNKNOWN_CODE_LARGE, data,
        MessageSequenceModel.create(), new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_SEND);
      expect(client.proxy?.stub.handledCodes[0]).assertEqual(99);
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(client.proxy?.sendCalls).assertEqual(1);
      expect(isKnownRequestCode(99)).assertFalse();
      expect(ERROR_SEND).assertEqual(16000003);
      expect(result?.isSuccess()).assertFalse();
    });

    /**
     * @tc.name          errorValidationRejectedWriteNoReply
     * @tc.desc          A rejected request leaves the reply sequence empty.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a rejected code with a fresh reply sequence.
     *                   2. Inspect the reply sequence.
     *                   3. Compare its write count.
     * @tc.expected      The reply sequence holds no values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationRejectedWriteNoReply', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('rejected');
      const result = client.proxy?.sendMessageRequest(UNKNOWN_CODE_TWO, data, reply,
        new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_SEND);
      expect(reply.size()).assertEqual(0);
      expect(reply.isEmpty()).assertTrue();
      expect(reply.writeCount).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(result?.replyText).assertEqual('');
      expect(reply.trace()).assertEqual('#0');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          errorValidationHandledCodesRecordAll
     * @tc.desc          The stub records both accepted and rejected codes.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send code one and code two directly.
     *                   2. Read the handled list.
     *                   3. Compare the order.
     * @tc.expected      The handled list is one then two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationHandledCodesRecordAll', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('record');
      client.proxy?.sendMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(),
        new MessageOptionModel());
      client.proxy?.sendMessageRequest(UNKNOWN_CODE_TWO, data, MessageSequenceModel.create(),
        new MessageOptionModel());
      const handled: number[] = client.proxy?.stub.handledCodes ?? [];
      expect(handled.length).assertEqual(2);
      expect(handled[0]).assertEqual(REQUEST_CODE);
      expect(handled[1]).assertEqual(UNKNOWN_CODE_TWO);
      expect(joined([String(handled[0]), String(handled[1])], ',')).assertEqual('1,2');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(client.proxy?.requests.length).assertEqual(2);
      expect(client.proxy?.sendCalls).assertEqual(2);
    });

    /**
     * @tc.name          errorValidationSuccessReplyErrorNone
     * @tc.desc          A successful request result has the success code and reply text.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload.
     *                   2. Inspect the reply sequence.
     *                   3. Read the reply text.
     * @tc.expected      The code is zero and the reply holds hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationSuccessReplyErrorNone', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const result = client.sendString();
      expect(result.errCode).assertEqual(0);
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.writeCount).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('hello rpc');
      expect(result.isSuccess()).assertTrue();
      expect(isNonZeroError(result.errCode)).assertFalse();
    });

    /**
     * @tc.name          errorValidationSessionSendSuccessCode
     * @tc.desc          The connected session helper produces a zero send code.
     * @tc.precondition  createConnectedSession is exported.
     * @tc.steps         1. Build a session.
     *                   2. Send a request.
     *                   3. Compare the code with the success constant.
     * @tc.expected      The helper session returns zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationSessionSendSuccessCode', 0, () => {
      const client: ConnectionModel = createConnectedSession('custom reply');
      const result = client.sendString('request');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.errCode).assertEqual(0);
      expect(result.readReply()).assertEqual('custom reply');
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(0);
      expect(client.failedCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name          errorValidationCodeTextLength
     * @tc.desc          Each protocol error code renders as eight decimal digits.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Convert each code to text.
     *                   2. Compare the lengths.
     *                   3. Check the prefix.
     * @tc.expected      Every code text is eight characters beginning with 1600000.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationCodeTextLength', 0, () => {
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 0; index < codes.length; index++) {
        expect(String(codes[index]).length).assertEqual(8);
        expect(String(codes[index]).startsWith('1600000')).assertTrue();
        expect(String(codes[index]).charAt(7)).assertEqual(String(index + 1));
      }
      expect(String(ERROR_CONNECT)).assertEqual('16000001');
      expect(String(ERROR_DEATH_REGISTER)).assertEqual('16000005');
      expect(String(ERROR_NONE)).assertEqual('0');
    });

    /**
     * @tc.name          errorValidationCodeFingerprintsUnique
     * @tc.desc          The five error code texts hash uniquely.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Hash each code text.
     *                   2. Deduplicate the hashes.
     *                   3. Compare the success hash.
     * @tc.expected      Five unique hashes appear and zero hashes separately.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationCodeFingerprintsUnique', 0, () => {
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      const hashes: string[] = [];
      for (let index = 0; index < codes.length; index++) {
        const hash: number = textFingerprint(String(codes[index]));
        hashes.push(String(hash));
        expect(hash).assertLarger(0);
      }
      expect(hashes.length).assertEqual(5);
      expect(uniqueStrings(hashes).length).assertEqual(5);
      expect(textFingerprint('0') === textFingerprint('16000001')).assertFalse();
      expect(textFingerprint(String(ERROR_SEND))).assertEqual(textFingerprint('16000003'));
      expect(hashes[0]).assertEqual(String(textFingerprint('16000001')));
    });

    /**
     * @tc.name          errorValidationCodeBaseRange
     * @tc.desc          All error codes sit in the 16000001..16000005 window.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Compare each code with the base.
     *                   2. Compare with the upper bound.
     *                   3. Compute offsets.
     * @tc.expected      Every code is inside the inclusive window.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationCodeBaseRange', 0, () => {
      const base: number = 16000000;
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 0; index < codes.length; index++) {
        expect(codes[index]).assertLarger(base);
        expect(codes[index]).assertLess(base + 6);
        expect(codes[index] - base).assertEqual(index + 1);
      }
      expect(ERROR_CONNECT - base).assertEqual(1);
      expect(ERROR_DEATH_REGISTER - base).assertEqual(5);
      expect(base + 3).assertEqual(ERROR_SEND);
      expect(ERROR_PROXY_INVALID).assertLess(base + 5);
    });

    /**
     * @tc.name          errorValidationResetClearsFailedCode
     * @tc.desc          reset() clears the recorded failure code.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Reset.
     *                   3. Read failedCode.
     * @tc.expected      The code returns to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationResetClearsFailedCode', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(2);
      client.onFailed(ERROR_SEND);
      expect(client.failedCode).assertEqual(ERROR_SEND);
      client.reset();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.failedCode).assertEqual(0);
      expect(isNonZeroError(client.failedCode)).assertFalse();
      expect(client.state).assertEqual('disconnected');
      expect(client.logs.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          errorValidationLaterFailureOverrides
     * @tc.desc          A second failure callback replaces the stored code.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. Fail with the connect code.
     *                   2. Fail again with the proxy code.
     *                   3. Read failedCode.
     * @tc.expected      The stored code is the proxy invalid code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationLaterFailureOverrides', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(3);
      client.onFailed(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(16000001);
      client.onFailed(ERROR_PROXY_INVALID);
      expect(client.failedCode).assertEqual(16000004);
      expect(client.failedCode === ERROR_CONNECT).assertFalse();
      expect(client.events.countOf('failed')).assertEqual(2);
      expect(client.events.last()).assertEqual('failed:16000004');
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
      expect(client.state).assertEqual('failed');
    });

    /**
     * @tc.name          errorValidationMetricsFailureCount
     * @tc.desc          Failure events accumulate across connection and send failures.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force one send failure.
     *                   2. Trigger a connection failure.
     *                   3. Count failure-related events.
     * @tc.expected      The two failure kinds are counted separately.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationMetricsFailureCount', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString();
      client.onFailed(ERROR_CONNECT);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.events.size()).assertEqual(5);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.state).assertEqual('failed');
      expect(client.toasts.length).assertEqual(3);
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
    });

    /**
     * @tc.name          errorValidationEventCarriesCodeText
     * @tc.desc          The failure event detail is the decimal code text.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Fail with the disconnect code.
     *                   2. Read the last event.
     *                   3. Compare the detail.
     * @tc.expected      The detail is 16000002.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationEventCarriesCodeText', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(4);
      client.onFailed(ERROR_DISCONNECT);
      expect(client.events.last()).assertEqual('failed:16000002');
      expect(client.events.last().split(':').length).assertEqual(2);
      expect(client.events.last().split(':')[1]).assertEqual(String(ERROR_DISCONNECT));
      expect(client.events.last().length).assertEqual(15);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(client.failedCode).assertEqual(ERROR_DISCONNECT);
    });

    /**
     * @tc.name          errorValidationProxyInvalidVsSendFailToast
     * @tc.desc          The proxy invalid and stub failure cases share one toast literal.
     * @tc.precondition  Two clients exercise the two failure paths.
     * @tc.steps         1. Send without a proxy.
     *                   2. Send through a failing stub.
     *                   3. Compare the last toasts.
     * @tc.expected      Both use the same send failure literal but different codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationProxyInvalidVsSendFailToast', 0, () => {
      const clean: ConnectionModel = new ConnectionModel();
      const connected: ConnectionModel = createConnectedSession();
      if (connected.proxy !== undefined) {
        connected.proxy.failNextSend = ERROR_SEND;
      }
      const first = clean.sendString();
      const second = connected.sendString();
      expect(first.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(second.errCode).assertEqual(ERROR_SEND);
      expect(first.errCode === second.errCode).assertFalse();
      expect(clean.lastToast()).assertEqual(connected.lastToast());
      expect(clean.lastToast().startsWith('sendRequest failed')).assertTrue();
      expect(clean.logs.contains('proxy is invalid')).assertTrue();
      expect(connected.logs.contains('errCode is 16000003')).assertTrue();
    });

    /**
     * @tc.name          errorValidationBaseArithmetic
     * @tc.desc          The code base supports offset arithmetic for all codes.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Add offsets to the base.
     *                   2. Compare with each constant.
     *                   3. Check subtraction round trips.
     * @tc.expected      Every offset maps to its constant and back.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationBaseArithmetic', 0, () => {
      const base: number = 16000000;
      expect(base + 1).assertEqual(ERROR_CONNECT);
      expect(base + 2).assertEqual(ERROR_DISCONNECT);
      expect(base + 3).assertEqual(ERROR_SEND);
      expect(base + 4).assertEqual(ERROR_PROXY_INVALID);
      expect(base + 5).assertEqual(ERROR_DEATH_REGISTER);
      expect(ERROR_DEATH_REGISTER - 4).assertEqual(ERROR_CONNECT);
      expect(ERROR_PROXY_INVALID + 1).assertEqual(ERROR_DEATH_REGISTER);
      expect(ERROR_CONNECT + ERROR_NONE).assertEqual(ERROR_CONNECT);
    });

    /**
     * @tc.name          errorValidationCodeListedInHandledOrder
     * @tc.desc          Mixed success and failure sends preserve request order.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one success and one forced failure.
     *                   2. Read the request log.
     *                   3. Compare the event order.
     * @tc.expected      Both requests are recorded in order while only one succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationCodeListedInHandledOrder', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('first');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('second');
      client.sendString('third');
      expect(client.proxy?.requests.length).assertEqual(3);
      expect(joined(client.proxy === undefined ? [] : [String(client.proxy.requests[0]),
        String(client.proxy.requests[1])], ',')).assertEqual('1,1');
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.size()).assertEqual(6);
      expect(client.events.entries[5].startsWith('send-ok:')).assertTrue();
      expect(client.proxy?.sendCalls).assertEqual(3);
    });

    /**
     * @tc.name          errorValidationFailedResultReplyEmpty
     * @tc.desc          A failed request result has an empty reply sequence.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send without a proxy.
     *                   2. Inspect the reply sequence.
     *                   3. Compare its counters.
     * @tc.expected      The reply has no values and one failed read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationFailedResultReplyEmpty', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const result = client.sendString('lost');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.reply.writeCount).assertEqual(0);
      expect(result.reply.readString()).assertEqual('');
      expect(result.reply.readCount).assertEqual(0);
      expect(result.replyText).assertEqual('');
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
    });

    /**
     * @tc.name          errorValidationStubFailureReplyEmpty
     * @tc.desc          A stub rejection returns a result with no reply text.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force a send failure.
     *                   2. Send.
     *                   3. Inspect the result reply.
     * @tc.expected      The result has no reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationStubFailureReplyEmpty', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      const result = client.sendString('drop');
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(client.events.last()).assertEqual('send-failed:16000003');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          errorValidationDeathRegisterCodeRole
     * @tc.desc          The death register code can travel through the failure channel.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Set the next failure to the death register code.
     *                   2. Send twice.
     *                   3. Compare the codes.
     * @tc.expected      Only the first send fails with the death register code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationDeathRegisterCodeRole', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_DEATH_REGISTER;
      }
      expect(client.sendString('once').errCode).assertEqual(ERROR_DEATH_REGISTER);
      expect(client.sendString('twice').errCode).assertEqual(ERROR_NONE);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.entries[3]).assertEqual('send-failed:16000005');
      expect(client.events.entries[4]).assertEqual('send-ok:hello rpc');
      expect(client.proxy?.failNextSend).assertEqual(ERROR_NONE);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          errorValidationCodeStrictEquality
     * @tc.desc          Error code comparisons are strict numeric comparisons.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Compare the code with itself.
     *                   2. Compare with a string form.
     *                   3. Compare adjacent codes.
     * @tc.expected      Only the numeric comparison holds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationCodeStrictEquality', 0, () => {
      expect(ERROR_SEND === 16000003).assertTrue();
      expect(ERROR_SEND === ERROR_SEND).assertTrue();
      expect(ERROR_SEND === ERROR_PROXY_INVALID).assertFalse();
      expect(ERROR_SEND + 0).assertEqual(ERROR_SEND);
      expect(ERROR_SEND * 1).assertEqual(ERROR_SEND);
      expect(Number(String(ERROR_SEND))).assertEqual(ERROR_SEND);
      expect(String(ERROR_SEND) === '16000003').assertTrue();
      expect(ERROR_NONE === ERROR_NONE).assertTrue();
    });

    /**
     * @tc.name          errorValidationNumericRoundTrip
     * @tc.desc          Converting codes to text and back preserves their value.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Convert each code to text.
     *                   2. Parse it back.
     *                   3. Compare with the constant.
     * @tc.expected      Every round trip returns the original code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationNumericRoundTrip', 0, () => {
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      for (let index = 0; index < codes.length; index++) {
        expect(Number(String(codes[index]))).assertEqual(codes[index]);
        expect(parseInt(String(codes[index]), 10)).assertEqual(codes[index]);
      }
      expect(Number(String(ERROR_NONE))).assertEqual(0);
      expect(Number('16000005')).assertEqual(ERROR_DEATH_REGISTER);
      expect(Number('16000004')).assertEqual(ERROR_PROXY_INVALID);
      expect(Number('16000009')).assertLarger(ERROR_DEATH_REGISTER);
    });

    /**
     * @tc.name          errorValidationConstantsSurviveSession
     * @tc.desc          A failing session does not mutate the exported constants.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Capture the five codes.
     *                   2. Run failure paths.
     *                   3. Recapture the codes.
     * @tc.expected      The constants are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationConstantsSurviveSession', 0, () => {
      const before: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString();
      client.onFailed(ERROR_CONNECT);
      expect(ERROR_CONNECT).assertEqual(before[0]);
      expect(ERROR_DISCONNECT).assertEqual(before[1]);
      expect(ERROR_SEND).assertEqual(before[2]);
      expect(ERROR_PROXY_INVALID).assertEqual(before[3]);
      expect(ERROR_DEATH_REGISTER).assertEqual(before[4]);
      expect(before[0]).assertEqual(16000001);
      expect(before[4]).assertEqual(16000005);
    });

    /**
     * @tc.name          errorValidationTwoClientsIndependentCodes
     * @tc.desc          Failure codes are stored per client.
     * @tc.precondition  Two clients fail with different codes.
     * @tc.steps         1. Fail each client.
     *                   2. Read both codes.
     *                   3. Compare the codes.
     * @tc.expected      Each client keeps its own code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationTwoClientsIndependentCodes', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      first.connect(1);
      second.connect(2);
      first.onFailed(ERROR_CONNECT);
      second.onFailed(ERROR_DEATH_REGISTER);
      expect(first.failedCode).assertEqual(ERROR_CONNECT);
      expect(second.failedCode).assertEqual(ERROR_DEATH_REGISTER);
      expect(first.failedCode === second.failedCode).assertFalse();
      expect(first.events.last()).assertEqual('failed:16000001');
      expect(second.events.last()).assertEqual('failed:16000005');
      expect(first.toasts.length).assertEqual(1);
      expect(second.toasts.length).assertEqual(1);
      expect(uniqueStrings([String(first.failedCode), String(second.failedCode)]).length).assertEqual(2);
    });

    /**
     * @tc.name          errorValidationNoneConstantEquality
     * @tc.desc          The success constant equals every zero representation.
     * @tc.precondition  ERROR_NONE is exported.
     * @tc.steps         1. Compare with literal zero.
     *                   2. Compare with parsed zero.
     *                   3. Compare with the initial failure code.
     * @tc.expected      All zero representations are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('errorValidationNoneConstantEquality', 0, () => {
      const fresh: ConnectionModel = new ConnectionModel();
      expect(ERROR_NONE === 0).assertTrue();
      expect(ERROR_NONE === Number('0')).assertTrue();
      expect(ERROR_NONE === fresh.failedCode).assertTrue();
      expect(parseInt('0', 10)).assertEqual(ERROR_NONE);
      expect(ERROR_NONE === -0).assertTrue();
      expect(ERROR_NONE + 16000001).assertEqual(ERROR_CONNECT);
      expect(ERROR_NONE).assertEqual(fresh.failedCode);
      expect(isNonZeroError(Number('0'))).assertFalse();
    });

    /**
     * @tc.name          errorValidationDisconnectCodeOnFailure
     * @tc.desc          The disconnect code is preserved when used as a failure code.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Fail with the disconnect code.
     *                   2. Reset and fail again.
     *                   3. Compare the stored codes.
     * @tc.expected      Both failures store 16000002.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationDisconnectCodeOnFailure', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(ERROR_DISCONNECT);
      expect(client.failedCode).assertEqual(ERROR_DISCONNECT);
      expect(client.failedCode).assertEqual(16000002);
      client.reset();
      client.connect(2);
      client.onFailed(ERROR_DISCONNECT);
      expect(client.failedCode).assertEqual(ERROR_DISCONNECT);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(isNonZeroError(client.failedCode)).assertTrue();
      expect(client.connectId).assertEqual(2);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          errorValidationConnectCodeNaming
     * @tc.desc          The connect code names the ability connection failure.
     * @tc.precondition  ERROR_CONNECT is exported.
     * @tc.steps         1. Fail with the connect code.
     *                   2. Read the toast.
     *                   3. Compare the log text.
     * @tc.expected      The failure message mentions the connection attempt.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationConnectCodeNaming', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(ERROR_CONNECT);
      expect(client.lastToast()).assertEqual(
        'Connect failed. Please ensure that the service is running in the background.');
      expect(client.lastToast().startsWith('Connect failed')).assertTrue();
      expect(client.logs.trace()).assertEqual('ERROR onFailed code 16000001');
      expect(client.logs.contains('onFailed')).assertTrue();
      expect(client.events.last()).assertEqual('failed:16000001');
      expect(client.state).assertEqual('failed');
      expect(client.failedCode).assertEqual(16000001);
    });

    /**
     * @tc.name          errorValidationFailureOrderAcrossCalls
     * @tc.desc          Failures appear in call order in the event log.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Fail three times with different codes.
     *                   2. Read the event entries.
     *                   3. Compare the order.
     * @tc.expected      The codes appear in the order supplied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationFailureOrderAcrossCalls', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(ERROR_CONNECT);
      client.onFailed(ERROR_DISCONNECT);
      client.onFailed(ERROR_SEND);
      const entries: string[] = client.events.entries;
      expect(entries.length).assertEqual(4);
      expect(entries[1]).assertEqual('failed:16000001');
      expect(entries[2]).assertEqual('failed:16000002');
      expect(entries[3]).assertEqual('failed:16000003');
      expect(countOf(entries, 'failed:16000001')).assertEqual(1);
      expect(entries[3].endsWith('16000003')).assertTrue();
      expect(client.failedCode).assertEqual(ERROR_SEND);
      expect(uniqueStrings(entries).length).assertEqual(4);
    });

    /**
     * @tc.name          errorValidationKilledStubStillSendError
     * @tc.desc          Killing the stub behind a live proxy produces the send error.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Kill the stub only.
     *                   2. Send.
     *                   3. Read the result.
     * @tc.expected      The result is a send error with no received text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationKilledStubStillSendError', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.proxy?.stub.kill();
      const result = client.sendString('after stub death');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(client.proxy?.stub.alive).assertFalse();
      expect(client.proxy?.isAlive()).assertTrue();
      expect(client.proxy?.stub.handledCodes.length).assertEqual(1);
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(client.isConnected()).assertTrue();
      expect(client.events.last()).assertEqual('send-failed:16000003');
    });

    /**
     * @tc.name          errorValidationFailureWithZeroCode
     * @tc.desc          A zero failure code is stored while the state becomes failed.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Fail with the success constant.
     *                   2. Read the state and code.
     *                   3. Check the predicate.
     * @tc.expected      The state is failed while the code equals the success code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationFailureWithZeroCode', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(ERROR_NONE);
      expect(client.state).assertEqual('failed');
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.failedCode).assertEqual(0);
      expect(isNonZeroError(client.failedCode)).assertFalse();
      expect(client.events.last()).assertEqual('failed:0');
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.contains('onFailed code 0')).assertTrue();
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          errorValidationNegativeFailureCodePassthrough
     * @tc.desc          A negative configured failure code is returned verbatim.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Configure a negative failure code.
     *                   2. Send.
     *                   3. Read the code and the reset flag.
     * @tc.expected      The negative code is returned and then cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationNegativeFailureCodePassthrough', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = -9;
      }
      const result = client.sendString();
      expect(result.errCode).assertEqual(-9);
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(client.proxy?.failNextSend).assertEqual(ERROR_NONE);
      expect(client.events.last()).assertEqual('send-failed:-9');
      expect(client.logs.contains('errCode is -9')).assertTrue();
      expect(client.sendString().errCode).assertEqual(ERROR_NONE);
      expect(client.events.countOf('send-failed')).assertEqual(1);
    });

    /**
     * @tc.name          errorValidationZeroConfiguredMeansNoFailure
     * @tc.desc          A zero configured failure leaves the next send successful.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Assign zero to the failure field.
     *                   2. Send.
     *                   3. Read the result.
     * @tc.expected      The send succeeds because zero means no failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationZeroConfiguredMeansNoFailure', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_NONE;
      }
      const result = client.sendString('no failure');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('no failure');
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          errorValidationConsecutiveConfiguredFailures
     * @tc.desc          Two configured failures need two assignments.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Configure and send a failure twice.
     *                   2. Send a success.
     *                   3. Count the outcomes.
     * @tc.expected      The event log holds two failures then one success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationConsecutiveConfiguredFailures', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('first');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('second');
      client.sendString('third');
      expect(client.events.countOf('send-failed')).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.size()).assertEqual(6);
      expect(client.events.entries[3].startsWith('send-failed:')).assertTrue();
      expect(client.events.entries[4].startsWith('send-failed:')).assertTrue();
      expect(client.events.entries[5].startsWith('send-ok:')).assertTrue();
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          errorValidationErrorLogCountTwoFailures
     * @tc.desc          Each failed send writes one error log line.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force two failures.
     *                   2. Count the error log entries.
     *                   3. Compare the trace size.
     * @tc.expected      Two error log lines exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationErrorLogCountTwoFailures', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('one');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_PROXY_INVALID;
      }
      client.sendString('two');
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
      expect(client.logs.countLevel('INFO')).assertEqual(2);
      expect(client.logs.size()).assertEqual(4);
      expect(client.logs.trace()).assertEqual(
        'INFO registerDeathRecipient success|INFO onConnect|' +
        'ERROR sendMessageRequest failed, errCode is 16000003|' +
        'ERROR sendMessageRequest failed, errCode is 16000004');
      expect(client.logs.contains('16000003')).assertTrue();
      expect(client.logs.contains('16000004')).assertTrue();
      expect(client.logs.contains('16000001')).assertFalse();
    });

    /**
     * @tc.name          errorValidationFailureToastCountAlignment
     * @tc.desc          Each failure event has a matching failure toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Run one success and two failures.
     *                   2. Count both signals.
     *                   3. Compare the totals.
     * @tc.expected      Two failure toasts match two failure events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationFailureToastCountAlignment', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('ok');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('bad1');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('bad2');
      const failEvents: number = client.events.countOf('send-failed');
      const failToasts: number = countOf(client.toasts, 'sendRequest failed, please connect to the server first');
      expect(failEvents).assertEqual(2);
      expect(failToasts).assertEqual(2);
      expect(failEvents).assertEqual(failToasts);
      expect(client.toasts.length).assertEqual(4);
      expect(countOf(client.toasts, 'sendRequest success')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.state).assertEqual('connected');
    });

    /**
     * @tc.name          errorValidationFailStateSendProxyInvalid
     * @tc.desc          Sending after a connection failure reports the proxy invalid code.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Send.
     *                   3. Compare the code.
     * @tc.expected      The send code is 16000004, not the connect code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationFailStateSendProxyInvalid', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(ERROR_CONNECT);
      const result = client.sendString('failed-state');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.errCode === ERROR_CONNECT).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.state).assertEqual('failed');
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          errorValidationAdjacentFailureCodes
     * @tc.desc          The proxy invalid and send codes differ by exactly one.
     * @tc.precondition  The two constants are exported.
     * @tc.steps         1. Subtract the codes.
     *                   2. Compare with one.
     *                   3. Check the toast difference.
     * @tc.expected      The difference is one and the toasts differ in text only by context.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationAdjacentFailureCodes', 0, () => {
      expect(ERROR_PROXY_INVALID - ERROR_SEND).assertEqual(1);
      expect(ERROR_PROXY_INVALID).assertLarger(ERROR_SEND);
      expect(ERROR_PROXY_INVALID).assertEqual(16000004);
      expect(ERROR_SEND).assertEqual(16000003);
      expect(String(ERROR_PROXY_INVALID).charAt(7)).assertEqual('4');
      expect(String(ERROR_SEND).charAt(7)).assertEqual('3');
      expect(isNonZeroError(ERROR_PROXY_INVALID) && isNonZeroError(ERROR_SEND)).assertTrue();
      expect(ERROR_PROXY_INVALID + ERROR_SEND).assertLarger(32000000);
    });

    /**
     * @tc.name          errorValidationSuccessPredicateBothFailures
     * @tc.desc          isSuccess is false for both failure codes.
     * @tc.precondition  A connected session and a fresh client exist.
     * @tc.steps         1. Produce a proxy invalid result.
     *                   2. Produce a send failure result.
     *                   3. Compare isSuccess.
     * @tc.expected      Both results fail the success predicate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationSuccessPredicateBothFailures', 0, () => {
      const clean: ConnectionModel = new ConnectionModel();
      const connected: ConnectionModel = createConnectedSession();
      if (connected.proxy !== undefined) {
        connected.proxy.failNextSend = ERROR_SEND;
      }
      const first = clean.sendString();
      const second = connected.sendString();
      expect(first.isSuccess()).assertFalse();
      expect(second.isSuccess()).assertFalse();
      expect(first.isSuccess() || second.isSuccess()).assertFalse();
      expect(first.replyText).assertEqual(second.replyText);
      expect(first.errCode === second.errCode).assertFalse();
      expect(first.reply.size()).assertEqual(0);
      expect(second.reply.size()).assertEqual(0);
      expect(clean.state).assertEqual('disconnected');
      expect(connected.state).assertEqual('connected');
    });

    /**
     * @tc.name          errorValidationFailureConsumedOnce
     * @tc.desc          A configured failure applies to exactly one request.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Configure a failure.
     *                   2. Send twice.
     *                   3. Read both codes.
     * @tc.expected      The first code is the configured one and the second is success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationFailureConsumedOnce', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_DEATH_REGISTER;
      }
      const first = client.sendString('a');
      expect(client.proxy?.failNextSend).assertEqual(ERROR_NONE);
      const second = client.sendString('b');
      expect(first.errCode).assertEqual(ERROR_DEATH_REGISTER);
      expect(second.errCode).assertEqual(ERROR_NONE);
      expect(first.isSuccess()).assertFalse();
      expect(second.isSuccess()).assertTrue();
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('b');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          errorValidationDeathRegisterFailureLogging
     * @tc.desc          A failed death registration logs an error without storing a numeric error code.
     * @tc.precondition  A killed proxy is handed to a connecting client.
     * @tc.steps         1. Connect and deliver the killed proxy.
     *                   2. Read the registration flag.
     *                   3. Read the log and events.
     * @tc.expected      Registration fails without a stored code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationDeathRegisterFailureLogging', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(1);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.proxy?.deathRegistered).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(ERROR_DEATH_REGISTER).assertEqual(16000005);
      expect(client.logs.contains(String(ERROR_DEATH_REGISTER))).assertFalse();
    });

    /**
     * @tc.name          errorValidationCodeSumArithmetic
     * @tc.desc          The five codes sum consistently with their base offsets.
     * @tc.precondition  The error constants are exported.
     * @tc.steps         1. Sum the five codes.
     *                   2. Sum the offsets.
     *                   3. Compare both totals.
     * @tc.expected      The sums agree at base times five plus fifteen.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationCodeSumArithmetic', 0, () => {
      const base: number = 16000000;
      const total: number = ERROR_CONNECT + ERROR_DISCONNECT + ERROR_SEND + ERROR_PROXY_INVALID +
        ERROR_DEATH_REGISTER;
      expect(total).assertEqual(base * 5 + 15);
      expect(total - base * 5).assertEqual(15);
      expect(total / 5).assertEqual(base + 3);
      expect(total % 5).assertEqual(0);
      expect(total).assertLarger(80000000);
      expect(base * 5).assertEqual(80000000);
      expect(total).assertLess(80000016);
    });

    /**
     * @tc.name          errorValidationCodeTextsDifferFromStates
     * @tc.desc          Error code texts never collide with state literals.
     * @tc.precondition  The error and state constants are exported.
     * @tc.steps         1. Collect the code texts.
     *                   2. Collect the state words.
     *                   3. Deduplicate the combined list.
     * @tc.expected      The combined list holds nine unique entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('errorValidationCodeTextsDifferFromStates', 0, () => {
      const codes: string[] = [String(ERROR_CONNECT), String(ERROR_DISCONNECT), String(ERROR_SEND),
        String(ERROR_PROXY_INVALID), String(ERROR_DEATH_REGISTER)];
      const states: string[] = ['disconnected', 'connecting', 'connected', 'failed'];
      const combined: string[] = [];
      for (let index = 0; index < codes.length; index++) {
        combined.push(codes[index]);
      }
      for (let index = 0; index < states.length; index++) {
        combined.push(states[index]);
      }
      expect(combined.length).assertEqual(9);
      expect(uniqueStrings(combined).length).assertEqual(9);
      expect(combined.indexOf(String(ERROR_SEND))).assertLess(5);
      expect(combined.indexOf('failed')).assertEqual(8);
      expect(codes.indexOf('connected')).assertLess(0);
      expect(textFingerprint(String(ERROR_CONNECT)) === textFingerprint('disconnected')).assertFalse();
      expect(states.length + codes.length).assertEqual(9);
    });
    /**
     * @tc.name          errorValidationNoneLogAbsence
     * @tc.desc          Successful sends never log an error code line.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three successful requests.
     *                   2. Read the log trace.
     *                   3. Search for the failure phrase.
     * @tc.expected      The failure phrase never appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('errorValidationNoneLogAbsence', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('a');
      client.sendString('b');
      client.sendString('c');
      expect(client.logs.contains('sendMessageRequest failed')).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.countLevel('INFO')).assertEqual(5);
      expect(client.logs.size()).assertEqual(5);
      expect(client.events.countOf('send-ok')).assertEqual(3);
      expect(client.events.countOf('send-failed')).assertEqual(0);
      expect(client.failedCode).assertEqual(ERROR_NONE);
    });
  });
}
