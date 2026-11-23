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
import {
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  RequestResultModel,
  MessageSequenceModel,
  MessageOptionModel,
  WantModel,
  DeathRecipientModel,
  LogBuffer,
  ClientSnapshot,
  ClientMetrics,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  REPLY_PAYLOAD,
  REQUEST_PAYLOAD,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  INITIAL_CONNECT_ID,
  CONNECT_SUCCESS_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  OPTION_FLAG_ASYNC,
  OPTION_FLAG_SYNC,
  countOf
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

/** Snapshot of retained resources after one usage block. */
class UsageSample {
  public sessions: number;
  public sends: number;
  public liveSequences: number;
  public reclaimedSequences: number;
  public logSize: number;

  constructor(sessions: number, sends: number, liveSequences: number, reclaimedSequences: number, logSize: number) {
    this.sessions = sessions;
    this.sends = sends;
    this.liveSequences = liveSequences;
    this.reclaimedSequences = reclaimedSequences;
    this.logSize = logSize;
  }

  public totalSequences(): number {
    return this.liveSequences + this.reclaimedSequences;
  }

  public allReclaimed(): boolean {
    return this.liveSequences === 0 && this.reclaimedSequences > 0;
  }

  public describe(): string {
    return String(this.sessions) + '/' + String(this.sends) + '/' + String(this.liveSequences) + '/' +
      String(this.reclaimedSequences);
  }
}

/** Keeps a reference to a death recipient so identity across sessions can be checked. */
class DeathRecipientModelHolder {
  private recipient: DeathRecipientModel;

  constructor(client: ConnectionModel) {
    this.recipient = client.deathRecipient;
  }

  public same(client: ConnectionModel): boolean {
    return this.recipient === client.deathRecipient;
  }

  public diedCount(): number {
    return this.recipient.diedCount;
  }
}

function newClient(): ConnectionModel {
  return new ConnectionModel();
}
function openConnection(client: ConnectionModel, id: number, reply: string = REPLY_PAYLOAD): RemoteProxyModel {
  client.connect(id);
  const stub: RemoteStubModel = new RemoteStubModel();
  stub.replyText = reply;
  const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
  client.onConnect(proxy);
  return proxy;
}

function sendBurst(client: ConnectionModel, times: number, payload: string = REQUEST_PAYLOAD): RequestResultModel[] {
  const results: RequestResultModel[] = [];
  for (let index = 0; index < times; index++) {
    results.push(client.sendString(payload));
  }
  return results;
}

function successCount(results: RequestResultModel[]): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

function toastCount(client: ConnectionModel, text: string): number {
  return countOf(client.toasts, text);
}

function eventCount(client: ConnectionModel, kind: string): number {
  return client.events.countOf(kind);
}

/** Builds, fills and reclaims one sequence, returning its trace for inspection. */
function exerciseSequence(payload: string): MessageSequenceModel {
  const sequence: MessageSequenceModel = MessageSequenceModel.create();
  sequence.writeString(payload);
  sequence.readString();
  sequence.reclaim();
  return sequence;
}

function fillLog(buffer: LogBuffer, count: number): void {
  for (let index = 0; index < count; index++) {
    buffer.info('line-' + String(index));
  }
}

export default function memoryLeakDetection(): void {
  describe('MemoryLeakDetection', () => {
    beforeAll(() => {
      logSuite('MemoryLeakDetection', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('MemoryLeakDetection', 'end');
    });

    /**
     * @tc.name          memoryLeakSequenceReclaimBlocksWrites
     * @tc.desc          A reclaimed sequence refuses further writes.
     * @tc.precondition  A freshly created message sequence.
     * @tc.steps         1. Write one value.
     *                   2. Reclaim the sequence.
     *                   3. Attempt another write.
     * @tc.expected      The pre-reclaim write succeeds and the post-reclaim write is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakSequenceReclaimBlocksWrites', 0, () => {
      logStep('memoryLeakSequenceReclaimBlocksWrites', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      const first: boolean = sequence.writeString('before');
      sequence.reclaim();
      const second: boolean = sequence.writeString('after');
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.size()).assertEqual(1);
      expect(sequence.values[0]).assertEqual('before');
    });

    /**
     * @tc.name          memoryLeakSequenceReclaimBlocksReads
     * @tc.desc          A reclaimed sequence returns empty text for every read.
     * @tc.precondition  A sequence holding two written values.
     * @tc.steps         1. Write two values.
     *                   2. Reclaim the sequence.
     *                   3. Read twice.
     * @tc.expected      Both reads return empty strings and the read counter stays at zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakSequenceReclaimBlocksReads', 0, () => {
      logStep('memoryLeakSequenceReclaimBlocksReads', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('beta');
      sequence.reclaim();
      const firstRead: string = sequence.readString();
      const secondRead: string = sequence.readString();
      expect(firstRead).assertEqual('');
      expect(secondRead).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.isReclaimed()).assertTrue();
    });

    /**
     * @tc.name          memoryLeakSequenceReclaimResetsCursor
     * @tc.desc          Reclaiming a partially read sequence resets the cursor to zero.
     * @tc.precondition  A sequence with three values and one read performed.
     * @tc.steps         1. Write three values and read one.
     *                   2. Reclaim the sequence.
     *                   3. Inspect cursor and trace.
     * @tc.expected      The cursor returns to zero and the trace records the reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceReclaimResetsCursor', 0, () => {
      logStep('memoryLeakSequenceReclaimResetsCursor', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      sequence.writeString('three');
      const read: string = sequence.readString();
      const cursorBefore: number = sequence.cursor;
      sequence.reclaim();
      expect(read).assertEqual('one');
      expect(cursorBefore).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.trace()).assertEqual('one|two|three#0');
      expect(sequence.readString()).assertEqual('');
    });

    /**
     * @tc.name          memoryLeakSequenceReclaimIdempotent
     * @tc.desc          Reclaiming a sequence repeatedly leaves the same reclaimed state.
     * @tc.precondition  A sequence with one value.
     * @tc.steps         1. Write a value.
     *                   2. Reclaim three times.
     *                   3. Compare state and counters.
     * @tc.expected      The sequence stays reclaimed and counts do not change.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceReclaimIdempotent', 0, () => {
      logStep('memoryLeakSequenceReclaimIdempotent', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('value');
      sequence.reclaim();
      sequence.reclaim();
      sequence.reclaim();
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.trace()).assertEqual('value#0');
      expect(sequence.values.length).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakSequenceEmptyReadReturnsEmpty
     * @tc.desc          Reading an untouched sequence yields an empty string without advancing.
     * @tc.precondition  A newly created sequence.
     * @tc.steps         1. Read twice from the empty sequence.
     *                   2. Confirm the cursor and counters.
     *                   3. Write a value and read it.
     * @tc.expected      Empty reads do not advance state and the later value is readable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('memoryLeakSequenceEmptyReadReturnsEmpty', 0, () => {
      logStep('memoryLeakSequenceEmptyReadReturnsEmpty', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      const first: string = sequence.readString();
      const second: string = sequence.readString();
      sequence.writeString('later');
      const third: string = sequence.readString();
      expect(first).assertEqual('');
      expect(second).assertEqual('');
      expect(third).assertEqual('later');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.isEmpty()).assertFalse();
      expect(sequence.size()).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakSequenceRewindRereads
     * @tc.desc          Rewind restores the cursor without duplicating values or reclaiming memory.
     * @tc.precondition  A sequence with three values fully read.
     * @tc.steps         1. Write and read three values.
     *                   2. Rewind the sequence.
     *                   3. Read the first value again.
     * @tc.expected      The same first value is returned and the value list is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceRewindRereads', 0, () => {
      logStep('memoryLeakSequenceRewindRereads', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('a1');
      sequence.writeString('a2');
      sequence.writeString('a3');
      sequence.readString();
      sequence.readString();
      sequence.readString();
      const exhausted: string = sequence.readString();
      sequence.rewind();
      const reread: string = sequence.readString();
      expect(exhausted).assertEqual('');
      expect(reread).assertEqual('a1');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(4);
      expect(sequence.values.length).assertEqual(3);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          memoryLeakSequencesIndependent
     * @tc.desc          Reclaiming one sequence does not disturb another live sequence.
     * @tc.precondition  Two independently created sequences.
     * @tc.steps         1. Fill both with distinct values.
     *                   2. Reclaim the first.
     *                   3. Read from the second and confirm it still works.
     * @tc.expected      The second sequence remains readable after the first is reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequencesIndependent', 0, () => {
      logStep('memoryLeakSequencesIndependent', 'begin');
      const first: MessageSequenceModel = MessageSequenceModel.create();
      const second: MessageSequenceModel = MessageSequenceModel.create();
      first.writeString('first-value');
      second.writeString('second-value');
      first.reclaim();
      const readFirst: string = first.readString();
      const readSecond: string = second.readString();
      expect(readFirst).assertEqual('');
      expect(readSecond).assertEqual('second-value');
      expect(first.isReclaimed()).assertTrue();
      expect(second.isReclaimed()).assertFalse();
      expect(second.cursor).assertEqual(1);
      expect(second.readCount).assertEqual(1);
      expect(first === second).assertFalse();
    });

    /**
     * @tc.name          memoryLeakSequenceTraceFormat
     * @tc.desc          The sequence trace joins values with a pipe and appends the cursor.
     * @tc.precondition  A sequence with two written values.
     * @tc.steps         1. Write two values.
     *                   2. Read one value.
     *                   3. Inspect the trace string.
     * @tc.expected      The trace reads value-one, value-two and the cursor one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakSequenceTraceFormat', 0, () => {
      logStep('memoryLeakSequenceTraceFormat', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      expect(sequence.trace()).assertEqual('#0');
      sequence.writeString('value-one');
      sequence.writeString('value-two');
      const before: string = sequence.trace();
      sequence.readString();
      const after: string = sequence.trace();
      expect(before).assertEqual('value-one|value-two#0');
      expect(after).assertEqual('value-one|value-two#1');
      expect(after.endsWith('#1')).assertTrue();
      expect(before.indexOf('|') >= 0).assertTrue();
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.readCount).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakHundredSequencesReclaimed
     * @tc.desc          One hundred created sequences are all reclaimed and release their cursors.
     * @tc.precondition  A loop bound of one hundred.
     * @tc.steps         1. Create, fill and reclaim one hundred sequences.
     *                   2. Count reclaimed instances.
     *                   3. Confirm every sequence refuses reads.
     * @tc.expected      All one hundred sequences report reclaimed and empty reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakHundredSequencesReclaimed', 0, () => {
      logStep('memoryLeakHundredSequencesReclaimed', 'begin');
      const sequences: MessageSequenceModel[] = [];
      for (let index = 0; index < 100; index++) {
        sequences.push(exerciseSequence('payload-' + String(index)));
      }
      let reclaimed: number = 0;
      let emptyReads: number = 0;
      for (let index = 0; index < sequences.length; index++) {
        if (sequences[index].isReclaimed()) {
          reclaimed = reclaimed + 1;
        }
        if (sequences[index].readString() === '') {
          emptyReads = emptyReads + 1;
        }
      }
      expect(sequences.length).assertEqual(100);
      expect(reclaimed).assertEqual(100);
      expect(emptyReads).assertEqual(100);
      expect(sequences[0].cursor).assertEqual(0);
      expect(sequences[99].cursor).assertEqual(0);
      expect(sequences[50].values[0]).assertEqual('payload-50');
    });

    /**
     * @tc.name          memoryLeakSendLoopReclaimsBuffers
     * @tc.desc          Every client send reclaims its request and reply buffers internally.
     * @tc.precondition  A connected client with a live stub.
     * @tc.steps         1. Send ten requests.
     *                   2. Confirm each result is successful.
     *                   3. Verify the returned reply can be reclaimed explicitly.
     * @tc.expected      Ten replies arrive and explicit reclaim silences the result reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSendLoopReclaimsBuffers', 0, () => {
      logStep('memoryLeakSendLoopReclaimsBuffers', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 901);
      const results: RequestResultModel[] = sendBurst(client, 10);
      const firstReply: string = results[0].readReply();
      results[0].reply.reclaim();
      const secondReply: string = results[0].readReply();
      expect(successCount(results)).assertEqual(10);
      expect(firstReply).assertEqual(REPLY_PAYLOAD);
      expect(secondReply).assertEqual('');
      expect(results[0].reply.isReclaimed()).assertTrue();
      expect(results[1].reply.isReclaimed()).assertFalse();
      expect(results[9].isSuccess()).assertTrue();
      expect(client.logs.size()).assertEqual(12);
    });

    /**
     * @tc.name          memoryLeakReplyMirrorsPayload
     * @tc.desc          Every result reply carries the stub payload and reclaims cleanly.
     * @tc.precondition  A connected client with a custom stub reply.
     * @tc.steps         1. Send three requests.
     *                   2. Read the reply of each result.
     *                   3. Reclaim all replies.
     * @tc.expected      All three replies read the payload and become empty after reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakReplyMirrorsPayload', 0, () => {
      logStep('memoryLeakReplyMirrorsPayload', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 902, 'custom-reply');
      const results: RequestResultModel[] = sendBurst(client, 3);
      const first: string = results[0].readReply();
      const second: string = results[1].readReply();
      expect(first).assertEqual('custom-reply');
      expect(second).assertEqual('custom-reply');
      expect(results[2].readReply()).assertEqual('custom-reply');
      for (let index = 0; index < results.length; index++) {
        results[index].reply.reclaim();
      }
      expect(results[0].readReply()).assertEqual('');
      expect(results[1].reply.isReclaimed()).assertTrue();
      expect(results[2].reply.size()).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakLogBufferCapEnforced
     * @tc.desc          A standalone log buffer never exceeds its configured limit.
     * @tc.precondition  A log buffer with a limit of sixty-four.
     * @tc.steps         1. Append one hundred and twenty info lines.
     *                   2. Inspect size, levels and lines.
     *                   3. Verify the retained tail.
     * @tc.expected      The buffer holds exactly sixty-four lines ending with the latest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogBufferCapEnforced', 0, () => {
      logStep('memoryLeakLogBufferCapEnforced', 'begin');
      const buffer: LogBuffer = new LogBuffer(64);
      fillLog(buffer, 120);
      expect(buffer.size()).assertEqual(64);
      expect(buffer.limit).assertEqual(64);
      expect(buffer.levels.length).assertEqual(64);
      expect(buffer.lines.length).assertEqual(64);
      expect(buffer.lines[63]).assertEqual('INFO line-119');
      expect(buffer.lines[0]).assertEqual('INFO line-56');
      expect(buffer.countLevel('INFO')).assertEqual(64);
      expect(buffer.contains('line-0')).assertFalse();
    });

    /**
     * @tc.name          memoryLeakLogBufferClearReleases
     * @tc.desc          Clearing a saturated log buffer releases all retained lines and levels.
     * @tc.precondition  A buffer filled past its cap.
     * @tc.steps         1. Fill the buffer.
     *                   2. Clear it.
     *                   3. Append one line and inspect.
     * @tc.expected      Both arrays empty after clear and accept a fresh line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogBufferClearReleases', 0, () => {
      logStep('memoryLeakLogBufferClearReleases', 'begin');
      const buffer: LogBuffer = new LogBuffer(32);
      fillLog(buffer, 50);
      expect(buffer.size()).assertEqual(32);
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      buffer.warn('after-clear');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('WARN after-clear');
      expect(buffer.countLevel('WARN')).assertEqual(1);
      expect(buffer.contains('line-10')).assertFalse();
    });

    /**
     * @tc.name          memoryLeakLogLevelsMatchLines
     * @tc.desc          Level and line arrays stay index-aligned through trimming.
     * @tc.precondition  A buffer with a limit of ten.
     * @tc.steps         1. Append four info, three warn and five error lines.
     *                   2. Compare counts with the retained lines.
     *                   3. Verify each line starts with its level.
     * @tc.expected      Level counts sum to the size and every prefix matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakLogLevelsMatchLines', 0, () => {
      logStep('memoryLeakLogLevelsMatchLines', 'begin');
      const buffer: LogBuffer = new LogBuffer(10);
      for (let index = 0; index < 4; index++) {
        buffer.info('i' + String(index));
      }
      for (let index = 0; index < 3; index++) {
        buffer.warn('w' + String(index));
      }
      for (let index = 0; index < 5; index++) {
        buffer.error('e' + String(index));
      }
      let aligned: boolean = true;
      for (let index = 0; index < buffer.size(); index++) {
        if (!buffer.lines[index].startsWith(buffer.levels[index] + ' ')) {
          aligned = false;
        }
      }
      expect(aligned).assertTrue();
      expect(buffer.size()).assertEqual(10);
      expect(buffer.countLevel('INFO') + buffer.countLevel('WARN') + buffer.countLevel('ERROR')).assertEqual(10);
      expect(buffer.countLevel('ERROR')).assertEqual(5);
      expect(buffer.countLevel('WARN')).assertEqual(3);
      expect(buffer.countLevel('INFO')).assertEqual(2);
      expect(buffer.lines[9]).assertEqual('ERROR e4');
    });

    /**
     * @tc.name          memoryLeakLogTrimKeepsNewestTail
     * @tc.desc          Trimming discards the oldest entries and preserves insertion order of the rest.
     * @tc.precondition  A buffer with a limit of five.
     * @tc.steps         1. Append eight numbered lines.
     *                   2. Read the retained lines.
     *                   3. Confirm ordering and boundaries.
     * @tc.expected      Lines three through seven are retained in ascending order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakLogTrimKeepsNewestTail', 0, () => {
      logStep('memoryLeakLogTrimKeepsNewestTail', 'begin');
      const buffer: LogBuffer = new LogBuffer(5);
      for (let index = 0; index < 8; index++) {
        buffer.info('n' + String(index));
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.lines[0]).assertEqual('INFO n3');
      expect(buffer.lines[4]).assertEqual('INFO n7');
      expect(buffer.lines.join('|')).assertEqual('INFO n3|INFO n4|INFO n5|INFO n6|INFO n7');
      expect(buffer.contains('n2')).assertFalse();
      expect(buffer.contains('n3')).assertTrue();
      expect(buffer.trace().indexOf('n7')).assertEqual(buffer.trace().length - 2);
      expect(buffer.countLevel('INFO')).assertEqual(5);
    });

    /**
     * @tc.name          memoryLeakLogContainsAfterTrim
     * @tc.desc          Contains reports only entries still retained after trimming.
     * @tc.precondition  A buffer with a limit of six that has been overflowed.
     * @tc.steps         1. Append twelve lines with distinct markers.
     *                   2. Probe markers from the evicted and retained ranges.
     *                   3. Compare with direct array inspection.
     * @tc.expected      Evicted markers are absent while retained markers are found.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakLogContainsAfterTrim', 0, () => {
      logStep('memoryLeakLogContainsAfterTrim', 'begin');
      const buffer: LogBuffer = new LogBuffer(6);
      for (let index = 0; index < 12; index++) {
        buffer.info('marker-' + String(index));
      }
      expect(buffer.size()).assertEqual(6);
      expect(buffer.contains('marker-5')).assertFalse();
      expect(buffer.contains('marker-6')).assertTrue();
      expect(buffer.contains('marker-11')).assertTrue();
      expect(buffer.lines[0]).assertEqual('INFO marker-6');
      expect(buffer.levels[5]).assertEqual('INFO');
      expect(buffer.countLevel('ERROR')).assertEqual(0);
      expect(buffer.trace().startsWith('INFO marker-6')).assertTrue();
    });

    /**
     * @tc.name          memoryLeakToastHistoryAppendOnly
     * @tc.desc          Toast history is append-only and never silently drops entries.
     * @tc.precondition  A connected client with one hundred sends.
     * @tc.steps         1. Send one hundred requests.
     *                   2. Compare the toast total with the operation total.
     *                   3. Verify the first and last entries.
     * @tc.expected      The history holds one connect plus one hundred send toasts in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakToastHistoryAppendOnly', 0, () => {
      logStep('memoryLeakToastHistoryAppendOnly', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 903);
      sendBurst(client, 150);
      expect(client.toasts.length).assertEqual(151);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[100]).assertEqual(SEND_SUCCESS_TOAST);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(150);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(0);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.length > client.logs.size()).assertTrue();
    });

    /**
     * @tc.name          memoryLeakRepeatedSessionsNoProxyLeak
     * @tc.desc          Ten sessions leave no proxy binding or recipient registration behind.
     * @tc.precondition  An empty client and a ten-cycle plan.
     * @tc.steps         1. In each cycle open, send four, disconnect and send once.
     *                   2. Verify the binding is cleared after each cycle.
     *                   3. Count the final toasts and events.
     * @tc.expected      No proxy survives the loop and every cycle produces seven toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakRepeatedSessionsNoProxyLeak', 0, () => {
      logStep('memoryLeakRepeatedSessionsNoProxyLeak', 'begin');
      const client: ConnectionModel = newClient();
      let leaked: number = 0;
      for (let cycle = 0; cycle < 10; cycle++) {
        openConnection(client, 910 + cycle);
        sendBurst(client, 4);
        client.onDisconnect();
        client.sendString('post-disconnect');
        if (client.proxy !== undefined) {
          leaked = leaked + 1;
        }
      }
      expect(leaked).assertEqual(0);
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.toasts.length).assertEqual(70);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(10);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(10);
      expect(eventCount(client, 'send-ok')).assertEqual(40);
      expect(client.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          memoryLeakProxyReleasedAfterDisconnect
     * @tc.desc          Disconnect detaches the proxy and clears its death registration.
     * @tc.precondition  A connected client with a captured proxy reference.
     * @tc.steps         1. Open a session and keep a reference to the proxy.
     *                   2. Disconnect.
     *                   3. Inspect the client and proxy registration state.
     * @tc.expected      The client holds no proxy and the old proxy no longer has a recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakProxyReleasedAfterDisconnect', 0, () => {
      logStep('memoryLeakProxyReleasedAfterDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 920);
      expect(proxy.deathRegistered).assertTrue();
      client.onDisconnect();
      expect(client.proxy).assertUndefined();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient).assertUndefined();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(proxy.sendCalls).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakDeathRecipientReleased
     * @tc.desc          The death recipient is unregistered but preserved for the next session.
     * @tc.precondition  A connected client with a registered recipient.
     * @tc.steps         1. Capture the recipient instance.
     *                   2. Disconnect and reconnect.
     *                   3. Confirm the recipient is reused and registered again.
     * @tc.expected      The recipient identity is stable across sessions and registered again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakDeathRecipientReleased', 0, () => {
      logStep('memoryLeakDeathRecipientReleased', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 930);
      const recipient: DeathRecipientModelHolder = new DeathRecipientModelHolder(client);
      client.onDisconnect();
      expect(client.deathRecipient.registered).assertFalse();
      openConnection(client, 931);
      expect(recipient.same(client)).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(2);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          memoryLeakResetReleasesBuffers
     * @tc.desc          Reset drops the log, toast and event buffers and replaces the recipient.
     * @tc.precondition  A client with saturated buffers.
     * @tc.steps         1. Fill the log, toast and event buffers.
     *                   2. Capture the recipient instance.
     *                   3. Reset and compare all buffers.
     * @tc.expected      All buffers are empty and the recipient object is replaced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakResetReleasesBuffers', 0, () => {
      logStep('memoryLeakResetReleasesBuffers', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 940);
      sendBurst(client, 300);
      expect(client.logs.size()).assertEqual(128);
      expect(client.toasts.length).assertEqual(301);
      const recipientBefore: DeathRecipientModel = client.deathRecipient;
      client.reset();
      expect(client.logs.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.deathRecipient === recipientBefore).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.proxy).assertUndefined();
      expect(client.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          memoryLeakSnapshotAfterResetClean
     * @tc.desc          A post-reset snapshot reports a fully released client.
     * @tc.precondition  A client that completed a large session.
     * @tc.steps         1. Run a large session.
     *                   2. Reset.
     *                   3. Capture and inspect the snapshot.
     * @tc.expected      The snapshot reports no proxy, no toasts and the initial id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakSnapshotAfterResetClean', 0, () => {
      logStep('memoryLeakSnapshotAfterResetClean', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 950);
      sendBurst(client, 60);
      client.reset();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(0);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/0');
      expect(ClientMetrics.from(client).sends).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakSessionCountMatchesToasts
     * @tc.desc          Session count and lifecycle toast totals stay in a fixed ratio.
     * @tc.precondition  An empty client and a seven-session plan.
     * @tc.steps         1. Run seven sessions without requests.
     *                   2. Count connect and disconnect toasts.
     *                   3. Compare with the session count.
     * @tc.expected      Each session contributes exactly one connect and one disconnect toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSessionCountMatchesToasts', 0, () => {
      logStep('memoryLeakSessionCountMatchesToasts', 'begin');
      const client: ConnectionModel = newClient();
      const sessions: number = 7;
      for (let cycle = 0; cycle < sessions; cycle++) {
        openConnection(client, 960 + cycle);
        client.onDisconnect();
      }
      expect(client.toasts.length).assertEqual(sessions * 2);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(sessions);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(sessions);
      expect(eventCount(client, 'connected')).assertEqual(sessions);
      expect(eventCount(client, 'disconnected')).assertEqual(sessions);
      expect(client.connectCalls).assertEqual(sessions);
      expect(client.proxy).assertUndefined();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          memoryLeakMetricsAfterManyResets
     * @tc.desc          Repeated resets never let stale metrics leak into a later measurement.
     * @tc.precondition  An empty client and five reset cycles.
     * @tc.steps         1. In each cycle send five requests and reset.
     *                   2. Capture metrics after each reset.
     *                   3. Confirm every measurement is zero.
     * @tc.expected      All five post-reset metrics snapshots report zero sends and replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakMetricsAfterManyResets', 0, () => {
      logStep('memoryLeakMetricsAfterManyResets', 'begin');
      const client: ConnectionModel = newClient();
      const samples: number[] = [];
      for (let cycle = 0; cycle < 5; cycle++) {
        openConnection(client, 970 + cycle);
        sendBurst(client, 5);
        client.reset();
        samples.push(ClientMetrics.from(client).sends + ClientMetrics.from(client).replies);
      }
      expect(samples.length).assertEqual(5);
      expect(samples[0]).assertEqual(0);
      expect(samples[4]).assertEqual(0);
      expect(samples.join(',')).assertEqual('0,0,0,0,0');
      expect(ClientMetrics.from(client).connects).assertEqual(0);
      expect(ClientMetrics.from(client).fingerprint()).assertEqual(ClientMetrics.from(newClient()).fingerprint());
      expect(client.toasts.length).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakReclaimedSequenceStaysEmpty
     * @tc.desc          A reclaimed sequence stays unreadable even after a rewind.
     * @tc.precondition  A reclaimed sequence with retained values.
     * @tc.steps         1. Reclaim a filled sequence.
     *                   2. Rewind it.
     *                   3. Attempt reads and writes.
     * @tc.expected      Rewind does not restore readability and writes remain refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakReclaimedSequenceStaysEmpty', 0, () => {
      logStep('memoryLeakReclaimedSequenceStaysEmpty', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('retained');
      sequence.reclaim();
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.writeString('refused')).assertFalse();
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.values[0]).assertEqual('retained');
    });

    /**
     * @tc.name          memoryLeakUsageSampleArithmetic
     * @tc.desc          Usage samples sum live and reclaimed sequences without double counting.
     * @tc.precondition  A constructed usage sample.
     * @tc.steps         1. Build a sample with four sessions and sixty sends.
     *                   2. Compare totals and flags.
     *                   3. Build a second sample with live sequences.
     * @tc.expected      Totals add up and the reclaimed flag depends on live sequences.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakUsageSampleArithmetic', 0, () => {
      logStep('memoryLeakUsageSampleArithmetic', 'begin');
      const clean: UsageSample = new UsageSample(4, 60, 0, 12, 40);
      const dirty: UsageSample = new UsageSample(2, 10, 3, 5, 8);
      expect(clean.totalSequences()).assertEqual(12);
      expect(clean.allReclaimed()).assertTrue();
      expect(dirty.totalSequences()).assertEqual(8);
      expect(dirty.allReclaimed()).assertFalse();
      expect(clean.describe()).assertEqual('4/60/0/12');
      expect(dirty.sessions + clean.sessions).assertEqual(6);
      expect(clean.sends).assertEqual(60);
      expect(dirty.liveSequences).assertEqual(3);
    });

    /**
     * @tc.name          memoryLeakRequestListPerSession
     * @tc.desc          Each session retains only its own proxy request list.
     * @tc.precondition  An empty client and two sessions of different sizes.
     * @tc.steps         1. Open the first session and send three requests.
     *                   2. Close it, open the second and send one request.
     *                   3. Compare both request lists.
     * @tc.expected      The first list holds three entries and the second holds one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakRequestListPerSession', 0, () => {
      logStep('memoryLeakRequestListPerSession', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 980);
      sendBurst(client, 3);
      client.onDisconnect();
      const second: RemoteProxyModel = openConnection(client, 981);
      sendBurst(client, 1);
      expect(first.requests.length).assertEqual(3);
      expect(second.requests.length).assertEqual(1);
      expect(first.stub.receivedTexts.length).assertEqual(3);
      expect(second.stub.receivedTexts.length).assertEqual(1);
      expect(first === second).assertFalse();
      expect(second.requests[0]).assertEqual(1);
      expect(client.proxy).assertEqual(second);
    });

    /**
     * @tc.name          memoryLeakStubTextsWithinSession
     * @tc.desc          The stub retains received text only for the lifetime of its session.
     * @tc.precondition  Two sessions with separate stubs.
     * @tc.steps         1. Send two texts in the first session.
     *                   2. Send one text in the second session.
     *                   3. Compare the stub receipt lists.
     * @tc.expected      The first stub keeps two texts and the second keeps only its own.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakStubTextsWithinSession', 0, () => {
      logStep('memoryLeakStubTextsWithinSession', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 990);
      client.sendString('first-a');
      client.sendString('first-b');
      client.onDisconnect();
      const second: RemoteProxyModel = openConnection(client, 991);
      client.sendString('second-a');
      expect(first.stub.receivedTexts.length).assertEqual(2);
      expect(second.stub.receivedTexts.length).assertEqual(1);
      expect(first.stub.receivedTexts[0]).assertEqual('first-a');
      expect(second.stub.receivedTexts[0]).assertEqual('second-a');
      expect(second.stub.receivedTexts.indexOf('first-a')).assertEqual(-1);
      expect(first.stub.handledCodes.length).assertEqual(2);
      expect(second.stub.handledCodes.length).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakOptionCloneIndependent
     * @tc.desc          Cloning a message option produces an independent copy.
     * @tc.precondition  An async option with a wait time.
     * @tc.steps         1. Build and clone the option.
     *                   2. Change the clone.
     *                   3. Compare both objects.
     * @tc.expected      The clone changes without affecting the original.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakOptionCloneIndependent', 0, () => {
      logStep('memoryLeakOptionCloneIndependent', 'begin');
      const original: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 50, false);
      const clone: MessageOptionModel = original.clone();
      clone.flags = OPTION_FLAG_SYNC;
      clone.waitTime = 99;
      expect(original.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(original.waitTime).assertEqual(50);
      expect(clone.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(clone.waitTime).assertEqual(99);
      expect(original.describe()).assertEqual('1/50/false');
      expect(clone.describe()).assertEqual('0/99/false');
      expect(original === clone).assertFalse();
    });

    /**
     * @tc.name          memoryLeakOptionSyncAsyncFlags
     * @tc.desc          Option flags map to the sync and async predicates consistently.
     * @tc.precondition  Three option variants.
     * @tc.steps         1. Build a default, an explicit async and a forced sync option.
     *                   2. Evaluate both predicates on each.
     *                   3. Compare the results.
     * @tc.expected      Sync and async predicates are always complementary.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakOptionSyncAsyncFlags', 0, () => {
      logStep('memoryLeakOptionSyncAsyncFlags', 'begin');
      const byDefault: MessageOptionModel = new MessageOptionModel();
      const asyncOption: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 10, false);
      const forcedSync: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 10, true);
      expect(byDefault.isSync()).assertTrue();
      expect(byDefault.isAsync()).assertFalse();
      expect(asyncOption.isSync()).assertFalse();
      expect(asyncOption.isAsync()).assertTrue();
      expect(forcedSync.isSync()).assertTrue();
      expect(forcedSync.isAsync()).assertFalse();
      expect(byDefault.describe()).assertEqual('0/0/false');
      expect(asyncOption.describe()).assertEqual('1/10/false');
    });

    /**
     * @tc.name          memoryLeakWantValidationErrors
     * @tc.desc          Want validation reports empty names and embedded spaces.
     * @tc.precondition  Three malformed want instances.
     * @tc.steps         1. Validate an empty want, a spaced want and a valid want.
     *                   2. Compare the error lists.
     *                   3. Confirm the valid want reports none.
     * @tc.expected      Each malformed want reports its own errors and the valid one reports zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakWantValidationErrors', 0, () => {
      logStep('memoryLeakWantValidationErrors', 'begin');
      const empty: WantModel = new WantModel('', '');
      const spaced: WantModel = new WantModel('has space', 'Ability Name');
      const valid: WantModel = new WantModel('com.example.ipc_stub', 'ServiceAbility');
      expect(empty.validate().length).assertEqual(2);
      expect(spaced.validate().length).assertEqual(2);
      expect(valid.validate().length).assertEqual(0);
      expect(spaced.validate()[0]).assertEqual('bundle-has-space');
      expect(spaced.validate()[1]).assertEqual('ability-has-space');
      expect(empty.validate()[0]).assertEqual('bundle-empty');
      expect(valid.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
    });

    /**
     * @tc.name          memoryLeakWantMatchesTarget
     * @tc.desc          Want equality compares bundle and ability names together.
     * @tc.precondition  A target want and three candidates.
     * @tc.steps         1. Compare an exact copy and two mismatches.
     *                   2. Inspect each boolean result.
     *                   3. Confirm the target description.
     * @tc.expected      Only the exact copy matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakWantMatchesTarget', 0, () => {
      logStep('memoryLeakWantMatchesTarget', 'begin');
      const target: WantModel = new WantModel('com.example.ipc_stub', 'ServiceAbility');
      const exact: WantModel = new WantModel('com.example.ipc_stub', 'ServiceAbility');
      const wrongBundle: WantModel = new WantModel('com.example.other', 'ServiceAbility');
      const wrongAbility: WantModel = new WantModel('com.example.ipc_stub', 'OtherAbility');
      expect(target.matches(exact)).assertTrue();
      expect(target.matches(wrongBundle)).assertFalse();
      expect(target.matches(wrongAbility)).assertFalse();
      expect(exact.matches(target)).assertTrue();
      expect(target.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(wrongBundle.bundleName).assertEqual('com.example.other');
      expect(wrongAbility.abilityName).assertEqual('OtherAbility');
    });

    /**
     * @tc.name          memoryLeakLogBufferSingleSlot
     * @tc.desc          A single-slot log buffer retains only the newest line.
     * @tc.precondition  A log buffer with a limit of one.
     * @tc.steps         1. Append four lines of mixed levels.
     *                   2. Inspect size, content and levels.
     *                   3. Confirm the last line survives.
     * @tc.expected      The buffer holds exactly the final error line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogBufferSingleSlot', 0, () => {
      logStep('memoryLeakLogBufferSingleSlot', 'begin');
      const buffer: LogBuffer = new LogBuffer(1);
      buffer.info('first');
      buffer.warn('second');
      buffer.info('third');
      buffer.error('fourth');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('ERROR fourth');
      expect(buffer.levels[0]).assertEqual('ERROR');
      expect(buffer.countLevel('INFO')).assertEqual(0);
      expect(buffer.countLevel('WARN')).assertEqual(0);
      expect(buffer.countLevel('ERROR')).assertEqual(1);
      expect(buffer.contains('third')).assertFalse();
      expect(buffer.trace()).assertEqual('ERROR fourth');
    });

    /**
     * @tc.name          memoryLeakLogBufferDefaultLimit
     * @tc.desc          The default log buffer limit is sixty-four lines.
     * @tc.precondition  A default-constructed log buffer.
     * @tc.steps         1. Confirm the initial size.
     *                   2. Append seventy lines.
     *                   3. Compare size and boundary content.
     * @tc.expected      The buffer caps at sixty-four and retains the newest lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakLogBufferDefaultLimit', 0, () => {
      logStep('memoryLeakLogBufferDefaultLimit', 'begin');
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.limit).assertEqual(64);
      expect(buffer.size()).assertEqual(0);
      fillLog(buffer, 70);
      expect(buffer.size()).assertEqual(64);
      expect(buffer.lines[0]).assertEqual('INFO line-6');
      expect(buffer.lines[63]).assertEqual('INFO line-69');
      expect(buffer.lines.indexOf('INFO line-5') >= 0).assertFalse();
      expect(buffer.contains('line-6')).assertTrue();
      expect(buffer.countLevel('INFO')).assertEqual(64);
    });

    /**
     * @tc.name          memoryLeakLogBufferMixedLevelTrim
     * @tc.desc          Trimmed mixed-level buffers keep level counts consistent with retained lines.
     * @tc.precondition  A buffer with a limit of four.
     * @tc.steps         1. Append alternating info and error lines.
     *                   2. Inspect the retained window.
     *                   3. Recompute the level totals.
     * @tc.expected      The retained window holds the last two info and two error lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakLogBufferMixedLevelTrim', 0, () => {
      logStep('memoryLeakLogBufferMixedLevelTrim', 'begin');
      const buffer: LogBuffer = new LogBuffer(4);
      for (let index = 0; index < 6; index++) {
        buffer.info('info-' + String(index));
        buffer.error('error-' + String(index));
      }
      expect(buffer.size()).assertEqual(4);
      expect(buffer.countLevel('INFO')).assertEqual(2);
      expect(buffer.countLevel('ERROR')).assertEqual(2);
      expect(buffer.lines[0]).assertEqual('INFO info-4');
      expect(buffer.lines[1]).assertEqual('ERROR error-4');
      expect(buffer.lines[3]).assertEqual('ERROR error-5');
      expect(buffer.contains('info-0')).assertFalse();
      expect(buffer.contains('info-4')).assertTrue();
    });

    /**
     * @tc.name          memoryLeakClientLogLimitFixed
     * @tc.desc          The client-owned log buffer keeps its fixed limit of 128 through a long run.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Read the limit before sending.
     *                   2. Send three hundred requests.
     *                   3. Confirm the limit never changed.
     * @tc.expected      The limit stays at 128 while the retained size saturates at 128.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakClientLogLimitFixed', 0, () => {
      logStep('memoryLeakClientLogLimitFixed', 'begin');
      const client: ConnectionModel = newClient();
      const limitBefore: number = client.logs.limit;
      openConnection(client, 1001);
      sendBurst(client, 300);
      expect(limitBefore).assertEqual(128);
      expect(client.logs.limit).assertEqual(128);
      expect(client.logs.size()).assertEqual(128);
      expect(client.logs.lines.length).assertEqual(128);
      expect(client.logs.levels.length).assertEqual(128);
      expect(client.logs.countLevel('INFO')).assertEqual(128);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          memoryLeakHealthyLogHasNoWarnings
     * @tc.desc          A healthy session records only info lines and never an error line.
     * @tc.precondition  A connected client with fifty sends.
     * @tc.steps         1. Send fifty requests.
     *                   2. Count each level.
     *                   3. Reconcile the total with the buffer size.
     * @tc.expected      The warnings and errors are zero and the info count matches the size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakHealthyLogHasNoWarnings', 0, () => {
      logStep('memoryLeakHealthyLogHasNoWarnings', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1002);
      sendBurst(client, 50);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.countLevel('INFO')).assertEqual(client.logs.size());
      expect(client.logs.size()).assertEqual(52);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.contains('proxy is invalid')).assertFalse();
      expect(client.logs.trace().indexOf('ERROR')).assertEqual(-1);
    });

    /**
     * @tc.name          memoryLeakEventRecorderClearReleases
     * @tc.desc          Clearing the event recorder drops every retained entry and fingerprint.
     * @tc.precondition  A client with a populated event recorder.
     * @tc.steps         1. Record several events through a session.
     *                   2. Clear the recorder.
     *                   3. Compare size, trace and fingerprint.
     * @tc.expected      The recorder is empty, its trace is empty and the fingerprint is the empty hash.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakEventRecorderClearReleases', 0, () => {
      logStep('memoryLeakEventRecorderClearReleases', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1003);
      sendBurst(client, 6);
      expect(client.events.size()).assertEqual(9);
      const refresh: number = newClient().events.fingerprint();
      client.events.clear();
      expect(client.events.size()).assertEqual(0);
      expect(client.events.trace()).assertEqual('');
      expect(client.events.last()).assertEqual('');
      expect(client.events.fingerprint()).assertEqual(refresh);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.toasts.length).assertEqual(7);
    });

    /**
     * @tc.name          memoryLeakEventRecorderRebuildAfterClear
     * @tc.desc          A cleared event recorder accepts new entries in a fresh order.
     * @tc.precondition  A client whose recorder was cleared mid-session.
     * @tc.steps         1. Build history and clear the recorder.
     *                   2. Send two requests.
     *                   3. Inspect the rebuilt trace.
     * @tc.expected      Only the two new send events remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakEventRecorderRebuildAfterClear', 0, () => {
      logStep('memoryLeakEventRecorderRebuildAfterClear', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1004);
      sendBurst(client, 4);
      client.events.clear();
      sendBurst(client, 2);
      expect(client.events.size()).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(0);
      expect(client.events.entries[0]).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.events.fingerprint() > 0).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          memoryLeakSnapshotIdentityStable
     * @tc.desc          Repeated snapshots of an idle client compare equal without allocating state.
     * @tc.precondition  A connected idle client.
     * @tc.steps         1. Capture three snapshots in a row.
     *                   2. Compare them pairwise.
     *                   3. Confirm the toast count is unchanged.
     * @tc.expected      All three snapshots are equal and no toast was added.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakSnapshotIdentityStable', 0, () => {
      logStep('memoryLeakSnapshotIdentityStable', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1005);
      const first: ClientSnapshot = new ClientSnapshot(client);
      const second: ClientSnapshot = new ClientSnapshot(client);
      const third: ClientSnapshot = new ClientSnapshot(client);
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(third)).assertTrue();
      expect(first.describe()).assertEqual(third.describe());
      expect(first.toastCount).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(first.hasProxy).assertTrue();
      expect(first.connectId).assertEqual(1005);
    });

    /**
     * @tc.name          memoryLeakFailureKeepsProxyBound
     * @tc.desc          A failed dispatch leaves the proxy binding and registration intact.
     * @tc.precondition  A connected client with an armed one-shot failure.
     * @tc.steps         1. Arm the proxy and send once.
     *                   2. Inspect the binding and registration.
     *                   3. Send again and confirm recovery.
     * @tc.expected      The proxy stays bound and the next request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakFailureKeepsProxyBound', 0, () => {
      logStep('memoryLeakFailureKeepsProxyBound', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 1006);
      proxy.failNextSend = ERROR_SEND;
      const failed: RequestResultModel = client.sendString('will-fail');
      const recovered: RequestResultModel = client.sendString('will-work');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(client.proxy).assertEqual(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          memoryLeakTwoClientsBuffersIndependent
     * @tc.desc          Buffer usage on one client never appears on a second client.
     * @tc.precondition  Two clients, one heavily used and one idle.
     * @tc.steps         1. Fill the first client with two hundred sends.
     *                   2. Inspect the second client buffers.
     *                   3. Compare sizes and capacity.
     * @tc.expected      The idle client keeps empty buffers and its own capacity.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakTwoClientsBuffersIndependent', 0, () => {
      logStep('memoryLeakTwoClientsBuffersIndependent', 'begin');
      const busy: ConnectionModel = newClient();
      const idle: ConnectionModel = newClient();
      openConnection(busy, 1007);
      sendBurst(busy, 200);
      expect(idle.logs.size()).assertEqual(0);
      expect(idle.toasts.length).assertEqual(0);
      expect(idle.events.size()).assertEqual(0);
      expect(idle.connectCalls).assertEqual(0);
      expect(busy.logs.size()).assertEqual(128);
      expect(busy.toasts.length).assertEqual(201);
      expect(busy.logs === idle.logs).assertFalse();
      expect(idle.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          memoryLeakResetThenFreshSessionClean
     * @tc.desc          A fresh session after reset retains only its own log lines.
     * @tc.precondition  A client that completed a session and was reset.
     * @tc.steps         1. Run a session with one hundred sends.
     *                   2. Reset and open a new session with five sends.
     *                   3. Inspect the log window.
     * @tc.expected      The log holds only the seven lines of the new session.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakResetThenFreshSessionClean', 0, () => {
      logStep('memoryLeakResetThenFreshSessionClean', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1008);
      sendBurst(client, 100);
      client.reset();
      openConnection(client, 1009);
      sendBurst(client, 5);
      expect(client.logs.size()).assertEqual(7);
      expect(client.logs.countLevel('INFO')).assertEqual(7);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(6);
      expect(client.events.size()).assertEqual(8);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.size() < client.logs.limit).assertTrue();
    });

    /**
     * @tc.name          memoryLeakSequenceCursorBoundaries
     * @tc.desc          Cursor movement stops exactly at the number of written values.
     * @tc.precondition  A sequence with five written values.
     * @tc.steps         1. Read five values.
     *                   2. Read a sixth time.
     *                   3. Compare cursor and read counter.
     * @tc.expected      The cursor and read counter both stop at five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceCursorBoundaries', 0, () => {
      logStep('memoryLeakSequenceCursorBoundaries', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      for (let index = 0; index < 5; index++) {
        sequence.writeString('item-' + String(index));
      }
      const reads: string[] = [];
      for (let index = 0; index < 6; index++) {
        reads.push(sequence.readString());
      }
      expect(reads.length).assertEqual(6);
      expect(reads[0]).assertEqual('item-0');
      expect(reads[4]).assertEqual('item-4');
      expect(reads[5]).assertEqual('');
      expect(sequence.cursor).assertEqual(5);
      expect(sequence.readCount).assertEqual(5);
      expect(sequence.size()).assertEqual(5);
    });

    /**
     * @tc.name          memoryLeakResultRepliesIndependent
     * @tc.desc          Two request results own independent reply buffers.
     * @tc.precondition  A connected client with two sends.
     * @tc.steps         1. Send twice and reclaim the first reply.
     *                   2. Read from both replies.
     *                   3. Compare sizes and reclaimed flags.
     * @tc.expected      Reclaiming the first reply leaves the second readable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakResultRepliesIndependent', 0, () => {
      logStep('memoryLeakResultRepliesIndependent', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1010);
      const results: RequestResultModel[] = sendBurst(client, 2);
      results[0].reply.reclaim();
      expect(results[0].reply.isReclaimed()).assertTrue();
      expect(results[1].reply.isReclaimed()).assertFalse();
      expect(results[0].readReply()).assertEqual('');
      expect(results[1].readReply()).assertEqual(REPLY_PAYLOAD);
      expect(results[0].reply.size()).assertEqual(1);
      expect(results[1].reply.size()).assertEqual(1);
      expect(results[1].reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakFinalSummaryInvariants
     * @tc.desc          Three sessions of five sends leave a fully reconcilable resource summary.
     * @tc.precondition  An empty client and a three-session plan.
     * @tc.steps         1. Run three sessions of five sends.
     *                   2. Reconcile toasts, events and log size.
     *                   3. Confirm no proxy or registration survives.
     * @tc.expected      Twenty-one toasts and fifteen replies appear with no leftover binding.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakFinalSummaryInvariants', 0, () => {
      logStep('memoryLeakFinalSummaryInvariants', 'begin');
      const client: ConnectionModel = newClient();
      for (let session = 0; session < 3; session++) {
        openConnection(client, 1020 + session);
        sendBurst(client, 5);
        client.onDisconnect();
      }
      expect(ClientMetrics.from(client).replies).assertEqual(15);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(3);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(3);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(15);
      expect(client.toasts.length).assertEqual(21);
      expect(eventCount(client, 'send-ok')).assertEqual(15);
      expect(client.logs.size() <= 128).assertTrue();
      expect(client.proxy).assertUndefined();
      expect(client.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          memoryLeakSequenceWriteCountTracking
     * @tc.desc          Sequence write and read counters track only accepted operations.
     * @tc.precondition  A newly created sequence.
     * @tc.steps         1. Write three values and read one.
     *                   2. Reclaim and attempt another write and read.
     *                   3. Inspect all four counters.
     * @tc.expected      Accepted counts stay at three writes and one read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakSequenceWriteCountTracking', 0, () => {
      logStep('memoryLeakSequenceWriteCountTracking', 'begin');
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('w1');
      sequence.writeString('w2');
      sequence.writeString('w3');
      sequence.readString();
      sequence.reclaim();
      sequence.writeString('w4');
      sequence.readString();
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.values[2]).assertEqual('w3');
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.isEmpty()).assertFalse();
    });

    /**
     * @tc.name          memoryLeakLogContainsEmptyProbe
     * @tc.desc          An empty probe matches any retained line and nothing after a clear.
     * @tc.precondition  A log buffer with two entries.
     * @tc.steps         1. Probe with an empty fragment.
     *                   2. Clear the buffer and probe again.
     *                   3. Append one line and probe a third time.
     * @tc.expected      The empty probe flips from true to false and back to true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakLogContainsEmptyProbe', 0, () => {
      logStep('memoryLeakLogContainsEmptyProbe', 'begin');
      const buffer: LogBuffer = new LogBuffer(8);
      buffer.info('alpha');
      buffer.warn('beta');
      const beforeClear: boolean = buffer.contains('');
      buffer.clear();
      const afterClear: boolean = buffer.contains('');
      buffer.error('gamma');
      const afterAppend: boolean = buffer.contains('');
      expect(beforeClear).assertTrue();
      expect(afterClear).assertFalse();
      expect(afterAppend).assertTrue();
      expect(buffer.size()).assertEqual(1);
      expect(buffer.countLevel('ERROR')).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('ERROR gamma');
      expect(buffer.contains('alpha')).assertFalse();
    });

    /**
     * @tc.name          memoryLeakWarningsFromDuplicateConnects
     * @tc.desc          Duplicate connect attempts only add warning lines, not errors.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Attempt five extra connects.
     *                   2. Inspect the log level totals.
     *                   3. Confirm the session still serves requests.
     * @tc.expected      Five warning lines appear with no error line and the send still succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakWarningsFromDuplicateConnects', 0, () => {
      logStep('memoryLeakWarningsFromDuplicateConnects', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1030);
      for (let attempt = 0; attempt < 5; attempt++) {
        client.connect(1031 + attempt);
      }
      const result: RequestResultModel = client.sendString('after-duplicates');
      expect(client.logs.countLevel('WARN')).assertEqual(5);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.countLevel('INFO')).assertEqual(3);
      expect(client.logs.size()).assertEqual(8);
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(6);
      expect(client.connectId).assertEqual(1030);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          memoryLeakScopedSessionSummaries
     * @tc.desc          Two scoped sessions report resource summaries proportional to their work.
     * @tc.precondition  An empty client and two differently sized sessions.
     * @tc.steps         1. Run a ten-send session and capture a summary.
     *                   2. Run a three-send session and capture another.
     *                   3. Compare the two summaries.
     * @tc.expected      The summaries differ by exactly seven sends and seven toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('memoryLeakScopedSessionSummaries', 0, () => {
      logStep('memoryLeakScopedSessionSummaries', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 1040);
      sendBurst(client, 10);
      const large: UsageSample = new UsageSample(1, 10, 0, 10, client.logs.size());
      const toastsAfterLarge: number = client.toasts.length;
      client.onDisconnect();
      openConnection(client, 1041);
      sendBurst(client, 3);
      const small: UsageSample = new UsageSample(1, 3, 0, 3, client.logs.size());
      expect(large.sends - small.sends).assertEqual(7);
      expect(large.reclaimedSequences - small.reclaimedSequences).assertEqual(7);
      expect(toastsAfterLarge).assertEqual(11);
      expect(client.toasts.length).assertEqual(16);
      expect(large.allReclaimed()).assertTrue();
      expect(small.allReclaimed()).assertTrue();
      expect(small.sessions).assertEqual(1);
    });

    /**
     * @tc.name          memoryLeakStubCodesRetainedPerSession
     * @tc.desc          Stub handled codes are retained per session and never shared across stubs.
     * @tc.precondition  Two sessions with independent stubs.
     * @tc.steps         1. Send twice in the first session.
     *                   2. Send once in the second session.
     *                   3. Compare handled code lists.
     * @tc.expected      Each stub holds only its own handled codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('memoryLeakStubCodesRetainedPerSession', 0, () => {
      logStep('memoryLeakStubCodesRetainedPerSession', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 1050);
      sendBurst(client, 2);
      client.onDisconnect();
      const second: RemoteProxyModel = openConnection(client, 1051);
      const secondStubBefore: number = second.stub.handledCodes.length;
      sendBurst(client, 1);
      expect(first.stub.handledCodes.length).assertEqual(2);
      expect(secondStubBefore).assertEqual(0);
      expect(second.stub.handledCodes.length).assertEqual(1);
      expect(first.stub.handledCodes[0]).assertEqual(1);
      expect(second.stub.handledCodes[0]).assertEqual(1);
      expect(first.stub === second.stub).assertFalse();
      expect(client.proxy).assertEqual(second);
    });
  });
}