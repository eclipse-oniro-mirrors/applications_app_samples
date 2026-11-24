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
  MessageSequenceModel,
  createConnectedSession,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  REQUEST_CODE,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint
} from '../Shared/SharedDriver';

export default function payloadValidation(): void {
  describe('PayloadValidation', () => {
    beforeAll(() => {
      logSuite('PayloadValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PayloadValidation', 'end');
    });

    /**
     * @tc.name          payloadValidationRequestLiteral
     * @tc.desc          The sample request payload is 'hello world'.
     * @tc.precondition  The payload constants are exported.
     * @tc.steps         1. Read the request constant.
     *                   2. Compare with the literal.
     *                   3. Split it into words.
     * @tc.expected      The payload is two lowercase words separated by one space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadValidationRequestLiteral', 0, () => {
      logStep('payloadValidation', 'request=' + REQUEST_PAYLOAD);
      expect(REQUEST_PAYLOAD).assertEqual('hello world');
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(REQUEST_PAYLOAD.split(' ').length).assertEqual(2);
      expect(REQUEST_PAYLOAD.split(' ')[0]).assertEqual('hello');
      expect(REQUEST_PAYLOAD.split(' ')[1]).assertEqual('world');
      expect(countOf(REQUEST_PAYLOAD.split(''), ' ')).assertEqual(1);
      expect(REQUEST_PAYLOAD.indexOf(' ')).assertEqual(5);
    });

    /**
     * @tc.name          payloadValidationReplyLiteral
     * @tc.desc          The stub reply payload is 'hello rpc'.
     * @tc.precondition  The reply constant is exported.
     * @tc.steps         1. Read the reply constant.
     *                   2. Compare with the literal.
     *                   3. Check its relation to the request.
     * @tc.expected      The reply shares the greeting but ends in rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadValidationReplyLiteral', 0, () => {
      expect(REPLY_PAYLOAD).assertEqual('hello rpc');
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(REPLY_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REPLY_PAYLOAD.endsWith('rpc')).assertTrue();
      expect(REPLY_PAYLOAD === REQUEST_PAYLOAD).assertFalse();
      expect(REPLY_PAYLOAD.split(' ').length).assertEqual(2);
      expect(textFingerprint(REPLY_PAYLOAD) === textFingerprint(REQUEST_PAYLOAD)).assertFalse();
    });

    /**
     * @tc.name          payloadValidationDefaultSendReachesStub
     * @tc.desc          The default payload is delivered to the stub model.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send with no argument.
     *                   2. Read the stub received texts.
     *                   3. Compare the reply.
     * @tc.expected      The stub received 'hello world' and replied 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadValidationDefaultSendReachesStub', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const reply: string = client.sendString().readReply();
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('hello world');
      expect(client.proxy?.stub.handledCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.events.last()).assertEqual('send-ok:hello rpc');
      expect(client.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationEmptyPayloadDelivered
     * @tc.desc          An empty payload is accepted and read back as empty text.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send an empty string.
     *                   2. Read the stub text.
     *                   3. Compare the reply.
     * @tc.expected      The stub receives an empty string and the reply still arrives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationEmptyPayloadDelivered', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const result = client.sendString('');
      expect(result.isSuccess()).assertTrue();
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('');
      expect(client.proxy?.stub.receivedTexts[0].length).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.writeCount).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationUnicodeChinesePayload
     * @tc.desc          A Chinese payload survives the round trip.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a four character Chinese payload.
     *                   2. Read the stub text.
     *                   3. Compare lengths and characters.
     * @tc.expected      The stub receives the identical text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationUnicodeChinesePayload', 0, () => {
      const payload: string = '你好世界';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual(payload);
      expect(client.proxy?.stub.receivedTexts[0].length).assertEqual(4);
      expect(payload.charCodeAt(0)).assertLarger(127);
      expect(payload.charAt(1)).assertEqual('好');
      expect(payload.charAt(3)).assertEqual('界');
      expect(client.proxy?.stub.receivedTexts[0] === REQUEST_PAYLOAD).assertFalse();
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationEmojiSurrogatePair
     * @tc.desc          An emoji payload retains its two code units.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a single emoji.
     *                   2. Read the stub text length.
     *                   3. Compare code units.
     * @tc.expected      The text length is two and the characters match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationEmojiSurrogatePair', 0, () => {
      const payload: string = '😀';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received.length).assertEqual(2);
      expect(received).assertEqual(payload);
      expect(received.charCodeAt(0)).assertLarger(55295);
      expect(received.charCodeAt(1)).assertLarger(56319);
      expect(received === REQUEST_PAYLOAD).assertFalse();
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationLongPayloadFourKilobytes
     * @tc.desc          A four thousand character payload is delivered intact.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Build a long payload by repetition.
     *                   2. Send it.
     *                   3. Compare lengths and prefixes.
     * @tc.expected      The stub receives the full length payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationLongPayloadFourKilobytes', 0, () => {
      let payload: string = '';
      while (payload.length < 4000) {
        payload = payload + 'abcd';
      }
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(payload.length).assertEqual(4000);
      expect(received.length).assertEqual(4000);
      expect(received).assertEqual(payload);
      expect(received.startsWith('abcdabcd')).assertTrue();
      expect(received.endsWith('abcd')).assertTrue();
      expect(client.proxy?.stub.receivedTexts[0] === REQUEST_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name          payloadValidationWhitespacePreserved
     * @tc.desc          Leading and trailing spaces survive the round trip.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a padded payload.
     *                   2. Read the stub text.
     *                   3. Compare raw and trimmed values.
     * @tc.expected      The raw text is preserved while trim shortens it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationWhitespacePreserved', 0, () => {
      const payload: string = '  hello  ';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(received.length).assertEqual(9);
      expect(received.trim()).assertEqual('hello');
      expect(received.trim().length).assertEqual(5);
      expect(received.startsWith('  ')).assertTrue();
      expect(received.endsWith('  ')).assertTrue();
      expect(received === received.trim()).assertFalse();
    });

    /**
     * @tc.name          payloadValidationNewlineAndTabPayload
     * @tc.desc          Control whitespace characters survive the round trip.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload with a tab and newline.
     *                   2. Read the stub text.
     *                   3. Count the control characters.
     * @tc.expected      The tab and newline are both present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationNewlineAndTabPayload', 0, () => {
      const payload: string = 'line1\nline2\ttab';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(countOf(received.split(''), '\n')).assertEqual(1);
      expect(countOf(received.split(''), '\t')).assertEqual(1);
      expect(received.split('\n').length).assertEqual(2);
      expect(received.split('line').length).assertEqual(3);
      expect(received.indexOf('\n')).assertEqual(5);
      expect(received.indexOf('\t')).assertLarger(received.indexOf('\n'));
    });

    /**
     * @tc.name          payloadValidationQuotesAndBackslash
     * @tc.desc          Quotation marks and backslashes are delivered verbatim.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload with quotes and a backslash.
     *                   2. Read the stub text.
     *                   3. Count the special characters.
     * @tc.expected      All special characters survive unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationQuotesAndBackslash', 0, () => {
      const payload: string = 'say "hi" \\ path';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(countOf(received.split(''), '"')).assertEqual(2);
      expect(countOf(received.split(''), '\\')).assertEqual(1);
      expect(received.indexOf('\\')).assertLarger(0);
      expect(received.length).assertEqual(payload.length);
      expect(received === REQUEST_PAYLOAD).assertFalse();
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationNoProxyEventCarriesPayload
     * @tc.desc          A failed send records the payload in its event detail.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send a distinctive payload without connecting.
     *                   2. Read the event detail.
     *                   3. Compare with the payload.
     * @tc.expected      The send-no-proxy event detail equals the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationNoProxyEventCarriesPayload', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const payload: string = 'unconnected-bytes';
      expect(client.sendString(payload).errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.events.size()).assertEqual(1);
      expect(client.events.last()).assertEqual('send-no-proxy:' + payload);
      expect(client.events.last().indexOf(payload)).assertEqual(14);
      expect(client.events.entries[0]).assertEqual('send-no-proxy:unconnected-bytes');
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationEmptyFingerprint
     * @tc.desc          The empty payload has a stable fingerprint.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Hash the empty string twice.
     *                   2. Compare with the request payload hash.
     *                   3. Check the baseline value.
     * @tc.expected      The empty hash is stable and differs from hello world.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationEmptyFingerprint', 0, () => {
      const empty: number = textFingerprint('');
      expect(empty).assertEqual(216613);
      expect(empty).assertEqual(textFingerprint(''));
      expect(empty === textFingerprint(REQUEST_PAYLOAD)).assertFalse();
      expect(empty).assertLarger(0);
      expect(textFingerprint(REQUEST_PAYLOAD)).assertLarger(empty);
      expect(textFingerprint(' ') === empty).assertFalse();
      expect(textFingerprint(' ')).assertLarger(0);
    });

    /**
     * @tc.name          payloadValidationUnicodeFingerprintStability
     * @tc.desc          Equal unicode payloads hash identically.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Hash two equal Chinese payloads.
     *                   2. Hash a variant with one different character.
     *                   3. Compare all three hashes.
     * @tc.expected      The equal payloads match and the variant differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationUnicodeFingerprintStability', 0, () => {
      const first: number = textFingerprint('你好世界');
      const second: number = textFingerprint('你好世界');
      const variant: number = textFingerprint('你好世间');
      expect(first).assertEqual(second);
      expect(first === variant).assertFalse();
      expect(first).assertLarger(0);
      expect(variant).assertLarger(0);
      expect(uniqueStrings([String(first), String(variant)]).length).assertEqual(2);
      expect(String(first).length).assertLarger(0);
    });

    /**
     * @tc.name          payloadValidationSequenceMultipleWrites
     * @tc.desc          A message sequence counts writes and reads independently.
     * @tc.precondition  A fresh MessageSequenceModel exists.
     * @tc.steps         1. Write three strings.
     *                   2. Read one string.
     *                   3. Compare counters and size.
     * @tc.expected      Three writes, one read and size three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceMultipleWrites', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      expect(sequence.writeString('a')).assertTrue();
      expect(sequence.writeString('b')).assertTrue();
      expect(sequence.writeString('c')).assertTrue();
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.isEmpty()).assertFalse();
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationSequenceExhausted
     * @tc.desc          Reading past the end returns empty text without moving the cursor.
     * @tc.precondition  A sequence with one value exists.
     * @tc.steps         1. Write two values.
     *                   2. Read three times.
     *                   3. Compare the returned texts.
     * @tc.expected      The third read is empty and the cursor stays at two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceExhausted', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      expect(sequence.readString()).assertEqual('one');
      expect(sequence.readString()).assertEqual('two');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertFalse();
    });

    /**
     * @tc.name          payloadValidationSequenceReclaimBlocksIo
     * @tc.desc          A reclaimed sequence rejects writes and returns empty reads.
     * @tc.precondition  A sequence with one value exists.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Attempt a write and a read.
     *                   3. Check the flags.
     * @tc.expected      Writes fail and reads return empty text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceReclaimBlocksIo', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('before');
      sequence.reclaim();
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeString('after')).assertFalse();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
    });

    /**
     * @tc.name          payloadValidationSequenceRewind
     * @tc.desc          rewind() allows the same values to be read again.
     * @tc.precondition  A sequence with two values was read once.
     * @tc.steps         1. Read both values.
     *                   2. Rewind and read again.
     *                   3. Compare the two passes.
     * @tc.expected      Both passes return the same ordered values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceRewind', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('beta');
      const first: string[] = [sequence.readString(), sequence.readString()];
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      const second: string[] = [sequence.readString(), sequence.readString()];
      expect(sameStringArray(first, second)).assertTrue();
      expect(first[0]).assertEqual('alpha');
      expect(second[1]).assertEqual('beta');
      expect(sequence.readCount).assertEqual(4);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.trace()).assertEqual('alpha|beta#2');
    });

    /**
     * @tc.name          payloadValidationSequenceTraceFormat
     * @tc.desc          trace() joins values with a pipe and appends the cursor.
     * @tc.precondition  A sequence with three values exists.
     * @tc.steps         1. Read one value.
     *                   2. Build the trace.
     *                   3. Compare with the expected text.
     * @tc.expected      The trace ends with the cursor after a hash.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSequenceTraceFormat', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('x');
      sequence.writeString('y');
      sequence.writeString('z');
      expect(sequence.trace()).assertEqual('x|y|z#0');
      sequence.readString();
      expect(sequence.trace()).assertEqual('x|y|z#1');
      expect(sequence.trace().indexOf('#')).assertLarger(0);
      expect(sequence.trace().split('|').length).assertEqual(3);
      expect(sequence.trace().split('#')[1]).assertEqual('1');
      expect(sequence.trace().endsWith('#1')).assertTrue();
      expect(sequence.trace().length).assertEqual(7);
    });

    /**
     * @tc.name          payloadValidationSequenceValuesArray
     * @tc.desc          The public value array mirrors the written payloads.
     * @tc.precondition  A sequence exists.
     * @tc.steps         1. Write three payloads.
     *                   2. Read the values array.
     *                   3. Compare with the expected list.
     * @tc.expected      The array holds the payloads in write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceValuesArray', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('first');
      sequence.writeString('');
      sequence.writeString('third');
      expect(sequence.values.length).assertEqual(3);
      expect(sequence.values[0]).assertEqual('first');
      expect(sequence.values[1]).assertEqual('');
      expect(sequence.values[2]).assertEqual('third');
      expect(joined(sequence.values, '/')).assertEqual('first//third');
      expect(sequence.values[1].length).assertEqual(0);
      expect(sameStringArray(sequence.values, ['first', '', 'third'])).assertTrue();
      expect(uniqueStrings(sequence.values).length).assertEqual(3);
    });

    /**
     * @tc.name          payloadValidationCustomReplyLength
     * @tc.desc          A custom reply of one thousand characters is returned whole.
     * @tc.precondition  A session with a long custom reply exists.
     * @tc.steps         1. Build the reply by repetition.
     *                   2. Create the session and send.
     *                   3. Compare lengths.
     * @tc.expected      The reply length is one thousand characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationCustomReplyLength', 0, () => {
      let reply: string = '';
      while (reply.length < 1000) {
        reply = reply + 'rpc';
      }
      const client: ConnectionModel = createConnectedSession(reply);
      const text: string = client.sendString('query').readReply();
      expect(reply.length).assertEqual(1002);
      expect(text.length).assertEqual(1002);
      expect(text).assertEqual(reply);
      expect(text.startsWith('rpcrpc')).assertTrue();
      expect(client.events.last()).assertEqual('send-ok:' + reply);
      expect(client.lastToast()).assertEqual('sendRequest success');
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('query');
    });

    /**
     * @tc.name          payloadValidationEmptyCustomReply
     * @tc.desc          An empty reply keeps the request successful.
     * @tc.precondition  A session with an empty reply exists.
     * @tc.steps         1. Create the session with an empty reply.
     *                   2. Send.
     *                   3. Read the reply and event.
     * @tc.expected      The reply is empty and the send still succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationEmptyCustomReply', 0, () => {
      const client: ConnectionModel = createConnectedSession('');
      const result = client.sendString('hello');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText.length).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(client.events.last()).assertEqual('send-ok:');
      expect(client.lastToast()).assertEqual('sendRequest success');
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('hello');
      expect(client.logs.contains('reply ')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationMultiplePayloadOrder
     * @tc.desc          Five payloads reach the stub in send order.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send five distinct payloads.
     *                   2. Read the received list.
     *                   3. Compare with the expected list.
     * @tc.expected      The stub received the payloads in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationMultiplePayloadOrder', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const payloads: string[] = ['p1', 'p2', 'p3', 'p4', 'p5'];
      for (let index = 0; index < payloads.length; index++) {
        client.sendString(payloads[index]);
      }
      const received: string[] = client.proxy?.stub.receivedTexts ?? [];
      expect(received.length).assertEqual(5);
      expect(sameStringArray(received, payloads)).assertTrue();
      expect(received[0]).assertEqual('p1');
      expect(received[4]).assertEqual('p5');
      expect(joined(received, ',')).assertEqual('p1,p2,p3,p4,p5');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(5);
      expect(client.events.countOf('send-ok')).assertEqual(5);
    });

    /**
     * @tc.name          payloadValidationTwentyFiveUniquePayloads
     * @tc.desc          Twenty-five generated payloads all arrive uniquely.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send payloads with an incrementing suffix.
     *                   2. Deduplicate the received list.
     *                   3. Compare the last entry.
     * @tc.expected      Twenty-five unique payloads are received.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationTwentyFiveUniquePayloads', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 25; index++) {
        client.sendString('payload-' + String(index));
      }
      const received: string[] = client.proxy?.stub.receivedTexts ?? [];
      expect(received.length).assertEqual(25);
      expect(uniqueStrings(received).length).assertEqual(25);
      expect(received[0]).assertEqual('payload-0');
      expect(received[24]).assertEqual('payload-24');
      expect(received[24].endsWith('-24')).assertTrue();
      expect(client.events.countOf('send-ok')).assertEqual(25);
      expect(client.toasts.length).assertEqual(26);
    });

    /**
     * @tc.name          payloadValidationRepeatedIdenticalPayload
     * @tc.desc          Repeating one payload keeps the received list ordered.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send the same payload four times.
     *                   2. Count the occurrences.
     *                   3. Deduplicate the list.
     * @tc.expected      The payload occurs four times but deduplicates to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationRepeatedIdenticalPayload', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const payload: string = 'repeat-me';
      for (let index = 0; index < 4; index++) {
        client.sendString(payload);
      }
      const received: string[] = client.proxy?.stub.receivedTexts ?? [];
      expect(received.length).assertEqual(4);
      expect(countOf(received, payload)).assertEqual(4);
      expect(uniqueStrings(received).length).assertEqual(1);
      expect(received[0]).assertEqual(payload);
      expect(received[3]).assertEqual(payload);
      expect(client.events.countOf('send-ok')).assertEqual(4);
      expect(client.proxy?.stub.handledCodes.length).assertEqual(4);
    });

    /**
     * @tc.name          payloadValidationDigitsOnly
     * @tc.desc          A digits-only payload is delivered unchanged.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a numeric payload.
     *                   2. Read the stub text.
     *                   3. Compare the value with its numeric form.
     * @tc.expected      The received text is the exact digit string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationDigitsOnly', 0, () => {
      const payload: string = '0123456789';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(received.length).assertEqual(10);
      expect(received.charAt(0)).assertEqual('0');
      expect(Number(received)).assertEqual(123456789);
      expect(received.startsWith('0')).assertTrue();
      expect(received === String(Number(received))).assertFalse();
      expect(textFingerprint(received)).assertEqual(textFingerprint(payload));
    });

    /**
     * @tc.name          payloadValidationSingleSpace
     * @tc.desc          A lone space payload is preserved rather than trimmed.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one space.
     *                   2. Read the stub text.
     *                   3. Compare lengths and trim.
     * @tc.expected      The received length is one and the trim is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSingleSpace', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString(' ');
      const received: string = client.proxy?.stub.receivedTexts[0] ?? 'missing';
      expect(received.length).assertEqual(1);
      expect(received).assertEqual(' ');
      expect(received.trim()).assertEqual('');
      expect(received.trim().length).assertEqual(0);
      expect(received.charCodeAt(0)).assertEqual(32);
      expect(received === REQUEST_PAYLOAD).assertFalse();
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationSingleCharacter
     * @tc.desc          A one character payload round trips without padding.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one letter.
     *                   2. Read the stub text.
     *                   3. Compare its size and content.
     * @tc.expected      The received text is one letter.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSingleCharacter', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('Q');
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received.length).assertEqual(1);
      expect(received).assertEqual('Q');
      expect(received.charCodeAt(0)).assertEqual(81);
      expect(received.toLowerCase()).assertEqual('q');
      expect(received === 'q').assertFalse();
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationTrailingSpace
     * @tc.desc          A trailing space is not lost in transit.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload ending with a space.
     *                   2. Read the stub text.
     *                   3. Compare with and without the space.
     * @tc.expected      The received text keeps its trailing space.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationTrailingSpace', 0, () => {
      const payload: string = 'tail ';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(received.length).assertEqual(5);
      expect(received.endsWith(' ')).assertTrue();
      expect(received.trim()).assertEqual('tail');
      expect(received.trim().length).assertEqual(4);
      expect(received.indexOf(' ')).assertEqual(4);
      expect(received === received.trim()).assertFalse();
      expect(client.proxy?.stub.receivedTexts[0].length).assertEqual(payload.length);
    });

    /**
     * @tc.name          payloadValidationMixedUnicodeSizes
     * @tc.desc          Mixed ASCII and unicode payloads keep independent lengths.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a mixed payload.
     *                   2. Read the stub text.
     *                   3. Count ASCII and unicode characters.
     * @tc.expected      The received text equals the mixed payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationMixedUnicodeSizes', 0, () => {
      const payload: string = 'ab你好😀';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(received.length).assertEqual(6);
      expect(received.charCodeAt(0)).assertEqual(97);
      expect(received.charCodeAt(2)).assertLarger(127);
      expect(received.charAt(1)).assertEqual('b');
      expect(textFingerprint(received)).assertEqual(textFingerprint(payload));
      expect(received === 'ab你好').assertFalse();
    });

    /**
     * @tc.name          payloadValidationLongUnicodePayload
     * @tc.desc          A five hundred character unicode payload stays intact.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Repeat a Chinese word to five hundred characters.
     *                   2. Send it.
     *                   3. Compare lengths and hashes.
     * @tc.expected      The stub receives the identical long text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationLongUnicodePayload', 0, () => {
      let payload: string = '';
      while (payload.length < 500) {
        payload = payload + '测试';
      }
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(payload.length).assertEqual(500);
      expect(received.length).assertEqual(500);
      expect(received).assertEqual(payload);
      expect(textFingerprint(received)).assertEqual(textFingerprint(payload));
      expect(received.startsWith('测试')).assertTrue();
      expect(received.endsWith('测试')).assertTrue();
      expect(received === REQUEST_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name          payloadValidationFingerprintDiffersByLength
     * @tc.desc          Padding a payload changes its fingerprint.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Hash a base payload and two padded variants.
     *                   2. Deduplicate the hashes.
     *                   3. Compare ordering.
     * @tc.expected      Three distinct positive hashes appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationFingerprintDiffersByLength', 0, () => {
      const base: number = textFingerprint('payload');
      const left: number = textFingerprint(' payload');
      const right: number = textFingerprint('payload ');
      expect(base === left).assertFalse();
      expect(base === right).assertFalse();
      expect(left === right).assertFalse();
      expect(uniqueStrings([String(base), String(left), String(right)]).length).assertEqual(3);
      expect(base).assertLarger(0);
      expect(left).assertLarger(0);
      expect(right).assertLarger(0);
      expect(textFingerprint('payload')).assertEqual(base);
    });

    /**
     * @tc.name          payloadValidationSameArrayLengthMismatch
     * @tc.desc          sameStringArray rejects lists of different lengths.
     * @tc.precondition  Two payload lists of different sizes exist.
     * @tc.steps         1. Compare a three item list with a two item list.
     *                   2. Compare a list with its own slice.
     *                   3. Compare empty lists.
     * @tc.expected      Different lengths fail while copies pass.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSameArrayLengthMismatch', 0, () => {
      const full: string[] = ['a', 'b', 'c'];
      const shorter: string[] = ['a', 'b'];
      const copy: string[] = ['a', 'b', 'c'];
      expect(sameStringArray(full, shorter)).assertFalse();
      expect(sameStringArray(shorter, full)).assertFalse();
      expect(sameStringArray(full, copy)).assertTrue();
      expect(sameStringArray([], [])).assertTrue();
      expect(sameStringArray(full, [])).assertFalse();
      expect(full.length - shorter.length).assertEqual(1);
      expect(countOf(full, 'b')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationNoProxyUnicodeEvent
     * @tc.desc          A unicode payload is recorded verbatim in the no-proxy event.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send a unicode payload without connecting.
     *                   2. Read the event detail.
     *                   3. Compare with the payload.
     * @tc.expected      The event detail contains the exact unicode payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationNoProxyUnicodeEvent', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const payload: string = '数据😀';
      client.sendString(payload);
      const event: string = client.events.last();
      expect(event).assertEqual('send-no-proxy:' + payload);
      expect(event.indexOf(payload)).assertEqual(14);
      expect(event.split('').length).assertLarger(payload.length);
      expect(event.startsWith('send-no-proxy:')).assertTrue();
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          payloadValidationEightKilobytePayload
     * @tc.desc          An eight thousand character payload survives intact.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Repeat a segment to eight thousand characters.
     *                   2. Send it.
     *                   3. Compare lengths and one middle character.
     * @tc.expected      The received payload matches the sent payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationEightKilobytePayload', 0, () => {
      let payload: string = '';
      while (payload.length < 8000) {
        payload = payload + '0123456789';
      }
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(payload.length).assertEqual(8000);
      expect(received.length).assertEqual(8000);
      expect(received).assertEqual(payload);
      expect(received.charAt(4000)).assertEqual('0');
      expect(received.substring(0, 10)).assertEqual('0123456789');
      expect(received === REQUEST_PAYLOAD).assertFalse();
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationOnlyNewlines
     * @tc.desc          A payload of three newlines keeps all of them.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three newlines.
     *                   2. Read the stub text.
     *                   3. Split the text on newlines.
     * @tc.expected      The text length is three and splits into four empty parts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationOnlyNewlines', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('\n\n\n');
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received.length).assertEqual(3);
      expect(received).assertEqual('\n\n\n');
      expect(received.split('\n').length).assertEqual(4);
      expect(countOf(received.split(''), '\n')).assertEqual(3);
      expect(received.trim()).assertEqual('');
      expect(received.charCodeAt(0)).assertEqual(10);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationPipeCharacterDelivered
     * @tc.desc          A payload containing a pipe is delivered despite the trace separator.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload with pipe characters.
     *                   2. Read the stub text.
     *                   3. Compare with the payload.
     * @tc.expected      The literal payload arrives unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationPipeCharacterDelivered', 0, () => {
      const payload: string = 'a|b|c';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(countOf(received.split(''), '|')).assertEqual(2);
      expect(received.split('|').length).assertEqual(3);
      expect(received.length).assertEqual(5);
      expect(received === 'a|b|c').assertTrue();
      expect(client.proxy?.stub.receivedTexts[0].split('|')[1]).assertEqual('b');
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationSequenceDuplicateValues
     * @tc.desc          Duplicate written values are kept independently.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Write the same payload twice.
     *                   2. Read both entries.
     *                   3. Confirm the size.
     * @tc.expected      Both entries are present with size two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceDuplicateValues', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('same');
      sequence.writeString('same');
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.values[0]).assertEqual(sequence.values[1]);
      expect(uniqueStrings(sequence.values).length).assertEqual(1);
      expect(sequence.readString()).assertEqual('same');
      expect(sequence.readString()).assertEqual('same');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.trace()).assertEqual('same|same#2');
    });

    /**
     * @tc.name          payloadValidationSequenceReclaimAfterRead
     * @tc.desc          Reclaiming after a read still clears the cursor and blocks reads.
     * @tc.precondition  A sequence was partially read.
     * @tc.steps         1. Write two values and read one.
     *                   2. Reclaim the sequence.
     *                   3. Attempt another read.
     * @tc.expected      The cursor resets and the next read returns empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceReclaimAfterRead', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      expect(sequence.readString()).assertEqual('one');
      expect(sequence.cursor).assertEqual(1);
      sequence.reclaim();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.values[0]).assertEqual('one');
      expect(sequence.size()).assertEqual(2);
    });

    /**
     * @tc.name          payloadValidationReplySequenceWriteCount
     * @tc.desc          A request result writes its reply once on construction.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload.
     *                   2. Inspect the reply sequence counters.
     *                   3. Read the reply.
     * @tc.expected      The reply sequence holds one write before reading.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationReplySequenceWriteCount', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const result = client.sendString('count-check');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.writeCount).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationReplySecondReadEmpty
     * @tc.desc          Reading a reply twice returns empty text the second time.
     * @tc.precondition  A successful send result exists.
     * @tc.steps         1. Read the reply once.
     *                   2. Read it again.
     *                   3. Compare the counters.
     * @tc.expected      The first read returns hello rpc and the second is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationReplySecondReadEmpty', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const result = client.sendString();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(1);
      expect(result.reply.cursor).assertEqual(1);
      expect(result.isSuccess()).assertTrue();
      expect(result.reply.size()).assertEqual(1);
      expect(result.errCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name          payloadValidationSessionsIsolated
     * @tc.desc          Three sessions keep their own payload histories.
     * @tc.precondition  Three connected sessions exist.
     * @tc.steps         1. Send a different payload on each session.
     *                   2. Read each received list.
     *                   3. Compare the lists.
     * @tc.expected      Each stub holds only its own payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSessionsIsolated', 0, () => {
      const first: ConnectionModel = createConnectedSession('r1');
      const second: ConnectionModel = createConnectedSession('r2');
      const third: ConnectionModel = createConnectedSession('r3');
      first.sendString('x');
      second.sendString('y');
      third.sendString('z');
      expect(first.proxy?.stub.receivedTexts[0]).assertEqual('x');
      expect(second.proxy?.stub.receivedTexts[0]).assertEqual('y');
      expect(third.proxy?.stub.receivedTexts[0]).assertEqual('z');
      expect(first.sendString('again').readReply()).assertEqual('r1');
      expect(second.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(third.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(first.proxy?.stub.receivedTexts.length).assertEqual(2);
    });

    /**
     * @tc.name          payloadValidationHundredSpaces
     * @tc.desc          A payload of one hundred spaces keeps its length.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Build one hundred spaces.
     *                   2. Send it.
     *                   3. Compare length and trimmed result.
     * @tc.expected      The received length is one hundred and trim empties it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationHundredSpaces', 0, () => {
      let payload: string = '';
      while (payload.length < 100) {
        payload = payload + ' ';
      }
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(payload.length).assertEqual(100);
      expect(received.length).assertEqual(100);
      expect(received).assertEqual(payload);
      expect(received.trim()).assertEqual('');
      expect(countOf(received.split(''), ' ')).assertEqual(100);
      expect(received.split(' ').length).assertEqual(101);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationRepeatedEmojiLength
     * @tc.desc          Ten emoji occupy twenty code units.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Repeat the emoji ten times.
     *                   2. Send and receive it.
     *                   3. Compare the unit length.
     * @tc.expected      The payload length is twenty and delivery is exact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationRepeatedEmojiLength', 0, () => {
      let payload: string = '';
      for (let index = 0; index < 10; index++) {
        payload = payload + '😀';
      }
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(payload.length).assertEqual(20);
      expect(received.length).assertEqual(20);
      expect(received).assertEqual(payload);
      expect(received.charCodeAt(0)).assertLarger(55295);
      expect(received.charCodeAt(19)).assertLarger(56319);
      expect(textFingerprint(received)).assertEqual(textFingerprint(payload));
      expect(received === REQUEST_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name          payloadValidationEventUsesReplyNotPayload
     * @tc.desc          The success event records the reply text, not the request payload.
     * @tc.precondition  A session with a distinctive reply exists.
     * @tc.steps         1. Send a distinctive payload.
     *                   2. Read the last event.
     *                   3. Search for the request text.
     * @tc.expected      The event detail holds the reply and not the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationEventUsesReplyNotPayload', 0, () => {
      const client: ConnectionModel = createConnectedSession('answer-42');
      client.sendString('question-99');
      expect(client.events.last()).assertEqual('send-ok:answer-42');
      expect(client.events.last().indexOf('answer-42')).assertLarger(0);
      expect(client.events.last().indexOf('question-99')).assertLess(0);
      expect(client.events.last().startsWith('send-ok:')).assertTrue();
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('question-99');
      expect(client.logs.contains('reply answer-42')).assertTrue();
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          payloadValidationStubGrowthPerSuccess
     * @tc.desc          The stub received list grows only on successful requests.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send two successes.
     *                   2. Force a failure and send.
     *                   3. Compare list lengths.
     * @tc.expected      Two texts remain after the failed third send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationStubGrowthPerSuccess', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('first');
      client.sendString('second');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(2);
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('third');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(2);
      expect(client.proxy?.stub.receivedTexts[1]).assertEqual('second');
      expect(client.proxy?.stub.handledCodes.length).assertEqual(2);
      expect(client.proxy?.sendCalls).assertEqual(3);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          payloadValidationCarriageReturn
     * @tc.desc          A carriage return payload keeps its code unit.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload with carriage returns.
     *                   2. Read the stub text.
     *                   3. Count the code units.
     * @tc.expected      Two carriage returns are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationCarriageReturn', 0, () => {
      const payload: string = 'a\r\nb\r';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(received.length).assertEqual(5);
      expect(countOf(received.split(''), '\r')).assertEqual(2);
      expect(countOf(received.split(''), '\n')).assertEqual(1);
      expect(received.charCodeAt(1)).assertEqual(13);
      expect(received.charCodeAt(2)).assertEqual(10);
      expect(received.split('\r').length).assertEqual(3);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationAlphabetSequence
     * @tc.desc          A payload of the alphabet keeps all twenty-six letters.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send the lowercase alphabet.
     *                   2. Read the stub text.
     *                   3. Compare the letters and length.
     * @tc.expected      The received text is the full alphabet.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationAlphabetSequence', 0, () => {
      const payload: string = 'abcdefghijklmnopqrstuvwxyz';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received.length).assertEqual(26);
      expect(received).assertEqual(payload);
      expect(received.charAt(0)).assertEqual('a');
      expect(received.charAt(25)).assertEqual('z');
      expect(received.indexOf('m')).assertEqual(12);
      expect(uniqueStrings(received.split('')).length).assertEqual(26);
      expect(received === received.toUpperCase()).assertFalse();
    });

    /**
     * @tc.name          payloadValidationPermutationFingerprints
     * @tc.desc          Permutations of the same letters hash differently.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Hash three permutations.
     *                   2. Deduplicate the hashes.
     *                   3. Compare with the sorted form.
     * @tc.expected      All three hashes are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationPermutationFingerprints', 0, () => {
      const first: number = textFingerprint('abc');
      const second: number = textFingerprint('acb');
      const third: number = textFingerprint('cba');
      expect(first === second).assertFalse();
      expect(second === third).assertFalse();
      expect(first === third).assertFalse();
      expect(uniqueStrings([String(first), String(second), String(third)]).length).assertEqual(3);
      expect(first).assertEqual(textFingerprint('abc'));
      expect(first).assertLarger(0);
      expect(third).assertLarger(0);
      expect(sameStringArray(['a', 'b', 'c'], ['c', 'b', 'a'])).assertFalse();
    });

    /**
     * @tc.name          payloadValidationSequenceEmptyTransitions
     * @tc.desc          isEmpty flips only when the first value is written.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Check isEmpty on the fresh sequence.
     *                   2. Write one value.
     *                   3. Reclaim and check again.
     * @tc.expected      isEmpty is true, then false, then true only by size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceEmptyTransitions', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      expect(sequence.isEmpty()).assertTrue();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
      sequence.writeString('');
      expect(sequence.isEmpty()).assertFalse();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.trace()).assertEqual('#0');
      sequence.reclaim();
      expect(sequence.isEmpty()).assertFalse();
      expect(sequence.values.length).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationEmptyTwice
     * @tc.desc          Two empty payloads both succeed and are both received.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send an empty payload twice.
     *                   2. Count the received entries.
     *                   3. Compare the lengths.
     * @tc.expected      Two empty texts are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationEmptyTwice', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('');
      client.sendString('');
      const received: string[] = client.proxy?.stub.receivedTexts ?? [];
      expect(received.length).assertEqual(2);
      expect(received[0]).assertEqual('');
      expect(received[1]).assertEqual('');
      expect(received[0].length).assertEqual(0);
      expect(countOf(received, '')).assertEqual(2);
      expect(uniqueStrings(received).length).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          payloadValidationTabOnly
     * @tc.desc          A tab-only payload keeps one tab character.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a single tab.
     *                   2. Read the stub text.
     *                   3. Compare the code unit.
     * @tc.expected      The received text is one tab.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationTabOnly', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('\t');
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received.length).assertEqual(1);
      expect(received).assertEqual('\t');
      expect(received.charCodeAt(0)).assertEqual(9);
      expect(received.trim()).assertEqual('');
      expect(received === ' ').assertFalse();
      expect(textFingerprint(received)).assertEqual(textFingerprint('\t'));
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationHashCharacter
     * @tc.desc          A hash character payload does not disturb the event trace.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload with a hash.
     *                   2. Read the stub text.
     *                   3. Compare the event trace tail.
     * @tc.expected      The payload arrives unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationHashCharacter', 0, () => {
      const payload: string = 'tag#42';
      const client: ConnectionModel = createConnectedSession();
      client.sendString(payload);
      const received: string = client.proxy?.stub.receivedTexts[0] ?? '';
      expect(received).assertEqual(payload);
      expect(received.indexOf('#')).assertEqual(3);
      expect(countOf(received.split(''), '#')).assertEqual(1);
      expect(received.length).assertEqual(6);
      expect(received.endsWith('42')).assertTrue();
      expect(client.events.last()).assertEqual('send-ok:hello rpc');
      expect(client.events.last().indexOf('#')).assertLess(0);
    });

    /**
     * @tc.name          payloadValidationTwoKilobyteFingerprint
     * @tc.desc          A two thousand character payload has a stable distinct hash.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Build a two thousand character payload.
     *                   2. Hash it twice.
     *                   3. Compare with a one character hash.
     * @tc.expected      The long hash is stable and differs from the short one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationTwoKilobyteFingerprint', 0, () => {
      let payload: string = '';
      while (payload.length < 2000) {
        payload = payload + 'xy';
      }
      const first: number = textFingerprint(payload);
      const second: number = textFingerprint(payload);
      expect(payload.length).assertEqual(2000);
      expect(first).assertEqual(second);
      expect(first === textFingerprint('x')).assertFalse();
      expect(first).assertLarger(0);
      expect(first).assertLess(1000003);
      expect(uniqueStrings([String(first), String(textFingerprint('x'))]).length).assertEqual(2);
      expect(payload.startsWith('xyxy')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationLiteralCopyEquality
     * @tc.desc          A hand-built request payload equals the exported constant.
     * @tc.precondition  The request constant is exported.
     * @tc.steps         1. Build the payload from two words.
     *                   2. Compare with the constant.
     *                   3. Compare fingerprints.
     * @tc.expected      Both forms are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadValidationLiteralCopyEquality', 0, () => {
      const built: string = 'hello' + ' ' + 'world';
      expect(built).assertEqual(REQUEST_PAYLOAD);
      expect(built.length).assertEqual(REQUEST_PAYLOAD.length);
      expect(built === REQUEST_PAYLOAD).assertTrue();
      expect(textFingerprint(built)).assertEqual(textFingerprint(REQUEST_PAYLOAD));
      expect(built.split(' ').length).assertEqual(2);
      expect(built.indexOf(' ')).assertEqual(REQUEST_PAYLOAD.indexOf(' '));
      expect(built.endsWith('world')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationVariableReuse
     * @tc.desc          Reusing one payload variable five times sends it five times.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Declare one payload variable.
     *                   2. Send it five times.
     *                   3. Count the received copies.
     * @tc.expected      Five identical payloads are received.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationVariableReuse', 0, () => {
      const payload: string = 'shared-value';
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 5; index++) {
        client.sendString(payload);
      }
      const received: string[] = client.proxy?.stub.receivedTexts ?? [];
      expect(received.length).assertEqual(5);
      expect(countOf(received, payload)).assertEqual(5);
      expect(payload).assertEqual('shared-value');
      expect(payload.length).assertEqual(12);
      expect(uniqueStrings(received).length).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(5);
      expect(client.proxy?.sendCalls).assertEqual(5);
    });

    /**
     * @tc.name          payloadValidationReclaimRetainsValues
     * @tc.desc          Reclaim marks the sequence but leaves its values and size.
     * @tc.precondition  A sequence with two values exists.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Read values and size.
     *                   3. Compare the trace.
     * @tc.expected      The values remain readable as data while reads return empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationReclaimRetainsValues', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('keep');
      sequence.writeString('data');
      sequence.reclaim();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.values[0]).assertEqual('keep');
      expect(sequence.values[1]).assertEqual('data');
      expect(sequence.trace()).assertEqual('keep|data#0');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.isEmpty()).assertFalse();
      expect(sequence.readCount).assertEqual(0);
    });

    /**
     * @tc.name          payloadValidationEmptyNoProxyEvent
     * @tc.desc          An empty payload records an event ending with the colon.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send an empty payload without connecting.
     *                   2. Read the event.
     *                   3. Compare with the prefix.
     * @tc.expected      The event is exactly the prefix with no detail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationEmptyNoProxyEvent', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.sendString('');
      expect(client.events.last()).assertEqual('send-no-proxy:');
      expect(client.events.last().length).assertEqual(14);
      expect(client.events.last().endsWith(':')).assertTrue();
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.events.size()).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual('disconnected');
    });
    /**
     * @tc.name          payloadValidationReplyEchoOfPayload
     * @tc.desc          A session whose reply equals the payload returns the same text.
     * @tc.precondition  A session with an echo reply exists.
     * @tc.steps         1. Create a session replying hello world.
     *                   2. Send hello world.
     *                   3. Compare reply and payload.
     * @tc.expected      The reply equals the payload and the send succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationReplyEchoOfPayload', 0, () => {
      const client: ConnectionModel = createConnectedSession(REQUEST_PAYLOAD);
      const result = client.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REQUEST_PAYLOAD);
      expect(result.readReply() === '').assertTrue();
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.events.last()).assertEqual('send-ok:' + REQUEST_PAYLOAD);
      expect(client.logs.contains('reply hello world')).assertTrue();
      expect(countOf(client.toasts, 'sendRequest success')).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationPayloadCountsAcrossSessions
     * @tc.desc          Send counts are tracked per session, not globally.
     * @tc.precondition  Two connected sessions exist.
     * @tc.steps         1. Send twice on the first and once on the second.
     *                   2. Compare the stub histories.
     *                   3. Check the send call counters.
     * @tc.expected      The counters stay independent per proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationPayloadCountsAcrossSessions', 0, () => {
      const first: ConnectionModel = createConnectedSession();
      const second: ConnectionModel = createConnectedSession();
      first.sendString('a');
      first.sendString('b');
      second.sendString('c');
      expect(first.proxy?.sendCalls).assertEqual(2);
      expect(second.proxy?.sendCalls).assertEqual(1);
      expect(first.proxy?.stub.receivedTexts.length).assertEqual(2);
      expect(second.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(second.proxy?.stub.receivedTexts[0]).assertEqual('c');
      expect(first.events.countOf('send-ok')).assertEqual(2);
      expect(second.events.countOf('send-ok')).assertEqual(1);
      expect(second.toasts.length).assertEqual(2);
    });
  });
}
