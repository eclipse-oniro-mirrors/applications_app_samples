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
  OPTION_FLAG_ASYNC,
  MessageSequenceModel,
  MessageOptionModel,
  StubRemoteObjectModel,
  InProcessClient,
  StubMetrics,
  replayCodes,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint
} from '../Shared/SharedDriver';

export default function stubLedgerTest(): void {
  describe('StubRequestLedger', () => {
    beforeAll(() => {
      logSuite('StubRequestLedger', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubRequestLedger', 'end');
    });

    /**
     * @tc.name   stubLedgerNewStubIsEmpty
     * @tc.desc   A new stub records no requests.
     * @tc.precondition  A freshly constructed stub.
     * @tc.steps         1. Read the request ledger.
     *                   2. Read the request count.
     *                   3. Read the last request.
     * @tc.expected      The ledger is empty and has no last request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLedgerNewStubIsEmpty', 0, () => {
      const stub = new StubRemoteObjectModel();
      expect(stub.requests.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(stub.requests).assertEqual(stub.requests);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name   stubLedgerFirstRequestRecorded
     * @tc.desc   The first handled request appends one ledger entry.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1.
     *                   2. Read the ledger length.
     *                   3. Compare the count with the length.
     * @tc.expected      Exactly one record exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLedgerFirstRequestRecorded', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.requests.length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()).assertEqual(stub.requests[0]);
      expect(stub.requests[0] === undefined).assertFalse();
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      expect(client.sentCodes.length).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerRecordCodeField
     * @tc.desc   The record stores the exact request code.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1.
     *                   2. Read the record code.
     *                   3. Send an unknown code and read its code.
     * @tc.expected      Each record keeps its own code value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLedgerRecordCodeField', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(stub.requests[1].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.requests[0].code).assertEqual(1);
      expect(stub.requests[1].code).assertEqual(2);
      expect(stub.requests[0].code === stub.requests[1].code).assertFalse();
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name   stubLedgerRecordTextField
     * @tc.desc   The record stores the request text read by the stub.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 with the production payload.
     *                   2. Read the record text.
     *                   3. Compare with the client ledger.
     * @tc.expected      The record text matches the sent payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLedgerRecordTextField', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(record.text).assertEqual(REQUEST_PAYLOAD);
      expect(record.text).assertEqual('hello world');
      expect(record.text).assertEqual(client.sentTexts[0]);
      expect(record.text.length).assertEqual(11);
      expect(textFingerprint(record.text)).assertEqual(textFingerprint(REQUEST_PAYLOAD));
      expect(record.handled).assertTrue();
    });

    /**
     * @tc.name   stubLedgerRecordReplyField
     * @tc.desc   The record stores the reply written by the stub.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1.
     *                   2. Read the record reply text.
     *                   3. Compare with the result and stub property.
     * @tc.expected      The reply text matches the production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLedgerRecordReplyField', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(record.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record.replyText).assertEqual(result.replyText);
      expect(record.replyText).assertEqual(stub.replyText);
      expect(record.replyText).assertEqual(client.replies[0]);
      expect(record.replyText.length).assertEqual(9);
      expect(record.replyText).assertEqual('hello rpc');
    });

    /**
     * @tc.name   stubLedgerRecordHandledField
     * @tc.desc   The record handled flag mirrors the stub return value.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send an accepted and a rejected code.
     *                   2. Read both handled flags.
     *                   3. Compare with the results.
     * @tc.expected      The flags match the client results.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordHandledField', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const rejected = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.requests[0].handled).assertEqual(accepted.handled);
      expect(stub.requests[1].handled).assertEqual(rejected.handled);
      expect(stub.requests[0].handled).assertEqual(!stub.requests[1].handled);
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name   stubLedgerRecordOptionField
     * @tc.desc   The record stores the option description used for the request.
     * @tc.precondition  A stub driven directly with a custom option.
     * @tc.steps         1. Invoke the handler with an async option.
     *                   2. Read the record option text.
     *                   3. Compare with the option description.
     * @tc.expected      The record option matches the supplied option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordOptionField', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 15, false);
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      const record = stub.requests[0];
      expect(record.option).assertEqual(option.describe());
      expect(record.option).assertEqual('1/15/false');
      expect(record.option.startsWith('1/15')).assertTrue();
      expect(record.option.endsWith('false')).assertTrue();
      expect(record.handled).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubLedgerOrderPreserved
     * @tc.desc   Records appear in the order the requests were handled.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send three codes in a known order.
     *                   2. Read the record codes.
     *                   3. Compare with the send order.
     * @tc.expected      The ledger preserves the send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerOrderPreserved', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const codes: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        codes.push(String(stub.requests[index].code));
      }
      expect(codes.length).assertEqual(3);
      expect(joined(codes, ',')).assertEqual('1,2,0');
      expect(sameStringArray(codes, ['1', '2', '0'])).assertTrue();
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(stub.requests[2].code).assertEqual(UNKNOWN_CODE_ZERO);
      expect(uniqueStrings(codes).length).assertEqual(3);
    });

    /**
     * @tc.name   stubLedgerLengthEqualsCount
     * @tc.desc   requestCount always equals the ledger length.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send four requests one by one.
     *                   2. Compare the count with the length after each.
     *                   3. Confirm the final equality.
     * @tc.expected      The count and length always agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerLengthEqualsCount', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 4; index++) {
        client.send(index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
        expect(stub.requestCount()).assertEqual(stub.requests.length);
        expect(stub.requestCount()).assertEqual(index + 1);
      }
      expect(stub.requests.length).assertEqual(4);
      expect(stub.requestCount()).assertEqual(4);
      expect(StubMetrics.from(stub).requests).assertEqual(4);
    });

    /**
     * @tc.name   stubLedgerLastRequestMatchesTail
     * @tc.desc   lastRequest returns the final ledger element.
     * @tc.precondition  A stub with three records.
     * @tc.steps         1. Send three codes.
     *                   2. Read the last request.
     *                   3. Compare it with the third element.
     * @tc.expected      The last request is the third record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerLastRequestMatchesTail', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const last = stub.lastRequest();
      expect(last).assertEqual(stub.requests[2]);
      expect(last?.code).assertEqual(UNKNOWN_CODE_LARGE);
      expect(last?.handled).assertFalse();
      expect(stub.requests[0] === last).assertFalse();
      expect(stub.requests.length).assertEqual(3);
      expect(last?.text).assertEqual('');
    });

    /**
     * @tc.name   stubLedgerResetEmptiesRecords
     * @tc.desc   reset removes every ledger record.
     * @tc.precondition  A stub with two records.
     * @tc.steps         1. Send two requests.
     *                   2. Reset the stub.
     *                   3. Read the ledger and last request.
     * @tc.expected      The ledger is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerResetEmptiesRecords', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(stub.requests.length).assertEqual(2);
      stub.reset();
      expect(stub.requests.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(stub.requests.length === 0).assertTrue();
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name   stubLedgerRejectedRecordEmptyText
     * @tc.desc   A rejected record stores an empty request text.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send an unknown code with a payload.
     *                   2. Read the record text.
     *                   3. Compare with the sent text ledger.
     * @tc.expected      The record text is empty for the rejection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRejectedRecordEmptyText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(UNKNOWN_CODE_NEGATIVE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(record.text).assertEqual('');
      expect(record.text.length).assertEqual(0);
      expect(record.replyText).assertEqual('');
      expect(record.handled).assertFalse();
      expect(record.code).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name   stubLedgerRejectedRecordNoReply
     * @tc.desc   A rejected record stores no reply text.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 2.
     *                   2. Read the record reply field.
     *                   3. Confirm the reply sequence was not touched.
     * @tc.expected      The rejected record has no reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRejectedRecordNoReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, reply, new MessageOptionModel());
      const record = stub.requests[0];
      expect(record.replyText).assertEqual('');
      expect(record.handled).assertFalse();
      expect(reply.size()).assertEqual(0);
      expect(reply.writeCount).assertEqual(0);
      expect(data.cursor).assertEqual(0);
      expect(StubMetrics.from(stub).replies).assertEqual(0);
    });

    /**
     * @tc.name   stubLedgerTwoCodesRecorded
     * @tc.desc   Two different codes produce two independent records.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 and code 2.
     *                   2. Compare both records.
     *                   3. Confirm the ledger length.
     * @tc.expected      The records differ only in their expected fields.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerTwoCodesRecorded', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const accepted = stub.requests[0];
      const rejected = stub.requests[1];
      expect(accepted.code).assertEqual(REQUEST_CODE);
      expect(rejected.code).assertEqual(UNKNOWN_CODE_TWO);
      expect(accepted.text).assertEqual(REQUEST_PAYLOAD);
      expect(rejected.text).assertEqual('');
      expect(accepted.replyText).assertEqual(REPLY_PAYLOAD);
      expect(rejected.replyText).assertEqual('');
      expect(accepted === rejected).assertFalse();
    });

    /**
     * @tc.name   stubLedgerMixedHandledFlags
     * @tc.desc   Handled flags alternate with a mixed code sequence.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send codes 1, 2, 0 and 1.
     *                   2. Read the handled flags in order.
     *                   3. Compare with the send order pattern.
     * @tc.expected      The flags follow the true, false, false, true pattern.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerMixedHandledFlags', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [1, 2, 0, 1];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const flags: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        flags.push(String(stub.requests[index].handled));
      }
      expect(joined(flags, ',')).assertEqual('true,false,false,true');
      expect(countOf(flags, 'true')).assertEqual(2);
      expect(flags.length).assertEqual(4);
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.requests[3].handled).assertTrue();
      expect(StubMetrics.from(stub).handled).assertEqual(2);
    });

    /**
     * @tc.name   stubLedgerDescribeStrings
     * @tc.desc   Each record describes itself with four slash-separated fields.
     * @tc.precondition  A stub with one accepted and one rejected record.
     * @tc.steps         1. Send code 1 and code 2.
     *                   2. Describe both records.
     *                   3. Split each description.
     * @tc.expected      Both descriptions have the four-field shape.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerDescribeStrings', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const accepted = stub.requests[0].describe();
      const rejected = stub.requests[1].describe();
      expect(accepted).assertEqual('1/hello world/hello rpc/true');
      expect(rejected).assertEqual('2///false');
      expect(accepted.split('/').length).assertEqual(4);
      expect(rejected.split('/').length).assertEqual(4);
      expect(accepted === rejected).assertFalse();
      expect(accepted.startsWith('1/')).assertTrue();
    });

    /**
     * @tc.name   stubLedgerDescribeOrder
     * @tc.desc   Descriptions appear in ledger order.
     * @tc.precondition  A stub with three records.
     * @tc.steps         1. Send codes 1, 2 and 1.
     *                   2. Map the records to descriptions.
     *                   3. Compare the joined descriptions.
     * @tc.expected      The description order matches the request order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerDescribeOrder', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const descriptions: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        descriptions.push(stub.requests[index].describe());
      }
      expect(descriptions.length).assertEqual(3);
      expect(descriptions[0]).assertEqual('1/hello world/hello rpc/true');
      expect(descriptions[1]).assertEqual('2///false');
      expect(descriptions[2]).assertEqual(descriptions[0]);
      expect(countOf(descriptions, descriptions[0])).assertEqual(2);
      expect(uniqueStrings(descriptions).length).assertEqual(2);
      expect(joined(descriptions, '|').split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   stubLedgerUniqueTexts
     * @tc.desc   Distinct request texts are recoverable from the ledger.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send three different payloads with code 1.
     *                   2. Collect the record texts.
     *                   3. Deduplicate them.
     * @tc.expected      Three distinct texts remain in send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerUniqueTexts', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'text one');
      client.send(REQUEST_CODE, 'text two');
      client.send(REQUEST_CODE, 'text three');
      const texts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        texts.push(stub.requests[index].text);
      }
      expect(texts.length).assertEqual(3);
      expect(uniqueStrings(texts).length).assertEqual(3);
      expect(sameStringArray(texts, ['text one', 'text two', 'text three'])).assertTrue();
      expect(sameStringArray(texts, client.sentTexts)).assertTrue();
      expect(countOf(texts, 'text two')).assertEqual(1);
      expect(joined(texts, ',')).assertEqual('text one,text two,text three');
    });

    /**
     * @tc.name   stubLedgerCountOfHandledFlag
     * @tc.desc   Counting handled flags equals the metrics handled counter.
     * @tc.precondition  A stub with five mixed records.
     * @tc.steps         1. Send five mixed codes.
     *                   2. Count the true flags in the ledger.
     *                   3. Compare with metrics.
     * @tc.expected      Both handled counts agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerCountOfHandledFlag', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const codes: number[] = [1, 2, 1, 0, 99];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const flags: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        flags.push(String(stub.requests[index].handled));
      }
      expect(countOf(flags, 'true')).assertEqual(2);
      expect(countOf(flags, 'false')).assertEqual(3);
      expect(countOf(flags, 'true')).assertEqual(StubMetrics.from(stub).handled);
      expect(StubMetrics.from(stub).rejected).assertEqual(3);
      expect(flags.length).assertEqual(5);
      expect(stub.requestCount()).assertEqual(5);
    });

    /**
     * @tc.name   stubLedgerReplayCodesLedger
     * @tc.desc   replayCodes produces one ledger record per supplied code.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Replay four codes.
     *                   2. Read the ledger length and codes.
     *                   3. Compare with the replay list.
     * @tc.expected      The ledger mirrors the replay list exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerReplayCodesLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [1, 2, 1, 99];
      replayCodes(stub, codes);
      expect(stub.requests.length).assertEqual(4);
      expect(stub.requests[0].code).assertEqual(1);
      expect(stub.requests[1].code).assertEqual(2);
      expect(stub.requests[2].code).assertEqual(1);
      expect(stub.requests[3].code).assertEqual(99);
      expect(stub.requestCount()).assertEqual(codes.length);
    });

    /**
     * @tc.name   stubLedgerReplayDescriptions
     * @tc.desc   A replayed ledger yields the expected description sequence.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Replay two accepted and one rejected code.
     *                   2. Describe every record.
     *                   3. Compare the ordered descriptions.
     * @tc.expected      The descriptions follow the accepted/rejected pattern.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerReplayDescriptions', 0, () => {
      const stub = new StubRemoteObjectModel();
      replayCodes(stub, [1, 2, 1]);
      const descriptions: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        descriptions.push(stub.requests[index].describe());
      }
      expect(descriptions[0]).assertEqual('1/hello world/hello rpc/true');
      expect(descriptions[1]).assertEqual('2///false');
      expect(descriptions[2]).assertEqual(descriptions[0]);
      expect(descriptions.length).assertEqual(3);
      expect(uniqueStrings(descriptions).length).assertEqual(2);
      expect(joined(descriptions, ';').split(';').length).assertEqual(3);
    });

    /**
     * @tc.name   stubLedgerReplayDeterministic
     * @tc.desc   Replaying the same list twice yields equal ledger fingerprints.
     * @tc.precondition  Two fresh stubs.
     * @tc.steps         1. Replay the same codes on both stubs.
     *                   2. Join the descriptions into a fingerprint.
     *                   3. Compare both fingerprints.
     * @tc.expected      The ledgers are indistinguishable by description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerReplayDeterministic', 0, () => {
      const left = new StubRemoteObjectModel();
      const right = new StubRemoteObjectModel();
      const codes: number[] = [1, 2, 0, 1, 99];
      replayCodes(left, codes);
      replayCodes(right, codes);
      let leftText = '';
      let rightText = '';
      for (let index = 0; index < left.requests.length; index++) {
        leftText = leftText + left.requests[index].describe();
        rightText = rightText + right.requests[index].describe();
      }
      expect(leftText).assertEqual(rightText);
      expect(textFingerprint(leftText)).assertEqual(textFingerprint(rightText));
      expect(left.requestCount()).assertEqual(right.requestCount());
      expect(left.requests.length).assertEqual(right.requests.length);
      expect(StubMetrics.from(left).fingerprint()).assertEqual(StubMetrics.from(right).fingerprint());
      expect(leftText.length).assertLarger(0);
    });

    /**
     * @tc.name   stubLedgerMetricsHandled
     * @tc.desc   The metrics handled counter derives from the ledger flags.
     * @tc.precondition  A stub with three accepted records.
     * @tc.steps         1. Send three code 1 requests.
     *                   2. Count the ledger handled flags.
     *                   3. Compare with metrics.
     * @tc.expected      Both counters equal three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerMetricsHandled', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      let handled = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (stub.requests[index].handled) {
          handled = handled + 1;
        }
      }
      expect(handled).assertEqual(3);
      expect(StubMetrics.from(stub).handled).assertEqual(handled);
      expect(StubMetrics.from(stub).requests).assertEqual(3);
      expect(StubMetrics.from(stub).rejected).assertEqual(0);
      expect(StubMetrics.from(stub).replies).assertEqual(3);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerMetricsRejected
     * @tc.desc   The metrics rejected counter derives from the ledger flags.
     * @tc.precondition  A stub with four rejected records.
     * @tc.steps         1. Send four unknown codes.
     *                   2. Count the ledger false flags.
     *                   3. Compare with metrics.
     * @tc.expected      Both counters equal four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerMetricsRejected', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(0, REQUEST_PAYLOAD);
      client.send(2, REQUEST_PAYLOAD);
      client.send(-1, REQUEST_PAYLOAD);
      client.send(99, REQUEST_PAYLOAD);
      let rejected = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (!stub.requests[index].handled) {
          rejected = rejected + 1;
        }
      }
      expect(rejected).assertEqual(4);
      expect(StubMetrics.from(stub).rejected).assertEqual(rejected);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).replies).assertEqual(0);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0);
      expect(stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name   stubLedgerKillRecord
     * @tc.desc   A request to a killed stub is still recorded as rejected.
     * @tc.precondition  A killed stub and a client double.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code 1.
     *                   3. Read the record and counters.
     * @tc.expected      The killed request yields a rejected record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerKillRecord', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(stub.requestCount()).assertEqual(1);
      expect(record.code).assertEqual(REQUEST_CODE);
      expect(record.handled).assertFalse();
      expect(record.text).assertEqual('');
      expect(record.replyText).assertEqual('');
      expect(stub.alive).assertFalse();
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerReviveAfterKill
     * @tc.desc   Records after a revive show a handled flag again.
     * @tc.precondition  A killed then revived stub.
     * @tc.steps         1. Kill the stub and send.
     *                   2. Revive and send again.
     *                   3. Compare both records.
     * @tc.expected      The second record is handled while the first is not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerReviveAfterKill', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.kill();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.requests.length).assertEqual(2);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[1].handled).assertTrue();
      expect(stub.requests[1].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[1].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.alive).assertTrue();
      expect(StubMetrics.from(stub).handled).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerRejectListRecord
     * @tc.desc   A reject-listed code produces a rejection record.
     * @tc.precondition  A stub whose reject list contains code 1.
     * @tc.steps         1. Add code 1 to the reject list.
     *                   2. Send code 1.
     *                   3. Read the record fields.
     * @tc.expected      The known code is recorded as rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRejectListRecord', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(record.code).assertEqual(REQUEST_CODE);
      expect(record.handled).assertFalse();
      expect(record.text).assertEqual('');
      expect(record.replyText).assertEqual('');
      expect(stub.rejectCodes.length).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerCustomReplyRecord
     * @tc.desc   The ledger records the custom reply text used for the request.
     * @tc.precondition  A stub with a custom reply.
     * @tc.steps         1. Set a custom reply text.
     *                   2. Send code 1 twice.
     *                   3. Compare both record replies.
     * @tc.expected      Both records carry the custom reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerCustomReplyRecord', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'ledger custom';
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual('ledger custom');
      expect(stub.requests[1].replyText).assertEqual('ledger custom');
      expect(stub.requests[0].replyText).assertEqual(stub.requests[1].replyText);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertTrue();
      expect(StubMetrics.from(stub).replies).assertEqual(2);
      expect(stub.replyText).assertEqual('ledger custom');
    });

    /**
     * @tc.name   stubLedgerOptionSyncDefault
     * @tc.desc   The default client send records the sync option description.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 through the client.
     *                   2. Read the record option text.
     *                   3. Compare with the default option.
     * @tc.expected      The record shows '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerOptionSyncDefault', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const option = new MessageOptionModel();
      const record = stub.requests[0];
      expect(record.option).assertEqual(option.describe());
      expect(record.option).assertEqual('0/0/false');
      expect(record.option.split('/').length).assertEqual(3);
      expect(record.option.startsWith('0/')).assertTrue();
      expect(option.isSync()).assertTrue();
      expect(record.option).assertEqual('0/0/false');
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerManyRecords
     * @tc.desc   Ten requests produce ten ordered ledger records.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send ten alternating codes.
     *                   2. Read the ledger length and codes.
     *                   3. Compare the handled count.
     * @tc.expected      The ledger holds ten records with five handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerManyRecords', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 10; index++) {
        client.send(index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      }
      expect(stub.requests.length).assertEqual(10);
      expect(stub.requestCount()).assertEqual(10);
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(stub.requests[9].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(StubMetrics.from(stub).handled).assertEqual(5);
      expect(StubMetrics.from(stub).rejected).assertEqual(5);
      expect(stub.lastRequest()?.code).assertEqual(UNKNOWN_CODE_TWO);
    });

    /**
     * @tc.name   stubLedgerRecordsAreIndependentObjects
     * @tc.desc   Two records from the same stub are distinct objects.
     * @tc.precondition  A stub with two accepted records.
     * @tc.steps         1. Send code 1 twice.
     *                   2. Compare the two record references.
     *                   3. Compare their field values.
     * @tc.expected      The records are distinct objects with equal values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordsAreIndependentObjects', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const first = stub.requests[0];
      const second = stub.requests[1];
      expect(first === second).assertFalse();
      expect(first.code).assertEqual(second.code);
      expect(first.text).assertEqual(second.text);
      expect(first.replyText).assertEqual(second.replyText);
      expect(first.handled).assertEqual(second.handled);
      expect(stub.requests.length).assertEqual(2);
      expect(stub.lastRequest()).assertEqual(second);
    });

    /**
     * @tc.name   stubLedgerResetThenNewRequest
     * @tc.desc   A request after reset starts a new ledger.
     * @tc.precondition  A stub that was reset after one request.
     * @tc.steps         1. Send a request and reset the stub.
     *                   2. Send a new request.
     *                   3. Read the ledger.
     * @tc.expected      The ledger holds only the new record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerResetThenNewRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'old payload');
      stub.reset();
      client.send(REQUEST_CODE, 'new payload');
      expect(stub.requests.length).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('new payload');
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual('new payload');
      expect(stub.requests[0].text === 'old payload').assertFalse();
      expect(StubMetrics.from(stub).requests).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerRetainsEarlierRecords
     * @tc.desc   Later requests never mutate earlier ledger records.
     * @tc.precondition  A stub with one accepted record.
     * @tc.steps         1. Send code 1 and capture the first description.
     *                   2. Send three more mixed requests.
     *                   3. Re-read the first description.
     * @tc.expected      The first record is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRetainsEarlierRecords', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const snapshot = stub.requests[0].describe();
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, 'other payload');
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(stub.requests[0].describe()).assertEqual(snapshot);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests.length).assertEqual(4);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(stub.requests[2].text).assertEqual('other payload');
    });

    /**
     * @tc.name   stubLedgerClientResetEmptiesStubLedger
     * @tc.desc   A client reset also empties the wrapped stub ledger.
     * @tc.precondition  A client with two records.
     * @tc.steps         1. Send two requests.
     *                   2. Reset the client.
     *                   3. Read the stub ledger.
     * @tc.expected      The stub ledger is empty after the client reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerClientResetEmptiesStubLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(stub.requests.length).assertEqual(2);
      client.reset();
      expect(stub.requests.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(client.sentCodes.length).assertEqual(0);
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name   stubLedgerRecordEmptyPayloadText
     * @tc.desc   An empty payload is recorded as an empty text.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 with an empty payload.
     *                   2. Read the record text and description.
     *                   3. Compare with the client ledger.
     * @tc.expected      The record keeps an empty text but is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordEmptyPayloadText', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, '');
      const record = stub.requests[0];
      expect(record.text).assertEqual('');
      expect(record.text.length).assertEqual(0);
      expect(record.handled).assertTrue();
      expect(record.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record.describe()).assertEqual('1//hello rpc/true');
      expect(client.sentTexts[0]).assertEqual('');
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerLongPayloadRecord
     * @tc.desc   A long payload is stored whole in the ledger.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Build a 90-character payload.
     *                   2. Send code 1 with it.
     *                   3. Compare the record text length.
     * @tc.expected      The ledger stores the complete payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerLongPayloadRecord', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      let payload = '';
      for (let index = 0; index < 9; index++) {
        payload = payload + 'abcdefghij';
      }
      client.send(REQUEST_CODE, payload);
      expect(payload.length).assertEqual(90);
      expect(stub.requests[0].text.length).assertEqual(90);
      expect(stub.requests[0].text).assertEqual(payload);
      expect(stub.requests[0].describe().length).assertLarger(90);
      expect(textFingerprint(stub.requests[0].text)).assertEqual(textFingerprint(payload));
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name   stubLedgerTwoStubsSeparateLedgers
     * @tc.desc   Two stubs maintain independent request ledgers.
     * @tc.precondition  Two stubs with clients.
     * @tc.steps         1. Send two requests to the first stub.
     *                   2. Send one request to the second stub.
     *                   3. Compare both ledgers.
     * @tc.expected      Each ledger holds only its own records.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerTwoStubsSeparateLedgers', 0, () => {
      const first = new StubRemoteObjectModel();
      const second = new StubRemoteObjectModel();
      const firstClient = new InProcessClient(first);
      const secondClient = new InProcessClient(second);
      firstClient.send(REQUEST_CODE, 'first-1');
      firstClient.send(REQUEST_CODE, 'first-2');
      secondClient.send(UNKNOWN_CODE_TWO, 'second-1');
      expect(first.requests.length).assertEqual(2);
      expect(second.requests.length).assertEqual(1);
      expect(first.requests[0].text).assertEqual('first-1');
      expect(second.requests[0].text).assertEqual('');
      expect(second.requests[0].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(first.requestCount()).assertEqual(2);
      expect(StubMetrics.from(second).rejected).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerSharedStubAcrossClients
     * @tc.desc   Two clients over one stub append to the same ledger.
     * @tc.precondition  One stub and two clients.
     * @tc.steps         1. Send from the first client.
     *                   2. Send from the second client.
     *                   3. Read the shared ledger.
     * @tc.expected      The ledger holds both requests in call order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerSharedStubAcrossClients', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.send(REQUEST_CODE, 'client-a');
      second.send(UNKNOWN_CODE_TWO, 'client-b');
      second.send(REQUEST_CODE, 'client-c');
      expect(stub.requests.length).assertEqual(3);
      expect(stub.requests[0].text).assertEqual('client-a');
      expect(stub.requests[1].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.requests[2].text).assertEqual('client-c');
      expect(first.sentCodes.length).assertEqual(1);
      expect(second.sentCodes.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name   stubLedgerFingerprintOfDescriptions
     * @tc.desc   A ledger fingerprint derives from the ordered descriptions.
     * @tc.precondition  A stub with a mixed run of four requests.
     * @tc.steps         1. Send four requests.
     *                   2. Join the descriptions and fingerprint them.
     *                   3. Compare with a textFingerprint oracle.
     * @tc.expected      Both fingerprints are equal and match the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerFingerprintOfDescriptions', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, 'third');
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      const parts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        parts.push(stub.requests[index].describe());
      }
      const text = joined(parts, '\n');
      expect(parts.length).assertEqual(4);
      expect(textFingerprint(text)).assertEqual(textFingerprint(joined(parts, '\n')));
      expect(textFingerprint(text)).assertLarger(0);
      expect(text.indexOf('true')).assertLarger(0);
      expect(text.indexOf('false')).assertLarger(0);
      expect(text.length).assertLarger(40);
    });

    /**
     * @tc.name   stubLedgerDescribeSplitShape
     * @tc.desc   Every description has exactly four slash-separated sections.
     * @tc.precondition  A stub with three mixed records.
     * @tc.steps         1. Send three mixed codes.
     *                   2. Split each description on '/'.
     *                   3. Compare every section count.
     * @tc.expected      All descriptions split into four sections.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerDescribeSplitShape', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'one');
      client.send(UNKNOWN_CODE_TWO, 'two');
      client.send(REQUEST_CODE, 'three');
      for (let index = 0; index < stub.requests.length; index++) {
        const sections = stub.requests[index].describe().split('/');
        expect(sections.length).assertEqual(4);
        expect(sections[0].length).assertLarger(0);
        expect(sections[3] === 'true' || sections[3] === 'false').assertTrue();
      }
      expect(stub.requests[0].describe().split('/')[1]).assertEqual('one');
      expect(stub.requests[2].describe().split('/')[1]).assertEqual('three');
      expect(stub.requests[1].describe().split('/')[3]).assertEqual('false');
    });

    /**
     * @tc.name   stubLedgerHandledRatioFromDescriptions
     * @tc.desc   The handled ratio derived from descriptions matches metrics.
     * @tc.precondition  A stub with four records.
     * @tc.steps         1. Send two accepted and two rejected codes.
     *                   2. Count the true flags in the descriptions.
     *                   3. Compute the ratio independently.
     * @tc.expected      The independent ratio equals 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerHandledRatioFromDescriptions', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'a');
      client.send(UNKNOWN_CODE_TWO, 'b');
      client.send(REQUEST_CODE, 'c');
      client.send(UNKNOWN_CODE_LARGE, 'd');
      const tails: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        tails.push(stub.requests[index].describe().split('/')[3]);
      }
      const handled = countOf(tails, 'true');
      const ratio = handled / tails.length;
      expect(handled).assertEqual(2);
      expect(tails.length).assertEqual(4);
      expect(ratio).assertEqual(0.5);
      expect(ratio).assertEqual(StubMetrics.from(stub).successRatio());
      expect(StubMetrics.from(stub).handled).assertEqual(handled);
      expect(uniqueStrings(tails).length).assertEqual(2);
    });

    /**
     * @tc.name   stubLedgerRecordReplyMatchesSequence
     * @tc.desc   The recorded reply text equals the value read from the sequence.
     * @tc.precondition  A stub and empty sequences.
     * @tc.steps         1. Invoke the handler directly with code 1.
     *                   2. Read the reply sequence.
     *                   3. Compare with the record field.
     * @tc.expected      The record and sequence replies agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordReplyMatchesSequence', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      const fromSequence = reply.readString();
      expect(fromSequence).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(fromSequence);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(data.cursor).assertEqual(1);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerSequenceCursorVsRecord
     * @tc.desc   The data cursor advances independently of the ledger record.
     * @tc.precondition  A data sequence with two values.
     * @tc.steps         1. Write two values and invoke the handler.
     *                   2. Read the cursor and the record text.
     *                   3. Confirm the second value is untouched.
     * @tc.expected      The ledger records only the consumed value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLedgerSequenceCursorVsRecord', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('consumed');
      data.writeString('untouched');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('consumed');
      expect(stub.requests[0].text === 'untouched').assertFalse();
      expect(data.values[1]).assertEqual('untouched');
      expect(data.size()).assertEqual(2);
      expect(stub.requestCount()).assertEqual(1);
      expect(data.readCount).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerOrderAfterAlternation
     * @tc.desc   An alternating code pattern yields an alternating ledger.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 and code 2 three times each.
     *                   2. Map records to handled flags.
     *                   3. Compare the alternation.
     * @tc.expected      The flags alternate six times.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerOrderAfterAlternation', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      for (let index = 0; index < 3; index++) {
        client.send(REQUEST_CODE, REQUEST_PAYLOAD);
        client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      }
      const flags: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        flags.push(String(stub.requests[index].handled));
      }
      expect(flags.length).assertEqual(6);
      expect(joined(flags, ',')).assertEqual('true,false,true,false,true,false');
      expect(countOf(flags, 'true')).assertEqual(3);
      expect(stub.requests[5].handled).assertFalse();
      expect(stub.requests[4].handled).assertTrue();
      expect(StubMetrics.from(stub).handled).assertEqual(3);
    });

    /**
     * @tc.name   stubLedgerSendManyRecordsCount
     * @tc.desc   sendMany appends exactly one record per iteration.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Call sendMany with seven accepted sends.
     *                   2. Read the ledger length.
     *                   3. Compare the metrics.
     * @tc.expected      Seven records exist with seven handled flags.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerSendManyRecordsCount', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(7, REQUEST_CODE);
      expect(stub.requests.length).assertEqual(7);
      expect(stub.requestCount()).assertEqual(7);
      expect(StubMetrics.from(stub).handled).assertEqual(7);
      expect(StubMetrics.from(stub).replies).assertEqual(7);
      expect(stub.lastRequest()?.handled).assertTrue();
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[6].code).assertEqual(REQUEST_CODE);
    });

    /**
     * @tc.name   stubLedgerRecordCodeValuesDistinct
     * @tc.desc   A mixed ledger exposes four distinct code values.
     * @tc.precondition  A stub with four different codes.
     * @tc.steps         1. Send four distinct codes.
     *                   2. Collect the record codes as text.
     *                   3. Deduplicate the list.
     * @tc.expected      Four distinct code values remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordCodeValuesDistinct', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      const codes: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        codes.push(String(stub.requests[index].code));
      }
      expect(codes.length).assertEqual(4);
      expect(uniqueStrings(codes).length).assertEqual(4);
      expect(sameStringArray(codes, ['1', '0', '2', '99'])).assertTrue();
      expect(countOf(codes, '1')).assertEqual(1);
      expect(codes[3]).assertEqual('99');
      expect(stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name   stubLedgerReplayTwiceSameStub
     * @tc.desc   Replaying twice on one stub accumulates eight records.
     * @tc.precondition  A fresh stub.
     * @tc.steps         1. Replay a four-code list once.
     *                   2. Replay the same list again.
     *                   3. Read the ledger length and flags.
     * @tc.expected      Eight records accumulate in replay order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerReplayTwiceSameStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [1, 2, 1, 0];
      replayCodes(stub, codes);
      expect(stub.requests.length).assertEqual(4);
      replayCodes(stub, codes);
      expect(stub.requests.length).assertEqual(8);
      expect(stub.requests[0].code).assertEqual(1);
      expect(stub.requests[4].code).assertEqual(1);
      expect(stub.requests[7].code).assertEqual(0);
      expect(StubMetrics.from(stub).handled).assertEqual(4);
      expect(stub.requestCount()).assertEqual(8);
    });

    /**
     * @tc.name   stubLedgerDescribeContainsOption
     * @tc.desc   The description embeds the option text through the reply field.
     * @tc.precondition  A stub driven directly with an async option.
     * @tc.steps         1. Invoke the handler with an async option.
     *                   2. Read the record option and description.
     *                   3. Compare the two strings.
     * @tc.expected      The option text is stored separately from the description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLedgerDescribeContainsOption', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel(1, 8, false));
      const record = stub.requests[0];
      expect(record.option).assertEqual('1/8/false');
      expect(record.describe()).assertEqual('1/hello world/hello rpc/true');
      expect(record.describe().indexOf(record.option)).assertEqual(-1);
      expect(record.option.split('/').length).assertEqual(3);
      expect(record.describe().split('/').length).assertEqual(4);
      expect(record.handled).assertTrue();
    });

    /**
     * @tc.name   stubLedgerLastRequestAfterResetAndSend
     * @tc.desc   After a reset and a new send, lastRequest is the new record.
     * @tc.precondition  A stub that was reset.
     * @tc.steps         1. Run and reset the stub.
     *                   2. Send one rejected code.
     *                   3. Read the last request.
     * @tc.expected      The last request is the new rejected record.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerLastRequestAfterResetAndSend', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.reset();
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const last = stub.lastRequest();
      expect(stub.requests.length).assertEqual(1);
      expect(last).assertEqual(stub.requests[0]);
      expect(last?.code).assertEqual(UNKNOWN_CODE_TWO);
      expect(last?.handled).assertFalse();
      expect(last?.replyText).assertEqual('');
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('');
    });

    /**
     * @tc.name   stubLedgerSpacedPayloadRecord
     * @tc.desc   A padded payload is stored with its spaces intact.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send a padded payload.
     *                   2. Read the record text.
     *                   3. Compare the trimmed form.
     * @tc.expected      The record keeps the original spacing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerSpacedPayloadRecord', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, '  ledger spaced  ');
      const record = stub.requests[0];
      expect(record.text).assertEqual('  ledger spaced  ');
      expect(record.text.length).assertEqual(17);
      expect(record.text.trim()).assertEqual('ledger spaced');
      expect(record.text === record.text.trim()).assertFalse();
      expect(record.describe().startsWith('1/  ledger spaced  /')).assertTrue();
      expect(record.handled).assertTrue();
      expect(client.sentTexts[0]).assertEqual(record.text);
    });

    /**
     * @tc.name   stubLedgerMetricsFingerprintFromLedger
     * @tc.desc   The metrics fingerprint is reproducible from ledger counters.
     * @tc.precondition  A stub with five records.
     * @tc.steps         1. Send three accepted and two rejected codes.
     *                   2. Build metrics and compute the counters by hand.
     *                   3. Compare fingerprints.
     * @tc.expected      The metrics fingerprint matches the manual oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerMetricsFingerprintFromLedger', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      const manual = textFingerprint('5:3:2:3');
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.fingerprint()).assertEqual(manual);
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
    });

    /**
     * @tc.name   stubLedgerRecordsAfterRejectRemoval
     * @tc.desc   Clearing the reject list allows new handled records.
     * @tc.precondition  A stub whose reject list was cleared.
     * @tc.steps         1. Reject code 1, send, then clear the list.
     *                   2. Send code 1 again.
     *                   3. Compare both records.
     * @tc.expected      The second record is handled while the first is not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLedgerRecordsAfterRejectRemoval', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.rejectCodes.push(REQUEST_CODE);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.rejectCodes = [];
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.requests.length).assertEqual(2);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[1].handled).assertTrue();
      expect(stub.requests[1].replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name   stubLedgerRecordRepliesAllSame
     * @tc.desc   Fixed reply text makes every accepted record reply identical.
     * @tc.precondition  A stub with four accepted records.
     * @tc.steps         1. Send four code 1 requests.
     *                   2. Collect the record replies.
     *                   3. Deduplicate the list.
     * @tc.expected      All four replies are the production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordRepliesAllSame', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(4, REQUEST_CODE);
      const replies: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        replies.push(stub.requests[index].replyText);
      }
      expect(replies.length).assertEqual(4);
      expect(uniqueStrings(replies).length).assertEqual(1);
      expect(countOf(replies, REPLY_PAYLOAD)).assertEqual(4);
      expect(sameStringArray(replies, client.replies)).assertTrue();
      expect(replies.length).assertEqual(StubMetrics.from(stub).replies);
      expect(StubMetrics.from(stub).replies).assertEqual(4);
    });

    /**
     * @tc.name   stubLedgerOptionAsyncDistinct
     * @tc.desc   Async option descriptions differ from the default sync option.
     * @tc.precondition  A stub driven twice with different options.
     * @tc.steps         1. Invoke with a sync option.
     *                   2. Invoke with an async option.
     *                   3. Compare both record options.
     * @tc.expected      The recorded options are distinct and accurate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerOptionAsyncDistinct', 0, () => {
      const stub = new StubRemoteObjectModel();
      const syncData = MessageSequenceModel.create();
      const asyncData = MessageSequenceModel.create();
      syncData.writeString('sync request');
      asyncData.writeString('async request');
      stub.onRemoteMessageRequest(REQUEST_CODE, syncData, MessageSequenceModel.create(),
        new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, asyncData, MessageSequenceModel.create(),
        new MessageOptionModel(OPTION_FLAG_ASYNC, 20, false));
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/20/false');
      expect(stub.requests[0].option === stub.requests[1].option).assertFalse();
      expect(stub.requests[0].text).assertEqual('sync request');
      expect(stub.requests[1].text).assertEqual('async request');
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name   stubLedgerRecordsAcrossKillCycle
     * @tc.desc   A kill and revive cycle leaves three records in order.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send, kill and send.
     *                   2. Revive and send again.
     *                   3. Read the ledger flags in order.
     * @tc.expected      The flags read true, false and true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerRecordsAcrossKillCycle', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.kill();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const flags: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        flags.push(String(stub.requests[index].handled));
      }
      expect(stub.requests.length).assertEqual(3);
      expect(joined(flags, ',')).assertEqual('true,false,true');
      expect(stub.requests[1].text).assertEqual('');
      expect(stub.requests[2].text).assertEqual(REQUEST_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name   stubLedgerDescribeAfterCustomReply
     * @tc.desc   A custom reply appears inside the record description.
     * @tc.precondition  A stub with a custom reply.
     * @tc.steps         1. Set a custom reply text.
     *                   2. Send code 1.
     *                   3. Compare the description with the expected shape.
     * @tc.expected      The description embeds the custom reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLedgerDescribeAfterCustomReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      stub.replyText = 'described reply';
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(record.describe()).assertEqual('1/hello world/described reply/true');
      expect(record.describe().indexOf('described reply')).assertLarger(0);
      expect(record.describe().split('/')[2]).assertEqual('described reply');
      expect(record.replyText).assertEqual('described reply');
      expect(record.describe().endsWith('/true')).assertTrue();
      expect(stub.requests.length).assertEqual(1);
      expect(StubMetrics.from(stub).replies).assertEqual(1);
    });
  });
}
