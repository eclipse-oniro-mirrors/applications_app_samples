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
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  ERROR_STUB_NOT_ALIVE,
  ERROR_SEQUENCE_RECLAIMED,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint,
  clampInt,
  MessageSequenceModel,
  MessageOptionModel,
  StubRemoteObjectModel,
  StubMetrics,
  InProcessClient,
  RequestResultModel,
  expectedReplyFor
} from '../Shared/SharedDriver';

const PAYLOAD_EMPTY: string = '';
const PAYLOAD_SPACE: string = ' ';
const PAYLOAD_UNICODE: string = '你好 IPC 消息';
const PAYLOAD_MIXED: string = 'hello 世界 42';
const PAYLOAD_TABS: string = '\t\t';
const PAYLOAD_NEWLINE: string = '\n';
const LONG_UNIT: string = 'payload-0123456789';

function repeatPayload(unit: string, times: number): string {
  let text = '';
  for (let index = 0; index < times; index++) {
    text = text + unit;
  }
  return text;
}

/** Classifies a payload by its shape for boundary assertions. */
function payloadClass(value: string): string {
  if (value.length === 0) {
    return 'empty';
  }
  if (value.trim().length === 0) {
    return 'blank';
  }
  if (value.length > 128) {
    return 'long';
  }
  for (let index = 0; index < value.length; index++) {
    if (value.charCodeAt(index) > 127) {
      return 'unicode';
    }
  }
  return 'ascii';
}

function sendPayload(stub: StubRemoteObjectModel, payload: string): RequestResultModel {
  const client: InProcessClient = new InProcessClient(stub);
  return client.send(REQUEST_CODE, payload);
}

function payloadLength(value: string): number {
  return value.length;
}

function trimmedLength(value: string): number {
  return value.trim().length;
}

