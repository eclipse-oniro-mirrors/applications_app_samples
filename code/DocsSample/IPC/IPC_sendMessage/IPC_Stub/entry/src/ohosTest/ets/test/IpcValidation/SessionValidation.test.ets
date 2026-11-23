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
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  ERROR_NONE,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint,
  clampInt,
  MessageSequenceModel,
  MessageOptionModel,
  StubRemoteObjectModel,
  RequestResultModel,
  InProcessClient,
  StubMetrics,
  expectedReplyFor
} from '../Shared/SharedDriver';

function newSession(): MessageSequenceModel {
  return MessageSequenceModel.create();
}

const PAYLOAD_FIRST: string = 'session-first';
const PAYLOAD_SECOND: string = 'session-second';

function writeAll(session: MessageSequenceModel, values: string[]): number {
  let written: number = 0;
  for (let index = 0; index < values.length; index++) {
    if (session.writeString(values[index])) {
      written = written + 1;
    }
  }
  return written;
}

function readAll(session: MessageSequenceModel): string[] {
  const values: string[] = [];
  let value: string = session.readString();
  while (value.length > 0) {
    values.push(value);
    value = session.readString();
  }
  return values;
}

function sessionSnapshot(session: MessageSequenceModel): string {
  return String(session.size()) + '/' + String(session.cursor) + '/' + String(session.writeCount) + '/' +
    String(session.readCount) + '/' + String(session.reclaimed);
}

function openClientRound(stub: StubRemoteObjectModel, code: number, payload: string): RequestResultModel {
  const client: InProcessClient = new InProcessClient(stub);
  return client.send(code, payload);
}

