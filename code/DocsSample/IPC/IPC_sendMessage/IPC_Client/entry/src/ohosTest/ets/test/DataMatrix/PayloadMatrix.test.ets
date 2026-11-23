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
 * PayloadMatrix: data matrix over MessageSequence string payloads.
 *
 * The production client always writes one string and reads one string. This
 * suite sweeps representative payload shapes through MessageSequenceModel and
 * through a full sendString round trip, asserting that the reply channel is
 * unaffected by the request content.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  SEND_SUCCESS_TOAST,
  ERROR_NONE,
  ERROR_SEND,
  MessageSequenceModel,
  MessageOptionModel,
  RemoteStubModel,
  RemoteProxyModel,
  ConnectionModel,
  createConnectedSession,
  joined,
  uniqueStrings,
  countOf,
  textFingerprint
} from '../Shared/SharedDriver';

const MATRIX_PAYLOADS: string[] = [
  '',
  ' ',
  'hello world',
  'HELLO WORLD',
  'line1\nline2',
  'tab\tseparated',
  '连接成功',
  '{"code":1,"text":"hello world"}',
  '0123456789',
  'a'
];

function roundTrip(payload: string): string {
  const sequence = MessageSequenceModel.create();
  sequence.writeString(payload);
  return sequence.readString();
}

function repeatText(unit: string, times: number): string {
  let output = '';
  for (let index = 0; index < times; index++) {
    output = output + unit;
  }
  return output;
}

function lineCountForMatrix(value: string): number {
  let total = 1;
  for (let index = 0; index < value.length; index++) {
    if (value.charCodeAt(index) === 10) {
      total = total + 1;
    }
  }
  return total;
}

function lengthHistogram(values: string[]): number[] {  const result: number[] = [];
  for (let index = 0; index < values.length; index++) {
    result.push(values[index].length);
  }
  return result;
}

function matrixFingerprint(): number {
  return textFingerprint(joined(MATRIX_PAYLOADS, '#'));
}

