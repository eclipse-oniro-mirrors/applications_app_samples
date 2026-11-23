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
import { logSuite } from '../Shared/Support';
import {
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  StubRemoteObjectModel,
  MessageSequenceModel,
  MessageOptionModel,
  joined
} from '../Shared/SharedDriver';

/**
 * Cursor contract of the IPC message sequences.
 *
 * Production anchor: ServiceExtAbility.ets 30 reads one string from the
 * data sequence and 33 writes one string to the reply sequence. The suite
 * pins the cursor, size, read/write counters and reclaim behaviour of the
 * MessageSequenceModel double used to observe that traffic.
 */

function sequenceOf(values: string[]): MessageSequenceModel {
  const sequence = MessageSequenceModel.create();
  for (let index = 0; index < values.length; index++) {
    sequence.writeString(values[index]);
  }
  return sequence;
}

function readMany(sequence: MessageSequenceModel, count: number): string[] {
  const texts: string[] = [];
  for (let index = 0; index < count; index++) {
    texts.push(sequence.readString());
  }
  return texts;
}

export default function cursorContractTest(): void {
  describe('CursorContractTest', () => {
    beforeAll(() => {
      logSuite('CursorContractTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('CursorContractTest', 'end');
    });

    /**
     * @tc.name          cursorContractFreshSequenceCursorZero
     * @tc.desc          A newly created sequence has cursor 0 and no values.
     * @tc.precondition  A fresh sequence model.
     * @tc.steps         1. Create a sequence.
     *                   2. Read cursor, size and counters.
     *                   3. Read once to confirm emptiness.
     * @tc.expected      The sequence is empty with cursor 0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('cursorContractFreshSequenceCursorZero', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.reclaimed).assertFalse();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
    });

    /**
     * @tc.name          cursorContractWriteDoesNotMoveCursor
     * @tc.desc          Writing values leaves the read cursor at zero.
     * @tc.precondition  A fresh sequence model.
     * @tc.steps         1. Write two values.
     *                   2. Read cursor and write count.
     *                   3. Confirm no read happened.
     * @tc.expected      The cursor stays 0 while the write count is 2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('cursorContractWriteDoesNotMoveCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString('first')).assertTrue();
      expect(sequence.writeString('second')).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.trace()).assertEqual('first|second#0');
    });

    /**
     * @tc.name          cursorContractReadMovesCursor
     * @tc.desc          A successful read advances the cursor by exactly one.
     * @tc.precondition  A sequence holding two values.
     * @tc.steps         1. Read the first value.
     *                   2. Compare cursor and read count.
     *                   3. Read the second value.
     * @tc.expected      The cursor moves from 0 to 1 then to 2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('cursorContractReadMovesCursor', 0, () => {
      const sequence = sequenceOf(['alpha', 'beta']);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.readString()).assertEqual('beta');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.trace()).assertEqual('alpha|beta#2');
    });
    /**
     * @tc.name          cursorContractReadBeyondEndReturnsEmpty
     * @tc.desc          Reading past the last value yields an empty string.
     * @tc.precondition  A sequence holding one value already exhausted.
     * @tc.steps         1. Read the only value.
     *                   2. Read twice more.
     *                   3. Compare both extra reads with ''.
     * @tc.expected      Both extra reads are empty and the cursor stays at 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('cursorContractReadBeyondEndReturnsEmpty', 0, () => {
      const sequence = sequenceOf(['only']);
      expect(sequence.readString()).assertEqual('only');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.trace()).assertEqual('only#1');
      expect(sequence.values.length).assertEqual(1);
    });

    /**
     * @tc.name          cursorContractReadBeyondEndKeepsCursor
     * @tc.desc          An exhausted read never pushes the cursor past the size.
     * @tc.precondition  A two-value sequence read to exhaustion.
     * @tc.steps         1. Read both values.
     *                   2. Read three additional times.
     *                   3. Compare cursor and size.
     * @tc.expected      The cursor remains equal to the size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReadBeyondEndKeepsCursor', 0, () => {
      const sequence = sequenceOf(['a', 'b']);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.readString()).assertEqual('b');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(sequence.size());
      expect(sequence.cursor).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractReadCountOnlyOnHit
     * @tc.desc          The read counter increments only for successful reads.
     * @tc.precondition  A one-value sequence.
     * @tc.steps         1. Read the value once.
     *                   2. Perform three failed reads.
     *                   3. Compare the read counter.
     * @tc.expected      The read counter stays at 1 after four attempts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReadCountOnlyOnHit', 0, () => {
      const sequence = sequenceOf(['value']);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.readString()).assertEqual('value');
      expect(sequence.readCount).assertEqual(1);
      sequence.readString();
      sequence.readString();
      sequence.readString();
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
    });

    /**
     * @tc.name          cursorContractRewindResetsCursor
     * @tc.desc          rewind returns the cursor to zero.
     * @tc.precondition  A three-value sequence partially read.
     * @tc.steps         1. Read two values.
     *                   2. Rewind.
     *                   3. Compare cursor and trace.
     * @tc.expected      The cursor returns to 0 and the trace ends with #0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('cursorContractRewindResetsCursor', 0, () => {
      const sequence = sequenceOf(['a', 'b', 'c']);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.readString()).assertEqual('b');
      expect(sequence.cursor).assertEqual(2);
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('a|b|c#0');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.reclaimed).assertFalse();
    });

    /**
     * @tc.name          cursorContractRewindKeepsValues
     * @tc.desc          Rewinding never removes buffered values.
     * @tc.precondition  A three-value sequence after a rewind.
     * @tc.steps         1. Read all values.
     *                   2. Rewind.
     *                   3. Read all values again.
     * @tc.expected      The same three values are returned in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractRewindKeepsValues', 0, () => {
      const sequence = sequenceOf(['x', 'y', 'z']);
      const all = readMany(sequence, 3);
      expect(all.length).assertEqual(3);
      expect(all[0]).assertEqual('x');
      expect(all[1]).assertEqual('y');
      expect(all[2]).assertEqual('z');
      sequence.rewind();
      const again = readMany(sequence, 3);
      expect(again.length).assertEqual(3);
      expect(again[0]).assertEqual('x');
      expect(again[1]).assertEqual('y');
      expect(again[2]).assertEqual('z');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(6);
    });

    /**
     * @tc.name          cursorContractRewindKeepsReadCount
     * @tc.desc          Rewinding does not reset the read counter.
     * @tc.precondition  A sequence read twice.
     * @tc.steps         1. Read two values.
     *                   2. Rewind and read one value.
     *                   3. Compare read counts.
     * @tc.expected      The read counter reaches three after the rewind read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractRewindKeepsReadCount', 0, () => {
      const sequence = sequenceOf(['one', 'two']);
      expect(readMany(sequence, 2).length).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      sequence.rewind();
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('one');
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.trace()).assertEqual('one|two#1');
    });

    /**
     * @tc.name          cursorContractReclaimResetsCursor
     * @tc.desc          Reclaiming a partially read sequence resets its cursor.
     * @tc.precondition  A two-value sequence after one read.
     * @tc.steps         1. Read the first value.
     *                   2. Reclaim the sequence.
     *                   3. Compare cursor and trace.
     * @tc.expected      The cursor is 0 and the sequence reports reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReclaimResetsCursor', 0, () => {
      const sequence = sequenceOf(['first', 'second']);
      expect(sequence.readString()).assertEqual('first');
      expect(sequence.cursor).assertEqual(1);
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('first|second#0');
      expect(sequence.size()).assertEqual(2);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.writeCount).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractReclaimBlocksWrites
     * @tc.desc          A reclaimed sequence refuses new writes.
     * @tc.precondition  A reclaimed sequence.
     * @tc.steps         1. Reclaim an empty sequence.
     *                   2. Attempt two writes.
     *                   3. Compare size and write count.
     * @tc.expected      Both writes return false and the size stays unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReclaimBlocksWrites', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.reclaim();
      expect(sequence.writeString('blocked')).assertFalse();
      expect(sequence.writeString('also blocked')).assertFalse();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.values.length).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.cursor).assertEqual(0);
    });

    /**
     * @tc.name          cursorContractReclaimBlocksReads
     * @tc.desc          A reclaimed sequence returns empty text for every read.
     * @tc.precondition  A reclaimed two-value sequence.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Attempt two reads.
     *                   3. Compare read count and cursor.
     * @tc.expected      Both reads are empty with no counter movement.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReclaimBlocksReads', 0, () => {
      const sequence = sequenceOf(['kept', 'hidden']);
      expect(sequence.readString()).assertEqual('kept');
      expect(sequence.readCount).assertEqual(1);
      sequence.reclaim();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.values.length).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractTraceIncludesCursor
     * @tc.desc          An empty sequence trace is exactly '#0'.
     * @tc.precondition  A fresh sequence.
     * @tc.steps         1. Read the trace.
     *                   2. Compare length and suffix.
     *                   3. Compare with joined values.
     * @tc.expected      The trace is '#0' with no value prefix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractTraceIncludesCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.trace().length).assertEqual(2);
      expect(sequence.trace().endsWith('#0')).assertTrue();
      expect(sequence.trace().startsWith('#')).assertTrue();
      expect(sequence.trace()).assertEqual(joined(sequence.values, '|') + '#0');
      expect(sequence.trace().indexOf('#')).assertEqual(0);
      expect(sequence.trace() === '').assertFalse();
    });

    /**
     * @tc.name          cursorContractTraceAfterTwoWrites
     * @tc.desc          Two writes join values with a pipe before the cursor suffix.
     * @tc.precondition  A sequence with two values and no reads.
     * @tc.steps         1. Write 'left' and 'right'.
     *                   2. Read the trace.
     *                   3. Locate the pipe and hash.
     * @tc.expected      The trace is 'left|right#0'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractTraceAfterTwoWrites', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('left');
      sequence.writeString('right');
      expect(sequence.trace()).assertEqual('left|right#0');
      expect(sequence.trace().indexOf('|')).assertEqual(4);
      expect(sequence.trace().indexOf('#')).assertEqual(10);
      expect(sequence.trace().split('|').length).assertEqual(2);
      expect(sequence.trace().split('|')[1]).assertEqual('right#0');
      expect(sequence.trace().length).assertEqual(12);
      expect(sequence.cursor).assertEqual(0);
    });

    /**
     * @tc.name          cursorContractTraceAfterOneRead
     * @tc.desc          The cursor suffix reflects reads performed so far.
     * @tc.precondition  A three-value sequence after one read.
     * @tc.steps         1. Read the first value.
     *                   2. Read the trace.
     *                   3. Compare suffix and cursor.
     * @tc.expected      The trace is 'a|b|c#1'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractTraceAfterOneRead', 0, () => {
      const sequence = sequenceOf(['a', 'b', 'c']);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.trace()).assertEqual('a|b|c#1');
      expect(sequence.trace().endsWith('#1')).assertTrue();
      expect(sequence.trace().lastIndexOf('#')).assertEqual(5);
      expect(sequence.trace().substring(6)).assertEqual('1');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.trace().split('|').length).assertEqual(3);
      expect(sequence.trace().length).assertEqual(7);
    });

    /**
     * @tc.name          cursorContractSizeIsValueCount
     * @tc.desc          size equals the number of buffered values at all times.
     * @tc.precondition  An empty sequence.
     * @tc.steps         1. Compare size after each of three writes.
     *                   2. Read one value.
     *                   3. Compare size after the read.
     * @tc.expected      The size follows writes only, not reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractSizeIsValueCount', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.size()).assertEqual(0);
      sequence.writeString('a');
      expect(sequence.size()).assertEqual(1);
      sequence.writeString('b');
      expect(sequence.size()).assertEqual(2);
      sequence.writeString('c');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.values.length).assertEqual(3);
      expect(sequence.size()).assertEqual(sequence.values.length);
    });

    /**
     * @tc.name          cursorContractWriteCountTracksWrites
     * @tc.desc          The write counter increments once per accepted write.
     * @tc.precondition  A fresh sequence.
     * @tc.steps         1. Perform four writes.
     *                   2. Perform reads.
     *                   3. Compare the write counter.
     * @tc.expected      The write counter is 4 while reads do not change it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractWriteCountTracksWrites', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('1');
      sequence.writeString('2');
      sequence.writeString('3');
      sequence.writeString('4');
      expect(sequence.writeCount).assertEqual(4);
      expect(sequence.size()).assertEqual(4);
      expect(sequence.readString()).assertEqual('1');
      expect(sequence.writeCount).assertEqual(4);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.values[3]).assertEqual('4');
      expect(sequence.trace()).assertEqual('1|2|3|4#1');
    });

    /**
     * @tc.name          cursorContractTwoValuesFifoOrder
     * @tc.desc          Values are returned in write order regardless of content.
     * @tc.precondition  A sequence with unsorted values.
     * @tc.steps         1. Write zeta, alpha, mu.
     *                   2. Read all three.
     *                   3. Compare with the write order.
     * @tc.expected      Reads follow insertion order, not alphabetical order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractTwoValuesFifoOrder', 0, () => {
      const sequence = sequenceOf(['zeta', 'alpha', 'mu']);
      expect(sequence.values[0]).assertEqual('zeta');
      expect(sequence.values[1]).assertEqual('alpha');
      expect(sequence.values[2]).assertEqual('mu');
      expect(sequence.readString()).assertEqual('zeta');
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.readString()).assertEqual('mu');
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.trace()).assertEqual('zeta|alpha|mu#3');
    });

    /**
     * @tc.name          cursorContractPartialReadThenRewind
     * @tc.desc          A partial read followed by rewind repeats the same prefix.
     * @tc.precondition  A three-value sequence.
     * @tc.steps         1. Read one value.
     *                   2. Rewind and read two values.
     *                   3. Compare the repeated prefix.
     * @tc.expected      The second pass starts again at the first value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractPartialReadThenRewind', 0, () => {
      const sequence = sequenceOf(['p', 'q', 'r']);
      const first = sequence.readString();
      expect(first).assertEqual('p');
      sequence.rewind();
      const second = sequence.readString();
      const third = sequence.readString();
      expect(second).assertEqual('p');
      expect(third).assertEqual('q');
      expect(second).assertEqual(first);
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.readString()).assertEqual('r');
      expect(sequence.trace()).assertEqual('p|q|r#3');
    });
    /**
     * @tc.name          cursorContractRewindAfterExhaustion
     * @tc.desc          Rewinding after a full read allows a second full pass.
     * @tc.precondition  A two-value sequence read to exhaustion.
     * @tc.steps         1. Read both values.
     *                   2. Rewind and read both again.
     *                   3. Compare cursor and read count.
     * @tc.expected      The second pass succeeds and the read count reaches four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractRewindAfterExhaustion', 0, () => {
      const sequence = sequenceOf(['m', 'n']);
      expect(sequence.readString()).assertEqual('m');
      expect(sequence.readString()).assertEqual('n');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('m');
      expect(sequence.readString()).assertEqual('n');
      expect(sequence.readCount).assertEqual(4);
      expect(sequence.size()).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractEmptySequenceReadEmpty
     * @tc.desc          Reading an untouched empty sequence changes nothing.
     * @tc.precondition  A fresh sequence.
     * @tc.steps         1. Read three times.
     *                   2. Read counters.
     *                   3. Confirm the trace.
     * @tc.expected      All reads are empty with zero read count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractEmptySequenceReadEmpty', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.writeCount).assertEqual(0);
    });

    /**
     * @tc.name          cursorContractEmptySequenceAfterReclaim
     * @tc.desc          An empty reclaimed sequence keeps its '#0' trace.
     * @tc.precondition  A fresh sequence that is reclaimed.
     * @tc.steps         1. Reclaim the empty sequence.
     *                   2. Read the trace and counters.
     *                   3. Attempt a read.
     * @tc.expected      The trace is '#0' and the read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractEmptySequenceAfterReclaim', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.size()).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.writeString('no')).assertFalse();
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.trace()).assertEqual(joined(sequence.values, '|') + '#0');
    });

    /**
     * @tc.name          cursorContractSingleValueMultipleReads
     * @tc.desc          A single value is delivered only once per pass.
     * @tc.precondition  A one-value sequence.
     * @tc.steps         1. Read the value three times.
     *                   2. Compare each read.
     *                   3. Compare the read counter.
     * @tc.expected      Only the first read returns the value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractSingleValueMultipleReads', 0, () => {
      const sequence = sequenceOf(['single']);
      const first = sequence.readString();
      const second = sequence.readString();
      const third = sequence.readString();
      expect(first).assertEqual('single');
      expect(second).assertEqual('');
      expect(third).assertEqual('');
      expect(first === second).assertFalse();
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.trace()).assertEqual('single#1');
    });

    /**
     * @tc.name          cursorContractCursorNeverExceedsSize
     * @tc.desc          Repeated reads never push the cursor beyond the size.
     * @tc.precondition  A two-value sequence.
     * @tc.steps         1. Perform six reads.
     *                   2. Compare cursor with size after each two reads.
     *                   3. Check the trace suffix.
     * @tc.expected      The cursor equals 2 at the end and never exceeds it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractCursorNeverExceedsSize', 0, () => {
      const sequence = sequenceOf(['u', 'v']);
      let exceeded = false;
      for (let index = 0; index < 6; index++) {
        sequence.readString();
        if (sequence.cursor > sequence.size()) {
          exceeded = true;
        }
      }
      expect(exceeded).assertFalse();
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.trace()).assertEqual('u|v#2');
      expect(sequence.trace().endsWith('#2')).assertTrue();
      expect(sequence.cursor).assertEqual(sequence.size());
    });

    /**
     * @tc.name          cursorContractRepeatedRewindIdempotent
     * @tc.desc          Calling rewind several times has the same effect as once.
     * @tc.precondition  A two-value sequence after one read.
     * @tc.steps         1. Rewind three times.
     *                   2. Compare cursor and trace.
     *                   3. Read the first value.
     * @tc.expected      The cursor is 0 after every rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractRepeatedRewindIdempotent', 0, () => {
      const sequence = sequenceOf(['aa', 'bb']);
      expect(sequence.readString()).assertEqual('aa');
      sequence.rewind();
      sequence.rewind();
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('aa|bb#0');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.readString()).assertEqual('aa');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractWriteAfterReadsAppends
     * @tc.desc          Writing after a read appends without rewinding.
     * @tc.precondition  A two-value sequence after one read.
     * @tc.steps         1. Read the first value.
     *                   2. Write a third value.
     *                   3. Compare size, cursor and trace.
     * @tc.expected      The new value lands at the end while the cursor stays 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractWriteAfterReadsAppends', 0, () => {
      const sequence = sequenceOf(['a', 'b']);
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.writeString('c')).assertTrue();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.trace()).assertEqual('a|b|c#1');
      expect(sequence.readString()).assertEqual('b');
      expect(sequence.readString()).assertEqual('c');
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
    });

    /**
     * @tc.name          cursorContractWriteAfterReadVisible
     * @tc.desc          A value appended after exhaustion is readable immediately.
     * @tc.precondition  A two-value exhausted sequence.
     * @tc.steps         1. Read both values.
     *                   2. Append a third value.
     *                   3. Read the appended value.
     * @tc.expected      The appended value is returned without a rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractWriteAfterReadVisible', 0, () => {
      const sequence = sequenceOf(['first', 'second']);
      expect(readMany(sequence, 2).length).assertEqual(2);
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      sequence.writeString('third');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readString()).assertEqual('third');
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.trace()).assertEqual('first|second|third#3');
      expect(sequence.readCount).assertEqual(3);
    });
    /**
     * @tc.name          cursorContractCursorsIndependentSequences
     * @tc.desc          Two sequences keep independent cursors.
     * @tc.precondition  Two sequences with different value counts.
     * @tc.steps         1. Read one value from the first.
     *                   2. Read two values from the second.
     *                   3. Compare both cursors.
     * @tc.expected      The cursors are 1 and 2 respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractCursorsIndependentSequences', 0, () => {
      const first = sequenceOf(['only']);
      const second = sequenceOf(['a', 'b', 'c']);
      expect(first.readString()).assertEqual('only');
      expect(first.cursor).assertEqual(1);
      expect(second.cursor).assertEqual(0);
      expect(second.readString()).assertEqual('a');
      expect(second.readString()).assertEqual('b');
      expect(second.cursor).assertEqual(2);
      expect(first.cursor).assertEqual(1);
      expect(first.size()).assertEqual(1);
      expect(second.size()).assertEqual(3);
    });

    /**
     * @tc.name          cursorContractTwoSequencesInterleaved
     * @tc.desc          Interleaved reads do not leak cursor state across sequences.
     * @tc.precondition  Two two-value sequences.
     * @tc.steps         1. Alternate reads between both sequences.
     *                   2. Compare each read value.
     *                   3. Compare final cursors.
     * @tc.expected      Each sequence yields its own values in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractTwoSequencesInterleaved', 0, () => {
      const first = sequenceOf(['f1', 'f2']);
      const second = sequenceOf(['s1', 's2']);
      expect(first.readString()).assertEqual('f1');
      expect(second.readString()).assertEqual('s1');
      expect(first.readString()).assertEqual('f2');
      expect(second.readString()).assertEqual('s2');
      expect(first.cursor).assertEqual(2);
      expect(second.cursor).assertEqual(2);
      expect(first.trace()).assertEqual('f1|f2#2');
      expect(second.trace()).assertEqual('s1|s2#2');
      expect(first.values[0]).assertEqual('f1');
      expect(second.values[0]).assertEqual('s1');
    });

    /**
     * @tc.name          cursorContractStubReadAdvancesDataCursor
     * @tc.desc          A handled request advances the data cursor exactly once.
     * @tc.precondition  A data sequence holding one payload.
     * @tc.steps         1. Invoke the stub with code 1.
     *                   2. Compare the data cursor and read count.
     *                   3. Compare the recorded text.
     * @tc.expected      The data cursor becomes 1 and the payload is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractStubReadAdvancesDataCursor', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      expect(data.cursor).assertEqual(0);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(data.size()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(data.readString()).assertEqual('');
      expect(data.trace()).assertEqual('hello world#1');
    });

    /**
     * @tc.name          cursorContractUnknownCodeLeavesCursorZero
     * @tc.desc          A refused code never touches the data cursor.
     * @tc.precondition  A data sequence holding one payload.
     * @tc.steps         1. Invoke the stub with code 0.
     *                   2. Compare cursor and read count.
     *                   3. Invoke with code 1 afterwards.
     * @tc.expected      The cursor stays 0 for the refusal and moves on the success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractUnknownCodeLeavesCursorZero', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(UNKNOWN_CODE_ZERO, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(data.size()).assertEqual(1);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[1].text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          cursorContractKilledStubLeavesCursorZero
     * @tc.desc          A dead stub rejects before reading the data sequence.
     * @tc.precondition  A killed stub with a data payload.
     * @tc.steps         1. Kill the stub.
     *                   2. Invoke with code 1.
     *                   3. Compare cursor and read count.
     * @tc.expected      The cursor remains 0 and no text is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractKilledStubLeavesCursorZero', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.kill();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(reply.cursor).assertEqual(0);
      expect(reply.size()).assertEqual(0);
      expect(stub.requests[0].text).assertEqual('');
      expect(data.trace()).assertEqual('hello world#0');
    });

    /**
     * @tc.name          cursorContractReplyCursorStartsZero
     * @tc.desc          A reply sequence starts with cursor zero before any read.
     * @tc.precondition  A completed manual code 1 exchange.
     * @tc.steps         1. Invoke the stub.
     *                   2. Compare reply cursor and read count.
     *                   3. Compare the trace.
     * @tc.expected      The reply cursor is 0 and its read count is 0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReplyCursorStartsZero', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.cursor).assertEqual(0);
      expect(reply.readCount).assertEqual(0);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.trace()).assertEqual('hello rpc#0');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name          cursorContractReplyCursorAfterRead
     * @tc.desc          Reading the reply moves its cursor independently of data.
     * @tc.precondition  A completed manual exchange.
     * @tc.steps         1. Read the reply.
     *                   2. Compare both cursors.
     *                   3. Read the reply again.
     * @tc.expected      The reply cursor is 1 and the data cursor stays 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReplyCursorAfterRead', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(data.cursor).assertEqual(1);
      expect(reply.readCount).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(reply.readString()).assertEqual('');
      expect(reply.cursor).assertEqual(1);
      expect(reply.trace()).assertEqual('hello rpc#1');
      expect(data.trace()).assertEqual('hello world#1');
    });

    /**
     * @tc.name          cursorContractReplyRewindReread
     * @tc.desc          Rewinding the reply allows the client to reread the literal.
     * @tc.precondition  A reply sequence read once.
     * @tc.steps         1. Read the reply.
     *                   2. Rewind the reply.
     *                   3. Read and compare again.
     * @tc.expected      The same literal is returned after the rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReplyRewindReread', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      const first = reply.readString();
      expect(first).assertEqual(REPLY_PAYLOAD);
      reply.rewind();
      expect(reply.cursor).assertEqual(0);
      expect(reply.trace()).assertEqual('hello rpc#0');
      const second = reply.readString();
      expect(second).assertEqual(first);
      expect(reply.readCount).assertEqual(2);
      expect(reply.cursor).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
    });
    /**
     * @tc.name          cursorContractReplyReclaim
     * @tc.desc          Reclaiming the reply sequence resets its cursor and reads.
     * @tc.precondition  A reply sequence read once.
     * @tc.steps         1. Read the reply.
     *                   2. Reclaim the sequence.
     *                   3. Attempt another read and write.
     * @tc.expected      The reclaimed reply yields empty text and refuses writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractReplyReclaim', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      reply.reclaim();
      expect(reply.reclaimed).assertTrue();
      expect(reply.cursor).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(1);
      expect(reply.writeString('late')).assertFalse();
      expect(reply.size()).assertEqual(1);
    });

    /**
     * @tc.name          cursorContractDataReadOncePerRequest
     * @tc.desc          Each handled request consumes exactly one data value.
     * @tc.precondition  A data sequence with two payloads.
     * @tc.steps         1. Invoke the stub twice with code 1.
     *                   2. Compare data cursor and read count.
     *                   3. Compare recorded texts.
     * @tc.expected      Two reads occur and each text is recorded once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractDataReadOncePerRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['payload one', 'payload two']);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(2);
      expect(data.readCount).assertEqual(2);
      expect(data.size()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('payload one');
      expect(stub.requests[1].text).assertEqual('payload two');
      expect(data.readString()).assertEqual('');
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractRepeatedStubRequestsAdvanceData
     * @tc.desc          Repeated requests walk the data sequence in order until empty.
     * @tc.precondition  A data sequence with three payloads.
     * @tc.steps         1. Send four code 1 requests.
     *                   2. Compare the data cursor.
     *                   3. Compare the recorded texts.
     * @tc.expected      Three reads occur and the fourth request records empty text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractRepeatedStubRequestsAdvanceData', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['one', 'two', 'three']);
      for (let index = 0; index < 4; index++) {
        stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      }
      expect(data.cursor).assertEqual(3);
      expect(data.readCount).assertEqual(3);
      expect(stub.requests[0].text).assertEqual('one');
      expect(stub.requests[2].text).assertEqual('three');
      expect(stub.requests[3].text).assertEqual('');
      expect(stub.requests[3].handled).assertTrue();
      expect(data.trace()).assertEqual('one|two|three#3');
    });

    /**
     * @tc.name          cursorContractDataReclaimBeforeRequest
     * @tc.desc          A reclaimed data sequence yields empty text but still replies.
     * @tc.precondition  A reclaimed data sequence.
     * @tc.steps         1. Write a payload and reclaim the data.
     *                   2. Invoke the stub with code 1.
     *                   3. Compare cursor, text and reply.
     * @tc.expected      The request is handled with empty recorded text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractDataReclaimBeforeRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      data.reclaim();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(data.cursor).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(stub.requests[0].text).assertEqual('');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(data.trace()).assertEqual('hello world#0');
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          cursorContractReplySizeAfterTwoWrites
     * @tc.desc          Two handled requests produce two buffered reply values.
     * @tc.precondition  A shared reply sequence and one data sequence.
     * @tc.steps         1. Invoke the stub twice with code 1.
     *                   2. Compare reply size and cursor.
     *                   3. Read both values.
     * @tc.expected      The reply holds two values with cursor 0 before reading.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReplySizeAfterTwoWrites', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['a', 'b']);
      const reply = MessageSequenceModel.create();
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(2);
      expect(reply.writeCount).assertEqual(2);
      expect(reply.cursor).assertEqual(0);
      expect(reply.trace()).assertEqual('hello rpc|hello rpc#0');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractTraceCursorNumericSegment
     * @tc.desc          The trace cursor suffix is a base-ten number.
     * @tc.precondition  A three-value sequence with two reads.
     * @tc.steps         1. Read two values.
     *                   2. Slice the text after the hash.
     *                   3. Compare with String(cursor).
     * @tc.expected      The suffix is '2' and matches the cursor field.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractTraceCursorNumericSegment', 0, () => {
      const sequence = sequenceOf(['aa', 'bb', 'cc']);
      expect(sequence.readString()).assertEqual('aa');
      expect(sequence.readString()).assertEqual('bb');
      const trace = sequence.trace();
      const suffix = trace.substring(trace.indexOf('#') + 1);
      expect(suffix).assertEqual('2');
      expect(suffix).assertEqual(String(sequence.cursor));
      expect(trace).assertEqual('aa|bb|cc#2');
      expect(trace.endsWith('#' + String(sequence.cursor))).assertTrue();
      expect(suffix.length).assertEqual(1);
      expect(Number(suffix)).assertEqual(sequence.cursor);
    });

    /**
     * @tc.name          cursorContractTraceWithThreeValues
     * @tc.desc          A full three-value read ends with the cursor suffix #3.
     * @tc.precondition  A three-value sequence.
     * @tc.steps         1. Read all three values.
     *                   2. Count separators in the trace.
     *                   3. Compare the suffix.
     * @tc.expected      The trace is 'x|y|z#3' with two separators.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractTraceWithThreeValues', 0, () => {
      const sequence = sequenceOf(['x', 'y', 'z']);
      expect(readMany(sequence, 3).length).assertEqual(3);
      expect(sequence.trace()).assertEqual('x|y|z#3');
      expect(sequence.trace().split('|').length).assertEqual(3);
      expect(sequence.trace().indexOf('|')).assertEqual(1);
      expect(sequence.trace().lastIndexOf('|')).assertEqual(3);
      expect(sequence.trace().substring(4)).assertEqual('z#3');
      expect(sequence.trace().length).assertEqual(7);
      expect(sequence.cursor).assertEqual(3);
    });

    /**
     * @tc.name          cursorContractRewindBeforeAnyRead
     * @tc.desc          Rewinding before the first read leaves state unchanged.
     * @tc.precondition  A fresh two-value sequence.
     * @tc.steps         1. Rewind immediately.
     *                   2. Compare cursor and read count.
     *                   3. Read the first value.
     * @tc.expected      The rewind is a no-op and reading starts at the first value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractRewindBeforeAnyRead', 0, () => {
      const sequence = sequenceOf(['start', 'end']);
      expect(sequence.cursor).assertEqual(0);
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.trace()).assertEqual('start|end#0');
      expect(sequence.readString()).assertEqual('start');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.writeCount).assertEqual(2);
    });
    /**
     * @tc.name          cursorContractReadAfterEmptyThenWrite
     * @tc.desc          An empty sequence becomes readable once a value is written.
     * @tc.precondition  A fresh sequence after one empty read.
     * @tc.steps         1. Read the empty sequence.
     *                   2. Write one value.
     *                   3. Read the value.
     * @tc.expected      The appended value is readable with cursor 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReadAfterEmptyThenWrite', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.writeString('late')).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.readString()).assertEqual('late');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.trace()).assertEqual('late#1');
    });

    /**
     * @tc.name          cursorContractCursorAfterSecondRead
     * @tc.desc          A second successful read brings the cursor to two.
     * @tc.precondition  A three-value sequence.
     * @tc.steps         1. Read two values.
     *                   2. Compare cursor and read count.
     *                   3. Compare the trace suffix.
     * @tc.expected      The cursor is 2 with the third value still unread.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractCursorAfterSecondRead', 0, () => {
      const sequence = sequenceOf(['k1', 'k2', 'k3']);
      expect(sequence.readString()).assertEqual('k1');
      expect(sequence.readString()).assertEqual('k2');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.trace()).assertEqual('k1|k2|k3#2');
      expect(sequence.readString()).assertEqual('k3');
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
    });

    /**
     * @tc.name          cursorContractZeroSizeNoRead
     * @tc.desc          Failed writes leave the sequence size at zero.
     * @tc.precondition  A reclaimed sequence.
     * @tc.steps         1. Reclaim a fresh sequence.
     *                   2. Attempt a write and a read.
     *                   3. Compare size and counters.
     * @tc.expected      Size, write count and read count all stay zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractZeroSizeNoRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.reclaim();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.writeString('dropped')).assertFalse();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
      expect(sequence.values.length).assertEqual(0);
    });

    /**
     * @tc.name          cursorContractManualStubTwoDataValues
     * @tc.desc          An unknown code skips both data values before a code 1 read.
     * @tc.precondition  A data sequence with two payloads.
     * @tc.steps         1. Invoke the stub with code 2.
     *                   2. Invoke it with code 1.
     *                   3. Compare cursor and recorded text.
     * @tc.expected      The unknown code reads nothing and code 1 reads the first value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractManualStubTwoDataValues', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['first payload', 'second payload']);
      stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(0);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[1].text).assertEqual('first payload');
      expect(data.readString()).assertEqual('second payload');
      expect(data.cursor).assertEqual(2);
      expect(data.size()).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractReplyCursorAfterTwoWritesOneRead
     * @tc.desc          One read over two reply values leaves one value pending.
     * @tc.precondition  A reply sequence with two written values.
     * @tc.steps         1. Read one reply value.
     *                   2. Compare cursor and size.
     *                   3. Compare the trace.
     * @tc.expected      The cursor is 1 while the size remains 2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractReplyCursorAfterTwoWritesOneRead', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['one', 'two']);
      const reply = MessageSequenceModel.create();
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(2);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(2);
      expect(reply.trace()).assertEqual('hello rpc|hello rpc#1');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(2);
      expect(reply.readCount).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractTraceSeparatorCount
     * @tc.desc          A three-value trace contains two pipes and one hash.
     * @tc.precondition  A three-value sequence fully read.
     * @tc.steps         1. Read all values.
     *                   2. Count pipes and hashes.
     *                   3. Compare the trace.
     * @tc.expected      There are two pipes and exactly one hash.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractTraceSeparatorCount', 0, () => {
      const sequence = sequenceOf(['d1', 'd2', 'd3']);
      readMany(sequence, 3);
      const trace = sequence.trace();
      expect(trace.split('|').length - 1).assertEqual(2);
      expect(trace.split('#').length - 1).assertEqual(1);
      expect(trace.indexOf('#')).assertEqual(8);
      expect(trace.lastIndexOf('#')).assertEqual(8);
      expect(trace).assertEqual('d1|d2|d3#3');
      expect(trace.endsWith('#3')).assertTrue();
      expect(trace.startsWith('d1|')).assertTrue();
    });

    /**
     * @tc.name          cursorContractSizeAfterRewind
     * @tc.desc          Rewinding does not change the reported size.
     * @tc.precondition  A four-value sequence read twice.
     * @tc.steps         1. Read two values.
     *                   2. Rewind.
     *                   3. Compare size and values length.
     * @tc.expected      The size remains 4 after the rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractSizeAfterRewind', 0, () => {
      const sequence = sequenceOf(['w', 'x', 'y', 'z']);
      expect(readMany(sequence, 2).length).assertEqual(2);
      expect(sequence.size()).assertEqual(4);
      sequence.rewind();
      expect(sequence.size()).assertEqual(4);
      expect(sequence.values.length).assertEqual(4);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(4);
      expect(sequence.trace()).assertEqual('w|x|y|z#0');
      expect(sequence.readString()).assertEqual('w');
    });

    /**
     * @tc.name          cursorContractReadCountAfterReclaimRead
     * @tc.desc          Reads after a reclaim do not increase the read counter.
     * @tc.precondition  A reclaimed two-value sequence.
     * @tc.steps         1. Read before reclaim.
     *                   2. Reclaim and read twice.
     *                   3. Compare the read counter.
     * @tc.expected      The counter stays at one across the reclaimed reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractReadCountAfterReclaimRead', 0, () => {
      const sequence = sequenceOf(['before', 'after']);
      expect(sequence.readString()).assertEqual('before');
      expect(sequence.readCount).assertEqual(1);
      sequence.reclaim();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.trace()).assertEqual('before|after#0');
    });
    /**
     * @tc.name          cursorContractWriteReturnsTrue
     * @tc.desc          writeString reports true for accepted writes and false after reclaim.
     * @tc.precondition  A fresh sequence.
     * @tc.steps         1. Write one value.
     *                   2. Reclaim the sequence.
     *                   3. Attempt another write.
     * @tc.expected      Only the first write returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractWriteReturnsTrue', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.writeString('accepted')).assertTrue();
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
      sequence.reclaim();
      expect(sequence.writeString('rejected')).assertFalse();
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.values[0]).assertEqual('accepted');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('accepted#0');
    });

    /**
     * @tc.name          cursorContractMultipleWritesBeforeRead
     * @tc.desc          Four writes followed by reads keep the FIFO order.
     * @tc.precondition  A fresh sequence.
     * @tc.steps         1. Write four values.
     *                   2. Compare the cursor before reading.
     *                   3. Read all values.
     * @tc.expected      The cursor is 0 before reading and 4 afterwards.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractMultipleWritesBeforeRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('q1');
      sequence.writeString('q2');
      sequence.writeString('q3');
      sequence.writeString('q4');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(4);
      expect(sequence.writeCount).assertEqual(4);
      expect(sequence.readString()).assertEqual('q1');
      expect(sequence.readString()).assertEqual('q2');
      expect(sequence.readString()).assertEqual('q3');
      expect(sequence.readString()).assertEqual('q4');
      expect(sequence.cursor).assertEqual(4);
      expect(sequence.trace()).assertEqual('q1|q2|q3|q4#4');
    });

    /**
     * @tc.name          cursorContractRewindThenWriteKeepsCursor
     * @tc.desc          A write after a rewind appends while the cursor stays zero.
     * @tc.precondition  A two-value sequence after a rewind.
     * @tc.steps         1. Read one value and rewind.
     *                   2. Write a third value.
     *                   3. Read the first value again.
     * @tc.expected      The trace is 'a|b|c#0' and reading restarts at 'a'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractRewindThenWriteKeepsCursor', 0, () => {
      const sequence = sequenceOf(['a', 'b']);
      expect(sequence.readString()).assertEqual('a');
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeString('c')).assertTrue();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.trace()).assertEqual('a|b|c#0');
      expect(sequence.readString()).assertEqual('a');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(2);
    });

    /**
     * @tc.name          cursorContractReadAllThenWriteThenRead
     * @tc.desc          After exhaustion a new write becomes the only pending value.
     * @tc.precondition  A two-value exhausted sequence.
     * @tc.steps         1. Read both values.
     *                   2. Write a third value.
     *                   3. Read the third and then an empty value.
     * @tc.expected      The cursor reaches 3 and the final read is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractReadAllThenWriteThenRead', 0, () => {
      const sequence = sequenceOf(['r1', 'r2']);
      expect(readMany(sequence, 2).length).assertEqual(2);
      expect(sequence.cursor).assertEqual(2);
      sequence.writeString('r3');
      expect(sequence.size()).assertEqual(3);
      expect(sequence.readString()).assertEqual('r3');
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.trace()).assertEqual('r1|r2|r3#3');
    });

    /**
     * @tc.name          cursorContractStubReusesDataAcrossCodes
     * @tc.desc          Accepted and refused codes share one data sequence safely.
     * @tc.precondition  A data sequence with three payloads.
     * @tc.steps         1. Send code 2, code 1, code 0 and code 1.
     *                   2. Compare the cursor and read count.
     *                   3. Compare the recorded texts.
     * @tc.expected      Only the two code 1 requests consume values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractStubReusesDataAcrossCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['v1', 'v2', 'v3']);
      const codes: number[] = [UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        stub.onRemoteMessageRequest(codes[index], data, MessageSequenceModel.create(), new MessageOptionModel());
      }
      expect(data.cursor).assertEqual(2);
      expect(data.readCount).assertEqual(2);
      expect(data.size()).assertEqual(3);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[1].text).assertEqual('v1');
      expect(stub.requests[2].text).assertEqual('');
      expect(stub.requests[3].text).assertEqual('v2');
      expect(data.readString()).assertEqual('v3');
    });

    /**
     * @tc.name          cursorContractReplyTraceAfterTwoRequests
     * @tc.desc          Two requests leave the reply trace at cursor zero.
     * @tc.precondition  A reply sequence with two written values.
     * @tc.steps         1. Invoke the stub twice.
     *                   2. Compare the trace and cursor.
     *                   3. Read one value.
     * @tc.expected      The trace ends with #0 before reading and #1 after.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractReplyTraceAfterTwoRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['a1', 'a2']);
      const reply = MessageSequenceModel.create();
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.trace()).assertEqual('hello rpc|hello rpc#0');
      expect(reply.cursor).assertEqual(0);
      expect(reply.writeCount).assertEqual(2);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.trace()).assertEqual('hello rpc|hello rpc#1');
      expect(reply.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(2);
      expect(reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          cursorContractDataCursorAfterTwoCodes
     * @tc.desc          One accepted and one refused code advances the cursor once.
     * @tc.precondition  A data sequence with two payloads.
     * @tc.steps         1. Send code 1 then code 2.
     *                   2. Compare cursor and read count.
     *                   3. Confirm the second value is still unread.
     * @tc.expected      The cursor is 1 and the second value remains buffered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractDataCursorAfterTwoCodes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['read me', 'keep me']);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(1);
      expect(data.readCount).assertEqual(1);
      expect(data.size()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('read me');
      expect(stub.requests[1].text).assertEqual('');
      expect(data.readString()).assertEqual('keep me');
      expect(data.cursor).assertEqual(2);
      expect(data.trace()).assertEqual('read me|keep me#2');
    });

    /**
     * @tc.name          cursorContractReplyReadOrder
     * @tc.desc          Reply values written in sequence are read in FIFO order.
     * @tc.precondition  A reply sequence receiving two different reply texts.
     * @tc.steps         1. Invoke the stub with 'first reply'.
     *                   2. Change replyText and invoke again.
     *                   3. Read both reply values.
     * @tc.expected      The reads return 'first reply' then 'second reply'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('cursorContractReplyReadOrder', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = sequenceOf(['one', 'two']);
      const reply = MessageSequenceModel.create();
      stub.replyText = 'first reply';
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      stub.replyText = 'second reply';
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(2);
      expect(reply.values[0]).assertEqual('first reply');
      expect(reply.values[1]).assertEqual('second reply');
      expect(reply.readString()).assertEqual('first reply');
      expect(reply.readString()).assertEqual('second reply');
      expect(reply.cursor).assertEqual(2);
      expect(reply.trace()).assertEqual('first reply|second reply#2');
      expect(reply.readString()).assertEqual('');
    });

    /**
     * @tc.name          cursorContractSizeGrowsWithWritesOnly
     * @tc.desc          Size changes only on write, never on read or reclaim.
     * @tc.precondition  A fresh sequence.
     * @tc.steps         1. Write one value and read it.
     *                   2. Write another value.
     *                   3. Reclaim and compare the size.
     * @tc.expected      The size reaches 2 and stays 2 after reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('cursorContractSizeGrowsWithWritesOnly', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('s1');
      expect(sequence.size()).assertEqual(1);
      expect(sequence.readString()).assertEqual('s1');
      expect(sequence.size()).assertEqual(1);
      sequence.rewind();
      expect(sequence.size()).assertEqual(1);
      sequence.writeString('s2');
      expect(sequence.size()).assertEqual(2);
      sequence.reclaim();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.trace()).assertEqual('s1|s2#0');
    });
  });
}