export default function sessionValidation(): void {
  describe('SessionValidation', () => {
    beforeAll(() => {
      logSuite('SessionValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('SessionValidation', 'end');
    });

    /**
     * @tc.name          sessionValidationFreshSession
     * @tc.desc          A new message sequence session starts empty and open.
     * @tc.precondition  The message sequence model is available.
     * @tc.steps         1. Create a session.
     *                   2. Read the counters.
     *                   3. Confirm the trace.
     * @tc.expected      All counters are zero and the session is open.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationFreshSession', 0, () => {
      const session: MessageSequenceModel = newSession();
      logStep('sessionValidationFreshSession', session.trace());
      expect(session.size()).assertEqual(0);
      expect(session.cursor).assertEqual(0);
      expect(session.writeCount).assertEqual(0);
      expect(session.readCount).assertEqual(0);
      expect(session.reclaimed).assertFalse();
      expect(session.trace()).assertEqual('#0');
      expect(session.values.length).assertEqual(0);
      expect(session.readString()).assertEqual('');
      expect(sessionSnapshot(session)).assertEqual('0/0/0/0/false');
    });

    /**
     * @tc.name          sessionValidationWriteOne
     * @tc.desc          Writing one value grows the session by one.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Write the documented payload.
     *                   2. Read the size and write count.
     *                   3. Confirm the trace.
     * @tc.expected      The session holds one value with one write.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationWriteOne', 0, () => {
      const session: MessageSequenceModel = newSession();
      const written: boolean = session.writeString(REQUEST_PAYLOAD);
      logStep('sessionValidationWriteOne', session.trace());
      expect(written).assertTrue();
      expect(session.size()).assertEqual(1);
      expect(session.writeCount).assertEqual(1);
      expect(session.cursor).assertEqual(0);
      expect(session.values[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.trace()).assertEqual(REQUEST_PAYLOAD + '#0');
      expect(session.reclaimed).assertFalse();
      expect(session.readCount).assertEqual(0);
      expect(session.values.length).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationReadAfterWrite
     * @tc.desc          Reading after a write returns the value and moves the cursor.
     * @tc.precondition  A session with one value exists.
     * @tc.steps         1. Write one value.
     *                   2. Read it back.
     *                   3. Compare the cursor.
     * @tc.expected      The read equals the written value and the cursor is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationReadAfterWrite', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString(REQUEST_PAYLOAD);
      const opened: string = session.readString();
      logStep('sessionValidationReadAfterWrite', session.trace());
      expect(opened).assertEqual(REQUEST_PAYLOAD);
      expect(opened).assertEqual('hello world');
      expect(session.cursor).assertEqual(1);
      expect(session.readCount).assertEqual(1);
      expect(session.size()).assertEqual(1);
      expect(session.writeCount).assertEqual(1);
      expect(session.trace()).assertEqual(REQUEST_PAYLOAD + '#1');
      expect(session.readString()).assertEqual('');
      expect(session.cursor).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationWriteManyOrder
     * @tc.desc          Multiple writes are read back in insertion order.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Write four values.
     *                   2. Read them all.
     *                   3. Compare with the source array.
     * @tc.expected      The read order matches the write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationWriteManyOrder', 0, () => {
      const sources: string[] = [REQUEST_PAYLOAD, 'second', 'third', 'fourth'];
      const session: MessageSequenceModel = newSession();
      const written: number = writeAll(session, sources);
      const opened: string[] = readAll(session);
      logStep('sessionValidationWriteManyOrder', joined(opened, ','));
      expect(written).assertEqual(4);
      expect(session.size()).assertEqual(4);
      expect(opened.length).assertEqual(4);
      expect(opened[0]).assertEqual(sources[0]);
      expect(opened[1]).assertEqual(sources[1]);
      expect(opened[3]).assertEqual(sources[3]);
      expect(session.readCount).assertEqual(4);
      expect(session.cursor).assertEqual(4);
      expect(joined(opened, ',')).assertEqual(joined(sources, ','));
    });

    /**
     * @tc.name          sessionValidationRewindReplaysAll
     * @tc.desc          Rewinding a spent session allows a full replay.
     * @tc.precondition  A session with two values exists.
     * @tc.steps         1. Read both values.
     *                   2. Rewind.
     *                   3. Read both again.
     * @tc.expected      The replayed values match the originals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationRewindReplaysAll', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('alpha');
      session.writeString('beta');
      const firstPass: string = session.readString() + ',' + session.readString();
      session.rewind();
      const secondPass: string = session.readString() + ',' + session.readString();
      logStep('sessionValidationRewindReplaysAll', session.trace());
      expect(firstPass).assertEqual('alpha,beta');
      expect(secondPass).assertEqual(firstPass);
      expect(session.cursor).assertEqual(2);
      expect(session.readCount).assertEqual(4);
      expect(session.size()).assertEqual(2);
      expect(session.writeCount).assertEqual(2);
      expect(session.trace()).assertEqual('alpha|beta#2');
      expect(session.reclaimed).assertFalse();
    });

    /**
     * @tc.name          sessionValidationReclaimBlocksWrites
     * @tc.desc          A reclaimed session refuses further writes.
     * @tc.precondition  An open session exists.
     * @tc.steps         1. Write one value.
     *                   2. Reclaim the session.
     *                   3. Attempt another write.
     * @tc.expected      The post reclaim write returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationReclaimBlocksWrites', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString(REQUEST_PAYLOAD);
      session.reclaim();
      const blocked: boolean = session.writeString('after');
      logStep('sessionValidationReclaimBlocksWrites', sessionSnapshot(session));
      expect(session.reclaimed).assertTrue();
      expect(blocked).assertFalse();
      expect(session.size()).assertEqual(1);
      expect(session.writeCount).assertEqual(1);
      expect(session.values[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.values.indexOf('after')).assertEqual(-1);
      expect(session.trace()).assertEqual(REQUEST_PAYLOAD + '#0');
      expect(sessionSnapshot(session)).assertEqual('1/0/1/0/true');
    });

    /**
     * @tc.name          sessionValidationReclaimResetsCursor
     * @tc.desc          Reclaiming resets the cursor to zero.
     * @tc.precondition  A partially read session exists.
     * @tc.steps         1. Write and read one value.
     *                   2. Reclaim.
     *                   3. Read the cursor.
     * @tc.expected      The cursor returns to zero while values persist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationReclaimResetsCursor', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('first');
      session.writeString('second');
      session.readString();
      const before: number = session.cursor;
      session.reclaim();
      logStep('sessionValidationReclaimResetsCursor', session.trace());
      expect(before).assertEqual(1);
      expect(session.cursor).assertEqual(0);
      expect(session.size()).assertEqual(2);
      expect(session.readCount).assertEqual(1);
      expect(session.writeCount).assertEqual(2);
      expect(session.reclaimed).assertTrue();
      expect(session.trace()).assertEqual('first|second#0');
      expect(session.values.length).assertEqual(2);
      expect(session.values[1]).assertEqual('second');
    });

    /**
     * @tc.name          sessionValidationReclaimBlocksReads
     * @tc.desc          A reclaimed session returns empty strings on read.
     * @tc.precondition  A reclaimed session with values exists.
     * @tc.steps         1. Write two values.
     *                   2. Reclaim.
     *                   3. Read twice.
     * @tc.expected      Both reads are empty and the read count stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationReclaimBlocksReads', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('one');
      session.writeString('two');
      session.reclaim();
      const first: string = session.readString();
      const second: string = session.readString();
      logStep('sessionValidationReclaimBlocksReads', sessionSnapshot(session));
      expect(first).assertEqual('');
      expect(second).assertEqual('');
      expect(session.readCount).assertEqual(0);
      expect(session.cursor).assertEqual(0);
      expect(session.reclaimed).assertTrue();
      expect(session.size()).assertEqual(2);
      expect(sessionSnapshot(session)).assertEqual('2/0/2/0/true');
      expect(session.trace()).assertEqual('one|two#0');
    });

    /**
     * @tc.name          sessionValidationTraceValues
     * @tc.desc          The session trace lists every value in order.
     * @tc.precondition  A session with four values exists.
     * @tc.steps         1. Write four values.
     *                   2. Read the trace.
     *                   3. Split and compare segments.
     * @tc.expected      The trace has four ordered segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationTraceValues', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('a');
      session.writeString('b');
      session.writeString('c');
      session.writeString('d');
      const trace: string = session.trace();
      logStep('sessionValidationTraceValues', trace);
      expect(trace.split('|').length).assertEqual(4);
      expect(trace.split('|')[0]).assertEqual('a');
      expect(trace.split('|')[1]).assertEqual('b');
      expect(trace.split('|')[2]).assertEqual('c');
      expect(trace.split('|')[3]).assertEqual('d#0');
      expect(trace.startsWith('a|')).assertTrue();
      expect(trace.endsWith('#0')).assertTrue();
      expect(countOf(session.values, 'c')).assertEqual(1);
      expect(uniqueStrings(session.values).length).assertEqual(4);
    });

    /**
     * @tc.name          sessionValidationOptionRoundTrip
     * @tc.desc          Message options describe session flags and wait time.
     * @tc.precondition  The message option model is available.
     * @tc.steps         1. Build a sync and an async option.
     *                   2. Compare the descriptions.
     *                   3. Check the sync predicate.
     * @tc.expected      The descriptions carry flags, wait time and sync state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationOptionRoundTrip', 0, () => {
      const sync: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      const async: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 300, false);
      logStep('sessionValidationOptionRoundTrip', sync.describe() + '/' + async.describe());
      expect(sync.describe()).assertEqual('0/0/false');
      expect(async.describe()).assertEqual('1/300/false');
      expect(sync.isSync()).assertTrue();
      expect(async.isSync()).assertFalse();
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(async.waitTime).assertEqual(300);
      expect(sync.describe() === async.describe()).assertFalse();
      expect(async.describe().split('/')[1]).assertEqual('300');
    });

    /**
     * @tc.name          sessionValidationClientRoundTrip
     * @tc.desc          A client round trip drives a fresh session pair.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Send the documented payload.
     *                   2. Read the result.
     *                   3. Compare with the reply oracle.
     * @tc.expected      The result is successful and the reply is hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationClientRoundTrip', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const result: RequestResultModel = openClientRound(stub, REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('sessionValidationClientRoundTrip', result.replyText);
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText).assertEqual(expectedReplyFor(REQUEST_CODE));
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.lastRequest()?.handled).assertTrue();
      expect(stub.lastRequest()?.code).assertEqual(REQUEST_CODE);
    });

    /**
     * @tc.name          sessionValidationSessionsIndependent
     * @tc.desc          Two sessions keep independent values and cursors.
     * @tc.precondition  Two sessions are available.
     * @tc.steps         1. Write different values to each.
     *                   2. Read from the first only.
     *                   3. Compare both states.
     * @tc.expected      Only the first session advances its cursor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSessionsIndependent', 0, () => {
      const first: MessageSequenceModel = newSession();
      const second: MessageSequenceModel = newSession();
      first.writeString('first-a');
      first.writeString('first-b');
      second.writeString('second-a');
      first.readString();
      logStep('sessionValidationSessionsIndependent', sessionSnapshot(first) + '/' + sessionSnapshot(second));
      expect(first.size()).assertEqual(2);
      expect(second.size()).assertEqual(1);
      expect(first.cursor).assertEqual(1);
      expect(second.cursor).assertEqual(0);
      expect(first.values[0]).assertEqual('first-a');
      expect(second.values[0]).assertEqual('second-a');
      expect(second.readString()).assertEqual('second-a');
      expect(first.readString()).assertEqual('first-b');
      expect(second.trace()).assertEqual('second-a#1');
    });

    /**
     * @tc.name          sessionValidationWriteCountTracksWrites
     * @tc.desc          The write counter matches the number of successful writes.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Write five values.
     *                   2. Read the write counter.
     *                   3. Compare with the size.
     * @tc.expected      Both the size and write counter equal five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationWriteCountTracksWrites', 0, () => {
      const session: MessageSequenceModel = newSession();
      const written: number = writeAll(session, ['1', '2', '3', '4', '5']);
      logStep('sessionValidationWriteCountTracksWrites', sessionSnapshot(session));
      expect(written).assertEqual(5);
      expect(session.writeCount).assertEqual(5);
      expect(session.size()).assertEqual(5);
      expect(session.values.length).assertEqual(5);
      expect(session.cursor).assertEqual(0);
      expect(session.readCount).assertEqual(0);
      expect(session.trace().endsWith('#0')).assertTrue();
      expect(session.trace().split('|').length).assertEqual(5);
      expect(session.values[4]).assertEqual('5');
    });

    /**
     * @tc.name          sessionValidationReadCountTracksReads
     * @tc.desc          The read counter matches the number of successful reads.
     * @tc.precondition  A session with three values exists.
     * @tc.steps         1. Read two values.
     *                   2. Read past the end twice.
     *                   3. Compare the read counter.
     * @tc.expected      The read counter stays at two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationReadCountTracksReads', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('a');
      session.writeString('b');
      session.writeString('c');
      session.readString();
      session.readString();
      const past: string = session.readString() + session.readString();
      logStep('sessionValidationReadCountTracksReads', sessionSnapshot(session));
      expect(past).assertEqual('c');
      expect(session.readCount).assertEqual(3);
      expect(session.cursor).assertEqual(3);
      expect(session.size()).assertEqual(3);
      expect(session.writeCount).assertEqual(3);
      expect(session.trace()).assertEqual('a|b|c#3');
      expect(session.reclaimed).assertFalse();
      expect(sessionSnapshot(session)).assertEqual('3/3/3/3/false');
    });

    /**
     * @tc.name          sessionValidationEmptyThenValues
     * @tc.desc          An empty write is stored and read back as empty.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Write an empty value then a normal value.
     *                   2. Read both.
     *                   3. Compare the counters.
     * @tc.expected      The first read is empty and the second carries the value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationEmptyThenValues', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('');
      session.writeString('after');
      const first: string = session.readString();
      const second: string = session.readString();
      logStep('sessionValidationEmptyThenValues', session.trace());
      expect(session.size()).assertEqual(2);
      expect(first).assertEqual('');
      expect(second).assertEqual('after');
      expect(session.readCount).assertEqual(2);
      expect(session.cursor).assertEqual(2);
      expect(session.values[0]).assertEqual('');
      expect(session.values[1]).assertEqual('after');
      expect(session.trace()).assertEqual('|after#2');
      expect(session.writeCount).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationRewindEmptySession
     * @tc.desc          Rewinding an empty session keeps it empty and open.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Rewind the session.
     *                   2. Read the counters.
     *                   3. Write and read one value.
     * @tc.expected      The rewind is harmless and the later round trip works.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationRewindEmptySession', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.rewind();
      const emptyRead: string = session.readString();
      session.writeString('later');
      const later: string = session.readString();
      logStep('sessionValidationRewindEmptySession', session.trace());
      expect(session.cursor).assertEqual(1);
      expect(emptyRead).assertEqual('');
      expect(later).assertEqual('later');
      expect(session.size()).assertEqual(1);
      expect(session.readCount).assertEqual(1);
      expect(session.writeCount).assertEqual(1);
      expect(session.trace()).assertEqual('later#1');
      expect(session.reclaimed).assertFalse();
      expect(sessionSnapshot(session)).assertEqual('1/1/1/1/false');
    });

    /**
     * @tc.name          sessionValidationClientMultipleRounds
     * @tc.desc          Multiple client rounds accumulate replies and counters.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send three requests.
     *                   2. Read the result ledger.
     *                   3. Compare the counts.
     * @tc.expected      Three results and three replies are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationClientMultipleRounds', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, 'payload two');
      client.send(REQUEST_CODE, 'payload three');
      logStep('sessionValidationClientMultipleRounds', client.trace());
      expect(client.sentCodes.length).assertEqual(3);
      expect(client.sentTexts.length).assertEqual(3);
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(client.sentTexts[1]).assertEqual('payload two');
      expect(client.results[2].replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(3);
      expect(client.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationClientTraceReplyOnly
     * @tc.desc          The client trace contains only handled replies.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send one handled and two rejected codes.
     *                   2. Read the trace.
     *                   3. Compare the trace length.
     * @tc.expected      The trace holds one reply despite three attempts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationClientTraceReplyOnly', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(0, REQUEST_PAYLOAD);
      client.send(2, REQUEST_PAYLOAD);
      logStep('sessionValidationClientTraceReplyOnly', client.trace());
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(1);
      expect(client.results[1].handled).assertFalse();
      expect(client.results[2].handled).assertFalse();
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).rejected).assertEqual(2);
      expect(client.trace().split('|').length).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationSessionFingerprint
     * @tc.desc          Equal session traces share a fingerprint.
     * @tc.precondition  Two sessions with identical values exist.
     * @tc.steps         1. Build two sessions with the same values.
     *                   2. Compare fingerprints.
     *                   3. Diverge one session.
     * @tc.expected      Identical sessions match and diverged ones do not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationSessionFingerprint', 0, () => {
      const first: MessageSequenceModel = newSession();
      const second: MessageSequenceModel = newSession();
      first.writeString('alpha');
      first.writeString('beta');
      second.writeString('alpha');
      second.writeString('beta');
      const baseline: number = textFingerprint(first.trace());
      second.readString();
      logStep('sessionValidationSessionFingerprint', String(baseline));
      expect(textFingerprint(second.trace())).assertEqual(textFingerprint('alpha|beta#1'));
      expect(baseline).assertEqual(textFingerprint('alpha|beta#0'));
      expect(baseline).assertLarger(0);
      expect(baseline).assertLess(1000003);
      expect(textFingerprint(first.trace())).assertEqual(baseline);
      expect(second.cursor).assertEqual(1);
      expect(first.cursor).assertEqual(0);
      expect(textFingerprint('')).assertEqual(216613);
    });

    /**
     * @tc.name          sessionValidationClientResetSession
     * @tc.desc          Resetting the client clears every session ledger.
     * @tc.precondition  A client with traffic exists.
     * @tc.steps         1. Send two requests.
     *                   2. Reset the client.
     *                   3. Read the ledger arrays.
     * @tc.expected      Every client array is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationClientResetSession', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, 'second');
      client.reset();
      logStep('sessionValidationClientResetSession', client.trace());
      expect(client.sentCodes.length).assertEqual(0);
      expect(client.sentTexts.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.results.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(StubMetrics.from(stub).requests).assertEqual(0);
    });

    /**
     * @tc.name          sessionValidationSentCodeOrder
     * @tc.desc          The sent code ledger preserves the send order.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send codes one, zero and two.
     *                   2. Read the sent code array.
     *                   3. Compare each index.
     * @tc.expected      The codes appear in send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSentCodeOrder', 0, () => {
      const client: InProcessClient = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(0, REQUEST_PAYLOAD);
      client.send(2, REQUEST_PAYLOAD);
      logStep('sessionValidationSentCodeOrder', joined(client.sentCodes.map((code: number): string => String(code)), ','));
      expect(client.sentCodes.length).assertEqual(3);
      expect(client.sentCodes[0]).assertEqual(1);
      expect(client.sentCodes[1]).assertEqual(0);
      expect(client.sentCodes[2]).assertEqual(2);
      expect(joined(client.sentCodes.map((code: number): string => String(code)), ',')).assertEqual('1,0,2');
      expect(client.results[0].handled).assertTrue();
      expect(client.results[2].handled).assertFalse();
      expect(uniqueStrings(client.sentTexts).length).assertEqual(1);
      expect(countOf(client.sentTexts, REQUEST_PAYLOAD)).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationDirectStubSessions
     * @tc.desc          Direct stub calls use caller supplied session pairs.
     * @tc.precondition  A stub and two session pairs exist.
     * @tc.steps         1. Call the stub twice with fresh pairs.
     *                   2. Read both reply buffers.
     *                   3. Compare the stub ledger.
     * @tc.expected      Both calls handle and both replies match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationDirectStubSessions', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const firstData: MessageSequenceModel = newSession();
      const firstReply: MessageSequenceModel = newSession();
      const secondData: MessageSequenceModel = newSession();
      const secondReply: MessageSequenceModel = newSession();
      firstData.writeString('one');
      secondData.writeString('two');
      const firstHandled: boolean = stub.onRemoteMessageRequest(REQUEST_CODE, firstData, firstReply,
        new MessageOptionModel());
      const secondHandled: boolean = stub.onRemoteMessageRequest(REQUEST_CODE, secondData, secondReply,
        new MessageOptionModel());
      logStep('sessionValidationDirectStubSessions', firstReply.trace() + '/' + secondReply.trace());
      expect(firstHandled).assertTrue();
      expect(secondHandled).assertTrue();
      expect(firstReply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(secondReply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('one');
      expect(stub.requests[1].text).assertEqual('two');
      expect(firstData.cursor).assertEqual(1);
      expect(secondData.cursor).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationReplySessionReuse
     * @tc.desc          Reusing a reply session accumulates written replies.
     * @tc.precondition  A stub and one reply session exist.
     * @tc.steps         1. Call the stub twice with the same reply session.
     *                   2. Read the reply buffer.
     *                   3. Compare the size.
     * @tc.expected      The shared reply session holds two entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationReplySessionReuse', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const reply: MessageSequenceModel = newSession();
      const firstData: MessageSequenceModel = newSession();
      const secondData: MessageSequenceModel = newSession();
      firstData.writeString('one');
      secondData.writeString('two');
      stub.onRemoteMessageRequest(REQUEST_CODE, firstData, reply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, secondData, reply, new MessageOptionModel());
      logStep('sessionValidationReplySessionReuse', reply.trace());
      expect(reply.size()).assertEqual(2);
      expect(reply.writeCount).assertEqual(2);
      expect(reply.cursor).assertEqual(0);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readCount).assertEqual(2);
      expect(reply.trace()).assertEqual(REPLY_PAYLOAD + '|' + REPLY_PAYLOAD + '#2');
      expect(stub.requestCount()).assertEqual(2);
      expect(uniqueStrings(reply.values).length).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationRewriteAfterRewind
     * @tc.desc          Writing after a rewind appends to the existing values.
     * @tc.precondition  A session with two values exists.
     * @tc.steps         1. Rewind the session.
     *                   2. Write a third value.
     *                   3. Read all three values.
     * @tc.expected      The third value appends and all three read in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationRewriteAfterRewind', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('one');
      session.writeString('two');
      session.readString();
      session.rewind();
      session.writeString('three');
      const opened: string[] = [];
      opened.push(session.readString());
      opened.push(session.readString());
      opened.push(session.readString());
      logStep('sessionValidationRewriteAfterRewind', session.trace());
      expect(session.size()).assertEqual(3);
      expect(opened.length).assertEqual(3);
      expect(opened[0]).assertEqual('one');
      expect(opened[1]).assertEqual('two');
      expect(opened[2]).assertEqual('three');
      expect(session.writeCount).assertEqual(3);
      expect(session.readCount).assertEqual(4);
      expect(session.values[2]).assertEqual('three');
      expect(session.trace()).assertEqual('one|two|three#3');
    });

    /**
     * @tc.name          sessionValidationOptionDefaultVsAsync
     * @tc.desc          Default and asynchronous options differ in every field.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Build a default and an async option.
     *                   2. Compare the fields.
     *                   3. Check the sync oracle.
     * @tc.expected      The descriptions differ while the default option is sync.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationOptionDefaultVsAsync', 0, () => {
      const fallback: MessageOptionModel = new MessageOptionModel();
      const async: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 500, false);
      logStep('sessionValidationOptionDefaultVsAsync', fallback.describe() + '/' + async.describe());
      expect(fallback.describe()).assertEqual('0/0/false');
      expect(async.describe()).assertEqual('1/500/false');
      expect(fallback.isSync()).assertTrue();
      expect(async.isSync()).assertFalse();
      expect(async.flags).assertEqual(1);
      expect(async.waitTime).assertEqual(500);
      expect(clampInt(async.waitTime, 0, 1000)).assertEqual(500);
      expect(fallback.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(async.describe() === fallback.describe()).assertFalse();
    });

    /**
     * @tc.name          sessionValidationCursorBoundaries
     * @tc.desc          The cursor respects the lower and upper boundaries.
     * @tc.precondition  A session with two values exists.
     * @tc.steps         1. Read both values.
     *                   2. Rewind to the lower boundary.
     *                   3. Clamp the cursor against the size.
     * @tc.expected      The cursor reaches zero and two without exceeding bounds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationCursorBoundaries', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('a');
      session.writeString('b');
      session.readString();
      session.readString();
      const upper: number = session.cursor;
      session.rewind();
      const lower: number = session.cursor;
      logStep('sessionValidationCursorBoundaries', String(lower) + '/' + String(upper));
      expect(lower).assertEqual(0);
      expect(upper).assertEqual(2);
      expect(upper).assertEqual(session.size());
      expect(clampInt(upper, 0, session.size())).assertEqual(2);
      expect(clampInt(-1, 0, session.size())).assertEqual(0);
      expect(clampInt(5, 0, session.size())).assertEqual(2);
      expect(session.cursor).assertEqual(0);
      expect(session.readString()).assertEqual('a');
      expect(session.readString()).assertEqual('b');
    });

    /**
     * @tc.name          sessionValidationValuesArrayIntegrity
     * @tc.desc          The values array mirrors the write ledger exactly.
     * @tc.precondition  A session with repeated values exists.
     * @tc.steps         1. Write repeated and distinct values.
     *                   2. Compare the values array.
     *                   3. Count duplicates.
     * @tc.expected      The array length and contents match the writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationValuesArrayIntegrity', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('dup');
      session.writeString('unique');
      session.writeString('dup');
      logStep('sessionValidationValuesArrayIntegrity', joined(session.values, ','));
      expect(session.values.length).assertEqual(3);
      expect(session.size()).assertEqual(3);
      expect(session.values[0]).assertEqual('dup');
      expect(session.values[1]).assertEqual('unique');
      expect(session.values[2]).assertEqual('dup');
      expect(countOf(session.values, 'dup')).assertEqual(2);
      expect(uniqueStrings(session.values).length).assertEqual(2);
      expect(session.writeCount).assertEqual(3);
      expect(session.trace()).assertEqual('dup|unique|dup#0');
    });

    /**
     * @tc.name          sessionValidationSizeBoundaries
     * @tc.desc          Session sizes grow one at a time across boundaries.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Capture the size at zero, one and two writes.
     *                   2. Compare each size.
     *                   3. Confirm the monotonic growth.
     * @tc.expected      Sizes are zero, one and two in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSizeBoundaries', 0, () => {
      const session: MessageSequenceModel = newSession();
      const sizes: number[] = [session.size()];
      session.writeString('a');
      sizes.push(session.size());
      session.writeString('b');
      sizes.push(session.size());
      logStep('sessionValidationSizeBoundaries', joined(sizes.map((value: number): string => String(value)), ','));
      expect(sizes.length).assertEqual(3);
      expect(sizes[0]).assertEqual(0);
      expect(sizes[1]).assertEqual(1);
      expect(sizes[2]).assertEqual(2);
      expect(sizes[1]).assertLarger(sizes[0]);
      expect(sizes[2]).assertLarger(sizes[1]);
      expect(session.writeCount).assertEqual(2);
      expect(session.values.length).assertEqual(2);
      expect(session.trace()).assertEqual('a|b#0');
    });

    /**
     * @tc.name          sessionValidationRepeatedReclaim
     * @tc.desc          Reclaiming an already reclaimed session is harmless.
     * @tc.precondition  A reclaimed session exists.
     * @tc.steps         1. Reclaim twice.
     *                   2. Attempt a write.
     *                   3. Read the trace.
     * @tc.expected      The session stays reclaimed with unchanged values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationRepeatedReclaim', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('kept');
      session.reclaim();
      session.reclaim();
      const blocked: boolean = session.writeString('lost');
      logStep('sessionValidationRepeatedReclaim', sessionSnapshot(session));
      expect(session.reclaimed).assertTrue();
      expect(blocked).assertFalse();
      expect(session.size()).assertEqual(1);
      expect(session.values[0]).assertEqual('kept');
      expect(session.values.length).assertEqual(1);
      expect(session.cursor).assertEqual(0);
      expect(session.trace()).assertEqual('kept#0');
      expect(sessionSnapshot(session)).assertEqual('1/0/1/0/true');
      expect(session.readString()).assertEqual('');
    });

    /**
     * @tc.name          sessionValidationClientSendManyCount
     * @tc.desc          sendMany returns the number of handled requests.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send four requests.
     *                   2. Send three unknown codes.
     *                   3. Compare the counts.
     * @tc.expected      Four and zero handled requests are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationClientSendManyCount', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const handled: number = client.sendMany(4, REQUEST_CODE);
      const rejected: number = client.sendMany(3, 0);
      logStep('sessionValidationClientSendManyCount', String(handled) + '/' + String(rejected));
      expect(handled).assertEqual(4);
      expect(rejected).assertEqual(0);
      expect(stub.requestCount()).assertEqual(7);
      expect(client.results.length).assertEqual(7);
      expect(client.replies.length).assertEqual(4);
      expect(StubMetrics.from(stub).handled).assertEqual(4);
      expect(StubMetrics.from(stub).rejected).assertEqual(3);
      expect(client.sentCodes.length).assertEqual(7);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(4);
    });

    /**
     * @tc.name          sessionValidationOptionInRecord
     * @tc.desc          The option description is captured in each request record.
     * @tc.precondition  A stub is available.
     * @tc.steps         1. Call the stub with a custom option.
     *                   2. Read the recorded option.
     *                   3. Compare with the option description.
     * @tc.expected      The record carries the exact option description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationOptionInRecord', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const data: MessageSequenceModel = newSession();
      const reply: MessageSequenceModel = newSession();
      const option: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 250, true);
      data.writeString('payload');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      logStep('sessionValidationOptionInRecord', option.describe());
      expect(stub.lastRequest()?.option).assertEqual('1/250/true');
      expect(stub.lastRequest()?.option).assertEqual(option.describe());
      expect(option.isSync()).assertTrue();
      expect(option.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(stub.lastRequest()?.handled).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.code).assertEqual(REQUEST_CODE);
      expect(stub.lastRequest()?.text).assertEqual('payload');
    });

    /**
     * @tc.name          sessionValidationTraceAfterReclaim
     * @tc.desc          A reclaimed trace keeps values but resets the cursor.
     * @tc.precondition  A read session exists.
     * @tc.steps         1. Write two values and read one.
     *                   2. Reclaim.
     *                   3. Read the trace.
     * @tc.expected      The trace shows both values with cursor zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationTraceAfterReclaim', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('x');
      session.writeString('y');
      session.readString();
      const before: string = session.trace();
      session.reclaim();
      logStep('sessionValidationTraceAfterReclaim', session.trace());
      expect(before).assertEqual('x|y#1');
      expect(session.trace()).assertEqual('x|y#0');
      expect(session.trace().split('|').length).assertEqual(2);
      expect(session.trace().endsWith('#0')).assertTrue();
      expect(session.reclaimed).assertTrue();
      expect(session.readCount).assertEqual(1);
      expect(session.writeCount).assertEqual(2);
      expect(session.size()).assertEqual(2);
      expect(session.cursor).assertEqual(0);
    });

    /**
     * @tc.name          sessionValidationLongValueSession
     * @tc.desc          A long value round trips through the session.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Build a 256 character value.
     *                   2. Write and read it.
     *                   3. Compare the lengths.
     * @tc.expected      The long value is returned unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationLongValueSession', 0, () => {
      let longValue = '';
      for (let index = 0; index < 16; index++) {
        longValue = longValue + '0123456789abcdef';
      }
      const session: MessageSequenceModel = newSession();
      session.writeString(longValue);
      const opened: string = session.readString();
      logStep('sessionValidationLongValueSession', String(opened.length));
      expect(longValue.length).assertEqual(256);
      expect(opened).assertEqual(longValue);
      expect(opened.length).assertEqual(256);
      expect(session.size()).assertEqual(1);
      expect(session.readCount).assertEqual(1);
      expect(session.trace().length).assertEqual(256 + 2);
      expect(session.trace().endsWith('#1')).assertTrue();
      expect(session.reclaimed).assertFalse();
      expect(clampInt(opened.length, 0, 256)).assertEqual(256);
    });

    /**
     * @tc.name          sessionValidationUnicodeValueSession
     * @tc.desc          A unicode value round trips through the session.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Write a unicode value.
     *                   2. Read it back.
     *                   3. Compare character by character.
     * @tc.expected      The unicode value is returned unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationUnicodeValueSession', 0, () => {
      const unicode: string = '会话数据 42';
      const session: MessageSequenceModel = newSession();
      session.writeString(unicode);
      const opened: string = session.readString();
      const sameChars: boolean = opened.charAt(0) === unicode.charAt(0) &&
        opened.charAt(opened.length - 1) === unicode.charAt(unicode.length - 1);
      logStep('sessionValidationUnicodeValueSession', opened);
      expect(opened).assertEqual(unicode);
      expect(opened.length).assertEqual(unicode.length);
      expect(sameChars).assertTrue();
      expect(opened.indexOf('会话')).assertEqual(0);
      expect(opened.endsWith('42')).assertTrue();
      expect(session.size()).assertEqual(1);
      expect(session.trace()).assertEqual(unicode + '#1');
      expect(session.readCount).assertEqual(1);
      expect(session.values[0]).assertEqual(unicode);
    });

    /**
     * @tc.name          sessionValidationReplyOracleMatrix
     * @tc.desc          The reply oracle matches every handled client result.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send three handled codes.
     *                   2. Compare each reply with the oracle.
     *                   3. Confirm the oracle for unknown codes.
     * @tc.expected      Every reply equals hello rpc and unknown oracles are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationReplyOracleMatrix', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'p1');
      client.send(REQUEST_CODE, 'p2');
      client.send(REQUEST_CODE, 'p3');
      const oracle: string = expectedReplyFor(REQUEST_CODE);
      logStep('sessionValidationReplyOracleMatrix', oracle);
      expect(client.results[0].replyText).assertEqual(oracle);
      expect(client.results[1].replyText).assertEqual(oracle);
      expect(client.results[2].replyText).assertEqual(oracle);
      expect(expectedReplyFor(0)).assertEqual('');
      expect(expectedReplyFor(2)).assertEqual('');
      expect(oracle).assertEqual(REPLY_PAYLOAD);
      expect(countOf(client.replies, oracle)).assertEqual(3);
      expect(uniqueStrings(client.replies).length).assertEqual(1);
      expect(stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationClientSentTextVariety
     * @tc.desc          The client ledger keeps distinct sent texts separate.
     * @tc.precondition  A client is available.
     * @tc.steps         1. Send three distinct payloads.
     *                   2. Read the sent text array.
     *                   3. Deduplicate the array.
     * @tc.expected      Three distinct texts remain after deduplication.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationClientSentTextVariety', 0, () => {
      const client: InProcessClient = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, 'alpha');
      client.send(REQUEST_CODE, 'beta');
      client.send(REQUEST_CODE, 'gamma');
      logStep('sessionValidationClientSentTextVariety', client.sentTexts.join(','));
      expect(client.sentTexts.length).assertEqual(3);
      expect(client.sentTexts[0]).assertEqual('alpha');
      expect(client.sentTexts[1]).assertEqual('beta');
      expect(client.sentTexts[2]).assertEqual('gamma');
      expect(uniqueStrings(client.sentTexts).length).assertEqual(3);
      expect(joined(client.sentTexts, '|')).assertEqual('alpha|beta|gamma');
      expect(countOf(client.sentTexts, 'beta')).assertEqual(1);
      expect(client.replies.length).assertEqual(3);
      expect(client.sentCodes.length).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationWriteReclaimThenRead
     * @tc.desc          Values written before a reclaim cannot be read after it.
     * @tc.precondition  A session with values exists.
     * @tc.steps         1. Write two values.
     *                   2. Reclaim the session.
     *                   3. Read twice.
     * @tc.expected      Both reads are empty while the values remain stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationWriteReclaimThenRead', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('stored-a');
      session.writeString('stored-b');
      session.reclaim();
      const first: string = session.readString();
      const second: string = session.readString();
      logStep('sessionValidationWriteReclaimThenRead', sessionSnapshot(session));
      expect(first).assertEqual('');
      expect(second).assertEqual('');
      expect(session.readCount).assertEqual(0);
      expect(session.values[0]).assertEqual('stored-a');
      expect(session.values[1]).assertEqual('stored-b');
      expect(session.size()).assertEqual(2);
      expect(session.trace()).assertEqual('stored-a|stored-b#0');
      expect(session.writeCount).assertEqual(2);
      expect(session.reclaimed).assertTrue();
    });

    /**
     * @tc.name          sessionValidationOptionSyncFlag
     * @tc.desc          The sync predicate honors both flag and boolean inputs.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Build four option combinations.
     *                   2. Evaluate the sync predicate.
     *                   3. Compare the results.
     * @tc.expected      Only options with flag zero or sync true report sync.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationOptionSyncFlag', 0, () => {
      const syncByFlag: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      const syncByBool: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, true);
      const asyncOption: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 50, false);
      logStep('sessionValidationOptionSyncFlag', syncByFlag.describe() + '/' + asyncOption.describe());
      expect(syncByFlag.isSync()).assertTrue();
      expect(syncByBool.isSync()).assertTrue();
      expect(asyncOption.isSync()).assertFalse();
      expect(syncByFlag.flags).assertEqual(0);
      expect(syncByBool.sync).assertTrue();
      expect(asyncOption.describe()).assertEqual('1/50/false');
      expect(syncByBool.describe()).assertEqual('1/0/true');
      expect(syncByFlag.isSync()).assertEqual(syncByFlag.flags === 0);
      expect(asyncOption.isSync()).assertFalse();
    });

    /**
     * @tc.name          sessionValidationTraceFingerprintBounds
     * @tc.desc          Session fingerprints stay inside the documented bounds.
     * @tc.precondition  A populated session exists.
     * @tc.steps         1. Write two values.
     *                   2. Fingerprint the trace.
     *                   3. Compare the bounds.
     * @tc.expected      The fingerprint is positive and below the modulus.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationTraceFingerprintBounds', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('bound-a');
      session.writeString('bound-b');
      const fingerprint: number = textFingerprint(session.trace());
      logStep('sessionValidationTraceFingerprintBounds', String(fingerprint));
      expect(fingerprint).assertLarger(0);
      expect(fingerprint).assertLess(1000003);
      expect(fingerprint).assertEqual(textFingerprint('bound-a|bound-b#0'));
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint(session.values[0])).assertLarger(0);
      expect(textFingerprint(session.values[0]) === textFingerprint(session.values[1])).assertFalse();
      expect(session.size()).assertEqual(2);
      expect(session.cursor).assertEqual(0);
      expect(session.reclaimed).assertFalse();
    });

    /**
     * @tc.name          sessionValidationDuplicateValuesTrace
     * @tc.desc          Duplicate values repeat in the trace but deduplicate in a set view.
     * @tc.precondition  A session with duplicates exists.
     * @tc.steps         1. Write the same value three times.
     *                   2. Read the trace.
     *                   3. Deduplicate the values.
     * @tc.expected      The trace has three segments while unique values is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationDuplicateValuesTrace', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('same');
      session.writeString('same');
      session.writeString('same');
      logStep('sessionValidationDuplicateValuesTrace', session.trace());
      expect(session.trace()).assertEqual('same|same|same#0');
      expect(session.trace().split('|').length).assertEqual(3);
      expect(uniqueStrings(session.values).length).assertEqual(1);
      expect(uniqueStrings(session.values)[0]).assertEqual('same');
      expect(countOf(session.values, 'same')).assertEqual(3);
      expect(session.size()).assertEqual(3);
      expect(session.writeCount).assertEqual(3);
      expect(session.values[2]).assertEqual('same');
      expect(session.readString()).assertEqual('same');
    });

    /**
     * @tc.name          sessionValidationSessionSummaryReport
     * @tc.desc          A summary report joins size, cursor and counters.
     * @tc.precondition  A session with traffic exists.
     * @tc.steps         1. Write three values and read one.
     *                   2. Compose the report.
     *                   3. Inspect each field.
     * @tc.expected      The report matches the session snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSessionSummaryReport', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('r1');
      session.writeString('r2');
      session.writeString('r3');
      session.readString();
      const report: string = sessionSnapshot(session);
      logStep('sessionValidationSessionSummaryReport', report);
      expect(report).assertEqual('3/1/3/1/false');
      expect(report.split('/').length).assertEqual(5);
      expect(report.split('/')[0]).assertEqual('3');
      expect(report.split('/')[1]).assertEqual('1');
      expect(report.split('/')[2]).assertEqual('3');
      expect(report.split('/')[3]).assertEqual('1');
      expect(report.split('/')[4]).assertEqual('false');
      expect(session.size()).assertEqual(3);
      expect(session.cursor).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationClientErrorCodes
     * @tc.desc          Handled and rejected requests carry distinct error codes.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Send one handled and one rejected code.
     *                   2. Compare the error codes.
     *                   3. Confirm the success predicate.
     * @tc.expected      The handled code is zero and the rejected code is 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationClientErrorCodes', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      const handled = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const rejected = client.send(2, REQUEST_PAYLOAD);
      logStep('sessionValidationClientErrorCodes', String(handled.errCode) + '/' + String(rejected.errCode));
      expect(handled.errCode).assertEqual(ERROR_NONE);
      expect(handled.errCode).assertEqual(0);
      expect(rejected.errCode).assertEqual(16000011);
      expect(handled.isSuccess()).assertTrue();
      expect(rejected.isSuccess()).assertFalse();
      expect(handled.handled).assertTrue();
      expect(rejected.handled).assertFalse();
      expect(rejected.replyText).assertEqual('');
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationValueSearch
     * @tc.desc          Writing and searching session values agree.
     * @tc.precondition  A session with known values exists.
     * @tc.steps         1. Write three values.
     *                   2. Search the values array.
     *                   3. Compare the indices.
     * @tc.expected      Present values resolve to indices and absent ones to minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationValueSearch', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('zero');
      session.writeString('one');
      session.writeString('two');
      logStep('sessionValidationValueSearch', joined(session.values, ','));
      expect(session.values.indexOf('zero')).assertEqual(0);
      expect(session.values.indexOf('one')).assertEqual(1);
      expect(session.values.indexOf('two')).assertEqual(2);
      expect(session.values.indexOf('three')).assertEqual(-1);
      expect(session.values.indexOf('')).assertEqual(-1);
      expect(session.values[0]).assertEqual('zero');
      expect(session.size()).assertEqual(3);
      expect(session.cursor).assertEqual(0);
      expect(session.trace()).assertEqual('zero|one|two#0');
    });

    /**
     * @tc.name          sessionValidationLengthMatrix
     * @tc.desc          Session values of several lengths round trip intact.
     * @tc.precondition  A fresh session exists.
     * @tc.steps         1. Write values of length one, ten and one hundred.
     *                   2. Read all three.
     *                   3. Compare the lengths.
     * @tc.expected      Each value returns with its original length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationLengthMatrix', 0, () => {
      const one: string = 'a';
      const ten: string = 'abcdefghij';
      let hundred = '';
      for (let index = 0; index < 10; index++) {
        hundred = hundred + ten;
      }
      const session: MessageSequenceModel = newSession();
      session.writeString(one);
      session.writeString(ten);
      session.writeString(hundred);
      logStep('sessionValidationLengthMatrix', String(hundred.length));
      expect(session.readString().length).assertEqual(1);
      expect(session.readString().length).assertEqual(10);
      expect(session.readString().length).assertEqual(100);
      expect(session.readCount).assertEqual(3);
      expect(session.cursor).assertEqual(3);
      expect(hundred.length).assertEqual(100);
      expect(session.size()).assertEqual(3);
      expect(session.trace().split('|').length).assertEqual(3);
      expect(session.trace().endsWith('#3')).assertTrue();
    });

    /**
     * @tc.name          sessionValidationReclaimSnapshotReport
     * @tc.desc          A reclaimed session snapshot reports the reclaimed flag.
     * @tc.precondition  A reclaimed session exists.
     * @tc.steps         1. Write two values and reclaim.
     *                   2. Compose the snapshot.
     *                   3. Inspect the fields.
     * @tc.expected      The snapshot ends with the reclaimed flag and cursor zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationReclaimSnapshotReport', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString('q1');
      session.writeString('q2');
      session.reclaim();
      const report: string = sessionSnapshot(session);
      logStep('sessionValidationReclaimSnapshotReport', report);
      expect(report).assertEqual('2/0/2/0/true');
      expect(report.endsWith('true')).assertTrue();
      expect(report.split('/')[1]).assertEqual('0');
      expect(report.split('/')[4]).assertEqual('true');
      expect(session.reclaimed).assertTrue();
      expect(session.cursor).assertEqual(0);
      expect(session.readCount).assertEqual(0);
      expect(session.writeCount).assertEqual(2);
      expect(session.readString()).assertEqual('');
    });

    /**
     * @tc.name          sessionValidationSequentialSessions
     * @tc.desc          Three sequential sessions each start empty.
     * @tc.precondition  The session factory is available.
     * @tc.steps         1. Create three sessions.
     *                   2. Write to each.
     *                   3. Compare their independent traces.
     * @tc.expected      Each session holds only its own value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSequentialSessions', 0, () => {
      const first: MessageSequenceModel = newSession();
      const second: MessageSequenceModel = newSession();
      const third: MessageSequenceModel = newSession();
      first.writeString('s1');
      second.writeString('s2');
      third.writeString('s3');
      logStep('sessionValidationSequentialSessions', first.trace() + '/' + third.trace());
      expect(first.trace()).assertEqual('s1#0');
      expect(second.trace()).assertEqual('s2#0');
      expect(third.trace()).assertEqual('s3#0');
      expect(first.size()).assertEqual(1);
      expect(second.size()).assertEqual(1);
      expect(third.size()).assertEqual(1);
      expect(uniqueStrings([first.values[0], second.values[0], third.values[0]]).length).assertEqual(3);
      expect(first.readString()).assertEqual('s1');
      expect(third.readString()).assertEqual('s3');
    });

    /**
     * @tc.name          sessionValidationFinalSessionReport
     * @tc.desc          A final session report combines traffic and reply data.
     * @tc.precondition  A stub, client and session are available.
     * @tc.steps         1. Send two client requests.
     *                   2. Build a session with two values.
     *                   3. Compose the combined report.
     * @tc.expected      The report lists two replies and two session values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationFinalSessionReport', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, PAYLOAD_FIRST);
      client.send(REQUEST_CODE, PAYLOAD_SECOND);
      const session: MessageSequenceModel = newSession();
      session.writeString(PAYLOAD_FIRST);
      session.writeString(PAYLOAD_SECOND);
      const report: string = String(client.replies.length) + ',' + String(session.size()) + ',' +
        String(stub.requestCount()) + ',' + REPLY_PAYLOAD;
      logStep('sessionValidationFinalSessionReport', report);
      expect(report).assertEqual('2,2,2,hello rpc');
      expect(report.split(',').length).assertEqual(4);
      expect(report.split(',')[0]).assertEqual('2');
      expect(report.split(',')[1]).assertEqual('2');
      expect(report.split(',')[2]).assertEqual('2');
      expect(report.split(',')[3]).assertEqual(REPLY_PAYLOAD);
      expect(session.trace()).assertEqual(PAYLOAD_FIRST + '|' + PAYLOAD_SECOND + '#0');
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + '|' + REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationSessionContract
     * @tc.desc          A closing contract check covers every session invariant.
     * @tc.precondition  A session with traffic exists.
     * @tc.steps         1. Write, read, rewind and reclaim.
     *                   2. Check the invariants.
     *                   3. Confirm the final snapshot.
     * @tc.expected      The invariants and snapshot agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSessionContract', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString(PAYLOAD_FIRST);
      session.writeString(PAYLOAD_SECOND);
      session.readString();
      session.rewind();
      session.readString();
      session.reclaim();
      logStep('sessionValidationSessionContract', sessionSnapshot(session));
      expect(session.size()).assertEqual(session.values.length);
      expect(session.writeCount).assertEqual(2);
      expect(session.readCount).assertEqual(2);
      expect(session.cursor).assertEqual(0);
      expect(session.reclaimed).assertTrue();
      expect(session.trace().endsWith('#0')).assertTrue();
      expect(sessionSnapshot(session)).assertEqual('2/0/2/2/true');
      expect(session.readString()).assertEqual('');
      expect(session.values[1]).assertEqual(PAYLOAD_SECOND);
    });

    /**
     * @tc.name          sessionValidationCursorAdvanceContract
     * @tc.desc          The cursor advances by one per successful read only.
     * @tc.precondition  A session with two values exists.
     * @tc.steps         1. Read one value.
     *                   2. Read past the end.
     *                   3. Confirm the cursor stops at the size.
     * @tc.expected      The cursor equals the number of successful reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationCursorAdvanceContract', 0, () => {
      const session: MessageSequenceModel = newSession();
      session.writeString(PAYLOAD_FIRST);
      session.writeString(PAYLOAD_SECOND);
      session.readString();
      const afterFirst: number = session.cursor;
      session.readString();
      const afterSecond: number = session.cursor;
      session.readString();
      logStep('sessionValidationCursorAdvanceContract', String(session.cursor));
      expect(afterFirst).assertEqual(1);
      expect(afterSecond).assertEqual(2);
      expect(session.cursor).assertEqual(2);
      expect(session.cursor).assertEqual(session.size());
      expect(session.readCount).assertEqual(2);
      expect(session.cursor).assertEqual(session.readCount);
      expect(session.trace().endsWith('#2')).assertTrue();
      expect(session.readString()).assertEqual('');
      expect(session.cursor).assertEqual(2);
    });
  });
}