export default function payloadMatrix(): void {
  describe('PayloadMatrix', () => {
    beforeAll(() => {
      logSuite('PayloadMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PayloadMatrix', 'end');
    });

    /**
     * @tc.name          payloadMatrixEmptyStringRoundTrips
     * @tc.desc          An empty string is a valid sequence value.
     * @tc.precondition  A fresh MessageSequenceModel is available.
     * @tc.steps         1. Write the empty string. 2. Read it back.
     *                   3. Inspect counters and size.
     * @tc.expected      The write succeeds and the read yields the empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEmptyStringRoundTrips', 0, () => {
      logStep('payloadMatrix', 'empty string');
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString('')).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.isEmpty()).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixSingleSpaceIsPreserved
     * @tc.desc          A payload of one space survives read and write.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Round trip one space. 2. Round trip three spaces.
     *                   3. Compare lengths.
     * @tc.expected      Whitespace is preserved exactly, not trimmed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixSingleSpaceIsPreserved', 0, () => {
      logStep('payloadMatrix', 'single space');
      expect(roundTrip(' ')).assertEqual(' ');
      expect(roundTrip('   ')).assertEqual('   ');
      expect(roundTrip(' ').length).assertEqual(1);
      expect(roundTrip('   ').length).assertEqual(3);
      expect(roundTrip('  hello  ')).assertEqual('  hello  ');
      expect(roundTrip('  hello  ').startsWith(' ')).assertTrue();
      expect(roundTrip('  hello  ').endsWith(' ')).assertTrue();
    });

    /**
     * @tc.name          payloadMatrixSampleLiteralRoundTrips
     * @tc.desc          The production request literal survives a round trip.
     * @tc.precondition  REQUEST_PAYLOAD is exported by the driver.
     * @tc.steps         1. Round trip REQUEST_PAYLOAD. 2. Compare to the literal.
     *                   3. Repeat through a full send.
     * @tc.expected      The literal 'hello world' is unchanged on both paths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixSampleLiteralRoundTrips', 0, () => {
      logStep('payloadMatrix', 'sample literal');
      const client = createConnectedSession();
      const result = client.sendString(REQUEST_PAYLOAD);
      expect(roundTrip(REQUEST_PAYLOAD)).assertEqual('hello world');
      expect(roundTrip(REQUEST_PAYLOAD).length).assertEqual(11);
      expect(roundTrip(REQUEST_PAYLOAD)).assertEqual(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual('hello world');
    });

    /**
     * @tc.name          payloadMatrixUnicodePayloadRoundTrips
     * @tc.desc          A Chinese payload keeps its code units across the model.
     * @tc.precondition  The matrix includes a Chinese phrase.
     * @tc.steps         1. Round trip the phrase. 2. Compare code points.
     *                   3. Send it through a live session.
     * @tc.expected      All four characters survive unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixUnicodePayloadRoundTrips', 0, () => {
      logStep('payloadMatrix', 'unicode payload');
      const value = '连接成功';
      const client = createConnectedSession();
      const result = client.sendString(value);
      expect(roundTrip(value)).assertEqual(value);
      expect(roundTrip(value).length).assertEqual(4);
      expect(roundTrip(value).charCodeAt(0) > 127).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual(value);
      expect(client.lastToast().length > 0).assertTrue();
    });

    /**
     * @tc.name          payloadMatrixLongPayloadRoundTrips
     * @tc.desc          A four thousand char payload is not truncated.
     * @tc.precondition  The repeat helper can build long text.
     * @tc.steps         1. Build 4000 chars. 2. Round trip them.
     *                   3. Send them through a session.
     * @tc.expected      The echoed length equals the written length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongPayloadRoundTrips', 0, () => {
      logStep('payloadMatrix', 'long payload');
      const long = repeatText('0123456789', 400);
      const client = createConnectedSession();
      const result = client.sendString(long);
      expect(long.length).assertEqual(4000);
      expect(roundTrip(long).length).assertEqual(4000);
      expect(roundTrip(long)).assertEqual(long);
      expect(roundTrip(long).substring(0, 10)).assertEqual('0123456789');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0].length).assertEqual(4000);
    });

    /**
     * @tc.name          payloadMatrixControlCharactersRoundTrip
     * @tc.desc          Newlines and tabs are data, not protocol separators.
     * @tc.precondition  The matrix includes newline and tab payloads.
     * @tc.steps         1. Round trip a newline payload. 2. Round trip a tab
     *                   payload. 3. Confirm the values differ.
     * @tc.expected      Control characters survive inside the string value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixControlCharactersRoundTrip', 0, () => {
      logStep('payloadMatrix', 'control characters');
      const newline = 'line1\nline2';
      const tab = 'tab\tseparated';
      expect(roundTrip(newline)).assertEqual(newline);
      expect(roundTrip(tab)).assertEqual(tab);
      expect(roundTrip(newline).indexOf('\n')).assertEqual(5);
      expect(roundTrip(tab).indexOf('\t')).assertEqual(3);
      expect(roundTrip(newline)).assertEqual('line1\nline2');
      expect(roundTrip(newline) === roundTrip(tab)).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixDistinctPayloadsStayDistinct
     * @tc.desc          Distinct matrix rows do not collapse to one reply.
     * @tc.precondition  A connected session can serve many sends.
     * @tc.steps         1. Send five distinct payloads. 2. Read each reply.
     *                   3. Compare the stub history.
     * @tc.expected      Every reply is the stub reply and all requests are kept.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixDistinctPayloadsStayDistinct', 0, () => {
      logStep('payloadMatrix', 'distinct payloads');
      const client = createConnectedSession();
      const sent: string[] = ['alpha', 'beta', 'gamma', 'delta', 'epsilon'];
      const replies: string[] = [];
      for (let index = 0; index < sent.length; index++) {
        const result = client.sendString(sent[index]);
        replies.push(String(result.reply.size()));
        expect(result.errCode).assertEqual(ERROR_NONE);
      }
      const proxy = client.proxy as RemoteProxyModel;
      expect(proxy.stub.receivedTexts.length).assertEqual(5);
      expect(uniqueStrings(proxy.stub.receivedTexts).length).assertEqual(5);
      expect(joined(replies, ',')).assertEqual('1,1,1,1,1');
      expect(countOf(replies, '1')).assertEqual(5);
      expect(countOf(client.logs.lines, 'INFO reply ' + REPLY_PAYLOAD)).assertEqual(5);
      expect(proxy.requests.length).assertEqual(5);
      expect(proxy.requests[4]).assertEqual(REQUEST_CODE);
    });

    /**
     * @tc.name          payloadMatrixUppercaseAndLowercaseDiffer
     * @tc.desc          Case changes are data changes, not normalised away.
     * @tc.precondition  The matrix includes both case forms.
     * @tc.steps         1. Round trip both forms. 2. Compare them.
     *                   3. Compare fingerprint and unique count.
     * @tc.expected      The two payloads keep the same length but differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixUppercaseAndLowercaseDiffer', 0, () => {
      logStep('payloadMatrix', 'case forms');
      const lower = roundTrip('hello world');
      const upper = roundTrip('HELLO WORLD');
      expect(lower).assertEqual('hello world');
      expect(upper).assertEqual('HELLO WORLD');
      expect(lower.length).assertEqual(upper.length);
      expect(lower === upper).assertFalse();
      expect(uniqueStrings([lower, upper]).length).assertEqual(2);
      expect(textFingerprint(lower) === textFingerprint(upper)).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixJsonTextRoundTrips
     * @tc.desc          A JSON shaped string is treated as opaque text.
     * @tc.precondition  The matrix includes a JSON row.
     * @tc.steps         1. Round trip the JSON row. 2. Check its braces and
     *                   digits. 3. Confirm it is one sequence value.
     * @tc.expected      Braces and digits survive and no parsing occurs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixJsonTextRoundTrips', 0, () => {
      logStep('payloadMatrix', 'json text');
      const json = '{"code":1,"text":"hello world"}';
      const echoed = roundTrip(json);
      expect(echoed).assertEqual(json);
      expect(echoed.startsWith('{')).assertTrue();
      expect(echoed.endsWith('}')).assertTrue();
      expect(echoed.indexOf('"code":1') > 0).assertTrue();
      expect(echoed.length).assertEqual(31);
      expect(countOf(MATRIX_PAYLOADS, json)).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixNumericStringKeepsLeadingZero
     * @tc.desc          A digit payload is not coerced to a number.
     * @tc.precondition  The matrix includes a ten digit string.
     * @tc.steps         1. Round trip the digits. 2. Check the leading zero.
     *                   3. Compare to a numeric conversion.
     * @tc.expected      The leading zero is preserved in the echoed string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixNumericStringKeepsLeadingZero', 0, () => {
      logStep('payloadMatrix', 'numeric string');
      const digits = '0123456789';
      const echoed = roundTrip(digits);
      expect(echoed).assertEqual(digits);
      expect(echoed.indexOf('0')).assertEqual(0);
      expect(echoed.length).assertEqual(10);
      expect(String(Number(digits))).assertEqual('123456789');
      expect(echoed === String(Number(digits))).assertFalse();
      expect(echoed.charAt(9)).assertEqual('9');
    });

    /**
     * @tc.name          payloadMatrixPipeAndHashSurviveRoundTrip
     * @tc.desc          Trace separators inside a payload are ordinary data.
     * @tc.precondition  MessageSequence.trace uses pipe and hash internally.
     * @tc.steps         1. Round trip a payload with both separators. 2. Build
     *                   a sequence and read its trace. 3. Read the value back.
     * @tc.expected      The value is intact even though the trace is ambiguous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixPipeAndHashSurviveRoundTrip', 0, () => {
      logStep('payloadMatrix', 'pipe and hash');
      const value = 'a|b#c';
      const sequence = MessageSequenceModel.create();
      sequence.writeString(value);
      expect(roundTrip(value)).assertEqual(value);
      expect(sequence.trace()).assertEqual('a|b#c#0');
      expect(sequence.readString()).assertEqual(value);
      expect(sequence.trace()).assertEqual('a|b#c#1');
      expect(value.split('|').length).assertEqual(2);
      expect(value.split('#').length).assertEqual(2);
      expect(value.length).assertEqual(5);
    });

    /**
     * @tc.name          payloadMatrixQuotesAndBackslashesRoundTrip
     * @tc.desc          Quotes and backslashes are not escaped by the model.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Round trip a quote payload. 2. Round trip a backslash
     *                   payload. 3. Compare counts and lengths.
     * @tc.expected      Both payloads are echoed byte for byte.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixQuotesAndBackslashesRoundTrip', 0, () => {
      logStep('payloadMatrix', 'quotes and backslashes');
      const quoted = '"double" and \'single\'';
      const slashed = 'C:\\temp\\ipc';
      expect(roundTrip(quoted)).assertEqual(quoted);
      expect(roundTrip(slashed)).assertEqual(slashed);
      expect(countOf(quoted.split(''), '"')).assertEqual(2);
      expect(countOf(slashed.split(''), '\\')).assertEqual(2);
      expect(roundTrip(quoted).length).assertEqual(quoted.length);
      expect(roundTrip(slashed).indexOf('\\')).assertEqual(2);
      expect(roundTrip(slashed).endsWith('ipc')).assertTrue();
    });

    /**
     * @tc.name          payloadMatrixSingleCharacterRoundTrips
     * @tc.desc          A one character payload is distinct from an empty one.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Round trip a single letter. 2. Round trip a single
     *                   space. 3. Compare them to the empty string.
     * @tc.expected      Each single char value is preserved and distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixSingleCharacterRoundTrips', 0, () => {
      logStep('payloadMatrix', 'single character');
      expect(roundTrip('a')).assertEqual('a');
      expect(roundTrip(' ')).assertEqual(' ');
      expect(roundTrip('0')).assertEqual('0');
      expect(roundTrip('a') === roundTrip('')).assertFalse();
      expect(roundTrip(' ').length).assertEqual(1);
      expect(uniqueStrings([roundTrip('a'), roundTrip(' '), roundTrip('')]).length).assertEqual(3);
      expect(roundTrip('0').charCodeAt(0)).assertEqual(48);
    });

    /**
     * @tc.name          payloadMatrixEmojiKeepsSurrogatePair
     * @tc.desc          A four byte emoji keeps both UTF-16 code units.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Round trip an emoji. 2. Check its length and code
     *                   units. 3. Compare it to a plain letter.
     * @tc.expected      The emoji length is two and both units are preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixEmojiKeepsSurrogatePair', 0, () => {
      logStep('payloadMatrix', 'emoji');
      const emoji = '😀';
      const echoed = roundTrip(emoji);
      expect(emoji.length).assertEqual(2);
      expect(echoed).assertEqual(emoji);
      expect(echoed.length).assertEqual(2);
      expect(echoed.charCodeAt(0) > 55295).assertTrue();
      expect(echoed.charCodeAt(1) > 56319).assertTrue();
      expect(echoed === 'a').assertFalse();
      expect(textFingerprint(echoed)).assertEqual(textFingerprint(emoji));
    });

    /**
     * @tc.name          payloadMatrixNulCharacterRoundTrips
     * @tc.desc          An embedded NUL does not terminate the string value.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Build a value with one NUL. 2. Round trip it.
     *                   3. Check the NUL position and the trailing chars.
     * @tc.expected      The value keeps its length and the NUL stays inside.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixNulCharacterRoundTrips', 0, () => {
      logStep('payloadMatrix', 'embedded nul');
      const value = 'a\u0000b';
      const echoed = roundTrip(value);
      expect(value.length).assertEqual(3);
      expect(echoed.length).assertEqual(3);
      expect(echoed.charAt(0)).assertEqual('a');
      expect(echoed.charCodeAt(1)).assertEqual(0);
      expect(echoed.charAt(2)).assertEqual('b');
      expect(echoed).assertEqual(value);
      expect(echoed.indexOf('\u0000')).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixRowsAreUnique
     * @tc.desc          The declared matrix rows are distinct and non repeating.
     * @tc.precondition  MATRIX_PAYLOADS is declared in this suite.
     * @tc.steps         1. Count the rows. 2. De-duplicate them. 3. Count the
     *                   empty rows.
     * @tc.expected      Ten rows, ten unique values and one empty row.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRowsAreUnique', 0, () => {
      logStep('payloadMatrix', 'rows unique');
      expect(MATRIX_PAYLOADS.length).assertEqual(10);
      expect(uniqueStrings(MATRIX_PAYLOADS).length).assertEqual(10);
      expect(countOf(MATRIX_PAYLOADS, '')).assertEqual(1);
      expect(countOf(MATRIX_PAYLOADS, 'hello world')).assertEqual(1);
      expect(lengthHistogram(MATRIX_PAYLOADS)[0]).assertEqual(0);
      expect(lengthHistogram(MATRIX_PAYLOADS).length).assertEqual(10);
      expect(matrixFingerprint()).assertEqual(textFingerprint(joined(MATRIX_PAYLOADS, '#')));
    });

    /**
     * @tc.name          payloadMatrixRewindAllowsReread
     * @tc.desc          Rewinding a sequence resets the read cursor.
     * @tc.precondition  A sequence holds two values.
     * @tc.steps         1. Read one value. 2. Rewind. 3. Read the first again.
     * @tc.expected      The cursor returns to zero and the reads repeat.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRewindAllowsReread', 0, () => {
      logStep('payloadMatrix', 'rewind');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('beta');
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.cursor).assertEqual(1);
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.readString()).assertEqual('beta');
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.trace()).assertEqual('alpha|beta#2');
    });

    /**
     * @tc.name          payloadMatrixReadPastEndReturnsEmpty
     * @tc.desc          Reading beyond the last value yields an empty string.
     * @tc.precondition  A fresh empty sequence exists.
     * @tc.steps         1. Read once. 2. Inspect the cursor and read counter.
     *                   3. Write and read twice.
     * @tc.expected      Out of range reads return empty and advance no counter.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixReadPastEndReturnsEmpty', 0, () => {
      logStep('payloadMatrix', 'read past end');
      const sequence = MessageSequenceModel.create();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.isEmpty()).assertTrue();
      sequence.writeString('only');
      expect(sequence.readString()).assertEqual('only');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixReclaimBlocksTraffic
     * @tc.desc          A reclaimed sequence refuses writes and reads.
     * @tc.precondition  A sequence holds one value.
     * @tc.steps         1. Reclaim it. 2. Attempt a write. 3. Attempt a read.
     * @tc.expected      Writes return false, reads return empty and the flag is set.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixReclaimBlocksTraffic', 0, () => {
      logStep('payloadMatrix', 'reclaim');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('kept');
      sequence.reclaim();
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.writeString('rejected')).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.size()).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.readCount).assertEqual(0);
    });

    /**
     * @tc.name          payloadMatrixMultipleValuesKeepOrder
     * @tc.desc          Values are read back in write order.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Write three values. 2. Read them. 3. Join the reads.
     * @tc.expected      The read order is alpha, beta, gamma.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixMultipleValuesKeepOrder', 0, () => {
      logStep('payloadMatrix', 'multiple values');
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString('alpha')).assertTrue();
      expect(sequence.writeString('beta')).assertTrue();
      expect(sequence.writeString('gamma')).assertTrue();
      const reads: string[] = [];
      reads.push(sequence.readString());
      reads.push(sequence.readString());
      reads.push(sequence.readString());
      expect(joined(reads, '>')).assertEqual('alpha>beta>gamma');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixTraceShowsCursor
     * @tc.desc          The sequence trace reports values and cursor position.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Write two values. 2. Read one. 3. Compare traces.
     * @tc.expected      The cursor moves from zero to one in the trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceShowsCursor', 0, () => {
      logStep('payloadMatrix', 'trace cursor');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      expect(sequence.trace()).assertEqual('a|b#0');
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.trace()).assertEqual('a|b#1');
      sequence.readString();
      expect(sequence.trace()).assertEqual('a|b#2');
      expect(sequence.trace().endsWith('#2')).assertTrue();
      expect(sequence.trace().split('|').length).assertEqual(2);
      expect(textFingerprint(sequence.trace())).assertEqual(textFingerprint('a|b#2'));
    });

    /**
     * @tc.name          payloadMatrixCrlfPayloadRoundTrips
     * @tc.desc          A CRLF pair inside a payload is preserved.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Build a CRLF payload. 2. Round trip it. 3. Compare the
     *                   embedded codes.
     * @tc.expected      CR and LF both survive with their original codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixCrlfPayloadRoundTrips', 0, () => {
      logStep('payloadMatrix', 'crlf payload');
      const value = 'a\r\nb';
      const echoed = roundTrip(value);
      expect(echoed).assertEqual(value);
      expect(echoed.length).assertEqual(4);
      expect(echoed.charCodeAt(1)).assertEqual(13);
      expect(echoed.charCodeAt(2)).assertEqual(10);
      expect(echoed.charAt(0)).assertEqual('a');
      expect(echoed.charAt(3)).assertEqual('b');
      expect(lineCountForMatrix(echoed)).assertEqual(2);
    });

    /**
     * @tc.name          payloadMatrixBomPayloadRoundTrips
     * @tc.desc          A leading byte order mark is kept as a normal code unit.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Prefix a payload with a BOM. 2. Round trip it. 3. Check
     *                   the first code unit.
     * @tc.expected      The BOM survives and the total length grows by one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixBomPayloadRoundTrips', 0, () => {
      logStep('payloadMatrix', 'bom payload');
      const plain = 'hello';
      const bom = '\uFEFF' + plain;
      const echoed = roundTrip(bom);
      expect(plain.length).assertEqual(5);
      expect(bom.length).assertEqual(6);
      expect(echoed.length).assertEqual(6);
      expect(echoed.charCodeAt(0)).assertEqual(65279);
      expect(echoed.substring(1)).assertEqual('hello');
      expect(echoed).assertEqual(bom);
      expect(echoed === plain).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixMixedUnicodeAsciiRoundTrips
     * @tc.desc          Mixed scripts keep their relative order and spacing.
     * @tc.precondition  The round trip helper is defined.
     * @tc.steps         1. Round trip a mixed payload. 2. Check its words and
     *                   spaces. 3. Compare fingerprints.
     * @tc.expected      The mixed payload is unchanged on the request path.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixMixedUnicodeAsciiRoundTrips', 0, () => {
      logStep('payloadMatrix', 'mixed unicode');
      const value = 'hello 世界 123';
      const echoed = roundTrip(value);
      expect(echoed).assertEqual(value);
      expect(echoed.startsWith('hello ')).assertTrue();
      expect(echoed.endsWith(' 123')).assertTrue();
      expect(echoed.indexOf('世界')).assertEqual(6);
      expect(echoed.split(' ').length).assertEqual(3);
      expect(echoed.length).assertEqual(12);
      expect(textFingerprint(echoed)).assertEqual(textFingerprint(value));
    });

    /**
     * @tc.name          payloadMatrixEveryRowSendsAndEchoes
     * @tc.desc          Every matrix row reaches the stub unchanged.
     * @tc.precondition  A connected session and the matrix rows exist.
     * @tc.steps         1. Send each row. 2. Read the stub history. 3. Compare each
     *                   recorded text to its row.
     * @tc.expected      The stub records ten identical texts in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixEveryRowSendsAndEchoes', 0, () => {
      logStep('payloadMatrix', 'every row echoes');
      const client = createConnectedSession();
      for (let index = 0; index < MATRIX_PAYLOADS.length; index++) {
        const result = client.sendString(MATRIX_PAYLOADS[index]);
        expect(result.errCode).assertEqual(ERROR_NONE);
      }
      const received = (client.proxy as RemoteProxyModel).stub.receivedTexts;
      expect(received.length).assertEqual(MATRIX_PAYLOADS.length);
      for (let index = 0; index < MATRIX_PAYLOADS.length; index++) {
        expect(received[index]).assertEqual(MATRIX_PAYLOADS[index]);
      }
      expect(joined(received, '|')).assertEqual(joined(MATRIX_PAYLOADS, '|'));
      expect(textFingerprint(joined(received, '|'))).assertEqual(textFingerprint(joined(MATRIX_PAYLOADS, '|')));
    });

    /**
     * @tc.name          payloadMatrixReplyIsIndependentOfRow
     * @tc.desc          The reply text never depends on the request payload.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three very different rows. 2. Compare their replies.
     *                   3. Check the stub reply text.
     * @tc.expected      All replies are the fixed stub reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixReplyIsIndependentOfRow', 0, () => {
      logStep('payloadMatrix', 'reply independent');
      const client = createConnectedSession();
      const first = client.sendString('');
      const second = client.sendString('连接成功');
      const third = client.sendString('{"code":1}');
      expect(first.reply.size()).assertEqual(1);
      expect(second.reply.size()).assertEqual(1);
      expect(third.reply.size()).assertEqual(1);
      expect(first.errCode).assertEqual(second.errCode);
      expect(second.errCode).assertEqual(third.errCode);
      expect((client.proxy as RemoteProxyModel).stub.replyText).assertEqual('hello rpc');
      expect(uniqueStrings([String(first.reply.size()), String(second.reply.size()),
        String(third.reply.size())]).length).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixRequestCodesStayOne
     * @tc.desc          Every matrix send uses request code one.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send all rows. 2. Read the proxy request log. 3. Count code
     *                   one entries.
     * @tc.expected      Ten requests are recorded and all are code one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRequestCodesStayOne', 0, () => {
      logStep('payloadMatrix', 'codes stay one');
      const client = createConnectedSession();
      for (let index = 0; index < MATRIX_PAYLOADS.length; index++) {
        client.sendString(MATRIX_PAYLOADS[index]);
      }
      const proxy = client.proxy as RemoteProxyModel;
      expect(proxy.requests.length).assertEqual(10);
      expect(countOf(['1', '1', '1', '1', '1', '1', '1', '1', '1', '1'], '1')).assertEqual(10);
      for (let index = 0; index < proxy.requests.length; index++) {
        expect(proxy.requests[index]).assertEqual(REQUEST_CODE);
      }
      expect(proxy.stub.handledCodes.length).assertEqual(10);
      expect(proxy.sendCalls).assertEqual(10);
      expect(uniqueStrings(['1', '2']).length).assertEqual(2);
    });

    /**
     * @tc.name          payloadMatrixToastCountMatchesRows
     * @tc.desc          One toast per row plus the connect toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send all rows. 2. Count the toasts. 3. Compare to the row
     *                   count plus one.
     * @tc.expected      Eleven toasts exist for ten sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixToastCountMatchesRows', 0, () => {
      logStep('payloadMatrix', 'toast count');
      const client = createConnectedSession();
      for (let index = 0; index < MATRIX_PAYLOADS.length; index++) {
        client.sendString(MATRIX_PAYLOADS[index]);
      }
      expect(client.toasts.length).assertEqual(MATRIX_PAYLOADS.length + 1);
      expect(client.toasts[0]).assertEqual('connectAbility success');
      expect(client.toasts[10]).assertEqual('sendRequest success');
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(10);
      expect(countOf(client.toasts, 'connectAbility success')).assertEqual(1);
      expect(uniqueStrings(client.toasts).length).assertEqual(2);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          payloadMatrixReorderChangesFingerprint
     * @tc.desc          Row order affects the received text fingerprint.
     * @tc.precondition  The matrix and a reversed copy exist.
     * @tc.steps         1. Build the reversed rows. 2. Fingerprint both joins. 3. Compare
     *                   the two fingerprints.
     * @tc.expected      Both orders keep the same length but different fingerprints.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixReorderChangesFingerprint', 0, () => {
      logStep('payloadMatrix', 'reorder fingerprint');
      const reversed: string[] = [];
      for (let index = MATRIX_PAYLOADS.length - 1; index >= 0; index--) {
        reversed.push(MATRIX_PAYLOADS[index]);
      }
      const forward = joined(MATRIX_PAYLOADS, '|');
      const backward = joined(reversed, '|');
      expect(reversed.length).assertEqual(MATRIX_PAYLOADS.length);
      expect(forward.length).assertEqual(backward.length);
      expect(forward === backward).assertFalse();
      expect(textFingerprint(forward) === textFingerprint(backward)).assertFalse();
      expect(reversed[0]).assertEqual('a');
      expect(reversed[9]).assertEqual('');
      expect(forward.split('|').length).assertEqual(backward.split('|').length);
    });

    /**
     * @tc.name          payloadMatrixDuplicateRowIsDetectable
     * @tc.desc          Appending a duplicate row is visible to uniqueStrings.
     * @tc.precondition  The matrix rows are unique.
     * @tc.steps         1. Append a duplicate. 2. Count the length and unique size.
     *                   3. Compare to the original matrix.
     * @tc.expected      The length grows by one while the unique size stays at ten.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixDuplicateRowIsDetectable', 0, () => {
      logStep('payloadMatrix', 'duplicate row');
      const extended: string[] = [];
      for (let index = 0; index < MATRIX_PAYLOADS.length; index++) {
        extended.push(MATRIX_PAYLOADS[index]);
      }
      extended.push('hello world');
      expect(extended.length).assertEqual(11);
      expect(uniqueStrings(extended).length).assertEqual(10);
      expect(countOf(extended, 'hello world')).assertEqual(2);
      expect(extended.length - uniqueStrings(extended).length).assertEqual(1);
      expect(uniqueStrings(extended).length).assertEqual(MATRIX_PAYLOADS.length);
      expect(joined(extended, '').length > joined(MATRIX_PAYLOADS, '').length).assertTrue();
    });

    /**
     * @tc.name          payloadMatrixLengthSumIsPinned
     * @tc.desc          The total matrix payload length is a fixed number.
     * @tc.precondition  The matrix is declared in this suite.
     * @tc.steps         1. Sum every row length. 2. Compare the histogram size. 3. Read
     *                   the longest and shortest rows.
     * @tc.expected      The sum is ninety three with a maximum of thirty one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixLengthSumIsPinned', 0, () => {
      logStep('payloadMatrix', 'length sum');
      const histogram = lengthHistogram(MATRIX_PAYLOADS);
      let total = 0;
      let longest = 0;
      for (let index = 0; index < histogram.length; index++) {
        total = total + histogram[index];
        if (histogram[index] > longest) {
          longest = histogram[index];
        }
      }
      expect(total).assertEqual(93);
      expect(longest).assertEqual(31);
      expect(histogram[0]).assertEqual(0);
      expect(histogram[1]).assertEqual(1);
      expect(histogram[9]).assertEqual(1);
      expect(histogram.length).assertEqual(10);
      expect(histogram[7]).assertEqual(31);
    });

    /**
     * @tc.name          payloadMatrixStreamingChunksKeepBoundaries
     * @tc.desc          Multi write sequences keep each chunk separate.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Write three chunks. 2. Read them. 3. Compare the joined
     *                   result and the single value size.
     * @tc.expected      Three distinct values are read in write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixStreamingChunksKeepBoundaries', 0, () => {
      logStep('payloadMatrix', 'streaming chunks');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('');
      sequence.writeString('omega');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('omega');
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.readString()).assertEqual('');
    });

    /**
     * @tc.name          payloadMatrixStubReplyCanBeOverridden
     * @tc.desc          The stub reply text is configurable per stub.
     * @tc.precondition  A stub and a client are available.
     * @tc.steps         1. Set a custom reply. 2. Send a row. 3. Read the reply.
     * @tc.expected      The custom reply is returned for the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixStubReplyCanBeOverridden', 0, () => {
      logStep('payloadMatrix', 'custom stub reply');
      const stub = new RemoteStubModel();
      stub.replyText = 'custom reply';
      const client = new ConnectionModel();
      client.connect(1);
      client.onConnect(new RemoteProxyModel(stub));
      const result = client.sendString('hello world');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(stub.replyText).assertEqual('custom reply');
      expect(stub.receivedTexts[0]).assertEqual('hello world');
      expect(client.logs.contains('reply custom reply')).assertTrue();
      expect(client.logs.contains('custom reply')).assertTrue();
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          payloadMatrixStubDirectRequestSucceeds
     * @tc.desc          The stub handler accepts code one and writes its reply.
     * @tc.precondition  A bare stub and two sequences exist.
     * @tc.steps         1. Call the handler directly. 2. Read the reply sequence. 3.
     *                   Inspect the history.
     * @tc.expected      The handler returns true and writes one reply value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixStubDirectRequestSucceeds', 0, () => {
      logStep('payloadMatrix', 'direct stub request');
      const stub = new RemoteStubModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('direct');
      const handled = stub.onRemoteMessageRequest(1, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.handledCodes[0]).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('direct');
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          payloadMatrixStubDirectRejectsZero
     * @tc.desc          The stub handler rejects code zero without a reply.
     * @tc.precondition  A bare stub and two sequences exist.
     * @tc.steps         1. Call the handler with code zero. 2. Read the reply size. 3.
     *                   Inspect the handled codes.
     * @tc.expected      The handler returns false and writes no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixStubDirectRejectsZero', 0, () => {
      logStep('payloadMatrix', 'direct reject zero');
      const stub = new RemoteStubModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('ignored');
      const handled = stub.onRemoteMessageRequest(0, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(reply.size()).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(stub.handledCodes[0]).assertEqual(0);
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          payloadMatrixProxyResetBetweenRows
     * @tc.desc          A proxy reset between sends clears the request history.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one row. 2. Reset the proxy. 3. Send another row.
     * @tc.expected      The request log restarts with one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixProxyResetBetweenRows', 0, () => {
      logStep('payloadMatrix', 'reset between rows');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.sendString('before');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      proxy.reset();
      expect(proxy.requests.length).assertEqual(0);
      client.sendString('after');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.stub.receivedTexts[1]).assertEqual('after');
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
    });

    /**
     * @tc.name          payloadMatrixSessionCustomReplyRoundTrips
     * @tc.desc          createConnectedSession honours a custom reply payload.
     * @tc.precondition  createConnectedSession accepts a reply argument.
     * @tc.steps         1. Build a session with a custom reply. 2. Send two rows. 3.
     *                   Compare both replies.
     * @tc.expected      Both replies equal the custom payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixSessionCustomReplyRoundTrips', 0, () => {
      logStep('payloadMatrix', 'custom session reply');
      const custom = 'reply-' + '0123456789';
      const client = createConnectedSession(custom);
      const first = client.sendString('one');
      const second = client.sendString('two');
      expect(first.reply.size()).assertEqual(1);
      expect(second.reply.size()).assertEqual(1);
      expect(first.reply.cursor).assertEqual(0);
      expect(second.reply.cursor).assertEqual(0);
      expect(custom.length).assertEqual(16);
      expect((client.proxy as RemoteProxyModel).stub.replyText).assertEqual(custom);
      expect(client.logs.contains('reply ' + custom)).assertTrue();
      expect(first.errCode).assertEqual(second.errCode);
      expect(custom === REPLY_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixErrorSendHasEmptyReply
     * @tc.desc          A failed send returns a result with no reply value.
     * @tc.precondition  A connected session whose stub was killed.
     * @tc.steps         1. Kill the stub. 2. Send a matrix row. 3. Inspect the result.
     * @tc.expected      The result is 16000003 with an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixErrorSendHasEmptyReply', 0, () => {
      logStep('payloadMatrix', 'error send reply');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).stub.kill();
      const result = client.sendString(MATRIX_PAYLOADS[6]);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.reply.size()).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.errCode === ERROR_NONE).assertFalse();
      expect(client.lastToast()).assertEqual('sendRequest failed, please connect to the server first');
      expect(client.logs.contains('16000003')).assertTrue();
    });

    /**
     * @tc.name          payloadMatrixReclaimedTraceKeepsValues
     * @tc.desc          Reclaiming keeps stored values but resets the cursor.
     * @tc.precondition  A sequence holds two values and one read happened.
     * @tc.steps         1. Read one value. 2. Reclaim. 3. Read the trace.
     * @tc.expected      The trace lists both values with cursor zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixReclaimedTraceKeepsValues', 0, () => {
      logStep('payloadMatrix', 'reclaimed trace');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('kept-a');
      sequence.writeString('kept-b');
      sequence.readString();
      expect(sequence.cursor).assertEqual(1);
      sequence.reclaim();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('kept-a|kept-b#0');
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace()).assertEqual('kept-a|kept-b#0');
    });

    /**
     * @tc.name          payloadMatrixWhiteSpaceRowsAreDistinct
     * @tc.desc          Space, tab and newline rows are three distinct values.
     * @tc.precondition  The matrix includes a space and control rows.
     * @tc.steps         1. Round trip three whitespace rows. 2. Compare them. 3. Count
     *                   the unique results.
     * @tc.expected      The three whitespace payloads stay distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixWhiteSpaceRowsAreDistinct', 0, () => {
      logStep('payloadMatrix', 'whitespace distinct');
      const space = roundTrip(' ');
      const tab = roundTrip('\t');
      const newline = roundTrip('\n');
      expect(space).assertEqual(' ');
      expect(tab).assertEqual('\t');
      expect(newline).assertEqual('\n');
      expect(tab.charCodeAt(0)).assertEqual(9);
      expect(newline.charCodeAt(0)).assertEqual(10);
      expect(uniqueStrings([space, tab, newline]).length).assertEqual(3);
      expect(space.length).assertEqual(1);
      expect(tab === newline).assertFalse();
      expect(textFingerprint(tab) === textFingerprint(newline)).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixNewlineRowShapeIsPinned
     * @tc.desc          The newline row has one embedded line break.
     * @tc.precondition  The matrix includes a two line row.
     * @tc.steps         1. Read the row. 2. Count the line breaks. 3. Split it.
     * @tc.expected      The row has one newline and two segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixNewlineRowShapeIsPinned', 0, () => {
      logStep('payloadMatrix', 'newline row shape');
      const row = MATRIX_PAYLOADS[4];
      expect(row).assertEqual('line1\nline2');
      expect(row.length).assertEqual(11);
      expect(row.split('\n').length).assertEqual(2);
      expect(row.indexOf('\n')).assertEqual(5);
      expect(row.startsWith('line1')).assertTrue();
      expect(row.endsWith('line2')).assertTrue();
      expect(roundTrip(row)).assertEqual(row);
      expect(lineCountForMatrix(row)).assertEqual(2);
    });

    /**
     * @tc.name          payloadMatrixUnicodeRowLengthIsPinned
     * @tc.desc          The Chinese row occupies four UTF-16 code units.
     * @tc.precondition  The matrix includes a Chinese row.
     * @tc.steps         1. Read the row. 2. Check its length. 3. Compare code units.
     * @tc.expected      The row is four code units wide and round trips.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixUnicodeRowLengthIsPinned', 0, () => {
      logStep('payloadMatrix', 'unicode row length');
      const row = MATRIX_PAYLOADS[6];
      expect(row).assertEqual('连接成功');
      expect(row.length).assertEqual(4);
      expect(roundTrip(row)).assertEqual('连接成功');
      expect(roundTrip(row).length).assertEqual(4);
      expect(row.charCodeAt(0) > 127).assertTrue();
      expect(row.charCodeAt(3) > 127).assertTrue();
      expect(row.split('').length).assertEqual(4);
      expect(textFingerprint(roundTrip(row))).assertEqual(textFingerprint(row));
    });

    /**
     * @tc.name          payloadMatrixJsonRowQuotesAreCounted
     * @tc.desc          The JSON row keeps four double quotes.
     * @tc.precondition  The matrix includes a JSON shaped row.
     * @tc.steps         1. Read the row. 2. Count the quotes. 3. Check round trip.
     * @tc.expected      Four quotes and thirty two chars survive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixJsonRowQuotesAreCounted', 0, () => {
      logStep('payloadMatrix', 'json quotes');
      const row = MATRIX_PAYLOADS[7];
      expect(row.length).assertEqual(31);
      expect(countOf(row.split(''), '"')).assertEqual(6);
      expect(row.indexOf('"code"')).assertEqual(1);
      expect(row.indexOf('"text"')).assertEqual(10);
      expect(roundTrip(row)).assertEqual(row);
      expect(roundTrip(row).length).assertEqual(31);
      expect(roundTrip(row).charAt(0)).assertEqual('{');
      expect(roundTrip(row).charAt(30)).assertEqual('}');
    });

    /**
     * @tc.name          payloadMatrixInterleavedReadsFollowWrites
     * @tc.desc          Interleaving writes and reads keeps FIFO order.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Write and read one. 2. Write and read two. 3. Compare the order.
     * @tc.expected      Each read returns the value written immediately before it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixInterleavedReadsFollowWrites', 0, () => {
      logStep('payloadMatrix', 'interleaved reads');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      expect(sequence.readString()).assertEqual('alpha');
      sequence.writeString('beta');
      expect(sequence.readString()).assertEqual('beta');
      sequence.writeString('gamma');
      expect(sequence.readString()).assertEqual('gamma');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.trace()).assertEqual('alpha|beta|gamma#3');
    });

    /**
     * @tc.name          payloadMatrixTraceMovesPerRead
     * @tc.desc          The trace cursor advances by one per read.
     * @tc.precondition  A sequence with two values exists.
     * @tc.steps         1. Read the trace before any read. 2. Read once. 3. Read twice.
     * @tc.expected      The cursor suffix moves from zero to one to two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceMovesPerRead', 0, () => {
      logStep('payloadMatrix', 'trace per read');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('x');
      sequence.writeString('y');
      expect(sequence.trace()).assertEqual('x|y#0');
      sequence.readString();
      expect(sequence.trace()).assertEqual('x|y#1');
      sequence.readString();
      expect(sequence.trace()).assertEqual('x|y#2');
      expect(sequence.trace().endsWith('#2')).assertTrue();
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace()).assertEqual('x|y#2');
    });

    /**
     * @tc.name          payloadMatrixRepeatedReplyIsIdentical
     * @tc.desc          Two requests return the same reply text.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send twice. 2. Compare the replies. 3. Compare the stub text.
     * @tc.expected      Both replies equal the stub reply literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixRepeatedReplyIsIdentical', 0, () => {
      logStep('payloadMatrix', 'repeated reply');
      const client = createConnectedSession();
      const first = client.sendString('first');
      const second = client.sendString('second');
      expect(first.reply.size()).assertEqual(second.reply.size());
      expect(first.reply.cursor).assertEqual(0);
      expect(second.reply.cursor).assertEqual(0);
      expect((client.proxy as RemoteProxyModel).stub.replyText).assertEqual('hello rpc');
      expect(first.errCode).assertEqual(second.errCode);
      expect(first.reply.readCount).assertEqual(0);
      expect(second.reply.readCount).assertEqual(0);
      expect(countOf(client.logs.lines, 'INFO reply hello rpc')).assertEqual(2);
    });

    /**
     * @tc.name          payloadMatrixEachReplyIsConsumedOnce
     * @tc.desc          Every request consumes exactly one reply value.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send twice. 2. Read the cursor after each send. 3. Compare the
     *                   cursors.
     * @tc.expected      Both reply sequences are consumed to cursor one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixEachReplyIsConsumedOnce', 0, () => {
      logStep('payloadMatrix', 'reply consumed once');
      const client = createConnectedSession();
      const first = client.sendString('one');
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.reply.cursor).assertEqual(1);
      expect(first.reply.readCount).assertEqual(1);
      expect(first.reply.size()).assertEqual(1);
      const second = client.sendString('two');
      expect(second.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(second.reply.cursor).assertEqual(1);
      expect(first.reply.cursor).assertEqual(1);
      const third = client.sendString('three');
      expect(third.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(third.reply.cursor).assertEqual(1);
      expect(second.reply.size()).assertEqual(1);
      expect(first.reply === second.reply).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixSendReturnsRequestResult
     * @tc.desc          sendString returns a typed result model with an errCode.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send. 2. Read the errCode. 3. Read the reply size.
     * @tc.expected      The result is successful with one reply value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixSendReturnsRequestResult', 0, () => {
      logStep('payloadMatrix', 'send returns result');
      const client = createConnectedSession();
      const result = client.sendString(MATRIX_PAYLOADS[2]);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(0);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.isReclaimed()).assertFalse();
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual('hello world');
      expect(client.logs.contains('reply hello rpc')).assertTrue();
    });

    /**
     * @tc.name          payloadMatrixRowZeroIsEmpty
     * @tc.desc          The first matrix row is the empty string.
     * @tc.precondition  The matrix is declared.
     * @tc.steps         1. Read row zero. 2. Check its length. 3. Round trip it.
     * @tc.expected      Row zero is empty and round trips to empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixRowZeroIsEmpty', 0, () => {
      logStep('payloadMatrix', 'row zero');
      expect(MATRIX_PAYLOADS[0]).assertEqual('');
      expect(MATRIX_PAYLOADS[0].length).assertEqual(0);
      expect(roundTrip(MATRIX_PAYLOADS[0])).assertEqual('');
      expect(roundTrip(MATRIX_PAYLOADS[0]).length).assertEqual(0);
      expect(lengthHistogram(MATRIX_PAYLOADS)[0]).assertEqual(0);
      expect(MATRIX_PAYLOADS[0] === MATRIX_PAYLOADS[1]).assertFalse();
      expect(uniqueStrings([MATRIX_PAYLOADS[0], MATRIX_PAYLOADS[1]]).length).assertEqual(2);
      expect(textFingerprint(MATRIX_PAYLOADS[0])).assertEqual(216613);
    });

    /**
     * @tc.name          payloadMatrixRowNineIsSingleLetter
     * @tc.desc          The last matrix row is a single letter.
     * @tc.precondition  The matrix is declared.
     * @tc.steps         1. Read the last row. 2. Check its length. 3. Round trip it.
     * @tc.expected      The last row is the single letter a.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixRowNineIsSingleLetter', 0, () => {
      logStep('payloadMatrix', 'row nine');
      expect(MATRIX_PAYLOADS[9]).assertEqual('a');
      expect(MATRIX_PAYLOADS[9].length).assertEqual(1);
      expect(roundTrip(MATRIX_PAYLOADS[9])).assertEqual('a');
      expect(roundTrip(MATRIX_PAYLOADS[9]).charCodeAt(0)).assertEqual(97);
      expect(lengthHistogram(MATRIX_PAYLOADS)[9]).assertEqual(1);
      expect(MATRIX_PAYLOADS[9] === MATRIX_PAYLOADS[8]).assertFalse();
      expect(countOf(MATRIX_PAYLOADS, 'a')).assertEqual(1);
      expect(uniqueStrings(MATRIX_PAYLOADS).length).assertEqual(10);
    });

    /**
     * @tc.name          payloadMatrixLengthSumMatchesRows
     * @tc.desc          The histogram sum equals the payload length sum.
     * @tc.precondition  The matrix and histogram helper exist.
     * @tc.steps         1. Sum the rows directly. 2. Sum the histogram. 3. Compare both.
     * @tc.expected      Both sums are equal to ninety three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixLengthSumMatchesRows', 0, () => {
      logStep('payloadMatrix', 'length sum matches');
      let rowSum = 0;
      for (let index = 0; index < MATRIX_PAYLOADS.length; index++) {
        rowSum = rowSum + MATRIX_PAYLOADS[index].length;
      }
      const histogram = lengthHistogram(MATRIX_PAYLOADS);
      let histogramSum = 0;
      for (let index = 0; index < histogram.length; index++) {
        histogramSum = histogramSum + histogram[index];
      }
      expect(rowSum).assertEqual(histogramSum);
      expect(rowSum).assertEqual(93);
      expect(histogramSum).assertEqual(93);
      expect(rowSum > 0).assertTrue();
      expect(histogram.length).assertEqual(10);
      expect(countOf(MATRIX_PAYLOADS, ' ')).assertEqual(1);
      expect(countOf(MATRIX_PAYLOADS, 'hello world')).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixEmptyStubReplyIsSuccessful
     * @tc.desc          An empty stub reply still yields a successful request.
     * @tc.precondition  A connected session whose stub reply is empty.
     * @tc.steps         1. Set the reply to empty. 2. Send. 3. Read the result and toast.
     * @tc.expected      errCode is zero with an empty reply and a success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixEmptyStubReplyIsSuccessful', 0, () => {
      logStep('payloadMatrix', 'empty stub reply');
      const client = createConnectedSession('');
      const result = client.sendString('hello world');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.logs.contains('reply ')).assertTrue();
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual('hello world');
      expect(client.events.last()).assertEqual('send-ok:');
    });

    /**
     * @tc.name          payloadMatrixSequenceReclaimIsIdempotent
     * @tc.desc          Reclaiming twice keeps the sequence reclaimed.
     * @tc.precondition  A sequence holds one value.
     * @tc.steps         1. Reclaim. 2. Reclaim again. 3. Attempt a read and write.
     * @tc.expected      Both calls leave the same reclaimed state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixSequenceReclaimIsIdempotent', 0, () => {
      logStep('payloadMatrix', 'reclaim idempotent');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value');
      sequence.reclaim();
      const afterFirst = sequence.trace();
      sequence.reclaim();
      expect(sequence.trace()).assertEqual(afterFirst);
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.writeString('x')).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.size()).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixEmptySequenceTraceIsHashZero
     * @tc.desc          An empty sequence trace is just the cursor marker.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Read the trace. 2. Read a value. 3. Compare both traces.
     * @tc.expected      The empty trace is #0 and the read does not move it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixEmptySequenceTraceIsHashZero', 0, () => {
      logStep('payloadMatrix', 'empty trace');
      const sequence = MessageSequenceModel.create();
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.isEmpty()).assertTrue();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.trace().length).assertEqual(2);
    });

    /**
     * @tc.name          payloadMatrixReplyTextIsNotRequestEcho
     * @tc.desc          The reply is the stub text, not an echo of the request.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a distinctive row. 2. Read the reply. 3. Compare both texts.
     * @tc.expected      The reply differs from the request text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixReplyTextIsNotRequestEcho', 0, () => {
      logStep('payloadMatrix', 'reply not echo');
      const client = createConnectedSession();
      const request = 'echo-me-please';
      const result = client.sendString(request);
      const reply = (client.proxy as RemoteProxyModel).stub.replyText;
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply === request).assertFalse();
      expect(reply.indexOf('echo')).assertEqual(-1);
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual(request);
      expect(request === REPLY_PAYLOAD).assertFalse();
      expect(textFingerprint(request) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
      expect((client.proxy as RemoteProxyModel).stub.replyText.length).assertEqual(9);
    });

    /**
     * @tc.name          payloadMatrixStubReplyDefaultIsConstant
     * @tc.desc          A fresh stub starts with the reply literal.
     * @tc.precondition  RemoteStubModel is exported.
     * @tc.steps         1. Build a stub. 2. Read the reply text. 3. Send a request.
     * @tc.expected      The reply defaults to hello rpc and is written once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixStubReplyDefaultIsConstant', 0, () => {
      logStep('payloadMatrix', 'stub reply default');
      const stub = new RemoteStubModel();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.replyText).assertEqual('hello rpc');
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('hello world');
      stub.onRemoteMessageRequest(1, data, reply, new MessageOptionModel());
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.size()).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          payloadMatrixEmptyRowStillToastsSuccess
     * @tc.desc          An empty row send still produces the success toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send the empty row. 2. Read the toast. 3. Count the toasts.
     * @tc.expected      The success toast is appended and the reply is intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixEmptyRowStillToastsSuccess', 0, () => {
      logStep('payloadMatrix', 'empty row toast');
      const client = createConnectedSession();
      const result = client.sendString('');
      expect(client.toasts.length).assertEqual(2);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(client.events.last()).assertEqual('send-ok:hello rpc');
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual('');
      expect(client.logs.contains(REQUEST_PAYLOAD)).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixTraceOfThreeValues
     * @tc.desc          A three value trace joins with pipes and appends the cursor.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. Write three values. 2. Read the trace. 3. Read one value and compare.
     * @tc.expected      The trace is a|b|c#0 then a|b|c#1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceOfThreeValues', 0, () => {
      logStep('payloadMatrix', 'trace three values');
      const sequence = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      sequence.writeString('c');
      expect(sequence.trace()).assertEqual('a|b|c#0');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.trace()).assertEqual('a|b|c#1');
      expect(sequence.trace().split('|').length).assertEqual(3);
      expect(sequence.trace().endsWith('#1')).assertTrue();
      expect(sequence.trace().charAt(4)).assertEqual('c');
      expect(sequence.isEmpty()).assertFalse();
    });

    /**
     * @tc.name          payloadMatrixProxyLastPayloadDefaultsEmpty
     * @tc.desc          The proxy lastPayload field starts and stays empty.
     * @tc.precondition  A connected session has sent one request.
     * @tc.steps         1. Send one row. 2. Read lastPayload. 3. Compare it to the empty string.
     * @tc.expected      lastPayload is still empty because it is diagnostic only.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadMatrixProxyLastPayloadDefaultsEmpty', 0, () => {
      logStep('payloadMatrix', 'last payload default');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      expect(proxy.lastPayload).assertEqual('');
      client.sendString('hello world');
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.lastPayload.length).assertEqual(0);
      expect(proxy.stub.receivedTexts[0]).assertEqual('hello world');
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.lastPayload === REQUEST_PAYLOAD).assertFalse();
    });

  });
}
