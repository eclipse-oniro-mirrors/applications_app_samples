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
  EVENT_ON_CREATE,
  EVENT_ON_CONNECT,
  EVENT_ON_DESTROY,
  EVENT_ON_DISCONNECT,
  EVENT_ON_REQUEST,
  LEVEL_ERROR,
  LEVEL_INFO,
  LEVEL_WARN,
  REPLY_PAYLOAD,
  STUB_DESCRIPTOR,
  InProcessClient,
  MessageSequenceModel,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  StubRemoteObjectModel,
  joined
} from '../Shared/SharedDriver';

function initialState(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function persistedModel(): ServiceLifecycleModel {
  const service = new ServiceLifecycleModel();
  service.onCreate();
  service.onConnect();
  service.onRequest(5);
  service.onDisconnect();
  service.onDestroy();
  return service;
}

function persistSnapshot(service: ServiceLifecycleModel): ServiceSnapshot {
  return new ServiceSnapshot(service);
}

function walkPhase(service: ServiceLifecycleModel): ServiceSnapshot[] {
  const shots: ServiceSnapshot[] = [];
  shots.push(persistSnapshot(service));
  service.onCreate();
  shots.push(persistSnapshot(service));
  service.onConnect();
  shots.push(persistSnapshot(service));
  service.onRequest(2);
  shots.push(persistSnapshot(service));
  service.onDisconnect();
  shots.push(persistSnapshot(service));
  service.onDestroy();
  shots.push(persistSnapshot(service));
  return shots;
}

export default function statePersistence(): void {
  describe('StatePersistence', () => {
    beforeAll(() => {
      logSuite('StatePersistence', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StatePersistence', 'end');
    });

    /**
     * @tc.name          statePersistenceSnapshotKeepsCreatedState
     * @tc.desc          A snapshot captured after creation keeps the created state.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Create the model.
     *                   2. Capture a snapshot.
     *                   3. Connect the live model and re-read the snapshot.
     * @tc.expected      The snapshot still reports created with zero connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotKeepsCreatedState', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      const persisted: ServiceSnapshot = persistSnapshot(service);
      service.onConnect();
      expect(persisted.state).assertEqual('created');
      expect(persisted.connects).assertEqual(0);
      expect(persisted.describe()).assertEqual('created/0/0/0/0');
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(persisted.sameAs(persistSnapshot(service))).assertFalse();
      expect(persisted.requests).assertEqual(0);
      expect(persisted.destroys).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceSnapshotKeepsRequestCount
     * @tc.desc          A snapshot keeps the request total observed at capture time.
     * @tc.precondition  A model has received two requests.
     * @tc.steps         1. Request twice and capture a snapshot.
     *                   2. Request three more times.
     *                   3. Re-read the snapshot request field.
     * @tc.expected      The snapshot still reports two requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotKeepsRequestCount', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onRequest(1);
      service.onRequest(2);
      const persisted: ServiceSnapshot = persistSnapshot(service);
      service.onRequest(3);
      service.onRequest(4);
      service.onRequest(5);
      expect(persisted.requests).assertEqual(2);
      expect(persisted.describe()).assertEqual('idle/0/0/2/0');
      expect(service.requestCount).assertEqual(5);
      expect(persisted.requests === service.requestCount).assertFalse();
      expect(persisted.state).assertEqual('idle');
      expect(persisted.connects).assertEqual(0);
      expect(persisted.destroys).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceSnapshotKeepsConnectCount
     * @tc.desc          A snapshot keeps the connect total observed at capture time.
     * @tc.precondition  A model has connected twice.
     * @tc.steps         1. Connect twice and capture a snapshot.
     *                   2. Disconnect and reconnect.
     *                   3. Re-read the snapshot connect field.
     * @tc.expected      The snapshot still reports two connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotKeepsConnectCount', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      service.onConnect();
      const persisted: ServiceSnapshot = persistSnapshot(service);
      service.onDisconnect();
      service.onConnect();
      expect(persisted.connects).assertEqual(2);
      expect(persisted.describe()).assertEqual('connected/2/0/0/0');
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(1);
      expect(persisted.disconnects).assertEqual(0);
      expect(persisted.state).assertEqual('connected');
      expect(persisted.sameAs(persistSnapshot(service))).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotKeepsDestroyState
     * @tc.desc          A snapshot keeps the destroyed state after a reset.
     * @tc.precondition  A destroyed model and its snapshot are available.
     * @tc.steps         1. Destroy the model and capture a snapshot.
     *                   2. Reset the live model.
     *                   3. Re-read the snapshot state and destroy field.
     * @tc.expected      The snapshot still reports destroyed with one destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotKeepsDestroyState', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      const persisted: ServiceSnapshot = persistSnapshot(service);
      service.reset();
      expect(persisted.state).assertEqual('destroyed');
      expect(persisted.destroys).assertEqual(1);
      expect(persisted.describe()).assertEqual('destroyed/1/1/1/1');
      expect(persisted.connects).assertEqual(1);
      expect(persisted.disconnects).assertEqual(1);
      expect(persisted.requests).assertEqual(1);
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(persisted.sameAs(persistSnapshot(service))).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotDescribeFields
     * @tc.desc          The describe text lists state and four counters in order.
     * @tc.precondition  A model has walked every callback.
     * @tc.steps         1. Walk create, connect, request, disconnect and destroy.
     *                   2. Capture the snapshot.
     *                   3. Split the describe text.
     * @tc.expected      The five fields match the live totals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotDescribeFields', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      const persisted: ServiceSnapshot = persistSnapshot(service);
      const fields: string[] = persisted.describe().split('/');
      expect(fields.length).assertEqual(5);
      expect(fields[0]).assertEqual('destroyed');
      expect(fields[1]).assertEqual('1');
      expect(fields[2]).assertEqual('1');
      expect(fields[3]).assertEqual('1');
      expect(fields[4]).assertEqual('1');
      expect(persisted.describe()).assertEqual('destroyed/1/1/1/1');
      expect(persisted.state).assertEqual(service.state);
      expect(persisted.destroys).assertEqual(service.destroyCount);
    });

    /**
     * @tc.name          statePersistenceSnapshotSameAcrossCaptures
     * @tc.desc          Two snapshots of an unchanged model are equal.
     * @tc.precondition  A model has walked all callbacks.
     * @tc.steps         1. Capture two snapshots in sequence.
     *                   2. Compare them with sameAs both ways.
     *                   3. Compare describe text.
     * @tc.expected      Both snapshots are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotSameAcrossCaptures', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      const first: ServiceSnapshot = persistSnapshot(service);
      const second: ServiceSnapshot = persistSnapshot(service);
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.state).assertEqual(second.state);
      expect(first.connects).assertEqual(second.connects);
      expect(first.requests).assertEqual(second.requests);
      expect(first.destroys).assertEqual(second.destroys);
      expect(first === second).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotDiffersAfterChange
     * @tc.desc          A new snapshot differs once the live model changes.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect and capture a snapshot.
     *                   2. Destroy the live model.
     *                   3. Compare the old and new snapshots.
     * @tc.expected      The two snapshots differ in state and destroy fields.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotDiffersAfterChange', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      const before: ServiceSnapshot = persistSnapshot(service);
      service.onDestroy();
      const after: ServiceSnapshot = persistSnapshot(service);
      expect(before.sameAs(after)).assertFalse();
      expect(after.sameAs(before)).assertFalse();
      expect(before.state).assertEqual('connected');
      expect(after.state).assertEqual('destroyed');
      expect(before.destroys).assertEqual(0);
      expect(after.destroys).assertEqual(1);
      expect(before.connects).assertEqual(after.connects);
      expect(before.describe() === after.describe()).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotImmutableAfterReset
     * @tc.desc          Reset never mutates previously captured snapshots.
     * @tc.precondition  A model has received one request.
     * @tc.steps         1. Request once and capture a snapshot.
     *                   2. Invoke reset.
     *                   3. Re-read the snapshot text and fields.
     * @tc.expected      The snapshot keeps the request total and the idle state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotImmutableAfterReset', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onRequest(1);
      const persisted: ServiceSnapshot = persistSnapshot(service);
      const text: string = persisted.describe();
      service.reset();
      expect(persisted.requests).assertEqual(1);
      expect(persisted.describe()).assertEqual(text);
      expect(persisted.describe()).assertEqual('idle/0/0/1/0');
      expect(service.requestCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(persisted.requests === service.requestCount).assertFalse();
      expect(persisted.state).assertEqual('idle');
    });

    /**
     * @tc.name          statePersistenceCountersSurviveDisconnect
     * @tc.desc          Disconnect leaves the connect and request totals untouched.
     * @tc.precondition  A model has connected and requested twice.
     * @tc.steps         1. Connect and request twice.
     *                   2. Disconnect.
     *                   3. Read both counters.
     * @tc.expected      Connect and request totals remain unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceCountersSurviveDisconnect', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      service.onRequest(1);
      service.onRequest(2);
      const connectsBefore: number = service.connectCount;
      const requestsBefore: number = service.requestCount;
      service.onDisconnect();
      expect(service.connectCount).assertEqual(connectsBefore);
      expect(service.requestCount).assertEqual(requestsBefore);
      expect(service.connectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          statePersistenceCountersSurviveRequest
     * @tc.desc          A request leaves connect and disconnect totals untouched.
     * @tc.precondition  A model has connected and disconnected.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Request three times.
     *                   3. Read the cycle counters.
     * @tc.expected      Cycle counters remain one each while requests reach three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceCountersSurviveRequest', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      service.onDisconnect();
      service.onRequest(1);
      service.onRequest(2);
      service.onRequest(3);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.events.size()).assertEqual(5);
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.size()).assertEqual(5);
    });

    /**
     * @tc.name          statePersistenceCountersSurviveDestroy
     * @tc.desc          Destroy leaves connect, disconnect and request totals intact.
     * @tc.precondition  A model has walked every callback except destroy.
     * @tc.steps         1. Create, connect, request and disconnect.
     *                   2. Destroy the model.
     *                   3. Read every counter.
     * @tc.expected      All prior totals survive and destroy equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceCountersSurviveDestroy', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.size()).assertEqual(5);
      expect(service.logs.size()).assertEqual(5);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(persistSnapshot(service).describe()).assertEqual('destroyed/1/1/1/1');
    });

    /**
     * @tc.name          statePersistenceEventsPersistAcrossCallbacks
     * @tc.desc          The recorder accumulates entries across unrelated callbacks.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Walk five different callbacks.
     *                   2. Read the recorder size.
     *                   3. Read each entry position.
     * @tc.expected      Five entries persist in callback order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventsPersistAcrossCallbacks', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.size()).assertEqual(5);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual('onRequest:1');
      expect(service.events.entries[2]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[4]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.trace()).assertEqual(
        'onCreate>onRequest:1>onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.events.entries.length).assertEqual(5);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name          statePersistenceEventOrderAcrossCallbacks
     * @tc.desc          The recorder order matches the invocation order exactly.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect, request and disconnect.
     *                   2. Read the trace.
     *                   3. Split the trace on arrows.
     * @tc.expected      The three segments follow invocation order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventOrderAcrossCallbacks', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      service.onRequest(7);
      service.onDisconnect();
      const segments: string[] = service.events.trace().split('>');
      expect(segments.length).assertEqual(3);
      expect(segments[0]).assertEqual('onConnect:IPCStubTest');
      expect(segments[1]).assertEqual('onRequest:7');
      expect(segments[2]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[1]).assertEqual('onRequest:7');
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(3);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          statePersistenceFingerprintStableForSameWalk
     * @tc.desc          Identical walks persist one fingerprint across models.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Walk the same callbacks on both models.
     *                   2. Compare fingerprints.
     *                   3. Compare traces and logs.
     * @tc.expected      Both models persist observationally identical data.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceFingerprintStableForSameWalk', 0, () => {
      const first: ServiceLifecycleModel = initialState();
      const second: ServiceLifecycleModel = initialState();
      first.onCreate();
      first.onConnect();
      first.onRequest(3);
      second.onCreate();
      second.onConnect();
      second.onRequest(3);
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.connectCount).assertEqual(second.connectCount);
      expect(first.requestCount).assertEqual(second.requestCount);
      expect(persistSnapshot(first).describe()).assertEqual(persistSnapshot(second).describe());
      expect(first.state).assertEqual(second.state);
    });

    /**
     * @tc.name          statePersistenceFingerprintDiffersForDifferentWalk
     * @tc.desc          Different walks persist different fingerprints.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Request on the first model.
     *                   2. Connect on the second model.
     *                   3. Compare fingerprints.
     * @tc.expected      The two fingerprints differ despite equal event counts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceFingerprintDiffersForDifferentWalk', 0, () => {
      const first: ServiceLifecycleModel = initialState();
      const second: ServiceLifecycleModel = initialState();
      first.onRequest(1);
      second.onConnect();
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.events.trace() === second.events.trace()).assertFalse();
      expect(first.events.trace()).assertEqual('onRequest:1');
      expect(second.events.trace()).assertEqual('onConnect:IPCStubTest');
      expect(first.state).assertEqual('idle');
      expect(second.state).assertEqual('connected');
      expect(first.events.size()).assertEqual(1);
      expect(second.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceLogsPersistAcrossCallbacks
     * @tc.desc          Log lines persist one per callback with matching order.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, connect and request.
     *                   2. Read the log trace.
     *                   3. Compare with the event trace size.
     * @tc.expected      Three info lines persist in callback order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceLogsPersistAcrossCallbacks', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onConnect();
      service.onRequest(4);
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.lines[1]).assertEqual('INFO onConnect');
      expect(service.logs.lines[2]).assertEqual('INFO onRequest 4');
      expect(service.logs.trace()).assertEqual(
        'INFO onCreate|INFO onConnect|INFO onRequest 4');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceSequenceWritesPersist
     * @tc.desc          Written strings persist in the message sequence.
     * @tc.precondition  A fresh message sequence is available.
     * @tc.steps         1. Write three strings.
     *                   2. Read the size and write count.
     *                   3. Read the stored values.
     * @tc.expected      Three strings persist with three writes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSequenceWritesPersist', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      expect(sequence.writeString('one')).assertTrue();
      expect(sequence.writeString('two')).assertTrue();
      expect(sequence.writeString('three')).assertTrue();
      expect(sequence.size()).assertEqual(3);
      expect(sequence.writeCount).assertEqual(3);
      expect(sequence.values[0]).assertEqual('one');
      expect(sequence.values[2]).assertEqual('three');
      expect(sequence.reclaimed).assertFalse();
      expect(sequence.cursor).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceSequenceReadCursorAdvances
     * @tc.desc          Each read returns the next value and advances the cursor.
     * @tc.precondition  A sequence holding three strings is available.
     * @tc.steps         1. Read twice.
     *                   2. Read the cursor and read count.
     *                   3. Read the third value.
     * @tc.expected      Values arrive in write order with a cursor of three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSequenceReadCursorAdvances', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.writeString('beta');
      sequence.writeString('gamma');
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readString()).assertEqual('beta');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readString()).assertEqual('gamma');
      expect(sequence.cursor).assertEqual(3);
      expect(sequence.readCount).assertEqual(3);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(3);
    });

    /**
     * @tc.name          statePersistenceSequenceRewindPreservesValues
     * @tc.desc          Rewind resets the cursor without dropping stored values.
     * @tc.precondition  A fully read sequence is available.
     * @tc.steps         1. Read every value once.
     *                   2. Rewind.
     *                   3. Read the first value again.
     * @tc.expected      Values persist and the reread equals the first write.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSequenceRewindPreservesValues', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('keep-1');
      sequence.writeString('keep-2');
      expect(sequence.readString()).assertEqual('keep-1');
      expect(sequence.readString()).assertEqual('keep-2');
      expect(sequence.cursor).assertEqual(2);
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.size()).assertEqual(2);
      expect(sequence.values[0]).assertEqual('keep-1');
      expect(sequence.readString()).assertEqual('keep-1');
      expect(sequence.cursor).assertEqual(1);
      expect(sequence.readCount).assertEqual(3);
    });

    /**
     * @tc.name          statePersistenceSequenceReclaimBlocksWrites
     * @tc.desc          A reclaimed sequence rejects further writes.
     * @tc.precondition  A sequence with one written value is available.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Attempt another write.
     *                   3. Read the size and write count.
     * @tc.expected      The write fails and the stored data is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSequenceReclaimBlocksWrites', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('before');
      expect(sequence.size()).assertEqual(1);
      sequence.reclaim();
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.writeString('after')).assertFalse();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.values[0]).assertEqual('before');
      expect(sequence.readString()).assertEqual('');
    });

    /**
     * @tc.name          statePersistenceSequenceReclaimBlocksReads
     * @tc.desc          A reclaimed sequence returns empty strings on read.
     * @tc.precondition  A sequence with two written values is available.
     * @tc.steps         1. Reclaim the sequence.
     *                   2. Read twice.
     *                   3. Read the cursor and read count.
     * @tc.expected      Both reads are empty and the read count stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSequenceReclaimBlocksReads', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('x');
      sequence.writeString('y');
      sequence.reclaim();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.reclaimed).assertTrue();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.values[1]).assertEqual('y');
      expect(sequence.readString() === 'y').assertFalse();
    });

    /**
     * @tc.name          statePersistenceSequenceTraceFormat
     * @tc.desc          The sequence trace joins values with pipes and appends the cursor.
     * @tc.precondition  A sequence with two values is available.
     * @tc.steps         1. Write two strings and read one.
     *                   2. Read the trace text.
     *                   3. Compare with the expected format.
     * @tc.expected      The trace is values pipe-separated then hash and cursor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSequenceTraceFormat', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      sequence.writeString('a');
      sequence.writeString('b');
      expect(sequence.trace()).assertEqual('a|b#0');
      sequence.readString();
      expect(sequence.trace()).assertEqual('a|b#1');
      expect(sequence.trace().split('#').length).assertEqual(2);
      expect(sequence.trace().split('|').length).assertEqual(2);
      expect(sequence.trace().indexOf('|')).assertEqual(1);
      expect(sequence.trace().endsWith('#1')).assertTrue();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.cursor).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceSequenceIndependentInstances
     * @tc.desc          Message sequence instances never share storage.
     * @tc.precondition  Two fresh sequences are available.
     * @tc.steps         1. Write to the first sequence only.
     *                   2. Read the second sequence size.
     *                   3. Write to the second sequence.
     * @tc.expected      The second sequence stays empty until its own write.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSequenceIndependentInstances', 0, () => {
      const first: MessageSequenceModel = MessageSequenceModel.create();
      const second: MessageSequenceModel = MessageSequenceModel.create();
      first.writeString('first-only');
      expect(second.size()).assertEqual(0);
      expect(second.writeCount).assertEqual(0);
      expect(second.readString()).assertEqual('');
      expect(first.size()).assertEqual(1);
      second.writeString('second-only');
      expect(second.size()).assertEqual(1);
      expect(first.values[0]).assertEqual('first-only');
      expect(second.values[0]).assertEqual('second-only');
      expect(first === second).assertFalse();
      expect(first.trace()).assertEqual('first-only#0');
      expect(second.trace()).assertEqual('second-only#0');
    });

    /**
     * @tc.name          statePersistenceSequenceMultiStringRoundTrip
     * @tc.desc          Multiple writes and reads persist without loss or reorder.
     * @tc.precondition  A fresh message sequence is available.
     * @tc.steps         1. Write five increasing strings.
     *                   2. Read all five.
     *                   3. Compare each read with its write.
     * @tc.expected      The round trip preserves order and content.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSequenceMultiStringRoundTrip', 0, () => {
      const sequence: MessageSequenceModel = MessageSequenceModel.create();
      const inputs: string[] = ['v1', 'v2', 'v3', 'v4', 'v5'];
      for (let index = 0; index < inputs.length; index++) {
        expect(sequence.writeString(inputs[index])).assertTrue();
      }
      const outputs: string[] = [];
      for (let index = 0; index < inputs.length; index++) {
        outputs.push(sequence.readString());
      }
      expect(outputs.length).assertEqual(5);
      expect(outputs[0]).assertEqual('v1');
      expect(outputs[4]).assertEqual('v5');
      for (let index = 0; index < inputs.length; index++) {
        expect(outputs[index]).assertEqual(inputs[index]);
      }
      expect(sequence.writeCount).assertEqual(5);
      expect(sequence.readCount).assertEqual(5);
      expect(sequence.cursor).assertEqual(5);
    });

    /**
     * @tc.name          statePersistenceSnapshotChainMonotonic
     * @tc.desc          The snapshot ladder grows one counter at each phase.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Capture a snapshot per callback phase.
     *                   2. Walk the ladder by index.
     *                   3. Compare the expected counters.
     * @tc.expected      Six snapshots show idle through destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSnapshotChainMonotonic', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      const ladder: ServiceSnapshot[] = walkPhase(service);
      expect(ladder.length).assertEqual(6);
      expect(ladder[0].state).assertEqual('idle');
      expect(ladder[1].state).assertEqual('created');
      expect(ladder[2].connects).assertEqual(1);
      expect(ladder[3].requests).assertEqual(1);
      expect(ladder[4].disconnects).assertEqual(1);
      expect(ladder[5].destroys).assertEqual(1);
      expect(ladder[5].state).assertEqual('destroyed');
      expect(ladder[0].sameAs(ladder[5])).assertFalse();
      expect(ladder[2].sameAs(ladder[4])).assertFalse();
    });

    /**
     * @tc.name          statePersistenceCounterSnapshotAlignment
     * @tc.desc          Every snapshot field equals the live counter at capture time.
     * @tc.precondition  A model has walked all callbacks.
     * @tc.steps         1. Walk create, connect, request, disconnect and destroy.
     *                   2. Capture a snapshot.
     *                   3. Compare each field with the live model.
     * @tc.expected      All five fields align with the live state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceCounterSnapshotAlignment', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      const snapshot: ServiceSnapshot = persistSnapshot(service);
      expect(snapshot.state).assertEqual(service.state);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.destroys).assertEqual(service.destroyCount);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.sameAs(persistSnapshot(service))).assertTrue();
      expect(snapshot.describe()).assertEqual('destroyed/1/1/1/1');
    });

    /**
     * @tc.name          statePersistenceResetBaseline
     * @tc.desc          Reset restores the canonical baseline state.
     * @tc.precondition  A model has walked all callbacks.
     * @tc.steps         1. Walk all callbacks.
     *                   2. Invoke reset.
     *                   3. Capture and describe a snapshot.
     * @tc.expected      The describe text is idle/0/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceResetBaseline', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      service.reset();
      const snapshot: ServiceSnapshot = persistSnapshot(service);
      expect(snapshot.describe()).assertEqual('idle/0/0/0/0');
      expect(snapshot.state).assertEqual('idle');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          statePersistenceResetThenWalkMatchesFresh
     * @tc.desc          A post-reset walk persists the same data as a fresh walk.
     * @tc.precondition  A model with prior activity is available.
     * @tc.steps         1. Walk extra callbacks.
     *                   2. Reset and walk create, connect and request.
     *                   3. Compare with a fresh model walk.
     * @tc.expected      Traces, snapshots and counters match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceResetThenWalkMatchesFresh', 0, () => {
      const reused: ServiceLifecycleModel = initialState();
      reused.onCreate();
      reused.onDestroy();
      reused.onCreate();
      reused.reset();
      reused.onCreate();
      reused.onConnect();
      reused.onRequest(9);
      const fresh: ServiceLifecycleModel = initialState();
      fresh.onCreate();
      fresh.onConnect();
      fresh.onRequest(9);
      expect(reused.events.trace()).assertEqual(fresh.events.trace());
      expect(reused.events.fingerprint()).assertEqual(fresh.events.fingerprint());
      expect(reused.logs.trace()).assertEqual(fresh.logs.trace());
      expect(persistSnapshot(reused).describe()).assertEqual(persistSnapshot(fresh).describe());
      expect(reused.connectCount).assertEqual(fresh.connectCount);
      expect(reused.requestCount).assertEqual(fresh.requestCount);
      expect(reused.events.size()).assertEqual(fresh.events.size());
      expect(reused.state).assertEqual(fresh.state);
    });

    /**
     * @tc.name          statePersistenceTwoModelsIndependent
     * @tc.desc          Persisted state is isolated between model instances.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Walk all callbacks on the first model.
     *                   2. Read the second model.
     *                   3. Walk one request on the second model.
     * @tc.expected      The second model keeps its own baseline and request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceTwoModelsIndependent', 0, () => {
      const first: ServiceLifecycleModel = persistedModel();
      const second: ServiceLifecycleModel = initialState();
      expect(second.events.size()).assertEqual(0);
      expect(second.logs.size()).assertEqual(0);
      expect(second.state).assertEqual('idle');
      expect(second.isAlive()).assertTrue();
      expect(second.stub).assertUndefined();
      second.onRequest(1);
      expect(second.requestCount).assertEqual(1);
      expect(first.requestCount).assertEqual(1);
      expect(first.state).assertEqual('destroyed');
      expect(second.state).assertEqual('idle');
      expect(first.events === second.events).assertFalse();
      expect(first.logs === second.logs).assertFalse();
    });

    /**
     * @tc.name          statePersistenceEventTraceJoined
     * @tc.desc          The persisted trace equals the joined expectation.
     * @tc.precondition  A model has walked create, request and destroy.
     * @tc.steps         1. Walk the three callbacks.
     *                   2. Join the expected entries.
     *                   3. Compare with the trace.
     * @tc.expected      The joined string equals the persisted trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceEventTraceJoined', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onRequest(2);
      service.onDestroy();
      const expected: string = joined([EVENT_ON_CREATE, 'onRequest:2', EVENT_ON_DESTROY], '>');
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.trace()).assertEqual('onCreate>onRequest:2>onDestroy');
      expect(service.events.trace().split('>').length).assertEqual(3);
      expect(service.events.entries[1]).assertEqual('onRequest:2');
      expect(service.events.size()).assertEqual(3);
      expect(service.requestCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          statePersistenceSnapshotBeforeAndAfterDestroy
     * @tc.desc          Destroy changes only the state and destroy fields.
     * @tc.precondition  A created and connected model is available.
     * @tc.steps         1. Create and connect, then capture a snapshot.
     *                   2. Destroy the model and capture again.
     *                   3. Compare both field sets.
     * @tc.expected      Connect counts match while state and destroy differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSnapshotBeforeAndAfterDestroy', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onConnect();
      const before: ServiceSnapshot = persistSnapshot(service);
      service.onDestroy();
      const after: ServiceSnapshot = persistSnapshot(service);
      expect(before.connects).assertEqual(after.connects);
      expect(before.requests).assertEqual(after.requests);
      expect(before.destroys).assertEqual(0);
      expect(after.destroys).assertEqual(1);
      expect(before.state).assertEqual('connected');
      expect(after.state).assertEqual('destroyed');
      expect(before.describe()).assertEqual('connected/1/0/0/0');
      expect(after.describe()).assertEqual('destroyed/1/0/0/1');
      expect(before.sameAs(after)).assertFalse();
    });

    /**
     * @tc.name          statePersistenceFingerprintAfterRecorderClear
     * @tc.desc          Clearing the recorder resets the fingerprint but not counters.
     * @tc.precondition  A model has walked all callbacks.
     * @tc.steps         1. Walk all callbacks.
     *                   2. Clear the recorder.
     *                   3. Compare the fingerprint and counters.
     * @tc.expected      The fingerprint returns to the empty value while totals hold.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceFingerprintAfterRecorderClear', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      const before: number = service.events.fingerprint();
      service.events.clear();
      const after: number = service.events.fingerprint();
      expect(before === after).assertFalse();
      expect(after).assertEqual(initialState().events.fingerprint());
      expect(service.events.size()).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.connectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.logs.size()).assertEqual(5);
    });

    /**
     * @tc.name          statePersistenceLogTrimKeepsNewest
     * @tc.desc          Overflowing logs retain only the newest request lines.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Request 130 times.
     *                   2. Read the log size.
     *                   3. Check the retained first and last lines.
     * @tc.expected      Logs cap at 128 and retain ids 3 through 130.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceLogTrimKeepsNewest', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      for (let index = 1; index <= 130; index++) {
        service.onRequest(index);
      }
      expect(service.requestCount).assertEqual(130);
      expect(service.events.size()).assertEqual(130);
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.lines[0]).assertEqual('INFO onRequest 3');
      expect(service.logs.lines[127]).assertEqual('INFO onRequest 130');
      expect(service.logs.lines.indexOf('INFO onRequest 2') >= 0).assertFalse();
      expect(service.logs.contains('onRequest 130')).assertTrue();
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(130);
    });

    /**
     * @tc.name          statePersistenceRequestPreservedAcrossReconnect
     * @tc.desc          Reconnecting preserves the persisted request total.
     * @tc.precondition  A model has received two requests.
     * @tc.steps         1. Request twice.
     *                   2. Connect and disconnect.
     *                   3. Compare the request total and trace.
     * @tc.expected      The request total stays two after the cycle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceRequestPreservedAcrossReconnect', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      expect(service.requestCount).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.trace()).assertEqual(
        'onRequest:1>onRequest:2>onConnect:IPCStubTest>onDisconnect');
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(persistSnapshot(service).describe()).assertEqual('disconnected/1/1/2/0');
      expect(service.logs.size()).assertEqual(4);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          statePersistenceCycleCountPreserved
     * @tc.desc          Multiple reconnect cycles keep prior cycle totals.
     * @tc.precondition  A model has completed three cycles.
     * @tc.steps         1. Run three cycles.
     *                   2. Read both cycle counters.
     *                   3. Compare with the snapshot fields.
     * @tc.expected      Both counters and the snapshot report three cycles.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceCycleCountPreserved', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      for (let cycle = 0; cycle < 3; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
      expect(service.events.size()).assertEqual(6);
      const snapshot: ServiceSnapshot = persistSnapshot(service);
      expect(snapshot.connects).assertEqual(3);
      expect(snapshot.disconnects).assertEqual(3);
      expect(snapshot.describe()).assertEqual('disconnected/3/3/0/0');
      expect(service.logs.size()).assertEqual(6);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          statePersistenceStateTableAfterCallbacks
     * @tc.desc          Each callback persists its own state string.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Create and read the state.
     *                   2. Connect and read the state.
     *                   3. Disconnect, destroy and read both states.
     * @tc.expected      The states advance through created, connected, disconnected, destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceStateTableAfterCallbacks', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      expect(service.state).assertEqual('idle');
      service.onCreate();
      expect(service.state).assertEqual('created');
      service.onConnect();
      expect(service.state).assertEqual('connected');
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceDescribeStability
     * @tc.desc          A snapshot describe text is stable across repeated reads.
     * @tc.precondition  A model has walked all callbacks.
     * @tc.steps         1. Walk all callbacks.
     *                   2. Read describe three times.
     *                   3. Compare all reads.
     * @tc.expected      All three describe reads are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceDescribeStability', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      const snapshot: ServiceSnapshot = persistSnapshot(service);
      const first: string = snapshot.describe();
      const second: string = snapshot.describe();
      const third: string = snapshot.describe();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual('destroyed/1/1/1/1');
      expect(first.split('/').length).assertEqual(5);
      expect(first.length).assertLarger(0);
      expect(first.indexOf('destroyed')).assertEqual(0);
      expect(first.endsWith('/1')).assertTrue();
      expect(snapshot.destroys).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceRequestsAcrossPhases
     * @tc.desc          Requests persist across connected, disconnected and destroyed.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Request while connected.
     *                   2. Request after disconnect.
     *                   3. Request after destroy.
     * @tc.expected      The request total reaches three across all phases.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceRequestsAcrossPhases', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onRequest(2);
      service.onDestroy();
      service.onRequest(3);
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.events.size()).assertEqual(6);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onRequest:1>onDisconnect>onRequest:2>onDestroy>onRequest:3');
      expect(service.events.last()).assertEqual('onRequest:3');
      expect(service.state).assertEqual('destroyed');
      expect(service.logs.size()).assertEqual(6);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          statePersistencePairwiseDifferences
     * @tc.desc          Snapshots from different phases differ pairwise.
     * @tc.precondition  A created and connected model is available.
     * @tc.steps         1. Capture a created snapshot.
     *                   2. Connect and capture another.
     *                   3. Destroy and capture a third.
     * @tc.expected      All three pairwise comparisons report differences.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistencePairwiseDifferences', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      const created: ServiceSnapshot = persistSnapshot(service);
      service.onConnect();
      const connected: ServiceSnapshot = persistSnapshot(service);
      service.onDestroy();
      const destroyed: ServiceSnapshot = persistSnapshot(service);
      expect(created.sameAs(connected)).assertFalse();
      expect(connected.sameAs(destroyed)).assertFalse();
      expect(created.sameAs(destroyed)).assertFalse();
      expect(created.state).assertEqual('created');
      expect(connected.state).assertEqual('connected');
      expect(destroyed.state).assertEqual('destroyed');
      expect(created.describe()).assertEqual('created/0/0/0/0');
      expect(destroyed.describe()).assertEqual('destroyed/1/0/0/1');
      expect(created.sameAs(persistSnapshot(initialState()))).assertFalse();
    });

    /**
     * @tc.name          statePersistenceStubMetricsStable
     * @tc.desc          Stub metrics persist unchanged across service callbacks.
     * @tc.precondition  A connected stub has served two requests.
     * @tc.steps         1. Send two requests.
     *                   2. Walk disconnect and destroy.
     *                   3. Compare metrics before and after.
     * @tc.expected      Metrics retain two requests and two handled entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceStubMetricsStable', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(1, 'a');
      client.send(1, 'b');
      const before: StubMetrics = StubMetrics.from(stub);
      service.onDisconnect();
      service.onDestroy();
      const after: StubMetrics = StubMetrics.from(stub);
      expect(after.requests).assertEqual(before.requests);
      expect(after.handled).assertEqual(before.handled);
      expect(after.rejected).assertEqual(before.rejected);
      expect(after.replies).assertEqual(before.replies);
      expect(after.fingerprint()).assertEqual(before.fingerprint());
      expect(after.requests).assertEqual(2);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceCounterMonotonicity
     * @tc.desc          Counters never decrease as callbacks proceed.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Walk callbacks one at a time.
     *                   2. Record counters after each step.
     *                   3. Compare each with the previous value.
     * @tc.expected      Every counter is non-decreasing across the walk.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceCounterMonotonicity', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      const connects: number[] = [service.connectCount];
      const requests: number[] = [service.requestCount];
      service.onCreate();
      connects.push(service.connectCount);
      service.onConnect();
      connects.push(service.connectCount);
      requests.push(service.requestCount);
      service.onRequest(1);
      connects.push(service.connectCount);
      requests.push(service.requestCount);
      service.onDisconnect();
      requests.push(service.requestCount);
      service.onDestroy();
      requests.push(service.requestCount);
      expect(connects.length).assertEqual(4);
      expect(requests.length).assertEqual(5);
      for (let index = 1; index < connects.length; index++) {
        expect(connects[index]).assertLarger(connects[index - 1] - 1);
        expect(connects[index]).assertEqual(index === 1 ? 0 : 1);
      }
      for (let index = 1; index < requests.length; index++) {
        expect(requests[index]).assertLarger(requests[index - 1] - 1);
      }
      expect(requests[4]).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceEventKindSum
     * @tc.desc          Per-kind counts sum to the persisted recorder size.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Walk all five callbacks.
     *                   2. Sum the kind counts.
     *                   3. Compare with the size.
     * @tc.expected      The sum equals five and matches the recorder size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceEventKindSum', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      const sum: number = service.events.countOf(EVENT_ON_CREATE) +
        service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DISCONNECT) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(sum).assertEqual(5);
      expect(sum).assertEqual(service.events.size());
      expect(service.events.entries.length).assertEqual(sum);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf('onUnknown')).assertEqual(0);
      expect(service.events.fingerprint()).assertLarger(0);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          statePersistenceLogEqualsEventCount
     * @tc.desc          One log line persists per lifecycle event.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Walk four callbacks.
     *                   2. Compare log and event sizes.
     *                   3. Compare the ordered fragments.
     * @tc.expected      Four info lines align with four events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceLogEqualsEventCount', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onConnect();
      service.onRequest(8);
      service.onDisconnect();
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.lines[1]).assertEqual('INFO onConnect');
      expect(service.logs.lines[2]).assertEqual('INFO onRequest 8');
      expect(service.logs.lines[3]).assertEqual('INFO onDisconnect');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.logs.trace().split('|').length).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          statePersistenceObservationSummary
     * @tc.desc          The full persisted observation is internally consistent.
     * @tc.precondition  A model has walked all callbacks.
     * @tc.steps         1. Walk the callbacks.
     *                   2. Capture the snapshot.
     *                   3. Cross-check snapshot, trace and logs.
     * @tc.expected      All observations agree on the final totals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceObservationSummary', 0, () => {
      const service: ServiceLifecycleModel = persistedModel();
      const snapshot: ServiceSnapshot = persistSnapshot(service);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/1/1');
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.destroys).assertEqual(service.destroyCount);
      expect(service.events.size()).assertEqual(5);
      expect(service.logs.size()).assertEqual(5);
      expect(service.events.trace().split('>').length).assertEqual(5);
      expect(service.logs.trace().split('|').length).assertEqual(5);
      expect(service.isAlive()).assertFalse();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name          statePersistenceResetDeterministic
     * @tc.desc          Repeated reset-walk rounds persist identical observations.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Run three reset-walk rounds.
     *                   2. Capture the describe text per round.
     *                   3. Compare all three.
     * @tc.expected      Every round yields created/0/0/0/0 or an equal text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceResetDeterministic', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      const texts: string[] = [];
      for (let round = 0; round < 3; round++) {
        service.reset();
        service.onCreate();
        texts.push(persistSnapshot(service).describe());
      }
      expect(texts.length).assertEqual(3);
      expect(texts[0]).assertEqual('created/0/0/0/0');
      expect(texts[0]).assertEqual(texts[1]);
      expect(texts[1]).assertEqual(texts[2]);
      expect(service.connectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          statePersistenceSnapshotAfterMultipleCycles
     * @tc.desc          A three-cycle snapshot reports three connects and disconnects.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Run three connect-disconnect cycles.
     *                   2. Capture the snapshot.
     *                   3. Read each counter field.
     * @tc.expected      The describe text is disconnected/3/3/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSnapshotAfterMultipleCycles', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      for (let cycle = 0; cycle < 3; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      const snapshot: ServiceSnapshot = persistSnapshot(service);
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.connects).assertEqual(3);
      expect(snapshot.disconnects).assertEqual(3);
      expect(snapshot.describe()).assertEqual('disconnected/3/3/0/0');
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(6);
      expect(snapshot.sameAs(persistSnapshot(service))).assertTrue();
      expect(service.connectCount).assertEqual(3);
    });

    /**
     * @tc.name          statePersistenceFingerprintDeterminism
     * @tc.desc          Identical persisted walks produce one fingerprint.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Walk the same callbacks on both models.
     *                   2. Compare fingerprints.
     *                   3. Compare the snapshot describe texts.
     * @tc.expected      Both models persist identical observations.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceFingerprintDeterminism', 0, () => {
      const first: ServiceLifecycleModel = initialState();
      const second: ServiceLifecycleModel = initialState();
      first.onCreate();
      first.onConnect();
      first.onRequest(2);
      first.onDisconnect();
      second.onCreate();
      second.onConnect();
      second.onRequest(2);
      second.onDisconnect();
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(persistSnapshot(first).describe()).assertEqual(persistSnapshot(second).describe());
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.requestCount).assertEqual(second.requestCount);
      expect(first.state).assertEqual(second.state);
      expect(first.logs.size()).assertEqual(second.logs.size());
    });

    /**
     * @tc.name          statePersistenceHistoryRetainedAfterRecreate
     * @tc.desc          Re-creation appends without erasing earlier persisted history.
     * @tc.precondition  A destroyed model with prior events is available.
     * @tc.steps         1. Walk create, request and destroy.
     *                   2. Invoke onCreate again.
     *                   3. Read the full trace and counters.
     * @tc.expected      The earlier events remain and the create count is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceHistoryRetainedAfterRecreate', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onCreate();
      service.onRequest(1);
      service.onDestroy();
      service.onCreate();
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onRequest:1>onDestroy>onCreate');
      expect(service.requestCount).assertEqual(1);
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.logs.size()).assertEqual(4);
    });

    /**
     * @tc.name          statePersistenceFinalSnapshotDescribe
     * @tc.desc          The final snapshot describe text encodes all persisted totals.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Connect twice and disconnect once.
     *                   2. Request twice and destroy.
     *                   3. Capture and split the describe text.
     * @tc.expected      The describe text is destroyed/2/1/2/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceFinalSnapshotDescribe', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      service.onConnect();
      service.onDisconnect();
      service.onRequest(1);
      service.onRequest(2);
      service.onDestroy();
      const snapshot: ServiceSnapshot = persistSnapshot(service);
      expect(snapshot.describe()).assertEqual('destroyed/2/1/2/1');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(2);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(service.events.size()).assertEqual(6);
      expect(service.logs.size()).assertEqual(6);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          statePersistenceResetClearsStubBinding
     * @tc.desc          Reset removes the persisted stub binding for good.
     * @tc.precondition  A model has connected and disconnected.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Reset the model.
     *                   3. Read the stub field and counters.
     * @tc.expected      The stub binding is gone and every counter is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceResetClearsStubBinding', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      const stub: StubRemoteObjectModel = service.onConnect();
      service.onDisconnect();
      expect(service.stub === stub).assertTrue();
      service.reset();
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.state).assertEqual('idle');
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          statePersistenceSnapshotAfterResetAndCycle
     * @tc.desc          A reset cycle rebuilds the persisted totals from zero.
     * @tc.precondition  A model with prior history is available.
     * @tc.steps         1. Connect, request and disconnect.
     *                   2. Reset and run one connect-disconnect cycle.
     *                   3. Compare both describe texts.
     * @tc.expected      The rebuilt snapshot reports only the new cycle totals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSnapshotAfterResetAndCycle', 0, () => {
      const service: ServiceLifecycleModel = initialState();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      const before: ServiceSnapshot = persistSnapshot(service);
      service.reset();
      service.onConnect();
      service.onDisconnect();
      const after: ServiceSnapshot = persistSnapshot(service);
      expect(before.describe()).assertEqual('disconnected/1/1/1/0');
      expect(after.describe()).assertEqual('disconnected/1/1/0/0');
      expect(before.sameAs(after)).assertFalse();
      expect(after.requests).assertEqual(0);
      expect(after.connects).assertEqual(1);
      expect(after.disconnects).assertEqual(1);
      expect(after.state).assertEqual('disconnected');
      expect(service.events.size()).assertEqual(2);
    });
  });
}