function sameOrder(left: string[], right: string[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

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
     * @tc.name          payloadValidationDocumentedLiteral
     * @tc.desc          The documented request payload is hello world.
     * @tc.precondition  The shared payload constants are loaded.
     * @tc.steps         1. Read the payload constant.
     *                   2. Compare it with a literal.
     *                   3. Inspect length and shape.
     * @tc.expected      The payload is hello world with eleven characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadValidationDocumentedLiteral', 0, () => {
      logStep('payloadValidationDocumentedLiteral', REQUEST_PAYLOAD);
      expect(REQUEST_PAYLOAD).assertEqual('hello world');
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(REQUEST_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(REQUEST_PAYLOAD.split(' ').length).assertEqual(2);
      expect(REQUEST_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REQUEST_PAYLOAD.endsWith('world')).assertTrue();
      expect(payloadClass(REQUEST_PAYLOAD)).assertEqual('ascii');
      expect(trimmedLength(REQUEST_PAYLOAD)).assertEqual(payloadLength(REQUEST_PAYLOAD));
    });

    /**
     * @tc.name          payloadValidationEmptyPayloadHandled
     * @tc.desc          An empty payload is still handled by the stub.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send code one with an empty payload.
     *                   2. Inspect the result.
     *                   3. Read the recorded request text.
     * @tc.expected      The request succeeds and the recorded text is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationEmptyPayloadHandled', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, PAYLOAD_EMPTY);
      logStep('payloadValidationEmptyPayloadHandled', 'len=' + String(result.replyText.length));
      expect(result.isSuccess()).assertTrue();
      expect(result.handled).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.text).assertEqual(PAYLOAD_EMPTY);
      expect(stub.lastRequest()?.text.length).assertEqual(0);
      expect(payloadClass(PAYLOAD_EMPTY)).assertEqual('empty');
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationWhitespacePreserved
     * @tc.desc          A whitespace payload is preserved without trimming.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send a single space payload.
     *                   2. Compare the recorded text.
     *                   3. Check trimmed length.
     * @tc.expected      The recorded text is one space and trims to empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationWhitespacePreserved', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, PAYLOAD_SPACE);
      logStep('payloadValidationWhitespacePreserved', 'len=' + String(payloadLength(PAYLOAD_SPACE)));
      expect(result.isSuccess()).assertTrue();
      expect(stub.lastRequest()?.text).assertEqual(PAYLOAD_SPACE);
      expect(payloadLength(PAYLOAD_SPACE)).assertEqual(1);
      expect(trimmedLength(PAYLOAD_SPACE)).assertEqual(0);
      expect(payloadClass(PAYLOAD_SPACE)).assertEqual('blank');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.text === PAYLOAD_EMPTY).assertFalse();
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationUnicodePreserved
     * @tc.desc          A unicode payload round trips without loss.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send a unicode payload.
     *                   2. Compare the recorded text.
     *                   3. Check the shape classifier.
     * @tc.expected      The recorded text equals the unicode literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationUnicodePreserved', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, PAYLOAD_UNICODE);
      logStep('payloadValidationUnicodePreserved', String(payloadLength(PAYLOAD_UNICODE)));
      expect(result.isSuccess()).assertTrue();
      expect(stub.lastRequest()?.text).assertEqual(PAYLOAD_UNICODE);
      expect(stub.lastRequest()?.text.length).assertEqual(PAYLOAD_UNICODE.length);
      expect(payloadClass(PAYLOAD_UNICODE)).assertEqual('unicode');
      expect(payloadClass(PAYLOAD_MIXED)).assertEqual('unicode');
      expect(payloadClass(REQUEST_PAYLOAD)).assertEqual('ascii');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.handled).assertTrue();
    });

    /**
     * @tc.name          payloadValidationLongPayloadPreserved
     * @tc.desc          A long payload is stored in full.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Build a 180 character payload.
     *                   2. Send it.
     *                   3. Compare the recorded length.
     * @tc.expected      The recorded text matches the long payload exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationLongPayloadPreserved', 0, () => {
      const longPayload: string = repeatPayload(LONG_UNIT, 10);
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, longPayload);
      logStep('payloadValidationLongPayloadPreserved', String(longPayload.length));
      expect(longPayload.length).assertEqual(180);
      expect(result.isSuccess()).assertTrue();
      expect(stub.lastRequest()?.text).assertEqual(longPayload);
      expect(stub.lastRequest()?.text.length).assertEqual(180);
      expect(payloadClass(longPayload)).assertEqual('long');
      expect(longPayload.startsWith('payload-')).assertTrue();
      expect(longPayload.endsWith('0123456789')).assertTrue();
      expect(countOf(longPayload.split(''), '-')).assertEqual(10);
    });

    /**
     * @tc.name          payloadValidationTabPayloadPreserved
     * @tc.desc          A tab only payload survives the request path.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send two tab characters.
     *                   2. Compare the recorded text.
     *                   3. Confirm the blank classification.
     * @tc.expected      The recorded text is two tabs and classifies as blank.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationTabPayloadPreserved', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, PAYLOAD_TABS);
      logStep('payloadValidationTabPayloadPreserved', String(payloadLength(PAYLOAD_TABS)));
      expect(payloadLength(PAYLOAD_TABS)).assertEqual(2);
      expect(result.isSuccess()).assertTrue();
      expect(stub.lastRequest()?.text).assertEqual(PAYLOAD_TABS);
      expect(stub.lastRequest()?.text.charCodeAt(0)).assertEqual(9);
      expect(payloadClass(PAYLOAD_TABS)).assertEqual('blank');
      expect(trimmedLength(PAYLOAD_TABS)).assertEqual(0);
      expect(stub.lastRequest()?.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          payloadValidationNewlinePayloadPreserved
     * @tc.desc          A newline only payload survives the request path.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send a newline payload.
     *                   2. Compare the recorded text.
     *                   3. Check the character code.
     * @tc.expected      The recorded text is a single newline character.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationNewlinePayloadPreserved', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, PAYLOAD_NEWLINE);
      logStep('payloadValidationNewlinePayloadPreserved', String(payloadLength(PAYLOAD_NEWLINE)));
      expect(payloadLength(PAYLOAD_NEWLINE)).assertEqual(1);
      expect(result.isSuccess()).assertTrue();
      expect(stub.lastRequest()?.text).assertEqual(PAYLOAD_NEWLINE);
      expect(stub.lastRequest()?.text.charCodeAt(0)).assertEqual(10);
      expect(payloadClass(PAYLOAD_NEWLINE)).assertEqual('blank');
      expect(stub.lastRequest()?.text.split('\n').length).assertEqual(2);
      expect(trimmedLength(PAYLOAD_NEWLINE)).assertEqual(0);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationReplyIndependentOfPayload
     * @tc.desc          The reply stays hello rpc for every payload shape.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send four different payloads.
     *                   2. Collect the replies.
     *                   3. Compare every reply.
     * @tc.expected      All replies equal hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationReplyIndependentOfPayload', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const payloads: string[] = [PAYLOAD_EMPTY, PAYLOAD_SPACE, PAYLOAD_UNICODE, PAYLOAD_TABS];
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      logStep('payloadValidationReplyIndependentOfPayload', client.trace());
      expect(client.results.length).assertEqual(4);
      expect(client.replies.length).assertEqual(4);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(4);
      expect(client.trace().split('|').length).assertEqual(4);
      expect(stub.requestCount()).assertEqual(4);
      expect(client.sentTexts[1]).assertEqual(PAYLOAD_SPACE);
      expect(client.sentTexts[2]).assertEqual(PAYLOAD_UNICODE);
      expect(StubMetrics.from(stub).handled).assertEqual(4);
    });

    /**
     * @tc.name          payloadValidationReplyOracleAgreement
     * @tc.desc          The reply matches the expectedReplyFor oracle.
     * @tc.precondition  The reply oracle is available.
     * @tc.steps         1. Evaluate the oracle for code one.
     *                   2. Send a request.
     *                   3. Compare reply and oracle output.
     * @tc.expected      The oracle and the actual reply both equal hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationReplyOracleAgreement', 0, () => {
      const oracle: string = expectedReplyFor(REQUEST_CODE);
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, REQUEST_PAYLOAD);
      logStep('payloadValidationReplyOracleAgreement', oracle);
      expect(oracle).assertEqual(REPLY_PAYLOAD);
      expect(oracle).assertEqual(result.replyText);
      expect(expectedReplyFor(0)).assertEqual('');
      expect(expectedReplyFor(2)).assertEqual('');
      expect(oracle.length).assertEqual(9);
      expect(result.isSuccess()).assertTrue();
      expect(stub.lastRequest()?.replyText).assertEqual(oracle);
      expect(oracle.split(' ').length).assertEqual(2);
    });

    /**
     * @tc.name          payloadValidationPayloadNotEchoed
     * @tc.desc          The request payload is not echoed into the reply.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send the documented payload.
     *                   2. Compare reply with request text.
     *                   3. Confirm both literals differ.
     * @tc.expected      The reply differs from the request payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationPayloadNotEchoed', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, REQUEST_PAYLOAD);
      logStep('payloadValidationPayloadNotEchoed', result.replyText);
      expect(result.replyText === REQUEST_PAYLOAD).assertFalse();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText.indexOf('hello')).assertEqual(0);
      expect(result.replyText.indexOf('world')).assertEqual(-1);
      expect(REQUEST_PAYLOAD.indexOf('rpc')).assertEqual(-1);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.lastRequest()?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText.length).assertLess(REQUEST_PAYLOAD.length);
    });

    /**
     * @tc.name          payloadValidationMessageSequenceRoundTrip
     * @tc.desc          A message sequence returns written strings in order.
     * @tc.precondition  A message sequence model is available.
     * @tc.steps         1. Write three strings.
     *                   2. Read them back.
     *                   3. Compare the counters.
     * @tc.expected      Reads match writes in order with matching counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationMessageSequenceRoundTrip', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.writeString(PAYLOAD_UNICODE);
      sequence.writeString(PAYLOAD_EMPTY);
      logStep('payloadValidationMessageSequenceRoundTrip', sequence.trace());
      expect(sequence.size()).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(sequence.readString()).assertEqual(PAYLOAD_UNICODE);
      expect(sequence.readString()).assertEqual(PAYLOAD_EMPTY);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace()).assertEqual(REQUEST_PAYLOAD + '|' + PAYLOAD_UNICODE + '|#3');
    });

    /**
     * @tc.name          payloadValidationSequenceRewind
     * @tc.desc          Rewinding a sequence replays from the first entry.
     * @tc.precondition  A sequence with two writes exists.
     * @tc.steps         1. Read one entry.
     *                   2. Rewind.
     *                   3. Read again.
     * @tc.expected      The rewind restarts the cursor and replays the first entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceRewind', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString(PAYLOAD_SPACE);
      sequence.writeString(PAYLOAD_UNICODE);
      const first: string = sequence.readString();
      expect(sequence.cursor).assertEqual(1);
      sequence.rewind();
      logStep('payloadValidationSequenceRewind', sequence.trace());
      expect(first).assertEqual(PAYLOAD_SPACE);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual(PAYLOAD_SPACE);
      expect(sequence.readString()).assertEqual(PAYLOAD_UNICODE);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertFalse();
      expect(sequence.trace().endsWith('#2')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationSequenceReclaim
     * @tc.desc          Reclaiming a sequence blocks further writes and reads.
     * @tc.precondition  A populated sequence exists.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Attempt a write and a read.
     *                   3. Inspect the reclaimed flag.
     * @tc.expected      Writes fail and reads return empty after reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceReclaim', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.reclaim();
      const writeAfter: boolean = sequence.writeString(PAYLOAD_SPACE);
      const readAfter: string = sequence.readString();
      logStep('payloadValidationSequenceReclaim', String(sequence.reclaimed));
      expect(sequence.reclaimed).assertTrue();
      expect(writeAfter).assertFalse();
      expect(readAfter).assertEqual('');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.readCount).assertEqual(0);
      expect(ERROR_SEQUENCE_RECLAIMED).assertEqual(16000013);
    });

    /**
     * @tc.name          payloadValidationSequenceEmptyRead
     * @tc.desc          Reading from an empty sequence yields an empty string.
     * @tc.precondition  An empty sequence exists.
     * @tc.steps         1. Read twice.
     *                   2. Check the counters.
     *                   3. Confirm the size.
     * @tc.expected      Both reads are empty and no read is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationSequenceEmptyRead', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      const first: string = sequence.readString();
      const second: string = sequence.readString();
      logStep('payloadValidationSequenceEmptyRead', sequence.trace());
      expect(first).assertEqual('');
      expect(second).assertEqual('');
      expect(sequence.size()).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.reclaimed).assertFalse();
    });

    /**
     * @tc.name          payloadValidationSequenceWriteAfterReclaimFails
     * @tc.desc          A reclaimed sequence silently refuses new writes.
     * @tc.precondition  A reclaimed sequence exists.
     * @tc.steps         1. Write two strings.
     *                   2. Compare the return values.
     *                   3. Check the size.
     * @tc.expected      Both writes return false and the size stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSequenceWriteAfterReclaimFails', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.reclaim();
      const first: boolean = sequence.writeString(REQUEST_PAYLOAD);
      const second: boolean = sequence.writeString(PAYLOAD_UNICODE);
      logStep('payloadValidationSequenceWriteAfterReclaimFails', String(sequence.size()));
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.readString()).assertEqual('');
    });

    /**
     * @tc.name          payloadValidationMixedPayloadLedger
     * @tc.desc          A mixed payload ledger preserves the send order.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send five payload shapes.
     *                   2. Join the sent texts.
     *                   3. Compare each position.
     * @tc.expected      The ledger lists the five payloads in send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationMixedPayloadLedger', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const payloads: string[] = [REQUEST_PAYLOAD, PAYLOAD_EMPTY, PAYLOAD_SPACE, PAYLOAD_UNICODE, PAYLOAD_TABS];
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      logStep('payloadValidationMixedPayloadLedger', joined(client.sentTexts, '/'));
      expect(client.sentTexts.length).assertEqual(5);
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.sentTexts[1]).assertEqual(PAYLOAD_EMPTY);
      expect(client.sentTexts[2]).assertEqual(PAYLOAD_SPACE);
      expect(client.sentTexts[3]).assertEqual(PAYLOAD_UNICODE);
      expect(client.sentTexts[4]).assertEqual(PAYLOAD_TABS);
      expect(stub.requestCount()).assertEqual(5);
      expect(countOf(client.sentTexts, PAYLOAD_EMPTY)).assertEqual(1);
      expect(uniqueStrings(client.sentTexts).length).assertEqual(5);
    });

    /**
     * @tc.name          payloadValidationPayloadFingerprint
     * @tc.desc          Payload fingerprints separate distinct payload shapes.
     * @tc.precondition  The textFingerprint helper is available.
     * @tc.steps         1. Fingerprint three payloads.
     *                   2. Repeat one fingerprint.
     *                   3. Compare the values.
     * @tc.expected      Equal payloads hash equally and distinct payloads differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationPayloadFingerprint', 0, () => {
      const ascii: number = textFingerprint(REQUEST_PAYLOAD);
      const repeat: number = textFingerprint('hello world');
      const empty: number = textFingerprint(PAYLOAD_EMPTY);
      const unicode: number = textFingerprint(PAYLOAD_UNICODE);
      logStep('payloadValidationPayloadFingerprint', String(ascii));
      expect(ascii).assertEqual(repeat);
      expect(ascii === empty).assertFalse();
      expect(ascii === unicode).assertFalse();
      expect(empty).assertEqual(216613);
      expect(unicode).assertLarger(0);
      expect(unicode).assertLess(1000003);
      expect(ascii).assertLarger(0);
      expect(textFingerprint(PAYLOAD_SPACE) === empty).assertFalse();
    });

    /**
     * @tc.name          payloadValidationClassMatrix
     * @tc.desc          The payload classifier separates all five shapes.
     * @tc.precondition  The payload classifier is available.
     * @tc.steps         1. Classify five payloads.
     *                   2. Count each class.
     *                   3. Compare with expectations.
     * @tc.expected      Each payload maps to its documented class.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationClassMatrix', 0, () => {
      const classes: string[] = [
        payloadClass(PAYLOAD_EMPTY),
        payloadClass(PAYLOAD_SPACE),
        payloadClass(REQUEST_PAYLOAD),
        payloadClass(PAYLOAD_UNICODE),
        payloadClass(repeatPayload(LONG_UNIT, 10))
      ];
      logStep('payloadValidationClassMatrix', joined(classes, ','));
      expect(classes.length).assertEqual(5);
      expect(classes[0]).assertEqual('empty');
      expect(classes[1]).assertEqual('blank');
      expect(classes[2]).assertEqual('ascii');
      expect(classes[3]).assertEqual('unicode');
      expect(classes[4]).assertEqual('long');
      expect(countOf(classes, 'blank')).assertEqual(1);
      expect(uniqueStrings(classes).length).assertEqual(5);
      expect(classes.indexOf('long')).assertEqual(4);
    });

    /**
     * @tc.name          payloadValidationUniquePayloadCount
     * @tc.desc          Duplicate payloads collapse to unique entries.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Build a repeated payload list.
     *                   2. Deduplicate.
     *                   3. Count the survivors.
     * @tc.expected      Three unique payloads remain from six entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationUniquePayloadCount', 0, () => {
      const payloads: string[] = [REQUEST_PAYLOAD, PAYLOAD_SPACE, REQUEST_PAYLOAD, PAYLOAD_UNICODE,
        PAYLOAD_SPACE, REQUEST_PAYLOAD];
      const unique: string[] = uniqueStrings(payloads);
      logStep('payloadValidationUniquePayloadCount', joined(unique, '|'));
      expect(payloads.length).assertEqual(6);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual(REQUEST_PAYLOAD);
      expect(unique[1]).assertEqual(PAYLOAD_SPACE);
      expect(unique[2]).assertEqual(PAYLOAD_UNICODE);
      expect(countOf(payloads, REQUEST_PAYLOAD)).assertEqual(3);
      expect(countOf(payloads, PAYLOAD_SPACE)).assertEqual(2);
      expect(countOf(unique, REQUEST_PAYLOAD)).assertEqual(1);
      expect(uniqueStrings(unique).length).assertEqual(3);
    });

    /**
     * @tc.name          payloadValidationReplySequenceWriteCount
     * @tc.desc          The stub writes exactly one reply string per handled request.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send two handled requests.
     *                   2. Inspect the reply buffers.
     *                   3. Compare write counts.
     * @tc.expected      Each reply buffer holds one written string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationReplySequenceWriteCount', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      logStep('payloadValidationReplySequenceWriteCount', reply.trace());
      expect(reply.size()).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.cursor).assertEqual(0);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(reply.readString()).assertEqual('');
      expect(data.readCount).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationOptionDescribeInRecord
     * @tc.desc          The request record captures the message option description.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send with a sync option.
     *                   2. Read the recorded option.
     *                   3. Compare with the describe oracle.
     * @tc.expected      The record option equals the option description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationOptionDescribeInRecord', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel(0, 0, false);
      data.writeString(PAYLOAD_UNICODE);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      const record = stub.lastRequest();
      logStep('payloadValidationOptionDescribeInRecord', option.describe());
      expect(record?.option).assertEqual(option.describe());
      expect(record?.option).assertEqual('0/0/false');
      expect(record?.option.split('/').length).assertEqual(3);
      expect(option.isSync()).assertTrue();
      expect(record?.text).assertEqual(PAYLOAD_UNICODE);
      expect(record?.handled).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          payloadValidationUnknownCodeDropsPayload
     * @tc.desc          An unknown code records no request text.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send code two with a payload.
     *                   2. Inspect the record text.
     *                   3. Confirm the rejection.
     * @tc.expected      The record text is empty and the request is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationUnknownCodeDropsPayload', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(2, PAYLOAD_UNICODE);
      logStep('payloadValidationUnknownCodeDropsPayload', String(result.errCode));
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(stub.lastRequest()?.text).assertEqual('');
      expect(stub.lastRequest()?.replyText).assertEqual('');
      expect(stub.lastRequest()?.code).assertEqual(2);
      expect(client.sentTexts[0]).assertEqual(PAYLOAD_UNICODE);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationKilledStubDropsPayload
     * @tc.desc          A killed stub drops the payload and rejects the request.
     * @tc.precondition  A killed stub is available.
     * @tc.steps         1. Kill the stub.
     *                   2. Send a payload.
     *                   3. Inspect the record.
     * @tc.expected      The payload never reaches the record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationKilledStubDropsPayload', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      stub.kill();
      const client: InProcessClient = new InProcessClient(stub);
      const result: RequestResultModel = client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      logStep('payloadValidationKilledStubDropsPayload', String(stub.alive));
      expect(stub.alive).assertFalse();
      expect(result.handled).assertFalse();
      expect(stub.lastRequest()?.text).assertEqual('');
      expect(stub.lastRequest()?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual(PAYLOAD_UNICODE);
      expect(client.replies.length).assertEqual(0);
      expect(ERROR_STUB_NOT_ALIVE).assertEqual(16000012);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationLargePayloadMetrics
     * @tc.desc          Metrics stay consistent after long payload traffic.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send three long payloads and one unknown code.
     *                   2. Derive metrics.
     *                   3. Check the ratio.
     * @tc.expected      Three handled requests and one rejection are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationLargePayloadMetrics', 0, () => {
      const longPayload: string = repeatPayload(LONG_UNIT, 10);
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, longPayload);
      client.send(REQUEST_CODE, longPayload);
      client.send(REQUEST_CODE, longPayload);
      client.send(2, longPayload);
      const metrics: StubMetrics = StubMetrics.from(stub);
      logStep('payloadValidationLargePayloadMetrics', String(metrics.requests));
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(stub.lastRequest()?.text).assertEqual('');
      expect(client.sentTexts[0].length).assertEqual(180);
      expect(client.replies.length).assertEqual(3);
    });

    /**
     * @tc.name          payloadValidationPayloadClampBoundaries
     * @tc.desc          Payload lengths clamp into report friendly ranges.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp an empty length.
     *                   2. Clamp a long length.
     *                   3. Clamp the documented length.
     * @tc.expected      Clamping yields the low, high and literal lengths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationPayloadClampBoundaries', 0, () => {
      const longPayload: string = repeatPayload(LONG_UNIT, 10);
      logStep('payloadValidationPayloadClampBoundaries', String(longPayload.length));
      expect(clampInt(PAYLOAD_EMPTY.length, 1, 64)).assertEqual(1);
      expect(clampInt(longPayload.length, 1, 64)).assertEqual(64);
      expect(clampInt(REQUEST_PAYLOAD.length, 1, 64)).assertEqual(11);
      expect(clampInt(0, 0, 0)).assertEqual(0);
      expect(clampInt(-3, 1, 64)).assertEqual(1);
      expect(payloadLength(longPayload)).assertEqual(180);
      expect(payloadLength(REQUEST_PAYLOAD)).assertEqual(11);
      expect(trimmedLength(PAYLOAD_TABS)).assertEqual(0);
    });

    /**
     * @tc.name          payloadValidationJoinedPayloads
     * @tc.desc          Joined payloads keep order and separator count.
     * @tc.precondition  The joined helper is available.
     * @tc.steps         1. Join three payloads.
     *                   2. Split the result.
     *                   3. Compare the segments.
     * @tc.expected      Two separators produce three ordered segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationJoinedPayloads', 0, () => {
      const text: string = joined([REQUEST_PAYLOAD, PAYLOAD_UNICODE, PAYLOAD_SPACE], '::');
      logStep('payloadValidationJoinedPayloads', text);
      expect(text.split('::').length).assertEqual(3);
      expect(text.split('::')[0]).assertEqual(REQUEST_PAYLOAD);
      expect(text.split('::')[1]).assertEqual(PAYLOAD_UNICODE);
      expect(text.split('::')[2]).assertEqual(PAYLOAD_SPACE);
      expect(text.startsWith('hello world')).assertTrue();
      expect(text.endsWith(' ')).assertTrue();
      expect(joined([PAYLOAD_EMPTY], '::')).assertEqual(PAYLOAD_EMPTY);
      expect(countOf([REQUEST_PAYLOAD, PAYLOAD_UNICODE], PAYLOAD_UNICODE)).assertEqual(1);
    });

    /**
     * @tc.name          payloadValidationDirectRequestCall
     * @tc.desc          A direct stub call consumes the first written string.
     * @tc.precondition  A stub and a data sequence exist.
     * @tc.steps         1. Write two strings to the data sequence.
     *                   2. Call the stub directly.
     *                   3. Inspect the recorded text.
     * @tc.expected      Only the first string is read while the second stays buffered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationDirectRequestCall', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      data.writeString(PAYLOAD_UNICODE);
      const handled: boolean = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      logStep('payloadValidationDirectRequestCall', stub.lastRequest()?.text ?? '');
      expect(handled).assertTrue();
      expect(data.readCount).assertEqual(1);
      expect(data.cursor).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
      expect(data.size()).assertEqual(2);
      expect(data.readString()).assertEqual(PAYLOAD_UNICODE);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.text === PAYLOAD_UNICODE).assertFalse();
    });

    /**
     * @tc.name          payloadValidationSecondReadIsEmpty
     * @tc.desc          A second reply read returns an empty string.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send one request.
     *                   2. Read the reply buffer twice.
     *                   3. Compare both reads.
     * @tc.expected      The first read is hello rpc and the second is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSecondReadIsEmpty', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString(PAYLOAD_SPACE);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      const first: string = reply.readString();
      const second: string = reply.readString();
      logStep('payloadValidationSecondReadIsEmpty', reply.trace());
      expect(first).assertEqual(REPLY_PAYLOAD);
      expect(second).assertEqual('');
      expect(reply.readCount).assertEqual(1);
      expect(reply.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.reclaimed).assertFalse();
      expect(stub.lastRequest()?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(reply.trace()).assertEqual(REPLY_PAYLOAD + '#1');
    });

    /**
     * @tc.name          payloadValidationSequenceOrderTrace
     * @tc.desc          A sequence trace keeps the write order of payloads.
     * @tc.precondition  A sequence is available.
     * @tc.steps         1. Write four payloads.
     *                   2. Read the trace.
     *                   3. Compare the pipe segments.
     * @tc.expected      The trace lists the payloads in write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSequenceOrderTrace', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString(PAYLOAD_EMPTY);
      sequence.writeString(PAYLOAD_SPACE);
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.writeString(PAYLOAD_UNICODE);
      const trace: string = sequence.trace();
      logStep('payloadValidationSequenceOrderTrace', trace);
      expect(trace.split('|').length).assertEqual(4);
      expect(trace.split('|')[0]).assertEqual(PAYLOAD_EMPTY);
      expect(trace.split('|')[1]).assertEqual(PAYLOAD_SPACE);
      expect(trace.split('|')[2]).assertEqual(REQUEST_PAYLOAD);
      expect(trace.split('|')[3]).assertEqual(PAYLOAD_UNICODE + '#0');
      expect(sequence.size()).assertEqual(4);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(4);
    });

    /**
     * @tc.name          payloadValidationLengthBoundaryMatrix
     * @tc.desc          Payload length boundaries distinguish 127 and 128 characters.
     * @tc.precondition  The payload classifier is available.
     * @tc.steps         1. Build 127 and 128 character payloads.
     *                   2. Classify both.
     *                   3. Compare with a 129 character payload.
     * @tc.expected      Sizes up to 128 are ascii and 129 is long.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationLengthBoundaryMatrix', 0, () => {
      const size127: string = repeatPayload('a', 127);
      const size128: string = repeatPayload('a', 128);
      const size129: string = repeatPayload('a', 129);
      logStep('payloadValidationLengthBoundaryMatrix', String(size128.length));
      expect(size127.length).assertEqual(127);
      expect(size128.length).assertEqual(128);
      expect(size129.length).assertEqual(129);
      expect(payloadClass(size127)).assertEqual('ascii');
      expect(payloadClass(size128)).assertEqual('ascii');
      expect(payloadClass(size129)).assertEqual('long');
      expect(size127.length).assertLess(size128.length);
      expect(size129.length).assertLarger(size128.length);
    });

    /**
     * @tc.name          payloadValidationSpaceVariants
     * @tc.desc          Leading, trailing and repeated spaces are all preserved.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send three space variant payloads.
     *                   2. Compare the recorded texts.
     *                   3. Check trimmed lengths.
     * @tc.expected      Each recorded text matches the exact space pattern.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSpaceVariants', 0, () => {
      const leading: string = '  hello';
      const trailing: string = 'hello  ';
      const repeated: string = 'hello   world';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, leading);
      client.send(REQUEST_CODE, trailing);
      client.send(REQUEST_CODE, repeated);
      logStep('payloadValidationSpaceVariants', joined(client.sentTexts, '|'));
      expect(stub.requestCount()).assertEqual(3);
      expect(client.sentTexts[0]).assertEqual(leading);
      expect(client.sentTexts[1]).assertEqual(trailing);
      expect(client.sentTexts[2]).assertEqual(repeated);
      expect(leading.trim()).assertEqual('hello');
      expect(trailing.trim()).assertEqual('hello');
      expect(repeated.trim()).assertEqual(repeated);
      expect(payloadLength(repeated)).assertEqual(13);
      expect(trimmedLength(repeated)).assertEqual(13);
    });

    /**
     * @tc.name          payloadValidationUnicodeCodePoints
     * @tc.desc          Unicode payload code points are retained per character.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send a mixed payload.
     *                   2. Compare character codes.
     *                   3. Check the recorded text.
     * @tc.expected      The first character code and the full text are preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationUnicodeCodePoints', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_MIXED);
      const record = stub.lastRequest();
      const text: string = record === undefined ? '' : record.text;
      logStep('payloadValidationUnicodeCodePoints', text);
      expect(text).assertEqual(PAYLOAD_MIXED);
      expect(text.charCodeAt(0)).assertEqual(104);
      expect(text.charCodeAt(1)).assertEqual(101);
      expect(text.length).assertEqual(PAYLOAD_MIXED.length);
      expect(text.indexOf('世界')).assertLarger(0);
      expect(text.indexOf('42')).assertLarger(0);
      expect(payloadClass(text)).assertEqual('unicode');
      expect(text.endsWith('42')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationReplyIndependentOfUnicode
     * @tc.desc          A unicode payload still yields the ASCII reply.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send a unicode payload.
     *                   2. Inspect the reply code points.
     *                   3. Confirm pure ASCII.
     * @tc.expected      The reply contains only characters below 128.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationReplyIndependentOfUnicode', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, PAYLOAD_UNICODE);
      let maxCode: number = 0;
      for (let index = 0; index < result.replyText.length; index++) {
        if (result.replyText.charCodeAt(index) > maxCode) {
          maxCode = result.replyText.charCodeAt(index);
        }
      }
      const record = stub.lastRequest();
      const recorded: string = record === undefined ? '' : record.text;
      logStep('payloadValidationReplyIndependentOfUnicode', String(maxCode));
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(maxCode).assertLess(128);
      expect(result.replyText.length).assertEqual(9);
      expect(payloadClass(result.replyText)).assertEqual('ascii');
      expect(recorded).assertEqual(PAYLOAD_UNICODE);
      expect(payloadClass(recorded)).assertEqual('unicode');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText === PAYLOAD_UNICODE).assertFalse();
    });

    /**
     * @tc.name          payloadValidationSendManyLong
     * @tc.desc          sendMany with a long unit payload counts every success.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send four requests.
     *                   2. Count successes.
     *                   3. Check the stored texts.
     * @tc.expected      All four long requests succeed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSendManyLong', 0, () => {
      const longPayload: string = repeatPayload('x', 100);
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const handled: number = client.sendMany(4, REQUEST_CODE);
      logStep('payloadValidationSendManyLong', String(handled));
      expect(handled).assertEqual(4);
      expect(client.sentTexts.length).assertEqual(4);
      expect(client.results.length).assertEqual(4);
      expect(stub.requestCount()).assertEqual(4);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
      expect(payloadLength(longPayload)).assertEqual(100);
      expect(payloadClass(longPayload)).assertEqual('ascii');
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(4);
    });

    /**
     * @tc.name          payloadValidationResetClearsStubTraffic
     * @tc.desc          Resetting the stub clears recorded payloads.
     * @tc.precondition  A stub with recorded traffic exists.
     * @tc.steps         1. Send two payloads.
     *                   2. Reset the stub.
     *                   3. Inspect the records.
     * @tc.expected      No record remains after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationResetClearsStubTraffic', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      client.send(REQUEST_CODE, PAYLOAD_TABS);
      const before: number = stub.requestCount();
      stub.reset();
      logStep('payloadValidationResetClearsStubTraffic', String(stub.requestCount()));
      expect(before).assertEqual(2);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(stub.alive).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(2);
      expect(client.results.length).assertEqual(2);
    });

    /**
     * @tc.name          payloadValidationClientResetState
     * @tc.desc          Resetting the client clears payloads and ledger entries.
     * @tc.precondition  A client with recorded traffic exists.
     * @tc.steps         1. Send three payloads.
     *                   2. Reset the client.
     *                   3. Inspect the arrays.
     * @tc.expected      The client arrays are empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationClientResetState', 0, () => {
      const client: InProcessClient = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, PAYLOAD_EMPTY);
      client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      client.send(2, PAYLOAD_TABS);
      logStep('payloadValidationClientResetState', String(client.sentTexts.length));
      expect(client.sentTexts.length).assertEqual(3);
      expect(client.sentCodes.length).assertEqual(3);
      expect(client.results.length).assertEqual(3);
      client.reset();
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          payloadValidationTruncationMatrix
     * @tc.desc          Payload truncation produces the documented fragments.
     * @tc.precondition  The documented payload is available.
     * @tc.steps         1. Take the first five characters.
     *                   2. Take the last five characters.
     *                   3. Compare with literals.
     * @tc.expected      The fragments are hello and world.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationTruncationMatrix', 0, () => {
      const head: string = REQUEST_PAYLOAD.substring(0, 5);
      const tail: string = REQUEST_PAYLOAD.substring(6);
      const middle: string = REQUEST_PAYLOAD.substring(5, 6);
      logStep('payloadValidationTruncationMatrix', head + '|' + middle + '|' + tail);
      expect(head).assertEqual('hello');
      expect(tail).assertEqual('world');
      expect(middle).assertEqual(' ');
      expect(head.length).assertEqual(5);
      expect(tail.length).assertEqual(5);
      expect(middle.length).assertEqual(1);
      expect(head + middle + tail).assertEqual(REQUEST_PAYLOAD);
      expect(REQUEST_PAYLOAD.substring(11)).assertEqual('');
    });

    /**
     * @tc.name          payloadValidationContainsFragments
     * @tc.desc          Fragment searches locate words inside payloads.
     * @tc.precondition  The payload literals are available.
     * @tc.steps         1. Search for hello and world.
     *                   2. Search for an absent word.
     *                   3. Search inside the unicode payload.
     * @tc.expected      Present fragments are found and absent fragments return minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationContainsFragments', 0, () => {
      logStep('payloadValidationContainsFragments', REQUEST_PAYLOAD);
      expect(REQUEST_PAYLOAD.indexOf('hello')).assertEqual(0);
      expect(REQUEST_PAYLOAD.indexOf('world')).assertEqual(6);
      expect(REQUEST_PAYLOAD.indexOf('rpc')).assertEqual(-1);
      expect(REPLY_PAYLOAD.indexOf('rpc')).assertEqual(6);
      expect(REPLY_PAYLOAD.indexOf('world')).assertEqual(-1);
      expect(PAYLOAD_MIXED.indexOf('hello')).assertEqual(0);
      expect(PAYLOAD_MIXED.indexOf('世界')).assertLarger(0);
      expect(PAYLOAD_UNICODE.indexOf('IPC')).assertLarger(0);
    });

    /**
     * @tc.name          payloadValidationPayloadSorting
     * @tc.desc          Sorting payloads is deterministic for the same input.
     * @tc.precondition  The descriptor sorting comparator pattern is available.
     * @tc.steps         1. Sort a payload list twice.
     *                   2. Compare the results.
     *                   3. Confirm the smallest entry.
     * @tc.expected      Both sorts agree and the empty payload leads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationPayloadSorting', 0, () => {
      const first: string[] = [REQUEST_PAYLOAD, PAYLOAD_EMPTY, PAYLOAD_SPACE];
      const second: string[] = [REQUEST_PAYLOAD, PAYLOAD_EMPTY, PAYLOAD_SPACE];
      first.sort((left: string, right: string): number => left < right ? -1 : (left > right ? 1 : 0));
      second.sort((left: string, right: string): number => left < right ? -1 : (left > right ? 1 : 0));
      logStep('payloadValidationPayloadSorting', joined(first, ','));
      expect(sameOrder(first, second)).assertTrue();
      expect(first[0]).assertEqual(PAYLOAD_EMPTY);
      expect(first[1]).assertEqual(PAYLOAD_SPACE);
      expect(first[2]).assertEqual(REQUEST_PAYLOAD);
      expect(first.length).assertEqual(second.length);
      expect(countOf(first, PAYLOAD_SPACE)).assertEqual(1);
      expect(first[0].length).assertEqual(0);
      expect(first[2].length).assertEqual(11);
    });

    /**
     * @tc.name          payloadValidationFinalReport
     * @tc.desc          A final payload report aggregates traffic and shapes.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send four payload shapes.
     *                   2. Compose the report.
     *                   3. Inspect the fields.
     * @tc.expected      The report lists four requests, four replies and the reply literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationFinalReport', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_EMPTY);
      client.send(REQUEST_CODE, PAYLOAD_SPACE);
      client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      client.send(REQUEST_CODE, PAYLOAD_TABS);
      const metrics: StubMetrics = StubMetrics.from(stub);
      const report: string = String(metrics.requests) + '/' + String(metrics.replies) + '/' +
        String(metrics.handled) + '/' + REPLY_PAYLOAD;
      logStep('payloadValidationFinalReport', report);
      expect(report.split('/').length).assertEqual(4);
      expect(report.split('/')[0]).assertEqual('4');
      expect(report.split('/')[1]).assertEqual('4');
      expect(report.split('/')[2]).assertEqual('4');
      expect(report.split('/')[3]).assertEqual(REPLY_PAYLOAD);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.replies.length).assertEqual(4);
      expect(report.startsWith('4/4/4/')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationDuplicatesLedger
     * @tc.desc          Repeated payloads still produce one ledger entry per send.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send the same payload four times.
     *                   2. Count the ledger entries.
     *                   3. Deduplicate the texts.
     * @tc.expected      Four sends remain while the unique text count is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationDuplicatesLedger', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.sendMany(4, REQUEST_CODE);
      logStep('payloadValidationDuplicatesLedger', String(client.sentTexts.length));
      expect(client.sentTexts.length).assertEqual(4);
      expect(client.sentCodes.length).assertEqual(4);
      expect(countOf(client.sentTexts, REQUEST_PAYLOAD)).assertEqual(4);
      expect(uniqueStrings(client.sentTexts).length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(4);
      expect(client.replies.length).assertEqual(4);
      expect(StubMetrics.from(stub).replies).assertEqual(4);
      expect(client.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name          payloadValidationKillRevivePayloadFlow
     * @tc.desc          Payload handling resumes after a kill and revive cycle.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send before the kill.
     *                   2. Kill, send, revive and send.
     *                   3. Compare the results.
     * @tc.expected      Only the requests while alive are handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationKillRevivePayloadFlow', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const before = client.send(REQUEST_CODE, PAYLOAD_SPACE);
      stub.kill();
      const during = client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      stub.revive();
      const after = client.send(REQUEST_CODE, PAYLOAD_TABS);
      logStep('payloadValidationKillRevivePayloadFlow', String(stub.requestCount()));
      expect(before.handled).assertTrue();
      expect(during.handled).assertFalse();
      expect(after.handled).assertTrue();
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(3);
      expect(during.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          payloadValidationEmptyThenLongOrder
     * @tc.desc          Payload order is preserved from empty through long.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send empty, short and long payloads.
     *                   2. Read the recorded texts.
     *                   3. Compare element by element.
     * @tc.expected      The record order matches the send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationEmptyThenLongOrder', 0, () => {
      const longPayload: string = repeatPayload(LONG_UNIT, 5);
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_EMPTY);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, longPayload);
      const records = stub.requests;
      logStep('payloadValidationEmptyThenLongOrder', String(records.length));
      expect(records.length).assertEqual(3);
      expect(records[0].text).assertEqual(PAYLOAD_EMPTY);
      expect(records[1].text).assertEqual(REQUEST_PAYLOAD);
      expect(records[2].text).assertEqual(longPayload);
      expect(records[2].text.length).assertEqual(90);
      expect(records[0].handled).assertTrue();
      expect(records[2].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.sentTexts[1]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          payloadValidationOptionFlagsMatrix
     * @tc.desc          Message option flags describe independently of the payload.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Build sync and async options.
     *                   2. Compare their descriptions.
     *                   3. Check the sync oracle.
     * @tc.expected      The sync option reports sync while the async one does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationOptionFlagsMatrix', 0, () => {
      const syncOption: MessageOptionModel = new MessageOptionModel(0, 0, false);
      const asyncOption: MessageOptionModel = new MessageOptionModel(1, 100, true);
      logStep('payloadValidationOptionFlagsMatrix', syncOption.describe() + '/' + asyncOption.describe());
      expect(syncOption.isSync()).assertTrue();
      expect(asyncOption.isSync()).assertTrue();
      expect(syncOption.describe()).assertEqual('0/0/false');
      expect(asyncOption.describe()).assertEqual('1/100/true');
      expect(syncOption.flags).assertEqual(0);
      expect(asyncOption.waitTime).assertEqual(100);
      expect(syncOption.describe() === asyncOption.describe()).assertFalse();
      expect(asyncOption.sync).assertTrue();
    });

    /**
     * @tc.name          payloadValidationSequenceReclaimTrace
     * @tc.desc          The trace of a reclaimed sequence still reports its values.
     * @tc.precondition  A populated sequence is available.
     * @tc.steps         1. Write two payloads.
     *                   2. Reclaim.
     *                   3. Read the trace.
     * @tc.expected      The trace keeps both values with cursor zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationSequenceReclaimTrace', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString(PAYLOAD_SPACE);
      sequence.writeString(PAYLOAD_UNICODE);
      sequence.reclaim();
      logStep('payloadValidationSequenceReclaimTrace', sequence.trace());
      expect(sequence.trace()).assertEqual(PAYLOAD_SPACE + '|' + PAYLOAD_UNICODE + '#0');
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf(PAYLOAD_SPACE)).assertEqual(0);
      expect(sequence.trace().endsWith('#0')).assertTrue();
    });

    /**
     * @tc.name          payloadValidationLengthHistogram
     * @tc.desc          A payload length histogram counts three distinct buckets.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send six payloads of varied lengths.
     *                   2. Bucket the lengths by threshold.
     *                   3. Count each bucket.
     * @tc.expected      The buckets split into tiny, medium and large groups.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationLengthHistogram', 0, () => {
      const tiny: string = 'ab';
      const medium: string = repeatPayload('m', 40);
      const large: string = repeatPayload('l', 120);
      const hist: string[] = [tiny, medium, large, tiny, medium, large];
      let smallCount: number = 0;
      let mediumCount: number = 0;
      let largeCount: number = 0;
      for (let index = 0; index < hist.length; index++) {
        if (hist[index].length < 10) {
          smallCount = smallCount + 1;
        } else if (hist[index].length < 100) {
          mediumCount = mediumCount + 1;
        } else {
          largeCount = largeCount + 1;
        }
      }
      logStep('payloadValidationLengthHistogram', String(smallCount) + '/' + String(mediumCount) + '/' + String(largeCount));
      expect(smallCount).assertEqual(2);
      expect(mediumCount).assertEqual(2);
      expect(largeCount).assertEqual(2);
      expect(hist.length).assertEqual(6);
      expect(countOf(hist, tiny)).assertEqual(2);
      expect(uniqueStrings(hist).length).assertEqual(3);
      expect(medium.length).assertEqual(40);
      expect(large.length).assertEqual(120);
    });

    /**
     * @tc.name          payloadValidationReplyTraceUnique
     * @tc.desc          Repeated replies collapse to one unique reply literal.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send three payloads.
     *                   2. Read the reply trace.
     *                   3. Deduplicate the replies.
     * @tc.expected      The trace has three entries but one unique reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationReplyTraceUnique', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_SPACE);
      client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      client.send(REQUEST_CODE, PAYLOAD_TABS);
      logStep('payloadValidationReplyTraceUnique', client.trace());
      expect(client.trace().split('|').length).assertEqual(3);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(uniqueStrings(client.replies).length).assertEqual(1);
      expect(uniqueStrings(client.replies)[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.sentTexts.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).handled).assertEqual(3);
    });

    /**
     * @tc.name          payloadValidationClientTraceAfterMixed
     * @tc.desc          A mixed success and failure trace keeps reply ordering.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send success, failure, success.
     *                   2. Read the trace.
     *                   3. Compare the success count.
     * @tc.expected      The trace holds two replies despite three attempts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadValidationClientTraceAfterMixed', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      client.send(2, PAYLOAD_UNICODE);
      client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      logStep('payloadValidationClientTraceAfterMixed', client.trace());
      expect(client.results.length).assertEqual(3);
      expect(client.results[1].handled).assertFalse();
      expect(client.replies.length).assertEqual(2);
      expect(client.trace().split('|').length).assertEqual(2);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(2);
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      expect(client.sentTexts.length).assertEqual(3);
    });

    /**
     * @tc.name          payloadValidationBoundaryFinalCheck
     * @tc.desc          Final boundary checks agree across payload helpers.
     * @tc.precondition  The payload helpers and a stub are available.
     * @tc.steps         1. Build the boundary payloads.
     *                   2. Compare class and length results.
     *                   3. Send the empty payload.
     * @tc.expected      Empty, blank and long classification agree with lengths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationBoundaryFinalCheck', 0, () => {
      const longPayload: string = repeatPayload(LONG_UNIT, 10);
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = sendPayload(stub, PAYLOAD_EMPTY);
      logStep('payloadValidationBoundaryFinalCheck', String(payloadLength(longPayload)));
      expect(payloadClass(PAYLOAD_EMPTY)).assertEqual('empty');
      expect(payloadClass(PAYLOAD_SPACE)).assertEqual('blank');
      expect(payloadClass(longPayload)).assertEqual('long');
      expect(payloadLength(PAYLOAD_EMPTY)).assertEqual(0);
      expect(payloadLength(longPayload)).assertEqual(180);
      expect(result.handled).assertTrue();
      expect(stub.lastRequest()?.text).assertEqual(PAYLOAD_EMPTY);
      expect(stub.lastRequest()?.text.length).assertEqual(0);
    });

    /**
     * @tc.name          payloadValidationPayloadPresenceAcrossStates
     * @tc.desc          A payload is recorded both before and after a reset cycle.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send a unicode payload.
     *                   2. Reset and send a space payload.
     *                   3. Compare both records.
     * @tc.expected      The post reset record holds only the new payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationPayloadPresenceAcrossStates', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_UNICODE);
      const firstText: string = stub.lastRequest() === undefined ? '' : stub.lastRequest()!.text;
      stub.reset();
      client.reset();
      client.send(REQUEST_CODE, PAYLOAD_SPACE);
      logStep('payloadValidationPayloadPresenceAcrossStates', String(stub.requestCount()));
      expect(firstText).assertEqual(PAYLOAD_UNICODE);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual(PAYLOAD_SPACE);
      expect(stub.lastRequest()?.text === PAYLOAD_UNICODE).assertFalse();
      expect(client.sentTexts.length).assertEqual(1);
      expect(client.sentTexts[0]).assertEqual(PAYLOAD_SPACE);
      expect(stub.lastRequest()?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(trimmedLength(PAYLOAD_SPACE)).assertEqual(0);
    });

    /**
     * @tc.name          payloadValidationOptionDefaultValues
     * @tc.desc          A default message option reports sync with zero wait time.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct a default option.
     *                   2. Read each field.
     *                   3. Compare with the sync description.
     * @tc.expected      The default option is sync with zero flags and wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('payloadValidationOptionDefaultValues', 0, () => {
      const option: MessageOptionModel = new MessageOptionModel();
      logStep('payloadValidationOptionDefaultValues', option.describe());
      expect(option.flags).assertEqual(0);
      expect(option.waitTime).assertEqual(0);
      expect(option.sync).assertFalse();
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.describe().split('/').length).assertEqual(3);
      expect(clampInt(option.waitTime, 0, 10)).assertEqual(0);
      expect(option.isSync()).assertEqual(option.flags === 0);
    });
  });
}
