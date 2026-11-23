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
  MessageSequenceModel,
  MessageOptionModel,
  StubRemoteObjectModel,
  InProcessClient,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint
} from '../Shared/SharedDriver';

export default function stubSequenceTest(): void {
  describe('StubMessageSequence', () => {
    beforeAll(() => {
      logSuite('StubMessageSequence', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubMessageSequence', 'end');
    });

    /**
     * @tc.name   stubSequenceNewIsEmpty
     * @tc.desc   A new sequence has no values and neutral counters.
     * @tc.precondition  The factory is available.
     * @tc.steps         1. Create a sequence through the factory.
     *                   2. Read size, cursor and counters.
     *                   3. Read the reclaimed flag.
     * @tc.expected      The sequence starts empty and usable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceNewIsEmpty', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.reclaimed).assertFalse();
      expect(sequence.values.length).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
    });

    /**
     * @tc.name   stubSequenceFactoryReturnsFreshInstance
     * @tc.desc   Each factory call returns an independent sequence.
     * @tc.precondition  The factory is available.
     * @tc.steps         1. Create two sequences.
     *                   2. Write into the first.
     *                   3. Compare both sequences.
     * @tc.expected      The second sequence is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceFactoryReturnsFreshInstance', 0, () => {
      const first = MessageSequenceModel.create();
      const second = MessageSequenceModel.create();
      first.writeString('only first');
      expect(first.size()).assertEqual(1);
      expect(second.size()).assertEqual(0);
      expect(second.trace()).assertEqual('#0');
      expect(first === second).assertFalse();
      expect(first.values === second.values).assertFalse();
      expect(second.writeCount).assertEqual(0);
    });

    /**
     * @tc.name   stubSequenceWriteReturnsTrue
     * @tc.desc   A write into a live sequence reports success.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write the request payload.
     *                   2. Read the returned boolean.
     *                   3. Write a second value.
     * @tc.expected      Both writes return true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceWriteReturnsTrue', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString(REQUEST_PAYLOAD)).assertTrue();
      expect(sequence.writeString(REPLY_PAYLOAD)).assertTrue();
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values[0]).assertEqual(REQUEST_PAYLOAD);
      expect(sequence.values[1]).assertEqual(REPLY_PAYLOAD);
      expect(sequence.reclaimed).assertFalse();
    });

    /**
     * @tc.name   stubSequenceWriteIncrementsSizeAndCount
     * @tc.desc   Each accepted write increments size and write count together.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write four values one by one.
     *                   2. Compare size and write count after each write.
     *                   3. Confirm they stay equal.
     * @tc.expected      Size always equals the number of accepted writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceWriteIncrementsSizeAndCount', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 4; index++) {
        sequence.writeString('value-' + String(index));
        expect(sequence.size()).assertEqual(index + 1);
        expect(sequence.writeCount).assertEqual(index + 1);
      }
      expect(sequence.size()).assertEqual(4);
      expect(sequence.writeCount).assertEqual(4);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('value-0|value-1|value-2|value-3#0');
    });

    /**
     * @tc.name   stubSequenceWriteAppendsInOrder
     * @tc.desc   Values are stored in the exact order they were written.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write three distinct values.
     *                   2. Read the values array.
     *                   3. Compare with the expected order.
     * @tc.expected      The stored order matches the write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceWriteAppendsInOrder', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('first');
      sequence.writeString('second');
      sequence.writeString('third');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.values[0]).assertEqual('first');
      expect(sequence.values[1]).assertEqual('second');
      expect(sequence.values[2]).assertEqual('third');
      expect(sameStringArray(sequence.values, ['first', 'second', 'third'])).assertTrue();
      expect(joined(sequence.values, ' ')).assertEqual('first second third');
    });

    /**
     * @tc.name   stubSequenceWriteEmptyString
     * @tc.desc   An empty string is a valid stored value.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write an empty string.
     *                   2. Read the size and trace.
     *                   3. Read the value back.
     * @tc.expected      The empty string occupies a slot and reads back empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceWriteEmptyString', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString('')).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.values[0]).assertEqual('');
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceReadReturnsFirstValue
     * @tc.desc   The first read returns the first written value.
     * @tc.precondition  A sequence with three values.
     * @tc.steps         1. Write three values.
     *                   2. Read once.
     *                   3. Compare with the first value.
     * @tc.expected      The first value is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceReadReturnsFirstValue', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('beta');
      sequence.writeString('gamma');
      const value = sequence.readString();
      expect(value).assertEqual('alpha');
      expect(value).assertEqual(sequence.values[0]);
      expect(value === 'beta').assertFalse();
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.cursor).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceReadAdvancesCursor
     * @tc.desc   Every successful read advances the cursor by one.
     * @tc.precondition  A sequence with three values.
     * @tc.steps         1. Read three times.
     *                   2. Record the cursor after each read.
     *                   3. Compare with the read index plus one.
     * @tc.expected      The cursor advances one step per read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceReadAdvancesCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      sequence.writeString('c');
      for (let index = 0; index < 3; index++) {
        sequence.readString();
        expect(sequence.cursor).assertEqual(index + 1);
      }
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.cursor).assertEqual(sequence.readCount);
      expect(sequence.size()).assertEqual(3);
    });

    /**
     * @tc.name   stubSequenceReadIncrementsReadCount
     * @tc.desc   The read counter tracks only successful reads.
     * @tc.precondition  A sequence with two values.
     * @tc.steps         1. Read twice.
     *                   2. Attempt two extra reads.
     *                   3. Compare the read counter with two.
     * @tc.expected      The read counter stays at two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReadIncrementsReadCount', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      sequence.readString();
      sequence.readString();
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
    });

    /**
     * @tc.name   stubSequenceReadAllValuesInOrder
     * @tc.desc   Draining a sequence returns every value in write order.
     * @tc.precondition  A sequence with four values.
     * @tc.steps         1. Write four values.
     *                   2. Read them all into a list.
     *                   3. Compare the list with the originals.
     * @tc.expected      The read order equals the write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReadAllValuesInOrder', 0, () => {
      const sequence = MessageSequenceModel.create();
      const originals: string[] = ['w', 'x', 'y', 'z'];
      for (let index = 0; index < originals.length; index++) {
        sequence.writeString(originals[index]);
      }
      const read: string[] = [];
      for (let index = 0; index < originals.length; index++) {
        read.push(sequence.readString());
      }
      expect(read.length).assertEqual(4);
      expect(sameStringArray(read, originals)).assertTrue();
      expect(joined(read, '')).assertEqual('wxyz');
      expect(uniqueStrings(read).length).assertEqual(4);
      expect(sequence.cursor).assertEqual(4);
      expect(sequence.readCount).assertEqual(4);
    });

    /**
     * @tc.name   stubSequenceReadPastEndReturnsEmpty
     * @tc.desc   Reading a drained sequence returns an empty string.
     * @tc.precondition  A sequence with one value already read.
     * @tc.steps         1. Write and read one value.
     *                   2. Read again.
     *                   3. Compare the second read with empty.
     * @tc.expected      The drained read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReadPastEndReturnsEmpty', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      expect(sequence.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.values[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name   stubSequenceReadPastEndKeepsValues
     * @tc.desc   Over-reading never removes or alters stored values.
     * @tc.precondition  A sequence with two values fully read.
     * @tc.steps         1. Drain the sequence.
     *                   2. Over-read twice.
     *                   3. Rewind and read the values again.
     * @tc.expected      The values are intact after over-reading.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReadPastEndKeepsValues', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('keep-1');
      sequence.writeString('keep-2');
      sequence.readString();
      sequence.readString();
      sequence.readString();
      sequence.readString();
      expect(sequence.size()).assertEqual(2);
      sequence.rewind();
      expect(sequence.readString()).assertEqual('keep-1');
      expect(sequence.readString()).assertEqual('keep-2');
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
    });

    /**
     * @tc.name   stubSequenceReadEmptySequenceReturnsEmpty
     * @tc.desc   Reading an unwritten sequence returns empty without counting.
     * @tc.precondition  A new empty sequence.
     * @tc.steps         1. Read from the empty sequence.
     *                   2. Read a second time.
     *                   3. Inspect the counters.
     * @tc.expected      The reads are empty and the read counter stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceReadEmptySequenceReturnsEmpty', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.size()).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.reclaimed).assertFalse();
      expect(sequence.trace()).assertEqual('#0');
    });

    /**
     * @tc.name   stubSequenceRewindResetsCursor
     * @tc.desc   rewind sets the cursor back to zero.
     * @tc.precondition  A sequence with three values read twice.
     * @tc.steps         1. Write three values and read two.
     *                   2. Rewind the sequence.
     *                   3. Read the cursor.
     * @tc.expected      The cursor is zero after rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceRewindResetsCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      sequence.writeString('c');
      sequence.readString();
      sequence.readString();
      expect(sequence.cursor).assertEqual(2);
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.reclaimed).assertFalse();
    });

    /**
     * @tc.name   stubSequenceRewindKeepsValues
     * @tc.desc   rewind leaves the stored values untouched.
     * @tc.precondition  A drained sequence.
     * @tc.steps         1. Write two values and drain them.
     *                   2. Rewind.
     *                   3. Compare the stored values with the originals.
     * @tc.expected      The values survive the rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceRewindKeepsValues', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.writeString(REPLY_PAYLOAD);
      sequence.readString();
      sequence.readString();
      sequence.rewind();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.values[0]).assertEqual(REQUEST_PAYLOAD);
      expect(sequence.values[1]).assertEqual(REPLY_PAYLOAD);
      expect(sequence.trace()).assertEqual('hello world|hello rpc#0');
      expect(sequence.readCount).assertEqual(2);
    });

    /**
     * @tc.name   stubSequenceRewindEnablesReRead
     * @tc.desc   After a rewind the first value can be read again.
     * @tc.precondition  A drained sequence.
     * @tc.steps         1. Write two values and read both.
     *                   2. Rewind and read the first value.
     *                   3. Compare with the stored value.
     * @tc.expected      The first value is returned again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceRewindEnablesReRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('repeat-me');
      sequence.writeString('second');
      expect(sequence.readString()).assertEqual('repeat-me');
      expect(sequence.readString()).assertEqual('second');
      sequence.rewind();
      expect(sequence.readString()).assertEqual('repeat-me');
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readString()).assertEqual('second');
      expect(sequence.readCount).assertEqual(4);
    });

    /**
     * @tc.name   stubSequenceRewindTwiceIdempotent
     * @tc.desc   Two consecutive rewinds leave the cursor at zero.
     * @tc.precondition  A sequence read once.
     * @tc.steps         1. Write one value and read it.
     *                   2. Rewind twice.
     *                   3. Read the cursor.
     * @tc.expected      The cursor remains zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceRewindTwiceIdempotent', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('single');
      sequence.readString();
      sequence.rewind();
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.values[0]).assertEqual('single');
      expect(sequence.readString()).assertEqual('single');
      expect(sequence.cursor).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceTraceEmpty
     * @tc.desc   An empty sequence traces as a bare cursor marker.
     * @tc.precondition  A new empty sequence.
     * @tc.steps         1. Read the trace.
     *                   2. Compare with '#0'.
     *                   3. Count the separator characters.
     * @tc.expected      The trace is '#0'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceTraceEmpty', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.trace().length).assertEqual(2);
      expect(sequence.trace().indexOf('#')).assertEqual(0);
      expect(sequence.trace().split('|').length).assertEqual(1);
      expect(countOf(sequence.trace().split('|'), '')).assertEqual(0);
      expect(textFingerprint(sequence.trace())).assertEqual(textFingerprint('#0'));
    });

    /**
     * @tc.name   stubSequenceTraceWithValues
     * @tc.desc   The trace joins values with '|' before the cursor marker.
     * @tc.precondition  A sequence with three values.
     * @tc.steps         1. Write three values.
     *                   2. Read the trace.
     *                   3. Split and count.
     * @tc.expected      The trace holds three value segments and a zero cursor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceTraceWithValues', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      sequence.writeString('c');
      const trace = sequence.trace();
      expect(trace).assertEqual('a|b|c#0');
      expect(trace.split('|').length).assertEqual(3);
      expect(trace.endsWith('#0')).assertTrue();
      expect(trace.indexOf('#')).assertEqual(5);
      expect(trace.length).assertEqual(7);
      expect(textFingerprint(trace)).assertLarger(0);
    });

    /**
     * @tc.name   stubSequenceTraceAfterRead
     * @tc.desc   Reading updates only the cursor segment of the trace.
     * @tc.precondition  A sequence with two values read once.
     * @tc.steps         1. Write two values and read one.
     *                   2. Read the trace.
     *                   3. Compare the value segment with the original.
     * @tc.expected      The value segment is unchanged and the cursor is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceTraceAfterRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('x');
      sequence.writeString('y');
      const before = sequence.trace();
      sequence.readString();
      const after = sequence.trace();
      expect(before).assertEqual('x|y#0');
      expect(after).assertEqual('x|y#1');
      expect(after === before).assertFalse();
      expect(after.split('#')[0]).assertEqual(before.split('#')[0]);
      expect(after.endsWith('#1')).assertTrue();
      expect(sequence.readCount).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceTraceAfterRewind
     * @tc.desc   A rewind restores the cursor segment of the trace.
     * @tc.precondition  A sequence with one value read twice.
     * @tc.steps         1. Write a value and over-read.
     *                   2. Rewind.
     *                   3. Compare the trace with the initial trace.
     * @tc.expected      The trace matches the initial state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceTraceAfterRewind', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REPLY_PAYLOAD);
      const initial = sequence.trace();
      sequence.readString();
      sequence.readString();
      expect(sequence.trace()).assertEqual('hello rpc#1');
      sequence.rewind();
      expect(sequence.trace()).assertEqual(initial);
      expect(sequence.trace()).assertEqual('hello rpc#0');
      expect(sequence.readCount).assertEqual(1);
      expect(textFingerprint(sequence.trace())).assertEqual(textFingerprint('hello rpc#0'));
    });

    /**
     * @tc.name   stubSequenceReclaimSetsFlag
     * @tc.desc   reclaim marks the sequence as reclaimed.
     * @tc.precondition  A new sequence.
     * @tc.steps         1. Confirm the flag is false.
     *                   2. Reclaim the sequence.
     *                   3. Re-read the flag.
     * @tc.expected      The flag flips to true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceReclaimSetsFlag', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.reclaimed).assertFalse();
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.reclaimed).assertEqual(true);
      expect(sequence.size()).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
    });

    /**
     * @tc.name   stubSequenceReclaimResetsCursor
     * @tc.desc   reclaim returns the cursor to zero.
     * @tc.precondition  A sequence read once before reclaim.
     * @tc.steps         1. Write two values and read one.
     *                   2. Reclaim the sequence.
     *                   3. Read the cursor.
     * @tc.expected      The cursor is zero after reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReclaimResetsCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      sequence.readString();
      expect(sequence.cursor).assertEqual(1);
      sequence.reclaim();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.values[0]).assertEqual('a');
    });

    /**
     * @tc.name   stubSequenceReclaimBlocksWrite
     * @tc.desc   A reclaimed sequence rejects every later write.
     * @tc.precondition  A reclaimed sequence.
     * @tc.steps         1. Write two values then reclaim.
     *                   2. Attempt two more writes.
     *                   3. Inspect the size and write counter.
     * @tc.expected      Both later writes fail and the counters stay put.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReclaimBlocksWrite', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('kept-a');
      sequence.writeString('kept-b');
      sequence.reclaim();
      expect(sequence.writeString('rejected')).assertFalse();
      expect(sequence.writeString('also rejected')).assertFalse();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.values[1]).assertEqual('kept-b');
      expect(sequence.trace()).assertEqual('kept-a|kept-b#0');
    });

    /**
     * @tc.name   stubSequenceReclaimBlocksRead
     * @tc.desc   A reclaimed sequence returns empty strings on read.
     * @tc.precondition  A reclaimed sequence holding values.
     * @tc.steps         1. Write two values then reclaim.
     *                   2. Read twice.
     *                   3. Inspect the read counter and cursor.
     * @tc.expected      Both reads are empty and nothing is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReclaimBlocksRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('dead-1');
      sequence.writeString('dead-2');
      sequence.reclaim();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertTrue();
    });

    /**
     * @tc.name   stubSequenceReclaimKeepsSizeAndValues
     * @tc.desc   reclaim preserves the stored size and values.
     * @tc.precondition  A sequence with three values.
     * @tc.steps         1. Write three values.
     *                   2. Reclaim the sequence.
     *                   3. Compare the values array.
     * @tc.expected      All three values remain in place.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReclaimKeepsSizeAndValues', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('p');
      sequence.writeString('q');
      sequence.writeString('r');
      sequence.reclaim();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.values.length).assertEqual(3);
      expect(sameStringArray(sequence.values, ['p', 'q', 'r'])).assertTrue();
      expect(joined(sequence.values, ',')).assertEqual('p,q,r');
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(0);
    });

    /**
     * @tc.name   stubSequenceReclaimIsIdempotent
     * @tc.desc   Reclaiming twice keeps the sequence in one final state.
     * @tc.precondition  A sequence with one value.
     * @tc.steps         1. Reclaim the sequence twice.
     *                   2. Read the flags and counters.
     *                   3. Attempt a write and a read.
     * @tc.expected      The double reclaim behaves like a single one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReclaimIsIdempotent', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('once');
      sequence.reclaim();
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeString('nope')).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.writeCount).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceTraceAfterReclaim
     * @tc.desc   The trace after reclaim shows values and a zero cursor.
     * @tc.precondition  A reclaimed sequence with two values.
     * @tc.steps         1. Write two values, read one and reclaim.
     *                   2. Read the trace.
     *                   3. Compare with the untouched trace.
     * @tc.expected      The trace matches the initial cursor state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceTraceAfterReclaim', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('t1');
      sequence.writeString('t2');
      const initial = sequence.trace();
      sequence.readString();
      sequence.reclaim();
      expect(sequence.trace()).assertEqual(initial);
      expect(sequence.trace()).assertEqual('t1|t2#0');
      expect(sequence.trace().split('|').length).assertEqual(2);
      expect(sequence.trace().endsWith('#0')).assertTrue();
      expect(textFingerprint(sequence.trace())).assertEqual(textFingerprint(initial));
    });

    /**
     * @tc.name   stubSequenceLongTextRoundTrip
     * @tc.desc   A 150-character value survives a write and read cycle.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Build a long text value.
     *                   2. Write it and read it back.
     *                   3. Compare length and fingerprints.
     * @tc.expected      The full text round-trips unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceLongTextRoundTrip', 0, () => {
      const sequence = MessageSequenceModel.create();
      let text = '';
      for (let index = 0; index < 15; index++) {
        text = text + '0123456789';
      }
      sequence.writeString(text);
      const read = sequence.readString();
      expect(text.length).assertEqual(150);
      expect(read.length).assertEqual(150);
      expect(read).assertEqual(text);
      expect(textFingerprint(read)).assertEqual(textFingerprint(text));
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceWhitespaceRoundTrip
     * @tc.desc   Whitespace inside a value is preserved through the cycle.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write a tab and space padded value.
     *                   2. Read it back.
     *                   3. Compare against the trimmed form.
     * @tc.expected      The whitespace is preserved exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceWhitespaceRoundTrip', 0, () => {
      const sequence = MessageSequenceModel.create();
      const text = '  padded value  ';
      sequence.writeString(text);
      const read = sequence.readString();
      expect(read).assertEqual(text);
      expect(read.length).assertEqual(16);
      expect(read.startsWith('  ')).assertTrue();
      expect(read.endsWith('  ')).assertTrue();
      expect(read.trim()).assertEqual('padded value');
      expect(read === read.trim()).assertFalse();
      expect(sequence.trace()).assertEqual('  padded value  #1');
    });

    /**
     * @tc.name   stubSequencePayloadConstantsRoundTrip
     * @tc.desc   The shared request and reply literals round-trip through a sequence.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write both payload constants.
     *                   2. Read both back.
     *                   3. Compare with the constants.
     * @tc.expected      Both payloads round-trip exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequencePayloadConstantsRoundTrip', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REQUEST_PAYLOAD);
      sequence.writeString(REPLY_PAYLOAD);
      expect(sequence.readString()).assertEqual(REQUEST_PAYLOAD);
      expect(sequence.readString()).assertEqual(REPLY_PAYLOAD);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.trace()).assertEqual('hello world|hello rpc#2');
    });

    /**
     * @tc.name   stubSequenceRepeatedValuesStored
     * @tc.desc   Duplicate values are stored once per write.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write the same value three times.
     *                   2. Read the three values.
     *                   3. Count the duplicates.
     * @tc.expected      Three copies are stored and returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceRepeatedValuesStored', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('dup');
      sequence.writeString('dup');
      sequence.writeString('dup');
      expect(sequence.size()).assertEqual(3);
      expect(countOf(sequence.values, 'dup')).assertEqual(3);
      expect(uniqueStrings(sequence.values).length).assertEqual(1);
      const read: string[] = [];
      for (let index = 0; index < 3; index++) {
        read.push(sequence.readString());
      }
      expect(countOf(read, 'dup')).assertEqual(3);
      expect(joined(read, '|')).assertEqual('dup|dup|dup');
      expect(sequence.trace()).assertEqual('dup|dup|dup#3');
    });

    /**
     * @tc.name   stubSequenceIndependentInstancesAfterWrite
     * @tc.desc   Writing into one sequence never changes another.
     * @tc.precondition  Two empty sequences.
     * @tc.steps         1. Write three values into the first.
     *                   2. Write one different value into the second.
     *                   3. Compare sizes, traces and counters.
     * @tc.expected      Each sequence holds only its own values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceIndependentInstancesAfterWrite', 0, () => {
      const left = MessageSequenceModel.create();
      const right = MessageSequenceModel.create();
      left.writeString('l1');
      left.writeString('l2');
      left.writeString('l3');
      right.writeString('r1');
      expect(left.size()).assertEqual(3);
      expect(right.size()).assertEqual(1);
      expect(left.trace()).assertEqual('l1|l2|l3#0');
      expect(right.trace()).assertEqual('r1#0');
      expect(left.writeCount).assertEqual(3);
      expect(right.writeCount).assertEqual(1);
      expect(left.values[0] === right.values[0]).assertFalse();
    });

    /**
     * @tc.name   stubSequenceInterleavedWriteRead
     * @tc.desc   Writes and reads interleave without corrupting the order.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write one value and read it.
     *                   2. Write a second value and read it.
     *                   3. Compare the read order.
     * @tc.expected      Values return in write order across the interleaving.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceInterleavedWriteRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      const read: string[] = [];
      sequence.writeString('one');
      read.push(sequence.readString());
      sequence.writeString('two');
      read.push(sequence.readString());
      sequence.writeString('three');
      read.push(sequence.readString());
      expect(read.length).assertEqual(3);
      expect(sameStringArray(read, ['one', 'two', 'three'])).assertTrue();
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.trace()).assertEqual('one|two|three#3');
    });

    /**
     * @tc.name   stubSequenceWriteRewindWriteOrder
     * @tc.desc   A write after a rewind appends to the existing values.
     * @tc.precondition  A sequence with two values already read.
     * @tc.steps         1. Write two values and read them.
     *                   2. Rewind and write a third value.
     *                   3. Read all three values.
     * @tc.expected      The new value is appended at the end.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceWriteRewindWriteOrder', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('old-1');
      sequence.writeString('old-2');
      sequence.readString();
      sequence.readString();
      sequence.rewind();
      sequence.writeString('new-3');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.values[1]).assertEqual('old-2');
      expect(sequence.values[2]).assertEqual('new-3');
      expect(sequence.readString()).assertEqual('old-1');
      expect(sequence.readString()).assertEqual('old-2');
      expect(sequence.readString()).assertEqual('new-3');
      expect(sequence.writeCount).assertEqual(3);
    });

    /**
     * @tc.name   stubSequenceInsideStubRequest
     * @tc.desc   The stub consumes the request string from the data sequence.
     * @tc.precondition  A stub and a data sequence with one value.
     * @tc.steps         1. Write the payload into the data sequence.
     *                   2. Invoke the stub with code 1.
     *                   3. Inspect the cursor and record text.
     * @tc.expected      The stub reads the first string and records it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceInsideStubRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(data.values.length).assertEqual(1);
      expect(data.writeCount).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceInsideStubReply
     * @tc.desc   The stub writes exactly one reply string into the reply sequence.
     * @tc.precondition  A stub and empty sequences.
     * @tc.steps         1. Invoke the stub with code 1.
     *                   2. Inspect the reply sequence.
     *                   3. Read the reply value.
     * @tc.expected      The reply sequence holds the production reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceInsideStubReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readCount).assertEqual(1);
      expect(reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceStubReadsFirstStringOnly
     * @tc.desc   The stub consumes one string even when the data holds several.
     * @tc.precondition  A data sequence with three values.
     * @tc.steps         1. Write three values into the data sequence.
     *                   2. Invoke the stub with code 1.
     *                   3. Inspect the cursor and record.
     * @tc.expected      Only the first value is consumed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubSequenceStubReadsFirstStringOnly', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('first');
      data.writeString('second');
      data.writeString('third');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('first');
      expect(data.size()).assertEqual(3);
      expect(data.values[2]).assertEqual('third');
      expect(reply.size()).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceStubWritesSingleReplyValue
     * @tc.desc   Repeated stub replies each use a fresh single-value sequence.
     * @tc.precondition  A stub and two reply sequences.
     * @tc.steps         1. Invoke the stub twice with separate sequences.
     *                   2. Inspect both reply sequences.
     *                   3. Compare the read values.
     * @tc.expected      Both replies contain exactly one value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceStubWritesSingleReplyValue', 0, () => {
      const stub = new StubRemoteObjectModel();
      const firstReply = MessageSequenceModel.create();
      const secondReply = MessageSequenceModel.create();
      const firstData = MessageSequenceModel.create();
      const secondData = MessageSequenceModel.create();
      firstData.writeString('first-request');
      secondData.writeString('second-request');
      stub.onRemoteMessageRequest(REQUEST_CODE, firstData, firstReply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, secondData, secondReply, new MessageOptionModel());
      expect(firstReply.size()).assertEqual(1);
      expect(secondReply.size()).assertEqual(1);
      expect(firstReply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(secondReply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].text).assertEqual('first-request');
      expect(stub.requests[1].text).assertEqual('second-request');
      expect(firstReply === secondReply).assertFalse();
    });

    /**
     * @tc.name   stubSequenceRejectedCodeConsumesNothing
     * @tc.desc   A rejected code leaves the data and reply sequences untouched.
     * @tc.precondition  A stub and populated sequences.
     * @tc.steps         1. Write a request value and pre-fill the reply.
     *                   2. Invoke the stub with code 2.
     *                   3. Inspect both sequences.
     * @tc.expected      The data cursor stays zero and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceRejectedCodeConsumesNothing', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('unread');
      reply.writeString('pre-filled');
      const handled = stub.onRemoteMessageRequest(2, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(data.values[0]).assertEqual('unread');
      expect(reply.size()).assertEqual(1);
      expect(reply.values[0]).assertEqual('pre-filled');
      expect(reply.cursor).assertEqual(0);
      expect(stub.requests[0].text).assertEqual('');
    });

    /**
     * @tc.name   stubSequenceCursorGrowthLoop
     * @tc.desc   The cursor equals the read index after each read in a loop.
     * @tc.precondition  A sequence with five values.
     * @tc.steps         1. Write five values.
     *                   2. Read in a loop and assert the cursor.
     *                   3. Compare the final cursor with the size.
     * @tc.expected      The cursor tracks the loop index plus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceCursorGrowthLoop', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 5; index++) {
        sequence.writeString('g' + String(index));
      }
      for (let index = 0; index < 5; index++) {
        expect(sequence.readString()).assertEqual('g' + String(index));
        expect(sequence.cursor).assertEqual(index + 1);
      }
      expect(sequence.cursor).assertEqual(5);
      expect(sequence.cursor).assertEqual(sequence.size());
      expect(sequence.readCount).assertEqual(5);
      expect(sequence.trace()).assertEqual('g0|g1|g2|g3|g4#5');
    });

    /**
     * @tc.name   stubSequenceMultipleRewindsReadCount
     * @tc.desc   Each re-read after a rewind increments the read counter.
     * @tc.precondition  A sequence with one value.
     * @tc.steps         1. Write one value.
     *                   2. Read, rewind and read three times.
     *                   3. Compare the read counter with three.
     * @tc.expected      The read counter equals the number of successful reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceMultipleRewindsReadCount', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('again');
      for (let index = 0; index < 3; index++) {
        expect(sequence.readString()).assertEqual('again');
        expect(sequence.readCount).assertEqual(index + 1);
        sequence.rewind();
        expect(sequence.cursor).assertEqual(0);
      }
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.trace()).assertEqual('again#0');
    });

    /**
     * @tc.name   stubSequenceTraceMarkerSplit
     * @tc.desc   Splitting the trace on '#' separates values from the cursor.
     * @tc.precondition  A sequence with two values read once.
     * @tc.steps         1. Write two values and read one.
     *                   2. Split the trace on '#'.
     *                   3. Compare both segments.
     * @tc.expected      The value segment and cursor segment match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceTraceMarkerSplit', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('left');
      sequence.writeString('right');
      sequence.readString();
      const parts = sequence.trace().split('#');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual('left|right');
      expect(parts[1]).assertEqual('1');
      expect(parts[0].split('|').length).assertEqual(2);
      expect(sequence.trace().indexOf('#')).assertEqual(10);
      expect(sequence.trace().length).assertEqual(12);
    });

    /**
     * @tc.name   stubSequenceEmptyWriteThenRead
     * @tc.desc   An empty written value is distinct from an exhausted read.
     * @tc.precondition  A sequence with one empty value.
     * @tc.steps         1. Write an empty value and read it.
     *                   2. Read again past the end.
     *                   3. Compare both results and counters.
     * @tc.expected      The first read counts while the second does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubSequenceEmptyWriteThenRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('');
      const first = sequence.readString();
      const second = sequence.readString();
      expect(first).assertEqual('');
      expect(second).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.values[0]).assertEqual('');
      expect(sequence.trace()).assertEqual('#1');
    });

    /**
     * @tc.name   stubSequenceRewindInsideStubReply
     * @tc.desc   A reply sequence can be rewritten after a rewind.
     * @tc.precondition  A reply sequence read once by the client.
     * @tc.steps         1. Write a reply and read it.
     *                   2. Rewind and write another value.
     *                   3. Read both values.
     * @tc.expected      The rewound sequence returns both values in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceRewindInsideStubReply', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString(REPLY_PAYLOAD);
      expect(sequence.readString()).assertEqual(REPLY_PAYLOAD);
      sequence.rewind();
      sequence.writeString('second reply');
      expect(sequence.size()).assertEqual(2);
      expect(sequence.readString()).assertEqual(REPLY_PAYLOAD);
      expect(sequence.readString()).assertEqual('second reply');
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.trace()).assertEqual('hello rpc|second reply#2');
    });

    /**
     * @tc.name   stubSequenceClientSendsUseFreshSequences
     * @tc.desc   Two client sends produce independent replies with full text.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send code 1 twice.
     *                   2. Compare both results.
     *                   3. Confirm two ledger entries exist.
     * @tc.expected      Both replies equal the production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceClientSendsUseFreshSequences', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const first = client.send(REQUEST_CODE, 'payload one');
      const second = client.send(REQUEST_CODE, 'payload two');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.replyText).assertEqual(second.replyText);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      expect(stub.requests[0].text).assertEqual('payload one');
      expect(stub.requests[1].text).assertEqual('payload two');
    });

    /**
     * @tc.name   stubSequenceManyValuesJoin
     * @tc.desc   Ten stored values join and split consistently.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write ten indexed values.
     *                   2. Join the values with a comma.
     *                   3. Split the joined text back.
     * @tc.expected      The joined form has ten ordered segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceManyValuesJoin', 0, () => {
      const sequence = MessageSequenceModel.create();
      for (let index = 0; index < 10; index++) {
        sequence.writeString('v' + String(index));
      }
      const text = joined(sequence.values, ',');
      const parts = text.split(',');
      expect(sequence.size()).assertEqual(10);
      expect(parts.length).assertEqual(10);
      expect(parts[0]).assertEqual('v0');
      expect(parts[9]).assertEqual('v9');
      expect(text.startsWith('v0,')).assertTrue();
      expect(text.endsWith(',v9')).assertTrue();
      expect(countOf(parts, 'v5')).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceUniqueValueCount
     * @tc.desc   Deduplication collapses a mixed value list correctly.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Write a mixed list with repeats.
     *                   2. Deduplicate the values.
     *                   3. Count the distinct values.
     * @tc.expected      Four distinct values remain from eight writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceUniqueValueCount', 0, () => {
      const sequence = MessageSequenceModel.create();
      const values: string[] = ['a', 'b', 'a', 'c', 'b', 'a', 'd', 'd'];
      for (let index = 0; index < values.length; index++) {
        sequence.writeString(values[index]);
      }
      expect(sequence.size()).assertEqual(8);
      expect(uniqueStrings(sequence.values).length).assertEqual(4);
      expect(countOf(sequence.values, 'a')).assertEqual(3);
      expect(countOf(sequence.values, 'd')).assertEqual(2);
      expect(sameStringArray(uniqueStrings(sequence.values), ['a', 'b', 'c', 'd'])).assertTrue();
      expect(sequence.writeCount).assertEqual(8);
    });

    /**
     * @tc.name   stubSequenceSizeUnaffectedByReads
     * @tc.desc   Consuming values never shrinks the reported size.
     * @tc.precondition  A sequence with three values.
     * @tc.steps         1. Write three values.
     *                   2. Read all three and over-read once.
     *                   3. Compare the size with three.
     * @tc.expected      The size remains three after draining.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceSizeUnaffectedByReads', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('s1');
      sequence.writeString('s2');
      sequence.writeString('s3');
      sequence.readString();
      sequence.readString();
      sequence.readString();
      sequence.readString();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.values.length).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.trace()).assertEqual('s1|s2|s3#3');
    });

    /**
     * @tc.name   stubSequenceInitialTraceConstant
     * @tc.desc   Every new sequence begins with the same trace.
     * @tc.precondition  Three new sequences.
     * @tc.steps         1. Build three sequences.
     *                   2. Read their traces.
     *                   3. Deduplicate the traces.
     * @tc.expected      All three traces equal '#0'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceInitialTraceConstant', 0, () => {
      const traces: string[] = [
        MessageSequenceModel.create().trace(),
        MessageSequenceModel.create().trace(),
        MessageSequenceModel.create().trace()
      ];
      expect(traces.length).assertEqual(3);
      expect(uniqueStrings(traces).length).assertEqual(1);
      expect(countOf(traces, '#0')).assertEqual(3);
      expect(traces[0]).assertEqual('#0');
      expect(traces[2]).assertEqual(traces[0]);
      expect(textFingerprint(traces[0])).assertEqual(textFingerprint('#0'));
    });

    /**
     * @tc.name   stubSequenceDataRewindInsideStub
     * @tc.desc   A data sequence can be rewound and replayed to the stub twice.
     * @tc.precondition  A stub and a data sequence with one value.
     * @tc.steps         1. Invoke the stub once with the data sequence.
     *                   2. Rewind the data and invoke again.
     *                   3. Compare both ledger entries.
     * @tc.expected      The same request text is recorded twice.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubSequenceDataRewindInsideStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const firstReply = MessageSequenceModel.create();
      const secondReply = MessageSequenceModel.create();
      data.writeString('replayable');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, firstReply, new MessageOptionModel());
      data.rewind();
      stub.onRemoteMessageRequest(REQUEST_CODE, data, secondReply, new MessageOptionModel());
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('replayable');
      expect(stub.requests[1].text).assertEqual('replayable');
      expect(data.readCount).assertEqual(2);
      expect(data.cursor).assertEqual(1);
      expect(firstReply.values[0]).assertEqual(secondReply.values[0]);
    });

    /**
     * @tc.name   stubSequenceReclaimAfterStubRun
     * @tc.desc   Reclaiming after a stub run blocks any further sequence use.
     * @tc.precondition  A stub that consumed one sequence.
     * @tc.steps         1. Run the stub with one value.
     *                   2. Reclaim both sequences.
     *                   3. Confirm reads and writes fail.
     * @tc.expected      Both reclaimed sequences refuse further operations.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceReclaimAfterStubRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      data.reclaim();
      reply.reclaim();
      expect(data.reclaimed).assertTrue();
      expect(reply.reclaimed).assertTrue();
      expect(data.readString()).assertEqual('');
      expect(reply.readString()).assertEqual('');
      expect(reply.writeString('late')).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubSequenceKilledStubConsumesNothing
     * @tc.desc   A killed stub leaves the data sequence unread.
     * @tc.precondition  A killed stub and a populated data sequence.
     * @tc.steps         1. Kill the stub.
     *                   2. Invoke the handler with code 1.
     *                   3. Inspect the data cursor and reply size.
     * @tc.expected      The data is not consumed and no reply is written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceKilledStubConsumesNothing', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.kill();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(data.size()).assertEqual(1);
      expect(reply.size()).assertEqual(0);
      expect(reply.writeCount).assertEqual(0);
      expect(stub.requests[0].text).assertEqual('');
    });

    /**
     * @tc.name   stubSequenceTwoStubRunsSeparateSequences
     * @tc.desc   Two stub runs on separate sequence pairs do not interfere.
     * @tc.precondition  A stub and two data/reply pairs.
     * @tc.steps         1. Run the stub with the first pair.
     *                   2. Run the stub with the second pair.
     *                   3. Compare the four sequences.
     * @tc.expected      Each pair holds only its own request and reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubSequenceTwoStubRunsSeparateSequences', 0, () => {
      const stub = new StubRemoteObjectModel();
      const firstData = MessageSequenceModel.create();
      const firstReply = MessageSequenceModel.create();
      const secondData = MessageSequenceModel.create();
      const secondReply = MessageSequenceModel.create();
      firstData.writeString('alpha');
      secondData.writeString('beta');
      stub.onRemoteMessageRequest(REQUEST_CODE, firstData, firstReply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, secondData, secondReply, new MessageOptionModel());
      expect(firstData.values[0]).assertEqual('alpha');
      expect(secondData.values[0]).assertEqual('beta');
      expect(firstReply.size()).assertEqual(1);
      expect(secondReply.size()).assertEqual(1);
      expect(firstData.cursor).assertEqual(1);
      expect(secondData.cursor).assertEqual(1);
      expect(stub.requests[0].text === stub.requests[1].text).assertFalse();
      expect(firstReply.readString()).assertEqual('hello rpc');
    });

    /**
     * @tc.name   stubSequenceTraceFingerprintGrowth
     * @tc.desc   Each accepted write changes the trace fingerprint.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Fingerprint the initial trace.
     *                   2. Write a value and fingerprint again.
     *                   3. Write another value and compare.
     * @tc.expected      The three fingerprints are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceTraceFingerprintGrowth', 0, () => {
      const sequence = MessageSequenceModel.create();
      const empty = textFingerprint(sequence.trace());
      sequence.writeString('growth');
      const one = textFingerprint(sequence.trace());
      sequence.writeString('second');
      const two = textFingerprint(sequence.trace());
      expect(empty).assertEqual(textFingerprint('#0'));
      expect(empty === one).assertFalse();
      expect(one === two).assertFalse();
      expect(empty === two).assertFalse();
      expect(two).assertLarger(-1);
      expect(sequence.trace()).assertEqual('growth|second#0');
    });

    /**
     * @tc.name   stubSequenceValuesLengthAfterOverRead
     * @tc.desc   Over-reading never appends placeholder values.
     * @tc.precondition  A sequence with two values.
     * @tc.steps         1. Write two values.
     *                   2. Over-read five times.
     *                   3. Compare the values array length with two.
     * @tc.expected      The stored values array stays at length two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceValuesLengthAfterOverRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('only-1');
      sequence.writeString('only-2');
      for (let index = 0; index < 5; index++) {
        sequence.readString();
      }
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.values[0]).assertEqual('only-1');
      expect(sequence.values[1]).assertEqual('only-2');
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.trace()).assertEqual('only-1|only-2#2');
    });

    /**
     * @tc.name   stubSequenceWriteCountZeroBeforeWrite
     * @tc.desc   The write counter stays zero until the first accepted write.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Read the write counter before writing.
     *                   2. Attempt a write.
     *                   3. Re-read the write counter.
     * @tc.expected      The counter moves from zero to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSequenceWriteCountZeroBeforeWrite', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.size()).assertEqual(0);
      sequence.writeString('first');
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.trace()).assertEqual('first#0');
    });

    /**
     * @tc.name   stubSequenceReclaimThenRewindStaysBlocked
     * @tc.desc   A rewind cannot revive a reclaimed sequence.
     * @tc.precondition  A reclaimed sequence with one value.
     * @tc.steps         1. Write a value and reclaim the sequence.
     *                   2. Rewind it.
     *                   3. Attempt a read and a write.
     * @tc.expected      Both operations still fail after the rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubSequenceReclaimThenRewindStaysBlocked', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('frozen');
      sequence.reclaim();
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.writeString('still blocked')).assertFalse();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.readCount).assertEqual(0);
    });

    /**
     * @tc.name   stubSequenceDataCursorAfterMultipleReads
     * @tc.desc   The data cursor equals the read count until a rewind.
     * @tc.precondition  A sequence with four values.
     * @tc.steps         1. Write four values.
     *                   2. Read three values.
     *                   3. Compare the cursor with the read count.
     * @tc.expected      The cursor and read count both equal three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSequenceDataCursorAfterMultipleReads', 0, () => {
      const sequence = MessageSequenceModel.create();
      const values: string[] = ['d1', 'd2', 'd3', 'd4'];
      for (let index = 0; index < values.length; index++) {
        sequence.writeString(values[index]);
      }
      for (let index = 0; index < 3; index++) {
        sequence.readString();
      }
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.cursor).assertEqual(sequence.readCount);
      expect(sequence.size()).assertEqual(4);
      expect(sequence.readString()).assertEqual('d4');
      expect(sequence.cursor).assertEqual(4);
      expect(sequence.trace()).assertEqual('d1|d2|d3|d4#4');
    });
  });
}
