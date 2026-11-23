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
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  ERROR_NONE,
  StubRemoteObjectModel,
  InProcessClient,
  MessageSequenceModel,
  MessageOptionModel,
  StubMetrics,
  expectedReplyFor,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

/**
 * Reply contract of the IPC stub.
 *
 * Production anchor: ServiceExtAbility.ets 33 writes the literal 'hello rpc'
 * into the reply MessageSequence for code 1 and writes nothing for any
 * other code.
 */

function replyClient(): InProcessClient {
  return new InProcessClient(new StubRemoteObjectModel());
}

function sendOnce(): string {
  return replyClient().send(REQUEST_CODE, REQUEST_PAYLOAD).replyText;
}

function charCodes(text: string): number[] {
  const codes: number[] = [];
  for (let index = 0; index < text.length; index++) {
    codes.push(text.charCodeAt(index));
  }
  return codes;
}

function allCharCodesInRange(text: string, low: number, high: number): boolean {
  const codes = charCodes(text);
  for (let index = 0; index < codes.length; index++) {
    if (codes[index] < low || codes[index] > high) {
      return false;
    }
  }
  return true;
}

function manualExchange(code: number, payload: string): MessageSequenceModel {
  const stub = new StubRemoteObjectModel();
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(payload);
  stub.onRemoteMessageRequest(code, data, reply, new MessageOptionModel());
  return reply;
}

