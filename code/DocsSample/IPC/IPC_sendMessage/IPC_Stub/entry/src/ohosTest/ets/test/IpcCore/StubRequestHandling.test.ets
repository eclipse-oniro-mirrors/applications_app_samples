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
  StubRemoteObjectModel,
  InProcessClient,
  StubMetrics,
  StubRequestRecord,
  sameStringArray,
  expectedHandled,
  expectedReplyFor,
  replayCodes,
  countOf,
  uniqueStrings,
  textFingerprint,
  joined
} from '../Shared/SharedDriver';

export default function stubHandlingTest(): void {
  describe('StubRequestHandling', () => {
    beforeAll(() => {
      logSuite('StubRequestHandling', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubRequestHandling', 'end');
    });

    /**
     * @tc.name   stubHandlingCodeOneIsHandled
     * @tc.desc   Code 1 is the only request code the production stub accepts.
     * @tc.precondition  An idle stub and an in-process client exist.
     * @tc.steps         1. Build the stub and the client.
     *                   2. Send code 1 with the production payload.
     *                   3. Read the handled flag from the result.
     * @tc.expected      The request is reported as handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingCodeOneIsHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      logStep('stubHandlingCodeOneIsHandled', 'send code 1');
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const oracle = expectedHandled(REQUEST_CODE);
      expect(result.handled).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(oracle).assertTrue();
      expect(client.sentCodes.length).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingCodeOneWritesProductionReply
     * @tc.desc   The reply sequence carries the literal 'hello rpc'.
     * @tc.precondition  A fresh stub with the default reply text.
     * @tc.steps         1. Send code 1 through the client.
     *                   2. Read the reply text from the result.
     *                   3. Compare against the production literal.
     * @tc.expected      The reply equals REPLY_PAYLOAD.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingCodeOneWritesProductionReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const oracle = expectedReplyFor(REQUEST_CODE);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText).assertEqual('hello rpc');
      expect(oracle).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual('hello rpc');
    });

    /**
     * @tc.name   stubHandlingCodeOneReadsRequestText
     * @tc.desc   The stub reads the first string of the data sequence.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 with 'hello world'.
     *                   2. Inspect the recorded request text.
     *                   3. Inspect the client sent-text ledger.
     * @tc.expected      Both sides observe 'hello world'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingCodeOneReadsRequestText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(record?.text).assertEqual(REQUEST_PAYLOAD);
      expect(record?.text).assertEqual('hello world');
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingCodeOneKeepsStubAlive
     * @tc.desc   Handling a code 1 request does not change the alive flag.
     * @tc.precondition  A stub starts alive.
     * @tc.steps         1. Record the initial alive flag.
     *                   2. Send code 1.
     *                   3. Re-read the alive flag.
     * @tc.expected      The stub stays alive before and after the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingCodeOneKeepsStubAlive', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const before = stub.alive;
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const after = stub.alive;
      expect(before).assertTrue();
      expect(after).assertTrue();
      expect(before).assertEqual(after);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requests.length).assertEqual(1);
      expect(stub.lastRequest()?.handled).assertTrue();
    });

    /**
     * @tc.name   stubHandlingZeroCodeIsRejected
     * @tc.desc   Code 0 falls into the else branch of the production stub.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 0.
     *                   2. Read the handled flag.
     *                   3. Compare with the oracle.
     * @tc.expected      The request is rejected and the oracle agrees.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingZeroCodeIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.isSuccess()).assertFalse();
      expect(record?.handled).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingTwoCodeIsRejected
     * @tc.desc   Code 2 is not handled by the stub.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 2.
     *                   2. Inspect the result error code.
     *                   3. Inspect the request ledger.
     * @tc.expected      The result is a rejection with a ledger entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingTwoCodeIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(record?.code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.requestCount()).assertEqual(1);
      expect(expectedReplyFor(UNKNOWN_CODE_TWO)).assertEqual('');
    });

    /**
     * @tc.name   stubHandlingNegativeCodeIsRejected
     * @tc.desc   A negative request code is rejected without throwing.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code -1.
     *                   2. Read the handled flag and error code.
     *                   3. Confirm the ledger still records one entry.
     * @tc.expected      The negative code is rejected cleanly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingNegativeCodeIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      logStep('stubHandlingNegativeCodeIsRejected', 'code -1');
      const result = client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(record?.code).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(record?.handled).assertFalse();
      expect(stub.requests.length).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingLargeCodeIsRejected
     * @tc.desc   A code far above the known range is still rejected.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 99.
     *                   2. Read the returned boolean.
     *                   3. Compare with the local oracle.
     * @tc.expected      Code 99 returns false on both paths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingLargeCodeIsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const oracle = expectedHandled(UNKNOWN_CODE_LARGE);
      const record = stub.lastRequest();
      expect(result.handled).assertFalse();
      expect(oracle).assertFalse();
      expect(result.handled).assertEqual(oracle);
      expect(record?.code).assertEqual(UNKNOWN_CODE_LARGE);
      expect(record?.handled).assertFalse();
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name   stubHandlingRejectedCodeWritesNoReply
     * @tc.desc   The else branch returns before touching the reply sequence.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 2.
     *                   2. Read the reply sequence through the client.
     *                   3. Inspect the reply ledger of the client.
     * @tc.expected      No reply text is produced for a rejected code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRejectedCodeWritesNoReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(result.replyText).assertEqual('');
      expect(record?.replyText).assertEqual('');
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
    });

    /**
     * @tc.name   stubHandlingRejectedCodeRecordHasEmptyText
     * @tc.desc   A rejected request never consumes the data sequence.
     * @tc.precondition  A stub and a data sequence holding one string.
     * @tc.steps         1. Write 'hello world' into a data sequence.
     *                   2. Invoke the stub with code 2.
     *                   3. Inspect the data cursor and the record text.
     * @tc.expected      The record text is empty and the cursor did not move.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRejectedCodeRecordHasEmptyText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, reply,
        new MessageOptionModel());
      const record = stub.lastRequest();
      expect(handled).assertFalse();
      expect(record?.text).assertEqual('');
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(reply.size()).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingOracleAgreesWithKnownCode
     * @tc.desc   expectedHandled mirrors the stub for the known code.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Compute the oracle for code 1.
     *                   2. Send code 1.
     *                   3. Compare the two booleans.
     * @tc.expected      Both report true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingOracleAgreesWithKnownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const oracle = expectedHandled(REQUEST_CODE);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(oracle).assertTrue();
      expect(result.handled).assertTrue();
      expect(oracle).assertEqual(result.handled);
      expect(REQUEST_CODE).assertEqual(1);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name   stubHandlingOracleRejectsAllOtherCodes
     * @tc.desc   The oracle returns false for every non-1 code.
     * @tc.precondition  The oracle function is available.
     * @tc.steps         1. Evaluate the oracle for 0, 2, -1 and 99.
     *                   2. Count the false results.
     *                   3. Confirm code 1 remains true.
     * @tc.expected      Four false results and one true result.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingOracleRejectsAllOtherCodes', 0, () => {
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      let accepted = 0;
      for (let index = 0; index < codes.length; index++) {
        if (expectedHandled(codes[index])) {
          accepted = accepted + 1;
        }
      }
      expect(accepted).assertEqual(0);
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_LARGE)).assertFalse();
    });

    /**
     * @tc.name   stubHandlingExpectedReplyOracleForCodeOne
     * @tc.desc   expectedReplyFor returns the production literal for code 1.
     * @tc.precondition  The oracle function is available.
     * @tc.steps         1. Call the oracle with code 1.
     *                   2. Compare with REPLY_PAYLOAD.
     *                   3. Compare with the hard-coded literal.
     * @tc.expected      The oracle returns 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingExpectedReplyOracleForCodeOne', 0, () => {
      const oracle = expectedReplyFor(REQUEST_CODE);
      expect(oracle).assertEqual(REPLY_PAYLOAD);
      expect(oracle).assertEqual('hello rpc');
      expect(oracle.length).assertEqual(9);
      expect(oracle.indexOf('rpc')).assertEqual(6);
      expect(oracle.startsWith('hello')).assertTrue();
    });

    /**
     * @tc.name   stubHandlingExpectedReplyOracleForUnknownCodes
     * @tc.desc   expectedReplyFor returns an empty string for unknown codes.
     * @tc.precondition  The oracle function is available.
     * @tc.steps         1. Evaluate the oracle for 0, 2, -1 and 99.
     *                   2. Join the results.
     *                   3. Confirm the joined text is empty.
     * @tc.expected      Every unknown code maps to an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingExpectedReplyOracleForUnknownCodes', 0, () => {
      const replies: string[] = [];
      replies.push(expectedReplyFor(UNKNOWN_CODE_ZERO));
      replies.push(expectedReplyFor(UNKNOWN_CODE_TWO));
      replies.push(expectedReplyFor(UNKNOWN_CODE_NEGATIVE));
      replies.push(expectedReplyFor(UNKNOWN_CODE_LARGE));
      expect(replies.length).assertEqual(4);
      expect(joined(replies, '')).assertEqual('');
      expect(countOf(replies, '')).assertEqual(4);
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
      expect(replies[0]).assertEqual('');
      expect(uniqueStrings(replies).length).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingTwoSequentialCodeOneRequests
     * @tc.desc   Two code 1 requests are both handled independently.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 twice.
     *                   2. Read both results.
     *                   3. Confirm two ledger entries exist.
     * @tc.expected      Both requests succeed with the same reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingTwoSequentialCodeOneRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const second = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.isSuccess()).assertTrue();
      expect(second.isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[1].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubHandlingAlternatingKnownAndUnknownCodes
     * @tc.desc   Mixed codes produce one handled and one rejected entry each round.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 then code 2 twice.
     *                   2. Count the handled entries.
     *                   3. Count the rejected entries.
     * @tc.expected      Two handled and two rejected entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingAlternatingKnownAndUnknownCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(4);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name   stubHandlingRejectListBlocksKnownCode
     * @tc.desc   A code placed on the reject list bypasses the code 1 branch.
     * @tc.precondition  A stub whose reject list contains code 1.
     * @tc.steps         1. Add code 1 to the reject list.
     *                   2. Send code 1.
     *                   3. Inspect the result and the ledger.
     * @tc.expected      The request is rejected even though the code is known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRejectListBlocksKnownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(record?.text).assertEqual('');
      expect(record?.replyText).assertEqual('');
      expect(stub.rejectCodes.length).assertEqual(1);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingRejectListDoesNotAffectOtherStub
     * @tc.desc   The reject list is per stub instance.
     * @tc.precondition  Two stubs, only the first has a reject list.
     * @tc.steps         1. Reject code 1 on the first stub.
     *                   2. Send code 1 to both stubs.
     *                   3. Compare the handled flags.
     * @tc.expected      Only the second stub handles the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRejectListDoesNotAffectOtherStub', 0, () => {
      const blocked = new StubRemoteObjectModel();
      const open = new StubRemoteObjectModel();
      blocked.rejectCodes.push(REQUEST_CODE);
      const blockedResult = new InProcessClient(blocked).send(REQUEST_CODE, REQUEST_PAYLOAD);
      const openResult = new InProcessClient(open).send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(blockedResult.handled).assertFalse();
      expect(openResult.handled).assertTrue();
      expect(openResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(blocked.rejectCodes.length).assertEqual(1);
      expect(open.rejectCodes.length).assertEqual(0);
      expect(openResult.handled).assertEqual(!blockedResult.handled);
    });

    /**
     * @tc.name   stubHandlingKilledStubRejectsCodeOne
     * @tc.desc   A killed stub refuses the known code before reading data.
     * @tc.precondition  A stub that has been killed.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code 1 through the client.
     *                   3. Inspect the ledger entry.
     * @tc.expected      The request is rejected and the alive flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingKilledStubRejectsCodeOne', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(stub.alive).assertFalse();
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(record?.text).assertEqual('');
      expect(record?.handled).assertFalse();
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingRevivedStubHandlesAgain
     * @tc.desc   Reviving a killed stub restores normal code 1 handling.
     * @tc.precondition  A stub that was killed after one request.
     * @tc.steps         1. Send code 1, kill, then revive.
     *                   2. Send code 1 again.
     *                   3. Compare the second result with the first.
     * @tc.expected      The revived stub handles and replies normally.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRevivedStubHandlesAgain', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.kill();
      const blocked = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      const third = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.handled).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(third.handled).assertTrue();
      expect(third.replyText).assertEqual(first.replyText);
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name   stubHandlingResetClearsRequestHistory
     * @tc.desc   reset clears the ledger, restores life and reply text.
     * @tc.precondition  A stub that has processed two requests and was killed.
     * @tc.steps         1. Send two requests.
     *                   2. Kill the stub and reset it.
     *                   3. Inspect ledger, alive flag and reply text.
     * @tc.expected      The stub is back to its initial state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingResetClearsRequestHistory', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.stub.kill();
      client.stub.reset();
      const metrics = StubMetrics.from(client.stub);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.stub.alive).assertTrue();
      expect(client.stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(metrics.requests).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.stub.rejectCodes.length).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingCustomReplyTextIsWritten
     * @tc.desc   The configurable reply text replaces the production literal.
     * @tc.precondition  A stub whose reply text is set before the request.
     * @tc.steps         1. Assign a custom reply text.
     *                   2. Send code 1.
     *                   3. Compare the result and record with the custom text.
     * @tc.expected      The custom text is written to the reply sequence.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingCustomReplyTextIsWritten', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'custom reply';
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      expect(result.replyText).assertEqual('custom reply');
      expect(result.replyText).assertEqual(stub.replyText);
      expect(record?.replyText).assertEqual('custom reply');
      expect(client.trace()).assertEqual('custom reply');
      expect(result.replyText === expectedReplyFor(REQUEST_CODE)).assertFalse();
    });

    /**
     * @tc.name   stubHandlingReplyTextRestoredAfterReset
     * @tc.desc   reset restores the production reply literal.
     * @tc.precondition  A stub with a custom reply that was reset.
     * @tc.steps         1. Set a custom reply and reset the stub.
     *                   2. Send code 1.
     *                   3. Compare the reply with the production literal.
     * @tc.expected      The production literal is used again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplyTextRestoredAfterReset', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.replyText = 'temporary';
      stub.reset();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.replyText).assertEqual(expectedReplyFor(REQUEST_CODE));
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name   stubHandlingMetricsCountHandledRequests
     * @tc.desc   StubMetrics counts only handled requests in the handled field.
     * @tc.precondition  A stub with three accepted requests.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Build metrics from the stub.
     *                   3. Compare each counter.
     * @tc.expected      handled is three and rejected is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingMetricsCountHandledRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(1);
      expect(stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name   stubHandlingMetricsCountRejectedRequests
     * @tc.desc   Unknown codes are counted as rejected by StubMetrics.
     * @tc.precondition  A stub with three unknown-code requests.
     * @tc.steps         1. Send three unknown codes.
     *                   2. Build metrics from the stub.
     *                   3. Compare each counter.
     * @tc.expected      rejected is three and handled is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingMetricsCountRejectedRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, UNKNOWN_CODE_TWO);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingMetricsPartialSuccessRatio
     * @tc.desc   A mixed run of four requests yields a ratio of 0.25.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send one accepted and three rejected codes.
     *                   2. Build metrics from the stub.
     *                   3. Compute the ratio and compare with 0.25.
     * @tc.expected      The ratio equals one quarter.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingMetricsPartialSuccessRatio', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(0.25);
      expect(metrics.successRatio()).assertLess(1);
      expect(metrics.replies).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingDataCursorAdvancesOnRead
     * @tc.desc   Reading the request string advances the data cursor once.
     * @tc.precondition  A stub and a data sequence with one string.
     * @tc.steps         1. Write the payload into a data sequence.
     *                   2. Invoke the request handler directly.
     *                   3. Inspect the cursor and read counter.
     * @tc.expected      The cursor is one and the read counter is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingDataCursorAdvancesOnRead', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(data.writeCount).assertEqual(1);
      expect(data.values[0]).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name   stubHandlingReplyCursorAdvancesOnWrite
     * @tc.desc   Writing the reply increments the write counter of the reply sequence.
     * @tc.precondition  A stub and empty data and reply sequences.
     * @tc.steps         1. Invoke the handler with code 1.
     *                   2. Inspect the reply sequence counters.
     *                   3. Read the reply string back.
     * @tc.expected      One write, one value and a matching reply string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplyCursorAdvancesOnWrite', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.writeCount).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.readCount).assertEqual(0);
      expect(reply.cursor).assertEqual(0);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingResultErrorCodeForRejection
     * @tc.desc   A rejected request surfaces the stub rejection error code.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 99.
     *                   2. Read the error code of the result.
     *                   3. Confirm the success predicate is false.
     * @tc.expected      The error code is ERROR_STUB_REJECTED.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingResultErrorCodeForRejection', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.errCode).assertLarger(ERROR_NONE);
      expect(result.errCode).assertEqual(16000011);
      expect(result.handled).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
    });

    /**
     * @tc.name   stubHandlingResultFlagMirrorsReturnValue
     * @tc.desc   The handled field equals the boolean returned by the stub.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send an accepted and a rejected code.
     *                   2. Read the handled flags.
     *                   3. Compare each with the oracle.
     * @tc.expected      The handled flags match expectedHandled for both codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingResultFlagMirrorsReturnValue', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const rejected = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(accepted.handled).assertEqual(expectedHandled(REQUEST_CODE));
      expect(rejected.handled).assertEqual(expectedHandled(UNKNOWN_CODE_TWO));
      expect(accepted.handled).assertTrue();
      expect(rejected.handled).assertFalse();
      expect(accepted.handled).assertEqual(!rejected.handled);
      expect(client.results.length).assertEqual(2);
    });

    /**
     * @tc.name   stubHandlingOptionDescribeRecorded
     * @tc.desc   The request record captures the option description string.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1.
     *                   2. Read the option field of the record.
     *                   3. Compare with the default option description.
     * @tc.expected      The record shows '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingOptionDescribeRecorded', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      const option = new MessageOptionModel();
      expect(record?.option).assertEqual(option.describe());
      expect(record?.option).assertEqual('0/0/false');
      expect(record?.option.indexOf('/')).assertEqual(1);
      expect(option.isSync()).assertTrue();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingAsyncOptionRecorded
     * @tc.desc   An async option is recorded with its flag and wait time.
     * @tc.precondition  A stub and an explicit async option.
     * @tc.steps         1. Invoke the handler with an async option.
     *                   2. Read the record option text.
     *                   3. Confirm the flag value.
     * @tc.expected      The record contains the async flag and wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingAsyncOptionRecorded', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 50, false);
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      const record = stub.lastRequest();
      expect(handled).assertTrue();
      expect(record?.option).assertEqual('1/50/false');
      expect(option.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(option.waitTime).assertEqual(50);
      expect(option.isSync()).assertFalse();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubHandlingSyncOptionModelDefault
     * @tc.desc   The default MessageOptionModel reports synchronous behaviour.
     * @tc.precondition  No option arguments supplied.
     * @tc.steps         1. Construct the default option.
     *                   2. Read flags, wait time and sync.
     *                   3. Evaluate isSync.
     * @tc.expected      Flags are zero, wait time is zero and isSync is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingSyncOptionModelDefault', 0, () => {
      const option = new MessageOptionModel();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.waitTime).assertEqual(0);
      expect(option.sync).assertFalse();
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.flags).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingRequestCountGrowsPerCall
     * @tc.desc   requestCount tracks the number of handler invocations.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Read the count before any request.
     *                   2. Send five mixed requests.
     *                   3. Re-read the count.
     * @tc.expected      The count grows from zero to five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingRequestCountGrowsPerCall', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const before = stub.requestCount();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(before).assertEqual(0);
      expect(stub.requestCount()).assertEqual(5);
      expect(stub.requests.length).assertEqual(5);
      expect(stub.requestCount()).assertEqual(client.sentCodes.length);
      expect(stub.requestCount()).assertLarger(before);
    });

    /**
     * @tc.name   stubHandlingLastRequestIsMostRecent
     * @tc.desc   lastRequest returns the newest ledger entry.
     * @tc.precondition  A stub with two processed requests.
     * @tc.steps         1. Send code 1 then code 2.
     *                   2. Read the last request.
     *                   3. Compare its code with the second sent code.
     * @tc.expected      The last request corresponds to code 2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingLastRequestIsMostRecent', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const last = stub.lastRequest();
      expect(last?.code).assertEqual(UNKNOWN_CODE_TWO);
      expect(last?.code).assertEqual(client.sentCodes[1]);
      expect(last?.handled).assertFalse();
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(last).assertEqual(stub.requests[1]);
    });

    /**
     * @tc.name   stubHandlingReplayCodesLedgerLength
     * @tc.desc   replayCodes creates one ledger entry per supplied code.
     * @tc.precondition  A stub and a five-element code list.
     * @tc.steps         1. Replay the code list through the helper.
     *                   2. Read the stub ledger length.
     *                   3. Compare with the list length.
     * @tc.expected      The ledger length equals the code list length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplayCodesLedgerLength', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [1, 2, 0, 1, 99];
      const client = replayCodes(stub, codes);
      expect(stub.requestCount()).assertEqual(codes.length);
      expect(stub.requestCount()).assertEqual(5);
      expect(client.sentCodes.length).assertEqual(5);
      expect(client.results.length).assertEqual(5);
      expect(stub.requests.length).assertEqual(5);
    });

    /**
     * @tc.name   stubHandlingReplayCodesHandledCount
     * @tc.desc   Only the code 1 entries of a replay are handled.
     * @tc.precondition  A stub and a mixed code list.
     * @tc.steps         1. Replay six mixed codes.
     *                   2. Count the handled flags in the ledger.
     *                   3. Compare with the number of code 1 entries.
     * @tc.expected      Two handled entries out of six.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplayCodesHandledCount', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [1, 2, 0, 1, 99, -1];
      replayCodes(stub, codes);
      let handled = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (stub.requests[index].handled) {
          handled = handled + 1;
        }
      }
      expect(handled).assertEqual(2);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
      expect(handled).assertLess(codes.length);
      expect(stub.requestCount()).assertEqual(6);
    });

    /**
     * @tc.name   stubHandlingReplayCodesReplyTrace
     * @tc.desc   The client reply trace has one entry per handled code.
     * @tc.precondition  A stub and a code list with two accepted entries.
     * @tc.steps         1. Replay the codes.
     *                   2. Read the client reply trace.
     *                   3. Split the trace and count the entries.
     * @tc.expected      The trace contains two reply literals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplayCodesReplyTrace', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [1, 0, 1, 2];
      const client = replayCodes(stub, codes);
      const trace = client.trace();
      const parts = trace.split('|');
      expect(trace).assertEqual('hello rpc|hello rpc');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(REPLY_PAYLOAD);
      expect(parts[1]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(2);
      expect(client.sentCodes.length).assertEqual(4);
    });

    /**
     * @tc.name   stubHandlingRepeatedCodeOneTraceShape
     * @tc.desc   Three accepted requests produce a three-part reply trace.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Split the reply trace on the separator.
     *                   3. Count the parts.
     * @tc.expected      Three identical reply parts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRepeatedCodeOneTraceShape', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      const parts = client.trace().split('|');
      expect(parts.length).assertEqual(3);
      expect(countOf(parts, REPLY_PAYLOAD)).assertEqual(3);
      expect(uniqueStrings(parts).length).assertEqual(1);
      expect(client.trace().length).assertEqual(29);
      expect(stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name   stubHandlingUnknownCodeAfterKnownCode
     * @tc.desc   A rejection after a success does not disturb earlier replies.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 then code 2.
     *                   2. Read the first ledger entry.
     *                   3. Confirm the reply trace is unchanged.
     * @tc.expected      The accepted entry keeps its reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingUnknownCodeAfterKnownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const before = client.trace();
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].handled).assertTrue();
      expect(client.trace()).assertEqual(before);
      expect(stub.requests[1].replyText).assertEqual('');
      expect(stub.requestCount()).assertEqual(2);
      expect(StubMetrics.from(stub).replies).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingKnownCodeAfterUnknownCode
     * @tc.desc   A success after a rejection still writes the full reply.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 0 then code 1.
     *                   2. Read the second ledger entry.
     *                   3. Confirm the reply ledger has one entry.
     * @tc.expected      The second request is fully handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingKnownCodeAfterUnknownCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const second = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.handled).assertFalse();
      expect(second.handled).assertTrue();
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[1].handled).assertTrue();
      expect(stub.requests[0].handled).assertFalse();
    });

    /**
     * @tc.name   stubHandlingTwoUnknownCodesBothRejected
     * @tc.desc   Two consecutive unknown codes each produce a rejection entry.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 2 then code 99.
     *                   2. Read both results.
     *                   3. Compare the ledger entries.
     * @tc.expected      Both results carry the rejection error code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingTwoUnknownCodesBothRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const second = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(first.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(second.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(first.errCode).assertEqual(second.errCode);
      expect(first.replyText).assertEqual(second.replyText);
      expect(stub.requests[0].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.requests[1].code).assertEqual(UNKNOWN_CODE_LARGE);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingReplyReadMatchesWrittenReply
     * @tc.desc   The reply string read back equals the string written by the stub.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1.
     *                   2. Read the reply through the result.
     *                   3. Compare with the stub reply text property.
     * @tc.expected      The read reply equals the written reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubHandlingReplyReadMatchesWrittenReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual(stub.replyText);
      expect(result.replyText).assertEqual(stub.requests[0].replyText);
      expect(result.replyText).assertEqual(client.replies[0]);
      expect(result.replyText.length).assertEqual(stub.replyText.length);
      expect(textFingerprint(result.replyText)).assertEqual(textFingerprint(stub.replyText));
    });

    /**
     * @tc.name   stubHandlingReplyNotConsumedTwice
     * @tc.desc   A second read on a drained reply sequence returns an empty string.
     * @tc.precondition  A reply sequence holding a single string.
     * @tc.steps         1. Write one reply and read it once.
     *                   2. Read the reply a second time.
     *                   3. Compare the two reads.
     * @tc.expected      The second read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplyNotConsumedTwice', 0, () => {
      const reply = MessageSequenceModel.create();
      reply.writeString(REPLY_PAYLOAD);
      const first = reply.readString();
      const second = reply.readString();
      expect(first).assertEqual(REPLY_PAYLOAD);
      expect(second).assertEqual('');
      expect(first).assertEqual(expectedReplyFor(REQUEST_CODE));
      expect(reply.readCount).assertEqual(1);
      expect(reply.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.trace()).assertEqual('hello rpc#1');
    });

    /**
     * @tc.name   stubHandlingDataSequenceSizeAfterWrite
     * @tc.desc   The data sequence holds exactly one string per client send.
     * @tc.precondition  An empty data sequence.
     * @tc.steps         1. Write the payload once.
     *                   2. Read the size and trace.
     *                   3. Rewind and read the value again.
     * @tc.expected      The size is one and the trace shows the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingDataSequenceSizeAfterWrite', 0, () => {
      const data = MessageSequenceModel.create();
      const written = data.writeString(REQUEST_PAYLOAD);
      expect(written).assertTrue();
      expect(data.size()).assertEqual(1);
      expect(data.trace()).assertEqual('hello world#0');
      expect(data.values[0]).assertEqual(REQUEST_PAYLOAD);
      data.rewind();
      expect(data.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(data.cursor).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingRequestRecordDescribeShape
     * @tc.desc   StubRequestRecord.describe joins code, texts and the flag.
     * @tc.precondition  A stub after one accepted request.
     * @tc.steps         1. Send code 1.
     *                   2. Build the expected description manually.
     *                   3. Compare with describe().
     * @tc.expected      The description matches the manual join.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRequestRecordDescribeShape', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      const manual = String(REQUEST_CODE) + '/' + REQUEST_PAYLOAD + '/' + REPLY_PAYLOAD + '/true';
      expect(record.describe()).assertEqual(manual);
      expect(record.describe()).assertEqual('1/hello world/hello rpc/true');
      expect(record.describe().split('/').length).assertEqual(4);
      expect(record.code).assertEqual(1);
      expect(record.handled).assertTrue();
    });

    /**
     * @tc.name   stubHandlingHandledCountWithCountOf
     * @tc.desc   countOf over the recorded descriptions finds handled markers.
     * @tc.precondition  A stub with a mixed run of four requests.
     * @tc.steps         1. Send two accepted and two rejected codes.
     *                   2. Map records to description strings.
     *                   3. Count the descriptions ending with true.
     * @tc.expected      Two descriptions report a handled request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingHandledCountWithCountOf', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const descriptions: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        descriptions.push(stub.requests[index].describe().split('/')[3]);
      }
      expect(descriptions.length).assertEqual(4);
      expect(countOf(descriptions, 'true')).assertEqual(2);
      expect(countOf(descriptions, 'false')).assertEqual(2);
      expect(joined(descriptions, ',')).assertEqual('true,false,true,false');
      expect(uniqueStrings(descriptions).length).assertEqual(2);
    });

    /**
     * @tc.name   stubHandlingUniqueCodesFromMixedRun
     * @tc.desc   The distinct code set of a mixed run collapses to three values.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send codes 1, 2, 1, 0, 2.
     *                   2. Convert the code ledger to strings.
     *                   3. Deduplicate the list.
     * @tc.expected      Three distinct codes remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingUniqueCodesFromMixedRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [1, 2, 1, 0, 2];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const text: string[] = [];
      for (let index = 0; index < client.sentCodes.length; index++) {
        text.push(String(client.sentCodes[index]));
      }
      const distinct = uniqueStrings(text);
      expect(distinct.length).assertEqual(3);
      expect(distinct.indexOf('1')).assertLarger(-1);
      expect(countOf(text, '1')).assertEqual(2);
      expect(text.length).assertEqual(5);
      expect(sameStringArray(text, ['1', '2', '1', '0', '2'])).assertTrue();
    });

    /**
     * @tc.name   stubHandlingFingerprintStableForFixedRun
     * @tc.desc   The same request run always yields the same metrics fingerprint.
     * @tc.precondition  Two independent stubs.
     * @tc.steps         1. Replay the same codes on both stubs.
     *                   2. Build metrics for both.
     *                   3. Compare the fingerprints.
     * @tc.expected      Both fingerprints are equal and non-negative.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingFingerprintStableForFixedRun', 0, () => {
      const left = new StubRemoteObjectModel();
      const right = new StubRemoteObjectModel();
      const codes: number[] = [1, 2, 1];
      replayCodes(left, codes);
      replayCodes(right, codes);
      const leftMetrics = StubMetrics.from(left);
      const rightMetrics = StubMetrics.from(right);
      expect(leftMetrics.fingerprint()).assertEqual(rightMetrics.fingerprint());
      expect(leftMetrics.fingerprint()).assertLarger(-1);
      expect(leftMetrics.requests).assertEqual(rightMetrics.requests);
      expect(leftMetrics.rejected).assertEqual(rightMetrics.rejected);
      expect(leftMetrics.handled).assertEqual(2);
    });

    /**
     * @tc.name   stubHandlingFingerprintDiffersForDifferentRun
     * @tc.desc   A different request mix changes the metrics fingerprint.
     * @tc.precondition  Two stubs driven with different code lists.
     * @tc.steps         1. Replay two different lists.
     *                   2. Build metrics for both.
     *                   3. Compare fingerprints and counters.
     * @tc.expected      The fingerprints differ while totals stay equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingFingerprintDiffersForDifferentRun', 0, () => {
      const accepted = new StubRemoteObjectModel();
      const rejected = new StubRemoteObjectModel();
      replayCodes(accepted, [1, 1]);
      replayCodes(rejected, [2, 2]);
      const left = StubMetrics.from(accepted);
      const right = StubMetrics.from(rejected);
      expect(left.requests).assertEqual(right.requests);
      expect(left.handled).assertEqual(2);
      expect(right.handled).assertEqual(0);
      expect(left.fingerprint() === right.fingerprint()).assertFalse();
      expect(left.successRatio()).assertEqual(1);
      expect(right.successRatio()).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingZeroRequestPayloadIsAccepted
     * @tc.desc   An empty request string is still a valid code 1 request.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 with an empty payload.
     *                   2. Read the result and the record.
     *                   3. Confirm the reply was still written.
     * @tc.expected      The empty payload is handled and answered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingZeroRequestPayloadIsAccepted', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, '');
      const record = stub.lastRequest();
      expect(result.handled).assertTrue();
      expect(record?.text).assertEqual('');
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.sentTexts[0]).assertEqual('');
      expect(result.replyText).assertEqual('hello rpc');
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingLongPayloadEchoedInLedger
     * @tc.desc   A long request string is read whole and stored verbatim.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Build a 120-character payload.
     *                   2. Send code 1 with that payload.
     *                   3. Compare the recorded text length.
     * @tc.expected      The ledger stores the entire payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingLongPayloadEchoedInLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let payload = '';
      for (let index = 0; index < 12; index++) {
        payload = payload + 'abcdefghij';
      }
      const result = client.send(REQUEST_CODE, payload);
      const record = stub.lastRequest();
      expect(payload.length).assertEqual(120);
      expect(result.handled).assertTrue();
      expect(record?.text.length).assertEqual(120);
      expect(record?.text).assertEqual(payload);
      expect(textFingerprint(record?.text === undefined ? '' : record.text)).assertEqual(textFingerprint(payload));
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubHandlingReplyWrittenOncePerRequest
     * @tc.desc   Each accepted request writes exactly one reply string.
     * @tc.precondition  Two independent reply sequences.
     * @tc.steps         1. Invoke the handler twice with fresh sequences.
     *                   2. Inspect both write counters.
     *                   3. Read the reply of each sequence.
     * @tc.expected      Both sequences hold one reply write each.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplyWrittenOncePerRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      const firstReply = MessageSequenceModel.create();
      const secondReply = MessageSequenceModel.create();
      const firstData = MessageSequenceModel.create();
      const secondData = MessageSequenceModel.create();
      firstData.writeString(REQUEST_PAYLOAD);
      secondData.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, firstData, firstReply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, secondData, secondReply, new MessageOptionModel());
      expect(firstReply.writeCount).assertEqual(1);
      expect(secondReply.writeCount).assertEqual(1);
      expect(firstReply.size()).assertEqual(1);
      expect(secondReply.size()).assertEqual(1);
      expect(firstReply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(secondReply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name   stubHandlingRejectedLeavesReplyUntouched
     * @tc.desc   A rejected code leaves a pre-filled reply sequence unchanged.
     * @tc.precondition  A reply sequence already holding one string.
     * @tc.steps         1. Pre-fill the reply with 'pre'.
     *                   2. Invoke the handler with code 2.
     *                   3. Inspect size, cursor and read counter.
     * @tc.expected      The reply keeps its single pre-filled value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingRejectedLeavesReplyUntouched', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      reply.writeString('pre');
      const handled = stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(reply.size()).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.cursor).assertEqual(0);
      expect(reply.readCount).assertEqual(0);
      expect(reply.values[0]).assertEqual('pre');
    });

    /**
     * @tc.name   stubHandlingRepeatedKillReviveCycle
     * @tc.desc   Two kill and revive cycles alternate rejected and handled requests.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Kill then revive twice with a request after each step.
     *                   2. Collect the handled flags in order.
     *                   3. Compare with the expected alternation.
     * @tc.expected      The flags alternate true, false, true, false, true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubHandlingRepeatedKillReviveCycle', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.kill();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.kill();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      const last = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const flags = new InProcessClient(new StubRemoteObjectModel());
      expect(client.results[0].handled).assertTrue();
      expect(client.results[1].handled).assertFalse();
      expect(client.results[2].handled).assertTrue();
      expect(client.results[3].handled).assertFalse();
      expect(last.handled).assertTrue();
      expect(client.results.length).assertEqual(5);
      expect(flags.sentCodes.length).assertEqual(0);
    });

    /**
     * @tc.name   stubHandlingEmptyMetricsFingerprint
     * @tc.desc   A stub without requests has a deterministic zero metrics state.
     * @tc.precondition  Two untouched stubs.
     * @tc.steps         1. Build metrics for both stubs.
     *                   2. Compare counters and ratio.
     *                   3. Compare fingerprints.
     * @tc.expected      Both empty metrics states are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingEmptyMetricsFingerprint', 0, () => {
      const left = StubMetrics.from(new StubRemoteObjectModel());
      const right = StubMetrics.from(new StubRemoteObjectModel());
      expect(left.requests).assertEqual(0);
      expect(left.handled).assertEqual(0);
      expect(left.rejected).assertEqual(0);
      expect(left.successRatio()).assertEqual(0);
      expect(left.fingerprint()).assertEqual(right.fingerprint());
      expect(left.fingerprint()).assertLarger(-1);
    });

    /**
     * @tc.name   stubHandlingReplayHelperSharesStubInstance
     * @tc.desc   The client built by replayCodes wraps the supplied stub.
     * @tc.precondition  An empty stub.
     * @tc.steps         1. Replay two codes through the helper.
     *                   2. Compare the client stub reference.
     *                   3. Read the stub ledger.
     * @tc.expected      The helper and the caller observe the same stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingReplayHelperSharesStubInstance', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = replayCodes(stub, [REQUEST_CODE, UNKNOWN_CODE_TWO]);
      expect(client.stub).assertEqual(stub);
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requestCount()).assertEqual(2);
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.sentCodes[1]).assertEqual(UNKNOWN_CODE_TWO);
      expect(client.results[0].handled).assertTrue();
      expect(client.results[1].handled).assertFalse();
    });

    /**
     * @tc.name   stubHandlingManualInvocationBypassesClient
     * @tc.desc   The handler can be driven without the client double.
     * @tc.precondition  A stub and two hand-built sequences.
     * @tc.steps         1. Write the payload into a data sequence.
     *                   2. Invoke the handler directly.
     *                   3. Inspect the ledger and the reply.
     * @tc.expected      The direct invocation behaves like a client send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingManualInvocationBypassesClient', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = new MessageOptionModel();
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertTrue();
      expect(handled).assertEqual(expectedHandled(REQUEST_CODE));
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].option).assertEqual(option.describe());
      expect(reply.readString()).assertEqual(expectedReplyFor(REQUEST_CODE));
      expect(data.cursor).assertEqual(1);
    });

    /**
     * @tc.name   stubHandlingArbitraryPayloadAccepted
     * @tc.desc   Any string payload is accepted because the stub does not parse it.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 with punctuation-heavy text.
     *                   2. Read the record text.
     *                   3. Compare with the supplied text.
     * @tc.expected      The payload is stored verbatim and answered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingArbitraryPayloadAccepted', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const payload = 'a|b#c 123 !@#$%';
      const result = client.send(REQUEST_CODE, payload);
      const record = stub.lastRequest();
      expect(result.handled).assertTrue();
      expect(record?.text).assertEqual(payload);
      expect(record?.text.length).assertEqual(15);
      expect(record?.text.indexOf('|')).assertEqual(1);
      expect(record?.text.indexOf('#')).assertEqual(3);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubHandlingDistinctResultObjects
     * @tc.desc   Each send produces an independent RequestResultModel.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 then code 2.
     *                   2. Read both result objects.
     *                   3. Compare their fields pairwise.
     * @tc.expected      The results differ in error code and handled flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingDistinctResultObjects', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const rejected = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(accepted.errCode).assertEqual(ERROR_NONE);
      expect(rejected.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(accepted.handled).assertTrue();
      expect(rejected.handled).assertFalse();
      expect(accepted.replyText.length).assertLarger(rejected.replyText.length);
      expect(client.results[0].errCode).assertEqual(accepted.errCode);
      expect(client.results[1].errCode).assertEqual(rejected.errCode);
    });

    /**
     * @tc.name   stubHandlingWaitTimeRecordedInOption
     * @tc.desc   The wait time of the option reaches the request ledger.
     * @tc.precondition  A stub and an option with a 25 ms wait time.
     * @tc.steps         1. Build a sync option with wait time 25.
     *                   2. Invoke the handler directly.
     *                   3. Inspect the recorded option text.
     * @tc.expected      The record shows the wait time and sync flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubHandlingWaitTimeRecordedInOption', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 25, true);
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      const record = stub.lastRequest();
      expect(handled).assertTrue();
      expect(record?.option).assertEqual('0/25/true');
      expect(record?.option.startsWith('0/25')).assertTrue();
      expect(option.isSync()).assertTrue();
      expect(option.waitTime).assertEqual(25);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
    });
  });
}
