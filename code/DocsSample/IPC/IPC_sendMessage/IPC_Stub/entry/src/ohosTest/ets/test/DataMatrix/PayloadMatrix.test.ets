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
  STUB_DESCRIPTOR, REQUEST_CODE, REQUEST_PAYLOAD, REPLY_PAYLOAD, ERROR_STUB_REJECTED,
  StubRemoteObjectModel, InProcessClient, RequestResultModel, StubMetrics, joined, countOf, textFingerprint
} from '../Shared/SharedDriver';

class MatrixRow {
  public payload: string;
  public reply: string;
  public handled: boolean;
  public recorded: string;

  constructor(payload: string, reply: string, handled: boolean, recorded: string) {
    this.payload = payload;
    this.reply = reply;
    this.handled = handled;
    this.recorded = recorded;
  }

  public describe(): string {
    return this.payload + '>' + this.reply + '>' + String(this.handled);
  }
}

function newClient(): InProcessClient {
  return new InProcessClient(new StubRemoteObjectModel(STUB_DESCRIPTOR));
}

function roundTrip(payload: string, code: number = REQUEST_CODE): MatrixRow {
  const client: InProcessClient = newClient();
  const result: RequestResultModel = client.send(code, payload);
  const record = client.stub.lastRequest();
  return new MatrixRow(payload, result.replyText, result.handled,
    record === undefined ? '' : record.text);
}

function buildPayload(size: number): string {
  let text = 'm';
  while (text.length < size) {
    text = text + 'n';
  }
  return text;
}

function listOf(values: string[]): string {
  return joined(values, '|');
}

