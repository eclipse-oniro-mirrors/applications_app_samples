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
 * MessageSequence cursor behaviour for the IPC client.
 *
 * The production client writes one string into `data`, reads one string from
 * the reply and reclaims both sequences in `finally`. SharedDriver models the
 * sequence as an append-only list with a forward-only cursor and a reclaimed
 * flag. This suite exercises empty sequences, single and multiple values,
 * over-reads, rewinds, cursor/size invariants, read and write counters,
 * trace formatting, reclaim semantics and the interaction with client sends.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  MessageSequenceModel,
  MessageOptionModel,
  RequestResultModel,
  createConnectedSession,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_SEND,
  UNKNOWN_CODE_ZERO,
  textFingerprint
} from '../Shared/SharedDriver';

/** Builds a sequence from a list of string values. */
function sequenceOf(values: string[]): MessageSequenceModel {
  const model = MessageSequenceModel.create();
  for (let index = 0; index < values.length; index++) {
    model.writeString(values[index]);
  }
  return model;
}

/** Reads up to `max` values from a sequence. */
function readMany(model: MessageSequenceModel, max: number): string[] {
  const values: string[] = [];
  for (let index = 0; index < max; index++) {
    values.push(model.readString());
  }
  return values;
}

/** Builds a repeated single-character string. */
function repeatChar(text: string, count: number): string {
  let result = '';
  for (let index = 0; index < count; index++) {
    result = result + text;
  }
  return result;
}

