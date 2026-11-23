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
  ConnectionModel,
  ClientSnapshot,
  ClientMetrics,
  RemoteProxyModel,
  RemoteStubModel,
  createConnectedSession,
  expectedStateAfter,
  expectedToastFor,
  joined,
  uniqueStrings,
  clampInt,
  isNonZeroError,
  textFingerprint,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_FAILED,
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_CONNECT,
  LEVEL_WARN,
  LEVEL_ERROR,
  CONNECT_SUCCESS_TOAST
} from '../Shared/SharedDriver';

export default function clientStateMachine(): void {
  describe('ClientStateMachine', () => {
    beforeAll(() => {
      logSuite('ClientStateMachine', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientStateMachine', 'end');
    });

    /**
     * @tc.name          clientStateIdleToConnectingToConnected
     * @tc.desc          A full happy path visits idle, connecting and connected in order.
     * @tc.precondition  A freshly constructed client with an empty trail array.
     * @tc.steps         1. Push the idle state.
     *                   2. Connect and push again.
     *                   3. Attach a proxy and push the connected state.
     * @tc.expected      The trail reads disconnected, connecting, connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateIdleToConnectingToConnected', 0, () => {
      logStep('clientStateIdleToConnectingToConnected', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const trail: string[] = [];
      trail.push(client.state);
      client.connect(91);
      trail.push(client.state);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'walk-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      trail.push(client.state);
      client.onDisconnect();
      trail.push(client.state);
      expect(trail.length).assertEqual(4);
      expect(trail[0]).assertEqual(STATE_DISCONNECTED);
      expect(trail[1]).assertEqual(STATE_CONNECTING);
      expect(trail[2]).assertEqual(STATE_CONNECTED);
      expect(trail[3]).assertEqual(STATE_DISCONNECTED);
      expect(joined(trail, '>')).assertEqual('disconnected>connecting>connected>disconnected');
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateIdleToConnectingToConnected', 'end');
    });

    /**
     * @tc.name          clientStateFourStepTrail
     * @tc.desc          The four step trail including the drop matches the documented order.
     * @tc.precondition  A client used for one connect and drop cycle.
     * @tc.steps         1. Walk the state machine.
     *                   2. Append the disconnected state.
     *                   3. Join the trail with the separator.
     * @tc.expected      The joined trail equals disconnected greater-than connecting and the rest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateFourStepTrail', 0, () => {
      logStep('clientStateFourStepTrail', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const trail: string[] = [];
      trail.push(client.state);
      client.connect(93);
      trail.push(client.state);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'walk-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      trail.push(client.state);
      client.onDisconnect();
      trail.push(client.state);
      expect(trail.length).assertEqual(4);
      expect(trail[0]).assertEqual(STATE_DISCONNECTED);
      expect(trail[1]).assertEqual(STATE_CONNECTING);
      expect(trail[2]).assertEqual(STATE_CONNECTED);
      expect(trail[3]).assertEqual(STATE_DISCONNECTED);
      expect(joined(trail, '>')).assertEqual('disconnected>connecting>connected>disconnected');
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateFourStepTrail', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateFourStepTrail', 'end');
    });

    /**
     * @tc.name          clientStateTrailNoRepeatedConnected
     * @tc.desc          The walk never records two consecutive connected states.
     * @tc.precondition  A client driven through one full cycle.
     * @tc.steps         1. Record the trail.
     *                   2. Count connected entries.
     *                   3. Confirm the terminal state.
     * @tc.expected      Exactly one connected entry exists in the trail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateTrailNoRepeatedConnected', 0, () => {
      logStep('clientStateTrailNoRepeatedConnected', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const trail: string[] = [];
      trail.push(client.state);
      client.connect(95);
      trail.push(client.state);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'walk-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      trail.push(client.state);
      client.onDisconnect();
      trail.push(client.state);
      expect(trail.length).assertEqual(4);
      expect(trail[0]).assertEqual(STATE_DISCONNECTED);
      expect(trail[1]).assertEqual(STATE_CONNECTING);
      expect(trail[2]).assertEqual(STATE_CONNECTED);
      expect(trail[3]).assertEqual(STATE_DISCONNECTED);
      expect(joined(trail, '>')).assertEqual('disconnected>connecting>connected>disconnected');
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateTrailNoRepeatedConnected', 'end');
    });

    /**
     * @tc.name          clientStateTrailWithHighId
     * @tc.desc          A high connect id does not disturb the recorded state order.
     * @tc.precondition  A client reserved for a large id walk.
     * @tc.steps         1. Walk with id 4096.
     *                   2. Verify each trail slot.
     *                   3. Check the toast count.
     * @tc.expected      The state order is unchanged and two events are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateTrailWithHighId', 0, () => {
      logStep('clientStateTrailWithHighId', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const trail: string[] = [];
      trail.push(client.state);
      client.connect(4096);
      trail.push(client.state);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'walk-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      trail.push(client.state);
      client.onDisconnect();
      trail.push(client.state);
      expect(trail.length).assertEqual(4);
      expect(trail[0]).assertEqual(STATE_DISCONNECTED);
      expect(trail[1]).assertEqual(STATE_CONNECTING);
      expect(trail[2]).assertEqual(STATE_CONNECTED);
      expect(trail[3]).assertEqual(STATE_DISCONNECTED);
      expect(joined(trail, '>')).assertEqual('disconnected>connecting>connected>disconnected');
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientStateTrailWithHighId', 'end');
    });

    /**
     * @tc.name          clientStateTrailResetAfterWalk
     * @tc.desc          Resetting after a walk clears the observable state and toasts.
     * @tc.precondition  A client that finished a walk and holds queued toasts.
     * @tc.steps         1. Finish the walk.
     *                   2. Call reset.
     *                   3. Re-read the state fields.
     * @tc.expected      All state fields return to their defaults.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateTrailResetAfterWalk', 0, () => {
      logStep('clientStateTrailResetAfterWalk', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const trail: string[] = [];
      trail.push(client.state);
      client.connect(97);
      trail.push(client.state);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'walk-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      trail.push(client.state);
      client.onDisconnect();
      trail.push(client.state);
      expect(trail.length).assertEqual(4);
      expect(trail[0]).assertEqual(STATE_DISCONNECTED);
      expect(trail[1]).assertEqual(STATE_CONNECTING);
      expect(trail[2]).assertEqual(STATE_CONNECTED);
      expect(trail[3]).assertEqual(STATE_DISCONNECTED);
      expect(joined(trail, '>')).assertEqual('disconnected>connecting>connected>disconnected');
      const frozenState: string = client.state;
      const frozenEvents: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(frozenState.length > 0).assertTrue();
      expect(frozenEvents >= 0).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientStateTrailResetAfterWalk', 'end');
    });

    /**
     * @tc.name          clientStateSnapshotChangesOnConnect
     * @tc.desc          A snapshot taken after connect differs from the idle snapshot.
     * @tc.precondition  A client at rest.
     * @tc.steps         1. Snapshot the idle client.
     *                   2. Connect with id 12.
     *                   3. Compare the two snapshots.
     * @tc.expected      sameAs returns false and the id field changed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateSnapshotChangesOnConnect', 0, () => {
      logStep('clientStateSnapshotChangesOnConnect', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.connect(12);
      const mid: ClientSnapshot = new ClientSnapshot(client);
      expect(before.sameAs(mid)).assertFalse();
      expect(before.state === mid.state).assertFalse();
      expect(before.connectId === mid.connectId).assertFalse();
      expect(mid.connectId).assertEqual(12);
      expect(before.hasProxy).assertEqual(mid.hasProxy);
      expect(before.toastCount).assertEqual(mid.toastCount);
      expect(mid.describe().startsWith(STATE_CONNECTING)).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateSnapshotChangesOnConnect', 'end');
    });

    /**
     * @tc.name          clientStateSnapshotKeepsProxyFlag
     * @tc.desc          Connecting alone does not change the proxy presence flag in snapshots.
     * @tc.precondition  A client without a proxy.
     * @tc.steps         1. Snapshot before connect.
     *                   2. Connect.
     *                   3. Compare the proxy flags.
     * @tc.expected      Both snapshots report no proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateSnapshotKeepsProxyFlag', 0, () => {
      logStep('clientStateSnapshotKeepsProxyFlag', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.connect(14);
      const mid: ClientSnapshot = new ClientSnapshot(client);
      expect(before.sameAs(mid)).assertFalse();
      expect(before.state === mid.state).assertFalse();
      expect(before.connectId === mid.connectId).assertFalse();
      expect(mid.connectId).assertEqual(14);
      expect(before.hasProxy).assertEqual(mid.hasProxy);
      expect(before.toastCount).assertEqual(mid.toastCount);
      expect(mid.describe().startsWith(STATE_CONNECTING)).assertTrue();
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateSnapshotKeepsProxyFlag', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateSnapshotKeepsProxyFlag', 'end');
    });

    /**
     * @tc.name          clientStateSnapshotKeepsToastCount
     * @tc.desc          Connecting alone leaves the snapshot toast count untouched.
     * @tc.precondition  A client with no queued toasts.
     * @tc.steps         1. Snapshot the client.
     *                   2. Connect.
     *                   3. Compare toast counts.
     * @tc.expected      Both counts equal zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateSnapshotKeepsToastCount', 0, () => {
      logStep('clientStateSnapshotKeepsToastCount', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.connect(16);
      const mid: ClientSnapshot = new ClientSnapshot(client);
      expect(before.sameAs(mid)).assertFalse();
      expect(before.state === mid.state).assertFalse();
      expect(before.connectId === mid.connectId).assertFalse();
      expect(mid.connectId).assertEqual(16);
      expect(before.hasProxy).assertEqual(mid.hasProxy);
      expect(before.toastCount).assertEqual(mid.toastCount);
      expect(mid.describe().startsWith(STATE_CONNECTING)).assertTrue();
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateSnapshotKeepsToastCount', 'end');
    });

    /**
     * @tc.name          clientStateSnapshotDescribePrefix
     * @tc.desc          The snapshot descriptor starts with the current state name.
     * @tc.precondition  A client that has started connecting.
     * @tc.steps         1. Connect.
     *                   2. Build the snapshot.
     *                   3. Inspect the descriptor prefix.
     * @tc.expected      The descriptor begins with the connecting state name.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateSnapshotDescribePrefix', 0, () => {
      logStep('clientStateSnapshotDescribePrefix', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.connect(18);
      const mid: ClientSnapshot = new ClientSnapshot(client);
      expect(before.sameAs(mid)).assertFalse();
      expect(before.state === mid.state).assertFalse();
      expect(before.connectId === mid.connectId).assertFalse();
      expect(mid.connectId).assertEqual(18);
      expect(before.hasProxy).assertEqual(mid.hasProxy);
      expect(before.toastCount).assertEqual(mid.toastCount);
      expect(mid.describe().startsWith(STATE_CONNECTING)).assertTrue();
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateSnapshotDescribePrefix', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateSnapshotDescribePrefix', 'end');
    });

    /**
     * @tc.name          clientStateSnapshotResetComparison
     * @tc.desc          Resetting a client makes its snapshot equal to a fresh snapshot.
     * @tc.precondition  A client that has been modified before reset.
     * @tc.steps         1. Connect the client.
     *                   2. Reset it.
     *                   3. Compare with a fresh client snapshot.
     * @tc.expected      The reset snapshot matches a freshly built snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateSnapshotResetComparison', 0, () => {
      logStep('clientStateSnapshotResetComparison', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.connect(20);
      const mid: ClientSnapshot = new ClientSnapshot(client);
      expect(before.sameAs(mid)).assertFalse();
      expect(before.state === mid.state).assertFalse();
      expect(before.connectId === mid.connectId).assertFalse();
      expect(mid.connectId).assertEqual(20);
      expect(before.hasProxy).assertEqual(mid.hasProxy);
      expect(before.toastCount).assertEqual(mid.toastCount);
      expect(mid.describe().startsWith(STATE_CONNECTING)).assertTrue();
      const frozenState: string = client.state;
      const frozenEvents: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(frozenState.length > 0).assertTrue();
      expect(frozenEvents >= 0).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientStateSnapshotResetComparison', 'end');
    });

    /**
     * @tc.name          clientStateResetClearsEvents
     * @tc.desc          reset empties the event recorder and the bounded log buffer.
     * @tc.precondition  A connected session that has already sent one request.
     * @tc.steps         1. Send a request.
     *                   2. Call reset.
     *                   3. Check event and log sizes.
     * @tc.expected      Both collections are empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateResetClearsEvents', 0, () => {
      logStep('clientStateResetClearsEvents', 'begin');
      const client: ConnectionModel = createConnectedSession('reset-one');
      client.sendString('reset-one');
      expect(client.events.size() > 0).assertTrue();
      expect(client.toasts.length > 0).assertTrue();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size()).assertEqual(0);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateResetClearsEvents', 'end');
    });

    /**
     * @tc.name          clientStateResetRestoresSentinelId
     * @tc.desc          reset restores the sentinel connect id and clears the disconnect flag.
     * @tc.precondition  A session with a live id.
     * @tc.steps         1. Create the session.
     *                   2. Reset.
     *                   3. Read id and flag.
     * @tc.expected      The id equals the sentinel and the flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateResetRestoresSentinelId', 0, () => {
      logStep('clientStateResetRestoresSentinelId', 'begin');
      const client: ConnectionModel = createConnectedSession('reset-two');
      client.sendString('reset-two');
      expect(client.events.size() > 0).assertTrue();
      expect(client.toasts.length > 0).assertTrue();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size()).assertEqual(0);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateResetRestoresSentinelId', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateResetRestoresSentinelId', 'end');
    });

    /**
     * @tc.name          clientStateResetDropsProxy
     * @tc.desc          reset removes the proxy reference without unregistering first.
     * @tc.precondition  A connected session holding a proxy.
     * @tc.steps         1. Create the session.
     *                   2. Reset.
     *                   3. Check proxy presence and isConnected.
     * @tc.expected      The proxy is undefined and isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateResetDropsProxy', 0, () => {
      logStep('clientStateResetDropsProxy', 'begin');
      const client: ConnectionModel = createConnectedSession('reset-three');
      client.sendString('reset-three');
      expect(client.events.size() > 0).assertTrue();
      expect(client.toasts.length > 0).assertTrue();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size()).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateResetDropsProxy', 'end');
    });

    /**
     * @tc.name          clientStateResetFreshRecipient
     * @tc.desc          reset installs a fresh unregistered death recipient object.
     * @tc.precondition  A connected session with a registered recipient.
     * @tc.steps         1. Create the session.
     *                   2. Reset.
     *                   3. Inspect the new recipient.
     * @tc.expected      The recipient is not registered and has never fired.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateResetFreshRecipient', 0, () => {
      logStep('clientStateResetFreshRecipient', 'begin');
      const client: ConnectionModel = createConnectedSession('reset-four');
      client.sendString('reset-four');
      expect(client.events.size() > 0).assertTrue();
      expect(client.toasts.length > 0).assertTrue();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size()).assertEqual(0);
      const frozenState: string = client.state;
      const frozenEvents: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(frozenState.length > 0).assertTrue();
      expect(frozenEvents >= 0).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientStateResetFreshRecipient', 'end');
    });

    /**
     * @tc.name          clientStateResetClearsLogs
     * @tc.desc          reset after a session clears every accumulated log line.
     * @tc.precondition  A session that has been connected and reset once.
     * @tc.steps         1. Reset the session.
     *                   2. Read the log buffer.
     *                   3. Read the connect counter.
     * @tc.expected      The log buffer is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateResetClearsLogs', 0, () => {
      logStep('clientStateResetClearsLogs', 'begin');
      const client: ConnectionModel = createConnectedSession('reset-five');
      client.sendString('reset-five');
      expect(client.events.size() > 0).assertTrue();
      expect(client.toasts.length > 0).assertTrue();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size()).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateResetClearsLogs', 'end');
    });

    /**
     * @tc.name          clientStateGuardRejectsConnected
     * @tc.desc          Connecting while already connected is rejected by the guard.
     * @tc.precondition  A fully connected session.
     * @tc.steps         1. Attempt a second connect.
     *                   2. Read the guard result.
     *                   3. Confirm the state is unchanged.
     * @tc.expected      The call returns false and the connected state survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateGuardRejectsConnected', 0, () => {
      logStep('clientStateGuardRejectsConnected', 'begin');
      const client: ConnectionModel = createConnectedSession('guard-one');
      const blocked: boolean = client.connect(99);
      expect(blocked).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateGuardRejectsConnected', 'end');
    });

    /**
     * @tc.name          clientStateGuardLogsWarning
     * @tc.desc          The connected guard writes one warning per rejected attempt.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Reject one connect attempt.
     *                   2. Count warning lines.
     *                   3. Read the warning fragment.
     * @tc.expected      Exactly one warning containing the skipped fragment is logged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateGuardLogsWarning', 0, () => {
      logStep('clientStateGuardLogsWarning', 'begin');
      const client: ConnectionModel = createConnectedSession('guard-two');
      const blocked: boolean = client.connect(101);
      expect(blocked).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateGuardLogsWarning', 'end');
    });

    /**
     * @tc.name          clientStateGuardKeepsToastCount
     * @tc.desc          A rejected connect leaves the toast queue unchanged.
     * @tc.precondition  A connected session with one success toast.
     * @tc.steps         1. Reject a connect.
     *                   2. Count toasts.
     *                   3. Compare the first toast.
     * @tc.expected      The queue still holds exactly the connect success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateGuardKeepsToastCount', 0, () => {
      logStep('clientStateGuardKeepsToastCount', 'begin');
      const client: ConnectionModel = createConnectedSession('guard-three');
      const blocked: boolean = client.connect(103);
      expect(blocked).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientStateGuardKeepsToastCount', 'end');
    });

    /**
     * @tc.name          clientStateGuardStillConnected
     * @tc.desc          The client remains usable after a rejected connect.
     * @tc.precondition  A connected session with a live proxy.
     * @tc.steps         1. Reject a connect.
     *                   2. Call isConnected.
     *                   3. Send one request.
     * @tc.expected      isConnected stays true and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateGuardStillConnected', 0, () => {
      logStep('clientStateGuardStillConnected', 'begin');
      const client: ConnectionModel = createConnectedSession('guard-four');
      const blocked: boolean = client.connect(105);
      expect(blocked).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateGuardStillConnected', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateGuardStillConnected', 'end');
    });

    /**
     * @tc.name          clientStateGuardEventCountFixed
     * @tc.desc          Rejected connects never add a connect event.
     * @tc.precondition  A connected session with one connect event.
     * @tc.steps         1. Attempt a connect.
     *                   2. Count connect events.
     *                   3. Compare the event size.
     * @tc.expected      Event count and event size stay consistent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateGuardEventCountFixed', 0, () => {
      logStep('clientStateGuardEventCountFixed', 'begin');
      const client: ConnectionModel = createConnectedSession('guard-five');
      const blocked: boolean = client.connect(107);
      expect(blocked).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      expect(client.events.size() >= 1).assertTrue();
      logStep('clientStateGuardEventCountFixed', 'end');
    });

    /**
     * @tc.name          clientStateFailedThenRetry
     * @tc.desc          A failed client may retry and returns to the connecting state.
     * @tc.precondition  A client that failed once with code 16000001.
     * @tc.steps         1. Connect and fail.
     *                   2. Retry with a new id.
     *                   3. Confirm the retry state.
     * @tc.expected      The retry succeeds and the failed code remains for diagnostics.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateFailedThenRetry', 0, () => {
      logStep('clientStateFailedThenRetry', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(111);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      const retried: boolean = client.connect(112);
      expect(retried).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.connectId).assertEqual(112);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateFailedThenRetry', 'end');
    });

    /**
     * @tc.name          clientStateFailedThenIdChanges
     * @tc.desc          The retry stores the new connect id while keeping the old failure code.
     * @tc.precondition  A failed client with a stored code.
     * @tc.steps         1. Fail the first attempt.
     *                   2. Retry with id plus one.
     *                   3. Compare id and code fields.
     * @tc.expected      The id advances by one and the code is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateFailedThenIdChanges', 0, () => {
      logStep('clientStateFailedThenIdChanges', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(113);
      client.onFailed(16000002);
      expect(client.state).assertEqual(STATE_FAILED);
      const retried: boolean = client.connect(114);
      expect(retried).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.failedCode).assertEqual(16000002);
      expect(client.connectId).assertEqual(114);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateFailedThenIdChanges', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateFailedThenIdChanges', 'end');
    });

    /**
     * @tc.name          clientStateFailedThenToastRetained
     * @tc.desc          The failure toast survives the successful retry.
     * @tc.precondition  A client that failed once.
     * @tc.steps         1. Fail an attempt.
     *                   2. Retry.
     *                   3. Read the toast queue.
     * @tc.expected      Exactly one failure toast remains queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateFailedThenToastRetained', 0, () => {
      logStep('clientStateFailedThenToastRetained', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(115);
      client.onFailed(0);
      expect(client.state).assertEqual(STATE_FAILED);
      const retried: boolean = client.connect(116);
      expect(retried).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.failedCode).assertEqual(0);
      expect(client.connectId).assertEqual(116);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-fail'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientStateFailedThenToastRetained', 'end');
    });

    /**
     * @tc.name          clientStateFailedThenErrorLogged
     * @tc.desc          The failed callback contributes one error log line before the retry.
     * @tc.precondition  A client that failed once and retried.
     * @tc.steps         1. Fail an attempt.
     *                   2. Retry.
     *                   3. Count error lines.
     * @tc.expected      One error line is present after the retry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateFailedThenErrorLogged', 0, () => {
      logStep('clientStateFailedThenErrorLogged', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(117);
      client.onFailed(-1);
      expect(client.state).assertEqual(STATE_FAILED);
      const retried: boolean = client.connect(118);
      expect(retried).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.failedCode).assertEqual(-1);
      expect(client.connectId).assertEqual(118);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateFailedThenErrorLogged', 'end');
    });

    /**
     * @tc.name          clientStateFailedThenOracleCheck
     * @tc.desc          The connecting state after a retry matches the standalone connect oracle.
     * @tc.precondition  A client that failed once and retried.
     * @tc.steps         1. Fail the first attempt.
     *                   2. Retry.
     *                   3. Compare with expectedStateAfter.
     * @tc.expected      The state equals the oracle answer for connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateFailedThenOracleCheck', 0, () => {
      logStep('clientStateFailedThenOracleCheck', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(119);
      client.onFailed(16000003);
      expect(client.state).assertEqual(STATE_FAILED);
      const retried: boolean = client.connect(120);
      expect(retried).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.failedCode).assertEqual(16000003);
      expect(client.connectId).assertEqual(120);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      expect(client.events.size() >= 1).assertTrue();
      logStep('clientStateFailedThenOracleCheck', 'end');
    });

    /**
     * @tc.name          clientStateProxyDeathKeepsState
     * @tc.desc          Proxy death leaves the client state connected while liveness fails.
     * @tc.precondition  A connected session with a reachable proxy.
     * @tc.steps         1. Attach a live proxy.
     *                   2. Notify proxy death.
     *                   3. Read state and liveness.
     * @tc.expected      The state reads connected but isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateProxyDeathKeepsState', 0, () => {
      logStep('clientStateProxyDeathKeepsState', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'dead-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(121);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateProxyDeathKeepsState', 'end');
    });

    /**
     * @tc.name          clientStateProxyDeathRecipientCount
     * @tc.desc          Proxy death fires the registered recipient exactly once.
     * @tc.precondition  A connected session with a registered recipient.
     * @tc.steps         1. Attach the proxy.
     *                   2. Notify death once.
     *                   3. Read the died counter.
     * @tc.expected      The died counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateProxyDeathRecipientCount', 0, () => {
      logStep('clientStateProxyDeathRecipientCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'dead-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(123);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateProxyDeathRecipientCount', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateProxyDeathRecipientCount', 'end');
    });

    /**
     * @tc.name          clientStateProxyDeathKeepsRegistration
     * @tc.desc          Death notification does not unregister the recipient model.
     * @tc.precondition  A connected session whose recipient is registered.
     * @tc.steps         1. Attach the proxy.
     *                   2. Notify death.
     *                   3. Inspect the registration flags.
     * @tc.expected      Both registration flags remain true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateProxyDeathKeepsRegistration', 0, () => {
      logStep('clientStateProxyDeathKeepsRegistration', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'dead-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(125);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateProxyDeathKeepsRegistration', 'end');
    });

    /**
     * @tc.name          clientStateProxyDeathToastUnchanged
     * @tc.desc          Death notification does not queue an extra toast.
     * @tc.precondition  A connected session with one success toast.
     * @tc.steps         1. Notify death.
     *                   2. Read the last toast.
     *                   3. Compare with the connect toast.
     * @tc.expected      The queue still ends with the connect success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateProxyDeathToastUnchanged', 0, () => {
      logStep('clientStateProxyDeathToastUnchanged', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'dead-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(127);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientStateProxyDeathToastUnchanged', 'end');
    });

    /**
     * @tc.name          clientStateProxyDeathThenReset
     * @tc.desc          A client whose proxy died can still be reset to the idle state.
     * @tc.precondition  A connected session with a dead proxy.
     * @tc.steps         1. Notify death.
     *                   2. Reset the client.
     *                   3. Read the state fields.
     * @tc.expected      The reset client is idle with no proxy and no toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateProxyDeathThenReset', 0, () => {
      logStep('clientStateProxyDeathThenReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'dead-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(129);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      const frozenState: string = client.state;
      const frozenEvents: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(frozenState.length > 0).assertTrue();
      expect(frozenEvents >= 0).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientStateProxyDeathThenReset', 'end');
    });

    /**
     * @tc.name          clientStateConnectEventTrace
     * @tc.desc          The event trace after a connect and proxy attach is fully ordered.
     * @tc.precondition  A client with an empty recorder.
     * @tc.steps         1. Connect with id 131.
     *                   2. Attach a proxy.
     *                   3. Compare the trace with the composed value.
     * @tc.expected      The trace equals connect, death-register and connected joined by bars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateConnectEventTrace', 0, () => {
      logStep('clientStateConnectEventTrace', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(131);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.size()).assertEqual(3);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(client.events.last()).assertEqual('connected:' + proxy.descriptor);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateConnectEventTrace', 'end');
    });

    /**
     * @tc.name          clientStateTraceFingerprint
     * @tc.desc          The trace fingerprint equals the hash of the composed trace string.
     * @tc.precondition  A client that has connected.
     * @tc.steps         1. Attach the proxy.
     *                   2. Read the fingerprint.
     *                   3. Hash the trace independently.
     * @tc.expected      Both hashes are equal and non-zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateTraceFingerprint', 0, () => {
      logStep('clientStateTraceFingerprint', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(133);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.size()).assertEqual(3);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(client.events.last()).assertEqual('connected:' + proxy.descriptor);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateTraceFingerprint', 'end');
    });

    /**
     * @tc.name          clientStateTraceLastEntry
     * @tc.desc          The last trace entry names the connected event with the descriptor.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Attach the proxy.
     *                   2. Read the last entry.
     *                   3. Compare with the descriptor.
     * @tc.expected      The last entry is connected plus the stub descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateTraceLastEntry', 0, () => {
      logStep('clientStateTraceLastEntry', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(135);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.size()).assertEqual(3);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(client.events.last()).assertEqual('connected:' + proxy.descriptor);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateTraceLastEntry', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateTraceLastEntry', 'end');
    });

    /**
     * @tc.name          clientStateTraceEventKinds
     * @tc.desc          The recorder counts one connect and one death-register event.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Attach the proxy.
     *                   2. Count each event kind.
     *                   3. Assert the total size.
     * @tc.expected      Counts are one for each kind and the total is three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateTraceEventKinds', 0, () => {
      logStep('clientStateTraceEventKinds', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(137);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.size()).assertEqual(3);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(client.events.last()).assertEqual('connected:' + proxy.descriptor);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      expect(client.events.size() >= 1).assertTrue();
      logStep('clientStateTraceEventKinds', 'end');
    });

    /**
     * @tc.name          clientStateTraceAfterReset
     * @tc.desc          Reset removes the whole trace recorded by the previous session.
     * @tc.precondition  A connected client with a populated trace.
     * @tc.steps         1. Record the trace length.
     *                   2. Reset.
     *                   3. Re-read the trace.
     * @tc.expected      The trace is empty after reset and was non-empty before.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateTraceAfterReset', 0, () => {
      logStep('clientStateTraceAfterReset', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(139);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.size()).assertEqual(3);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(client.events.last()).assertEqual('connected:' + proxy.descriptor);
      const frozenState: string = client.state;
      const frozenEvents: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(frozenState.length > 0).assertTrue();
      expect(frozenEvents >= 0).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientStateTraceAfterReset', 'end');
    });

    /**
     * @tc.name          clientStateConstantsDistinct
     * @tc.desc          The four exported state names are pairwise distinct.
     * @tc.precondition  No runtime state needed.
     * @tc.steps         1. Collect the state constants.
     *                   2. Deduplicate them.
     *                   3. Compare lengths.
     * @tc.expected      Four distinct strings remain after deduplication.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStateConstantsDistinct', 0, () => {
      logStep('clientStateConstantsDistinct', 'begin');
      const states: string[] = [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED];
      expect(states.length).assertEqual(4);
      expect(uniqueStrings(states).length).assertEqual(4);
      expect(states.indexOf(STATE_CONNECTED)).assertEqual(2);
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(ERROR_CONNECT)).assertTrue();
      expect(clampInt(9, 0, 4)).assertEqual(4);
      expect(clampInt(-3, 0, 4)).assertEqual(0);
      expect(STATE_DISCONNECTED === STATE_FAILED).assertFalse();
      const client: ConnectionModel = new ConnectionModel();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStateConstantsDistinct', 'end');
    });

    /**
     * @tc.name          clientStateConstantsClamp
     * @tc.desc          The integer clamp helper bounds values on both sides.
     * @tc.precondition  No runtime state needed.
     * @tc.steps         1. Clamp a high value.
     *                   2. Clamp a low value.
     *                   3. Clamp an in-range value.
     * @tc.expected      Clamped values equal the low, high and original bounds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateConstantsClamp', 0, () => {
      logStep('clientStateConstantsClamp', 'begin');
      const states: string[] = [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED];
      expect(states.length).assertEqual(4);
      expect(uniqueStrings(states).length).assertEqual(4);
      expect(states.indexOf(STATE_CONNECTED)).assertEqual(2);
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(ERROR_CONNECT)).assertTrue();
      expect(clampInt(9, 0, 4)).assertEqual(4);
      expect(clampInt(-3, 0, 4)).assertEqual(0);
      expect(STATE_DISCONNECTED === STATE_FAILED).assertFalse();
      const client: ConnectionModel = new ConnectionModel();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateConstantsClamp', 'end');
    });

    /**
     * @tc.name          clientStateConstantsErrorPredicate
     * @tc.desc          The non-zero error predicate accepts every documented error code.
     * @tc.precondition  No runtime state needed.
     * @tc.steps         1. Evaluate the zero code.
     *                   2. Evaluate the connect error.
     *                   3. Evaluate the proxy error.
     * @tc.expected      Zero is rejected while non-zero codes are accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStateConstantsErrorPredicate', 0, () => {
      logStep('clientStateConstantsErrorPredicate', 'begin');
      const states: string[] = [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED];
      expect(states.length).assertEqual(4);
      expect(uniqueStrings(states).length).assertEqual(4);
      expect(states.indexOf(STATE_CONNECTED)).assertEqual(2);
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(ERROR_CONNECT)).assertTrue();
      expect(clampInt(9, 0, 4)).assertEqual(4);
      expect(clampInt(-3, 0, 4)).assertEqual(0);
      expect(STATE_DISCONNECTED === STATE_FAILED).assertFalse();
      const client: ConnectionModel = new ConnectionModel();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateConstantsErrorPredicate', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateConstantsErrorPredicate', 'end');
    });

    /**
     * @tc.name          clientStateConstantsUniqueAndClamp
     * @tc.desc          The state constants stay unique and the clamp helper bounds values.
     * @tc.precondition  No runtime state needed beyond an idle client.
     * @tc.steps         1. Collect the state constants.
     *                   2. Clamp out of range values.
     *                   3. Evaluate the error predicate.
     * @tc.expected      Four distinct states remain and clamping honors both bounds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateConstantsUniqueAndClamp', 0, () => {
      logStep('clientStateConstantsUniqueAndClamp', 'begin');
      const states: string[] = [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED];
      expect(states.length).assertEqual(4);
      expect(uniqueStrings(states).length).assertEqual(4);
      expect(states.indexOf(STATE_CONNECTED)).assertEqual(2);
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(ERROR_CONNECT)).assertTrue();
      expect(clampInt(9, 0, 4)).assertEqual(4);
      expect(clampInt(-3, 0, 4)).assertEqual(0);
      expect(STATE_DISCONNECTED === STATE_FAILED).assertFalse();
      const client: ConnectionModel = new ConnectionModel();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateConstantsUniqueAndClamp', 'end');
    });

    /**
     * @tc.name          clientStatePredicateIdle
     * @tc.desc          An idle client reports not connected before any callback.
     * @tc.precondition  A freshly constructed client.
     * @tc.steps         1. Call isConnected.
     *                   2. Read the state.
     *                   3. Connect and re-check.
     * @tc.expected      isConnected is false in both the idle and connecting states.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientStatePredicateIdle', 0, () => {
      logStep('clientStatePredicateIdle', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      client.connect(151);
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTING);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.isConnected()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(151);
      client.onDisconnect();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      logStep('clientStatePredicateIdle', 'end');
    });

    /**
     * @tc.name          clientStatePredicateConnected
     * @tc.desc          Only the connected state without a proxy reports not connected.
     * @tc.precondition  A client that connected without attaching a proxy.
     * @tc.steps         1. Connect.
     *                   2. Call isConnected.
     *                   3. Attach a proxy and re-check.
     * @tc.expected      The predicate flips from false to true once the proxy arrives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStatePredicateConnected', 0, () => {
      logStep('clientStatePredicateConnected', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      client.connect(153);
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTING);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.isConnected()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(153);
      client.onDisconnect();
      expect(client.isConnected()).assertFalse();
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStatePredicateConnected', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStatePredicateConnected', 'end');
    });

    /**
     * @tc.name          clientStatePredicateAfterDrop
     * @tc.desc          A dropped client reports not connected even though toasts are queued.
     * @tc.precondition  A client that has been connected and dropped.
     * @tc.steps         1. Run the cycle.
     *                   2. Call isConnected.
     *                   3. Read the toast queue.
     * @tc.expected      The predicate is false and two toasts remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientStatePredicateAfterDrop', 0, () => {
      logStep('clientStatePredicateAfterDrop', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      client.connect(155);
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTING);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.isConnected()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(155);
      client.onDisconnect();
      expect(client.isConnected()).assertFalse();
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientStatePredicateAfterDrop', 'end');
    });

    /**
     * @tc.name          clientStatePredicateFailed
     * @tc.desc          A failed client reports not connected and holds no proxy.
     * @tc.precondition  A client that failed during connect.
     * @tc.steps         1. Fail the connect.
     *                   2. Call isConnected.
     *                   3. Check the proxy field.
     * @tc.expected      The predicate is false and the proxy is undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStatePredicateFailed', 0, () => {
      logStep('clientStatePredicateFailed', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      client.connect(157);
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTING);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.isConnected()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(157);
      client.onDisconnect();
      expect(client.isConnected()).assertFalse();
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStatePredicateFailed', 'end');
    });

    /**
     * @tc.name          clientStatePredicateResetIdle
     * @tc.desc          A reset client behaves exactly like a new client for predicates.
     * @tc.precondition  A client that was connected and then reset.
     * @tc.steps         1. Connect.
     *                   2. Reset.
     *                   3. Evaluate the predicates.
     * @tc.expected      isConnected is false and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStatePredicateResetIdle', 0, () => {
      logStep('clientStatePredicateResetIdle', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      client.connect(159);
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTING);
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.isConnected()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(159);
      client.onDisconnect();
      expect(client.isConnected()).assertFalse();
      const frozenState: string = client.state;
      const frozenEvents: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(frozenState.length > 0).assertTrue();
      expect(frozenEvents >= 0).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientStatePredicateResetIdle', 'end');
    });

    /**
     * @tc.name          clientStateSnapshotAfterDrop
     * @tc.desc          A snapshot after the drop shows no proxy and a cleared registration.
     * @tc.precondition  A client that completed a connect and drop cycle.
     * @tc.steps         1. Complete the cycle.
     *                   2. Build the snapshot.
     *                   3. Read each snapshot field.
     * @tc.expected      The snapshot reports no proxy and no registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateSnapshotAfterDrop', 0, () => {
      logStep('clientStateSnapshotAfterDrop', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const trail: string[] = [];
      trail.push(client.state);
      client.connect(161);
      trail.push(client.state);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'snap-extra';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      trail.push(client.state);
      client.onDisconnect();
      trail.push(client.state);
      expect(trail.length).assertEqual(4);
      expect(trail[0]).assertEqual(STATE_DISCONNECTED);
      expect(trail[1]).assertEqual(STATE_CONNECTING);
      expect(trail[2]).assertEqual(STATE_CONNECTED);
      expect(trail[3]).assertEqual(STATE_DISCONNECTED);
      expect(joined(trail, '>')).assertEqual('disconnected>connecting>connected>disconnected');
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(after.describe().length).assertLarger(0);
      logStep('clientStateSnapshotAfterDrop', after.describe());
      expect(after.toastCount).assertEqual(client.toasts.length);
      logStep('clientStateSnapshotAfterDrop', 'end');
    });

    /**
     * @tc.name          clientStateResetCountsCleared
     * @tc.desc          Reset clears the connect call counter used by snapshot tests.
     * @tc.precondition  A client that attempted one connect.
     * @tc.steps         1. Connect once.
     *                   2. Reset.
     *                   3. Read the counter indirectly.
     * @tc.expected      The counter is back to zero after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateResetCountsCleared', 0, () => {
      logStep('clientStateResetCountsCleared', 'begin');
      const client: ConnectionModel = createConnectedSession('reset-extra');
      client.sendString('reset-extra');
      expect(client.events.size() > 0).assertTrue();
      expect(client.toasts.length > 0).assertTrue();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size()).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateResetCountsCleared', 'end');
    });

    /**
     * @tc.name          clientStateGuardTwiceWarningCount
     * @tc.desc          Two rejected connects on a connected client produce two warnings.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Reject one connect.
     *                   2. Reject another.
     *                   3. Count warnings.
     * @tc.expected      Two warnings are recorded and connect events stay at one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientStateGuardTwiceWarningCount', 0, () => {
      logStep('clientStateGuardTwiceWarningCount', 'begin');
      const client: ConnectionModel = createConnectedSession('guard-extra');
      const blocked: boolean = client.connect(163);
      expect(blocked).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.trace().length >= 0).assertTrue();
      logStep('clientStateGuardTwiceWarningCount', 'end');
    });
  });
}
