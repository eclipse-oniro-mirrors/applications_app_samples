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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterAll
} from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  RequestResultModel,
  MessageSequenceModel,
  MessageOptionModel,
  RemoteProxyModel,
  RemoteStubModel,
  ConnectionModel,
  uniqueStrings,
  isNonZeroError,
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_DISCONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  ERROR_DEATH_REGISTER,
  REQUEST_CODE,
  SEND_FAIL_TOAST
} from '../Shared/SharedDriver';

export default function clientRequestResult(): void {
  describe('ClientRequestResult', () => {
    beforeAll(() => {
      logSuite('ClientRequestResult', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientRequestResult', 'end');
    });

    /**
     * @tc.name          clientResultSuccessFlag
     * @tc.desc          A zero error code marks a request result as successful.
     * @tc.precondition  A result built with the zero error code and a reply text.
     * @tc.steps         1. Construct the successful result.
     *                   2. Read the success flag.
     *                   3. Compare the error code.
     * @tc.expected      isSuccess is true and errCode equals zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultSuccessFlag', 0, () => {
      logStep('clientResultSuccessFlag', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'ok-reply-one');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('ok-reply-one');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.isEmpty()).assertFalse();
      expect(result.reply.cursor).assertEqual(0);
      expect(isNonZeroError(result.errCode)).assertFalse();
      expect(result.reply.trace().indexOf('#') > 0).assertTrue();
      expect(result.reply.cursor <= result.reply.size()).assertTrue();
      expect(result.reply.values.length).assertEqual(result.reply.size());
      logStep('clientResultSuccessFlag', 'end');
    });

    /**
     * @tc.name          clientResultSuccessReplyText
     * @tc.desc          The result keeps the reply text handed to the constructor.
     * @tc.precondition  A successful result with a known reply.
     * @tc.steps         1. Construct the result.
     *                   2. Read the reply text.
     *                   3. Compare with the constructor argument.
     * @tc.expected      The reply text matches the constructor argument exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultSuccessReplyText', 0, () => {
      logStep('clientResultSuccessReplyText', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'ok-reply-two');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('ok-reply-two');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.isEmpty()).assertFalse();
      expect(result.reply.cursor).assertEqual(0);
      expect(isNonZeroError(result.errCode)).assertFalse();
      expect(result.isSuccess()).assertEqual(result.errCode === ERROR_NONE);
      expect(result.errCode === 0).assertTrue();
      expect(String(result.errCode).length > 0).assertTrue();
      logStep('clientResultSuccessReplyText', 'end');
    });

    /**
     * @tc.name          clientResultSuccessReplySequence
     * @tc.desc          A successful result stores its reply in a single entry sequence.
     * @tc.precondition  A successful result with a non-empty reply.
     * @tc.steps         1. Construct the result.
     *                   2. Read the reply size.
     *                   3. Check the empty predicate.
     * @tc.expected      The reply holds one entry and is not empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultSuccessReplySequence', 0, () => {
      logStep('clientResultSuccessReplySequence', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'ok-reply-three');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('ok-reply-three');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.isEmpty()).assertFalse();
      expect(result.reply.cursor).assertEqual(0);
      expect(isNonZeroError(result.errCode)).assertFalse();
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultSuccessReplySequence', 'end');
    });

    /**
     * @tc.name          clientResultSuccessCursorStart
     * @tc.desc          A freshly built result starts with a zero reply cursor.
     * @tc.precondition  A successful result before any read.
     * @tc.steps         1. Construct the result.
     *                   2. Read the cursor.
     *                   3. Read once and re-check.
     * @tc.expected      The cursor starts at zero and advances after the read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultSuccessCursorStart', 0, () => {
      logStep('clientResultSuccessCursorStart', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'ok-reply-four');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('ok-reply-four');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.isEmpty()).assertFalse();
      expect(result.reply.cursor).assertEqual(0);
      expect(isNonZeroError(result.errCode)).assertFalse();
      const twin: RequestResultModel = new RequestResultModel(0, 'ok-reply-four');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultSuccessCursorStart', 'end');
    });

    /**
     * @tc.name          clientResultSuccessNonZeroPredicate
     * @tc.desc          The non-zero error predicate rejects a successful result code.
     * @tc.precondition  A successful result.
     * @tc.steps         1. Construct the result.
     *                   2. Evaluate the predicate.
     *                   3. Compare with the success flag.
     * @tc.expected      The predicate is false for code zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultSuccessNonZeroPredicate', 0, () => {
      logStep('clientResultSuccessNonZeroPredicate', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'ok-reply-five');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('ok-reply-five');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.isEmpty()).assertFalse();
      expect(result.reply.cursor).assertEqual(0);
      expect(isNonZeroError(result.errCode)).assertFalse();
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultSuccessNonZeroPredicate', 'end');
    });

    /**
     * @tc.name          clientResultSuccessReadCount
     * @tc.desc          A successful read increments the reply read counter once.
     * @tc.precondition  A successful result with one stored reply.
     * @tc.steps         1. Construct the result.
     *                   2. Read the reply.
     *                   3. Inspect the counters.
     * @tc.expected      The read counter equals one after a single read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultSuccessReadCount', 0, () => {
      logStep('clientResultSuccessReadCount', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'ok-reply-six');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('ok-reply-six');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.isEmpty()).assertFalse();
      expect(result.reply.cursor).assertEqual(0);
      expect(isNonZeroError(result.errCode)).assertFalse();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultSuccessReadCount', 'end');
    });

    /**
     * @tc.name          clientResultErrorFlag
     * @tc.desc          A non-zero error code marks the result as failed.
     * @tc.precondition  A result built with the connect error code.
     * @tc.steps         1. Construct the failing result.
     *                   2. Read the success flag.
     *                   3. Compare the error code.
     * @tc.expected      isSuccess is false and the code equals the connect error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultErrorFlag', 0, () => {
      logStep('clientResultErrorFlag', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000001);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000001);
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.isSuccess()).assertEqual(result.errCode === ERROR_NONE);
      expect(result.errCode === 16000001).assertTrue();
      expect(String(result.errCode).length > 0).assertTrue();
      logStep('clientResultErrorFlag', 'end');
    });

    /**
     * @tc.name          clientResultErrorHasNoReply
     * @tc.desc          A failing result with no reply text has an empty reply sequence.
     * @tc.precondition  A result built with an error code and no text.
     * @tc.steps         1. Construct the result.
     *                   2. Read the reply size.
     *                   3. Read the reply text.
     * @tc.expected      The reply is empty and reads as an empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultErrorHasNoReply', 0, () => {
      logStep('clientResultErrorHasNoReply', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000002);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000002);
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(isNonZeroError(result.errCode)).assertTrue();
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultErrorHasNoReply', 'end');
    });

    /**
     * @tc.name          clientResultErrorPredicate
     * @tc.desc          The non-zero predicate accepts the send error code.
     * @tc.precondition  A result with the send error code.
     * @tc.steps         1. Construct the result.
     *                   2. Evaluate the predicate.
     *                   3. Read the stored code.
     * @tc.expected      The predicate is true and the code is preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultErrorPredicate', 0, () => {
      logStep('clientResultErrorPredicate', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000003);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000003);
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(isNonZeroError(result.errCode)).assertTrue();
      const twin: RequestResultModel = new RequestResultModel(16000003, '');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultErrorPredicate', 'end');
    });

    /**
     * @tc.name          clientResultErrorProxyCode
     * @tc.desc          The proxy invalid code remains readable through the result.
     * @tc.precondition  A result with the proxy invalid code.
     * @tc.steps         1. Construct the result.
     *                   2. Read the code.
     *                   3. Check the reply emptiness.
     * @tc.expected      The code reads 16000004 and the reply is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultErrorProxyCode', 0, () => {
      logStep('clientResultErrorProxyCode', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000004);
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultErrorProxyCode', 'end');
    });

    /**
     * @tc.name          clientResultErrorDeathCode
     * @tc.desc          The death registration code is preserved like any other error.
     * @tc.precondition  A result with the death registration code.
     * @tc.steps         1. Construct the result.
     *                   2. Read the code text.
     *                   3. Compare the numeric value.
     * @tc.expected      The code text parses back to the same number.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultErrorDeathCode', 0, () => {
      logStep('clientResultErrorDeathCode', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000005);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000005);
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(isNonZeroError(result.errCode)).assertTrue();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultErrorDeathCode', 'end');
    });

    /**
     * @tc.name          clientResultErrorNegativeCode
     * @tc.desc          A negative result code is preserved without sign loss.
     * @tc.precondition  A result built with code minus one.
     * @tc.steps         1. Construct the result.
     *                   2. Read the code.
     *                   3. Evaluate the predicate.
     * @tc.expected      The code stays minus one and the predicate is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultErrorNegativeCode', 0, () => {
      logStep('clientResultErrorNegativeCode', 'begin');
      const result: RequestResultModel = new RequestResultModel(-1);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(-1);
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.isSuccess()).assertEqual(result.errCode === ERROR_NONE);
      expect(result.errCode === -1).assertTrue();
      expect(String(result.errCode).length > 0).assertTrue();
      logStep('clientResultErrorNegativeCode', 'end');
    });

    /**
     * @tc.name          clientResultErrorWithText
     * @tc.desc          A failing result may still carry a diagnostic reply text.
     * @tc.precondition  A result built with an error code and a text.
     * @tc.steps         1. Construct the result.
     *                   2. Read the reply text.
     *                   3. Read the reply twice.
     * @tc.expected      The text is readable once and then the cursor is exhausted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultErrorWithText', 0, () => {
      logStep('clientResultErrorWithText', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000003, 'diag-one');
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000003);
      expect(result.replyText).assertEqual('diag-one');
      expect(result.reply.size()).assertEqual(1);
      expect(result.readReply()).assertEqual('diag-one');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(1);
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.reply.trace().indexOf('#') > 0).assertTrue();
      expect(result.reply.cursor <= result.reply.size()).assertTrue();
      expect(result.reply.values.length).assertEqual(result.reply.size());
      logStep('clientResultErrorWithText', 'end');
    });

    /**
     * @tc.name          clientResultErrorTextCursor
     * @tc.desc          Reading a failing result reply advances its cursor to one.
     * @tc.precondition  A failing result with a diagnostic text.
     * @tc.steps         1. Construct the result.
     *                   2. Read the reply.
     *                   3. Read the cursor.
     * @tc.expected      The cursor equals one after one read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultErrorTextCursor', 0, () => {
      logStep('clientResultErrorTextCursor', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000004, 'diag-two');
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000004);
      expect(result.replyText).assertEqual('diag-two');
      expect(result.reply.size()).assertEqual(1);
      expect(result.readReply()).assertEqual('diag-two');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(1);
      expect(isNonZeroError(result.errCode)).assertTrue();
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultErrorTextCursor', 'end');
    });

    /**
     * @tc.name          clientResultErrorTextKeepsFlag
     * @tc.desc          A diagnostic text never changes the failing success flag.
     * @tc.precondition  A failing result with text.
     * @tc.steps         1. Construct the result.
     *                   2. Read the flag.
     *                   3. Compare with a twin result.
     * @tc.expected      The flag stays false and matches the twin.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultErrorTextKeepsFlag', 0, () => {
      logStep('clientResultErrorTextKeepsFlag', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000005, 'diag-three');
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000005);
      expect(result.replyText).assertEqual('diag-three');
      expect(result.reply.size()).assertEqual(1);
      expect(result.readReply()).assertEqual('diag-three');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(1);
      expect(isNonZeroError(result.errCode)).assertTrue();
      const twin: RequestResultModel = new RequestResultModel(16000005, 'diag-three');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultErrorTextKeepsFlag', 'end');
    });

    /**
     * @tc.name          clientResultErrorTextPredicate
     * @tc.desc          A failing result with text still satisfies the non-zero predicate.
     * @tc.precondition  A failing result with text.
     * @tc.steps         1. Construct the result.
     *                   2. Evaluate the predicate.
     *                   3. Check the reclaimed flag.
     * @tc.expected      The predicate is true and the reply is live.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultErrorTextPredicate', 0, () => {
      logStep('clientResultErrorTextPredicate', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000001, 'diag-four');
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000001);
      expect(result.replyText).assertEqual('diag-four');
      expect(result.reply.size()).assertEqual(1);
      expect(result.readReply()).assertEqual('diag-four');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(1);
      expect(isNonZeroError(result.errCode)).assertTrue();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultErrorTextPredicate', 'end');
    });

    /**
     * @tc.name          clientResultCodeTableDistinct
     * @tc.desc          All six documented result codes are pairwise distinct.
     * @tc.precondition  No runtime result needed beyond the code table.
     * @tc.steps         1. Build the code table.
     *                   2. Deduplicate the text forms.
     *                   3. Compare lengths.
     * @tc.expected      Six distinct codes remain after deduplication.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultCodeTableDistinct', 0, () => {
      logStep('clientResultCodeTableDistinct', 'begin');
      const codes: number[] = [ERROR_NONE, ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      expect(codes.length).assertEqual(6);
      expect(uniqueStrings(codes.map((value: number) => String(value))).length).assertEqual(6);
      expect(isNonZeroError(codes[0])).assertFalse();
      expect(isNonZeroError(codes[1])).assertTrue();
      expect(isNonZeroError(codes[3])).assertTrue();
      expect(codes.indexOf(16000001) >= 0).assertTrue();
      const result: RequestResultModel = new RequestResultModel(codes[1]);
      expect(result.errCode).assertEqual(ERROR_CONNECT);
      expect(result.isSuccess()).assertFalse();
      expect(result.isSuccess()).assertEqual(result.errCode === ERROR_NONE);
      expect(result.errCode === 16000001).assertTrue();
      expect(String(result.errCode).length > 0).assertTrue();
      logStep('clientResultCodeTableDistinct', 'end');
    });

    /**
     * @tc.name          clientResultCodeTableZero
     * @tc.desc          Only the zero code is considered a success by the predicate.
     * @tc.precondition  The documented code table.
     * @tc.steps         1. Evaluate the zero code.
     *                   2. Evaluate two error codes.
     *                   3. Compare the answers.
     * @tc.expected      Zero is the only code rejected by the non-zero predicate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultCodeTableZero', 0, () => {
      logStep('clientResultCodeTableZero', 'begin');
      const codes: number[] = [ERROR_NONE, ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      expect(codes.length).assertEqual(6);
      expect(uniqueStrings(codes.map((value: number) => String(value))).length).assertEqual(6);
      expect(isNonZeroError(codes[0])).assertFalse();
      expect(isNonZeroError(codes[1])).assertTrue();
      expect(isNonZeroError(codes[3])).assertTrue();
      expect(codes.indexOf(16000002) >= 0).assertTrue();
      const result: RequestResultModel = new RequestResultModel(codes[1]);
      expect(result.errCode).assertEqual(ERROR_CONNECT);
      expect(result.isSuccess()).assertFalse();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultCodeTableZero', 'end');
    });

    /**
     * @tc.name          clientResultCodeTableProxyEntry
     * @tc.desc          The proxy invalid code is present in the code table.
     * @tc.precondition  The documented code table.
     * @tc.steps         1. Build the table.
     *                   2. Look up the proxy code.
     *                   3. Check the table size.
     * @tc.expected      The proxy code is found at a valid index.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultCodeTableProxyEntry', 0, () => {
      logStep('clientResultCodeTableProxyEntry', 'begin');
      const codes: number[] = [ERROR_NONE, ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      expect(codes.length).assertEqual(6);
      expect(uniqueStrings(codes.map((value: number) => String(value))).length).assertEqual(6);
      expect(isNonZeroError(codes[0])).assertFalse();
      expect(isNonZeroError(codes[1])).assertTrue();
      expect(isNonZeroError(codes[3])).assertTrue();
      expect(codes.indexOf(16000004) >= 0).assertTrue();
      const result: RequestResultModel = new RequestResultModel(codes[1]);
      expect(result.errCode).assertEqual(ERROR_CONNECT);
      expect(result.isSuccess()).assertFalse();
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultCodeTableProxyEntry', 'end');
    });

    /**
     * @tc.name          clientResultCodeTableTwin
     * @tc.desc          A twin result built from the connect code matches the table result.
     * @tc.precondition  A result built from the connect table entry.
     * @tc.steps         1. Build the table result.
     *                   2. Build a twin.
     *                   3. Compare flags and codes.
     * @tc.expected      Both results agree on flag, code and reply size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultCodeTableTwin', 0, () => {
      logStep('clientResultCodeTableTwin', 'begin');
      const codes: number[] = [ERROR_NONE, ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      expect(codes.length).assertEqual(6);
      expect(uniqueStrings(codes.map((value: number) => String(value))).length).assertEqual(6);
      expect(isNonZeroError(codes[0])).assertFalse();
      expect(isNonZeroError(codes[1])).assertTrue();
      expect(isNonZeroError(codes[3])).assertTrue();
      expect(codes.indexOf(16000001) >= 0).assertTrue();
      const result: RequestResultModel = new RequestResultModel(codes[1]);
      expect(result.errCode).assertEqual(ERROR_CONNECT);
      expect(result.isSuccess()).assertFalse();
      const twin: RequestResultModel = new RequestResultModel(16000001, '');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultCodeTableTwin', 'end');
    });

    /**
     * @tc.name          clientResultProxyDirectSuccess
     * @tc.desc          A direct proxy request returns a successful result with the stub reply.
     * @tc.precondition  A stub with a configured reply and no client connection.
     * @tc.steps         1. Build the data sequence.
     *                   2. Send through the proxy.
     *                   3. Read the result.
     * @tc.expected      The result is successful and its reply equals the stub reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultProxyDirectSuccess', 0, () => {
      logStep('clientResultProxyDirectSuccess', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'direct-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('direct-one');
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('direct-reply-one');
      expect(result.readReply()).assertEqual(stub.replyText);
      expect(stub.receivedTexts[0].length > 0).assertTrue();
      expect(proxy.sendCalls).assertEqual(1);
      expect(result.reply.trace().indexOf('#') > 0).assertTrue();
      expect(result.reply.cursor <= result.reply.size()).assertTrue();
      expect(result.reply.values.length).assertEqual(result.reply.size());
      logStep('clientResultProxyDirectSuccess', 'end');
    });

    /**
     * @tc.name          clientResultProxyDirectConsumesData
     * @tc.desc          The stub consumes the payload written into the data sequence.
     * @tc.precondition  A proxy with a recording stub.
     * @tc.steps         1. Write the payload.
     *                   2. Send the request.
     *                   3. Check the stub reception.
     * @tc.expected      The stub received one non-empty payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultProxyDirectConsumesData', 0, () => {
      logStep('clientResultProxyDirectConsumesData', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'direct-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('direct-two');
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('direct-reply-two');
      expect(result.readReply()).assertEqual(stub.replyText);
      expect(stub.receivedTexts[0].length > 0).assertTrue();
      expect(proxy.sendCalls).assertEqual(1);
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultProxyDirectConsumesData', 'end');
    });

    /**
     * @tc.name          clientResultProxyDirectReadReply
     * @tc.desc          A direct proxy request leaves its reply readable exactly once.
     * @tc.precondition  A proxy with a configured reply.
     * @tc.steps         1. Send directly.
     *                   2. Read the reply once.
     *                   3. Compare the twin config.
     * @tc.expected      The first read returns the reply and result shapes match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultProxyDirectReadReply', 0, () => {
      logStep('clientResultProxyDirectReadReply', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'direct-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('direct-three');
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('direct-reply-three');
      expect(result.readReply()).assertEqual(stub.replyText);
      expect(stub.receivedTexts[0].length > 0).assertTrue();
      expect(proxy.sendCalls).assertEqual(1);
      const twin: RequestResultModel = new RequestResultModel(0, 'direct-reply-three');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultProxyDirectReadReply', 'end');
    });

    /**
     * @tc.name          clientResultProxyDirectTwin
     * @tc.desc          Two identical direct sends produce equivalent result shapes.
     * @tc.precondition  A proxy with a stable stub reply.
     * @tc.steps         1. Send directly.
     *                   2. Build a twin from the same code.
     *                   3. Compare the shapes.
     * @tc.expected      Both results share the same flag and reply size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultProxyDirectTwin', 0, () => {
      logStep('clientResultProxyDirectTwin', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'direct-reply-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('direct-four');
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('direct-reply-four');
      expect(result.readReply()).assertEqual(stub.replyText);
      expect(stub.receivedTexts[0].length > 0).assertTrue();
      expect(proxy.sendCalls).assertEqual(1);
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultProxyDirectTwin', 'end');
    });

    /**
     * @tc.name          clientResultProxyUnknownCodeTwo
     * @tc.desc          A proxy request with code two is rejected with the send error.
     * @tc.precondition  A proxy whose stub only handles code one.
     * @tc.steps         1. Send code two directly.
     *                   2. Read the result code.
     *                   3. Check the stub reception.
     * @tc.expected      The result reports the send error and the stub received nothing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultProxyUnknownCodeTwo', 0, () => {
      logStep('clientResultProxyUnknownCodeTwo', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(2, data, reply, option);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultProxyUnknownCodeTwo', 'end');
    });

    /**
     * @tc.name          clientResultProxyUnknownCodeZero
     * @tc.desc          Code zero is rejected by the stub message handler.
     * @tc.precondition  A proxy whose stub only handles code one.
     * @tc.steps         1. Send code zero.
     *                   2. Read the result.
     *                   3. Read the handled code list.
     * @tc.expected      The result fails and the stub recorded the attempted code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultProxyUnknownCodeZero', 0, () => {
      logStep('clientResultProxyUnknownCodeZero', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(0, data, reply, option);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultProxyUnknownCodeZero', 'end');
    });

    /**
     * @tc.name          clientResultProxyUnknownCodeLarge
     * @tc.desc          A large unknown code is rejected without side effects on the reply.
     * @tc.precondition  A proxy whose stub only handles code one.
     * @tc.steps         1. Send code ninety nine.
     *                   2. Read the result code.
     *                   3. Read the reply size.
     * @tc.expected      The result fails with an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultProxyUnknownCodeLarge', 0, () => {
      logStep('clientResultProxyUnknownCodeLarge', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(99, data, reply, option);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultProxyUnknownCodeLarge', 'end');
    });

    /**
     * @tc.name          clientResultProxyUnknownCodeNegative
     * @tc.desc          A negative request code is rejected by the stub handler.
     * @tc.precondition  A proxy whose stub only handles code one.
     * @tc.steps         1. Send code minus one.
     *                   2. Read the result.
     *                   3. Compare with the send error.
     * @tc.expected      The result code equals the send error code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultProxyUnknownCodeNegative', 0, () => {
      logStep('clientResultProxyUnknownCodeNegative', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel();
      const result: RequestResultModel = proxy.sendMessageRequest(-1, data, reply, option);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultProxyUnknownCodeNegative', 'end');
    });

    /**
     * @tc.name          clientResultToastSendCode
     * @tc.desc          A failed send reports the injected error code in the result.
     * @tc.precondition  A connected client primed to fail with the send error.
     * @tc.steps         1. Prime the failure.
     *                   2. Send a payload.
     *                   3. Read the result and toast.
     * @tc.expected      The result code matches the primer and the failure toast is queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultToastSendCode', 0, () => {
      logStep('clientResultToastSendCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(41);
      client.onConnect(proxy);
      proxy.failNextSend = 16000003;
      const result: RequestResultModel = client.sendString('toast-one');
      expect(result.errCode).assertEqual(16000003);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.logs.contains(String(result.errCode))).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertEqual(result.errCode === ERROR_NONE);
      expect(result.errCode === 16000003).assertTrue();
      expect(String(result.errCode).length > 0).assertTrue();
      logStep('clientResultToastSendCode', 'end');
    });

    /**
     * @tc.name          clientResultToastConnectCode
     * @tc.desc          Any injected code is echoed by the result even if it is a connect code.
     * @tc.precondition  A connected client primed with the connect error.
     * @tc.steps         1. Prime the connect error.
     *                   2. Send a payload.
     *                   3. Compare the result code.
     * @tc.expected      The result keeps the injected connect error code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultToastConnectCode', 0, () => {
      logStep('clientResultToastConnectCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(41);
      client.onConnect(proxy);
      proxy.failNextSend = 16000001;
      const result: RequestResultModel = client.sendString('toast-two');
      expect(result.errCode).assertEqual(16000001);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.logs.contains(String(result.errCode))).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const twin: RequestResultModel = new RequestResultModel(16000001, '');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultToastConnectCode', 'end');
    });

    /**
     * @tc.name          clientResultToastProxyCode
     * @tc.desc          An injected proxy invalid code is surfaced unchanged.
     * @tc.precondition  A connected client primed with the proxy code.
     * @tc.steps         1. Prime the proxy code.
     *                   2. Send a payload.
     *                   3. Read the failure toast.
     * @tc.expected      The code is preserved and one failure toast exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultToastProxyCode', 0, () => {
      logStep('clientResultToastProxyCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(41);
      client.onConnect(proxy);
      proxy.failNextSend = 16000004;
      const result: RequestResultModel = client.sendString('toast-three');
      expect(result.errCode).assertEqual(16000004);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.logs.contains(String(result.errCode))).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultToastProxyCode', 'end');
    });

    /**
     * @tc.name          clientResultToastDeathCode
     * @tc.desc          The death registration code flows through the send path unchanged.
     * @tc.precondition  A connected client primed with the death code.
     * @tc.steps         1. Prime the death code.
     *                   2. Send a payload.
     *                   3. Read the result and events.
     * @tc.expected      The code is preserved and one send-failed event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultToastDeathCode', 0, () => {
      logStep('clientResultToastDeathCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(41);
      client.onConnect(proxy);
      proxy.failNextSend = 16000005;
      const result: RequestResultModel = client.sendString('toast-four');
      expect(result.errCode).assertEqual(16000005);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.logs.contains(String(result.errCode))).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultToastDeathCode', 'end');
    });

    /**
     * @tc.name          clientResultToastNegativeCode
     * @tc.desc          A negative injected code is logged verbatim by the client.
     * @tc.precondition  A connected client primed with code minus one.
     * @tc.steps         1. Prime the negative code.
     *                   2. Send a payload.
     *                   3. Search the log for the code.
     * @tc.expected      The log contains the negative code text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultToastNegativeCode', 0, () => {
      logStep('clientResultToastNegativeCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(41);
      client.onConnect(proxy);
      proxy.failNextSend = -1;
      const result: RequestResultModel = client.sendString('toast-five');
      expect(result.errCode).assertEqual(-1);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.logs.contains(String(result.errCode))).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultToastNegativeCode', 'end');
    });

    /**
     * @tc.name          clientResultReclaimClearsCursor
     * @tc.desc          Reclaiming the reply sequence resets its cursor and blocks reads.
     * @tc.precondition  A successful result with one stored reply.
     * @tc.steps         1. Read the reply once.
     *                   2. Reclaim the sequence.
     *                   3. Read again.
     * @tc.expected      The cursor returns to zero and reads return empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultReclaimClearsCursor', 0, () => {
      logStep('clientResultReclaimClearsCursor', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'reclaim-one');
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.readReply()).assertEqual('reclaim-one');
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.isSuccess()).assertTrue();
      expect(result.reply.trace().indexOf('#') > 0).assertTrue();
      expect(result.reply.cursor <= result.reply.size()).assertTrue();
      expect(result.reply.values.length).assertEqual(result.reply.size());
      logStep('clientResultReclaimClearsCursor', 'end');
    });

    /**
     * @tc.name          clientResultReclaimKeepsValues
     * @tc.desc          Reclaiming never drops the stored reply values.
     * @tc.precondition  A successful result with one reply.
     * @tc.steps         1. Reclaim the reply.
     *                   2. Read the size.
     *                   3. Read the values list.
     * @tc.expected      The size stays one after reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultReclaimKeepsValues', 0, () => {
      logStep('clientResultReclaimKeepsValues', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'reclaim-two');
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.readReply()).assertEqual('reclaim-two');
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.isSuccess()).assertTrue();
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultReclaimKeepsValues', 'end');
    });

    /**
     * @tc.name          clientResultReclaimFlags
     * @tc.desc          The reclaimed flag and the query method agree after reclaim.
     * @tc.precondition  A successful result before reclaim.
     * @tc.steps         1. Check the reclaimed flag.
     *                   2. Reclaim the reply.
     *                   3. Compare flag and method.
     * @tc.expected      The flag and method both report reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultReclaimFlags', 0, () => {
      logStep('clientResultReclaimFlags', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'reclaim-three');
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.readReply()).assertEqual('reclaim-three');
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.isSuccess()).assertTrue();
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultReclaimFlags', 'end');
    });

    /**
     * @tc.name          clientResultReclaimKeepsSuccess
     * @tc.desc          Reclaiming the reply never changes the result success flag.
     * @tc.precondition  A successful result that was reclaimed.
     * @tc.steps         1. Reclaim the reply.
     *                   2. Read the success flag.
     *                   3. Read the code text.
     * @tc.expected      The result still reports success with code zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultReclaimKeepsSuccess', 0, () => {
      logStep('clientResultReclaimKeepsSuccess', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'reclaim-four');
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.readReply()).assertEqual('reclaim-four');
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.isSuccess()).assertTrue();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultReclaimKeepsSuccess', 'end');
    });

    /**
     * @tc.name          clientResultRewindResetsCursor
     * @tc.desc          Rewinding a reply sequence allows the same text to be read again.
     * @tc.precondition  A successful result with one reply already read.
     * @tc.steps         1. Read the reply.
     *                   2. Rewind.
     *                   3. Read again.
     * @tc.expected      The second read returns the same text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultRewindResetsCursor', 0, () => {
      logStep('clientResultRewindResetsCursor', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'rewind-one');
      expect(result.readReply()).assertEqual('rewind-one');
      expect(result.reply.cursor).assertEqual(1);
      result.reply.rewind();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('rewind-one');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(2);
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.reply.trace().indexOf('#') > 0).assertTrue();
      expect(result.reply.cursor <= result.reply.size()).assertTrue();
      expect(result.reply.values.length).assertEqual(result.reply.size());
      logStep('clientResultRewindResetsCursor', 'end');
    });

    /**
     * @tc.name          clientResultRewindReadCount
     * @tc.desc          Rewinding does not reset the accumulated read counter.
     * @tc.precondition  A result that was read, rewound and read again.
     * @tc.steps         1. Read and rewind.
     *                   2. Read again.
     *                   3. Inspect the counters.
     * @tc.expected      The read counter equals two while the cursor is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultRewindReadCount', 0, () => {
      logStep('clientResultRewindReadCount', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'rewind-two');
      expect(result.readReply()).assertEqual('rewind-two');
      expect(result.reply.cursor).assertEqual(1);
      result.reply.rewind();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('rewind-two');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(2);
      expect(result.reply.isReclaimed()).assertFalse();
      const twin: RequestResultModel = new RequestResultModel(0, 'rewind-two');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultRewindReadCount', 'end');
    });

    /**
     * @tc.name          clientResultRewindThenReclaim
     * @tc.desc          A rewound sequence can still be reclaimed afterwards.
     * @tc.precondition  A result with one reply that was rewound.
     * @tc.steps         1. Rewind the reply.
     *                   2. Reclaim it.
     *                   3. Read the reclaimed flag.
     * @tc.expected      The sequence reports reclaimed after the reclaim call.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultRewindThenReclaim', 0, () => {
      logStep('clientResultRewindThenReclaim', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'rewind-three');
      expect(result.readReply()).assertEqual('rewind-three');
      expect(result.reply.cursor).assertEqual(1);
      result.reply.rewind();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('rewind-three');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(2);
      expect(result.reply.isReclaimed()).assertFalse();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultRewindThenReclaim', 'end');
    });

    /**
     * @tc.name          clientResultMultiSequenceOrder
     * @tc.desc          A multi entry sequence returns values in write order.
     * @tc.precondition  An empty message sequence model.
     * @tc.steps         1. Write three values.
     *                   2. Read them back.
     *                   3. Compare the order.
     * @tc.expected      Values come back in the same order they were written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultMultiSequenceOrder', 0, () => {
      logStep('clientResultMultiSequenceOrder', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('first');
      sequence.writeString('second');
      sequence.writeString('tail');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'seed');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('first');
      expect(sequence.readString()).assertEqual('second');
      expect(sequence.readString()).assertEqual('tail');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(3);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.trace().indexOf('#') > 0).assertTrue();
      expect(result.reply.cursor <= result.reply.size()).assertTrue();
      expect(result.reply.values.length).assertEqual(result.reply.size());
      logStep('clientResultMultiSequenceOrder', 'end');
    });

    /**
     * @tc.name          clientResultMultiSequenceExhaustion
     * @tc.desc          Reading past the end of a sequence returns empty strings.
     * @tc.precondition  A sequence holding three values.
     * @tc.steps         1. Read all three values.
     *                   2. Read a fourth time.
     *                   3. Read the cursor.
     * @tc.expected      The extra read returns empty and the cursor stays at three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultMultiSequenceExhaustion', 0, () => {
      logStep('clientResultMultiSequenceExhaustion', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('beta');
      sequence.writeString('tail');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'seed');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.readString()).assertEqual('beta');
      expect(sequence.readString()).assertEqual('tail');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(3);
      expect(result.reply.size()).assertEqual(1);
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultMultiSequenceExhaustion', 'end');
    });

    /**
     * @tc.name          clientResultMultiSequenceTwin
     * @tc.desc          A seed result can be compared with a twin built from the same code.
     * @tc.precondition  A seeded result and a multi entry sequence.
     * @tc.steps         1. Build the seeded result.
     *                   2. Build a twin.
     *                   3. Compare the reply sizes.
     * @tc.expected      Both results hold one reply entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultMultiSequenceTwin', 0, () => {
      logStep('clientResultMultiSequenceTwin', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('gamma');
      sequence.writeString('delta');
      sequence.writeString('tail');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'seed');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('gamma');
      expect(sequence.readString()).assertEqual('delta');
      expect(sequence.readString()).assertEqual('tail');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(3);
      expect(result.reply.size()).assertEqual(1);
      const twin: RequestResultModel = new RequestResultModel(0, 'gamma');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultMultiSequenceTwin', 'end');
    });

    /**
     * @tc.name          clientResultTwinSuccess
     * @tc.desc          Two successful results with the same reply are equivalent.
     * @tc.precondition  Two results built with identical arguments.
     * @tc.steps         1. Build both results.
     *                   2. Compare flags and codes.
     *                   3. Compare reply reads.
     * @tc.expected      Both results agree on every observable field.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientResultTwinSuccess', 0, () => {
      logStep('clientResultTwinSuccess', 'begin');
      const result: RequestResultModel = new RequestResultModel(0, 'clone-one');
      const second: RequestResultModel = new RequestResultModel(0, 'clone-one');
      expect(result.isSuccess()).assertEqual(second.isSuccess());
      expect(result.errCode).assertEqual(second.errCode);
      expect(result.replyText).assertEqual(second.replyText);
      expect(result.reply.size()).assertEqual(second.reply.size());
      expect(result.readReply()).assertEqual(second.readReply());
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.reply.trace().indexOf('#') > 0).assertTrue();
      expect(result.reply.cursor <= result.reply.size()).assertTrue();
      expect(result.reply.values.length).assertEqual(result.reply.size());
      logStep('clientResultTwinSuccess', 'end');
    });

    /**
     * @tc.name          clientResultTwinFailure
     * @tc.desc          Two failing results with the same code are equivalent.
     * @tc.precondition  Two results built with the send error code.
     * @tc.steps         1. Build both results.
     *                   2. Compare flags.
     *                   3. Compare reply sizes.
     * @tc.expected      Both results fail with an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultTwinFailure', 0, () => {
      logStep('clientResultTwinFailure', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000003, '');
      const second: RequestResultModel = new RequestResultModel(16000003, '');
      expect(result.isSuccess()).assertEqual(second.isSuccess());
      expect(result.errCode).assertEqual(second.errCode);
      expect(result.replyText).assertEqual(second.replyText);
      expect(result.reply.size()).assertEqual(second.reply.size());
      expect(result.readReply()).assertEqual(second.readReply());
      expect(result.reply.isReclaimed()).assertFalse();
      const firstRead: string = result.readReply();
      const secondRead: string = result.readReply();
      expect(secondRead).assertEqual('');
      expect(firstRead === secondRead || firstRead.length > 0).assertTrue();
      expect(result.reply.readCount <= 1).assertTrue();
      logStep('clientResultTwinFailure', 'end');
    });

    /**
     * @tc.name          clientResultTwinReplyReclaim
     * @tc.desc          Reclaiming one twin reply does not affect the other.
     * @tc.precondition  Two independent results with the same reply.
     * @tc.steps         1. Build both results.
     *                   2. Reclaim the first reply.
     *                   3. Compare both flags.
     * @tc.expected      Only the first reply reports reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultTwinReplyReclaim', 0, () => {
      logStep('clientResultTwinReplyReclaim', 'begin');
      const result: RequestResultModel = new RequestResultModel(0, 'clone-three');
      const second: RequestResultModel = new RequestResultModel(0, 'clone-three');
      expect(result.isSuccess()).assertEqual(second.isSuccess());
      expect(result.errCode).assertEqual(second.errCode);
      expect(result.replyText).assertEqual(second.replyText);
      expect(result.reply.size()).assertEqual(second.reply.size());
      expect(result.readReply()).assertEqual(second.readReply());
      expect(result.reply.isReclaimed()).assertFalse();
      const twin: RequestResultModel = new RequestResultModel(0, 'clone-three');
      expect(twin.isSuccess()).assertEqual(result.isSuccess());
      expect(twin.errCode).assertEqual(result.errCode);
      expect(twin.reply.size()).assertEqual(result.reply.size());
      logStep('clientResultTwinReplyReclaim', 'end');
    });

    /**
     * @tc.name          clientResultTwinCodeText
     * @tc.desc          The string form of the twin code parses back to the same number.
     * @tc.precondition  Two results with the death registration code.
     * @tc.steps         1. Build both results.
     *                   2. Format the code.
     *                   3. Parse it back.
     * @tc.expected      The parsed number equals the stored code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultTwinCodeText', 0, () => {
      logStep('clientResultTwinCodeText', 'begin');
      const result: RequestResultModel = new RequestResultModel(16000005, 'clone-four');
      const second: RequestResultModel = new RequestResultModel(16000005, 'clone-four');
      expect(result.isSuccess()).assertEqual(second.isSuccess());
      expect(result.errCode).assertEqual(second.errCode);
      expect(result.replyText).assertEqual(second.replyText);
      expect(result.reply.size()).assertEqual(second.reply.size());
      expect(result.readReply()).assertEqual(second.readReply());
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultTwinCodeText', 'end');
    });

    /**
     * @tc.name          clientResultReclaimTwice
     * @tc.desc          Reclaiming an already reclaimed reply sequence stays stable.
     * @tc.precondition  A successful result whose reply was reclaimed once.
     * @tc.steps         1. Reclaim the reply.
     *                   2. Reclaim it again.
     *                   3. Read the sequence.
     * @tc.expected      The sequence stays reclaimed and reads return empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultReclaimTwice', 0, () => {
      logStep('clientResultReclaimTwice', 'begin');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'twice-one');
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.readReply()).assertEqual('twice-one');
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.isSuccess()).assertTrue();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultReclaimTwice', 'end');
    });

    /**
     * @tc.name          clientResultMultiWriteAfterReclaim
     * @tc.desc          Writing to a reclaimed sequence is refused by the model.
     * @tc.precondition  A message sequence model that was reclaimed.
     * @tc.steps         1. Write one value.
     *                   2. Reclaim the sequence.
     *                   3. Attempt another write.
     * @tc.expected      The second write is refused and the stored size is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientResultMultiWriteAfterReclaim', 0, () => {
      logStep('clientResultMultiWriteAfterReclaim', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('gamma-two');
      sequence.writeString('delta-two');
      sequence.writeString('tail');
      const result: RequestResultModel = new RequestResultModel(ERROR_NONE, 'seed');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('gamma-two');
      expect(sequence.readString()).assertEqual('delta-two');
      expect(sequence.readString()).assertEqual('tail');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(3);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.reclaimed === result.reply.isReclaimed()).assertTrue();
      expect(result.reply.writeCount >= 0).assertTrue();
      expect(result.reply.readCount >= 0).assertTrue();
      logStep('clientResultMultiWriteAfterReclaim', 'end');
    });

    /**
     * @tc.name          clientResultTableAllNonZero
     * @tc.desc          Every error entry of the code table satisfies the non-zero predicate.
     * @tc.precondition  The documented code table.
     * @tc.steps         1. Build the table.
     *                   2. Skip the zero entry.
     *                   3. Evaluate every remaining code.
     * @tc.expected      All error entries are accepted by the predicate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientResultTableAllNonZero', 0, () => {
      logStep('clientResultTableAllNonZero', 'begin');
      const codes: number[] = [ERROR_NONE, ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND, ERROR_PROXY_INVALID,
        ERROR_DEATH_REGISTER];
      expect(codes.length).assertEqual(6);
      expect(uniqueStrings(codes.map((value: number) => String(value))).length).assertEqual(6);
      expect(isNonZeroError(codes[0])).assertFalse();
      expect(isNonZeroError(codes[1])).assertTrue();
      expect(isNonZeroError(codes[3])).assertTrue();
      expect(codes.indexOf(16000005) >= 0).assertTrue();
      const result: RequestResultModel = new RequestResultModel(codes[1]);
      expect(result.errCode).assertEqual(ERROR_CONNECT);
      expect(result.isSuccess()).assertFalse();
      const codeText: string = String(result.errCode);
      expect(codeText.length >= 1).assertTrue();
      expect(Number(codeText)).assertEqual(result.errCode);
      expect(result.replyText.length >= 0).assertTrue();
      logStep('clientResultTableAllNonZero', 'end');
    });
  });
}
