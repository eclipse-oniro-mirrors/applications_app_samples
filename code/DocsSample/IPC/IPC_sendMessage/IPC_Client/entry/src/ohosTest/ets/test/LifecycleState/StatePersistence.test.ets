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
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  STATE_FAILED,
  INITIAL_CONNECT_ID,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  CONNECT_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  MessageOptionModel,
  ClientSnapshot,
  ClientMetrics,
  EventRecorder,
  LogBuffer,
  createConnectedSession,
  textFingerprint,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  clampInt
} from '../Shared/SharedDriver';

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
     * @tc.name          statePersistenceSnapshotOfIdleClient
     * @tc.desc          An idle snapshot records the default state.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Build a ClientSnapshot.
     *                   3. The state is disconnected and the id is minus one.
     * @tc.expected      The state is disconnected and the id is minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotOfIdleClient', 0, () => {
      const client = new ConnectionModel();
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.hasProxy).assertEqual(false);
      expect(snapshot.deathRegistered).assertEqual(false);
      expect(snapshot.toastCount).assertEqual(0);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/0');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.state).assertEqual(snapshot.state);
    });

    /**
     * @tc.name          statePersistenceSnapshotOfConnectingClient
     * @tc.desc          A connecting snapshot records the pending id.
     * @tc.precondition  A client connected with id eleven.
     * @tc.steps         1. A client connected with id eleven.
     *                   2. Build a ClientSnapshot.
     *                   3. The state is connecting and the id is eleven.
     * @tc.expected      The state is connecting and the id is eleven.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotOfConnectingClient', 0, () => {
      const client = new ConnectionModel();
      client.connect(11);
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTING);
      expect(snapshot.connectId).assertEqual(11);
      expect(snapshot.hasProxy).assertEqual(false);
      expect(snapshot.deathRegistered).assertEqual(false);
      expect(snapshot.toastCount).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connecting/11/false/false/0');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.state).assertEqual(snapshot.state);
    });

    /**
     * @tc.name          statePersistenceSnapshotOfConnectedClient
     * @tc.desc          A connected snapshot records the proxy.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Build a ClientSnapshot.
     *                   3. The proxy and registration flags are true.
     * @tc.expected      The proxy and registration flags are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotOfConnectedClient', 0, () => {
      const client = new ConnectionModel();
      client.connect(12);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(12);
      expect(snapshot.hasProxy).assertEqual(true);
      expect(snapshot.deathRegistered).assertEqual(true);
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('connected/12/true/true/1');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
      expect(client.proxy === undefined).assertEqual(false);
      expect(client.state).assertEqual(snapshot.state);
    });

    /**
     * @tc.name          statePersistenceSnapshotOfFailedClient
     * @tc.desc          A failed snapshot records the failure state.
     * @tc.precondition  A fresh client received onFailed.
     * @tc.steps         1. A fresh client received onFailed.
     *                   2. Build a ClientSnapshot.
     *                   3. The state is failed and no proxy is stored.
     * @tc.expected      The state is failed and no proxy is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotOfFailedClient', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(16000001);
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_FAILED);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.hasProxy).assertEqual(false);
      expect(snapshot.deathRegistered).assertEqual(false);
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('failed/-1/false/false/1');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.state).assertEqual(snapshot.state);
    });

    /**
     * @tc.name          statePersistenceSnapshotAfterDisconnect
     * @tc.desc          The disconnect snapshot removes the proxy.
     * @tc.precondition  A session has disconnected.
     * @tc.steps         1. A session has disconnected.
     *                   2. Build a ClientSnapshot.
     *                   3. The proxy flag is false and the id is minus one.
     * @tc.expected      The proxy flag is false and the id is minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceSnapshotAfterDisconnect', 0, () => {
      const client = new ConnectionModel();
      client.connect(14);
      client.onConnect(new RemoteProxyModel());
      client.onDisconnect();
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.hasProxy).assertEqual(false);
      expect(snapshot.deathRegistered).assertEqual(false);
      expect(snapshot.toastCount).assertEqual(2);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/2');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.state).assertEqual(snapshot.state);
    });

    /**
     * @tc.name          statePersistenceSnapshotAfterSend
     * @tc.desc          The send snapshot records the extra toast.
     * @tc.precondition  A connected session sent once.
     * @tc.steps         1. A connected session sent once.
     *                   2. Build a ClientSnapshot.
     *                   3. The toast count equals two.
     * @tc.expected      The toast count equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotAfterSend', 0, () => {
      const client = new ConnectionModel();
      client.connect(15);
      client.onConnect(new RemoteProxyModel());
      client.sendString();
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(15);
      expect(snapshot.hasProxy).assertEqual(true);
      expect(snapshot.deathRegistered).assertEqual(true);
      expect(snapshot.toastCount).assertEqual(2);
      expect(snapshot.describe()).assertEqual('connected/15/true/true/2');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
      expect(client.proxy === undefined).assertEqual(false);
      expect(client.state).assertEqual(snapshot.state);
    });

    /**
     * @tc.name          statePersistenceSnapshotInequalityAcrossStates
     * @tc.desc          Snapshots from different states are unequal.
     * @tc.precondition  An idle and a connected client exist.
     * @tc.steps         1. An idle and a connected client exist.
     *                   2. Compare their snapshots.
     *                   3. sameAs returns false.
     * @tc.expected      sameAs returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotInequalityAcrossStates', 0, () => {
      const idle = new ClientSnapshot(new ConnectionModel());
      const live = new ClientSnapshot(createConnectedSession());
      expect(idle.sameAs(live)).assertFalse();
      expect(live.sameAs(idle)).assertFalse();
      expect(idle.state).assertEqual(STATE_DISCONNECTED);
      expect(live.state).assertEqual(STATE_CONNECTED);
      expect(idle.hasProxy).assertFalse();
      expect(live.hasProxy).assertTrue();
      expect(idle.describe() === live.describe()).assertFalse();
      expect(idle.connectId === live.connectId).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotEqualityForSameFlow
     * @tc.desc          Identical flows produce identical snapshots.
     * @tc.precondition  Two clients follow the same steps.
     * @tc.steps         1. Two clients follow the same steps.
     *                   2. Build and compare snapshots.
     *                   3. sameAs returns true.
     * @tc.expected      sameAs returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotEqualityForSameFlow', 0, () => {
      const first = new ConnectionModel();
      first.connect(13);
      first.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const second = new ConnectionModel();
      second.connect(13);
      second.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const left = new ClientSnapshot(first);
      const right = new ClientSnapshot(second);
      expect(left.sameAs(right)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(left.connectId).assertEqual(13);
      expect(left.state).assertEqual(STATE_CONNECTED);
      expect(left.toastCount).assertEqual(1);
      expect(right.hasProxy).assertTrue();
      expect(right.deathRegistered).assertTrue();
    });

    /**
     * @tc.name          statePersistenceSnapshotIsImmutable
     * @tc.desc          A snapshot does not follow later mutations.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Build a snapshot then disconnect.
     *                   3. The snapshot keeps the old fields.
     * @tc.expected      The snapshot keeps the old fields.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotIsImmutable', 0, () => {
      const session = createConnectedSession();
      const snapshot = new ClientSnapshot(session);
      session.onDisconnect();
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.sameAs(new ClientSnapshot(session))).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotKeepsConnectId
     * @tc.desc          The snapshot stores the numeric connect id.
     * @tc.precondition  A client connected with id thirty one.
     * @tc.steps         1. A client connected with id thirty one.
     *                   2. Build a ClientSnapshot.
     *                   3. connectId equals thirty one.
     * @tc.expected      connectId equals thirty one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotKeepsConnectId', 0, () => {
      const client = new ConnectionModel();
      client.connect(31);
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.connectId).assertEqual(31);
      expect(snapshot.state).assertEqual(STATE_CONNECTING);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.toastCount).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connecting/31/false/false/0');
      expect(client.connectId).assertEqual(snapshot.connectId);
      expect(snapshot.deathRegistered).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotTracksRegistration
     * @tc.desc          The registration flag mirrors the proxy flag.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Build a snapshot and inspect the flag.
     *                   3. deathRegistered is true.
     * @tc.expected      deathRegistered is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotTracksRegistration', 0, () => {
      const session = createConnectedSession();
      const snapshot = new ClientSnapshot(session);
      const proxy = session.proxy as RemoteProxyModel;
      expect(snapshot.deathRegistered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(session.deathRecipient.registered).assertTrue();
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.toastCount).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceSnapshotToastCountGrows
     * @tc.desc          The toast count grows with each event.
     * @tc.precondition  A connected session sends and disconnects.
     * @tc.steps         1. A connected session sends and disconnects.
     *                   2. Build a snapshot at the end.
     *                   3. The toast count equals three.
     * @tc.expected      The toast count equals three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceSnapshotToastCountGrows', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.onDisconnect();
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.toastCount).assertEqual(3);
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          statePersistenceEventTraceKeepsOrder
     * @tc.desc          The event trace lists entries in order.
     * @tc.precondition  A connected session sent once.
     * @tc.steps         1. A connected session sent once.
     *                   2. Read the recorder trace.
     *                   3. Connect precedes connected and send-ok.
     * @tc.expected      Connect precedes connected and send-ok.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventTraceKeepsOrder', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      const recorder = session.events;
      expect(recorder.entries[0].indexOf('connect:') === 0).assertTrue();
      expect(recorder.entries[1].indexOf('death-register:') === 0).assertTrue();
      expect(recorder.entries[2].indexOf('connected:') === 0).assertTrue();
      expect(recorder.entries[3].indexOf('send-ok:') === 0).assertTrue();
      expect(recorder.countOf('connect')).assertEqual(1);
      expect(recorder.countOf('send-ok')).assertEqual(1);
      expect(recorder.trace().indexOf('|') > 0).assertTrue();
      expect(recorder.size()).assertEqual(4);
    });

    /**
     * @tc.name          statePersistenceEventCountPerKind
     * @tc.desc          The recorder counts a repeated kind exactly.
     * @tc.precondition  A session connected, disconnected and connected again.
     * @tc.steps         1. A session connected, disconnected and connected again.
     *                   2. Count connect events.
     *                   3. The count is two.
     * @tc.expected      The count is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventCountPerKind', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(21);
      const recorder = session.events;
      expect(recorder.countOf('connect')).assertEqual(2);
      expect(recorder.countOf('connected')).assertEqual(1);
      expect(recorder.countOf('disconnected')).assertEqual(1);
      expect(recorder.entries[0].indexOf('connect:') === 0).assertTrue();
      expect(recorder.entries[recorder.size() - 1].indexOf('connect:') === 0).assertTrue();
      expect(recorder.size()).assertEqual(5);
      expect(recorder.countOf('death-register')).assertEqual(1);
      expect(recorder.countOf('failed')).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceEventLastEntry
     * @tc.desc          The recorder exposes the newest entry.
     * @tc.precondition  A session disconnected.
     * @tc.steps         1. A session disconnected.
     *                   2. Read the last entry.
     *                   3. The last entry is disconnected ok.
     * @tc.expected      The last entry is disconnected ok.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventLastEntry', 0, () => {
      const session = createConnectedSession();
      session.disconnectRequested();
      session.onDisconnect();
      const recorder = session.events;
      expect(recorder.last()).assertEqual('disconnected:ok');
      expect(recorder.countOf('disconnected')).assertEqual(1);
      expect(recorder.countOf('disconnect-request')).assertEqual(1);
      expect(recorder.entries[recorder.size() - 1].indexOf('disconnected:') === 0).assertTrue();
      expect(recorder.trace().endsWith('disconnected:ok')).assertTrue();
      expect(recorder.size()).assertEqual(5);
      expect(recorder.countOf('connected')).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceEventFingerprintStable
     * @tc.desc          The fingerprint is stable for equal traces.
     * @tc.precondition  Two recorders receive equal entries.
     * @tc.steps         1. Two recorders receive equal entries.
     *                   2. Compare their fingerprints.
     *                   3. Both fingerprints are equal.
     * @tc.expected      Both fingerprints are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventFingerprintStable', 0, () => {
      const left = new EventRecorder();
      const right = new EventRecorder();
      left.record('connect', 'a');
      left.record('connected', 'b');
      right.record('connect', 'a');
      right.record('connected', 'b');
      expect(left.fingerprint()).assertEqual(right.fingerprint());
      expect(left.trace()).assertEqual(right.trace());
      expect(left.size()).assertEqual(2);
      expect(right.size()).assertEqual(2);
      expect(left.fingerprint()).assertEqual(textFingerprint('connect:a|connected:b'));
      expect(left.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceEventFingerprintChanges
     * @tc.desc          A different trace changes the fingerprint.
     * @tc.precondition  Two recorders receive different entries.
     * @tc.steps         1. Two recorders receive different entries.
     *                   2. Compare their fingerprints.
     *                   3. The fingerprints differ.
     * @tc.expected      The fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventFingerprintChanges', 0, () => {
      const left = new EventRecorder();
      const right = new EventRecorder();
      left.record('connect', 'a');
      right.record('connect', 'b');
      expect(left.fingerprint() === right.fingerprint()).assertFalse();
      expect(left.trace() === right.trace()).assertFalse();
      expect(left.last()).assertEqual('connect:a');
      expect(right.last()).assertEqual('connect:b');
      expect(left.size()).assertEqual(1);
      expect(right.size()).assertEqual(1);
      expect(left.countOf('connect')).assertEqual(right.countOf('connect'));
    });

    /**
     * @tc.name          statePersistenceEventClearResetsTrace
     * @tc.desc          Clearing the recorder removes every entry.
     * @tc.precondition  A recorder with entries exists.
     * @tc.steps         1. A recorder with entries exists.
     *                   2. Call clear and read the size.
     *                   3. The size is zero and the trace is empty.
     * @tc.expected      The size is zero and the trace is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventClearResetsTrace', 0, () => {
      const recorder = new EventRecorder();
      recorder.record('connect', 'a');
      recorder.record('connected', 'b');
      const before = recorder.fingerprint();
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.last()).assertEqual('');
      expect(recorder.countOf('connect')).assertEqual(0);
      expect(recorder.fingerprint() === before).assertFalse();
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name          statePersistenceEventDetailIsPreserved
     * @tc.desc          The event detail is kept verbatim.
     * @tc.precondition  A session sent the sample payload.
     * @tc.steps         1. A session sent the sample payload.
     *                   2. Read the send-ok entry.
     *                   3. The entry ends with hello rpc.
     * @tc.expected      The entry ends with hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventDetailIsPreserved', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      const recorder = session.events;
      expect(recorder.entries[3]).assertEqual('send-ok:hello rpc');
      expect(recorder.entries[3].indexOf('hello rpc') > 0).assertTrue();
      expect(recorder.countOf('send-ok')).assertEqual(1);
      expect(recorder.last()).assertEqual('send-ok:hello rpc');
      expect(recorder.trace().indexOf('send-ok:hello rpc') >= 0).assertTrue();
      expect(recorder.size()).assertEqual(4);
      expect(recorder.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceEventKindPrefixIsStable
     * @tc.desc          Each event uses a kind colon detail layout.
     * @tc.precondition  A session completed a cycle.
     * @tc.steps         1. A session completed a cycle.
     *                   2. Check every entry for a colon.
     *                   3. Every entry contains the separator.
     * @tc.expected      Every entry contains the separator.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventKindPrefixIsStable', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.onDisconnect();
      const recorder = session.events;
      let separated = true;
      for (let index = 0; index < recorder.size(); index++) {
        if (recorder.entries[index].indexOf(':') < 0) {
          separated = false;
        }
      }
      expect(separated).assertTrue();
      expect(recorder.size() >= 5).assertTrue();
      expect(recorder.entries[0].indexOf(':') > 0).assertTrue();
      expect(recorder.entries[recorder.size() - 1].indexOf(':') > 0).assertTrue();
      expect(recorder.countOf('disconnected')).assertEqual(1);
      expect(recorder.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceEventIndependentRecorders
     * @tc.desc          Two recorders do not share their entries.
     * @tc.precondition  Two fresh recorders exist.
     * @tc.steps         1. Two fresh recorders exist.
     *                   2. Record in one and inspect both sizes.
     *                   3. Only the touched recorder grew.
     * @tc.expected      Only the touched recorder grew.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceEventIndependentRecorders', 0, () => {
      const left = new EventRecorder();
      const right = new EventRecorder();
      left.record('connect', 'x');
      left.record('connected', 'y');
      expect(left.size()).assertEqual(2);
      expect(right.size()).assertEqual(0);
      expect(right.trace()).assertEqual('');
      expect(left.countOf('connect')).assertEqual(1);
      expect(right.countOf('connect')).assertEqual(0);
      expect(left.last()).assertEqual('connected:y');
      expect(right.last()).assertEqual('');
    });

    /**
     * @tc.name          statePersistenceEventFingerprintOfEmptyTrace
     * @tc.desc          An empty trace has a deterministic fingerprint.
     * @tc.precondition  A fresh recorder exists.
     * @tc.steps         1. A fresh recorder exists.
     *                   2. Read the fingerprint of the empty trace.
     *                   3. It equals the fingerprint of an empty string.
     * @tc.expected      It equals the fingerprint of an empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceEventFingerprintOfEmptyTrace', 0, () => {
      const recorder = new EventRecorder();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
      expect(recorder.fingerprint()).assertEqual(recorder.fingerprint());
      expect(recorder.countOf('connect')).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace().length).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceEventManyEntries
     * @tc.desc          The recorder keeps every entry without trimming.
     * @tc.precondition  A recorder received five entries.
     * @tc.steps         1. A recorder received five entries.
     *                   2. Read the size and the last entry.
     *                   3. The size is five and the last is entry five.
     * @tc.expected      The size is five and the last is entry five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventManyEntries', 0, () => {
      const recorder = new EventRecorder();
      recorder.record('kind', 'e1');
      recorder.record('kind', 'e2');
      recorder.record('kind', 'e3');
      recorder.record('kind', 'e4');
      recorder.record('kind', 'e5');
      expect(recorder.size()).assertEqual(5);
      expect(recorder.last()).assertEqual('kind:e5');
      expect(recorder.countOf('kind')).assertEqual(5);
      expect(recorder.entries[0]).assertEqual('kind:e1');
      expect(recorder.entries[4]).assertEqual('kind:e5');
      expect(recorder.trace().indexOf('kind:e3') > 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceEventRepeatedKindCount
     * @tc.desc          Repeated kinds are counted independently.
     * @tc.precondition  A recorder received three connect entries.
     * @tc.steps         1. A recorder received three connect entries.
     *                   2. Count connect and connected kinds.
     *                   3. Three and zero are returned.
     * @tc.expected      Three and zero are returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventRepeatedKindCount', 0, () => {
      const recorder = new EventRecorder();
      recorder.record('connect', 'one');
      recorder.record('connect', 'two');
      recorder.record('connect', 'three');
      expect(recorder.countOf('connect')).assertEqual(3);
      expect(recorder.countOf('connected')).assertEqual(0);
      expect(recorder.size()).assertEqual(3);
      expect(recorder.last()).assertEqual('connect:three');
      expect(recorder.entries[1]).assertEqual('connect:two');
      expect(recorder.fingerprint()).assertEqual(textFingerprint('connect:one|connect:two|connect:three'));
    });

    /**
     * @tc.name          statePersistenceLogLevelsAreTagged
     * @tc.desc          The log buffer tags each level.
     * @tc.precondition  A connected session sent once.
     * @tc.steps         1. A connected session sent once.
     *                   2. Count INFO, WARN and ERROR entries.
     *                   3. INFO dominates and ERROR is zero.
     * @tc.expected      INFO dominates and ERROR is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceLogLevelsAreTagged', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      const logs = session.logs;
      expect(logs.countLevel(LEVEL_INFO) >= 3).assertTrue();
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(logs.levels.length).assertEqual(logs.lines.length);
      expect(logs.contains('onConnect')).assertTrue();
      expect(logs.contains('hello rpc')).assertTrue();
      expect(logs.size() >= 3).assertTrue();
      expect(logs.trace().indexOf('|') > 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceLogContainsRegistration
     * @tc.desc          The buffer keeps the registration message.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Search for registerDeathRecipient success.
     *                   3. The fragment is found.
     * @tc.expected      The fragment is found.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceLogContainsRegistration', 0, () => {
      const session = createConnectedSession();
      const logs = session.logs;
      expect(logs.contains('registerDeathRecipient success')).assertTrue();
      expect(logs.contains('onConnect')).assertTrue();
      expect(logs.countLevel(LEVEL_INFO) >= 2).assertTrue();
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(logs.size() > 0).assertTrue();
      expect(logs.levels.indexOf(LEVEL_INFO) >= 0).assertTrue();
      expect(logs.lines[0].indexOf('INFO') === 0).assertTrue();
      expect(logs.trace().length > 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceLogContainsReply
     * @tc.desc          The buffer records the reply text.
     * @tc.precondition  A connected session sent once.
     * @tc.steps         1. A connected session sent once.
     *                   2. Search for the reply fragment.
     *                   3. The reply is present.
     * @tc.expected      The reply is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceLogContainsReply', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      const logs = session.logs;
      expect(logs.contains('hello rpc')).assertTrue();
      expect(logs.lines[logs.size() - 1].indexOf('hello rpc') > 0).assertTrue();
      expect(logs.trace().indexOf('hello rpc') > 0).assertTrue();
      expect(logs.countLevel(LEVEL_INFO) >= 3).assertTrue();
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(logs.contains('sendMessageRequest')).assertFalse();
      expect(logs.levels.length).assertEqual(logs.size());
    });

    /**
     * @tc.name          statePersistenceLogBufferTrimsToLimit
     * @tc.desc          A small buffer drops the oldest lines.
     * @tc.precondition  A buffer with limit two receives three lines.
     * @tc.steps         1. A buffer with limit two receives three lines.
     *                   2. Read the size and contents.
     *                   3. Only the last two lines remain.
     * @tc.expected      Only the last two lines remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceLogBufferTrimsToLimit', 0, () => {
      const buffer = new LogBuffer(2);
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('a')).assertFalse();
      expect(buffer.contains('c')).assertTrue();
      expect(buffer.levels.length).assertEqual(2);
      expect(buffer.lines[0]).assertEqual('WARN b');
    });

    /**
     * @tc.name          statePersistenceLogClearEmptiesBuffer
     * @tc.desc          Clearing the buffer resets levels and lines.
     * @tc.precondition  A buffer with entries exists.
     * @tc.steps         1. A buffer with entries exists.
     *                   2. Call clear and read the size.
     *                   3. The size is zero.
     * @tc.expected      The size is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceLogClearEmptiesBuffer', 0, () => {
      const buffer = new LogBuffer(8);
      buffer.info('one');
      buffer.warn('two');
      buffer.error('three');
      const before = buffer.trace();
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.contains('one')).assertFalse();
      expect(buffer.trace()).assertEqual('');
      expect(before.length > 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceLogCountsPerLevel
     * @tc.desc          The buffer counts each level separately.
     * @tc.precondition  A buffer received two info and one error line.
     * @tc.steps         1. A buffer received two info and one error line.
     *                   2. Count both levels.
     *                   3. Two and one are returned.
     * @tc.expected      Two and one are returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceLogCountsPerLevel', 0, () => {
      const buffer = new LogBuffer(10);
      buffer.info('alpha');
      buffer.info('beta');
      buffer.error('gamma');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.size()).assertEqual(3);
      expect(buffer.levels.length).assertEqual(3);
      expect(buffer.contains('beta')).assertTrue();
      expect(buffer.contains('gamma')).assertTrue();
      expect(buffer.lines[2].indexOf('ERROR') === 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceToastListKeepsEveryMessage
     * @tc.desc          The toast list is append only.
     * @tc.precondition  A session connected, sent and disconnected.
     * @tc.steps         1. A session connected, sent and disconnected.
     *                   2. Read the toast list.
     *                   3. Three messages are stored in order.
     * @tc.expected      Three messages are stored in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceToastListKeepsEveryMessage', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[1]).assertEqual('sendRequest success');
      expect(session.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceToastLastReadsTail
     * @tc.desc          The last toast helper returns the tail.
     * @tc.precondition  A disconnected session exists.
     * @tc.steps         1. A disconnected session exists.
     *                   2. Call lastToast.
     *                   3. The disconnect message is returned.
     * @tc.expected      The disconnect message is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceToastLastReadsTail', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.lastToast() === SEND_FAIL_TOAST).assertFalse();
      expect(session.toasts[0] === session.toasts[1]).assertFalse();
      expect(session.toasts.length).assertEqual(session.toasts.length);
    });

    /**
     * @tc.name          statePersistenceToastClearedByReset
     * @tc.desc          reset empties the toast list.
     * @tc.precondition  A session with toasts was reset.
     * @tc.steps         1. A session with toasts was reset.
     *                   2. Read the toast list size.
     *                   3. The list is empty.
     * @tc.expected      The list is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceToastClearedByReset', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(3);
      session.reset();
      expect(session.toasts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual('');
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.isDisconnect).assertFalse();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          statePersistenceFailedCodePersists
     * @tc.desc          The failure code survives later callbacks.
     * @tc.precondition  A failed client received onDisconnect.
     * @tc.steps         1. A failed client received onDisconnect.
     *                   2. Read failedCode.
     *                   3. The original code is retained.
     * @tc.expected      The original code is retained.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceFailedCodePersists', 0, () => {
      const session = createConnectedSession();
      session.onFailed(16000003);
      const recorded = session.failedCode;
      session.onDisconnect();
      expect(recorded).assertEqual(16000003);
      expect(session.failedCode).assertEqual(recorded);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.events.countOf('failed')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.isConnected()).assertFalse();
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          statePersistenceProbeFlagPersists
     * @tc.desc          The probe flag survives until reset.
     * @tc.precondition  A disconnected session exists.
     * @tc.steps         1. A disconnected session exists.
     *                   2. Call reset and read the flag.
     *                   3. The flag becomes false.
     * @tc.expected      The flag becomes false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceProbeFlagPersists', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.isDisconnect).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      session.reset();
      expect(session.isDisconnect).assertFalse();
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.toasts.length).assertEqual(0);
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceWantPersistsAcrossCallbacks
     * @tc.desc          The want is not rebuilt by callbacks.
     * @tc.precondition  A custom want client completed a cycle.
     * @tc.steps         1. A custom want client completed a cycle.
     *                   2. Compare the want before and after.
     *                   3. The same object is still stored.
     * @tc.expected      The same object is still stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceWantPersistsAcrossCallbacks', 0, () => {
      const session = createConnectedSession();
      const want = session.want;
      const bundle = want.bundleName;
      const ability = want.abilityName;
      session.onDisconnect();
      session.connect(41);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(session.want === want).assertTrue();
      expect(session.want.bundleName).assertEqual(bundle);
      expect(session.want.abilityName).assertEqual(ability);
      expect(session.want.validate().length).assertEqual(0);
      expect(bundle).assertEqual('com.example.ipc_stub');
      expect(ability).assertEqual('ServiceAbility');
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          statePersistenceJoinedStateFields
     * @tc.desc          The joined helper serializes state fields.
     * @tc.precondition  An array of three fields exists.
     * @tc.steps         1. An array of three fields exists.
     *                   2. Join the fields with a slash.
     *                   3. The result is one slash separated string.
     * @tc.expected      The result is one slash separated string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceJoinedStateFields', 0, () => {
      const fields = ['connected', '7', 'true'];
      expect(joined(fields, '/')).assertEqual('connected/7/true');
      expect(joined(fields)).assertEqual('connected,7,true');
      expect(joined([], '/')).assertEqual('');
      expect(joined(['only'], '/')).assertEqual('only');
      expect(joined(fields, '/').split('/').length).assertEqual(3);
      expect(joined(fields, '/').indexOf('connected') === 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceCountOfRepeatedField
     * @tc.desc          The count helper counts a repeated field.
     * @tc.precondition  An array with two identical states exists.
     * @tc.steps         1. An array with two identical states exists.
     *                   2. Count the repeated state.
     *                   3. The result is two.
     * @tc.expected      The result is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceCountOfRepeatedField', 0, () => {
      const states = ['connected', 'connected', 'idle'];
      expect(countOf(states, 'connected')).assertEqual(2);
      expect(countOf(states, 'idle')).assertEqual(1);
      expect(countOf(states, 'failed')).assertEqual(0);
      expect(countOf([], 'connected')).assertEqual(0);
      expect(countOf(states, 'connected') + countOf(states, 'idle')).assertEqual(3);
      expect(countOf(states, 'connect')).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceUniqueStringsForStates
     * @tc.desc          The unique helper removes duplicate states.
     * @tc.precondition  An array with repeated state values exists.
     * @tc.steps         1. An array with repeated state values exists.
     *                   2. Call uniqueStrings.
     *                   3. Only distinct states remain in order.
     * @tc.expected      Only distinct states remain in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceUniqueStringsForStates', 0, () => {
      const values = ['connected', 'idle', 'connected', 'failed', 'idle'];
      const unique = uniqueStrings(values);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('connected');
      expect(unique[1]).assertEqual('idle');
      expect(unique[2]).assertEqual('failed');
      expect(sameStringArray(unique, ['connected', 'idle', 'failed'])).assertTrue();
      expect(uniqueStrings([]).length).assertEqual(0);
      expect(uniqueStrings(['a', 'a']).length).assertEqual(1);
    });

    /**
     * @tc.name          statePersistenceSameStringArrayOracle
     * @tc.desc          The array comparison respects order.
     * @tc.precondition  Two arrays differ only by order.
     * @tc.steps         1. Two arrays differ only by order.
     *                   2. Compare them and then compare a copy.
     *                   3. The reordered pair is false and the copy is true.
     * @tc.expected      The reordered pair is false and the copy is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSameStringArrayOracle', 0, () => {
      const left = ['connected', 'idle'];
      const right = ['idle', 'connected'];
      expect(sameStringArray(left, right)).assertFalse();
      expect(sameStringArray(left, ['connected', 'idle'])).assertTrue();
      expect(sameStringArray(left, ['connected'])).assertFalse();
      expect(sameStringArray([], [])).assertTrue();
      expect(left.length).assertEqual(right.length);
      expect(left[0]).assertEqual('connected');
    });

    /**
     * @tc.name          statePersistenceClampKeepsBounds
     * @tc.desc          The clamp helper respects both bounds.
     * @tc.precondition  Values below, inside and above a range exist.
     * @tc.steps         1. Values below, inside and above a range exist.
     *                   2. Clamp each value to one through nine.
     *                   3. The bounds and the interior value are returned.
     * @tc.expected      The bounds and the interior value are returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceClampKeepsBounds', 0, () => {
      expect(clampInt(-5, 1, 9)).assertEqual(1);
      expect(clampInt(4, 1, 9)).assertEqual(4);
      expect(clampInt(20, 1, 9)).assertEqual(9);
      expect(clampInt(1, 1, 9)).assertEqual(1);
      expect(clampInt(9, 1, 9)).assertEqual(9);
      expect(clampInt(0, 0, 0)).assertEqual(0);
      expect(clampInt(7, 7, 7)).assertEqual(7);
      expect(clampInt(-1, 0, 1)).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceTextFingerprintOfState
     * @tc.desc          The fingerprint depends on the state text.
     * @tc.precondition  Two different state descriptions exist.
     * @tc.steps         1. Two different state descriptions exist.
     *                   2. Fingerprint both descriptions.
     *                   3. The fingerprints differ and each is stable.
     * @tc.expected      The fingerprints differ and each is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceTextFingerprintOfState', 0, () => {
      const connected = 'connected/7/true/true/1';
      const disconnected = 'disconnected/-1/false/false/2';
      expect(textFingerprint(connected)).assertEqual(textFingerprint(connected));
      expect(textFingerprint(connected) === textFingerprint(disconnected)).assertFalse();
      expect(textFingerprint('') === textFingerprint(connected)).assertFalse();
      expect(textFingerprint(connected) >= 0).assertTrue();
      expect(textFingerprint(disconnected) >= 0).assertTrue();
      expect(textFingerprint(connected).toString().length > 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceFingerprintCollisionFreeSample
     * @tc.desc          A small sample set has distinct fingerprints.
     * @tc.precondition  Four distinct state labels exist.
     * @tc.steps         1. Four distinct state labels exist.
     *                   2. Fingerprint each label.
     *                   3. All four fingerprints are distinct.
     * @tc.expected      All four fingerprints are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceFingerprintCollisionFreeSample', 0, () => {
      const labels = ['idle', 'connecting', 'connected', 'failed'];
      const marks = [textFingerprint(labels[0]), textFingerprint(labels[1]), textFingerprint(labels[2]), textFingerprint(labels[3])];
      expect(marks.length).assertEqual(4);
      expect(marks[0] === marks[1]).assertFalse();
      expect(marks[1] === marks[2]).assertFalse();
      expect(marks[2] === marks[3]).assertFalse();
      expect(marks[0] === marks[3]).assertFalse();
      expect(textFingerprint(labels[2])).assertEqual(marks[2]);
      expect(labels.length).assertEqual(marks.length);
    });

    /**
     * @tc.name          statePersistenceMetricsFingerprintChangesWithSends
     * @tc.desc          The metrics fingerprint tracks the counters.
     * @tc.precondition  A session before and after a send exists.
     * @tc.steps         1. A session before and after a send exists.
     *                   2. Compare the two fingerprints.
     *                   3. The values differ.
     * @tc.expected      The values differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceMetricsFingerprintChangesWithSends', 0, () => {
      const session = createConnectedSession();
      const before = ClientMetrics.from(session);
      const beforeMark = before.fingerprint();
      session.sendString();
      const after = ClientMetrics.from(session);
      expect(after.replies).assertEqual(1);
      expect(after.sends).assertEqual(1);
      expect(after.fingerprint() === beforeMark).assertFalse();
      expect(before.fingerprint()).assertEqual(beforeMark);
      expect(after.successRatio()).assertEqual(1);
      expect(before.successRatio()).assertEqual(0);
      expect(after.connects).assertEqual(before.connects);
    });

    /**
     * @tc.name          statePersistenceMetricsSuccessRatio
     * @tc.desc          The success ratio reflects the counters.
     * @tc.precondition  A session with one successful send exists.
     * @tc.steps         1. A session with one successful send exists.
     *                   2. Read the ratio.
     *                   3. The ratio equals one.
     * @tc.expected      The ratio equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceMetricsSuccessRatio', 0, () => {
      const session = createConnectedSession();
      session.sendString('ratio');
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.fingerprint()).assertEqual(metrics.fingerprint());
    });

    /**
     * @tc.name          statePersistenceMetricsZeroRatio
     * @tc.desc          An idle metrics object reports a zero ratio.
     * @tc.precondition  A fresh metrics object exists.
     * @tc.steps         1. A fresh metrics object exists.
     *                   2. Read the ratio.
     *                   3. The ratio equals zero.
     * @tc.expected      The ratio equals zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('statePersistenceMetricsZeroRatio', 0, () => {
      const metrics = new ClientMetrics();
      expect(metrics.connects).assertEqual(0);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
      expect(metrics.successRatio() === 1).assertFalse();
    });

    /**
     * @tc.name          statePersistenceOptionFlagsAreStable
     * @tc.desc          The message option keeps its flags.
     * @tc.precondition  A synchronous option exists.
     * @tc.steps         1. A synchronous option exists.
     *                   2. Clone it and compare flags.
     *                   3. Both options report the same flag.
     * @tc.expected      Both options report the same flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceOptionFlagsAreStable', 0, () => {
      const option = new MessageOptionModel();
      const clone = option.clone();
      expect(option.flags).assertEqual(0);
      expect(clone.flags).assertEqual(option.flags);
      expect(option.waitTime).assertEqual(0);
      expect(clone.waitTime).assertEqual(option.waitTime);
      expect(option.isSync()).assertTrue();
      expect(clone.isSync()).assertTrue();
      expect(option.describe()).assertEqual(clone.describe());
      expect(option.isAsync()).assertFalse();
    });

    /**
     * @tc.name          statePersistenceOptionAsyncDescription
     * @tc.desc          The option description persists its fields.
     * @tc.precondition  An asynchronous option exists.
     * @tc.steps         1. An asynchronous option exists.
     *                   2. Read the description before and after a clone.
     *                   3. Both descriptions are identical.
     * @tc.expected      Both descriptions are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceOptionAsyncDescription', 0, () => {
      const option = new MessageOptionModel(1, 5, false);
      const clone = option.clone();
      expect(option.flags).assertEqual(1);
      expect(option.waitTime).assertEqual(5);
      expect(option.sync).assertFalse();
      expect(option.isAsync()).assertTrue();
      expect(clone.isAsync()).assertTrue();
      expect(clone.flags).assertEqual(1);
      expect(clone.waitTime).assertEqual(5);
      expect(option.describe()).assertEqual('1/5/false');
      expect(clone.describe()).assertEqual(option.describe());
    });

    /**
     * @tc.name          statePersistenceSnapshotAfterReconnect
     * @tc.desc          The snapshot follows a reconnect cycle.
     * @tc.precondition  A client reconnected on a new proxy.
     * @tc.steps         1. A client reconnected on a new proxy.
     *                   2. Build a ClientSnapshot.
     *                   3. The state is connected on the new id.
     * @tc.expected      The state is connected on the new id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotAfterReconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(120);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(120);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.connectId === 7).assertFalse();
      expect(snapshot.sameAs(new ClientSnapshot(session))).assertTrue();
    });

    /**
     * @tc.name          statePersistenceEventAfterResetEmpty
     * @tc.desc          reset empties the event recorder.
     * @tc.precondition  A session with events was reset.
     * @tc.steps         1. A session with events was reset.
     *                   2. Read the recorder size and fingerprint.
     *                   3. The size is zero and the fingerprint matches an empty trace.
     * @tc.expected      The size is zero and the fingerprint matches an empty trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventAfterResetEmpty', 0, () => {
      const session = createConnectedSession();
      session.sendString();
      session.reset();
      expect(session.events.size()).assertEqual(0);
      expect(session.events.trace()).assertEqual('');
      expect(session.events.fingerprint()).assertEqual(textFingerprint(''));
      expect(session.events.last()).assertEqual('');
      expect(session.events.countOf('connect')).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.toasts.length).assertEqual(0);
    });

    /**
     * @tc.name          statePersistenceLogsAfterDisconnect
     * @tc.desc          The disconnect keeps earlier log lines.
     * @tc.precondition  A connected session sent and disconnected.
     * @tc.steps         1. A connected session sent and disconnected.
     *                   2. Read the buffer size and last line.
     *                   3. The buffer still contains the reply and a disconnect line.
     * @tc.expected      The buffer still contains the reply and a disconnect line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceLogsAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      session.sendString('logged');
      const sizeBefore = session.logs.size();
      session.onDisconnect();
      expect(session.logs.size()).assertEqual(sizeBefore + 1);
      expect(session.logs.contains('hello rpc')).assertTrue();
      expect(session.logs.contains('onDisconnect')).assertTrue();
      expect(session.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(session.logs.levels.length).assertEqual(session.logs.size());
      expect(session.logs.size() >= 4).assertTrue();
      expect(session.logs.trace().indexOf('onDisconnect') > 0).assertTrue();
    });

    /**
     * @tc.name          statePersistenceToastAfterFailedSend
     * @tc.desc          A failed send appends the failure toast.
     * @tc.precondition  A disconnected client attempts a send.
     * @tc.steps         1. A disconnected client attempts a send.
     *                   2. Read the tail of the toast list.
     *                   3. The send failure text is last.
     * @tc.expected      The send failure text is last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceToastAfterFailedSend', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = session.sendString();
      expect(result.isSuccess()).assertFalse();
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[2]).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          statePersistenceMetricsFingerprintAfterFailure
     * @tc.desc          A failure changes the metrics fingerprint.
     * @tc.precondition  A session with one failed send exists.
     * @tc.steps         1. A session with one failed send exists.
     *                   2. Compare the fingerprint with the empty metrics.
     *                   3. The two fingerprints differ.
     * @tc.expected      The two fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceMetricsFingerprintAfterFailure', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = 16000003;
      session.sendString('fail');
      const metrics = ClientMetrics.from(session);
      const empty = new ClientMetrics();
      expect(metrics.failures).assertEqual(1);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.fingerprint() === empty.fingerprint()).assertFalse();
      expect(metrics.successRatio()).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          statePersistenceOptionWaitTimeClone
     * @tc.desc          The option clone copies the wait time.
     * @tc.precondition  An asynchronous option with wait five exists.
     * @tc.steps         1. An asynchronous option with wait five exists.
     *                   2. Clone and compare wait times.
     *                   3. Both wait times equal five.
     * @tc.expected      Both wait times equal five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('statePersistenceOptionWaitTimeClone', 0, () => {
      const option = new MessageOptionModel(1, 5, false);
      const clone = option.clone();
      expect(clone.waitTime).assertEqual(5);
      expect(clone.waitTime).assertEqual(option.waitTime);
      clone.waitTime = 9;
      expect(option.waitTime).assertEqual(5);
      expect(clone.waitTime).assertEqual(9);
      expect(option.flags).assertEqual(1);
      expect(clone.flags).assertEqual(1);
      expect(option.isAsync()).assertTrue();
    });

    /**
     * @tc.name          statePersistenceClampUpperEdge
     * @tc.desc          The clamp helper returns the upper bound unchanged.
     * @tc.precondition  The upper bound value is supplied.
     * @tc.steps         1. The upper bound value is supplied.
     *                   2. Clamp the upper bound.
     *                   3. The same upper bound is returned.
     * @tc.expected      The same upper bound is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceClampUpperEdge', 0, () => {
      expect(clampInt(9, 1, 9)).assertEqual(9);
      expect(clampInt(10, 1, 9)).assertEqual(9);
      expect(clampInt(100, 1, 9)).assertEqual(9);
      expect(clampInt(1, 1, 9)).assertEqual(1);
      expect(clampInt(0, 1, 9)).assertEqual(1);
      expect(clampInt(5, 5, 5)).assertEqual(5);
      expect(clampInt(4, 5, 5)).assertEqual(5);
      expect(clampInt(6, 5, 5)).assertEqual(5);
    });

    /**
     * @tc.name          statePersistenceSnapshotDescribeRoundTrip
     * @tc.desc          The snapshot description parses into five fields.
     * @tc.precondition  A disconnected session snapshot exists.
     * @tc.steps         1. A disconnected session snapshot exists.
     *                   2. Split the description on the slash.
     *                   3. Five fields are produced and the state is first.
     * @tc.expected      Five fields are produced and the state is first.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotDescribeRoundTrip', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const snapshot = new ClientSnapshot(session);
      const parts = snapshot.describe().split('/');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual(STATE_DISCONNECTED);
      expect(parts[1]).assertEqual('-1');
      expect(parts[2]).assertEqual('false');
      expect(parts[3]).assertEqual('false');
      expect(parts[4]).assertEqual('2');
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/2');
    });

    /**
     * @tc.name          statePersistenceEventTraceAfterFailure
     * @tc.desc          A failure is recorded in the event trace.
     * @tc.precondition  A client received onFailed.
     * @tc.steps         1. A client received onFailed.
     *                   2. Read the trace and the failed count.
     *                   3. One failed event carries the code.
     * @tc.expected      One failed event carries the code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceEventTraceAfterFailure', 0, () => {
      const client = new ConnectionModel();
      client.connect(140);
      client.onFailed(16000002);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.last()).assertEqual('failed:16000002');
      expect(client.events.trace().indexOf('failed:16000002') > 0).assertTrue();
      expect(client.failedCode).assertEqual(16000002);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          statePersistenceSnapshotStateTransition
     * @tc.desc          Two snapshots of one client differ across a transition.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. A connecting client exists.
     *                   2. Snapshot, complete the handshake, snapshot again.
     *                   3. The two snapshots are not equal.
     * @tc.expected      The two snapshots are not equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceSnapshotStateTransition', 0, () => {
      const client = new ConnectionModel();
      client.connect(141);
      const before = new ClientSnapshot(client);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const after = new ClientSnapshot(client);
      expect(before.state).assertEqual(STATE_CONNECTING);
      expect(after.state).assertEqual(STATE_CONNECTED);
      expect(before.sameAs(after)).assertFalse();
      expect(after.sameAs(before)).assertFalse();
      expect(before.hasProxy).assertFalse();
      expect(after.hasProxy).assertTrue();
      expect(before.connectId).assertEqual(after.connectId);
      expect(after.toastCount).assertEqual(before.toastCount + 1);
    });

    /**
     * @tc.name          statePersistenceToastCountMonotonic
     * @tc.desc          The toast count never decreases without a reset.
     * @tc.precondition  A session performs three actions.
     * @tc.steps         1. A session performs three actions.
     *                   2. Read the count after each action.
     *                   3. The count grows one at a time.
     * @tc.expected      The count grows one at a time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('statePersistenceToastCountMonotonic', 0, () => {
      const session = createConnectedSession();
      const start = session.toasts.length;
      session.sendString();
      const afterSend = session.toasts.length;
      session.onDisconnect();
      const afterDisconnect = session.toasts.length;
      expect(start).assertEqual(1);
      expect(afterSend).assertEqual(2);
      expect(afterDisconnect).assertEqual(3);
      expect(afterSend >= start).assertTrue();
      expect(afterDisconnect >= afterSend).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
    });

  });
}
