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
  InProcessClient,
  StubRemoteObjectModel,
  StubMetrics,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint
} from '../Shared/SharedDriver';

export default function stubClientTest(): void {
  describe('StubClientDouble', () => {
    beforeAll(() => {
      logSuite('StubClientDouble', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubClientDouble', 'end');
    });

    /**
     * @tc.name   stubClientStartsEmpty
     * @tc.desc   A new client has no recorded codes, texts, replies or results.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Build the stub and the client.
     *                   2. Read every ledger.
     *                   3. Read the trace.
     * @tc.expected      All client ledgers start empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientStartsEmpty', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(stub.requestCount()).assertEqual(0);
      expect(client.stub).assertEqual(stub);
    });

    /**
     * @tc.name   stubClientWrapsSuppliedStub
     * @tc.desc   The client keeps a reference to the supplied stub.
     * @tc.precondition  A custom stub.
     * @tc.steps         1. Build a custom stub.
     *                   2. Wrap it in a client.
     *                   3. Compare references and descriptors.
     * @tc.expected      The client drives exactly the supplied stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientWrapsSuppliedStub', 0, () => {
      const stub = new StubRemoteObjectModel('client.Desc');
      const client = new InProcessClient(stub);
      expect(client.stub).assertEqual(stub);
      expect(client.stub.descriptor).assertEqual('client.Desc');
      expect(client.stub.alive).assertTrue();
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub === stub).assertTrue();
    });

    /**
     * @tc.name   stubClientDefaultStubCreated
     * @tc.desc   The client constructor supplies a default stub when omitted.
     * @tc.precondition  No stub argument.
     * @tc.steps         1. Build a client with no arguments.
     *                   2. Read the wrapped stub.
     *                   3. Send one request.
     * @tc.expected      The default stub uses the production descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientDefaultStubCreated', 0, () => {
      const client = new InProcessClient();
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.stub.alive).assertTrue();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubClientSendRecordsCode
     * @tc.desc   Each send appends its code to the sent-code ledger.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send codes 1, 2 and 0.
     *                   2. Read the sent-code ledger.
     *                   3. Compare with the expected order.
     * @tc.expected      The ledger holds the codes in send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientSendRecordsCode', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      expect(client.sentCodes.length).assertEqual(3);
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.sentCodes[1]).assertEqual(UNKNOWN_CODE_TWO);
      expect(client.sentCodes[2]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(joined([String(client.sentCodes[0]), String(client.sentCodes[1])], '')).assertEqual('12');
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubClientSendRecordsText
     * @tc.desc   The sent-text ledger records the payload of each send.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send three different payloads.
     *                   2. Read the sent-text ledger.
     *                   3. Compare each entry.
     * @tc.expected      The ledger holds the payloads verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientSendRecordsText', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, 'alpha');
      client.send(REQUEST_CODE, 'beta');
      client.send(REQUEST_CODE, 'gamma');
      expect(client.sentTexts.length).assertEqual(3);
      expect(client.sentTexts[0]).assertEqual('alpha');
      expect(client.sentTexts[1]).assertEqual('beta');
      expect(client.sentTexts[2]).assertEqual('gamma');
      expect(sameStringArray(client.sentTexts, ['alpha', 'beta', 'gamma'])).assertTrue();
      expect(uniqueStrings(client.sentTexts).length).assertEqual(3);
    });

    /**
     * @tc.name   stubClientSendRecordsResult
     * @tc.desc   Every send appends one result object to the ledger.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send one accepted and one rejected code.
     *                   2. Read the results ledger.
     *                   3. Compare the result fields.
     * @tc.expected      The results ledger mirrors the two sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientSendRecordsResult', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const rejected = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(client.results.length).assertEqual(2);
      expect(client.results[0].handled).assertTrue();
      expect(client.results[1].handled).assertFalse();
      expect(client.results[0].errCode).assertEqual(ERROR_NONE);
      expect(client.results[1].errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(accepted).assertEqual(client.results[0]);
      expect(rejected).assertEqual(client.results[1]);
    });

    /**
     * @tc.name   stubClientSendSuccessForCodeOne
     * @tc.desc   A code 1 send returns a successful result.
     * @tc.precondition  A client double with a live stub.
     * @tc.steps         1. Send code 1.
     *                   2. Read the result fields.
     *                   3. Confirm the reply ledger gained one entry.
     * @tc.expected      The result reports success with the reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientSendSuccessForCodeOne', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.results.length).assertEqual(1);
    });

    /**
     * @tc.name   stubClientSendRejectionForUnknown
     * @tc.desc   An unknown code send returns the rejection error code.
     * @tc.precondition  A client double with a live stub.
     * @tc.steps         1. Send code 2.
     *                   2. Read the result fields.
     *                   3. Confirm the reply ledger stayed empty.
     * @tc.expected      The result reports failure without a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubClientSendRejectionForUnknown', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.handled).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(1);
      expect(client.sentCodes.length).assertEqual(1);
    });

    /**
     * @tc.name   stubClientRepliesOnlyWhenHandled
     * @tc.desc   The reply ledger only grows for handled requests.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send one rejected and one accepted code.
     *                   2. Read the reply ledger.
     *                   3. Compare the length with the handled count.
     * @tc.expected      One reply entry exists for two sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientRepliesOnlyWhenHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.replies.length).assertEqual(1);
      expect(client.results.length).assertEqual(2);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name   stubClientAppendsRepliesInOrder
     * @tc.desc   Multiple accepted sends append replies in send order.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Read the reply ledger.
     *                   3. Compare the trace.
     * @tc.expected      The trace has three identical reply segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientAppendsRepliesInOrder', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.replies.length).assertEqual(3);
      expect(client.trace()).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(client.trace().split('|').length).assertEqual(3);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(uniqueStrings(client.replies).length).assertEqual(1);
      expect(client.results.length).assertEqual(3);
    });

    /**
     * @tc.name   stubClientSendManyCountsHandled
     * @tc.desc   sendMany returns the number of handled requests.
     * @tc.precondition  A client double.
     * @tc.steps         1. Call sendMany with four code 1 sends.
     *                   2. Read the returned count.
     *                   3. Compare the ledgers.
     * @tc.expected      The count is four and every send was accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendManyCountsHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(4, REQUEST_CODE);
      expect(handled).assertEqual(4);
      expect(client.sentCodes.length).assertEqual(4);
      expect(client.replies.length).assertEqual(4);
      expect(stub.requestCount()).assertEqual(4);
      expect(StubMetrics.from(stub).handled).assertEqual(4);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
      expect(client.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name   stubClientSendManyUnknownReturnsZero
     * @tc.desc   sendMany of an unknown code reports zero handled.
     * @tc.precondition  A client double.
     * @tc.steps         1. Call sendMany with three unknown-code sends.
     *                   2. Read the returned count.
     *                   3. Compare the ledgers.
     * @tc.expected      The count is zero and no replies were recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendManyUnknownReturnsZero', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(3, UNKNOWN_CODE_TWO);
      expect(handled).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(3);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(StubMetrics.from(stub).rejected).assertEqual(3);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0);
      const codeTexts = client.sentCodes.map((value: number): string => String(value));
      expect(countOf(codeTexts, '2')).assertEqual(3);
    });

    /**
     * @tc.name   stubClientSendManyZeroIterations
     * @tc.desc   sendMany with a zero count performs no sends.
     * @tc.precondition  A client double.
     * @tc.steps         1. Call sendMany with zero.
     *                   2. Read the returned count and ledgers.
     *                   3. Confirm the stub ledger is empty.
     * @tc.expected      Nothing is recorded for a zero-iteration run.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendManyZeroIterations', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(0, REQUEST_CODE);
      expect(handled).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name   stubClientTraceAfterMixedRun
     * @tc.desc   The reply trace skips rejected sends in a mixed run.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send accepted, rejected, accepted.
     *                   2. Read the reply trace.
     *                   3. Split the trace on the separator.
     * @tc.expected      The trace holds two reply segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientTraceAfterMixedRun', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      expect(client.trace().split('|').length).assertEqual(2);
      expect(client.trace().indexOf('|')).assertEqual(9);
      expect(client.trace().length).assertEqual(19);
      expect(client.replies.length).assertEqual(2);
      expect(client.results.length).assertEqual(3);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(2);
    });

    /**
     * @tc.name   stubClientResetClearsLedgers
     * @tc.desc   reset empties every client ledger.
     * @tc.precondition  A client with three processed sends.
     * @tc.steps         1. Send three requests.
     *                   2. Reset the client.
     *                   3. Read every ledger.
     * @tc.expected      All ledgers are empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResetClearsLedgers', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.sentCodes.length).assertEqual(3);
      client.reset();
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name   stubClientResetClearsStubLedger
     * @tc.desc   reset also resets the wrapped stub ledger.
     * @tc.precondition  A client whose stub processed two requests.
     * @tc.steps         1. Send two requests.
     *                   2. Reset the client.
     *                   3. Read the stub ledger and counters.
     * @tc.expected      The stub ledger is empty after the client reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResetClearsStubLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.requestCount()).assertEqual(2);
      client.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(client.stub).assertEqual(stub);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
    });

    /**
     * @tc.name   stubClientResetRestoresReplyText
     * @tc.desc   reset restores the production reply text on the stub.
     * @tc.precondition  A client over a stub with a custom reply.
     * @tc.steps         1. Set a custom reply and send once.
     *                   2. Reset the client.
     *                   3. Send again and compare the reply.
     * @tc.expected      The production reply literal returns after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResetRestoresReplyText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'temporary reply';
      const custom = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(custom.replyText).assertEqual('temporary reply');
      client.reset();
      const restored = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(restored.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.results.length).assertEqual(1);
    });

    /**
     * @tc.name   stubClientSendAfterResetWorks
     * @tc.desc   A reset client can send requests again normally.
     * @tc.precondition  A client that was reset after a mixed run.
     * @tc.steps         1. Run and reset a mixed sequence.
     *                   2. Send a fresh accepted request.
     *                   3. Compare the ledgers with a fresh client.
     * @tc.expected      The reset client behaves like a new client.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendAfterResetWorks', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(2, REQUEST_CODE);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.reset();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.results.length).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(stub.requestCount()).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubClientTwoClientsShareStub
     * @tc.desc   Two clients over one stub share the stub ledger.
     * @tc.precondition  One stub and two clients.
     * @tc.steps         1. Send one request from each client.
     *                   2. Read the stub ledger.
     *                   3. Compare each client ledger.
     * @tc.expected      The stub sees two requests while each client sees one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientTwoClientsShareStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.send(REQUEST_CODE, 'from first');
      second.send(REQUEST_CODE, 'from second');
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('from first');
      expect(stub.requests[1].text).assertEqual('from second');
      expect(first.sentCodes.length).assertEqual(1);
      expect(second.sentCodes.length).assertEqual(1);
      expect(first.stub).assertEqual(second.stub);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
    });

    /**
     * @tc.name   stubClientTwoClientsSeparateLedgers
     * @tc.desc   Two clients keep their own reply ledgers.
     * @tc.precondition  One stub and two clients.
     * @tc.steps         1. Send two requests from the first client.
     *                   2. Send one rejected code from the second.
     *                   3. Compare both traces.
     * @tc.expected      The traces differ while the stub sees three requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientTwoClientsSeparateLedgers', 0, () => {
      const stub = new StubRemoteObjectModel();
      const busy = new InProcessClient(stub);
      const quiet = new InProcessClient(stub);
      busy.sendMany(2, REQUEST_CODE);
      quiet.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(busy.replies.length).assertEqual(2);
      expect(quiet.replies.length).assertEqual(0);
      expect(busy.trace()).assertEqual('hello rpc|hello rpc');
      expect(quiet.trace()).assertEqual('');
      expect(stub.requestCount()).assertEqual(3);
      expect(busy.results.length).assertEqual(2);
      expect(quiet.results.length).assertEqual(1);
    });

    /**
     * @tc.name   stubClientOverKilledStub
     * @tc.desc   A client over a killed stub records rejections only.
     * @tc.precondition  A killed stub wrapped in a client.
     * @tc.steps         1. Kill the stub.
     *                   2. Send two code 1 requests.
     *                   3. Read all ledgers.
     * @tc.expected      Both sends are rejected and no reply is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientOverKilledStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const first = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const second = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.handled).assertFalse();
      expect(second.handled).assertFalse();
      expect(first.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(client.results.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name   stubClientOverRevivedStub
     * @tc.desc   A client resumes success after the stub is revived.
     * @tc.precondition  A killed then revived stub.
     * @tc.steps         1. Kill the stub and send.
     *                   2. Revive the stub and send again.
     *                   3. Compare the two results.
     * @tc.expected      The second send succeeds with the full reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientOverRevivedStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const blocked = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(blocked.handled).assertFalse();
      expect(accepted.handled).assertTrue();
      expect(accepted.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.results.length).assertEqual(2);
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubClientOverCustomReply
     * @tc.desc   The client surfaces a custom stub reply text.
     * @tc.precondition  A stub with a custom reply.
     * @tc.steps         1. Set a custom reply text.
     *                   2. Send two requests.
     *                   3. Compare the replies and trace.
     * @tc.expected      Both replies carry the custom text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientOverCustomReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'custom payload';
      const first = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const second = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.replyText).assertEqual('custom payload');
      expect(second.replyText).assertEqual('custom payload');
      expect(client.trace()).assertEqual('custom payload|custom payload');
      expect(client.replies.length).assertEqual(2);
      expect(uniqueStrings(client.replies).length).assertEqual(1);
      expect(stub.replyText).assertEqual('custom payload');
      expect(first.replyText.length).assertEqual(14);
    });

    /**
     * @tc.name   stubClientWithEmptyPayload
     * @tc.desc   An empty payload is recorded and answered normally.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send code 1 with an empty payload.
     *                   2. Read the result and ledgers.
     *                   3. Send a normal payload afterwards.
     * @tc.expected      The empty payload is handled and both sends succeed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientWithEmptyPayload', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const empty = client.send(REQUEST_CODE, '');
      const normal = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(empty.handled).assertTrue();
      expect(normal.handled).assertTrue();
      expect(client.sentTexts[0]).assertEqual('');
      expect(client.sentTexts[1]).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[1].text).assertEqual(REQUEST_PAYLOAD);
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name   stubClientWithLongPayload
     * @tc.desc   A 100-character payload is recorded whole by the client.
     * @tc.precondition  A client double.
     * @tc.steps         1. Build a 100-character payload.
     *                   2. Send code 1 with it.
     *                   3. Compare the recorded text length.
     * @tc.expected      The client and stub ledgers hold the whole payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientWithLongPayload', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let payload = '';
      for (let index = 0; index < 10; index++) {
        payload = payload + '0123456789';
      }
      const result = client.send(REQUEST_CODE, payload);
      expect(payload.length).assertEqual(100);
      expect(result.handled).assertTrue();
      expect(client.sentTexts[0].length).assertEqual(100);
      expect(stub.requests[0].text.length).assertEqual(100);
      expect(stub.requests[0].text).assertEqual(payload);
      expect(textFingerprint(stub.requests[0].text)).assertEqual(textFingerprint(payload));
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubClientRejectThenAccept
     * @tc.desc   A rejection followed by an acceptance keeps both results.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send an unknown code.
     *                   2. Send code 1.
     *                   3. Compare the result order.
     * @tc.expected      The first result fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientRejectThenAccept', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const rejected = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.results[0].handled).assertFalse();
      expect(client.results[1].handled).assertTrue();
      expect(rejected.isSuccess()).assertFalse();
      expect(accepted.isSuccess()).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(accepted.replyText);
      expect(client.results.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubClientAcceptThenReject
     * @tc.desc   An acceptance followed by a rejection keeps the reply ledger.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send code 1.
     *                   2. Send an unknown code.
     *                   3. Compare the reply ledger with one entry.
     * @tc.expected      The reply ledger is unchanged by the rejection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientAcceptThenReject', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const before = client.trace();
      const rejected = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      expect(accepted.isSuccess()).assertTrue();
      expect(rejected.isSuccess()).assertFalse();
      expect(client.trace()).assertEqual(before);
      expect(client.replies.length).assertEqual(1);
      expect(client.results.length).assertEqual(2);
      expect(client.sentCodes.length).assertEqual(2);
      expect(rejected.replyText).assertEqual('');
    });

    /**
     * @tc.name   stubClientResultsOrderMatchesCodes
     * @tc.desc   Result order follows the order of the sent codes.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send four different codes.
     *                   2. Map results to errCode strings.
     *                   3. Compare with the expected order.
     * @tc.expected      The result flags follow the send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResultsOrderMatchesCodes', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      const flags: string[] = [];
      for (let index = 0; index < client.results.length; index++) {
        flags.push(String(client.results[index].handled));
      }
      expect(joined(flags, ',')).assertEqual('true,false,true,false');
      expect(sameStringArray(flags, ['true', 'false', 'true', 'false'])).assertTrue();
      expect(countOf(flags, 'true')).assertEqual(2);
      expect(client.results.length).assertEqual(4);
      expect(client.replies.length).assertEqual(2);
      expect(client.sentCodes[3]).assertEqual(UNKNOWN_CODE_NEGATIVE);
    });

    /**
     * @tc.name   stubClientReplyTextEqualsStubReplyText
     * @tc.desc   The client reply equals the stub reply text property.
     * @tc.precondition  A client double with a custom reply.
     * @tc.steps         1. Set the stub reply text.
     *                   2. Send once.
     *                   3. Compare result, ledger and stub fields.
     * @tc.expected      All reply sources agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientReplyTextEqualsStubReplyText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'consistent text';
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual(stub.replyText);
      expect(result.replyText).assertEqual(stub.requests[0].replyText);
      expect(result.replyText).assertEqual(client.replies[0]);
      expect(result.replyText.length).assertEqual(stub.replyText.length);
      expect(textFingerprint(result.replyText)).assertEqual(textFingerprint(stub.replyText));
      expect(result.replyText).assertEqual('consistent text');
    });

    /**
     * @tc.name   stubClientPayloadWithSpaces
     * @tc.desc   A spaced payload is recorded and answered unchanged.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send a payload with leading spaces.
     *                   2. Read the recorded texts.
     *                   3. Compare with the trimmed form.
     * @tc.expected      The spacing is preserved in the ledgers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientPayloadWithSpaces', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const payload = '  spaced payload  ';
      const result = client.send(REQUEST_CODE, payload);
      expect(result.handled).assertTrue();
      expect(client.sentTexts[0]).assertEqual(payload);
      expect(stub.requests[0].text).assertEqual(payload);
      expect(stub.requests[0].text.length).assertEqual(18);
      expect(stub.requests[0].text.trim()).assertEqual('spaced payload');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubClientNormalThenEmptyPayload
     * @tc.desc   A normal send followed by an empty payload keeps both texts.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send the production payload.
     *                   2. Send an empty payload.
     *                   3. Compare the sent-text ledger.
     * @tc.expected      Both payloads are preserved in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientNormalThenEmptyPayload', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const second = client.send(REQUEST_CODE, '');
      expect(first.handled).assertTrue();
      expect(second.handled).assertTrue();
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.sentTexts[1]).assertEqual('');
      expect(stub.requests[1].text).assertEqual('');
      expect(client.replies.length).assertEqual(2);
      expect(uniqueStrings(client.replies).length).assertEqual(1);
    });

    /**
     * @tc.name   stubClientSameCodeTwice
     * @tc.desc   Sending the same code twice records two separate entries.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send code 1 twice with the same payload.
     *                   2. Read both result objects.
     *                   3. Compare the ledgers.
     * @tc.expected      Two independent entries share the same values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSameCodeTwice', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const second = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first).assertEqual(client.results[0]);
      expect(second).assertEqual(client.results[1]);
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.sentCodes[0]).assertEqual(client.sentCodes[1]);
      expect(client.sentTexts[0]).assertEqual(client.sentTexts[1]);
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0] === stub.requests[1]).assertFalse();
    });

    /**
     * @tc.name   stubClientDifferentPayloadsTrace
     * @tc.desc   Different payloads do not change the fixed reply trace.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send three different payloads.
     *                   2. Read the reply trace.
     *                   3. Confirm the payloads differ in the ledger.
     * @tc.expected      The replies stay constant while the texts vary.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientDifferentPayloadsTrace', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'one');
      client.send(REQUEST_CODE, 'two');
      client.send(REQUEST_CODE, 'three');
      expect(client.trace()).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(uniqueStrings(client.sentTexts).length).assertEqual(3);
      expect(uniqueStrings(client.replies).length).assertEqual(1);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(stub.requests[0].text).assertEqual('one');
      expect(stub.requests[2].text).assertEqual('three');
      expect(client.results.length).assertEqual(3);
    });

    /**
     * @tc.name   stubClientResultsIsSuccessCount
     * @tc.desc   Counting successful results matches the stub handled count.
     * @tc.precondition  A client with a mixed run of six sends.
     * @tc.steps         1. Send six mixed codes.
     *                   2. Count isSuccess results.
     *                   3. Compare with metrics.
     * @tc.expected      Two successes match two handled stub requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResultsIsSuccessCount', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [1, 2, 1, 0, 99, -1];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      let successes = 0;
      for (let index = 0; index < client.results.length; index++) {
        if (client.results[index].isSuccess()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(2);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(client.results.length).assertEqual(6);
      expect(client.sentCodes.length).assertEqual(6);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
    });

    /**
     * @tc.name   stubClientSentCodesLengthAfterMany
     * @tc.desc   The sent-code ledger grows once per send for a long run.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send twelve requests with sendMany.
     *                   2. Read the sent-code length.
     *                   3. Compare with the stub count.
     * @tc.expected      Twelve codes and twelve stub requests are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSentCodesLengthAfterMany', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(12, REQUEST_CODE);
      expect(handled).assertEqual(12);
      expect(client.sentCodes.length).assertEqual(12);
      expect(client.sentTexts.length).assertEqual(12);
      expect(client.results.length).assertEqual(12);
      expect(stub.requestCount()).assertEqual(12);
      expect(client.results.length).assertEqual(client.sentCodes.length);
      expect(client.trace().split('|').length).assertEqual(12);
    });

    /**
     * @tc.name   stubClientRepliesLengthAfterMixed
     * @tc.desc   The reply ledger length equals the handled count in a mixed run.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send four accepted and two rejected codes.
     *                   2. Compare reply length with metrics.
     *                   3. Confirm the trace segment count.
     * @tc.expected      Four replies match four handled requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientRepliesLengthAfterMixed', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(4, REQUEST_CODE);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(client.replies.length).assertEqual(4);
      expect(client.replies.length).assertEqual(metrics.handled);
      expect(client.trace().split('|').length).assertEqual(4);
      expect(metrics.requests).assertEqual(6);
      expect(metrics.rejected).assertEqual(2);
      expect(client.results.length).assertEqual(6);
      expect(metrics.successRatio()).assertLess(1);
    });

    /**
     * @tc.name   stubClientResetKeepsStubIdentity
     * @tc.desc   Resetting the client does not replace the stub reference.
     * @tc.precondition  A client over a custom stub.
     * @tc.steps         1. Send one request.
     *                   2. Reset the client.
     *                   3. Compare the stub reference and descriptor.
     * @tc.expected      The same stub instance remains wrapped.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResetKeepsStubIdentity', 0, () => {
      const stub = new StubRemoteObjectModel('identity.Desc');
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const before = client.stub;
      client.reset();
      expect(client.stub).assertEqual(before);
      expect(client.stub).assertEqual(stub);
      expect(client.stub.descriptor).assertEqual('identity.Desc');
      expect(client.stub.alive).assertTrue();
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.stub === stub).assertTrue();
    });

    /**
     * @tc.name   stubClientTraceSeparatorCount
     * @tc.desc   The trace separator appears exactly between reply segments.
     * @tc.precondition  A client with three accepted sends.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Count the separator in the trace.
     *                   3. Compare with the reply count.
     * @tc.expected      Two separators join three replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientTraceSeparatorCount', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.sendMany(3, REQUEST_CODE);
      const trace = client.trace();
      let separators = 0;
      for (let index = 0; index < trace.length; index++) {
        if (trace.charAt(index) === '|') {
          separators = separators + 1;
        }
      }
      expect(separators).assertEqual(2);
      expect(trace.split('|').length).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(client.replies.length - 1).assertEqual(separators);
      expect(trace.length).assertEqual(29);
      expect(trace.startsWith('hello rpc')).assertTrue();
    });

    /**
     * @tc.name   stubClientSendZeroCode
     * @tc.desc   A client send of code 0 is rejected and recorded.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send code 0.
     *                   2. Read the result and ledgers.
     *                   3. Confirm the ledger entry.
     * @tc.expected      The zero code is rejected without a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendZeroCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(client.sentCodes[0]).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(stub.requests[0].code).assertEqual(0);
      expect(stub.requests[0].handled).assertFalse();
      expect(client.results.length).assertEqual(1);
    });

    /**
     * @tc.name   stubClientSendNegativeCode
     * @tc.desc   A client send of code -1 is rejected cleanly.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send code -1.
     *                   2. Read the result fields.
     *                   3. Confirm the stub ledger entry.
     * @tc.expected      The negative code is rejected without throwing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendNegativeCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.sentCodes[0]).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(stub.requests[0].code).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(stub.requestCount()).assertEqual(1);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name   stubClientSendLargeCode
     * @tc.desc   A client send of code 99 is rejected and traced as empty.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send code 99.
     *                   2. Compare the result with the oracle.
     *                   3. Read the reply ledger.
     * @tc.expected      The large code is rejected consistently.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendLargeCode', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(client.sentCodes[0]).assertEqual(99);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(result.errCode === ERROR_NONE).assertFalse();
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name   stubClientAllUnknownCodes
     * @tc.desc   Four unknown codes each produce a rejection result.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send the four unknown code constants.
     *                   2. Count the rejected results.
     *                   3. Compare the reply ledger.
     * @tc.expected      All four sends are rejected with no replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientAllUnknownCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      let rejected = 0;
      for (let index = 0; index < client.results.length; index++) {
        if (!client.results[index].handled) {
          rejected = rejected + 1;
        }
      }
      expect(rejected).assertEqual(4);
      expect(client.replies.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(4);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name   stubClientResetThenSendMany
     * @tc.desc   sendMany after a reset behaves like a first run.
     * @tc.precondition  A client that already ran a mixed sequence.
     * @tc.steps         1. Run and reset the client.
     *                   2. Call sendMany with five accepted requests.
     *                   3. Compare the returned count and ledgers.
     * @tc.expected      Five sends are handled with five replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResetThenSendMany', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.reset();
      const handled = client.sendMany(5, REQUEST_CODE);
      expect(handled).assertEqual(5);
      expect(client.sentCodes.length).assertEqual(5);
      expect(client.replies.length).assertEqual(5);
      expect(stub.requestCount()).assertEqual(5);
      expect(StubMetrics.from(stub).handled).assertEqual(5);
      expect(client.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name   stubClientMetricsViaSendingClient
     * @tc.desc   Metrics built after a client run match the client ledgers.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send three accepted and two rejected codes.
     *                   2. Build metrics from the stub.
     *                   3. Compare with the client ledgers.
     * @tc.expected      Metrics, replies and results are consistent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientMetricsViaSendingClient', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(client.replies.length);
      expect(client.results.length).assertEqual(metrics.requests);
      expect(metrics.successRatio()).assertEqual(0.6);
      expect(client.sentCodes.length).assertEqual(5);
    });

    /**
     * @tc.name   stubClientDescriptorFromClient
     * @tc.desc   The wrapped stub exposes the production descriptor to the client.
     * @tc.precondition  A client with a default stub.
     * @tc.steps         1. Read the descriptor through the client.
     *                   2. Send one request.
     *                   3. Re-read the descriptor.
     * @tc.expected      The descriptor matches the production constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientDescriptorFromClient', 0, () => {
      const client = new InProcessClient();
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.stub.descriptor.length).assertEqual(11);
      expect(textFingerprint(client.stub.descriptor)).assertEqual(textFingerprint(STUB_DESCRIPTOR));
      expect(client.stub.requestCount()).assertEqual(1);
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
    });

    /**
     * @tc.name   stubClientManyIterations
     * @tc.desc   Twenty accepted sends keep every ledger in step.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send twenty code 1 requests.
     *                   2. Compare every ledger length.
     *                   3. Read the metrics.
     * @tc.expected      Every ledger holds twenty entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientManyIterations', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(20, REQUEST_CODE);
      expect(handled).assertEqual(20);
      expect(client.sentCodes.length).assertEqual(20);
      expect(client.sentTexts.length).assertEqual(20);
      expect(client.results.length).assertEqual(20);
      expect(client.replies.length).assertEqual(20);
      expect(stub.requestCount()).assertEqual(20);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   stubClientMixedThenResetThenMixed
     * @tc.desc   A reset between two mixed runs isolates the runs.
     * @tc.precondition  A client double.
     * @tc.steps         1. Run one mixed sequence.
     *                   2. Reset and run a second mixed sequence.
     *                   3. Compare the final ledgers with the second run.
     * @tc.expected      Only the second run appears in the ledgers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubClientMixedThenResetThenMixed', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.reset();
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.sentCodes.length).assertEqual(3);
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(2);
      expect(client.sentCodes[0]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
    });

    /**
     * @tc.name   stubClientSendManySingleCount
     * @tc.desc   sendMany of one performs exactly one send.
     * @tc.precondition  A client double.
     * @tc.steps         1. Call sendMany with one.
     *                   2. Read the returned count.
     *                   3. Compare the ledgers.
     * @tc.expected      One handled send appears in every ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendManySingleCount', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(1, REQUEST_CODE);
      expect(handled).assertEqual(1);
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.sentTexts.length).assertEqual(1);
      expect(client.results.length).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubClientRejectOnlyRun
     * @tc.desc   A rejection-only run leaves the reply ledger empty.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send five unknown codes.
     *                   2. Read the reply ledger and trace.
     *                   3. Compare metrics.
     * @tc.expected      No replies exist and all results failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientRejectOnlyRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 5; index++) {
        client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      }
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(client.results.length).assertEqual(5);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(5);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(5);
    });

    /**
     * @tc.name   stubClientRepeatedResetsIdempotent
     * @tc.desc   Three consecutive resets leave the client empty.
     * @tc.precondition  A client with two sends.
     * @tc.steps         1. Send two requests.
     *                   2. Reset the client three times.
     *                   3. Read every ledger.
     * @tc.expected      The client stays empty through all resets.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientRepeatedResetsIdempotent', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(2, REQUEST_CODE);
      client.reset();
      client.reset();
      client.reset();
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(stub.requestCount()).assertEqual(0);
      expect(client.stub).assertEqual(stub);
    });

    /**
     * @tc.name   stubClientSendManyThenUnknown
     * @tc.desc   A rejection after sendMany keeps the accepted replies.
     * @tc.precondition  A client double.
     * @tc.steps         1. Call sendMany with three accepted sends.
     *                   2. Send one unknown code.
     *                   3. Compare the reply ledger.
     * @tc.expected      Three replies remain after the rejection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendManyThenUnknown', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      const before = client.trace();
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(client.trace()).assertEqual(before);
      expect(client.replies.length).assertEqual(3);
      expect(client.sentCodes.length).assertEqual(4);
      expect(client.results.length).assertEqual(4);
      expect(client.sentCodes[3]).assertEqual(UNKNOWN_CODE_LARGE);
      expect(stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name   stubClientSendManyThenAccepted
     * @tc.desc   An accepted send after sendMany appends one reply.
     * @tc.precondition  A client double.
     * @tc.steps         1. Call sendMany with two accepted sends.
     *                   2. Send one more accepted code.
     *                   3. Compare the reply trace.
     * @tc.expected      The trace holds three reply segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSendManyThenAccepted', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(2, REQUEST_CODE);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(client.replies.length).assertEqual(3);
      expect(client.trace().split('|').length).assertEqual(3);
      expect(client.trace()).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(client.sentCodes.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).handled).assertEqual(3);
    });

    /**
     * @tc.name   stubClientRepliesVaryWithStubReply
     * @tc.desc   Changing the stub reply between sends changes later replies.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send with the default reply.
     *                   2. Change the reply text and send again.
     *                   3. Compare the two replies.
     * @tc.expected      The reply ledger keeps both distinct values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubClientRepliesVaryWithStubReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.replyText = 'second reply';
      const second = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual('second reply');
      expect(client.replies.length).assertEqual(2);
      expect(uniqueStrings(client.replies).length).assertEqual(2);
      expect(client.trace()).assertEqual('hello rpc|second reply');
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[1].replyText).assertEqual('second reply');
    });

    /**
     * @tc.name   stubClientResultsShareReplyText
     * @tc.desc   Each successful result carries the reply recorded by the stub.
     * @tc.precondition  A client double after three accepted sends.
     * @tc.steps         1. Send three accepted requests.
     *                   2. Compare each result reply with its record.
     *                   3. Compare with the client reply ledger.
     * @tc.expected      Result replies match records and the ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResultsShareReplyText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      for (let index = 0; index < 3; index++) {
        expect(client.results[index].replyText).assertEqual(stub.requests[index].replyText);
        expect(client.results[index].replyText).assertEqual(client.replies[index]);
      }
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[2].handled).assertTrue();
    });

    /**
     * @tc.name   stubClientSentTextsCountMatchesCodes
     * @tc.desc   The sent-text ledger always matches the sent-code ledger length.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send a mixed batch of six requests.
     *                   2. Compare both ledger lengths.
     *                   3. Re-read the stub count.
     * @tc.expected      All three lengths agree at six.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientSentTextsCountMatchesCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [1, 2, 1, 0, -1, 99];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'payload-' + String(index));
      }
      expect(client.sentCodes.length).assertEqual(6);
      expect(client.sentTexts.length).assertEqual(6);
      expect(client.sentTexts.length).assertEqual(client.sentCodes.length);
      expect(client.sentTexts[5]).assertEqual('payload-5');
      expect(stub.requestCount()).assertEqual(6);
      expect(client.results.length).assertEqual(6);
      expect(stub.requests[5].code).assertEqual(99);
    });

    /**
     * @tc.name   stubClientResultsIsSuccessAfterSendMany
     * @tc.desc   sendMany results all satisfy isSuccess for an accepted batch.
     * @tc.precondition  A client double.
     * @tc.steps         1. Call sendMany with six accepted sends.
     *                   2. Check isSuccess for each result.
     *                   3. Count the successes.
     * @tc.expected      All six results are successful.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientResultsIsSuccessAfterSendMany', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(6, REQUEST_CODE);
      let successes = 0;
      for (let index = 0; index < client.results.length; index++) {
        expect(client.results[index].isSuccess()).assertTrue();
        successes = successes + 1;
      }
      expect(successes).assertEqual(6);
      expect(client.results.length).assertEqual(6);
      expect(StubMetrics.from(stub).rejected).assertEqual(0);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
      expect(client.replies.length).assertEqual(6);
    });

    /**
     * @tc.name   stubClientTraceAfterResetEmpty
     * @tc.desc   The trace is empty immediately after a reset.
     * @tc.precondition  A client with accepted sends.
     * @tc.steps         1. Send two accepted requests.
     *                   2. Reset the client.
     *                   3. Read the trace and ledgers.
     * @tc.expected      The trace is empty and the stub is reusable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientTraceAfterResetEmpty', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(2, REQUEST_CODE);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      client.reset();
      expect(client.trace()).assertEqual('');
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name   stubClientOnlyEmptyPayloads
     * @tc.desc   Five sends with empty payloads are all handled and recorded.
     * @tc.precondition  A client double.
     * @tc.steps         1. Send five code 1 requests with empty payloads.
     *                   2. Compare every ledger length.
     *                   3. Confirm the stub texts are empty.
     * @tc.expected      Five handled sends carry five empty texts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubClientOnlyEmptyPayloads', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 5; index++) {
        expect(client.send(REQUEST_CODE, '').isSuccess()).assertTrue();
      }
      expect(client.sentTexts.length).assertEqual(5);
      expect(countOf(client.sentTexts, '')).assertEqual(5);
      expect(stub.requests[4].text).assertEqual('');
      expect(client.replies.length).assertEqual(5);
      expect(client.trace().split('|').length).assertEqual(5);
      expect(StubMetrics.from(stub).handled).assertEqual(5);
    });
  });
}
