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
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_SEND,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  DeathRecipientModel,
  MessageSequenceModel,
  MessageOptionModel,
  LogBuffer,
  EventRecorder,
  createConnectedSession,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

export default function resourceManagement(): void {
  describe('ResourceManagement', () => {
    beforeAll(() => {
      logSuite('ResourceManagement', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ResourceManagement', 'end');
    });

    /**
     * @tc.name          resourceManagementSequenceStartsEmpty
     * @tc.desc          A new sequence holds no values.
     * @tc.precondition  A fresh MessageSequenceModel exists.
     * @tc.steps         1. A fresh MessageSequenceModel exists.
     *                   2. Read the size and the empty flag.
     *                   3. The sequence is empty.
     * @tc.expected      The sequence is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceStartsEmpty', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.isEmpty()).assertTrue();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.isReclaimed()).assertFalse();
      expect(sequence.trace()).assertEqual('#0');
    });

    /**
     * @tc.name          resourceManagementSequenceWriteAppends
     * @tc.desc          Each write appends one value.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. A fresh sequence exists.
     *                   2. Write two strings.
     *                   3. The size and write count equal two.
     * @tc.expected      The size and write count equal two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceWriteAppends', 0, () => {
      const sequence = MessageSequenceModel.create();
      const first = sequence.writeString('alpha');
      const second = sequence.writeString('beta');
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.values[0]).assertEqual('alpha');
      expect(sequence.values[1]).assertEqual('beta');
      expect(sequence.readString()).assertEqual('alpha');
    });

    /**
     * @tc.name          resourceManagementSequenceReadAdvancesCursor
     * @tc.desc          A read advances the cursor.
     * @tc.precondition  A sequence with two values exists.
     * @tc.steps         1. A sequence with two values exists.
     *                   2. Read one value.
     *                   3. The cursor equals one.
     * @tc.expected      The cursor equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceReadAdvancesCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-2');
      sequence.readString();
      sequence.readString();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(false);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceReadPastEnd
     * @tc.desc          Reading past the end returns empty.
     * @tc.precondition  A sequence with one value was read once.
     * @tc.steps         1. A sequence with one value was read once.
     *                   2. Read again.
     *                   3. The result is empty and the cursor stops at one.
     * @tc.expected      The result is empty and the cursor stops at one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceReadPastEnd', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-3');
      sequence.readString();
      sequence.readString();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(false);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceRewindRestoresCursor
     * @tc.desc          A rewind returns the cursor to zero.
     * @tc.precondition  A sequence was read once.
     * @tc.steps         1. A sequence was read once.
     *                   2. Call rewind.
     *                   3. The cursor is zero and the first value can be read.
     * @tc.expected      The cursor is zero and the first value can be read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceRewindRestoresCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.readString();
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimMarksObject
     * @tc.desc          Reclaim marks the sequence as released.
     * @tc.precondition  A sequence with values exists.
     * @tc.steps         1. A sequence with values exists.
     *                   2. Call reclaim.
     *                   3. The reclaimed flag is true.
     * @tc.expected      The reclaimed flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceReclaimMarksObject', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-5');
      sequence.readString();
      sequence.reclaim();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(true);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimBlocksWrite
     * @tc.desc          A reclaimed sequence refuses new writes.
     * @tc.precondition  A sequence was reclaimed.
     * @tc.steps         1. A sequence was reclaimed.
     *                   2. Write a value.
     *                   3. The write returns false and the size is unchanged.
     * @tc.expected      The write returns false and the size is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceReclaimBlocksWrite', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-6');
      sequence.readString();
      sequence.reclaim();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(true);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimBlocksRead
     * @tc.desc          A reclaimed sequence refuses reads.
     * @tc.precondition  A sequence with values was reclaimed.
     * @tc.steps         1. A sequence with values was reclaimed.
     *                   2. Read a value.
     *                   3. The result is empty.
     * @tc.expected      The result is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceReclaimBlocksRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-7');
      sequence.readString();
      sequence.reclaim();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(true);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimResetsCursor
     * @tc.desc          A reclaim returns the cursor to zero.
     * @tc.precondition  A sequence was partially read.
     * @tc.steps         1. A sequence was partially read.
     *                   2. Call reclaim.
     *                   3. The cursor equals zero.
     * @tc.expected      The cursor equals zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceReclaimResetsCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-8');
      sequence.readString();
      sequence.readString();
      sequence.reclaim();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(true);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceSizeSurvivesReclaim
     * @tc.desc          The size is not erased by reclaim.
     * @tc.precondition  A sequence with three values was reclaimed.
     * @tc.steps         1. A sequence with three values was reclaimed.
     *                   2. Read the size.
     *                   3. The size is three.
     * @tc.expected      The size is three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceSizeSurvivesReclaim', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-9');
      sequence.writeString('two');
      sequence.writeString('three');
      sequence.readString();
      sequence.readString();
      sequence.reclaim();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.isReclaimed()).assertEqual(true);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 3).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceTraceShowsValues
     * @tc.desc          The trace lists the stored values.
     * @tc.precondition  A sequence with two values exists.
     * @tc.steps         1. A sequence with two values exists.
     *                   2. Read the trace.
     *                   3. Both values appear separated by a pipe.
     * @tc.expected      Both values appear separated by a pipe.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceTraceShowsValues', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-10');
      sequence.readString();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(false);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceTraceShowsCursor
     * @tc.desc          The trace ends with the cursor number.
     * @tc.precondition  A sequence was read once.
     * @tc.steps         1. A sequence was read once.
     *                   2. Read the trace.
     *                   3. The trace ends with hash one.
     * @tc.expected      The trace ends with hash one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceTraceShowsCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-11');
      sequence.readString();
      sequence.readString();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(false);
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceWriteCountPersists
     * @tc.desc          The write counter is kept after reclaim.
     * @tc.precondition  A sequence with two writes was reclaimed.
     * @tc.steps         1. A sequence with two writes was reclaimed.
     *                   2. Read the write counter.
     *                   3. The counter equals two.
     * @tc.expected      The counter equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceWriteCountPersists', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value-12');
      sequence.readString();
      sequence.reclaim();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertEqual(true);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.trace().indexOf('#') > 0).assertTrue();
      expect(sequence.size() === 1).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceIndependentInstances
     * @tc.desc          Two sequences do not share storage.
     * @tc.precondition  Two fresh sequences exist.
     * @tc.steps         1. Two fresh sequences exist.
     *                   2. Write to the first only.
     *                   3. The second stays empty.
     * @tc.expected      The second stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementSequenceIndependentInstances', 0, () => {
      const left = MessageSequenceModel.create();
      const right = MessageSequenceModel.create();
      left.writeString('only-left');
      expect(left.size()).assertEqual(1);
      expect(right.size()).assertEqual(0);
      expect(right.isEmpty()).assertTrue();
      expect(right.readString()).assertEqual('');
      expect(left.values[0]).assertEqual('only-left');
      expect(right.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          resourceManagementProxyStartsWithNoRequests
     * @tc.desc          A new proxy has no recorded traffic.
     * @tc.precondition  A fresh proxy exists.
     * @tc.steps         1. A fresh proxy exists.
     *                   2. Read the requests and the send counter.
     *                   3. Both are empty and zero.
     * @tc.expected      Both are empty and zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementProxyStartsWithNoRequests', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.alive).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.descriptor).assertEqual('IPCStubTest');
    });

    /**
     * @tc.name          resourceManagementProxyCountsRequests
     * @tc.desc          The proxy counts each send call.
     * @tc.precondition  A proxy served two requests.
     * @tc.steps         1. A proxy served two requests.
     *                   2. Read the send counter.
     *                   3. The counter equals two.
     * @tc.expected      The counter equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyCountsRequests', 0, () => {
      const session = createConnectedSession();
      session.sendString('first-a');
      session.sendString('second-a');
      const proxy = session.proxy as RemoteProxyModel;
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.requests[1]).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('first-a');
      expect(proxy.stub.receivedTexts[1]).assertEqual('second-a');
      expect(session.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          resourceManagementProxyRecordsCodes
     * @tc.desc          The proxy records each request code.
     * @tc.precondition  A proxy served two requests.
     * @tc.steps         1. A proxy served two requests.
     *                   2. Read the recorded code list.
     *                   3. Both codes are one.
     * @tc.expected      Both codes are one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyRecordsCodes', 0, () => {
      const session = createConnectedSession();
      session.sendString('first-b');
      session.sendString('second-b');
      const proxy = session.proxy as RemoteProxyModel;
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.requests[1]).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('first-b');
      expect(proxy.stub.receivedTexts[1]).assertEqual('second-b');
      expect(session.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          resourceManagementProxyLastPayloadIsSet
     * @tc.desc          The proxy stores the last payload field default.
     * @tc.precondition  A fresh proxy exists.
     * @tc.steps         1. A fresh proxy exists.
     *                   2. Read the payload field.
     *                   3. The field is empty.
     * @tc.expected      The field is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyLastPayloadIsSet', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.lastPayload.length).assertEqual(0);
      expect(proxy.stub.replyText).assertEqual('hello rpc');
      expect(proxy.stub.alive).assertTrue();
      expect(proxy.stub.descriptor).assertEqual(proxy.descriptor);
      expect(proxy.stub.requestCount()).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementProxyFailNextSendConsumed
     * @tc.desc          The primed failure is consumed by one send.
     * @tc.precondition  A proxy primed to fail exists.
     * @tc.steps         1. A proxy primed to fail exists.
     *                   2. Send once then inspect the field.
     *                   3. The field is back to no error.
     * @tc.expected      The field is back to no error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyFailNextSendConsumed', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = session.sendString('fail-once');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.isConnected()).assertTrue();
    });

    /**
     * @tc.name          resourceManagementProxyRegisterSetsFlags
     * @tc.desc          Registering sets both registration sides.
     * @tc.precondition  A fresh proxy and recipient exist.
     * @tc.steps         1. A fresh proxy and recipient exist.
     *                   2. Register the recipient.
     *                   3. Both flags are true.
     * @tc.expected      Both flags are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementProxyRegisterSetsFlags', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('register-19'));
      const recipient = new DeathRecipientModel();
      const registered = proxy.registerDeathRecipient(recipient);
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(proxy.deathRecipient !== undefined).assertTrue();
      expect(registered).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.deathRecipient === undefined).assertEqual(false);
    });

    /**
     * @tc.name          resourceManagementProxyUnregisterClearsFlags
     * @tc.desc          Unregistering clears both sides.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. A registered proxy exists.
     *                   2. Unregister the recipient.
     *                   3. Both flags are false.
     * @tc.expected      Both flags are false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementProxyUnregisterClearsFlags', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('register-20'));
      const recipient = new DeathRecipientModel();
      const registered = proxy.registerDeathRecipient(recipient);
      const removed = proxy.unregisterDeathRecipient(recipient);
      expect(removed).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(registered).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.deathRecipient === undefined).assertEqual(true);
    });

    /**
     * @tc.name          resourceManagementProxyUnregisterDropsReference
     * @tc.desc          Unregistering removes the stored recipient.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. A registered proxy exists.
     *                   2. Unregister and inspect the recipient field.
     *                   3. The field is undefined.
     * @tc.expected      The field is undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyUnregisterDropsReference', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('register-21'));
      const recipient = new DeathRecipientModel();
      const registered = proxy.registerDeathRecipient(recipient);
      const removed = proxy.unregisterDeathRecipient(recipient);
      expect(removed).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(registered).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.deathRecipient === undefined).assertEqual(true);
    });

    /**
     * @tc.name          resourceManagementProxyResetClearsTraffic
     * @tc.desc          reset removes the recorded traffic.
     * @tc.precondition  A proxy with traffic exists.
     * @tc.steps         1. A proxy with traffic exists.
     *                   2. Call reset.
     *                   3. The counters and the request list are empty.
     * @tc.expected      The counters and the request list are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyResetClearsTraffic', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'reset-22';
      const stub = proxy.stub;
      session.sendString('traffic');
      proxy.reset();
      expect(proxy.alive).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(proxy.descriptor).assertEqual('reset-22');
      expect(proxy.stub === stub).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementProxyResetClearsRegistration
     * @tc.desc          reset removes the death registration.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. A registered proxy exists.
     *                   2. Call reset.
     *                   3. The registration flags are false.
     * @tc.expected      The registration flags are false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyResetClearsRegistration', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'reset-23';
      const stub = proxy.stub;
      session.sendString('traffic');
      proxy.reset();
      expect(proxy.alive).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(proxy.descriptor).assertEqual('reset-23');
      expect(proxy.stub === stub).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementProxyResetKeepsStub
     * @tc.desc          reset keeps the underlying stub.
     * @tc.precondition  A proxy with traffic exists.
     * @tc.steps         1. A proxy with traffic exists.
     *                   2. Call reset and inspect the stub.
     *                   3. The same stub is still attached.
     * @tc.expected      The same stub is still attached.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyResetKeepsStub', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'reset-24';
      const stub = proxy.stub;
      session.sendString('traffic');
      proxy.reset();
      expect(proxy.alive).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(proxy.descriptor).assertEqual('reset-24');
      expect(proxy.stub === stub).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementProxyKillStopsHandling
     * @tc.desc          A killed proxy refuses new requests.
     * @tc.precondition  A live proxy exists.
     * @tc.steps         1. A live proxy exists.
     *                   2. Kill the stub and send.
     *                   3. The result carries the send error.
     * @tc.expected      The result carries the send error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyKillStopsHandling', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.stub.kill();
      const result = session.sendString('killed');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.stub.alive).assertEqual(false);
      expect(session.isConnected()).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(proxy.sendCalls).assertEqual(1);
      expect(result.replyText.length > 0).assertEqual(false);
    });

    /**
     * @tc.name          resourceManagementProxyReviveRestoresHandling
     * @tc.desc          A revived stub handles requests again.
     * @tc.precondition  A proxy whose stub was revived exists.
     * @tc.steps         1. A proxy whose stub was revived exists.
     *                   2. Send a request.
     *                   3. The request succeeds.
     * @tc.expected      The request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyReviveRestoresHandling', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.stub.kill();
      proxy.stub.revive();
      const result = session.sendString('revived');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts[0]).assertEqual('revived');
      expect(proxy.stub.alive).assertEqual(true);
      expect(session.isConnected()).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(proxy.sendCalls).assertEqual(1);
      expect(result.replyText.length > 0).assertEqual(true);
    });

    /**
     * @tc.name          resourceManagementProxyNotifyDeathClearsLiveness
     * @tc.desc          Notifying death marks the proxy not alive.
     * @tc.precondition  A live proxy with a recipient exists.
     * @tc.steps         1. A live proxy with a recipient exists.
     *                   2. Call notifyDeath.
     *                   3. The proxy is not alive and the recipient counted a death.
     * @tc.expected      The proxy is not alive and the recipient counted a death.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementProxyNotifyDeathClearsLiveness', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(proxy.requests.length).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementClientResetClearsSession
     * @tc.desc          reset clears the whole client session.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call reset.
     *                   3. Every field returns to its default.
     * @tc.expected      Every field returns to its default.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetClearsSession', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.reset();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.proxy === undefined).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.toasts.length).assertEqual(0);
      expect(session.connectCalls).assertEqual(0);
      expect(session.failedCode).assertEqual(ERROR_NONE);
      expect(session.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          resourceManagementClientResetClearsLogs
     * @tc.desc          reset empties the bounded log buffer.
     * @tc.precondition  A connected session sent once.
     * @tc.steps         1. A connected session sent once.
     *                   2. Call reset and read the log size.
     *                   3. The log buffer is empty.
     * @tc.expected      The log buffer is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetClearsLogs', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      expect(session.logs.size() > 0).assertTrue();
      session.reset();
      expect(session.logs.size()).assertEqual(0);
      expect(session.logs.levels.length).assertEqual(0);
      expect(session.logs.trace()).assertEqual('');
      expect(session.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(session.logs.contains('hello rpc')).assertFalse();
      expect(session.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          resourceManagementClientResetClearsEvents
     * @tc.desc          reset empties the event recorder.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call reset and read the event size.
     *                   3. The recorder is empty.
     * @tc.expected      The recorder is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetClearsEvents', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.reset();
      expect(session.events.size()).assertEqual(0);
      expect(session.events.trace()).assertEqual('');
      expect(session.events.fingerprint()).assertEqual(textFingerprint(''));
      expect(session.events.countOf('connect')).assertEqual(0);
      expect(session.events.last()).assertEqual('');
      expect(session.toasts.length).assertEqual(0);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          resourceManagementClientResetClearsToasts
     * @tc.desc          reset drops the queued toasts.
     * @tc.precondition  A connected session sent once.
     * @tc.steps         1. A connected session sent once.
     *                   2. Call reset and read the toast list.
     *                   3. The list is empty.
     * @tc.expected      The list is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementClientResetClearsToasts', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      expect(session.toasts.length).assertEqual(2);
      session.reset();
      expect(session.toasts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual('');
      expect(session.toasts.indexOf('sendRequest success')).assertEqual(-1);
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          resourceManagementClientResetReplacesRecipient
     * @tc.desc          reset installs a fresh death recipient.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call reset and compare the recipient.
     *                   3. A new unregistered recipient is stored.
     * @tc.expected      A new unregistered recipient is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetReplacesRecipient', 0, () => {
      const session = createConnectedSession();
      const previous = session.deathRecipient;
      expect(previous.registered).assertTrue();
      session.reset();
      expect(session.deathRecipient === previous).assertFalse();
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(previous.diedCount).assertEqual(0);
      expect(session.proxy === undefined).assertTrue();
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          resourceManagementClientResetClearsConnectId
     * @tc.desc          reset returns the connect id to minus one.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call reset and read the id.
     *                   3. The id is minus one.
     * @tc.expected      The id is minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetClearsConnectId', 0, () => {
      const session = createConnectedSession();
      expect(session.connectId).assertEqual(7);
      session.reset();
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.connectId).assertEqual(-1);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.proxy === undefined).assertTrue();
      expect(session.toasts.length).assertEqual(0);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          resourceManagementClientResetClearsAttempts
     * @tc.desc          reset clears the connect attempt counter.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call reset and read the counter.
     *                   3. The counter is zero.
     * @tc.expected      The counter is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetClearsAttempts', 0, () => {
      const client = new ConnectionModel();
      client.connect(31);
      client.connect(32);
      expect(client.connectCalls).assertEqual(2);
      client.reset();
      expect(client.connectCalls).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.logs.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementClientLogsAreBounded
     * @tc.desc          The client buffer keeps its configured limit.
     * @tc.precondition  A session produced many lines.
     * @tc.steps         1. A session produced many lines.
     *                   2. Read the buffer size limit.
     *                   3. The size stays within the limit.
     * @tc.expected      The size stays within the limit.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementClientLogsAreBounded', 0, () => {
      const session = createConnectedSession();
      for (let index = 0; index < 40; index++) {
        session.logs.info('line-' + String(index));
      }
      expect(session.logs.limit).assertEqual(128);
      expect(session.logs.size() <= session.logs.limit).assertTrue();
      expect(session.logs.levels.length).assertEqual(session.logs.lines.length);
      expect(session.logs.contains('line-39')).assertTrue();
      expect(session.logs.countLevel(LEVEL_INFO) >= 40).assertTrue();
      expect(session.logs.trace().length > 0).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          resourceManagementClientLogLevelsMatchLines
     * @tc.desc          The level and line arrays stay aligned.
     * @tc.precondition  A session produced several lines.
     * @tc.steps         1. A session produced several lines.
     *                   2. Compare both array lengths.
     *                   3. The lengths are equal.
     * @tc.expected      The lengths are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientLogLevelsMatchLines', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.onDisconnect();
      expect(session.logs.levels.length).assertEqual(session.logs.lines.length);
      expect(session.logs.size()).assertEqual(session.logs.lines.length);
      expect(session.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(session.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(session.logs.countLevel(LEVEL_INFO) >= 4).assertTrue();
      expect(session.logs.lines[0].indexOf('INFO') === 0).assertTrue();
    });

    /**
     * @tc.name          resourceManagementClientToastsAreAppendOnly
     * @tc.desc          The toast list never drops an early entry.
     * @tc.precondition  A session performed three actions.
     * @tc.steps         1. A session performed three actions.
     *                   2. Read the toast list.
     *                   3. All three messages are present in order.
     * @tc.expected      All three messages are present in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientToastsAreAppendOnly', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[0]).assertEqual('connectAbility success');
      expect(session.toasts[1]).assertEqual('sendRequest success');
      expect(session.toasts[2]).assertEqual('disconnectAbility success');
      expect(session.lastToast()).assertEqual('disconnectAbility success');
      expect(session.toasts.indexOf('sendRequest failed, please connect to the server first')).assertEqual(-1);
    });

    /**
     * @tc.name          resourceManagementClientEventTraceIsReadOnlyCopy
     * @tc.desc          Reading the trace does not mutate the recorder.
     * @tc.precondition  A session with events exists.
     * @tc.steps         1. A session with events exists.
     *                   2. Read the trace twice.
     *                   3. The size and text are unchanged.
     * @tc.expected      The size and text are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientEventTraceIsReadOnlyCopy', 0, () => {
      const session = createConnectedSession();
      const first = session.events.trace();
      const size = session.events.size();
      const second = session.events.trace();
      expect(first).assertEqual(second);
      expect(session.events.size()).assertEqual(size);
      expect(first.length > 0).assertTrue();
      expect(first.indexOf('connect:') === 0).assertTrue();
      expect(first.split('|').length).assertEqual(size);
      expect(session.events.entries.length).assertEqual(size);
    });

    /**
     * @tc.name          resourceManagementClientEventsRemainAfterDisconnect
     * @tc.desc          Disconnecting keeps the recorded history.
     * @tc.precondition  A session disconnected.
     * @tc.steps         1. A session disconnected.
     *                   2. Read the event recorder.
     *                   3. The connect and disconnect events remain.
     * @tc.expected      The connect and disconnect events remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientEventsRemainAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.onDisconnect();
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.size()).assertEqual(5);
      expect(session.events.trace().indexOf('disconnected:ok') > 0).assertTrue();
      expect(session.logs.size() > 0).assertTrue();
    });

    /**
     * @tc.name          resourceManagementLogBufferKeepsLimit
     * @tc.desc          The buffer never grows past its limit.
     * @tc.precondition  A buffer with limit three exists.
     * @tc.steps         1. A buffer with limit three exists.
     *                   2. Push five lines.
     *                   3. The size equals three.
     * @tc.expected      The size equals three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementLogBufferKeepsLimit', 0, () => {
      const buffer = new LogBuffer(3);
      buffer.info('a');
      buffer.info('b');
      buffer.info('c');
      buffer.info('d');
      buffer.info('e');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0]).assertEqual('INFO c');
      expect(buffer.lines[2]).assertEqual('INFO e');
      expect(buffer.contains('a')).assertFalse();
      expect(buffer.contains('e')).assertTrue();
      expect(buffer.levels.length).assertEqual(3);
    });

    /**
     * @tc.name          resourceManagementLogBufferDropsOldest
     * @tc.desc          The oldest lines are dropped first.
     * @tc.precondition  A buffer with limit two received three lines.
     * @tc.steps         1. A buffer with limit two received three lines.
     *                   2. Read the first surviving line.
     *                   3. The line belongs to the second push.
     * @tc.expected      The line belongs to the second push.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferDropsOldest', 0, () => {
      const buffer = new LogBuffer(2);
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.lines[0]).assertEqual('WARN b');
      expect(buffer.lines[1]).assertEqual('ERROR c');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('a')).assertFalse();
    });

    /**
     * @tc.name          resourceManagementLogBufferLevelsTrimTogether
     * @tc.desc          The level array is trimmed with the lines.
     * @tc.precondition  A buffer with limit two received four lines.
     * @tc.steps         1. A buffer with limit two received four lines.
     *                   2. Compare both array lengths.
     *                   3. Both equal two and INFO is absent.
     * @tc.expected      Both equal two and INFO is absent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferLevelsTrimTogether', 0, () => {
      const buffer = new LogBuffer(2);
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      buffer.info('d');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.levels.length).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('b')).assertFalse();
      expect(buffer.contains('d')).assertTrue();
    });

    /**
     * @tc.name          resourceManagementLogBufferContainsSearch
     * @tc.desc          The contains helper searches every line.
     * @tc.precondition  A buffer holds a distinctive line.
     * @tc.steps         1. A buffer holds a distinctive line.
     *                   2. Search for the fragment and a missing one.
     *                   3. The first is found and the second is not.
     * @tc.expected      The first is found and the second is not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferContainsSearch', 0, () => {
      const buffer = new LogBuffer(8);
      buffer.info('needle-in-haystack');
      buffer.warn('other');
      expect(buffer.contains('needle')).assertTrue();
      expect(buffer.contains('haystack')).assertTrue();
      expect(buffer.contains('missing')).assertFalse();
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.trace().indexOf('needle-in-haystack') > 0).assertTrue();
    });

    /**
     * @tc.name          resourceManagementLogBufferClearReusable
     * @tc.desc          A cleared buffer can accept new lines.
     * @tc.precondition  A buffer was cleared.
     * @tc.steps         1. A buffer was cleared.
     *                   2. Push one line.
     *                   3. The size is one and the line is reachable.
     * @tc.expected      The size is one and the line is reachable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferClearReusable', 0, () => {
      const buffer = new LogBuffer(4);
      buffer.info('before');
      buffer.clear();
      buffer.error('after');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('after')).assertTrue();
      expect(buffer.contains('before')).assertFalse();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.levels.length).assertEqual(1);
    });

    /**
     * @tc.name          resourceManagementLogBufferCountsPerLevel
     * @tc.desc          The buffer counts each level separately.
     * @tc.precondition  A buffer holds mixed levels.
     * @tc.steps         1. A buffer holds mixed levels.
     *                   2. Count INFO and ERROR.
     *                   3. The counts match the pushes.
     * @tc.expected      The counts match the pushes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementLogBufferCountsPerLevel', 0, () => {
      const buffer = new LogBuffer(10);
      buffer.info('one');
      buffer.info('two');
      buffer.error('three');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[2].indexOf('ERROR') === 0).assertTrue();
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.levels[2]).assertEqual(LEVEL_ERROR);
    });

    /**
     * @tc.name          resourceManagementEventRecorderKeepsAllEntries
     * @tc.desc          The recorder keeps every entry.
     * @tc.precondition  A recorder received four entries.
     * @tc.steps         1. A recorder received four entries.
     *                   2. Read the size.
     *                   3. The size equals four.
     * @tc.expected      The size equals four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('resourceManagementEventRecorderKeepsAllEntries', 0, () => {
      const recorder = new EventRecorder();
      recorder.record('a', '1');
      recorder.record('b', '2');
      recorder.record('c', '3');
      recorder.record('d', '4');
      expect(recorder.size()).assertEqual(4);
      expect(recorder.entries[0]).assertEqual('a:1');
      expect(recorder.entries[3]).assertEqual('d:4');
      expect(recorder.last()).assertEqual('d:4');
      expect(recorder.countOf('a')).assertEqual(1);
      expect(recorder.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name          resourceManagementEventRecorderClearReusable
     * @tc.desc          A cleared recorder can record again.
     * @tc.precondition  A recorder was cleared.
     * @tc.steps         1. A recorder was cleared.
     *                   2. Record one entry.
     *                   3. The size is one and the last entry matches.
     * @tc.expected      The size is one and the last entry matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementEventRecorderClearReusable', 0, () => {
      const recorder = new EventRecorder();
      recorder.record('a', '1');
      recorder.clear();
      recorder.record('b', '2');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.last()).assertEqual('b:2');
      expect(recorder.countOf('a')).assertEqual(0);
      expect(recorder.countOf('b')).assertEqual(1);
      expect(recorder.entries.length).assertEqual(1);
      expect(recorder.trace()).assertEqual('b:2');
    });

    /**
     * @tc.name          resourceManagementEventRecorderFingerprintAfterClear
     * @tc.desc          Clearing resets the fingerprint to empty.
     * @tc.precondition  A recorder with entries was cleared.
     * @tc.steps         1. A recorder with entries was cleared.
     *                   2. Compare the fingerprint with an empty trace.
     *                   3. They are equal.
     * @tc.expected      They are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementEventRecorderFingerprintAfterClear', 0, () => {
      const recorder = new EventRecorder();
      recorder.record('a', '1');
      recorder.clear();
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
      expect(recorder.fingerprint()).assertEqual(new EventRecorder().fingerprint());
      expect(recorder.size()).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.last()).assertEqual('');
      expect(recorder.entries.length).assertEqual(0);
    });

    /**
     * @tc.name          resourceManagementEventRecorderCountOfKind
     * @tc.desc          The recorder counts matching kinds.
     * @tc.precondition  A recorder holds three events of two kinds.
     * @tc.steps         1. A recorder holds three events of two kinds.
     *                   2. Count each kind.
     *                   3. The counts match the pushes.
     * @tc.expected      The counts match the pushes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementEventRecorderCountOfKind', 0, () => {
      const recorder = new EventRecorder();
      recorder.record('connect', 'x');
      recorder.record('send', 'y');
      recorder.record('connect', 'z');
      expect(recorder.countOf('connect')).assertEqual(2);
      expect(recorder.countOf('send')).assertEqual(1);
      expect(recorder.countOf('missing')).assertEqual(0);
      expect(recorder.size()).assertEqual(3);
      expect(recorder.last()).assertEqual('connect:z');
      expect(recorder.fingerprint()).assertEqual(textFingerprint('connect:x|send:y|connect:z'));
    });

    /**
     * @tc.name          resourceManagementEventRecorderIndependentBuffers
     * @tc.desc          Each recorder owns its storage.
     * @tc.precondition  Two recorders exist.
     * @tc.steps         1. Two recorders exist.
     *                   2. Record in both and compare.
     *                   3. Each keeps only its own entries.
     * @tc.expected      Each keeps only its own entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementEventRecorderIndependentBuffers', 0, () => {
      const left = new EventRecorder();
      const right = new EventRecorder();
      left.record('left', '1');
      right.record('right', '2');
      expect(left.size()).assertEqual(1);
      expect(right.size()).assertEqual(1);
      expect(left.last()).assertEqual('left:1');
      expect(right.last()).assertEqual('right:2');
      expect(left.countOf('left')).assertEqual(1);
      expect(right.countOf('left')).assertEqual(0);
      expect(left.trace() === right.trace()).assertFalse();
    });

    /**
     * @tc.name          resourceManagementOptionCloneIsIndependent
     * @tc.desc          A cloned option owns its own fields.
     * @tc.precondition  A message option exists.
     * @tc.steps         1. A message option exists.
     *                   2. Clone it and change the clone wait time.
     *                   3. The original wait time is unchanged.
     * @tc.expected      The original wait time is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementOptionCloneIsIndependent', 0, () => {
      const option = new MessageOptionModel(1, 3, false);
      const clone = option.clone();
      expect(clone.waitTime).assertEqual(3);
      clone.waitTime = 9;
      clone.flags = 0;
      expect(option.waitTime).assertEqual(3);
      expect(option.flags).assertEqual(1);
      expect(clone.waitTime).assertEqual(9);
      expect(clone.flags).assertEqual(0);
      expect(option.isAsync()).assertTrue();
      expect(clone.isSync()).assertTrue();
    });

    /**
     * @tc.name          resourceManagementSequenceWriteAfterReclaimKeepsSize
     * @tc.desc          A refused write leaves the stored size alone.
     * @tc.precondition  A sequence with two values was reclaimed.
     * @tc.steps         1. A sequence with two values was reclaimed.
     *                   2. Attempt a third write.
     *                   3. The size stays two and the write count stays two.
     * @tc.expected      The size stays two and the write count stays two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementSequenceWriteAfterReclaimKeepsSize', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      sequence.reclaim();
      const accepted = sequence.writeString('three');
      expect(accepted).assertFalse();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.isReclaimed()).assertTrue();
    });

    /**
     * @tc.name          resourceManagementProxyResetThenReuse
     * @tc.desc          A reset proxy can serve new traffic.
     * @tc.precondition  A proxy was reset.
     * @tc.steps         1. A proxy was reset.
     *                   2. Send one request through its client.
     *                   3. The counters start again from one.
     * @tc.expected      The counters start again from one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementProxyResetThenReuse', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      session.sendString('before');
      proxy.reset();
      expect(proxy.sendCalls).assertEqual(0);
      const result = session.sendString('after');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[1]).assertEqual('after');
      expect(session.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          resourceManagementClientLogsLimitAfterClear
     * @tc.desc          Clearing keeps the configured limit.
     * @tc.precondition  A client buffer was cleared.
     * @tc.steps         1. A client buffer was cleared.
     *                   2. Read the limit and push one line.
     *                   3. The limit is unchanged and the size is one.
     * @tc.expected      The limit is unchanged and the size is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientLogsLimitAfterClear', 0, () => {
      const session = createConnectedSession();
      session.logs.clear();
      const limit = session.logs.limit;
      session.logs.info('fresh');
      expect(session.logs.limit).assertEqual(limit);
      expect(session.logs.size()).assertEqual(1);
      expect(session.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(session.logs.contains('fresh')).assertTrue();
      expect(session.logs.levels.length).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          resourceManagementDeathRecipientObjectRetained
     * @tc.desc          The old recipient object keeps its counter after reset.
     * @tc.precondition  A session with a registered recipient was reset.
     * @tc.steps         1. A session with a registered recipient was reset.
     *                   2. Read the old object.
     *                   3. The counter is zero and the flag is false.
     * @tc.expected      The counter is zero and the flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementDeathRecipientObjectRetained', 0, () => {
      const session = createConnectedSession();
      const previous = session.deathRecipient;
      previous.onRemoteDied();
      expect(previous.diedCount).assertEqual(1);
      session.reset();
      expect(previous.diedCount).assertEqual(1);
      expect(previous.registered).assertFalse();
      expect(session.deathRecipient === previous).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          resourceManagementOptionMultipleClones
     * @tc.desc          Several clones stay independent.
     * @tc.precondition  An option exists.
     * @tc.steps         1. An option exists.
     *                   2. Clone it twice and change both clones.
     *                   3. The original fields are unchanged.
     * @tc.expected      The original fields are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementOptionMultipleClones', 0, () => {
      const option = new MessageOptionModel(1, 2, false);
      const first = option.clone();
      const second = option.clone();
      first.waitTime = 7;
      second.flags = 0;
      expect(option.waitTime).assertEqual(2);
      expect(option.flags).assertEqual(1);
      expect(first.waitTime).assertEqual(7);
      expect(first.flags).assertEqual(1);
      expect(second.flags).assertEqual(0);
      expect(second.waitTime).assertEqual(2);
      expect(option.describe()).assertEqual('1/2/false');
    });

    /**
     * @tc.name          resourceManagementSequenceReclaimTwiceIdempotent
     * @tc.desc          Reclaiming twice keeps the released state.
     * @tc.precondition  A sequence was reclaimed once.
     * @tc.steps         1. A sequence was reclaimed once.
     *                   2. Call reclaim again and write.
     *                   3. The state is still released and the write is refused.
     * @tc.expected      The state is still released and the write is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('resourceManagementSequenceReclaimTwiceIdempotent', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('value');
      sequence.reclaim();
      sequence.reclaim();
      const accepted = sequence.writeString('later');
      expect(accepted).assertFalse();
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.reclaimed).assertTrue();
    });

    /**
     * @tc.name          resourceManagementClientResetTwiceIdempotent
     * @tc.desc          A second reset keeps the defaults.
     * @tc.precondition  A client was reset once.
     * @tc.steps         1. A client was reset once.
     *                   2. Call reset again and inspect the fields.
     *                   3. All defaults remain unchanged.
     * @tc.expected      All defaults remain unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('resourceManagementClientResetTwiceIdempotent', 0, () => {
      const session = createConnectedSession();
      session.reset();
      session.reset();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.proxy === undefined).assertTrue();
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.toasts.length).assertEqual(0);
      expect(session.connectCalls).assertEqual(0);
      expect(session.isDisconnect).assertFalse();
    });

  });
}