export default function clientCursor(): void {
  describe('ClientCursorBehavior', () => {
    beforeAll(() => {
      logSuite('ClientCursorBehavior', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientCursorBehavior', 'end');
    });
    /**
     * @tc.name          clientCursorEmptySequenceStartsAtZero
     * @tc.desc          A fresh sequence has zero size, cursor and counters.
     * @tc.precondition  MessageSequenceModel.create is available.
     * @tc.steps         1. Create an empty sequence.
     *                   2. Read every counter.
     *                   3. Confirm the empty predicate.
     * @tc.expected      Size, cursor, write and read counts are all zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCursorEmptySequenceStartsAtZero', 0, () => {
      const model = MessageSequenceModel.create();
      expect(model.size()).assertEqual(0);
      expect(model.cursor).assertEqual(0);
      expect(model.writeCount).assertEqual(0);
      expect(model.readCount).assertEqual(0);
      expect(model.isEmpty()).assertTrue();
      expect(model.isReclaimed()).assertFalse();
      expect(model.trace()).assertEqual('#0');
    });

    /**
     * @tc.name          clientCursorEmptyReadReturnsEmpty
     * @tc.desc          Reading an empty sequence returns an empty string.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Read once. 2. Read again.
     *                   3. Inspect counters.
     * @tc.expected      Both reads return '' and no counter advances.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCursorEmptyReadReturnsEmpty', 0, () => {
      const model = MessageSequenceModel.create();
      expect(model.readString()).assertEqual('');
      expect(model.readString()).assertEqual('');
      expect(model.cursor).assertEqual(0);
      expect(model.readCount).assertEqual(0);
      expect(model.size()).assertEqual(0);
      expect(model.trace()).assertEqual('#0');
    });

    /**
     * @tc.name          clientCursorWriteThenRead
     * @tc.desc          One written value is returned by one read.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write 'hello world'. 2. Read it.
     *                   3. Compare size and cursor.
     * @tc.expected      The read equals the written value and the cursor moves to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCursorWriteThenRead', 0, () => {
      const model = MessageSequenceModel.create();
      expect(model.writeString(REQUEST_PAYLOAD)).assertTrue();
      expect(model.size()).assertEqual(1);
      expect(model.cursor).assertEqual(0);
      expect(model.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(model.cursor).assertEqual(1);
      expect(model.readCount).assertEqual(1);
      expect(model.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          clientCursorReadAdvancesByOne
     * @tc.desc          Each successful read advances the cursor exactly once.
     * @tc.precondition  A three-value sequence.
     * @tc.steps         1. Read one value and check the cursor.
     *                   2. Read a second and check again.
     *                   3. Read the third.
     * @tc.expected      The cursor follows 1, 2, 3.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorReadAdvancesByOne', 0, () => {
      const model = sequenceOf(['a', 'b', 'c']);
      expect(model.cursor).assertEqual(0);
      expect(model.readString()).assertEqual('a');
      expect(model.cursor).assertEqual(1);
      expect(model.readString()).assertEqual('b');
      expect(model.cursor).assertEqual(2);
      expect(model.readString()).assertEqual('c');
      expect(model.cursor).assertEqual(3);
      expect(model.readCount).assertEqual(3);
    });

    /**
     * @tc.name          clientCursorReadBeyondEnd
     * @tc.desc          Reading past the last value returns '' without moving the cursor.
     * @tc.precondition  A single-value sequence.
     * @tc.steps         1. Read the value. 2. Read three more times.
     *                   3. Inspect counters.
     * @tc.expected      Extra reads return '' and the read count stays one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorReadBeyondEnd', 0, () => {
      const model = sequenceOf(['only']);
      expect(model.readString()).assertEqual('only');
      expect(model.readString()).assertEqual('');
      expect(model.readString()).assertEqual('');
      expect(model.readString()).assertEqual('');
      expect(model.cursor).assertEqual(1);
      expect(model.readCount).assertEqual(1);
      expect(model.size()).assertEqual(1);
      expect(model.cursor > model.size()).assertFalse();
    });

    /**
     * @tc.name          clientCursorRewindRestoresStart
     * @tc.desc          Rewinding resets the cursor to zero without clearing values.
     * @tc.precondition  A two-value sequence already drained.
     * @tc.steps         1. Drain both values. 2. Rewind.
     *                   3. Read the first value again.
     * @tc.expected      The cursor returns to zero and reads replay from the start.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorRewindRestoresStart', 0, () => {
      const model = sequenceOf(['first', 'second']);
      expect(model.readString()).assertEqual('first');
      expect(model.readString()).assertEqual('second');
      expect(model.cursor).assertEqual(2);
      model.rewind();
      expect(model.cursor).assertEqual(0);
      expect(model.readString()).assertEqual('first');
      expect(model.cursor).assertEqual(1);
      expect(model.size()).assertEqual(2);
      expect(model.readCount).assertEqual(3);
    });

    /**
     * @tc.name          clientCursorRewindMidway
     * @tc.desc          Rewinding after a partial read replays from the first value.
     * @tc.precondition  A four-value sequence.
     * @tc.steps         1. Read two values. 2. Rewind.
     *                   3. Read the first two values again.
     * @tc.expected      The replay returns the same first two values in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorRewindMidway', 0, () => {
      const model = sequenceOf(['w', 'x', 'y', 'z']);
      expect(model.readString()).assertEqual('w');
      expect(model.readString()).assertEqual('x');
      expect(model.cursor).assertEqual(2);
      model.rewind();
      expect(model.cursor).assertEqual(0);
      expect(model.readString()).assertEqual('w');
      expect(model.readString()).assertEqual('x');
      expect(model.cursor).assertEqual(2);
      expect(model.readCount).assertEqual(4);
    });

    /**
     * @tc.name          clientCursorRewindEmptySequence
     * @tc.desc          Rewinding an empty sequence keeps the cursor at zero.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Rewind twice. 2. Read once.
     *                   3. Inspect the trace.
     * @tc.expected      The cursor stays zero and the read returns ''.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorRewindEmptySequence', 0, () => {
      const model = MessageSequenceModel.create();
      model.rewind();
      expect(model.cursor).assertEqual(0);
      model.rewind();
      expect(model.cursor).assertEqual(0);
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(0);
      expect(model.trace()).assertEqual('#0');
      expect(model.size()).assertEqual(0);
    });

    /**
     * @tc.name          clientCursorSizeGrowsWithWrites
     * @tc.desc          The size grows by one for every accepted write.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write three values, checking size each time.
     *                   2. Compare the final size.
     *                   3. Confirm the values array.
     * @tc.expected      The size follows 1, 2, 3.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorSizeGrowsWithWrites', 0, () => {
      const model = MessageSequenceModel.create();
      expect(model.writeString('one')).assertTrue();
      expect(model.size()).assertEqual(1);
      expect(model.writeString('two')).assertTrue();
      expect(model.size()).assertEqual(2);
      expect(model.writeString('three')).assertTrue();
      expect(model.size()).assertEqual(3);
      expect(model.writeCount).assertEqual(3);
      expect(model.values.length).assertEqual(3);
      expect(model.values[2]).assertEqual('three');
    });

    /**
     * @tc.name          clientCursorIsEmptyAfterWrite
     * @tc.desc          A written sequence is no longer empty.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Check isEmpty. 2. Write one value.
     *                   3. Check isEmpty again.
     * @tc.expected      The predicate flips from true to false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorIsEmptyAfterWrite', 0, () => {
      const model = MessageSequenceModel.create();
      expect(model.isEmpty()).assertTrue();
      model.writeString('');
      expect(model.isEmpty()).assertFalse();
      expect(model.size()).assertEqual(1);
      expect(model.values[0]).assertEqual('');
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(1);
      expect(model.isEmpty()).assertFalse();
    });

    /**
     * @tc.name          clientCursorReclaimBlocksWrite
     * @tc.desc          A reclaimed sequence refuses new writes.
     * @tc.precondition  A sequence with one value.
     * @tc.steps         1. Reclaim the sequence. 2. Attempt a write.
     *                   3. Compare the write counter and size.
     * @tc.expected      The write is refused and the size stays one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorReclaimBlocksWrite', 0, () => {
      const model = sequenceOf(['kept']);
      expect(model.writeString('extra')).assertTrue();
      expect(model.size()).assertEqual(2);
      model.reclaim();
      expect(model.writeString('after')).assertFalse();
      expect(model.size()).assertEqual(2);
      expect(model.writeCount).assertEqual(2);
      expect(model.isReclaimed()).assertTrue();
      expect(model.values[1]).assertEqual('extra');
    });

    /**
     * @tc.name          clientCursorReclaimReturnsEmptyRead
     * @tc.desc          Reading a reclaimed sequence returns '' even with values left.
     * @tc.precondition  A reclaimed two-value sequence.
     * @tc.steps         1. Reclaim before reading.
     *                   2. Read twice. 3. Inspect counters.
     * @tc.expected      Both reads return '' with a zero read count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorReclaimReturnsEmptyRead', 0, () => {
      const model = sequenceOf(['alpha', 'beta']);
      expect(model.size()).assertEqual(2);
      model.reclaim();
      expect(model.readString()).assertEqual('');
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(0);
      expect(model.cursor).assertEqual(0);
      expect(model.size()).assertEqual(2);
      expect(model.isReclaimed()).assertTrue();
    });

    /**
     * @tc.name          clientCursorReclaimResetsCursor
     * @tc.desc          Reclaiming a partially read sequence resets the cursor.
     * @tc.precondition  A three-value sequence with two values read.
     * @tc.steps         1. Read two values. 2. Reclaim.
     *                   3. Inspect the cursor and reclaimed flag.
     * @tc.expected      The cursor is zero and the flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorReclaimResetsCursor', 0, () => {
      const model = sequenceOf(['a', 'b', 'c']);
      expect(model.readString()).assertEqual('a');
      expect(model.readString()).assertEqual('b');
      expect(model.cursor).assertEqual(2);
      model.reclaim();
      expect(model.cursor).assertEqual(0);
      expect(model.isReclaimed()).assertTrue();
      expect(model.readCount).assertEqual(2);
      expect(model.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientCursorReclaimTwiceIsStable
     * @tc.desc          Reclaiming twice keeps the sequence in the reclaimed state.
     * @tc.precondition  A reclaimed sequence.
     * @tc.steps         1. Reclaim again. 2. Read and write.
     *                   3. Inspect the flags and counters.
     * @tc.expected      The state stays reclaimed with no reads or writes accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReclaimTwiceIsStable', 0, () => {
      const model = sequenceOf(['x']);
      model.reclaim();
      model.reclaim();
      expect(model.isReclaimed()).assertTrue();
      expect(model.readString()).assertEqual('');
      expect(model.writeString('y')).assertFalse();
      expect(model.readCount).assertEqual(0);
      expect(model.writeCount).assertEqual(1);
      expect(model.size()).assertEqual(1);
      expect(model.cursor).assertEqual(0);
    });

    /**
     * @tc.name          clientCursorReadCountAfterReclaim
     * @tc.desc          Reads after reclaim never increment the read counter.
     * @tc.precondition  A reclaimed three-value sequence.
     * @tc.steps         1. Attempt five reads. 2. Read the counter.
     *                   3. Rewind and attempt one more read.
     * @tc.expected      The read counter stays zero through all attempts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReadCountAfterReclaim', 0, () => {
      const model = sequenceOf(['1', '2', '3']);
      model.reclaim();
      const values = readMany(model, 5);
      expect(values.length).assertEqual(5);
      expect(values[0]).assertEqual('');
      expect(values[4]).assertEqual('');
      expect(model.readCount).assertEqual(0);
      model.rewind();
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(0);
      expect(model.cursor).assertEqual(0);
    });

    /**
     * @tc.name          clientCursorWriteCountAfterReclaim
     * @tc.desc          The write counter stops growing after reclaim.
     * @tc.precondition  A sequence with two values then reclaimed.
     * @tc.steps         1. Write two values. 2. Reclaim and write again.
     *                   3. Compare the counter.
     * @tc.expected      The write counter remains two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorWriteCountAfterReclaim', 0, () => {
      const model = MessageSequenceModel.create();
      model.writeString('a');
      model.writeString('b');
      expect(model.writeCount).assertEqual(2);
      model.reclaim();
      expect(model.writeString('c')).assertFalse();
      expect(model.writeString('d')).assertFalse();
      expect(model.writeCount).assertEqual(2);
      expect(model.size()).assertEqual(2);
      expect(model.values.indexOf('c')).assertEqual(-1);
      expect(model.isReclaimed()).assertTrue();
    });

    /**
     * @tc.name          clientCursorTraceMultipleValues
     * @tc.desc          The trace joins values with pipes and appends the cursor.
     * @tc.precondition  A three-value sequence.
     * @tc.steps         1. Read the trace before reads.
     *                   2. Read one value. 3. Read the trace again.
     * @tc.expected      The traces are 'a|b|c#0' then 'a|b|c#1'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorTraceMultipleValues', 0, () => {
      const model = sequenceOf(['a', 'b', 'c']);
      expect(model.trace()).assertEqual('a|b|c#0');
      expect(model.trace().split('|').length).assertEqual(3);
      expect(model.trace().endsWith('#0')).assertTrue();
      model.readString();
      expect(model.trace()).assertEqual('a|b|c#1');
      expect(model.trace().endsWith('#1')).assertTrue();
      expect(model.trace().split('#').length).assertEqual(2);
    });

    /**
     * @tc.name          clientCursorTraceAfterFullDrain
     * @tc.desc          The trace cursor reaches the value count after a full drain.
     * @tc.precondition  A two-value sequence.
     * @tc.steps         1. Drain both values.
     *                   2. Read the trace.
     *                   3. Compare with the expected suffix.
     * @tc.expected      The trace ends with '#2'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorTraceAfterFullDrain', 0, () => {
      const model = sequenceOf(['left', 'right']);
      model.readString();
      model.readString();
      expect(model.cursor).assertEqual(2);
      expect(model.trace()).assertEqual('left|right#2');
      expect(model.trace().endsWith('#2')).assertTrue();
      expect(model.trace().indexOf('|')).assertLarger(-1);
      expect(model.readString()).assertEqual('');
      expect(model.trace()).assertEqual('left|right#2');
    });

    /**
     * @tc.name          clientCursorOrderPreserved
     * @tc.desc          Values are returned in insertion order.
     * @tc.precondition  A five-value sequence.
     * @tc.steps         1. Write values one through five.
     *                   2. Read all five.
     *                   3. Compare the list.
     * @tc.expected      The read order matches the write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorOrderPreserved', 0, () => {
      const model = sequenceOf(['1', '2', '3', '4', '5']);
      const values = readMany(model, 5);
      expect(values.length).assertEqual(5);
      expect(values[0]).assertEqual('1');
      expect(values[1]).assertEqual('2');
      expect(values[2]).assertEqual('3');
      expect(values[3]).assertEqual('4');
      expect(values[4]).assertEqual('5');
      expect(values.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.name          clientCursorDuplicateValuesAllowed
     * @tc.desc          Duplicate values are stored and read back independently.
     * @tc.precondition  A sequence with three identical values.
     * @tc.steps         1. Write 'same' three times.
     *                   2. Read all three. 3. Compare the size.
     * @tc.expected      All three reads return 'same' and the size is three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorDuplicateValuesAllowed', 0, () => {
      const model = sequenceOf(['same', 'same', 'same']);
      expect(model.size()).assertEqual(3);
      expect(model.values[0]).assertEqual(model.values[1]);
      expect(model.readString()).assertEqual('same');
      expect(model.readString()).assertEqual('same');
      expect(model.readString()).assertEqual('same');
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(3);
    });

    /**
     * @tc.name          clientCursorEmptyStringValue
     * @tc.desc          An empty string stored explicitly is distinguishable by size.
     * @tc.precondition  A sequence with one empty string.
     * @tc.steps         1. Write ''. 2. Compare size and isEmpty.
     *                   3. Read it and inspect the counter.
     * @tc.expected      The size is one while isEmpty is false and the read count advances.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorEmptyStringValue', 0, () => {
      const model = MessageSequenceModel.create();
      model.writeString('');
      expect(model.size()).assertEqual(1);
      expect(model.isEmpty()).assertFalse();
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(1);
      expect(model.cursor).assertEqual(1);
      expect(model.trace()).assertEqual('#1');
    });

    /**
     * @tc.name          clientCursorUnicodeValue
     * @tc.desc          Unicode values survive the sequence round trip.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write two Unicode values.
     *                   2. Read them. 3. Compare the traces.
     * @tc.expected      Both values are returned unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorUnicodeValue', 0, () => {
      const model = sequenceOf(['你好', '世界']);
      expect(model.size()).assertEqual(2);
      expect(model.readString()).assertEqual('你好');
      expect(model.readString()).assertEqual('世界');
      expect(model.readCount).assertEqual(2);
      expect(model.cursor).assertEqual(2);
      expect(model.values[1]).assertEqual('世界');
      expect(model.trace()).assertEqual('你好|世界#2');
    });

    /**
     * @tc.name          clientCursorLongValue
     * @tc.desc          A long value is stored as a single entry.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Build a 200-character value.
     *                   2. Write and read it. 3. Compare the length.
     * @tc.expected      The value is returned whole with length 200.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorLongValue', 0, () => {
      const long = repeatChar('x', 200);
      const model = sequenceOf([long]);
      expect(long.length).assertEqual(200);
      expect(model.size()).assertEqual(1);
      expect(model.readString().length).assertEqual(200);
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(1);
      expect(model.values[0]).assertEqual(long);
    });

    /**
     * @tc.name          clientCursorSpecialSeparatorValues
     * @tc.desc          Values containing pipe and hash characters are stored verbatim.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write 'a|b' and 'c#d'.
     *                   2. Read both. 3. Inspect the raw trace.
     * @tc.expected      Both values round-trip while the trace shows only raw joins.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorSpecialSeparatorValues', 0, () => {
      const model = sequenceOf(['a|b', 'c#d']);
      expect(model.readString()).assertEqual('a|b');
      expect(model.readString()).assertEqual('c#d');
      expect(model.values[0].indexOf('|')).assertLarger(-1);
      expect(model.values[1].indexOf('#')).assertLarger(-1);
      expect(model.trace()).assertEqual('a|b|c#d#2');
      expect(model.trace().endsWith('#2')).assertTrue();
      expect(model.readCount).assertEqual(2);
    });

    /**
     * @tc.name          clientCursorClientSendConsumesOneRequestValue
     * @tc.desc          One client send consumes exactly one value from the stub view.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the sample payload.
     *                   2. Read the stub received texts.
     *                   3. Confirm only one entry exists.
     * @tc.expected      The stub sees one request value equal to 'hello world'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorClientSendConsumesOneRequestValue', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.requests.length).assertEqual(1);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.sendCalls).assertEqual(1);
      expect(session.proxy?.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          clientCursorClientReplyCursorStartsAtZero
     * @tc.desc          A returned reply sequence starts unread.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send a request. 2. Inspect the reply cursor.
     *                   3. Read the reply.
     * @tc.expected      The cursor starts at zero and advances to one after reading.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorClientReplyCursorStartsAtZero', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.readCount).assertEqual(0);
      expect(result.reply.size()).assertEqual(1);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(result.reply.trace()).assertEqual(REPLY_PAYLOAD + '#1');
    });

    /**
     * @tc.name          clientCursorClientReplySecondRead
     * @tc.desc          A client reply yields one value and then reads empty.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send a request. 2. Read twice.
     *                   3. Inspect the cursor after both reads.
     * @tc.expected      The second read is '' and the cursor stays at one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorClientReplySecondRead', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name          clientCursorClientReplyRewind
     * @tc.desc          A client reply can be rewound and replayed.
     * @tc.precondition  A connected session after one send.
     * @tc.steps         1. Read the reply. 2. Rewind.
     *                   3. Read the reply again.
     * @tc.expected      The replay returns 'hello rpc' again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorClientReplyRewind', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      result.reply.rewind();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.readCount).assertEqual(2);
      expect(result.reply.size()).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          clientCursorClientReplyReclaim
     * @tc.desc          Reclaiming a client reply makes it unreadable.
     * @tc.precondition  A connected session after one send.
     * @tc.steps         1. Reclaim the result reply.
     *                   2. Read it. 3. Confirm the reclaimed flag.
     * @tc.expected      The read returns '' and the flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorClientReplyReclaim', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(0);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientCursorSecondRequestFreshSequence
     * @tc.desc          Each request uses a fresh data and reply sequence.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send twice. 2. Compare both result cursors.
     *                   3. Read both replies.
     * @tc.expected      Both replies have one value and independent cursors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorSecondRequestFreshSequence', 0, () => {
      const session = createConnectedSession();
      const first = session.sendString('first');
      const second = session.sendString('second');
      expect(first.reply.cursor).assertEqual(0);
      expect(second.reply.cursor).assertEqual(0);
      expect(first.reply === second.reply).assertFalse();
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.reply.cursor).assertEqual(1);
      expect(second.reply.cursor).assertEqual(0);
      expect(second.readReply()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientCursorUnknownCodeDoesNotReadData
     * @tc.desc          The stub reads no request value for an unknown code.
     * @tc.precondition  A connected session and a local data sequence.
     * @tc.steps         1. Send code 0 with a payload.
     *                   2. Read the result. 3. Inspect the data cursor.
     * @tc.expected      The data cursor is unchanged and the stub stored no text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorUnknownCodeDoesNotReadData', 0, () => {
      const session = createConnectedSession();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const result = session.proxy?.sendMessageRequest(UNKNOWN_CODE_ZERO, data, reply,
        new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_SEND);
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(data.size()).assertEqual(1);
      expect(reply.size()).assertEqual(0);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      data.reclaim();
      reply.reclaim();
    });

    /**
     * @tc.name          clientCursorKnownCodeConsumesData
     * @tc.desc          The stub consumes exactly one request value for code 1.
     * @tc.precondition  A connected session and a local data sequence.
     * @tc.steps         1. Send code 1. 2. Inspect the data cursor.
     *                   3. Confirm the stub text list.
     * @tc.expected      The cursor is one and the stored text matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorKnownCodeConsumesData', 0, () => {
      const session = createConnectedSession();
      const data = sequenceOf([REQUEST_PAYLOAD]);
      const reply = MessageSequenceModel.create();
      const result = session.proxy?.sendMessageRequest(REQUEST_CODE, data, reply,
        new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_NONE);
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(data.readString()).assertEqual('');
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(reply.size()).assertEqual(1);
      data.reclaim();
      reply.reclaim();
    });

    /**
     * @tc.name          clientCursorReplySequenceFilledByStub
     * @tc.desc          The stub writes one value into the transport reply sequence.
     * @tc.precondition  A connected session and a local reply sequence.
     * @tc.steps         1. Send code 1 with a fresh reply.
     *                   2. Inspect the reply sequence.
     *                   3. Read its value.
     * @tc.expected      The reply has one value equal to 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReplySequenceFilledByStub', 0, () => {
      const session = createConnectedSession();
      const data = sequenceOf([REQUEST_PAYLOAD]);
      const reply = MessageSequenceModel.create();
      const result = session.proxy?.sendMessageRequest(REQUEST_CODE, data, reply,
        new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_NONE);
      expect(reply.size()).assertEqual(1);
      expect(reply.cursor).assertEqual(0);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(reply.trace()).assertEqual(REPLY_PAYLOAD + '#1');
      data.reclaim();
      reply.reclaim();
    });

    /**
     * @tc.name          clientCursorTwoSequencesIndependent
     * @tc.desc          Two sequences keep independent cursors and counters.
     * @tc.precondition  Two separate sequences.
     * @tc.steps         1. Read one value from the first.
     *                   2. Read two from the second. 3. Compare cursors.
     * @tc.expected      The cursors are one and two respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorTwoSequencesIndependent', 0, () => {
      const first = sequenceOf(['a', 'b']);
      const second = sequenceOf(['c', 'd', 'e']);
      expect(first.readString()).assertEqual('a');
      expect(first.cursor).assertEqual(1);
      expect(second.cursor).assertEqual(0);
      expect(second.readString()).assertEqual('c');
      expect(second.readString()).assertEqual('d');
      expect(second.cursor).assertEqual(2);
      expect(first.cursor).assertEqual(1);
      expect(first.readCount).assertEqual(1);
      expect(second.readCount).assertEqual(2);
    });

    /**
     * @tc.name          clientCursorRewindKeepsValues
     * @tc.desc          Rewinding never changes the stored value list.
     * @tc.precondition  A three-value sequence.
     * @tc.steps         1. Snapshot the values.
     *                   2. Drain and rewind twice. 3. Compare the values.
     * @tc.expected      The values array is identical throughout.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorRewindKeepsValues', 0, () => {
      const model = sequenceOf(['a', 'b', 'c']);
      const snapshot = model.values.join(',');
      model.readString();
      model.readString();
      model.rewind();
      model.readString();
      model.rewind();
      expect(model.values.join(',')).assertEqual(snapshot);
      expect(model.values.join(',')).assertEqual('a,b,c');
      expect(model.size()).assertEqual(3);
      expect(model.cursor).assertEqual(0);
      expect(model.readCount).assertEqual(3);
      expect(model.writeCount).assertEqual(3);
    });

    /**
     * @tc.name          clientCursorCursorNeverExceedsSize
     * @tc.desc          The cursor never grows beyond the stored value count.
     * @tc.precondition  A two-value sequence.
     * @tc.steps         1. Read five times.
     *                   2. Compare the cursor with the size.
     *                   3. Rewind and compare again.
     * @tc.expected      The cursor equals the size after draining and zero after rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorCursorNeverExceedsSize', 0, () => {
      const model = sequenceOf(['x', 'y']);
      readMany(model, 5);
      expect(model.cursor).assertEqual(2);
      expect(model.cursor).assertEqual(model.size());
      expect(model.cursor > model.size()).assertFalse();
      model.rewind();
      expect(model.cursor).assertEqual(0);
      expect(model.cursor <= model.size()).assertTrue();
      expect(model.readCount).assertEqual(2);
    });

    /**
     * @tc.name          clientCursorTraceAfterRewind
     * @tc.desc          The trace reflects the cursor reset after rewinding.
     * @tc.precondition  A drained two-value sequence.
     * @tc.steps         1. Read the trace after draining.
     *                   2. Rewind. 3. Read the trace again.
     * @tc.expected      The trace changes from '#2' to '#0' with the same values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorTraceAfterRewind', 0, () => {
      const model = sequenceOf(['p', 'q']);
      readMany(model, 2);
      expect(model.trace()).assertEqual('p|q#2');
      model.rewind();
      expect(model.trace()).assertEqual('p|q#0');
      expect(model.trace().startsWith('p|q')).assertTrue();
      expect(model.trace().split('#')[0]).assertEqual('p|q');
      expect(model.readCount).assertEqual(2);
      expect(model.cursor).assertEqual(0);
    });

    /**
     * @tc.name          clientCursorCountersIndependent
     * @tc.desc          Read and write counters track their own operations.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write three, read one.
     *                   2. Read the counters.
     *                   3. Write one more and compare.
     * @tc.expected      Write and read counters advance independently.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorCountersIndependent', 0, () => {
      const model = MessageSequenceModel.create();
      model.writeString('1');
      model.writeString('2');
      model.writeString('3');
      expect(model.writeCount).assertEqual(3);
      expect(model.readCount).assertEqual(0);
      model.readString();
      expect(model.readCount).assertEqual(1);
      expect(model.writeCount).assertEqual(3);
      model.writeString('4');
      expect(model.writeCount).assertEqual(4);
      expect(model.readCount).assertEqual(1);
      expect(model.size()).assertEqual(4);
    });

    /**
     * @tc.name          clientCursorWriteAfterPartialRead
     * @tc.desc          Writing more values after a partial read appends to the sequence.
     * @tc.precondition  A two-value sequence with one value read.
     * @tc.steps         1. Read one value. 2. Write a third.
     *                   3. Drain the rest.
     * @tc.expected      The remaining values are the second and the appended third.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorWriteAfterPartialRead', 0, () => {
      const model = sequenceOf(['one', 'two']);
      expect(model.readString()).assertEqual('one');
      expect(model.writeString('three')).assertTrue();
      expect(model.size()).assertEqual(3);
      expect(model.readString()).assertEqual('two');
      expect(model.readString()).assertEqual('three');
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(3);
      expect(model.trace()).assertEqual('one|two|three#3');
    });

    /**
     * @tc.name          clientCursorManyValuesTrace
     * @tc.desc          A six-value trace keeps every value in order.
     * @tc.precondition  A six-value sequence.
     * @tc.steps         1. Read two values.
     *                   2. Split the trace on pipes.
     *                   3. Compare the segments.
     * @tc.expected      Six segments plus the cursor suffix appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorManyValuesTrace', 0, () => {
      const model = sequenceOf(['v1', 'v2', 'v3', 'v4', 'v5', 'v6']);
      model.readString();
      model.readString();
      const parts = model.trace().split('|');
      expect(parts.length).assertEqual(6);
      expect(parts[0]).assertEqual('v1');
      expect(parts[5]).assertEqual('v6#2');
      expect(model.cursor).assertEqual(2);
      expect(model.size()).assertEqual(6);
      expect(model.readCount).assertEqual(2);
    });

    /**
     * @tc.name          clientCursorReadCountOnlySuccessful
     * @tc.desc          Only in-range reads increment the read counter.
     * @tc.precondition  A one-value sequence.
     * @tc.steps         1. Make three reads. 2. Compare the counter.
     *                   3. Rewind and read once.
     * @tc.expected      The counter is one before and two after the replay.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReadCountOnlySuccessful', 0, () => {
      const model = sequenceOf(['only']);
      expect(model.readString()).assertEqual('only');
      expect(model.readString()).assertEqual('');
      expect(model.readString()).assertEqual('');
      expect(model.readCount).assertEqual(1);
      model.rewind();
      expect(model.readString()).assertEqual('only');
      expect(model.readCount).assertEqual(2);
      expect(model.cursor).assertEqual(1);
    });

    /**
     * @tc.name          clientCursorSizeStableAfterReads
     * @tc.desc          Reading never shrinks the stored size.
     * @tc.precondition  A four-value sequence.
     * @tc.steps         1. Read all four. 2. Rewind and read two.
     *                   3. Compare the size.
     * @tc.expected      The size remains four throughout.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorSizeStableAfterReads', 0, () => {
      const model = sequenceOf(['a', 'b', 'c', 'd']);
      readMany(model, 4);
      expect(model.size()).assertEqual(4);
      model.rewind();
      readMany(model, 2);
      expect(model.size()).assertEqual(4);
      expect(model.values.length).assertEqual(4);
      expect(model.isEmpty()).assertFalse();
      expect(model.readCount).assertEqual(6);
      expect(model.cursor).assertEqual(2);
    });

    /**
     * @tc.name          clientCursorRequestResultEmptySequence
     * @tc.desc          A result without reply text owns an empty unwritten sequence.
     * @tc.precondition  A RequestResultModel built with no text.
     * @tc.steps         1. Inspect the reply sequence.
     *                   2. Read it three times. 3. Compare counters.
     * @tc.expected      The sequence is empty with zero counters and reads ''.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorRequestResultEmptySequence', 0, () => {
      const result = new RequestResultModel(ERROR_NONE);
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.reply.writeCount).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(0);
    });

    /**
     * @tc.name          clientCursorRequestResultSingleSequence
     * @tc.desc          A result with text owns exactly one sequence value.
     * @tc.precondition  A RequestResultModel built with 'reply'.
     * @tc.steps         1. Inspect the sequence.
     *                   2. Drain it. 3. Compare the cursor.
     * @tc.expected      One value is present and the cursor reaches one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorRequestResultSingleSequence', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, 'reply');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.writeCount).assertEqual(1);
      expect(result.reply.values[0]).assertEqual('reply');
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.readString()).assertEqual('reply');
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          clientCursorStubWritesReplyEachTime
     * @tc.desc          Every handled request appends one value to its own reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send three requests directly through the proxy.
     *                   2. Inspect each reply size.
     *                   3. Compare the cursor positions.
     * @tc.expected      Each reply sequence holds one unread value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorStubWritesReplyEachTime', 0, () => {
      const session = createConnectedSession();
      const replies: MessageSequenceModel[] = [];
      for (let index = 0; index < 3; index++) {
        const data = sequenceOf([REQUEST_PAYLOAD]);
        const reply = MessageSequenceModel.create();
        session.proxy?.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
        replies.push(reply);
        data.reclaim();
      }
      expect(replies.length).assertEqual(3);
      expect(replies[0].size()).assertEqual(1);
      expect(replies[1].size()).assertEqual(1);
      expect(replies[2].size()).assertEqual(1);
      expect(replies[0].cursor).assertEqual(0);
      expect(replies[2].cursor).assertEqual(0);
      expect(replies[2].values[0]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientCursorClientSendTwiceCounters
     * @tc.desc          Two client sends produce two request values in the stub.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send twice. 2. Read the stored texts.
     *                   3. Compare the counters.
     * @tc.expected      The stub holds two texts and the send counter is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorClientSendTwiceCounters', 0, () => {
      const session = createConnectedSession();
      session.sendString('alpha');
      session.sendString('beta');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(2);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('alpha');
      expect(session.proxy?.stub.receivedTexts[1]).assertEqual('beta');
      expect(session.proxy?.sendCalls).assertEqual(2);
      expect(session.proxy?.requests.length).assertEqual(2);
      expect(session.proxy?.stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          clientCursorUnknownThenKnown
     * @tc.desc          An unknown send does not disturb the next known sequence.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send code 0 locally.
     *                   2. Send code 1 through the client.
     *                   3. Read the client reply.
     * @tc.expected      The known request consumes one value and replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorUnknownThenKnown', 0, () => {
      const session = createConnectedSession();
      const badData = sequenceOf([REQUEST_PAYLOAD]);
      const badReply = MessageSequenceModel.create();
      session.proxy?.sendMessageRequest(UNKNOWN_CODE_ZERO, badData, badReply, new MessageOptionModel());
      expect(badData.cursor).assertEqual(0);
      const good = session.sendString(REQUEST_PAYLOAD);
      expect(good.isSuccess()).assertTrue();
      expect(good.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(good.reply.cursor).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.requests.join(',')).assertEqual('0,1');
      badData.reclaim();
      badReply.reclaim();
    });

    /**
     * @tc.name          clientCursorReclaimBothBuffers
     * @tc.desc          Reclaiming request and reply buffers ends both sequences.
     * @tc.precondition  A local request and reply pair with values.
     * @tc.steps         1. Write one value to each.
     *                   2. Reclaim both. 3. Read and write again.
     * @tc.expected      Both sequences refuse further operations.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReclaimBothBuffers', 0, () => {
      const data = sequenceOf(['request']);
      const reply = sequenceOf(['reply']);
      data.reclaim();
      reply.reclaim();
      expect(data.isReclaimed()).assertTrue();
      expect(reply.isReclaimed()).assertTrue();
      expect(data.readString()).assertEqual('');
      expect(reply.readString()).assertEqual('');
      expect(data.writeString('x')).assertFalse();
      expect(reply.writeString('y')).assertFalse();
      expect(data.size()).assertEqual(1);
      expect(reply.size()).assertEqual(1);
    });

    /**
     * @tc.name          clientCursorStubReadsOnePerHandled
     * @tc.desc          A data sequence with two values leaves one after a handled request.
     * @tc.precondition  A connected session and a two-value data sequence.
     * @tc.steps         1. Send code 1 with the data.
     *                   2. Inspect the data cursor and remaining read.
     *                   3. Confirm the stub stored the first value.
     * @tc.expected      The cursor is one and the remaining read is the second value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorStubReadsOnePerHandled', 0, () => {
      const session = createConnectedSession();
      const data = sequenceOf(['first', 'second']);
      const reply = MessageSequenceModel.create();
      session.proxy?.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(data.readString()).assertEqual('second');
      expect(data.cursor).assertEqual(2);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('first');
      expect(reply.size()).assertEqual(1);
      data.reclaim();
      reply.reclaim();
    });

    /**
     * @tc.name          clientCursorReplyReclaimBeforeRead
     * @tc.desc          Reclaiming the transport reply before reading loses the value.
     * @tc.precondition  A connected session and a local reply sequence.
     * @tc.steps         1. Send code 1 into the reply.
     *                   2. Reclaim the reply before reading.
     *                   3. Attempt to read.
     * @tc.expected      The read returns '' while the size remains one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReplyReclaimBeforeRead', 0, () => {
      const session = createConnectedSession();
      const data = sequenceOf([REQUEST_PAYLOAD]);
      const reply = MessageSequenceModel.create();
      session.proxy?.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(1);
      reply.reclaim();
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(0);
      expect(reply.isReclaimed()).assertTrue();
      expect(reply.values.length).assertEqual(1);
      expect(reply.values[0]).assertEqual(REPLY_PAYLOAD);
      data.reclaim();
    });

    /**
     * @tc.name          clientCursorTraceFingerprint
     * @tc.desc          Trace fingerprints differ when only the cursor differs.
     * @tc.precondition  A two-value sequence.
     * @tc.steps         1. Hash the trace before reading.
     *                   2. Read one value. 3. Hash again.
     * @tc.expected      The two hashes differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorTraceFingerprint', 0, () => {
      const model = sequenceOf(['aa', 'bb']);
      const before = textFingerprint(model.trace());
      model.readString();
      const after = textFingerprint(model.trace());
      expect(before === after).assertFalse();
      expect(before).assertEqual(textFingerprint('aa|bb#0'));
      expect(after).assertEqual(textFingerprint('aa|bb#1'));
      expect(model.readString()).assertEqual('bb');
      expect(textFingerprint(model.trace())).assertEqual(textFingerprint('aa|bb#2'));
    });

    /**
     * @tc.name          clientCursorRewindThenDrain
     * @tc.desc          A rewind followed by a full drain reaches the end again.
     * @tc.precondition  A three-value sequence.
     * @tc.steps         1. Drain once. 2. Rewind and drain again.
     *                   3. Compare the collected values.
     * @tc.expected      Both drains return the same three values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorRewindThenDrain', 0, () => {
      const model = sequenceOf(['m', 'n', 'o']);
      const first = readMany(model, 3);
      model.rewind();
      const second = readMany(model, 3);
      expect(first.join('')).assertEqual('mno');
      expect(second.join('')).assertEqual('mno');
      expect(first.join(',')).assertEqual(second.join(','));
      expect(model.cursor).assertEqual(3);
      expect(model.readCount).assertEqual(6);
      expect(model.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientCursorContractSummary
     * @tc.desc          The cursor contract holds across a full client exchange.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send and read the reply.
     *                   2. Rewind and read again.
     *                   3. Reclaim and confirm the final state.
     * @tc.expected      Cursor movement, replay and reclaim all behave as documented.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorContractSummary', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
      result.reply.rewind();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.readCount).assertEqual(2);
      result.reply.reclaim();
      expect(result.readReply()).assertEqual('');
      expect(result.reply.isReclaimed()).assertTrue();
    });

    /**
     * @tc.name          clientCursorMultipleRewinds
     * @tc.desc          Repeated rewinds are idempotent on the cursor.
     * @tc.precondition  A drained three-value sequence.
     * @tc.steps         1. Rewind three times.
     *                   2. Compare the cursor and trace each time.
     *                   3. Read one value.
     * @tc.expected      The cursor stays zero and the trace stays '#0'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorMultipleRewinds', 0, () => {
      const model = sequenceOf(['a', 'b', 'c']);
      readMany(model, 3);
      model.rewind();
      model.rewind();
      model.rewind();
      expect(model.cursor).assertEqual(0);
      expect(model.trace()).assertEqual('a|b|c#0');
      expect(model.readString()).assertEqual('a');
      expect(model.cursor).assertEqual(1);
      expect(model.readCount).assertEqual(4);
      expect(model.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientCursorInterleavedOperations
     * @tc.desc          Interleaved writes, reads and rewinds stay consistent.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write, read, write, read, rewind.
     *                   2. Drain the rest. 3. Compare every value.
     * @tc.expected      The value list and counters match the operation order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorInterleavedOperations', 0, () => {
      const model = MessageSequenceModel.create();
      model.writeString('a');
      expect(model.readString()).assertEqual('a');
      model.writeString('b');
      model.writeString('c');
      expect(model.readString()).assertEqual('b');
      model.rewind();
      expect(model.readString()).assertEqual('a');
      expect(model.readString()).assertEqual('b');
      expect(model.readString()).assertEqual('c');
      expect(model.values.join(',')).assertEqual('a,b,c');
      expect(model.writeCount).assertEqual(3);
      expect(model.readCount).assertEqual(5);
    });

    /**
     * @tc.name          clientCursorReclaimKeepsValuesArray
     * @tc.desc          Reclaim does not clear the stored value list.
     * @tc.precondition  A two-value sequence.
     * @tc.steps         1. Reclaim. 2. Compare values and size.
     *                   3. Read the trace.
     * @tc.expected      The values and size remain while reads are refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReclaimKeepsValuesArray', 0, () => {
      const model = sequenceOf(['keep1', 'keep2']);
      model.reclaim();
      expect(model.values.length).assertEqual(2);
      expect(model.values[0]).assertEqual('keep1');
      expect(model.values[1]).assertEqual('keep2');
      expect(model.size()).assertEqual(2);
      expect(model.trace()).assertEqual('keep1|keep2#0');
      expect(model.readString()).assertEqual('');
      expect(model.isReclaimed()).assertTrue();
    });

    /**
     * @tc.name          clientCursorEmptyTraceAfterReclaim
     * @tc.desc          A reclaimed empty sequence reports the empty trace.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Reclaim the empty sequence.
     *                   2. Read the trace. 3. Check the counters.
     * @tc.expected      The trace is '#0' with all counters zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorEmptyTraceAfterReclaim', 0, () => {
      const model = MessageSequenceModel.create();
      model.reclaim();
      expect(model.trace()).assertEqual('#0');
      expect(model.isEmpty()).assertTrue();
      expect(model.size()).assertEqual(0);
      expect(model.cursor).assertEqual(0);
      expect(model.readCount).assertEqual(0);
      expect(model.writeCount).assertEqual(0);
      expect(model.readString()).assertEqual('');
    });

    /**
     * @tc.name          clientCursorReadAfterRewindCounts
     * @tc.desc          Reads after a rewind keep incrementing the read counter.
     * @tc.precondition  A one-value sequence read twice via rewind.
     * @tc.steps         1. Read. 2. Rewind and read.
     *                   3. Rewind and read again.
     * @tc.expected      The read counter reaches three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorReadAfterRewindCounts', 0, () => {
      const model = sequenceOf(['loop']);
      expect(model.readString()).assertEqual('loop');
      model.rewind();
      expect(model.readString()).assertEqual('loop');
      model.rewind();
      expect(model.readString()).assertEqual('loop');
      expect(model.readCount).assertEqual(3);
      expect(model.cursor).assertEqual(1);
      expect(model.size()).assertEqual(1);
      expect(model.writeCount).assertEqual(1);
      expect(model.trace()).assertEqual('loop#1');
    });

    /**
     * @tc.name          clientCursorWriteAfterReclaimKeepsValues
     * @tc.desc          A refused write after reclaim leaves values untouched.
     * @tc.precondition  A reclaimed two-value sequence.
     * @tc.steps         1. Attempt two writes.
     *                   2. Compare values and counters.
     *                   3. Read the trace.
     * @tc.expected      No new value appears and the counters stay fixed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientCursorWriteAfterReclaimKeepsValues', 0, () => {
      const model = sequenceOf(['u', 'v']);
      model.reclaim();
      expect(model.writeString('w')).assertFalse();
      expect(model.writeString('x')).assertFalse();
      expect(model.values.join(',')).assertEqual('u,v');
      expect(model.writeCount).assertEqual(2);
      expect(model.size()).assertEqual(2);
      expect(model.trace()).assertEqual('u|v#0');
    });

    /**
     * @tc.name          clientCursorFinalCounters
     * @tc.desc          A scripted operation sequence yields predictable counters.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write two values and read one.
     *                   2. Rewind and read one. 3. Reclaim and read.
     * @tc.expected      The counters settle at two writes and two reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorFinalCounters', 0, () => {
      const model = MessageSequenceModel.create();
      model.writeString('one');
      model.writeString('two');
      expect(model.readString()).assertEqual('one');
      model.rewind();
      expect(model.readString()).assertEqual('one');
      model.reclaim();
      expect(model.readString()).assertEqual('');
      expect(model.writeCount).assertEqual(2);
      expect(model.readCount).assertEqual(2);
      expect(model.size()).assertEqual(2);
      expect(model.cursor).assertEqual(0);
    });

    /**
     * @tc.name          clientCursorBoundaryOneValue
     * @tc.desc          A one-value sequence defines the smallest non-empty case.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write one value. 2. Read it and over-read.
     *                   3. Rewind and repeat.
     * @tc.expected      Every boundary observable matches the specification.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientCursorBoundaryOneValue', 0, () => {
      const model = MessageSequenceModel.create();
      model.writeString('solo');
      expect(model.size()).assertEqual(1);
      expect(model.isEmpty()).assertFalse();
      expect(model.cursor).assertEqual(0);
      expect(model.readString()).assertEqual('solo');
      expect(model.cursor).assertEqual(model.size());
      expect(model.readString()).assertEqual('');
      expect(model.trace()).assertEqual('solo#1');
    });

    /**
     * @tc.name          clientCursorSummaryEmptyAndFilled
     * @tc.desc          Empty and filled sequences expose opposite predicates.
     * @tc.precondition  Two sequences, one empty and one filled.
     * @tc.steps         1. Compare sizes and isEmpty.
     *                   2. Read from both. 3. Compare the traces.
     * @tc.expected      The empty sequence reads '' while the filled one reads its value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientCursorSummaryEmptyAndFilled', 0, () => {
      const empty = MessageSequenceModel.create();
      const filled = sequenceOf([REQUEST_PAYLOAD]);
      expect(empty.isEmpty()).assertTrue();
      expect(filled.isEmpty()).assertFalse();
      expect(empty.size()).assertEqual(0);
      expect(filled.size()).assertEqual(1);
      expect(empty.readString()).assertEqual('');
      expect(filled.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(empty.trace()).assertEqual('#0');
      expect(filled.trace()).assertEqual(REQUEST_PAYLOAD + '#1');
    });

  });
}