export default function payloadMatrix(): void {
  describe('PayloadMatrixTest', () => {
    beforeAll(() => {
      logSuite('PayloadMatrixTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PayloadMatrixTest', 'end');
    });

    /**
     * @tc.name          payloadMatrixEchoesHelloWorld
     * @tc.desc          Payload hello world survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload hello world.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesHelloWorld', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'hello world');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('hello world');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesHelloWorld", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesHelloRpc
     * @tc.desc          Payload hello rpc survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload hello rpc.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesHelloRpc', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'hello rpc');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('hello rpc');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('hello rpc');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesHelloRpc", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesPing
     * @tc.desc          Payload ping survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload ping.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesPing', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'ping');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('ping');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('ping');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesPing", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesSingleCharacter
     * @tc.desc          Payload single character survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload single character.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesSingleCharacter', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'a');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('a');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('a');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesSingleCharacter", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesAlphanumericPair
     * @tc.desc          Payload alphanumeric pair survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload alphanumeric pair.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesAlphanumericPair', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'Z9');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('Z9');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('Z9');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesAlphanumericPair", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesUnderscoreName
     * @tc.desc          Payload underscore name survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload underscore name.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesUnderscoreName', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'A_B');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('A_B');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('A_B');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesUnderscoreName", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesKebabName
     * @tc.desc          Payload kebab name survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload kebab name.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesKebabName', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'kebab-case');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('kebab-case');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('kebab-case');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesKebabName", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesPathLikeValue
     * @tc.desc          Payload path like value survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload path like value.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesPathLikeValue', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'path/like/value');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('path/like/value');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('path/like/value');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesPathLikeValue", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesJsonObject
     * @tc.desc          Payload json object survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload json object.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesJsonObject', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'json={"k":1}');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('json={"k":1}');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('json={"k":1}');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesJsonObject", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesQuotedText
     * @tc.desc          Payload quoted text survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload quoted text.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesQuotedText', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'quoted"text"');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('quoted"text"');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('quoted"text"');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesQuotedText", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesBackslashValue
     * @tc.desc          Payload backslash value survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload backslash value.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesBackslashValue', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'back\\slash');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('back\\slash');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('back\\slash');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesBackslashValue", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixEchoesSpacedSentence
     * @tc.desc          Payload spaced sentence survives the send and is echoed in the stub record.
     * @tc.precondition  A fresh in-process client drives the production stub.
     * @tc.steps         1. Send code 1 with the payload spaced sentence.
     *                   2. Read the reply and the recorded request.
     *                   3. Compare the recorded text with the payload.
     *                   4. Check the sent-text ledger.
     * @tc.expected      The request is handled, the reply is hello rpc, and the record echoes the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('payloadMatrixEchoesSpacedSentence', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(REQUEST_CODE, 'space inside payload');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual('space inside payload');
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(client.sentTexts[0]).assertEqual('space inside payload');
      expect(client.sentCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(1);
      logStep("payloadMatrixEchoesSpacedSentence", record === undefined ? "" : record.describe());
    });

    /**
     * @tc.name          payloadMatrixRowsOfSingleLetters
     * @tc.desc          The single letters matrix sends every payload through the same stub.
     * @tc.precondition  A payload list with the stated entries is prepared.
     * @tc.steps         1. Create one client and one stub for the whole matrix.
     *                   2. Send each payload with code 1.
     *                   3. Compare recorded text with the sent payload at each index.
     *                   4. Count replies and trace segments.
     * @tc.expected      Every row succeeds with the constant reply and the ledger preserves index order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRowsOfSingleLetters', 0, () => {
      const payloads: string[] = ['a', 'b', 'c', 'd'];
      const client: InProcessClient = newClient();
      let handled: number = 0;
      for (let index = 0; index < payloads.length; index++) {
        const result: RequestResultModel = client.send(REQUEST_CODE, payloads[index]);
        if (result.isSuccess()) {
          handled = handled + 1;
        }
        expect(client.stub.requests[index].text).assertEqual(payloads[index]);
      }
      expect(handled).assertEqual(payloads.length);
      expect(client.replies.length).assertEqual(payloads.length);
      expect(client.sentTexts.length).assertEqual(payloads.length);
      expect(client.trace().split("|").length).assertEqual(payloads.length);
      expect(StubMetrics.from(client.stub).handled).assertEqual(payloads.length);
      logStep("payloadMatrixRowsOfSingleLetters", listOf(payloads));
    });

    /**
     * @tc.name          payloadMatrixRowsOfNumberWords
     * @tc.desc          The number words matrix sends every payload through the same stub.
     * @tc.precondition  A payload list with the stated entries is prepared.
     * @tc.steps         1. Create one client and one stub for the whole matrix.
     *                   2. Send each payload with code 1.
     *                   3. Compare recorded text with the sent payload at each index.
     *                   4. Count replies and trace segments.
     * @tc.expected      Every row succeeds with the constant reply and the ledger preserves index order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRowsOfNumberWords', 0, () => {
      const payloads: string[] = ['one', 'two', 'three', 'four'];
      const client: InProcessClient = newClient();
      let handled: number = 0;
      for (let index = 0; index < payloads.length; index++) {
        const result: RequestResultModel = client.send(REQUEST_CODE, payloads[index]);
        if (result.isSuccess()) {
          handled = handled + 1;
        }
        expect(client.stub.requests[index].text).assertEqual(payloads[index]);
      }
      expect(handled).assertEqual(payloads.length);
      expect(client.replies.length).assertEqual(payloads.length);
      expect(client.sentTexts.length).assertEqual(payloads.length);
      expect(client.trace().split("|").length).assertEqual(payloads.length);
      expect(StubMetrics.from(client.stub).handled).assertEqual(payloads.length);
      logStep("payloadMatrixRowsOfNumberWords", listOf(payloads));
    });

    /**
     * @tc.name          payloadMatrixRowsOfShortKeys
     * @tc.desc          The short keys matrix sends every payload through the same stub.
     * @tc.precondition  A payload list with the stated entries is prepared.
     * @tc.steps         1. Create one client and one stub for the whole matrix.
     *                   2. Send each payload with code 1.
     *                   3. Compare recorded text with the sent payload at each index.
     *                   4. Count replies and trace segments.
     * @tc.expected      Every row succeeds with the constant reply and the ledger preserves index order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRowsOfShortKeys', 0, () => {
      const payloads: string[] = ['x1', 'x2', 'x3', 'x4'];
      const client: InProcessClient = newClient();
      let handled: number = 0;
      for (let index = 0; index < payloads.length; index++) {
        const result: RequestResultModel = client.send(REQUEST_CODE, payloads[index]);
        if (result.isSuccess()) {
          handled = handled + 1;
        }
        expect(client.stub.requests[index].text).assertEqual(payloads[index]);
      }
      expect(handled).assertEqual(payloads.length);
      expect(client.replies.length).assertEqual(payloads.length);
      expect(client.sentTexts.length).assertEqual(payloads.length);
      expect(client.trace().split("|").length).assertEqual(payloads.length);
      expect(StubMetrics.from(client.stub).handled).assertEqual(payloads.length);
      logStep("payloadMatrixRowsOfShortKeys", listOf(payloads));
    });

    /**
     * @tc.name          payloadMatrixRowsOfGreekNames
     * @tc.desc          The greek names matrix sends every payload through the same stub.
     * @tc.precondition  A payload list with the stated entries is prepared.
     * @tc.steps         1. Create one client and one stub for the whole matrix.
     *                   2. Send each payload with code 1.
     *                   3. Compare recorded text with the sent payload at each index.
     *                   4. Count replies and trace segments.
     * @tc.expected      Every row succeeds with the constant reply and the ledger preserves index order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRowsOfGreekNames', 0, () => {
      const payloads: string[] = ['alpha', 'beta', 'gamma', 'delta'];
      const client: InProcessClient = newClient();
      let handled: number = 0;
      for (let index = 0; index < payloads.length; index++) {
        const result: RequestResultModel = client.send(REQUEST_CODE, payloads[index]);
        if (result.isSuccess()) {
          handled = handled + 1;
        }
        expect(client.stub.requests[index].text).assertEqual(payloads[index]);
      }
      expect(handled).assertEqual(payloads.length);
      expect(client.replies.length).assertEqual(payloads.length);
      expect(client.sentTexts.length).assertEqual(payloads.length);
      expect(client.trace().split("|").length).assertEqual(payloads.length);
      expect(StubMetrics.from(client.stub).handled).assertEqual(payloads.length);
      logStep("payloadMatrixRowsOfGreekNames", listOf(payloads));
    });

    /**
     * @tc.name          payloadMatrixRowsOfAssignments
     * @tc.desc          The assignments matrix sends every payload through the same stub.
     * @tc.precondition  A payload list with the stated entries is prepared.
     * @tc.steps         1. Create one client and one stub for the whole matrix.
     *                   2. Send each payload with code 1.
     *                   3. Compare recorded text with the sent payload at each index.
     *                   4. Count replies and trace segments.
     * @tc.expected      Every row succeeds with the constant reply and the ledger preserves index order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRowsOfAssignments', 0, () => {
      const payloads: string[] = ['k1=v1', 'k2=v2', 'k3=v3', 'k4=v4'];
      const client: InProcessClient = newClient();
      let handled: number = 0;
      for (let index = 0; index < payloads.length; index++) {
        const result: RequestResultModel = client.send(REQUEST_CODE, payloads[index]);
        if (result.isSuccess()) {
          handled = handled + 1;
        }
        expect(client.stub.requests[index].text).assertEqual(payloads[index]);
      }
      expect(handled).assertEqual(payloads.length);
      expect(client.replies.length).assertEqual(payloads.length);
      expect(client.sentTexts.length).assertEqual(payloads.length);
      expect(client.trace().split("|").length).assertEqual(payloads.length);
      expect(StubMetrics.from(client.stub).handled).assertEqual(payloads.length);
      logStep("payloadMatrixRowsOfAssignments", listOf(payloads));
    });

    /**
     * @tc.name          payloadMatrixRowsOfDirections
     * @tc.desc          The directions matrix sends every payload through the same stub.
     * @tc.precondition  A payload list with the stated entries is prepared.
     * @tc.steps         1. Create one client and one stub for the whole matrix.
     *                   2. Send each payload with code 1.
     *                   3. Compare recorded text with the sent payload at each index.
     *                   4. Count replies and trace segments.
     * @tc.expected      Every row succeeds with the constant reply and the ledger preserves index order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRowsOfDirections', 0, () => {
      const payloads: string[] = ['north', 'south', 'east', 'west'];
      const client: InProcessClient = newClient();
      let handled: number = 0;
      for (let index = 0; index < payloads.length; index++) {
        const result: RequestResultModel = client.send(REQUEST_CODE, payloads[index]);
        if (result.isSuccess()) {
          handled = handled + 1;
        }
        expect(client.stub.requests[index].text).assertEqual(payloads[index]);
      }
      expect(handled).assertEqual(payloads.length);
      expect(client.replies.length).assertEqual(payloads.length);
      expect(client.sentTexts.length).assertEqual(payloads.length);
      expect(client.trace().split("|").length).assertEqual(payloads.length);
      expect(StubMetrics.from(client.stub).handled).assertEqual(payloads.length);
      logStep("payloadMatrixRowsOfDirections", listOf(payloads));
    });

    /**
     * @tc.name          payloadMatrixKeepsChinesePasswordUnits
     * @tc.desc          Unicode payload chinese password round-trips without width loss.
     * @tc.precondition  The payload uses multibyte characters including surrogate pairs.
     * @tc.steps         1. Send the unicode payload.
     *                   2. Compare the recorded text with the input.
     *                   3. Measure the unit length on both sides.
     *                   4. Check the reply literal.
     * @tc.expected      The echo is exact and the reply remains the ASCII production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsChinesePasswordUnits', 0, () => {
      const payload: string = '节点密码';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.payload).assertEqual(payload);
      expect(row.recorded).assertEqual(payload);
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.recorded.length).assertEqual(4);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply.indexOf(payload)).assertEqual(-1);
      expect(row.describe().indexOf(payload) >= 0).assertTrue();
      logStep("payloadMatrixKeepsChinesePasswordUnits", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsAccentedWordUnits
     * @tc.desc          Unicode payload accented word round-trips without width loss.
     * @tc.precondition  The payload uses multibyte characters including surrogate pairs.
     * @tc.steps         1. Send the unicode payload.
     *                   2. Compare the recorded text with the input.
     *                   3. Measure the unit length on both sides.
     *                   4. Check the reply literal.
     * @tc.expected      The echo is exact and the reply remains the ASCII production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsAccentedWordUnits', 0, () => {
      const payload: string = 'café';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.payload).assertEqual(payload);
      expect(row.recorded).assertEqual(payload);
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.recorded.length).assertEqual(4);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply.indexOf(payload)).assertEqual(-1);
      expect(row.describe().indexOf(payload) >= 0).assertTrue();
      logStep("payloadMatrixKeepsAccentedWordUnits", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsJapaneseUnits
     * @tc.desc          Unicode payload japanese word round-trips without width loss.
     * @tc.precondition  The payload uses multibyte characters including surrogate pairs.
     * @tc.steps         1. Send the unicode payload.
     *                   2. Compare the recorded text with the input.
     *                   3. Measure the unit length on both sides.
     *                   4. Check the reply literal.
     * @tc.expected      The echo is exact and the reply remains the ASCII production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsJapaneseUnits', 0, () => {
      const payload: string = '日本語';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.payload).assertEqual(payload);
      expect(row.recorded).assertEqual(payload);
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.recorded.length).assertEqual(3);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply.indexOf(payload)).assertEqual(-1);
      expect(row.describe().indexOf(payload) >= 0).assertTrue();
      logStep("payloadMatrixKeepsJapaneseUnits", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsDiaeresisUnits
     * @tc.desc          Unicode payload diaeresis word round-trips without width loss.
     * @tc.precondition  The payload uses multibyte characters including surrogate pairs.
     * @tc.steps         1. Send the unicode payload.
     *                   2. Compare the recorded text with the input.
     *                   3. Measure the unit length on both sides.
     *                   4. Check the reply literal.
     * @tc.expected      The echo is exact and the reply remains the ASCII production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsDiaeresisUnits', 0, () => {
      const payload: string = 'naïve';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.payload).assertEqual(payload);
      expect(row.recorded).assertEqual(payload);
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.recorded.length).assertEqual(5);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply.indexOf(payload)).assertEqual(-1);
      expect(row.describe().indexOf(payload) >= 0).assertTrue();
      logStep("payloadMatrixKeepsDiaeresisUnits", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsEmojiSurrogatePair
     * @tc.desc          Unicode payload emoji pair round-trips without width loss.
     * @tc.precondition  The payload uses multibyte characters including surrogate pairs.
     * @tc.steps         1. Send the unicode payload.
     *                   2. Compare the recorded text with the input.
     *                   3. Measure the unit length on both sides.
     *                   4. Check the reply literal.
     * @tc.expected      The echo is exact and the reply remains the ASCII production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsEmojiSurrogatePair', 0, () => {
      const payload: string = '😀';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.payload).assertEqual(payload);
      expect(row.recorded).assertEqual(payload);
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.recorded.length).assertEqual(2);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply.indexOf(payload)).assertEqual(-1);
      expect(row.describe().indexOf(payload) >= 0).assertTrue();
      logStep("payloadMatrixKeepsEmojiSurrogatePair", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsMixedScriptUnits
     * @tc.desc          Unicode payload mixed script round-trips without width loss.
     * @tc.precondition  The payload uses multibyte characters including surrogate pairs.
     * @tc.steps         1. Send the unicode payload.
     *                   2. Compare the recorded text with the input.
     *                   3. Measure the unit length on both sides.
     *                   4. Check the reply literal.
     * @tc.expected      The echo is exact and the reply remains the ASCII production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsMixedScriptUnits', 0, () => {
      const payload: string = 'IPC-节点';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.payload).assertEqual(payload);
      expect(row.recorded).assertEqual(payload);
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.recorded.length).assertEqual(6);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply.indexOf(payload)).assertEqual(-1);
      expect(row.describe().indexOf(payload) >= 0).assertTrue();
      logStep("payloadMatrixKeepsMixedScriptUnits", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsNewlineInside
     * @tc.desc          Payload newline pair with embedded breaks is echoed byte for byte.
     * @tc.precondition  The stub performs no payload sanitization, only the logger does.
     * @tc.steps         1. Send the break-bearing payload.
     *                   2. Split the recorded echo on the separator.
     *                   3. Compare part counts and fingerprints.
     *                   4. Check the reply has no break.
     * @tc.expected      The stub preserves every break and still returns the constant reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsNewlineInside', 0, () => {
      const payload: string = 'a\nb';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.recorded).assertEqual(payload);
      expect(row.recorded.split('\n').length).assertEqual(2);
      expect(payload.split('\n').length).assertEqual(2);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.reply.indexOf('\n')).assertEqual(-1);
      expect(row.recorded.length).assertEqual(payload.length);
      logStep("payloadMatrixKeepsNewlineInside", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsCrLfInside
     * @tc.desc          Payload crlf pair with embedded breaks is echoed byte for byte.
     * @tc.precondition  The stub performs no payload sanitization, only the logger does.
     * @tc.steps         1. Send the break-bearing payload.
     *                   2. Split the recorded echo on the separator.
     *                   3. Compare part counts and fingerprints.
     *                   4. Check the reply has no break.
     * @tc.expected      The stub preserves every break and still returns the constant reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsCrLfInside', 0, () => {
      const payload: string = 'a\r\nb';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.recorded).assertEqual(payload);
      expect(row.recorded.split('\r\n').length).assertEqual(2);
      expect(payload.split('\r\n').length).assertEqual(2);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.reply.indexOf('\r\n')).assertEqual(-1);
      expect(row.recorded.length).assertEqual(payload.length);
      logStep("payloadMatrixKeepsCrLfInside", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsThreeLines
     * @tc.desc          Payload three lines with embedded breaks is echoed byte for byte.
     * @tc.precondition  The stub performs no payload sanitization, only the logger does.
     * @tc.steps         1. Send the break-bearing payload.
     *                   2. Split the recorded echo on the separator.
     *                   3. Compare part counts and fingerprints.
     *                   4. Check the reply has no break.
     * @tc.expected      The stub preserves every break and still returns the constant reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsThreeLines', 0, () => {
      const payload: string = 'line1\nline2\nline3';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.recorded).assertEqual(payload);
      expect(row.recorded.split('\n').length).assertEqual(3);
      expect(payload.split('\n').length).assertEqual(3);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.reply.indexOf('\n')).assertEqual(-1);
      expect(row.recorded.length).assertEqual(payload.length);
      logStep("payloadMatrixKeepsThreeLines", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsTabInside
     * @tc.desc          Payload tab pair with embedded breaks is echoed byte for byte.
     * @tc.precondition  The stub performs no payload sanitization, only the logger does.
     * @tc.steps         1. Send the break-bearing payload.
     *                   2. Split the recorded echo on the separator.
     *                   3. Compare part counts and fingerprints.
     *                   4. Check the reply has no break.
     * @tc.expected      The stub preserves every break and still returns the constant reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsTabInside', 0, () => {
      const payload: string = 'tab\there';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.recorded).assertEqual(payload);
      expect(row.recorded.split('\t').length).assertEqual(2);
      expect(payload.split('\t').length).assertEqual(2);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.reply.indexOf('\t')).assertEqual(-1);
      expect(row.recorded.length).assertEqual(payload.length);
      logStep("payloadMatrixKeepsTabInside", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsCarriageReturn
     * @tc.desc          Payload carriage return pair with embedded breaks is echoed byte for byte.
     * @tc.precondition  The stub performs no payload sanitization, only the logger does.
     * @tc.steps         1. Send the break-bearing payload.
     *                   2. Split the recorded echo on the separator.
     *                   3. Compare part counts and fingerprints.
     *                   4. Check the reply has no break.
     * @tc.expected      The stub preserves every break and still returns the constant reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsCarriageReturn', 0, () => {
      const payload: string = 'a\rb';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.recorded).assertEqual(payload);
      expect(row.recorded.split('\r').length).assertEqual(2);
      expect(payload.split('\r').length).assertEqual(2);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.reply.indexOf('\r')).assertEqual(-1);
      expect(row.recorded.length).assertEqual(payload.length);
      logStep("payloadMatrixKeepsCarriageReturn", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixKeepsEmptyLine
     * @tc.desc          Payload empty line with embedded breaks is echoed byte for byte.
     * @tc.precondition  The stub performs no payload sanitization, only the logger does.
     * @tc.steps         1. Send the break-bearing payload.
     *                   2. Split the recorded echo on the separator.
     *                   3. Compare part counts and fingerprints.
     *                   4. Check the reply has no break.
     * @tc.expected      The stub preserves every break and still returns the constant reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixKeepsEmptyLine', 0, () => {
      const payload: string = 'x\n\ny';
      const row: MatrixRow = roundTrip(payload);
      expect(row.handled).assertTrue();
      expect(row.recorded).assertEqual(payload);
      expect(row.recorded.split('\n').length).assertEqual(3);
      expect(payload.split('\n').length).assertEqual(3);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.reply.indexOf('\n')).assertEqual(-1);
      expect(row.recorded.length).assertEqual(payload.length);
      logStep("payloadMatrixKeepsEmptyLine", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongSixtyFour
     * @tc.desc          A payload of 64 characters labelled sixty four bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 64 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongSixtyFour', 0, () => {
      const payload: string = buildPayload(64);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(64);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(64);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongSixtyFour", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongOneHundred
     * @tc.desc          A payload of 100 characters labelled one hundred bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 100 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongOneHundred', 0, () => {
      const payload: string = buildPayload(100);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(100);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(100);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongOneHundred", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongOneTwentyEight
     * @tc.desc          A payload of 128 characters labelled one twenty eight bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 128 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongOneTwentyEight', 0, () => {
      const payload: string = buildPayload(128);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(128);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(128);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongOneTwentyEight", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongTwoFiftySix
     * @tc.desc          A payload of 256 characters labelled two fifty six bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 256 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongTwoFiftySix', 0, () => {
      const payload: string = buildPayload(256);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(256);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(256);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongTwoFiftySix", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongFiveTwelve
     * @tc.desc          A payload of 512 characters labelled five twelve bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 512 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongFiveTwelve', 0, () => {
      const payload: string = buildPayload(512);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(512);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(512);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongFiveTwelve", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongOneK
     * @tc.desc          A payload of 1024 characters labelled one k bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 1024 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongOneK', 0, () => {
      const payload: string = buildPayload(1024);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(1024);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(1024);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongOneK", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongTwoK
     * @tc.desc          A payload of 2048 characters labelled two k bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 2048 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongTwoK', 0, () => {
      const payload: string = buildPayload(2048);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(2048);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(2048);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongTwoK", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixLongFourK
     * @tc.desc          A payload of 4096 characters labelled four k bytes round-trips intact.
     * @tc.precondition  The payload is grown from a single seed character.
     * @tc.steps         1. Grow the payload to 4096 characters.
     *                   2. Send it and compare the echo length.
     *                   3. Compare fingerprints on both sides.
     *                   4. Check the constant reply.
     * @tc.expected      The echo length equals the payload length and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixLongFourK', 0, () => {
      const payload: string = buildPayload(4096);
      const row: MatrixRow = roundTrip(payload);
      expect(payload.length).assertEqual(4096);
      expect(row.handled).assertTrue();
      expect(row.recorded.length).assertEqual(4096);
      expect(row.recorded).assertEqual(payload);
      expect(textFingerprint(row.recorded)).assertEqual(textFingerprint(payload));
      expect(row.reply).assertEqual(REPLY_PAYLOAD);
      expect(row.describe().length > payload.length).assertTrue();
      expect(row.payload).assertEqual(payload);
      logStep("payloadMatrixLongFourK", String(row.recorded.length));
    });

    /**
     * @tc.name          payloadMatrixRejectsZeroCode
     * @tc.desc          Code 0 with the zero code payload payload is refused before reading.
     * @tc.precondition  The stub accepts only the production request code.
     * @tc.steps         1. Send the payload under code 0.
     *                   2. Read the recorded text and reply.
     *                   3. Check the result error code.
     *                   4. Confirm the payload was still dispatched.
     * @tc.expected      The refusal keeps the record text empty while the client ledger keeps the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRejectsZeroCode', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(0, 'hello world');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual("");
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual("");
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(client.sentCodes[0]).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      logStep("payloadMatrixRejectsZeroCode", String(result.errCode));
    });

    /**
     * @tc.name          payloadMatrixRejectsTwoCode
     * @tc.desc          Code 2 with the two code payload payload is refused before reading.
     * @tc.precondition  The stub accepts only the production request code.
     * @tc.steps         1. Send the payload under code 2.
     *                   2. Read the recorded text and reply.
     *                   3. Check the result error code.
     *                   4. Confirm the payload was still dispatched.
     * @tc.expected      The refusal keeps the record text empty while the client ledger keeps the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRejectsTwoCode', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(2, 'hello world');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual("");
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual("");
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(client.sentCodes[0]).assertEqual(2);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      logStep("payloadMatrixRejectsTwoCode", String(result.errCode));
    });

    /**
     * @tc.name          payloadMatrixRejectsNegativeCode
     * @tc.desc          Code -1 with the negative code payload payload is refused before reading.
     * @tc.precondition  The stub accepts only the production request code.
     * @tc.steps         1. Send the payload under code -1.
     *                   2. Read the recorded text and reply.
     *                   3. Check the result error code.
     *                   4. Confirm the payload was still dispatched.
     * @tc.expected      The refusal keeps the record text empty while the client ledger keeps the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRejectsNegativeCode', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(-1, 'hello world');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual("");
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual("");
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(client.sentCodes[0]).assertEqual(-1);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      logStep("payloadMatrixRejectsNegativeCode", String(result.errCode));
    });

    /**
     * @tc.name          payloadMatrixRejectsLargeCode
     * @tc.desc          Code 99 with the large code payload payload is refused before reading.
     * @tc.precondition  The stub accepts only the production request code.
     * @tc.steps         1. Send the payload under code 99.
     *                   2. Read the recorded text and reply.
     *                   3. Check the result error code.
     *                   4. Confirm the payload was still dispatched.
     * @tc.expected      The refusal keeps the record text empty while the client ledger keeps the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRejectsLargeCode', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(99, 'hello world');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual("");
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual("");
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(client.sentCodes[0]).assertEqual(99);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      logStep("payloadMatrixRejectsLargeCode", String(result.errCode));
    });

    /**
     * @tc.name          payloadMatrixRejectsSevenCode
     * @tc.desc          Code 7 with the seven code payload payload is refused before reading.
     * @tc.precondition  The stub accepts only the production request code.
     * @tc.steps         1. Send the payload under code 7.
     *                   2. Read the recorded text and reply.
     *                   3. Check the result error code.
     *                   4. Confirm the payload was still dispatched.
     * @tc.expected      The refusal keeps the record text empty while the client ledger keeps the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRejectsSevenCode', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(7, 'hello world');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual("");
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual("");
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(client.sentCodes[0]).assertEqual(7);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      logStep("payloadMatrixRejectsSevenCode", String(result.errCode));
    });

    /**
     * @tc.name          payloadMatrixRejectsThreeCode
     * @tc.desc          Code 3 with the three code payload payload is refused before reading.
     * @tc.precondition  The stub accepts only the production request code.
     * @tc.steps         1. Send the payload under code 3.
     *                   2. Read the recorded text and reply.
     *                   3. Check the result error code.
     *                   4. Confirm the payload was still dispatched.
     * @tc.expected      The refusal keeps the record text empty while the client ledger keeps the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixRejectsThreeCode', 0, () => {
      const client: InProcessClient = newClient();
      const result: RequestResultModel = client.send(3, 'hello world');
      const record = client.stub.lastRequest();
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual("");
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual("");
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(client.sentCodes[0]).assertEqual(3);
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      logStep("payloadMatrixRejectsThreeCode", String(result.errCode));
    });

    /**
     * @tc.name          payloadMatrixConstantForShortPair
     * @tc.desc          Two different short pair payloads produce the same reply literal.
     * @tc.precondition  Both payloads are sent with the production code.
     * @tc.steps         1. Send the first payload.
     *                   2. Send the second payload on the same client.
     *                   3. Compare the two replies.
     *                   4. Join the reply trace.
     * @tc.expected      Both replies equal hello rpc and the trace repeats the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixConstantForShortPair', 0, () => {
      const client: InProcessClient = newClient();
      const first: RequestResultModel = client.send(REQUEST_CODE, 'ping');
      const second: RequestResultModel = client.send(REQUEST_CODE, 'pong');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.replyText).assertEqual(second.replyText);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + "|" + REPLY_PAYLOAD);
      expect(client.stub.requests[0].text).assertEqual('ping');
      expect(client.stub.requests[1].text).assertEqual('pong');
      expect(StubMetrics.from(client.stub).replies).assertEqual(2);
      logStep("payloadMatrixConstantForShortPair", client.trace());
    });

    /**
     * @tc.name          payloadMatrixConstantForHelloPair
     * @tc.desc          Two different hello pair payloads produce the same reply literal.
     * @tc.precondition  Both payloads are sent with the production code.
     * @tc.steps         1. Send the first payload.
     *                   2. Send the second payload on the same client.
     *                   3. Compare the two replies.
     *                   4. Join the reply trace.
     * @tc.expected      Both replies equal hello rpc and the trace repeats the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixConstantForHelloPair', 0, () => {
      const client: InProcessClient = newClient();
      const first: RequestResultModel = client.send(REQUEST_CODE, 'hello world');
      const second: RequestResultModel = client.send(REQUEST_CODE, 'hello rpc');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.replyText).assertEqual(second.replyText);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + "|" + REPLY_PAYLOAD);
      expect(client.stub.requests[0].text).assertEqual('hello world');
      expect(client.stub.requests[1].text).assertEqual('hello rpc');
      expect(StubMetrics.from(client.stub).replies).assertEqual(2);
      logStep("payloadMatrixConstantForHelloPair", client.trace());
    });

    /**
     * @tc.name          payloadMatrixConstantForNumberPair
     * @tc.desc          Two different number pair payloads produce the same reply literal.
     * @tc.precondition  Both payloads are sent with the production code.
     * @tc.steps         1. Send the first payload.
     *                   2. Send the second payload on the same client.
     *                   3. Compare the two replies.
     *                   4. Join the reply trace.
     * @tc.expected      Both replies equal hello rpc and the trace repeats the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixConstantForNumberPair', 0, () => {
      const client: InProcessClient = newClient();
      const first: RequestResultModel = client.send(REQUEST_CODE, 'one');
      const second: RequestResultModel = client.send(REQUEST_CODE, 'two');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.replyText).assertEqual(second.replyText);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + "|" + REPLY_PAYLOAD);
      expect(client.stub.requests[0].text).assertEqual('one');
      expect(client.stub.requests[1].text).assertEqual('two');
      expect(StubMetrics.from(client.stub).replies).assertEqual(2);
      logStep("payloadMatrixConstantForNumberPair", client.trace());
    });

    /**
     * @tc.name          payloadMatrixConstantForCasePair
     * @tc.desc          Two different case pair payloads produce the same reply literal.
     * @tc.precondition  Both payloads are sent with the production code.
     * @tc.steps         1. Send the first payload.
     *                   2. Send the second payload on the same client.
     *                   3. Compare the two replies.
     *                   4. Join the reply trace.
     * @tc.expected      Both replies equal hello rpc and the trace repeats the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixConstantForCasePair', 0, () => {
      const client: InProcessClient = newClient();
      const first: RequestResultModel = client.send(REQUEST_CODE, 'alpha');
      const second: RequestResultModel = client.send(REQUEST_CODE, 'ALPHA');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.replyText).assertEqual(second.replyText);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + "|" + REPLY_PAYLOAD);
      expect(client.stub.requests[0].text).assertEqual('alpha');
      expect(client.stub.requests[1].text).assertEqual('ALPHA');
      expect(StubMetrics.from(client.stub).replies).assertEqual(2);
      logStep("payloadMatrixConstantForCasePair", client.trace());
    });

    /**
     * @tc.name          payloadMatrixConstantForPathPair
     * @tc.desc          Two different path pair payloads produce the same reply literal.
     * @tc.precondition  Both payloads are sent with the production code.
     * @tc.steps         1. Send the first payload.
     *                   2. Send the second payload on the same client.
     *                   3. Compare the two replies.
     *                   4. Join the reply trace.
     * @tc.expected      Both replies equal hello rpc and the trace repeats the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixConstantForPathPair', 0, () => {
      const client: InProcessClient = newClient();
      const first: RequestResultModel = client.send(REQUEST_CODE, 'a/b');
      const second: RequestResultModel = client.send(REQUEST_CODE, 'a\\b');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.replyText).assertEqual(second.replyText);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + "|" + REPLY_PAYLOAD);
      expect(client.stub.requests[0].text).assertEqual('a/b');
      expect(client.stub.requests[1].text).assertEqual('a\\b');
      expect(StubMetrics.from(client.stub).replies).assertEqual(2);
      logStep("payloadMatrixConstantForPathPair", client.trace());
    });

    /**
     * @tc.name          payloadMatrixConstantForSpacePair
     * @tc.desc          Two different space pair payloads produce the same reply literal.
     * @tc.precondition  Both payloads are sent with the production code.
     * @tc.steps         1. Send the first payload.
     *                   2. Send the second payload on the same client.
     *                   3. Compare the two replies.
     *                   4. Join the reply trace.
     * @tc.expected      Both replies equal hello rpc and the trace repeats the literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixConstantForSpacePair', 0, () => {
      const client: InProcessClient = newClient();
      const first: RequestResultModel = client.send(REQUEST_CODE, 'a b');
      const second: RequestResultModel = client.send(REQUEST_CODE, 'a  b');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.replyText).assertEqual(second.replyText);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + "|" + REPLY_PAYLOAD);
      expect(client.stub.requests[0].text).assertEqual('a b');
      expect(client.stub.requests[1].text).assertEqual('a  b');
      expect(StubMetrics.from(client.stub).replies).assertEqual(2);
      logStep("payloadMatrixConstantForSpacePair", client.trace());
    });

    /**
     * @tc.name          payloadMatrixTraceOfSingleLetters
     * @tc.desc          The reply trace for the single letter trace payload list is stable.
     * @tc.precondition  Each payload is sent once with the production code.
     * @tc.steps         1. Send every payload in order.
     *                   2. Build the reply trace.
     *                   3. Compare with the expected trace literal.
     *                   4. Fingerprint the trace twice.
     * @tc.expected      The trace repeats hello rpc once per payload and its fingerprint is deterministic.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceOfSingleLetters', 0, () => {
      const payloads: string[] = ['a', 'b', 'c'];
      const client: InProcessClient = newClient();
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const trace: string = client.trace();
      expect(trace).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(trace.split("|").length).assertEqual(payloads.length);
      expect(textFingerprint(trace)).assertEqual(textFingerprint(client.trace()));
      expect(client.sentCodes.length).assertEqual(payloads.length);
      expect(client.results.length).assertEqual(payloads.length);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(payloads.length);
      logStep("payloadMatrixTraceOfSingleLetters", trace);
    });

    /**
     * @tc.name          payloadMatrixTraceOfNumberWords
     * @tc.desc          The reply trace for the number word trace payload list is stable.
     * @tc.precondition  Each payload is sent once with the production code.
     * @tc.steps         1. Send every payload in order.
     *                   2. Build the reply trace.
     *                   3. Compare with the expected trace literal.
     *                   4. Fingerprint the trace twice.
     * @tc.expected      The trace repeats hello rpc once per payload and its fingerprint is deterministic.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceOfNumberWords', 0, () => {
      const payloads: string[] = ['one', 'two', 'three'];
      const client: InProcessClient = newClient();
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const trace: string = client.trace();
      expect(trace).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(trace.split("|").length).assertEqual(payloads.length);
      expect(textFingerprint(trace)).assertEqual(textFingerprint(client.trace()));
      expect(client.sentCodes.length).assertEqual(payloads.length);
      expect(client.results.length).assertEqual(payloads.length);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(payloads.length);
      logStep("payloadMatrixTraceOfNumberWords", trace);
    });

    /**
     * @tc.name          payloadMatrixTraceOfShortKeys
     * @tc.desc          The reply trace for the short key trace payload list is stable.
     * @tc.precondition  Each payload is sent once with the production code.
     * @tc.steps         1. Send every payload in order.
     *                   2. Build the reply trace.
     *                   3. Compare with the expected trace literal.
     *                   4. Fingerprint the trace twice.
     * @tc.expected      The trace repeats hello rpc once per payload and its fingerprint is deterministic.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceOfShortKeys', 0, () => {
      const payloads: string[] = ['k1', 'k2', 'k3'];
      const client: InProcessClient = newClient();
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const trace: string = client.trace();
      expect(trace).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(trace.split("|").length).assertEqual(payloads.length);
      expect(textFingerprint(trace)).assertEqual(textFingerprint(client.trace()));
      expect(client.sentCodes.length).assertEqual(payloads.length);
      expect(client.results.length).assertEqual(payloads.length);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(payloads.length);
      logStep("payloadMatrixTraceOfShortKeys", trace);
    });

    /**
     * @tc.name          payloadMatrixTraceOfGreekNames
     * @tc.desc          The reply trace for the greek name trace payload list is stable.
     * @tc.precondition  Each payload is sent once with the production code.
     * @tc.steps         1. Send every payload in order.
     *                   2. Build the reply trace.
     *                   3. Compare with the expected trace literal.
     *                   4. Fingerprint the trace twice.
     * @tc.expected      The trace repeats hello rpc once per payload and its fingerprint is deterministic.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceOfGreekNames', 0, () => {
      const payloads: string[] = ['alpha', 'beta', 'gamma'];
      const client: InProcessClient = newClient();
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const trace: string = client.trace();
      expect(trace).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(trace.split("|").length).assertEqual(payloads.length);
      expect(textFingerprint(trace)).assertEqual(textFingerprint(client.trace()));
      expect(client.sentCodes.length).assertEqual(payloads.length);
      expect(client.results.length).assertEqual(payloads.length);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(payloads.length);
      logStep("payloadMatrixTraceOfGreekNames", trace);
    });

    /**
     * @tc.name          payloadMatrixTraceOfDirections
     * @tc.desc          The reply trace for the direction trace payload list is stable.
     * @tc.precondition  Each payload is sent once with the production code.
     * @tc.steps         1. Send every payload in order.
     *                   2. Build the reply trace.
     *                   3. Compare with the expected trace literal.
     *                   4. Fingerprint the trace twice.
     * @tc.expected      The trace repeats hello rpc once per payload and its fingerprint is deterministic.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceOfDirections', 0, () => {
      const payloads: string[] = ['north', 'south', 'east'];
      const client: InProcessClient = newClient();
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const trace: string = client.trace();
      expect(trace).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(trace.split("|").length).assertEqual(payloads.length);
      expect(textFingerprint(trace)).assertEqual(textFingerprint(client.trace()));
      expect(client.sentCodes.length).assertEqual(payloads.length);
      expect(client.results.length).assertEqual(payloads.length);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(payloads.length);
      logStep("payloadMatrixTraceOfDirections", trace);
    });

    /**
     * @tc.name          payloadMatrixTraceOfAssignments
     * @tc.desc          The reply trace for the assignment trace payload list is stable.
     * @tc.precondition  Each payload is sent once with the production code.
     * @tc.steps         1. Send every payload in order.
     *                   2. Build the reply trace.
     *                   3. Compare with the expected trace literal.
     *                   4. Fingerprint the trace twice.
     * @tc.expected      The trace repeats hello rpc once per payload and its fingerprint is deterministic.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixTraceOfAssignments', 0, () => {
      const payloads: string[] = ['k1=v1', 'k2=v2', 'k3=v3'];
      const client: InProcessClient = newClient();
      for (let index = 0; index < payloads.length; index++) {
        client.send(REQUEST_CODE, payloads[index]);
      }
      const trace: string = client.trace();
      expect(trace).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(trace.split("|").length).assertEqual(payloads.length);
      expect(textFingerprint(trace)).assertEqual(textFingerprint(client.trace()));
      expect(client.sentCodes.length).assertEqual(payloads.length);
      expect(client.results.length).assertEqual(payloads.length);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(payloads.length);
      logStep("payloadMatrixTraceOfAssignments", trace);
    });

    /**
     * @tc.name          payloadMatrixMetricsSingleRow
     * @tc.desc          All-success metrics for the single row matrix equal the row count.
     * @tc.precondition  Every payload in the list is sent with the production code.
     * @tc.steps         1. Send the whole list.
     *                   2. Build stub metrics.
     *                   3. Compare requests, handled, replies and rejected.
     *                   4. Check the success ratio and fingerprint.
     * @tc.expected      Requests, handled and replies all equal the row count with zero rejections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixMetricsSingleRow', 0, () => {
      const payloads: string[] = ['a'];
      const client: InProcessClient = newClient();
      client.sendMany(payloads.length, REQUEST_CODE);
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(payloads.length);
      expect(metrics.handled).assertEqual(payloads.length);
      expect(metrics.replies).assertEqual(payloads.length);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(client.stub).fingerprint());
      expect(client.stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      logStep("payloadMatrixMetricsSingleRow", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          payloadMatrixMetricsTwoRows
     * @tc.desc          All-success metrics for the two rows matrix equal the row count.
     * @tc.precondition  Every payload in the list is sent with the production code.
     * @tc.steps         1. Send the whole list.
     *                   2. Build stub metrics.
     *                   3. Compare requests, handled, replies and rejected.
     *                   4. Check the success ratio and fingerprint.
     * @tc.expected      Requests, handled and replies all equal the row count with zero rejections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixMetricsTwoRows', 0, () => {
      const payloads: string[] = ['a', 'b'];
      const client: InProcessClient = newClient();
      client.sendMany(payloads.length, REQUEST_CODE);
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(payloads.length);
      expect(metrics.handled).assertEqual(payloads.length);
      expect(metrics.replies).assertEqual(payloads.length);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(client.stub).fingerprint());
      expect(client.stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      logStep("payloadMatrixMetricsTwoRows", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          payloadMatrixMetricsThreeRows
     * @tc.desc          All-success metrics for the three rows matrix equal the row count.
     * @tc.precondition  Every payload in the list is sent with the production code.
     * @tc.steps         1. Send the whole list.
     *                   2. Build stub metrics.
     *                   3. Compare requests, handled, replies and rejected.
     *                   4. Check the success ratio and fingerprint.
     * @tc.expected      Requests, handled and replies all equal the row count with zero rejections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixMetricsThreeRows', 0, () => {
      const payloads: string[] = ['a', 'b', 'c'];
      const client: InProcessClient = newClient();
      client.sendMany(payloads.length, REQUEST_CODE);
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(payloads.length);
      expect(metrics.handled).assertEqual(payloads.length);
      expect(metrics.replies).assertEqual(payloads.length);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(client.stub).fingerprint());
      expect(client.stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      logStep("payloadMatrixMetricsThreeRows", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          payloadMatrixMetricsFourRows
     * @tc.desc          All-success metrics for the four rows matrix equal the row count.
     * @tc.precondition  Every payload in the list is sent with the production code.
     * @tc.steps         1. Send the whole list.
     *                   2. Build stub metrics.
     *                   3. Compare requests, handled, replies and rejected.
     *                   4. Check the success ratio and fingerprint.
     * @tc.expected      Requests, handled and replies all equal the row count with zero rejections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixMetricsFourRows', 0, () => {
      const payloads: string[] = ['a', 'b', 'c', 'd'];
      const client: InProcessClient = newClient();
      client.sendMany(payloads.length, REQUEST_CODE);
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(payloads.length);
      expect(metrics.handled).assertEqual(payloads.length);
      expect(metrics.replies).assertEqual(payloads.length);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(client.stub).fingerprint());
      expect(client.stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      logStep("payloadMatrixMetricsFourRows", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          payloadMatrixMetricsFiveRows
     * @tc.desc          All-success metrics for the five rows matrix equal the row count.
     * @tc.precondition  Every payload in the list is sent with the production code.
     * @tc.steps         1. Send the whole list.
     *                   2. Build stub metrics.
     *                   3. Compare requests, handled, replies and rejected.
     *                   4. Check the success ratio and fingerprint.
     * @tc.expected      Requests, handled and replies all equal the row count with zero rejections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixMetricsFiveRows', 0, () => {
      const payloads: string[] = ['a', 'b', 'c', 'd', 'e'];
      const client: InProcessClient = newClient();
      client.sendMany(payloads.length, REQUEST_CODE);
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(payloads.length);
      expect(metrics.handled).assertEqual(payloads.length);
      expect(metrics.replies).assertEqual(payloads.length);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(client.stub).fingerprint());
      expect(client.stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      logStep("payloadMatrixMetricsFiveRows", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          payloadMatrixMetricsSixRows
     * @tc.desc          All-success metrics for the six rows matrix equal the row count.
     * @tc.precondition  Every payload in the list is sent with the production code.
     * @tc.steps         1. Send the whole list.
     *                   2. Build stub metrics.
     *                   3. Compare requests, handled, replies and rejected.
     *                   4. Check the success ratio and fingerprint.
     * @tc.expected      Requests, handled and replies all equal the row count with zero rejections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('payloadMatrixMetricsSixRows', 0, () => {
      const payloads: string[] = ['a', 'b', 'c', 'd', 'e', 'f'];
      const client: InProcessClient = newClient();
      client.sendMany(payloads.length, REQUEST_CODE);
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(payloads.length);
      expect(metrics.handled).assertEqual(payloads.length);
      expect(metrics.replies).assertEqual(payloads.length);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(client.stub).fingerprint());
      expect(client.stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      logStep("payloadMatrixMetricsSixRows", String(metrics.fingerprint()));
    });
  });
}
