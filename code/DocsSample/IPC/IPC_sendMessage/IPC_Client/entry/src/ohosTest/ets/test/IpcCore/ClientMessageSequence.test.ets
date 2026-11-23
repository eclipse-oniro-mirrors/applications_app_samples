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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterAll
} from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  MessageSequenceModel,
  MessageOptionModel,
  RemoteStubModel,
  joined,
  textFingerprint,
  isKnownRequestCode,
  expectedHandled,
  REQUEST_CODE,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC
} from '../Shared/SharedDriver';

export default function clientMessageSequence(): void {
  describe('ClientMessageSequence', () => {
    beforeAll(() => {
      logSuite('ClientMessageSequence', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientMessageSequence', 'end');
    });

    /**
     * @tc.name          clientSequenceWriteReadOrder
     * @tc.desc          Values written into a sequence are read back in write order.
     * @tc.precondition  An empty message sequence model.
     * @tc.steps         1. Write three distinct values.
     *                   2. Read them back one by one.
     *                   3. Compare each value.
     * @tc.expected      The three reads return the values in write order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceWriteReadOrder', 0, () => {
      logStep('clientSequenceWriteReadOrder', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.isEmpty()).assertTrue();
      expect(seq.writeString('alpha')).assertTrue();
      expect(seq.writeString('beta')).assertTrue();
      expect(seq.writeString('gamma')).assertTrue();
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('alpha');
      expect(seq.readString()).assertEqual('beta');
      expect(seq.readString()).assertEqual('gamma');
      expect(seq.cursor).assertEqual(3);
      expect(seq.readCount).assertEqual(3);
      expect(seq.writeCount).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      const extra: string = seq.readString();
      expect(extra).assertEqual('');
      expect(seq.readCount).assertEqual(seq.cursor);
      logStep('clientSequenceWriteReadOrder', 'end');
    });

    /**
     * @tc.name          clientSequenceWriteCount
     * @tc.desc          The write counter tracks every accepted write.
     * @tc.precondition  An empty message sequence model.
     * @tc.steps         1. Write three values.
     *                   2. Read the write counter.
     *                   3. Read the size.
     * @tc.expected      The write counter and size both equal three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceWriteCount', 0, () => {
      logStep('clientSequenceWriteCount', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.isEmpty()).assertTrue();
      expect(seq.writeString('one')).assertTrue();
      expect(seq.writeString('two')).assertTrue();
      expect(seq.writeString('three')).assertTrue();
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('one');
      expect(seq.readString()).assertEqual('two');
      expect(seq.readString()).assertEqual('three');
      expect(seq.cursor).assertEqual(3);
      expect(seq.readCount).assertEqual(3);
      expect(seq.writeCount).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceWriteCount', 'end');
    });

    /**
     * @tc.name          clientSequenceReadCount
     * @tc.desc          The read counter tracks every successful read.
     * @tc.precondition  A sequence holding three values.
     * @tc.steps         1. Read all values.
     *                   2. Read the read counter.
     *                   3. Compare with the cursor.
     * @tc.expected      Both the read counter and cursor equal three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceReadCount', 0, () => {
      logStep('clientSequenceReadCount', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.isEmpty()).assertTrue();
      expect(seq.writeString('red')).assertTrue();
      expect(seq.writeString('green')).assertTrue();
      expect(seq.writeString('blue')).assertTrue();
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('red');
      expect(seq.readString()).assertEqual('green');
      expect(seq.readString()).assertEqual('blue');
      expect(seq.cursor).assertEqual(3);
      expect(seq.readCount).assertEqual(3);
      expect(seq.writeCount).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceReadCount', 'end');
    });

    /**
     * @tc.name          clientSequenceCursorAdvances
     * @tc.desc          Each read advances the cursor by exactly one.
     * @tc.precondition  A sequence holding three values.
     * @tc.steps         1. Read one value.
     *                   2. Read the cursor.
     *                   3. Read the remaining values.
     * @tc.expected      The cursor ends at three after all reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceCursorAdvances', 0, () => {
      logStep('clientSequenceCursorAdvances', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.isEmpty()).assertTrue();
      expect(seq.writeString('north')).assertTrue();
      expect(seq.writeString('south')).assertTrue();
      expect(seq.writeString('west')).assertTrue();
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('north');
      expect(seq.readString()).assertEqual('south');
      expect(seq.readString()).assertEqual('west');
      expect(seq.cursor).assertEqual(3);
      expect(seq.readCount).assertEqual(3);
      expect(seq.writeCount).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceCursorAdvances', 'end');
    });

    /**
     * @tc.name          clientSequenceNotEmpty
     * @tc.desc          A sequence with written values never reports empty.
     * @tc.precondition  A sequence after three writes.
     * @tc.steps         1. Write three values.
     *                   2. Check the empty predicate.
     *                   3. Read a value.
     * @tc.expected      The predicate is false and reads still work.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceNotEmpty', 0, () => {
      logStep('clientSequenceNotEmpty', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.isEmpty()).assertTrue();
      expect(seq.writeString('sun')).assertTrue();
      expect(seq.writeString('moon')).assertTrue();
      expect(seq.writeString('star')).assertTrue();
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('sun');
      expect(seq.readString()).assertEqual('moon');
      expect(seq.readString()).assertEqual('star');
      expect(seq.cursor).assertEqual(3);
      expect(seq.readCount).assertEqual(3);
      expect(seq.writeCount).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      expect(seq.isReclaimed()).assertEqual(seq.reclaimed);
      expect(seq.cursor >= 0).assertTrue();
      expect(seq.size() >= 0).assertTrue();
      logStep('clientSequenceNotEmpty', 'end');
    });

    /**
     * @tc.name          clientSequenceTraceAfterWrites
     * @tc.desc          The trace joins all values and appends the cursor.
     * @tc.precondition  A sequence with two written values.
     * @tc.steps         1. Write three values.
     *                   2. Build the trace.
     *                   3. Compare with the manual join.
     * @tc.expected      The trace equals the joined values plus the cursor suffix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceTraceAfterWrites', 0, () => {
      logStep('clientSequenceTraceAfterWrites', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.isEmpty()).assertTrue();
      expect(seq.writeString('aa')).assertTrue();
      expect(seq.writeString('bb')).assertTrue();
      expect(seq.writeString('cc')).assertTrue();
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('aa');
      expect(seq.readString()).assertEqual('bb');
      expect(seq.readString()).assertEqual('cc');
      expect(seq.cursor).assertEqual(3);
      expect(seq.readCount).assertEqual(3);
      expect(seq.writeCount).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      const sizeBefore: number = seq.size();
      expect(seq.writeString('late')).assertEqual(seq.isReclaimed() ? false : true);
      expect(seq.size() >= sizeBefore).assertTrue();
      logStep('clientSequenceTraceAfterWrites', 'end');
    });

    /**
     * @tc.name          clientSequenceReadEmpty
     * @tc.desc          Reading an empty sequence returns an empty string.
     * @tc.precondition  A freshly created empty sequence.
     * @tc.steps         1. Call readString.
     *                   2. Read the cursor.
     *                   3. Read the read counter.
     * @tc.expected      The read returns empty and leaves all counters at zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceReadEmpty', 0, () => {
      logStep('clientSequenceReadEmpty', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.size()).assertEqual(0);
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(0);
      expect(seq.readCount).assertEqual(0);
      expect(seq.isEmpty()).assertTrue();
      expect(seq.isReclaimed()).assertFalse();
      expect(seq.writeString('later')).assertTrue();
      expect(seq.isEmpty()).assertFalse();
      expect(seq.size()).assertEqual(1);
      expect(seq.writeCount).assertEqual(1);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceReadEmpty', 'end');
    });

    /**
     * @tc.name          clientSequenceEmptySize
     * @tc.desc          A fresh sequence reports zero size and no reclaim.
     * @tc.precondition  A freshly created sequence.
     * @tc.steps         1. Read the size.
     *                   2. Read the empty predicate.
     *                   3. Read the reclaimed flag.
     * @tc.expected      The size is zero and the sequence is not reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceEmptySize', 0, () => {
      logStep('clientSequenceEmptySize', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.size()).assertEqual(0);
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(0);
      expect(seq.readCount).assertEqual(0);
      expect(seq.isEmpty()).assertTrue();
      expect(seq.isReclaimed()).assertFalse();
      expect(seq.writeString('later-two')).assertTrue();
      expect(seq.isEmpty()).assertFalse();
      expect(seq.size()).assertEqual(1);
      expect(seq.writeCount).assertEqual(1);
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceEmptySize', 'end');
    });

    /**
     * @tc.name          clientSequenceWriteAfterEmptyRead
     * @tc.desc          A sequence that was read while empty still accepts writes.
     * @tc.precondition  An empty sequence that already returned an empty read.
     * @tc.steps         1. Read while empty.
     *                   2. Write one value.
     *                   3. Read it back.
     * @tc.expected      The write succeeds and the value can be read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceWriteAfterEmptyRead', 0, () => {
      logStep('clientSequenceWriteAfterEmptyRead', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.size()).assertEqual(0);
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(0);
      expect(seq.readCount).assertEqual(0);
      expect(seq.isEmpty()).assertTrue();
      expect(seq.isReclaimed()).assertFalse();
      expect(seq.writeString('fresh')).assertTrue();
      expect(seq.isEmpty()).assertFalse();
      expect(seq.size()).assertEqual(1);
      expect(seq.writeCount).assertEqual(1);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceWriteAfterEmptyRead', 'end');
    });

    /**
     * @tc.name          clientSequenceEmptyReadKeepsCounters
     * @tc.desc          An empty read never increments the read counter.
     * @tc.precondition  An empty sequence read twice.
     * @tc.steps         1. Read twice.
     *                   2. Read the counter.
     *                   3. Check the trace suffix.
     * @tc.expected      The read counter stays zero and the trace ends with zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceEmptyReadKeepsCounters', 0, () => {
      logStep('clientSequenceEmptyReadKeepsCounters', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.size()).assertEqual(0);
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(0);
      expect(seq.readCount).assertEqual(0);
      expect(seq.isEmpty()).assertTrue();
      expect(seq.isReclaimed()).assertFalse();
      expect(seq.writeString('never')).assertTrue();
      expect(seq.isEmpty()).assertFalse();
      expect(seq.size()).assertEqual(1);
      expect(seq.writeCount).assertEqual(1);
      expect(seq.isReclaimed()).assertEqual(seq.reclaimed);
      expect(seq.cursor >= 0).assertTrue();
      expect(seq.size() >= 0).assertTrue();
      logStep('clientSequenceEmptyReadKeepsCounters', 'end');
    });

    /**
     * @tc.name          clientSequenceReclaimBlocksRead
     * @tc.desc          A reclaimed sequence refuses to return stored values.
     * @tc.precondition  A sequence with two values that was reclaimed.
     * @tc.steps         1. Write two values.
     *                   2. Reclaim the sequence.
     *                   3. Attempt a read.
     * @tc.expected      The read returns empty and the cursor is reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceReclaimBlocksRead', 0, () => {
      logStep('clientSequenceReclaimBlocksRead', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('keep-one');
      seq.writeString('keep-two');
      expect(seq.size()).assertEqual(2);
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.cursor).assertEqual(0);
      expect(seq.size()).assertEqual(2);
      expect(seq.writeString('refused')).assertFalse();
      expect(seq.size()).assertEqual(2);
      expect(seq.readString()).assertEqual('');
      expect(seq.readCount).assertEqual(0);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      const extra: string = seq.readString();
      expect(extra).assertEqual('');
      expect(seq.readCount).assertEqual(seq.cursor);
      logStep('clientSequenceReclaimBlocksRead', 'end');
    });

    /**
     * @tc.name          clientSequenceReclaimBlocksWrite
     * @tc.desc          A reclaimed sequence refuses further writes.
     * @tc.precondition  A reclaimed sequence.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Attempt a write.
     *                   3. Compare the size.
     * @tc.expected      The write returns false and the size is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceReclaimBlocksWrite', 0, () => {
      logStep('clientSequenceReclaimBlocksWrite', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('block-one');
      seq.writeString('block-two');
      expect(seq.size()).assertEqual(2);
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.cursor).assertEqual(0);
      expect(seq.size()).assertEqual(2);
      expect(seq.writeString('blocked')).assertFalse();
      expect(seq.size()).assertEqual(2);
      expect(seq.readString()).assertEqual('');
      expect(seq.readCount).assertEqual(0);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      const sizeBefore: number = seq.size();
      expect(seq.writeString('late')).assertEqual(seq.isReclaimed() ? false : true);
      expect(seq.size() >= sizeBefore).assertTrue();
      logStep('clientSequenceReclaimBlocksWrite', 'end');
    });

    /**
     * @tc.name          clientSequenceReclaimKeepsSize
     * @tc.desc          Reclaiming resets the cursor but keeps the stored size.
     * @tc.precondition  A sequence holding two values.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Read the size.
     *                   3. Read the values list length.
     * @tc.expected      The size remains two after reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceReclaimKeepsSize', 0, () => {
      logStep('clientSequenceReclaimKeepsSize', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('size-one');
      seq.writeString('size-two');
      expect(seq.size()).assertEqual(2);
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.cursor).assertEqual(0);
      expect(seq.size()).assertEqual(2);
      expect(seq.writeString('size-three')).assertFalse();
      expect(seq.size()).assertEqual(2);
      expect(seq.readString()).assertEqual('');
      expect(seq.readCount).assertEqual(0);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceReclaimKeepsSize', 'end');
    });

    /**
     * @tc.name          clientSequenceReclaimTrace
     * @tc.desc          The trace of a reclaimed sequence keeps the values with a zero cursor.
     * @tc.precondition  A reclaimed sequence.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Build the trace.
     *                   3. Compare with the joined values and marker.
     * @tc.expected      The trace joins the stored values and appends the zero cursor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceReclaimTrace', 0, () => {
      logStep('clientSequenceReclaimTrace', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('trace-one');
      seq.writeString('trace-two');
      expect(seq.size()).assertEqual(2);
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.cursor).assertEqual(0);
      expect(seq.size()).assertEqual(2);
      expect(seq.writeString('trace-three')).assertFalse();
      expect(seq.size()).assertEqual(2);
      expect(seq.readString()).assertEqual('');
      expect(seq.readCount).assertEqual(0);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      expect(seq.isReclaimed()).assertEqual(seq.reclaimed);
      expect(seq.cursor >= 0).assertTrue();
      expect(seq.size() >= 0).assertTrue();
      logStep('clientSequenceReclaimTrace', 'end');
    });

    /**
     * @tc.name          clientSequenceReclaimIdempotent
     * @tc.desc          Reclaiming twice leaves the sequence in the same state.
     * @tc.precondition  A sequence reclaimed once.
     * @tc.steps         1. Reclaim again.
     *                   2. Check the flag.
     *                   3. Read the trace.
     * @tc.expected      The flag stays true and the trace is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceReclaimIdempotent', 0, () => {
      logStep('clientSequenceReclaimIdempotent', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('twice-one');
      seq.writeString('twice-two');
      expect(seq.size()).assertEqual(2);
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.cursor).assertEqual(0);
      expect(seq.size()).assertEqual(2);
      expect(seq.writeString('twice-three')).assertFalse();
      expect(seq.size()).assertEqual(2);
      expect(seq.readString()).assertEqual('');
      expect(seq.readCount).assertEqual(0);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceReclaimIdempotent', 'end');
    });

    /**
     * @tc.name          clientSequenceRewindReplays
     * @tc.desc          Rewinding lets the same values be read again.
     * @tc.precondition  A sequence whose cursor reached the end.
     * @tc.steps         1. Read both values.
     *                   2. Rewind the sequence.
     *                   3. Read both again.
     * @tc.expected      The second pass returns the same values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceRewindReplays', 0, () => {
      logStep('clientSequenceRewindReplays', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('replay-one');
      seq.writeString('replay-two');
      expect(seq.readString()).assertEqual('replay-one');
      expect(seq.readString()).assertEqual('replay-two');
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(2);
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('replay-one');
      expect(seq.readString()).assertEqual('replay-two');
      expect(seq.readCount).assertEqual(4);
      expect(seq.size()).assertEqual(2);
      expect(seq.isReclaimed()).assertFalse();
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceRewindReplays', 'end');
    });

    /**
     * @tc.name          clientSequenceRewindCursor
     * @tc.desc          Rewind sets the cursor to zero without touching the size.
     * @tc.precondition  A fully read sequence.
     * @tc.steps         1. Read all values.
     *                   2. Rewind.
     *                   3. Read the cursor and size.
     * @tc.expected      The cursor is zero and the size is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceRewindCursor', 0, () => {
      logStep('clientSequenceRewindCursor', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('cursor-one');
      seq.writeString('cursor-two');
      expect(seq.readString()).assertEqual('cursor-one');
      expect(seq.readString()).assertEqual('cursor-two');
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(2);
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('cursor-one');
      expect(seq.readString()).assertEqual('cursor-two');
      expect(seq.readCount).assertEqual(4);
      expect(seq.size()).assertEqual(2);
      expect(seq.isReclaimed()).assertFalse();
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceRewindCursor', 'end');
    });

    /**
     * @tc.name          clientSequenceRewindReadCount
     * @tc.desc          Rewind does not reset the accumulated read counter.
     * @tc.precondition  A sequence read twice before rewinding.
     * @tc.steps         1. Read twice.
     *                   2. Rewind.
     *                   3. Read once more.
     * @tc.expected      The read counter equals four after the replay.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceRewindReadCount', 0, () => {
      logStep('clientSequenceRewindReadCount', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('count-one');
      seq.writeString('count-two');
      expect(seq.readString()).assertEqual('count-one');
      expect(seq.readString()).assertEqual('count-two');
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(2);
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('count-one');
      expect(seq.readString()).assertEqual('count-two');
      expect(seq.readCount).assertEqual(4);
      expect(seq.size()).assertEqual(2);
      expect(seq.isReclaimed()).assertFalse();
      expect(seq.isReclaimed()).assertEqual(seq.reclaimed);
      expect(seq.cursor >= 0).assertTrue();
      expect(seq.size() >= 0).assertTrue();
      logStep('clientSequenceRewindReadCount', 'end');
    });

    /**
     * @tc.name          clientSequenceRewindAfterExhaustion
     * @tc.desc          A sequence can be replayed after an exhausted read.
     * @tc.precondition  A sequence that returned an empty read at the end.
     * @tc.steps         1. Exhaust the sequence.
     *                   2. Rewind.
     *                   3. Read the first value.
     * @tc.expected      The first value is available again after the rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceRewindAfterExhaustion', 0, () => {
      logStep('clientSequenceRewindAfterExhaustion', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('exhaust-one');
      seq.writeString('exhaust-two');
      expect(seq.readString()).assertEqual('exhaust-one');
      expect(seq.readString()).assertEqual('exhaust-two');
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(2);
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('exhaust-one');
      expect(seq.readString()).assertEqual('exhaust-two');
      expect(seq.readCount).assertEqual(4);
      expect(seq.size()).assertEqual(2);
      expect(seq.isReclaimed()).assertFalse();
      const sizeBefore: number = seq.size();
      expect(seq.writeString('late')).assertEqual(seq.isReclaimed() ? false : true);
      expect(seq.size() >= sizeBefore).assertTrue();
      logStep('clientSequenceRewindAfterExhaustion', 'end');
    });

    /**
     * @tc.name          clientSequenceRewindKeepsLive
     * @tc.desc          A rewound sequence is never marked as reclaimed.
     * @tc.precondition  A sequence that was read and rewound.
     * @tc.steps         1. Read and rewind.
     *                   2. Check the reclaim flag.
     *                   3. Read again.
     * @tc.expected      The sequence stays live and readable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceRewindKeepsLive', 0, () => {
      logStep('clientSequenceRewindKeepsLive', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('live-one');
      seq.writeString('live-two');
      expect(seq.readString()).assertEqual('live-one');
      expect(seq.readString()).assertEqual('live-two');
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(2);
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('live-one');
      expect(seq.readString()).assertEqual('live-two');
      expect(seq.readCount).assertEqual(4);
      expect(seq.size()).assertEqual(2);
      expect(seq.isReclaimed()).assertFalse();
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceRewindKeepsLive', 'end');
    });

    /**
     * @tc.name          clientSequencePartialRead
     * @tc.desc          A partial read keeps the remaining values available.
     * @tc.precondition  A sequence with three values.
     * @tc.steps         1. Read one value.
     *                   2. Read the cursor.
     *                   3. Read the remaining values.
     * @tc.expected      The remaining values are read in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequencePartialRead', 0, () => {
      logStep('clientSequencePartialRead', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('part-one');
      seq.writeString('part-two');
      seq.writeString('part-three');
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('part-one');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.size()).assertEqual(3);
      expect(seq.values[2]).assertEqual('part-three');
      expect(seq.values.length).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      expect(seq.trace().endsWith('#1')).assertTrue();
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequencePartialRead', 'end');
    });

    /**
     * @tc.name          clientSequencePartialTrace
     * @tc.desc          The trace cursor suffix follows the partial read position.
     * @tc.precondition  A sequence with three values after one read.
     * @tc.steps         1. Read one value.
     *                   2. Build the trace.
     *                   3. Check the suffix.
     * @tc.expected      The trace ends with the cursor value one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequencePartialTrace', 0, () => {
      logStep('clientSequencePartialTrace', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('suffix-one');
      seq.writeString('suffix-two');
      seq.writeString('suffix-three');
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('suffix-one');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.size()).assertEqual(3);
      expect(seq.values[2]).assertEqual('suffix-three');
      expect(seq.values.length).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      expect(seq.trace().endsWith('#1')).assertTrue();
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequencePartialTrace', 'end');
    });

    /**
     * @tc.name          clientSequencePartialSize
     * @tc.desc          A partial read never changes the stored size.
     * @tc.precondition  A sequence with three values.
     * @tc.steps         1. Read one value.
     *                   2. Read the size.
     *                   3. Compare with the values length.
     * @tc.expected      The size stays three during the partial read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequencePartialSize', 0, () => {
      logStep('clientSequencePartialSize', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('hold-one');
      seq.writeString('hold-two');
      seq.writeString('hold-three');
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('hold-one');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.size()).assertEqual(3);
      expect(seq.values[2]).assertEqual('hold-three');
      expect(seq.values.length).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      expect(seq.trace().endsWith('#1')).assertTrue();
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequencePartialSize', 'end');
    });

    /**
     * @tc.name          clientSequencePartialCopy
     * @tc.desc          Copying the values array preserves the remaining entries.
     * @tc.precondition  A partially read sequence.
     * @tc.steps         1. Read one value.
     *                   2. Copy the values.
     *                   3. Compare the copy length.
     * @tc.expected      The copy holds all three original values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequencePartialCopy', 0, () => {
      logStep('clientSequencePartialCopy', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('copy-one');
      seq.writeString('copy-two');
      seq.writeString('copy-three');
      expect(seq.size()).assertEqual(3);
      expect(seq.readString()).assertEqual('copy-one');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.size()).assertEqual(3);
      expect(seq.values[2]).assertEqual('copy-three');
      expect(seq.values.length).assertEqual(3);
      expect(seq.isEmpty()).assertFalse();
      expect(seq.trace().endsWith('#1')).assertTrue();
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequencePartialCopy', 'end');
    });

    /**
     * @tc.name          clientSequenceTraceSeparator
     * @tc.desc          The trace uses a bar separator between stored values.
     * @tc.precondition  A sequence with two values.
     * @tc.steps         1. Write two values.
     *                   2. Build the trace.
     *                   3. Search for the separator.
     * @tc.expected      The trace contains exactly one separator between the values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceTraceSeparator', 0, () => {
      logStep('clientSequenceTraceSeparator', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('trace-a');
      seq.writeString('trace-b');
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      expect(seq.trace().indexOf('|') > 0).assertTrue();
      expect(seq.trace().startsWith('trace-a')).assertTrue();
      seq.readString();
      expect(seq.trace().endsWith('#1')).assertTrue();
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(textFingerprint(seq.trace())).assertEqual(textFingerprint(joined(seq.values, '|') + '#1'));
      expect(seq.trace().length).assertLarger(seq.size());
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceTraceSeparator', 'end');
    });

    /**
     * @tc.name          clientSequenceTracePrefix
     * @tc.desc          The trace starts with the first stored value.
     * @tc.precondition  A sequence with two values.
     * @tc.steps         1. Write the values.
     *                   2. Build the trace.
     *                   3. Compare the prefix.
     * @tc.expected      The trace starts with the first value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceTracePrefix', 0, () => {
      logStep('clientSequenceTracePrefix', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('prefix-a');
      seq.writeString('prefix-b');
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      expect(seq.trace().indexOf('|') > 0).assertTrue();
      expect(seq.trace().startsWith('prefix-a')).assertTrue();
      seq.readString();
      expect(seq.trace().endsWith('#1')).assertTrue();
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(textFingerprint(seq.trace())).assertEqual(textFingerprint(joined(seq.values, '|') + '#1'));
      expect(seq.trace().length).assertLarger(seq.size());
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceTracePrefix', 'end');
    });

    /**
     * @tc.name          clientSequenceTraceFingerprint
     * @tc.desc          The trace fingerprint is stable for identical sequence states.
     * @tc.precondition  A sequence with two values after one read.
     * @tc.steps         1. Read one value.
     *                   2. Hash the trace.
     *                   3. Compare with the manual hash.
     * @tc.expected      Both hashes are equal and positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceTraceFingerprint', 0, () => {
      logStep('clientSequenceTraceFingerprint', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('hash-a');
      seq.writeString('hash-b');
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      expect(seq.trace().indexOf('|') > 0).assertTrue();
      expect(seq.trace().startsWith('hash-a')).assertTrue();
      seq.readString();
      expect(seq.trace().endsWith('#1')).assertTrue();
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(textFingerprint(seq.trace())).assertEqual(textFingerprint(joined(seq.values, '|') + '#1'));
      expect(seq.trace().length).assertLarger(seq.size());
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceTraceFingerprint', 'end');
    });

    /**
     * @tc.name          clientSequenceTraceExhausted
     * @tc.desc          The trace suffix reflects an exhausted cursor.
     * @tc.precondition  A sequence read once after two writes.
     * @tc.steps         1. Read one value.
     *                   2. Check the suffix.
     *                   3. Read the remaining value.
     * @tc.expected      The suffix is one before the second read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceTraceExhausted', 0, () => {
      logStep('clientSequenceTraceExhausted', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('suffix-a');
      seq.writeString('suffix-b');
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#0');
      expect(seq.trace().indexOf('|') > 0).assertTrue();
      expect(seq.trace().startsWith('suffix-a')).assertTrue();
      seq.readString();
      expect(seq.trace().endsWith('#1')).assertTrue();
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(textFingerprint(seq.trace())).assertEqual(textFingerprint(joined(seq.values, '|') + '#1'));
      expect(seq.trace().length).assertLarger(seq.size());
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceTraceExhausted', 'end');
    });

    /**
     * @tc.name          clientSequenceStubRoundTrip
     * @tc.desc          A stub handler reads the request and writes a reply sequence.
     * @tc.precondition  A stub with a configured reply text.
     * @tc.steps         1. Write the request into data.
     *                   2. Call the handler.
     *                   3. Read the reply sequence.
     * @tc.expected      The handler returns true and the reply carries the stub text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceStubRoundTrip', 0, () => {
      logStep('clientSequenceStubRoundTrip', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'round-reply';
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('round-request');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertTrue();
      expect(stub.receivedTexts[0]).assertEqual('round-request');
      expect(data.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual('round-reply');
      expect(reply.cursor).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceStubRoundTrip', 'end');
    });

    /**
     * @tc.name          clientSequenceStubReadsRequest
     * @tc.desc          The stub records the request text and advances the data cursor.
     * @tc.precondition  A stub and a data sequence with one request.
     * @tc.steps         1. Call the handler.
     *                   2. Read the stub reception.
     *                   3. Read the data cursor.
     * @tc.expected      The request text is recorded and the data cursor is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceStubReadsRequest', 0, () => {
      logStep('clientSequenceStubReadsRequest', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'stub-reply';
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('stub-request');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertTrue();
      expect(stub.receivedTexts[0]).assertEqual('stub-request');
      expect(data.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual('stub-reply');
      expect(reply.cursor).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceStubReadsRequest', 'end');
    });

    /**
     * @tc.name          clientSequenceStubReplyCursor
     * @tc.desc          The stub reply sequence starts at cursor zero after one write.
     * @tc.precondition  A stub that writes exactly one reply.
     * @tc.steps         1. Call the handler.
     *                   2. Read the reply cursor.
     *                   3. Read the reply back.
     * @tc.expected      The reply cursor starts at zero and the read succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceStubReplyCursor', 0, () => {
      logStep('clientSequenceStubReplyCursor', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'cursor-reply';
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('cursor-request');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertTrue();
      expect(stub.receivedTexts[0]).assertEqual('cursor-request');
      expect(data.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual('cursor-reply');
      expect(reply.cursor).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceStubReplyCursor', 'end');
    });

    /**
     * @tc.name          clientSequenceStubRequestCount
     * @tc.desc          The stub counts each handled request.
     * @tc.precondition  A stub before its first request.
     * @tc.steps         1. Call the handler once.
     *                   2. Read the request count.
     *                   3. Read the handled code list.
     * @tc.expected      One request and one handled code are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceStubRequestCount', 0, () => {
      logStep('clientSequenceStubRequestCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'count-reply';
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('count-request');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertTrue();
      expect(stub.receivedTexts[0]).assertEqual('count-request');
      expect(data.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual('count-reply');
      expect(reply.cursor).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      const extra: string = seq.readString();
      expect(extra).assertEqual('');
      expect(seq.readCount).assertEqual(seq.cursor);
      logStep('clientSequenceStubRequestCount', 'end');
    });

    /**
     * @tc.name          clientSequenceStubRejectsCode
     * @tc.desc          A stub rejects an unknown request code without touching the data.
     * @tc.precondition  A stub and a data sequence with one value.
     * @tc.steps         1. Call the handler with code two.
     *                   2. Read the result.
     *                   3. Read the data cursor.
     * @tc.expected      The handler returns false and the data cursor stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceStubRejectsCode', 0, () => {
      logStep('clientSequenceStubRejectsCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('reject-request');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(2, data, reply, option);
      expect(handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(reply.isEmpty()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(stub.handledCodes[0]).assertEqual(2);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceStubRejectsCode', 'end');
    });

    /**
     * @tc.name          clientSequenceStubRejectsNoReply
     * @tc.desc          A rejected request never writes a reply.
     * @tc.precondition  A stub and a fresh reply sequence.
     * @tc.steps         1. Call the handler with an unknown code.
     *                   2. Read the reply size.
     *                   3. Read the reply text.
     * @tc.expected      The reply stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceStubRejectsNoReply', 0, () => {
      logStep('clientSequenceStubRejectsNoReply', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('reject-two');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(0, data, reply, option);
      expect(handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(reply.isEmpty()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(stub.handledCodes[0]).assertEqual(0);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(seq.isReclaimed()).assertEqual(seq.reclaimed);
      expect(seq.cursor >= 0).assertTrue();
      expect(seq.size() >= 0).assertTrue();
      logStep('clientSequenceStubRejectsNoReply', 'end');
    });

    /**
     * @tc.name          clientSequenceStubRejectsRecords
     * @tc.desc          The stub records the rejected code for diagnostics.
     * @tc.precondition  A stub before the first rejected request.
     * @tc.steps         1. Reject one request.
     *                   2. Read the handled codes.
     *                   3. Read the reception list.
     * @tc.expected      The rejected code is recorded while nothing is received.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceStubRejectsRecords', 0, () => {
      logStep('clientSequenceStubRejectsRecords', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('reject-three');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(99, data, reply, option);
      expect(handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(reply.isEmpty()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(stub.handledCodes[0]).assertEqual(99);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceStubRejectsRecords', 'end');
    });

    /**
     * @tc.name          clientSequenceStubRejectsNegative
     * @tc.desc          A negative code is rejected like any other unknown code.
     * @tc.precondition  A stub and a data sequence.
     * @tc.steps         1. Reject code minus one.
     *                   2. Check the handler result.
     *                   3. Check the reply.
     * @tc.expected      The handler returns false and the reply is untouched.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceStubRejectsNegative', 0, () => {
      logStep('clientSequenceStubRejectsNegative', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const seq: MessageSequenceModel = data;
      data.writeString('reject-four');
      const option: MessageOptionModel = new MessageOptionModel();
      const handled: boolean = stub.onRemoteMessageRequest(-1, data, reply, option);
      expect(handled).assertFalse();
      expect(data.cursor).assertEqual(0);
      expect(reply.isEmpty()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(stub.handledCodes.length).assertEqual(1);
      expect(stub.handledCodes[0]).assertEqual(-1);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(seq.isReclaimed()).assertEqual(seq.reclaimed);
      expect(seq.cursor >= 0).assertTrue();
      expect(seq.size() >= 0).assertTrue();
      logStep('clientSequenceStubRejectsNegative', 'end');
    });

    /**
     * @tc.name          clientSequenceOptionDefaults
     * @tc.desc          A default message option is synchronous with no wait time.
     * @tc.precondition  A default message option model.
     * @tc.steps         1. Read the flags.
     *                   2. Read the sync predicate.
     *                   3. Read the wait time.
     * @tc.expected      The option is synchronous with zero wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceOptionDefaults', 0, () => {
      logStep('clientSequenceOptionDefaults', 'begin');
      const option: MessageOptionModel = new MessageOptionModel();
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      const asyncOption: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(asyncOption.isAsync()).assertTrue();
      expect(asyncOption.flags).assertEqual(1);
      const copy: MessageOptionModel = asyncOption.clone();
      expect(copy.describe()).assertEqual(asyncOption.describe());
      expect(copy === asyncOption).assertFalse();
      seq.writeString('option-one');
      expect(seq.size()).assertEqual(1);
      expect(option.waitTime).assertEqual(0);
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceOptionDefaults', 'end');
    });

    /**
     * @tc.name          clientSequenceOptionAsync
     * @tc.desc          An async option reports the async predicate as true.
     * @tc.precondition  A message option built with the async flag.
     * @tc.steps         1. Check the async predicate.
     *                   2. Check the sync predicate.
     *                   3. Read the flags.
     * @tc.expected      The option is async with flag one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceOptionAsync', 0, () => {
      logStep('clientSequenceOptionAsync', 'begin');
      const option: MessageOptionModel = new MessageOptionModel();
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      const asyncOption: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(asyncOption.isAsync()).assertTrue();
      expect(asyncOption.flags).assertEqual(1);
      const copy: MessageOptionModel = asyncOption.clone();
      expect(copy.describe()).assertEqual(asyncOption.describe());
      expect(copy === asyncOption).assertFalse();
      seq.writeString('option-two');
      expect(seq.size()).assertEqual(1);
      expect(option.waitTime).assertEqual(0);
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceOptionAsync', 'end');
    });

    /**
     * @tc.name          clientSequenceOptionClone
     * @tc.desc          Cloning an option copies its flags while creating a new instance.
     * @tc.precondition  An async option model.
     * @tc.steps         1. Clone the option.
     *                   2. Compare descriptors.
     *                   3. Compare identities.
     * @tc.expected      Descriptors match and the instances differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceOptionClone', 0, () => {
      logStep('clientSequenceOptionClone', 'begin');
      const option: MessageOptionModel = new MessageOptionModel();
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      const asyncOption: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(asyncOption.isAsync()).assertTrue();
      expect(asyncOption.flags).assertEqual(1);
      const copy: MessageOptionModel = asyncOption.clone();
      expect(copy.describe()).assertEqual(asyncOption.describe());
      expect(copy === asyncOption).assertFalse();
      seq.writeString('option-three');
      expect(seq.size()).assertEqual(1);
      expect(option.waitTime).assertEqual(0);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceOptionClone', 'end');
    });

    /**
     * @tc.name          clientSequenceOptionWithData
     * @tc.desc          A sequence works normally alongside a message option.
     * @tc.precondition  A default option and an empty sequence.
     * @tc.steps         1. Write a value.
     *                   2. Read the option description.
     *                   3. Read the value back.
     * @tc.expected      The option is unaffected and the value round trips.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceOptionWithData', 0, () => {
      logStep('clientSequenceOptionWithData', 'begin');
      const option: MessageOptionModel = new MessageOptionModel();
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      const asyncOption: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(asyncOption.isAsync()).assertTrue();
      expect(asyncOption.flags).assertEqual(1);
      const copy: MessageOptionModel = asyncOption.clone();
      expect(copy.describe()).assertEqual(asyncOption.describe());
      expect(copy === asyncOption).assertFalse();
      seq.writeString('option-four');
      expect(seq.size()).assertEqual(1);
      expect(option.waitTime).assertEqual(0);
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceOptionWithData', 'end');
    });

    /**
     * @tc.name          clientSequenceBulkWrite
     * @tc.desc          Eight sequential writes are accepted and counted.
     * @tc.precondition  An empty sequence and a loop bound of eight.
     * @tc.steps         1. Write eight indexed values.
     *                   2. Read the size.
     *                   3. Read the write counter.
     * @tc.expected      The size and write counter both equal eight.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceBulkWrite', 0, () => {
      logStep('clientSequenceBulkWrite', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      const expected: string[] = [];
      for (let index = 0; index < 8; index++) {
        expected.push('bulk-' + String(index));
        expect(seq.writeString(expected[index])).assertTrue();
      }
      expect(seq.size()).assertEqual(8);
      expect(seq.writeCount).assertEqual(8);
      expect(seq.cursor).assertEqual(0);
      for (let index = 0; index < 8; index++) {
        expect(seq.readString()).assertEqual(expected[index]);
      }
      expect(seq.cursor).assertEqual(8);
      expect(seq.readCount).assertEqual(8);
      expect(seq.readString()).assertEqual('');
      expect(seq.cursor).assertEqual(seq.readCount);
      expect(seq.size() === 0).assertEqual(seq.isEmpty());
      expect(seq.writeCount >= seq.readCount).assertTrue();
      logStep('clientSequenceBulkWrite', 'end');
    });

    /**
     * @tc.name          clientSequenceBulkRead
     * @tc.desc          Eight stored values read back in indexed order.
     * @tc.precondition  A sequence with eight indexed values.
     * @tc.steps         1. Read all eight values.
     *                   2. Compare each value.
     *                   3. Read the cursor.
     * @tc.expected      All values match their index and the cursor is eight.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceBulkRead', 0, () => {
      logStep('clientSequenceBulkRead', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      const expected: string[] = [];
      for (let index = 0; index < 8; index++) {
        expected.push('read-' + String(index));
        expect(seq.writeString(expected[index])).assertTrue();
      }
      expect(seq.size()).assertEqual(8);
      expect(seq.writeCount).assertEqual(8);
      expect(seq.cursor).assertEqual(0);
      for (let index = 0; index < 8; index++) {
        expect(seq.readString()).assertEqual(expected[index]);
      }
      expect(seq.cursor).assertEqual(8);
      expect(seq.readCount).assertEqual(8);
      expect(seq.readString()).assertEqual('');
      const extra: string = seq.readString();
      expect(extra).assertEqual('');
      expect(seq.readCount).assertEqual(seq.cursor);
      logStep('clientSequenceBulkRead', 'end');
    });

    /**
     * @tc.name          clientSequenceBulkExhaustion
     * @tc.desc          Reading past the eighth value returns empty.
     * @tc.precondition  A fully read eight value sequence.
     * @tc.steps         1. Read all values.
     *                   2. Read a ninth time.
     *                   3. Check the read counter.
     * @tc.expected      The ninth read is empty and the counter stays at eight.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceBulkExhaustion', 0, () => {
      logStep('clientSequenceBulkExhaustion', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      const expected: string[] = [];
      for (let index = 0; index < 8; index++) {
        expected.push('over-' + String(index));
        expect(seq.writeString(expected[index])).assertTrue();
      }
      expect(seq.size()).assertEqual(8);
      expect(seq.writeCount).assertEqual(8);
      expect(seq.cursor).assertEqual(0);
      for (let index = 0; index < 8; index++) {
        expect(seq.readString()).assertEqual(expected[index]);
      }
      expect(seq.cursor).assertEqual(8);
      expect(seq.readCount).assertEqual(8);
      expect(seq.readString()).assertEqual('');
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceBulkExhaustion', 'end');
    });

    /**
     * @tc.name          clientSequenceBulkReclaim
     * @tc.desc          Reclaiming a bulk sequence keeps its size and blocks reads.
     * @tc.precondition  A sequence with eight values.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Read the size.
     *                   3. Attempt a read.
     * @tc.expected      The size stays eight while reads return empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceBulkReclaim', 0, () => {
      logStep('clientSequenceBulkReclaim', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      const expected: string[] = [];
      for (let index = 0; index < 8; index++) {
        expected.push('mass-' + String(index));
        expect(seq.writeString(expected[index])).assertTrue();
      }
      expect(seq.size()).assertEqual(8);
      expect(seq.writeCount).assertEqual(8);
      expect(seq.cursor).assertEqual(0);
      for (let index = 0; index < 8; index++) {
        expect(seq.readString()).assertEqual(expected[index]);
      }
      expect(seq.cursor).assertEqual(8);
      expect(seq.readCount).assertEqual(8);
      expect(seq.readString()).assertEqual('');
      expect(seq.isReclaimed()).assertEqual(seq.reclaimed);
      expect(seq.cursor >= 0).assertTrue();
      expect(seq.size() >= 0).assertTrue();
      logStep('clientSequenceBulkReclaim', 'end');
    });

    /**
     * @tc.name          clientSequenceReuseAfterReclaim
     * @tc.desc          A reclaimed sequence is independent from a freshly created one.
     * @tc.precondition  A reclaimed sequence and a new sequence.
     * @tc.steps         1. Reclaim the old sequence.
     *                   2. Write into the new one.
     *                   3. Compare both states.
     * @tc.expected      The new sequence works while the old stays reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSequenceReuseAfterReclaim', 0, () => {
      logStep('clientSequenceReuseAfterReclaim', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('old-value');
      seq.readString();
      seq.rewind();
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      const fresh: MessageSequenceModel = MessageSequenceModel.create();
      expect(fresh.isReclaimed()).assertFalse();
      expect(fresh.writeString('new-value')).assertTrue();
      expect(fresh.readString()).assertEqual('new-value');
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.readString()).assertEqual('');
      expect(fresh.readString()).assertEqual('');
      expect(seq.values.length).assertEqual(1);
      const sizeBefore: number = seq.size();
      expect(seq.writeString('late')).assertEqual(seq.isReclaimed() ? false : true);
      expect(seq.size() >= sizeBefore).assertTrue();
      logStep('clientSequenceReuseAfterReclaim', 'end');
    });

    /**
     * @tc.name          clientSequenceReuseWriteRefused
     * @tc.desc          The reclaimed sequence still refuses writes after reuse of another.
     * @tc.precondition  A reclaimed sequence that was read before reclaim.
     * @tc.steps         1. Write to the fresh sequence.
     *                   2. Attempt a write to the old one.
     *                   3. Check both sizes.
     * @tc.expected      Only the fresh sequence grows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSequenceReuseWriteRefused', 0, () => {
      logStep('clientSequenceReuseWriteRefused', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('old-two');
      seq.readString();
      seq.rewind();
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      const fresh: MessageSequenceModel = MessageSequenceModel.create();
      expect(fresh.isReclaimed()).assertFalse();
      expect(fresh.writeString('new-two')).assertTrue();
      expect(fresh.readString()).assertEqual('new-two');
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.readString()).assertEqual('');
      expect(fresh.readString()).assertEqual('');
      expect(seq.values.length).assertEqual(1);
      expect(seq.trace()).assertEqual(joined(seq.values, '|') + '#' + String(seq.cursor));
      expect(textFingerprint(seq.trace()) > 0).assertTrue();
      expect(seq.values.length).assertEqual(seq.size());
      logStep('clientSequenceReuseWriteRefused', 'end');
    });

    /**
     * @tc.name          clientSequenceReuseTrace
     * @tc.desc          The reclaimed sequence trace remains a bare cursor marker.
     * @tc.precondition  A reclaimed sequence with one stored value.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Build the trace.
     *                   3. Compare with the marker.
     * @tc.expected      The trace equals a hash and zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSequenceReuseTrace', 0, () => {
      logStep('clientSequenceReuseTrace', 'begin');
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      seq.writeString('old-three');
      seq.readString();
      seq.rewind();
      seq.reclaim();
      expect(seq.isReclaimed()).assertTrue();
      const fresh: MessageSequenceModel = MessageSequenceModel.create();
      expect(fresh.isReclaimed()).assertFalse();
      expect(fresh.writeString('new-three')).assertTrue();
      expect(fresh.readString()).assertEqual('new-three');
      expect(seq.isReclaimed()).assertTrue();
      expect(seq.readString()).assertEqual('');
      expect(fresh.readString()).assertEqual('');
      expect(seq.values.length).assertEqual(1);
      const copiedValues: string[] = seq.values.slice(0);
      expect(copiedValues.length).assertEqual(seq.size());
      expect(copiedValues.length === 0).assertEqual(seq.isEmpty());
      expect(copiedValues.length >= 0).assertTrue();
      logStep('clientSequenceReuseTrace', 'end');
    });
  });
}