export default function replyContractTest(): void {
  describe('ReplyContractTest', () => {
    beforeAll(() => {
      logSuite('ReplyContractTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ReplyContractTest', 'end');
    });

    /**
     * @tc.name          replyContractCodeOneReturnsHelloRpc
     * @tc.desc          A code 1 request returns the production reply literal.
     * @tc.precondition  A fresh stub and client are available.
     * @tc.steps         1. Send code 1 with 'hello world'.
     *                   2. Read result reply text.
     *                   3. Compare against the literal.
     * @tc.expected      The reply is exactly 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('replyContractCodeOneReturnsHelloRpc', 0, () => {
      const client = replyClient();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('replyContractCodeOneReturnsHelloRpc', 'reply=' + result.replyText);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.handled).assertTrue();
      expect(client.replies[0]).assertEqual('hello rpc');
      expect(client.stub.requests[0].replyText).assertEqual('hello rpc');
    });

    /**
     * @tc.name          replyContractLiteralHasNineCharacters
     * @tc.desc          The production reply literal is nine characters long.
     * @tc.precondition  The reply constant is loaded.
     * @tc.steps         1. Send code 1.
     *                   2. Measure reply length.
     *                   3. Compare with 'hello rpc'.
     * @tc.expected      The reply length is 9.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('replyContractLiteralHasNineCharacters', 0, () => {
      const reply = sendOnce();
      expect(reply.length).assertEqual(9);
      expect(reply.length).assertEqual(REPLY_PAYLOAD.length);
      expect(reply.length).assertEqual('hello rpc'.length);
      expect(reply.length).assertLarger(0);
      expect(reply.length).assertLess(16);
      expect(reply.charCodeAt(0)).assertEqual(104);
      expect(reply.charCodeAt(8)).assertEqual(99);
    });

    /**
     * @tc.name          replyContractLiteralStartsWithHello
     * @tc.desc          The reply begins with the five letters of hello.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Send code 1.
     *                   2. Slice the first five characters.
     *                   3. Compare with 'hello'.
     * @tc.expected      The prefix is 'hello'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('replyContractLiteralStartsWithHello', 0, () => {
      const reply = sendOnce();
      expect(reply.substring(0, 5)).assertEqual('hello');
      expect(reply.startsWith('hello')).assertTrue();
      expect(reply.startsWith('Hello')).assertFalse();
      expect(reply.indexOf('hello')).assertEqual(0);
      expect(reply.charAt(0)).assertEqual('h');
      expect(reply.charAt(4)).assertEqual('o');
      expect(reply.charAt(5)).assertEqual(' ');
    });
    /**
     * @tc.name          replyContractReplyIsLowerCaseAscii
     * @tc.desc          Every reply character is a lowercase letter or a space.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Collect character codes of the reply.
     *                   2. Validate the lowercase and space ranges.
     *                   3. Count the spaces.
     * @tc.expected      No uppercase letters or punctuation appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyIsLowerCaseAscii', 0, () => {
      const reply = sendOnce();
      const codes = charCodes(reply);
      expect(codes.length).assertEqual(9);
      let spaces = 0;
      let letters = 0;
      for (let index = 0; index < codes.length; index++) {
        if (codes[index] === 32) {
          spaces = spaces + 1;
        }
        if (codes[index] >= 97 && codes[index] <= 122) {
          letters = letters + 1;
        }
      }
      expect(spaces).assertEqual(1);
      expect(letters).assertEqual(8);
      expect(allCharCodesInRange(reply, 97, 122)).assertFalse();
      expect(allCharCodesInRange('hello', 97, 122)).assertTrue();
      expect(reply.indexOf(' ')).assertEqual(5);
      expect(reply.indexOf(' ')).assertEqual(reply.lastIndexOf(' '));
    });

    /**
     * @tc.name          replyContractReplyEndsWithRpc
     * @tc.desc          The reply suffix is the three letters rpc.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Send code 1.
     *                   2. Slice the trailing characters.
     *                   3. Compare the suffix and index.
     * @tc.expected      The reply ends with 'rpc' at index 6.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('replyContractReplyEndsWithRpc', 0, () => {
      const reply = sendOnce();
      expect(reply.endsWith('rpc')).assertTrue();
      expect(reply.endsWith('RPC')).assertFalse();
      expect(reply.substring(6)).assertEqual('rpc');
      expect(reply.indexOf('rpc')).assertEqual(6);
      expect(reply.charAt(6)).assertEqual('r');
      expect(reply.charAt(7)).assertEqual('p');
      expect(reply.charAt(8)).assertEqual('c');
      expect(reply.length - reply.indexOf('rpc')).assertEqual(3);
    });

    /**
     * @tc.name          replyContractReplyHasSingleSpaceSeparator
     * @tc.desc          The two words of the reply are separated by one space.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Send code 1.
     *                   2. Locate the single space.
     *                   3. Compare both words around it.
     * @tc.expected      The words are 'hello' and 'rpc' with one space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyHasSingleSpaceSeparator', 0, () => {
      const reply = sendOnce();
      const space = reply.indexOf(' ');
      expect(space).assertEqual(5);
      expect(reply.substring(0, space)).assertEqual('hello');
      expect(reply.substring(space + 1)).assertEqual('rpc');
      expect(reply.indexOf('  ')).assertEqual(-1);
      expect(reply.trim()).assertEqual(reply);
      expect(reply.trim().length).assertEqual(reply.length);
      expect(countOf([reply], 'hello rpc')).assertEqual(1);
    });

    /**
     * @tc.name          replyContractReplyFingerprintIsStable
     * @tc.desc          The reply fingerprint is deterministic across exchanges.
     * @tc.precondition  Two independent successful exchanges.
     * @tc.steps         1. Send code 1 twice on separate clients.
     *                   2. Fingerprint both replies.
     *                   3. Compare with the constant fingerprint.
     * @tc.expected      All three fingerprints are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyFingerprintIsStable', 0, () => {
      const first = sendOnce();
      const second = sendOnce();
      const fingerprint = textFingerprint(first);
      expect(fingerprint).assertEqual(textFingerprint(second));
      expect(fingerprint).assertEqual(textFingerprint(REPLY_PAYLOAD));
      expect(fingerprint).assertEqual(textFingerprint('hello rpc'));
      expect(fingerprint).assertLarger(0);
      expect(fingerprint).assertLess(1000003);
      expect(textFingerprint('hello rpC')).assertLarger(0);
      expect(textFingerprint('hello rpC') === fingerprint).assertFalse();
    });

    /**
     * @tc.name          replyContractReplyDiffersFromRequestPayload
     * @tc.desc          The reply is not an echo of the request payload.
     * @tc.precondition  The standard payload and one exchange.
     * @tc.steps         1. Send 'hello world'.
     *                   2. Compare reply and payload.
     *                   3. Compare their lengths and prefixes.
     * @tc.expected      Reply and payload differ in content and length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyDiffersFromRequestPayload', 0, () => {
      const client = replyClient();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText === REQUEST_PAYLOAD).assertFalse();
      expect(result.replyText.length).assertEqual(9);
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(result.replyText.length < REQUEST_PAYLOAD.length).assertTrue();
      expect(result.replyText.startsWith('hello')).assertTrue();
      expect(REQUEST_PAYLOAD.endsWith('world')).assertTrue();
      expect(result.replyText.endsWith('world')).assertFalse();
      expect(client.stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          replyContractReplyIndependentOfRequestText
     * @tc.desc          Different request payloads all produce the same reply.
     * @tc.precondition  A single client is available.
     * @tc.steps         1. Send three distinct payloads with code 1.
     *                   2. Collect the replies.
     *                   3. Count unique reply values.
     * @tc.expected      All replies equal 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyIndependentOfRequestText', 0, () => {
      const client = replyClient();
      const first = client.send(REQUEST_CODE, 'alpha');
      const second = client.send(REQUEST_CODE, '');
      const third = client.send(REQUEST_CODE, 'a much longer request payload value');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(third.replyText).assertEqual(REPLY_PAYLOAD);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(client.stub.requests[0].text).assertEqual('alpha');
      expect(client.stub.requests[1].text).assertEqual('');
      expect(client.stub.requests[2].text.length).assertEqual(35);
    });
    /**
     * @tc.name          replyContractEmptyRequestStillGetsReply
     * @tc.desc          An empty request payload does not suppress the reply.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Send code 1 with an empty string.
     *                   2. Read the reply.
     *                   3. Verify the ledger and result flags.
     * @tc.expected      The reply is still 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractEmptyRequestStillGetsReply', 0, () => {
      const client = replyClient();
      const result = client.send(REQUEST_CODE, '');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText.length).assertEqual(9);
      expect(result.handled).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(client.stub.requests[0].text).assertEqual('');
      expect(client.stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0].length).assertEqual(9);
    });

    /**
     * @tc.name          replyContractLongRequestStillGetsSameReply
     * @tc.desc          A long request payload yields the short production reply.
     * @tc.precondition  A client and a 200-character payload.
     * @tc.steps         1. Build a long payload.
     *                   2. Send it with code 1.
     *                   3. Compare reply with the literal.
     * @tc.expected      The reply remains 'hello rpc' regardless of payload size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractLongRequestStillGetsSameReply', 0, () => {
      let payload = '';
      for (let index = 0; index < 20; index++) {
        payload = payload + '0123456789';
      }
      const client = replyClient();
      const result = client.send(REQUEST_CODE, payload);
      expect(payload.length).assertEqual(200);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText.length * 20).assertLess(payload.length);
      expect(client.stub.requests[0].text.length).assertEqual(200);
      expect(client.stub.requests[0].replyText.length).assertEqual(9);
      expect(client.replies[0]).assertEqual('hello rpc');
      expect(result.isSuccess()).assertTrue();
      expect(client.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          replyContractReplyWrittenExactlyOnce
     * @tc.desc          The stub performs a single write per handled request.
     * @tc.precondition  A manual data and reply sequence pair.
     * @tc.steps         1. Write one payload into data.
     *                   2. Invoke the stub once with code 1.
     *                   3. Check reply write count and values.
     * @tc.expected      The reply sequence records exactly one write.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyWrittenExactlyOnce', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.writeCount).assertEqual(1);
      expect(reply.values.length).assertEqual(1);
      expect(reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(reply.values[0]).assertEqual('hello rpc');
      expect(reply.size()).assertEqual(1);
      expect(reply.reclaimed).assertFalse();
      expect(reply.trace()).assertEqual('hello rpc#0');
      expect(data.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          replyContractReplySequenceSizeOne
     * @tc.desc          A handled exchange leaves exactly one reply element buffered.
     * @tc.precondition  A manual exchange for code 1.
     * @tc.steps         1. Perform the exchange.
     *                   2. Read the sequence size.
     *                   3. Compare with the values array.
     * @tc.expected      The sequence holds one value named 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplySequenceSizeOne', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(reply.size()).assertEqual(1);
      expect(reply.values.length).assertEqual(1);
      expect(reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(reply.values[0].length).assertEqual(9);
      expect(reply.cursor).assertEqual(0);
      expect(reply.readCount).assertEqual(0);
      expect(reply.size()).assertEqual(reply.values.length);
      expect(reply.trace()).assertEqual('hello rpc#0');
    });

    /**
     * @tc.name          replyContractReplyCursorAfterOneRead
     * @tc.desc          Reading the reply advances the cursor by one.
     * @tc.precondition  A manual exchange with one reply value.
     * @tc.steps         1. Perform the exchange.
     *                   2. Read the reply once.
     *                   3. Inspect cursor and read counter.
     * @tc.expected      The read returns 'hello rpc' with cursor 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyCursorAfterOneRead', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      const text = reply.readString();
      expect(text).assertEqual(REPLY_PAYLOAD);
      expect(text).assertEqual('hello rpc');
      expect(reply.cursor).assertEqual(1);
      expect(reply.readCount).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.trace()).assertEqual('hello rpc#1');
      expect(reply.reclaimed).assertFalse();
      expect(text.length).assertEqual(9);
    });

    /**
     * @tc.name          replyContractSecondReadReturnsEmpty
     * @tc.desc          Reading past the single reply value yields an empty string.
     * @tc.precondition  A reply sequence after one read.
     * @tc.steps         1. Perform the exchange and read once.
     *                   2. Read a second time.
     *                   3. Inspect counters.
     * @tc.expected      The second read is empty and the read counter reaches 2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractSecondReadReturnsEmpty', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(1);
      expect(reply.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.trace()).assertEqual('hello rpc#1');
      expect(reply.values.length).assertEqual(1);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          replyContractReplyRewindAllowsReread
     * @tc.desc          Rewinding the reply sequence exposes the literal again.
     * @tc.precondition  A reply sequence whose value was already read.
     * @tc.steps         1. Exchange and read the reply.
     *                   2. Rewind the sequence.
     *                   3. Read the reply again.
     * @tc.expected      The second logical read also returns 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyRewindAllowsReread', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      reply.rewind();
      expect(reply.cursor).assertEqual(0);
      expect(reply.trace()).assertEqual('hello rpc#0');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(reply.readCount).assertEqual(2);
      expect(reply.size()).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
    });
    /**
     * @tc.name          replyContractReclaimedReplyBlocksRead
     * @tc.desc          A reclaimed reply sequence refuses further reply reads.
     * @tc.precondition  A manual exchange whose reply was read once.
     * @tc.steps         1. Perform the exchange.
     *                   2. Reclaim the reply sequence.
     *                   3. Attempt a read.
     * @tc.expected      The read is empty and the sequence reports reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReclaimedReplyBlocksRead', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      reply.reclaim();
      expect(reply.reclaimed).assertTrue();
      expect(reply.cursor).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(1);
      expect(reply.writeString('late')).assertFalse();
      expect(reply.size()).assertEqual(1);
      expect(reply.trace()).assertEqual('hello rpc#0');
    });

    /**
     * @tc.name          replyContractUnknownCodeWritesNothing
     * @tc.desc          No reply write happens when the code is refused.
     * @tc.precondition  A manual data and reply pair for code 99.
     * @tc.steps         1. Invoke the stub with code 99.
     *                   2. Check the reply sequence write count.
     *                   3. Read the reply.
     * @tc.expected      The reply sequence stays empty with zero writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractUnknownCodeWritesNothing', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(UNKNOWN_CODE_LARGE, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(reply.writeCount).assertEqual(0);
      expect(reply.values.length).assertEqual(0);
      expect(reply.size()).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(0);
      expect(stub.requests[0].replyText).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
    });

    /**
     * @tc.name          replyContractUnknownReplySequenceEmpty
     * @tc.desc          The client observes an empty reply for an unknown code.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Send codes 0, 2 and -1.
     *                   2. Read each result reply.
     *                   3. Confirm the reply list is empty.
     * @tc.expected      All three replies are empty and no reply was recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractUnknownReplySequenceEmpty', 0, () => {
      const client = replyClient();
      const zero = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const two = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const negative = client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      expect(zero.replyText).assertEqual('');
      expect(two.replyText).assertEqual('');
      expect(negative.replyText).assertEqual('');
      expect(zero.replyText.length + two.replyText.length + negative.replyText.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(StubMetrics.from(client.stub).replies).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name          replyContractCustomReplyReplacesLiteral
     * @tc.desc          A custom stub replyText replaces the production literal.
     * @tc.precondition  A stub whose replyText is 'custom'.
     * @tc.steps         1. Set the custom reply.
     *                   2. Send code 1.
     *                   3. Compare the reply and ledger.
     * @tc.expected      The client sees 'custom' and the ledger copies it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractCustomReplyReplacesLiteral', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'custom';
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual('custom');
      expect(result.replyText === REPLY_PAYLOAD).assertFalse();
      expect(result.replyText.length).assertEqual(6);
      expect(stub.requests[0].replyText).assertEqual('custom');
      expect(client.replies[0]).assertEqual('custom');
      expect(client.trace()).assertEqual('custom');
      expect(result.isSuccess()).assertTrue();
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          replyContractCustomEmptyReplyHandled
     * @tc.desc          An empty custom replyText still yields a handled request.
     * @tc.precondition  A stub whose replyText is empty.
     * @tc.steps         1. Set replyText to ''.
     *                   2. Send code 1.
     *                   3. Inspect handled flags and reply lists.
     * @tc.expected      The request is handled but carries no reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractCustomEmptyReplyHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = '';
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('');
      expect(result.isSuccess()).assertTrue();
      expect(stub.requests[0].replyText).assertEqual('');
      expect(stub.requests[0].handled).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual('');
      expect(client.trace()).assertEqual('');
      expect(StubMetrics.from(stub).handled).assertEqual(1);
    });

    /**
     * @tc.name          replyContractReplyAfterResetIsDefault
     * @tc.desc          Reset restores the production reply literal.
     * @tc.precondition  A stub with a custom reply that is then reset.
     * @tc.steps         1. Set a custom reply and reset.
     *                   2. Send code 1.
     *                   3. Compare with the literal.
     * @tc.expected      The reply returns to 'hello rpc' after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyAfterResetIsDefault', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'temporary reply';
      expect(client.send(REQUEST_CODE, 'a').replyText).assertEqual('temporary reply');
      client.reset();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      const after = client.send(REQUEST_CODE, 'b');
      expect(after.replyText).assertEqual('hello rpc');
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[0]).assertEqual('hello rpc');
      expect(client.replies.length).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('b');
    });

    /**
     * @tc.name          replyContractRecordReplyMatchesSequenceText
     * @tc.desc          The ledger reply copy equals the buffered sequence value.
     * @tc.precondition  A manual exchange for code 1.
     * @tc.steps         1. Invoke the stub manually.
     *                   2. Read the reply sequence.
     *                   3. Compare with the ledger copy.
     * @tc.expected      Both the ledger and the sequence hold 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractRecordReplyMatchesSequenceText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      const buffered = reply.readString();
      const recorded = stub.requests[0].replyText;
      expect(buffered).assertEqual(recorded);
      expect(buffered).assertEqual(REPLY_PAYLOAD);
      expect(recorded.length).assertEqual(9);
      expect(reply.values[0]).assertEqual(recorded);
      expect(stub.requests[0].handled).assertTrue();
      expect(reply.readCount).assertEqual(1);
      expect(reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name          replyContractRecordReplyIsSnapshotOfSend
     * @tc.desc          Later replyText changes do not rewrite old ledger entries.
     * @tc.precondition  A completed request followed by a replyText change.
     * @tc.steps         1. Send code 1 with the default reply.
     *                   2. Change replyText after the send.
     *                   3. Compare the stored entry with the new text.
     * @tc.expected      The old entry keeps 'hello rpc' while the stub moves on.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractRecordReplyIsSnapshotOfSend', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'before');
      stub.replyText = 'after';
      const entry = stub.requests[0];
      expect(entry.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.replyText).assertEqual('after');
      expect(entry.replyText === stub.replyText).assertFalse();
      expect(client.replies[0]).assertEqual('hello rpc');
      const second = client.send(REQUEST_CODE, 'later');
      expect(second.replyText).assertEqual('after');
      expect(stub.requests.length).assertEqual(2);
      expect(stub.requests[1].replyText).assertEqual('after');
    });
    /**
     * @tc.name          replyContractReplyTraceSingleSend
     * @tc.desc          A single send yields a trace with one reply and no separator.
     * @tc.precondition  A client with one successful send.
     * @tc.steps         1. Send code 1.
     *                   2. Read the reply trace.
     *                   3. Count separators.
     * @tc.expected      The trace is the literal with no pipe character.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyTraceSingleSend', 0, () => {
      const client = replyClient();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(client.trace()).assertEqual(joined(client.replies, '|'));
      expect(client.trace().indexOf('|')).assertEqual(-1);
      expect(client.trace().length).assertEqual(9);
      expect(client.replies.length).assertEqual(1);
      expect(client.results.length).assertEqual(1);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(1);
      expect(client.trace().startsWith('hello')).assertTrue();
    });

    /**
     * @tc.name          replyContractReplyTraceMultipleSends
     * @tc.desc          Three successes produce a pipe-separated reply trace.
     * @tc.precondition  A client with three successful sends.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Read the trace.
     *                   3. Compare with a manual join.
     * @tc.expected      The trace contains three copies of the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyTraceMultipleSends', 0, () => {
      const client = replyClient();
      client.sendMany(3, REQUEST_CODE);
      const expected = REPLY_PAYLOAD + '|' + REPLY_PAYLOAD + '|' + REPLY_PAYLOAD;
      expect(client.trace()).assertEqual(expected);
      expect(client.trace().length).assertEqual(29);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(client.trace().split('|').length).assertEqual(3);
      expect(client.trace().indexOf('|')).assertEqual(9);
      expect(client.trace().lastIndexOf('|')).assertEqual(19);
      expect(client.trace().split('|')[1]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          replyContractReplyCountAcrossCodes
     * @tc.desc          Only successful codes contribute to the reply count.
     * @tc.precondition  A client and four codes are available.
     * @tc.steps         1. Send 1, 1, 0 and 1.
     *                   2. Count replies and metrics.
     *                   3. Verify the trace length.
     * @tc.expected      Three replies are recorded for four requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyCountAcrossCodes', 0, () => {
      const client = replyClient();
      client.send(REQUEST_CODE, 'a');
      client.send(REQUEST_CODE, 'b');
      client.send(UNKNOWN_CODE_ZERO, 'c');
      client.send(REQUEST_CODE, 'd');
      const metrics = StubMetrics.from(client.stub);
      expect(client.replies.length).assertEqual(3);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(1);
      expect(client.trace().split('|').length).assertEqual(3);
      expect(client.trace().length).assertEqual(29);
      expect(client.results[2].replyText).assertEqual('');
    });

    /**
     * @tc.name          replyContractRepliesListOnlySuccesses
     * @tc.desc          The client reply list mirrors success flags exactly.
     * @tc.precondition  A client with a mixed code history.
     * @tc.steps         1. Send 2, 1, -1, 1.
     *                   2. Walk results and flag mismatches.
     *                   3. Count successes.
     * @tc.expected      Reply text presence matches the handled flag everywhere.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractRepliesListOnlySuccesses', 0, () => {
      const client = replyClient();
      const codes: number[] = [UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_NEGATIVE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      let mismatches = 0;
      let successes = 0;
      for (let index = 0; index < client.results.length; index++) {
        const hasReply = client.results[index].replyText.length > 0;
        if (hasReply !== client.results[index].handled) {
          mismatches = mismatches + 1;
        }
        if (client.results[index].isSuccess()) {
          successes = successes + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(successes).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      expect(client.results[0].replyText).assertEqual('');
      expect(client.results[2].replyText).assertEqual('');
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(2);
    });

    /**
     * @tc.name          replyContractSyncOptionStillReplies
     * @tc.desc          A synchronous option does not change the reply payload.
     * @tc.precondition  Manual sequences and a sync option.
     * @tc.steps         1. Invoke the stub with flags 0.
     *                   2. Read the reply.
     *                   3. Compare with the literal.
     * @tc.expected      The reply is 'hello rpc' for the sync option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractSyncOptionStillReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('0/0/false');
      expect(handled).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(reply.writeCount).assertEqual(1);
      expect(stub.requests[0].replyText).assertEqual('hello rpc');
    });

    /**
     * @tc.name          replyContractAsyncOptionStillReplies
     * @tc.desc          An asynchronous option still yields the same reply text.
     * @tc.precondition  Manual sequences and an async option.
     * @tc.steps         1. Invoke the stub with flags 1.
     *                   2. Inspect the option and reply.
     *                   3. Compare both option records.
     * @tc.expected      The reply stays 'hello rpc' with the async option recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractAsyncOptionStillReplies', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 500, false);
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(option.isSync()).assertFalse();
      expect(option.describe()).assertEqual('1/500/false');
      expect(handled).assertTrue();
      expect(stub.requests[0].option).assertEqual('1/500/false');
      expect(stub.requests[0].option).assertEqual(option.describe());
      expect(reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual('hello rpc');
      expect(reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          replyContractReplyWithKilledStub
     * @tc.desc          A killed stub produces no reply for a known code.
     * @tc.precondition  A stub killed before the request.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code 1.
     *                   3. Inspect reply lists and metrics.
     * @tc.expected      The reply is empty and no reply metric is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyWithKilledStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual('');
      expect(result.handled).assertFalse();
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(stub.requests.length).assertEqual(1);
      expect(stub.requests[0].replyText).assertEqual('');
      expect(StubMetrics.from(stub).replies).assertEqual(0);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
    });

    /**
     * @tc.name          replyContractReplyAfterRevive
     * @tc.desc          Reviving the stub restores the production reply.
     * @tc.precondition  A killed stub that is revived.
     * @tc.steps         1. Kill and send once.
     *                   2. Revive and send code 1.
     *                   3. Compare the second reply.
     * @tc.expected      Only the post-revive request receives 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyAfterRevive', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      const dead = client.send(REQUEST_CODE, 'dead');
      stub.revive();
      const alive = client.send(REQUEST_CODE, 'alive');
      expect(dead.replyText).assertEqual('');
      expect(alive.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual('hello rpc');
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].replyText).assertEqual('');
      expect(stub.requests[1].replyText).assertEqual(REPLY_PAYLOAD);
    });
    /**
     * @tc.name          replyContractRejectListSuppressesReply
     * @tc.desc          A reject-list entry suppresses the reply for a known code.
     * @tc.precondition  The stub reject list holds code 1.
     * @tc.steps         1. Add code 1 to rejectCodes.
     *                   2. Send code 1.
     *                   3. Check the reply result.
     * @tc.expected      No reply text is produced and the request is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractRejectListSuppressesReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual('');
      expect(result.handled).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(stub.requests[0].replyText).assertEqual('');
      expect(StubMetrics.from(stub).replies).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          replyContractTwoRepliesInOneSequenceOrder
     * @tc.desc          Two handled requests writing into one sequence keep order.
     * @tc.precondition  A shared reply sequence and one data sequence.
     * @tc.steps         1. Invoke the stub twice with code 1.
     *                   2. Read both reply values.
     *                   3. Check cursor and write count.
     * @tc.expected      Both values are 'hello rpc' in FIFO order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractTwoRepliesInOneSequenceOrder', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('first');
      data.writeString('second');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.writeCount).assertEqual(2);
      expect(reply.size()).assertEqual(2);
      expect(reply.trace()).assertEqual('hello rpc|hello rpc#0');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(2);
      expect(reply.readString()).assertEqual('');
      expect(stub.requests[1].text).assertEqual('second');
      expect(data.readCount).assertEqual(2);
    });

    /**
     * @tc.name          replyContractReplySurvivesDataReclaim
     * @tc.desc          Reclaiming the data sequence does not remove an existing reply.
     * @tc.precondition  A manual exchange followed by a data reclaim.
     * @tc.steps         1. Perform the exchange.
     *                   2. Reclaim the data sequence.
     *                   3. Read the reply sequence.
     * @tc.expected      The reply remains readable after the data is reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplySurvivesDataReclaim', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      data.reclaim();
      expect(data.reclaimed).assertTrue();
      expect(data.readString()).assertEqual('');
      expect(reply.reclaimed).assertFalse();
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readCount).assertEqual(1);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          replyContractReplyWhenDataEmpty
     * @tc.desc          A code 1 request with empty data still writes the reply.
     * @tc.precondition  An empty data sequence and a fresh reply sequence.
     * @tc.steps         1. Invoke the stub without writing data.
     *                   2. Check the handled flag.
     *                   3. Read the reply.
     * @tc.expected      The stub returns true and writes 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyWhenDataEmpty', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(data.size()).assertEqual(0);
      expect(data.readString()).assertEqual('');
      expect(reply.writeCount).assertEqual(1);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          replyContractCustomReplyLength
     * @tc.desc          The reply length follows the configured custom text.
     * @tc.precondition  A stub with a twenty-character custom reply.
     * @tc.steps         1. Set a 20-character reply.
     *                   2. Send code 1.
     *                   3. Measure the reply length.
     * @tc.expected      The reply is exactly 20 characters long.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractCustomReplyLength', 0, () => {
      const custom = 'abcdefghijklmnopqrst';
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = custom;
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(custom.length).assertEqual(20);
      expect(result.replyText.length).assertEqual(20);
      expect(result.replyText).assertEqual(custom);
      expect(result.replyText.length).assertLarger(REPLY_PAYLOAD.length);
      expect(result.replyText.startsWith('abcdefghij')).assertTrue();
      expect(result.replyText.endsWith('qrst')).assertTrue();
      expect(stub.requests[0].replyText.length).assertEqual(20);
      expect(textFingerprint(custom)).assertEqual(textFingerprint(result.replyText));
    });

    /**
     * @tc.name          replyContractReplyWithUnicodeCustom
     * @tc.desc          A non-ASCII custom reply is preserved through the sequence.
     * @tc.precondition  A stub with a two-character CJK reply.
     * @tc.steps         1. Set the CJK reply text.
     *                   2. Send code 1.
     *                   3. Measure length and compare content.
     * @tc.expected      The reply keeps both CJK characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyWithUnicodeCustom', 0, () => {
      const custom = '\u56de\u590d';
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = custom;
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual(custom);
      expect(result.replyText.length).assertEqual(2);
      expect(result.replyText.charCodeAt(0)).assertLarger(127);
      expect(allCharCodesInRange(result.replyText, 97, 122)).assertFalse();
      expect(result.replyText === REPLY_PAYLOAD).assertFalse();
      expect(stub.requests[0].replyText).assertEqual(custom);
      expect(client.replies[0]).assertEqual(custom);
      expect(replyClient().send(REQUEST_CODE, REQUEST_PAYLOAD).replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          replyContractReplyWithSpacesPreserved
     * @tc.desc          Leading and trailing spaces in a custom reply are preserved.
     * @tc.precondition  A stub with a padded reply string.
     * @tc.steps         1. Set the padded reply.
     *                   2. Send code 1.
     *                   3. Compare raw and trimmed lengths.
     * @tc.expected      The reply keeps its padding and raw length 10.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyWithSpacesPreserved', 0, () => {
      const padded = '  spaced  ';
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = padded;
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(padded.length).assertEqual(10);
      expect(result.replyText.length).assertEqual(10);
      expect(result.replyText).assertEqual(padded);
      expect(result.replyText.startsWith(' ')).assertTrue();
      expect(result.replyText.endsWith(' ')).assertTrue();
      expect(result.replyText.trim()).assertEqual('spaced');
      expect(result.replyText.trim().length).assertEqual(6);
      expect(stub.requests[0].replyText).assertEqual(padded);
    });

    /**
     * @tc.name          replyContractReplyCountMetricsAfterMixed
     * @tc.desc          Metrics count replies only for handled entries.
     * @tc.precondition  A client with three successes and two rejections.
     * @tc.steps         1. Send 1, 0, 1, 2, 1.
     *                   2. Build metrics.
     *                   3. Compare reply counts.
     * @tc.expected      Five requests yield three handled and three replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyCountMetricsAfterMixed', 0, () => {
      const client = replyClient();
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(3);
      expect(client.replies.length).assertEqual(metrics.replies);
      expect(client.trace().split('|').length).assertEqual(3);
      expect(client.results[1].replyText).assertEqual('');
      expect(client.results[3].replyText).assertEqual('');
    });
    /**
     * @tc.name          replyContractAllSuccessRatioOne
     * @tc.desc          A run of only code 1 requests reports a success ratio of one.
     * @tc.precondition  A client with four successful sends.
     * @tc.steps         1. Send code 1 four times.
     *                   2. Build metrics.
     *                   3. Compare ratio and reply count.
     * @tc.expected      The ratio is 1 and every request has a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractAllSuccessRatioOne', 0, () => {
      const client = replyClient();
      const handled = client.sendMany(4, REQUEST_CODE);
      const metrics = StubMetrics.from(client.stub);
      expect(handled).assertEqual(4);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.handled).assertEqual(metrics.requests);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(4);
      expect(client.replies.length).assertEqual(4);
      expect(client.trace().split('|').length).assertEqual(4);
      expect(client.stub.requests[3].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          replyContractReplyPerCodeOracleMatch
     * @tc.desc          Actual replies match the reply oracle for code 1 and unknowns.
     * @tc.precondition  A client and the reply oracle are available.
     * @tc.steps         1. Send 1 and three unknown codes.
     *                   2. Compare each reply with the oracle.
     *                   3. Count mismatches.
     * @tc.expected      No mismatch exists between stub and oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyPerCodeOracleMatch', 0, () => {
      const client = replyClient();
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      let mismatches = 0;
      for (let index = 0; index < codes.length; index++) {
        const result = client.send(codes[index], REQUEST_PAYLOAD);
        if (result.replyText !== expectedReplyFor(codes[index])) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(client.results[0].replyText).assertEqual('hello rpc');
      expect(client.results[1].replyText).assertEqual('');
      expect(client.results[2].replyText).assertEqual('');
      expect(client.results[3].replyText).assertEqual('');
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(expectedReplyFor(REQUEST_CODE));
    });

    /**
     * @tc.name          replyContractReplyDeterministicAcrossThreeSends
     * @tc.desc          Three consecutive sends return byte-identical replies.
     * @tc.precondition  A single client is available.
     * @tc.steps         1. Send code 1 three times.
     *                   2. Compare reply fingerprints.
     *                   3. Compare reply strings pairwise.
     * @tc.expected      All three replies share the same content and fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyDeterministicAcrossThreeSends', 0, () => {
      const client = replyClient();
      const first = client.send(REQUEST_CODE, 'one');
      const second = client.send(REQUEST_CODE, 'two');
      const third = client.send(REQUEST_CODE, 'three');
      expect(first.replyText).assertEqual(second.replyText);
      expect(second.replyText).assertEqual(third.replyText);
      expect(textFingerprint(first.replyText)).assertEqual(textFingerprint(second.replyText));
      expect(textFingerprint(third.replyText)).assertEqual(textFingerprint(REPLY_PAYLOAD));
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(client.results[2].replyText.length).assertEqual(9);
      expect(client.stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name          replyContractIndependentClientsSameReply
     * @tc.desc          Two independent clients receive the same production reply.
     * @tc.precondition  Two separate client instances.
     * @tc.steps         1. Send code 1 on each client.
     *                   2. Compare replies.
     *                   3. Verify the stubs are distinct.
     * @tc.expected      Both clients see 'hello rpc' through separate stubs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractIndependentClientsSameReply', 0, () => {
      const first = replyClient();
      const second = replyClient();
      const firstReply = first.send(REQUEST_CODE, 'first').replyText;
      const secondReply = second.send(REQUEST_CODE, 'second').replyText;
      expect(firstReply).assertEqual(secondReply);
      expect(firstReply).assertEqual(REPLY_PAYLOAD);
      expect(first.stub === second.stub).assertFalse();
      expect(first.stub.requestCount()).assertEqual(1);
      expect(second.stub.requestCount()).assertEqual(1);
      expect(first.stub.requests[0].text).assertEqual('first');
      expect(second.stub.requests[0].text).assertEqual('second');
      expect(first.replies[0]).assertEqual(second.replies[0]);
    });

    /**
     * @tc.name          replyContractReplyAfterClientReset
     * @tc.desc          After a client reset only new replies are recorded.
     * @tc.precondition  A client with two prior replies that is reset.
     * @tc.steps         1. Send code 1 twice.
     *                   2. Reset the client.
     *                   3. Send code 1 again.
     * @tc.expected      The reply list holds exactly one new literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyAfterClientReset', 0, () => {
      const client = replyClient();
      client.send(REQUEST_CODE, 'a');
      client.send(REQUEST_CODE, 'b');
      expect(client.replies.length).assertEqual(2);
      client.reset();
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      const result = client.send(REQUEST_CODE, 'c');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(1);
      expect(client.stub.requests[0].text).assertEqual('c');
    });

    /**
     * @tc.name          replyContractDescriptorAfterReplyExchange
     * @tc.desc          Replying does not alter the remote object descriptor.
     * @tc.precondition  A stub with the production descriptor.
     * @tc.steps         1. Send code 1.
     *                   2. Compare the descriptor.
     *                   3. Check the result is still successful.
     * @tc.expected      The descriptor stays IPCStubTest after the exchange.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractDescriptorAfterReplyExchange', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].describe()).assertEqual('1/hello world/hello rpc/true');
    });

    /**
     * @tc.name          replyContractSequenceTraceAfterWrite
     * @tc.desc          Before any read the reply trace ends with cursor zero.
     * @tc.precondition  A manual exchange with no read.
     * @tc.steps         1. Invoke the stub manually.
     *                   2. Read the trace.
     *                   3. Compare cursor and values.
     * @tc.expected      The trace is 'hello rpc#0'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractSequenceTraceAfterWrite', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(reply.trace()).assertEqual('hello rpc#0');
      expect(reply.trace().endsWith('#0')).assertTrue();
      expect(reply.trace().startsWith(REPLY_PAYLOAD)).assertTrue();
      expect(reply.cursor).assertEqual(0);
      expect(reply.values.length).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.readCount).assertEqual(0);
      expect(reply.trace().length).assertEqual(11);
    });

    /**
     * @tc.name          replyContractSequenceTraceAfterRead
     * @tc.desc          After a read the reply trace ends with cursor one.
     * @tc.precondition  A manual exchange whose reply was read.
     * @tc.steps         1. Invoke the stub manually.
     *                   2. Read the reply value.
     *                   3. Read the trace.
     * @tc.expected      The trace is 'hello rpc#1'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractSequenceTraceAfterRead', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(reply.trace()).assertEqual('hello rpc#0');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.trace()).assertEqual('hello rpc#1');
      expect(reply.trace().endsWith('#1')).assertTrue();
      expect(reply.trace().indexOf('#')).assertEqual(9);
      expect(reply.cursor).assertEqual(1);
      expect(reply.readCount).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.size()).assertEqual(1);
    });
    /**
     * @tc.name          replyContractSeparateSequencesWriteCounts
     * @tc.desc          Each exchange writes to its own reply sequence once.
     * @tc.precondition  Two independent reply sequences.
     * @tc.steps         1. Exchange code 1 into each sequence.
     *                   2. Compare write counts.
     *                   3. Read both replies.
     * @tc.expected      Both sequences hold exactly one identical value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractSeparateSequencesWriteCounts', 0, () => {
      const first = manualExchange(REQUEST_CODE, 'left');
      const second = manualExchange(REQUEST_CODE, 'right');
      expect(first.writeCount).assertEqual(1);
      expect(second.writeCount).assertEqual(1);
      expect(first.size()).assertEqual(1);
      expect(second.size()).assertEqual(1);
      expect(first.values[0]).assertEqual(second.values[0]);
      expect(first.readString()).assertEqual(REPLY_PAYLOAD);
      expect(second.readString()).assertEqual(REPLY_PAYLOAD);
      expect(first.trace()).assertEqual(second.trace());
      expect(first.reclaimed).assertFalse();
    });

    /**
     * @tc.name          replyContractReplyNotTrimmed
     * @tc.desc          The production reply carries no surrounding whitespace.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Send code 1.
     *                   2. Compare the reply with its trimmed form.
     *                   3. Search for whitespace characters.
     * @tc.expected      Trimming does not change the reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyNotTrimmed', 0, () => {
      const reply = sendOnce();
      expect(reply.trim()).assertEqual(reply);
      expect(reply.trim().length).assertEqual(reply.length);
      expect(reply.indexOf('\n')).assertEqual(-1);
      expect(reply.indexOf('\t')).assertEqual(-1);
      expect(reply.indexOf('\r')).assertEqual(-1);
      expect(reply.startsWith(' ')).assertFalse();
      expect(reply.endsWith(' ')).assertFalse();
      expect(reply.trim()).assertEqual('hello rpc');
    });

    /**
     * @tc.name          replyContractReplyStoredInValuesArray
     * @tc.desc          The reply value lives at index zero of the values array.
     * @tc.precondition  A manual exchange for code 1.
     * @tc.steps         1. Invoke the stub manually.
     *                   2. Inspect the values array.
     *                   3. Compare index zero with the literal.
     * @tc.expected      values[0] equals 'hello rpc' and no other entry exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyStoredInValuesArray', 0, () => {
      const reply = manualExchange(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(reply.values.length).assertEqual(1);
      expect(reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(reply.values[0]).assertEqual('hello rpc');
      expect(reply.values[0].length).assertEqual(9);
      expect(reply.values[0].startsWith('hello')).assertTrue();
      expect(reply.values[0].endsWith('rpc')).assertTrue();
      expect(reply.values[0] === reply.values[1]).assertFalse();
      expect(reply.values.indexOf(REPLY_PAYLOAD)).assertEqual(0);
    });

    /**
     * @tc.name          replyContractReplyEqualsOracleConstant
     * @tc.desc          The observed reply equals the oracle reply for code 1.
     * @tc.precondition  The reply oracle is available.
     * @tc.steps         1. Send code 1.
     *                   2. Read the oracle reply for code 1.
     *                   3. Compare both values.
     * @tc.expected      The observed and oracle replies are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyEqualsOracleConstant', 0, () => {
      const observed = sendOnce();
      const oracle = expectedReplyFor(REQUEST_CODE);
      expect(observed).assertEqual(oracle);
      expect(oracle).assertEqual(REPLY_PAYLOAD);
      expect(oracle).assertEqual('hello rpc');
      expect(oracle.length).assertEqual(9);
      expect(observed.length).assertEqual(oracle.length);
      expect(textFingerprint(observed)).assertEqual(textFingerprint(oracle));
      expect(observed === expectedReplyFor(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE).length).assertEqual(0);
    });

    /**
     * @tc.name          replyContractSuffixLengthAfterSpace
     * @tc.desc          The suffix after the separator is exactly three characters.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Find the space index.
     *                   2. Slice the suffix.
     *                   3. Compare its length.
     * @tc.expected      The suffix length is 3 and content is 'rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractSuffixLengthAfterSpace', 0, () => {
      const reply = sendOnce();
      const space = reply.indexOf(' ');
      const suffix = reply.substring(space + 1);
      expect(suffix).assertEqual('rpc');
      expect(suffix.length).assertEqual(3);
      expect(reply.length - suffix.length).assertEqual(6);
      expect(reply.length - space).assertEqual(4);
      expect(suffix.charAt(0)).assertEqual('r');
      expect(suffix.charAt(1)).assertEqual('p');
      expect(suffix.charAt(2)).assertEqual('c');
      expect(suffix.toUpperCase()).assertEqual('RPC');
    });

    /**
     * @tc.name          replyContractSpaceCharacterCode
     * @tc.desc          The separator character code is the ASCII space value 32.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Read the character at index five.
     *                   2. Compare its code with 32.
     *                   3. Verify neighbouring codes.
     * @tc.expected      Index five is a space with code 32.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractSpaceCharacterCode', 0, () => {
      const reply = sendOnce();
      expect(reply.charCodeAt(5)).assertEqual(32);
      expect(reply.charAt(5)).assertEqual(' ');
      expect(reply.charCodeAt(4)).assertEqual(111);
      expect(reply.charCodeAt(6)).assertEqual(114);
      expect(charCodes(reply)[5]).assertEqual(32);
      expect(reply.split(' ').length).assertEqual(2);
      expect(reply.split(' ')[0]).assertEqual('hello');
      expect(reply.split(' ')[1]).assertEqual('rpc');
    });

    /**
     * @tc.name          replyContractTraceFingerprintStable
     * @tc.desc          Identical reply histories produce identical trace fingerprints.
     * @tc.precondition  Two clients receiving the same number of replies.
     * @tc.steps         1. Send code 1 twice on each client.
     *                   2. Fingerprint both traces.
     *                   3. Compare with the literal history hash.
     * @tc.expected      Both traces share one fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractTraceFingerprintStable', 0, () => {
      const first = replyClient();
      const second = replyClient();
      first.sendMany(2, REQUEST_CODE);
      second.sendMany(2, REQUEST_CODE);
      const firstTrace = first.trace();
      const secondTrace = second.trace();
      expect(firstTrace).assertEqual(secondTrace);
      expect(textFingerprint(firstTrace)).assertEqual(textFingerprint(secondTrace));
      expect(textFingerprint(firstTrace)).assertEqual(textFingerprint('hello rpc|hello rpc'));
      expect(firstTrace.length).assertEqual(19);
      expect(secondTrace.length).assertEqual(19);
      expect(first.replies.length).assertEqual(second.replies.length);
      expect(StubMetrics.from(first.stub).fingerprint()).assertEqual(StubMetrics.from(second.stub).fingerprint());
      expect(countOf(second.replies, REPLY_PAYLOAD)).assertEqual(2);
    });

    /**
     * @tc.name          replyContractReplyCaseSensitivity
     * @tc.desc          The reply is case sensitive and differs from capitalized variants.
     * @tc.precondition  A successful code 1 exchange.
     * @tc.steps         1. Send code 1.
     *                   2. Build capitalized variants.
     *                   3. Compare equality and fingerprints.
     * @tc.expected      The reply is not equal to any capitalized variant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('replyContractReplyCaseSensitivity', 0, () => {
      const reply = sendOnce();
      const upper = 'HELLO RPC';
      const title = 'Hello Rpc';
      expect(reply).assertEqual('hello rpc');
      expect(reply === upper).assertFalse();
      expect(reply === title).assertFalse();
      expect(reply.toUpperCase()).assertEqual(upper);
      expect(reply.toUpperCase() === reply).assertFalse();
      expect(textFingerprint(reply) === textFingerprint(upper)).assertFalse();
      expect(textFingerprint(reply) === textFingerprint(title)).assertFalse();
      expect(reply.toLowerCase()).assertEqual(reply);
    });

    /**
     * @tc.name          replyContractReplyListIndependentPerClient
     * @tc.desc          Resetting one client never clears another client's replies.
     * @tc.precondition  Two clients that each received one reply.
     * @tc.steps         1. Send code 1 on both clients.
     *                   2. Reset the first client.
     *                   3. Inspect both reply lists.
     * @tc.expected      Only the first reply list is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('replyContractReplyListIndependentPerClient', 0, () => {
      const first = replyClient();
      const second = replyClient();
      first.send(REQUEST_CODE, 'first');
      second.send(REQUEST_CODE, 'second');
      expect(first.trace()).assertEqual(second.trace());
      first.reset();
      expect(first.replies.length).assertEqual(0);
      expect(second.replies.length).assertEqual(1);
      expect(second.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(first.trace()).assertEqual('');
      expect(second.trace()).assertEqual(REPLY_PAYLOAD);
      expect(second.stub.requestCount()).assertEqual(1);
      expect(first.stub.requestCount()).assertEqual(0);
    });

  });
}

