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
 * SnapshotRegression: golden client snapshots and aggregate metrics.
 *
 * The production page keeps loose module level state: proxy, connectId,
 * isDisconnect and a deathRecipient instance. ClientSnapshot flattens that
 * state into a comparable value so a behavioural regression shows up as a
 * golden string mismatch.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_FAILED,
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_SEND,
  ClientSnapshot,
  ClientMetrics,
  ConnectionModel,
  RemoteStubModel,
  RemoteProxyModel,
  EventRecorder,
  createConnectedSession,
  expectedStateAfter,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

const GOLDEN_CONNECTED: string = 'connected/7/true/true/1';
const GOLDEN_DISCONNECTED: string = 'disconnected/-1/false/false/0';
const GOLDEN_AFTER_DISCONNECT: string = 'disconnected/-1/false/false/2';

function snapshotOf(client: ConnectionModel): ClientSnapshot {
  return new ClientSnapshot(client);
}

function goldenFor(action: string): string {
  if (action === 'connected') {
    return GOLDEN_CONNECTED;
  }
  if (action === 'after-disconnect') {
    return GOLDEN_AFTER_DISCONNECT;
  }
  return GOLDEN_DISCONNECTED;
}

function eventKinds(recorder: EventRecorder): string[] {
  const kinds: string[] = [];
  for (let index = 0; index < recorder.entries.length; index++) {
    const entry = recorder.entries[index];
    const cut = entry.indexOf(':');
    kinds.push(cut < 0 ? entry : entry.substring(0, cut));
  }
  return kinds;
}

export default function snapshotRegression(): void {
  describe('SnapshotRegression', () => {
    beforeAll(() => {
      logSuite('SnapshotRegression', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('SnapshotRegression', 'end');
    });

    /**
     * @tc.name          snapshotRegressionFreshClientMatchesGolden
     * @tc.desc          A fresh client matches the disconnected golden string.
     * @tc.precondition  A new ConnectionModel is created.
     * @tc.steps         1. Snapshot the client. 2. Compare describe output.
     *                   3. Compare each flattened field.
     * @tc.expected      The snapshot equals disconnected/-1/false/false/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionFreshClientMatchesGolden', 0, () => {
      logStep('snapshotRegression', 'fresh client');
      const client = new ConnectionModel();
      const snapshot = snapshotOf(client);
      expect(snapshot.describe()).assertEqual(GOLDEN_DISCONNECTED);
      expect(snapshot.describe()).assertEqual(goldenFor('fresh'));
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(0);
    });

    /**
     * @tc.name          snapshotRegressionConnectedSessionMatchesGolden
     * @tc.desc          A connected session matches the connected golden string.
     * @tc.precondition  createConnectedSession connects with id 7.
     * @tc.steps         1. Build the session. 2. Snapshot it. 3. Compare.
     * @tc.expected      The snapshot equals connected/7/true/true/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionConnectedSessionMatchesGolden', 0, () => {
      logStep('snapshotRegression', 'connected session');
      const client = createConnectedSession();
      const snapshot = snapshotOf(client);
      expect(snapshot.describe()).assertEqual(GOLDEN_CONNECTED);
      expect(snapshot.describe()).assertEqual(goldenFor('connected'));
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          snapshotRegressionSnapshotIsSelfConsistent
     * @tc.desc          A snapshot always equals itself.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Take two snapshots of one client. 2. Compare.
     *                   3. Compare fingerprints of the descriptions.
     * @tc.expected      sameAs is true and the fingerprints agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotIsSelfConsistent', 0, () => {
      logStep('snapshotRegression', 'self consistency');
      const client = createConnectedSession();
      const left = snapshotOf(client);
      const right = snapshotOf(client);
      expect(left.sameAs(right)).assertTrue();
      expect(right.sameAs(left)).assertTrue();
      expect(textFingerprint(left.describe())).assertEqual(textFingerprint(right.describe()));
      expect(left.toastCount).assertEqual(right.toastCount);
      expect(left.describe().length).assertEqual(right.describe().length);
      expect(left.sameAs(left)).assertTrue();
    });

    /**
     * @tc.name          snapshotRegressionSendKeepsIdentity
     * @tc.desc          Sending changes the toast count but not the identity fields.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Snapshot before send. 2. Send once. 3. Snapshot again.
     * @tc.expected      State, id and flags agree while the toast count grows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionSendKeepsIdentity', 0, () => {
      logStep('snapshotRegression', 'send keeps identity');
      const client = createConnectedSession();
      const before = snapshotOf(client);
      const result = client.sendString('hello world');
      const after = snapshotOf(client);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(before.sameAs(after)).assertFalse();
      expect(after.toastCount).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(after.state).assertEqual(before.state);
      expect(after.connectId).assertEqual(before.connectId);
      expect(after.hasProxy).assertEqual(before.hasProxy);
    });

    /**
     * @tc.name          snapshotRegressionDisconnectMatchesGolden
     * @tc.desc          After onDisconnect the snapshot matches its golden string.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Snapshot the session. 2. Call onDisconnect.
     *                   3. Snapshot again.
     * @tc.expected      The snapshot equals disconnected/-1/false/false/2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionDisconnectMatchesGolden', 0, () => {
      logStep('snapshotRegression', 'disconnect golden');
      const client = createConnectedSession();
      const before = snapshotOf(client);
      client.onDisconnect();
      const after = snapshotOf(client);
      expect(after.describe()).assertEqual(GOLDEN_AFTER_DISCONNECT);
      expect(after.describe()).assertEqual(goldenFor('after-disconnect'));
      expect(before.sameAs(after)).assertFalse();
      expect(after.state).assertEqual(STATE_DISCONNECTED);
      expect(after.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(after.hasProxy).assertFalse();
      expect(after.deathRegistered).assertFalse();
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          snapshotRegressionFailureSnapshotIsDistinct
     * @tc.desc          A failed connect produces a snapshot unlike the golden set.
     * @tc.precondition  A fresh client can accept onFailed directly.
     * @tc.steps         1. Deliver onFailed. 2. Snapshot the client.
     *                   3. Compare against the two goldens.
     * @tc.expected      State is failed, connectId is -1 and both goldens differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionFailureSnapshotIsDistinct', 0, () => {
      logStep('snapshotRegression', 'failure snapshot');
      const client = new ConnectionModel();
      client.onFailed(16000001);
      const snapshot = snapshotOf(client);
      const fresh = snapshotOf(new ConnectionModel());
      expect(snapshot.state).assertEqual(STATE_FAILED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe() === GOLDEN_CONNECTED).assertFalse();
      expect(snapshot.describe() === GOLDEN_DISCONNECTED).assertFalse();
      expect(snapshot.sameAs(fresh)).assertFalse();
    });

    /**
     * @tc.name          snapshotRegressionResetRestoresFreshGolden
     * @tc.desc          reset returns every tracked field to the fresh golden.
     * @tc.precondition  A connected session has sent a payload.
     * @tc.steps         1. Send once. 2. Reset the client. 3. Snapshot again.
     * @tc.expected      The snapshot equals the fresh golden and trails are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetRestoresFreshGolden', 0, () => {
      logStep('snapshotRegression', 'reset golden');
      const client = createConnectedSession();
      client.sendString('hello world');
      expect(snapshotOf(client).toastCount).assertEqual(2);
      client.reset();
      const snapshot = snapshotOf(client);
      expect(snapshot.describe()).assertEqual(GOLDEN_DISCONNECTED);
      expect(snapshot.toastCount).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          snapshotRegressionCustomConnectIdIsCaptured
     * @tc.desc          The connect id passed to connect appears in snapshots.
     * @tc.precondition  A fresh client and a live proxy are available.
     * @tc.steps         1. Connect with id 42. 2. Snapshot while connecting.
     *                   3. Deliver onConnect and snapshot again.
     * @tc.expected      Id 42 is reported in both snapshots and the state moves.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionCustomConnectIdIsCaptured', 0, () => {
      logStep('snapshotRegression', 'custom connect id');
      const client = new ConnectionModel();
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      expect(client.connect(42)).assertTrue();
      const connecting = snapshotOf(client);
      expect(connecting.describe()).assertEqual('connecting/42/false/false/0');
      client.onConnect(proxy);
      const connected = snapshotOf(client);
      expect(connected.describe()).assertEqual('connected/42/true/true/1');
      expect(connected.connectId).assertEqual(42);
      expect(connected.state).assertEqual(STATE_CONNECTED);
      expect(connecting.connectId).assertEqual(connected.connectId);
    });

    /**
     * @tc.name          snapshotRegressionSnapshotIsImmutableCopy
     * @tc.desc          A snapshot does not follow later client mutations.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Take a snapshot. 2. Disconnect the client.
     *                   3. Re-read the old snapshot.
     * @tc.expected      The old snapshot still reports the connected fields.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionSnapshotIsImmutableCopy', 0, () => {
      logStep('snapshotRegression', 'immutable snapshot');
      const client = createConnectedSession();
      const frozen = snapshotOf(client);
      client.onDisconnect();
      expect(frozen.state).assertEqual(STATE_CONNECTED);
      expect(frozen.connectId).assertEqual(7);
      expect(frozen.hasProxy).assertTrue();
      expect(frozen.deathRegistered).assertTrue();
      expect(frozen.toastCount).assertEqual(1);
      expect(snapshotOf(client).state).assertEqual(STATE_DISCONNECTED);
      expect(frozen.sameAs(snapshotOf(client))).assertFalse();
    });

    /**
     * @tc.name          snapshotRegressionMetricsOfFreshClientAreZero
     * @tc.desc          A fresh client reports zero for every metric.
     * @tc.precondition  A new ConnectionModel exists.
     * @tc.steps         1. Derive metrics. 2. Compare each field. 3. Compare
     *                   the ratio and fingerprint.
     * @tc.expected      All counters are zero and the ratio is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionMetricsOfFreshClientAreZero', 0, () => {
      logStep('snapshotRegression', 'fresh metrics');
      const metrics = ClientMetrics.from(new ConnectionModel());
      expect(metrics.connects).assertEqual(0);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
    });

    /**
     * @tc.name          snapshotRegressionMetricsCountTwoSends
     * @tc.desc          Two successful sends yield a ratio of one.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send twice. 2. Derive metrics. 3. Check the ratio and
     *                   the failure count.
     * @tc.expected      One connect, two sends, two replies and no failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionMetricsCountTwoSends', 0, () => {
      logStep('snapshotRegression', 'metrics two sends');
      const client = createConnectedSession();
      client.sendString('one');
      client.sendString('two');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:2:0:2'));
    });

    /**
     * @tc.name          snapshotRegressionMetricsCountFailedSend
     * @tc.desc          One failure halves the success ratio.
     * @tc.precondition  A connected session can serve one good and one bad send.
     * @tc.steps         1. Send once. 2. Arm a send failure and send again.
     *                   3. Derive metrics.
     * @tc.expected      Two sends, one reply, one failure and a half ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionMetricsCountFailedSend', 0, () => {
      logStep('snapshotRegression', 'metrics failed send');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.sendString('good');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('bad');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:2:1:1'));
    });

    /**
     * @tc.name          snapshotRegressionMetricsIgnoreNoProxySend
     * @tc.desc          A send without a proxy is not counted as an attempt.
     * @tc.precondition  A fresh client has no proxy.
     * @tc.steps         1. Send without a proxy. 2. Derive metrics. 3. Compare
     *                   the counters to zero.
     * @tc.expected      The no-proxy failure leaves every metric at zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionMetricsIgnoreNoProxySend', 0, () => {
      logStep('snapshotRegression', 'metrics no proxy');
      const client = new ConnectionModel();
      const result = client.sendString('orphan');
      const metrics = ClientMetrics.from(client);
      expect(result.errCode).assertEqual(16000004);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.connects).assertEqual(0);
    });

    /**
     * @tc.name          snapshotRegressionMetricsFingerprintIsDeterministic
     * @tc.desc          Identical traffic yields identical metric fingerprints.
     * @tc.precondition  Two independent sessions can run the same script.
     * @tc.steps         1. Run the script twice. 2. Derive metrics. 3. Compare
     *                   fingerprints and ratios.
     * @tc.expected      Both runs produce the same fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionMetricsFingerprintIsDeterministic', 0, () => {
      logStep('snapshotRegression', 'metrics deterministic');
      const first = createConnectedSession();
      first.sendString('a');
      first.sendString('b');
      const second = createConnectedSession();
      second.sendString('x');
      second.sendString('y');
      const left = ClientMetrics.from(first);
      const right = ClientMetrics.from(second);
      expect(left.fingerprint()).assertEqual(right.fingerprint());
      expect(left.successRatio()).assertEqual(right.successRatio());
      expect(left.sends).assertEqual(right.sends);
      expect(left.replies).assertEqual(right.replies);
      expect(left.fingerprint() === textFingerprint('0:0:0:0')).assertFalse();
      expect(left.fingerprint() > 0).assertTrue();
    });

    /**
     * @tc.name          snapshotRegressionEventKindsAfterConnectAreOrdered
     * @tc.desc          The connect sequence records three ordered event kinds.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Extract event kinds. 2. Compare the first three.
     *                   3. Compare the trace fingerprint to a rebuilt session.
     * @tc.expected      The kinds are connect, death-register and connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionEventKindsAfterConnectAreOrdered', 0, () => {
      logStep('snapshotRegression', 'event order');
      const client = createConnectedSession();
      const kinds = eventKinds(client.events);
      expect(kinds.length).assertEqual(3);
      expect(kinds[0]).assertEqual('connect');
      expect(kinds[1]).assertEqual('death-register');
      expect(kinds[2]).assertEqual('connected');
      expect(joined(kinds, '>')).assertEqual('connect>death-register>connected');
      expect(eventKinds(createConnectedSession().events).length).assertEqual(3);
      expect(client.events.fingerprint()).assertEqual(createConnectedSession().events.fingerprint());
    });

    /**
     * @tc.name          snapshotRegressionFailedConnectHasOwnGolden
     * @tc.desc          A failed connect produces failed/-1/false/false/1.
     * @tc.precondition  A fresh client received onFailed.
     * @tc.steps         1. Deliver the failure. 2. Snapshot. 3. Compare the golden.
     * @tc.expected      The snapshot matches the failure golden exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionFailedConnectHasOwnGolden', 0, () => {
      logStep('snapshotRegression', 'failure golden');
      const client = new ConnectionModel();
      client.onFailed(16000001);
      const snapshot = snapshotOf(client);
      expect(snapshot.describe()).assertEqual('failed/-1/false/false/1');
      expect(snapshot.state).assertEqual(STATE_FAILED);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe() === GOLDEN_DISCONNECTED).assertFalse();
    });

    /**
     * @tc.name          snapshotRegressionNoProxySendHasOwnGolden
     * @tc.desc          A failed no-proxy send keeps the disconnected payload shape.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send without a proxy. 2. Snapshot. 3. Compare.
     * @tc.expected      The snapshot is disconnected/-1/false/false/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionNoProxySendHasOwnGolden', 0, () => {
      logStep('snapshotRegression', 'no proxy golden');
      const client = new ConnectionModel();
      client.sendString('orphan');
      const snapshot = snapshotOf(client);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/1');
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.sameAs(snapshotOf(new ConnectionModel()))).assertFalse();
    });

    /**
     * @tc.name          snapshotRegressionDeathKeepsRegistrationFlag
     * @tc.desc          A death notification does not unregister the recipient.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Notify death. 2. Snapshot. 3. Compare to the connected
     *                   golden.
     * @tc.expected      The flattened snapshot still equals the connected golden.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionDeathKeepsRegistrationFlag', 0, () => {
      logStep('snapshotRegression', 'death keeps registration');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).notifyDeath();
      const snapshot = snapshotOf(client);
      expect(snapshot.describe()).assertEqual(GOLDEN_CONNECTED);
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(snapshot.sameAs(snapshotOf(createConnectedSession()))).assertTrue();
    });

    /**
     * @tc.name          snapshotRegressionDoubleDisconnectGrowsToasts
     * @tc.desc          A second onDisconnect still appends a toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect twice. 2. Snapshot. 3. Compare the count.
     * @tc.expected      The toast count is three and the state stays disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionDoubleDisconnectGrowsToasts', 0, () => {
      logStep('snapshotRegression', 'double disconnect');
      const client = createConnectedSession();
      client.onDisconnect();
      client.onDisconnect();
      const snapshot = snapshotOf(client);
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/3');
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(2);
      expect(snapshot.sameAs(snapshotOf(new ConnectionModel()))).assertFalse();
    });

    /**
     * @tc.name          snapshotRegressionIdenticalTrafficMatches
     * @tc.desc          Two sessions running the same script snapshot identically.
     * @tc.precondition  Two independent sessions are available.
     * @tc.steps         1. Run the same script on both. 2. Snapshot both. 3. Compare
     *                   descriptions and equality.
     * @tc.expected      Both snapshots are equal with the same fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionIdenticalTrafficMatches', 0, () => {
      logStep('snapshotRegression', 'identical traffic');
      const first = createConnectedSession();
      const second = createConnectedSession();
      first.sendString('one');
      second.sendString('two');
      const left = snapshotOf(first);
      const right = snapshotOf(second);
      expect(left.sameAs(right)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(textFingerprint(left.describe())).assertEqual(textFingerprint(right.describe()));
      expect(left.toastCount).assertEqual(2);
      expect(first.toasts.length).assertEqual(2);
      expect(second.toasts.length).assertEqual(2);
      expect(left.describe()).assertEqual('connected/7/true/true/2');
    });

    /**
     * @tc.name          snapshotRegressionConnectIdsAreCompared
     * @tc.desc          Different connect ids make snapshots unequal.
     * @tc.precondition  Two clients connect with different ids.
     * @tc.steps         1. Connect with 7 and 8. 2. Snapshot both. 3. Compare.
     * @tc.expected      The descriptions differ only in the id segment.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionConnectIdsAreCompared', 0, () => {
      logStep('snapshotRegression', 'connect ids');
      const seven = createConnectedSession();
      const eight = new ConnectionModel();
      eight.connect(8);
      eight.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const left = snapshotOf(seven);
      const right = snapshotOf(eight);
      expect(left.sameAs(right)).assertFalse();
      expect(left.connectId).assertEqual(7);
      expect(right.connectId).assertEqual(8);
      expect(left.describe()).assertEqual('connected/7/true/true/1');
      expect(right.describe()).assertEqual('connected/8/true/true/1');
      expect(left.describe().length).assertEqual(right.describe().length);
      expect(left.state).assertEqual(right.state);
    });

    /**
     * @tc.name          snapshotRegressionEventKindsAfterSend
     * @tc.desc          A send appends exactly one send-ok event kind.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one payload. 2. Extract the kinds. 3. Compare the
     *                   fourth kind.
     * @tc.expected      The trail is connect, death-register, connected, send-ok.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionEventKindsAfterSend', 0, () => {
      logStep('snapshotRegression', 'event kinds after send');
      const client = createConnectedSession();
      client.sendString('hello world');
      const kinds = eventKinds(client.events);
      expect(kinds.length).assertEqual(4);
      expect(kinds[3]).assertEqual('send-ok');
      expect(joined(kinds, '>')).assertEqual('connect>death-register>connected>send-ok');
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.last()).assertEqual('send-ok:hello rpc');
      expect(client.events.fingerprint()).assertEqual(textFingerprint(client.events.trace()));
      expect(kinds.indexOf('send-failed')).assertEqual(-1);
    });

    /**
     * @tc.name          snapshotRegressionMetricsAfterRecovery
     * @tc.desc          A failed send between two good ones yields two thirds.
     * @tc.precondition  A connected session with a live proxy exists.
     * @tc.steps         1. Send good, arm a failure, send bad, send good. 2. Derive
     *                   metrics. 3. Compare the counters.
     * @tc.expected      Three sends, two replies, one failure and a ratio near 0.66.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionMetricsAfterRecovery', 0, () => {
      logStep('snapshotRegression', 'metrics recovery');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.sendString('one');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('two');
      client.sendString('three');
      const metrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.successRatio() > 0.66).assertTrue();
      expect(metrics.successRatio() < 0.67).assertTrue();
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:3:1:2'));
    });

    /**
     * @tc.name          snapshotRegressionMetricsAfterResetAreZero
     * @tc.desc          reset clears every metric feeding event.
     * @tc.precondition  A connected session has sent one payload.
     * @tc.steps         1. Send. 2. Reset. 3. Derive metrics again.
     * @tc.expected      All counters return to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionMetricsAfterResetAreZero', 0, () => {
      logStep('snapshotRegression', 'metrics after reset');
      const client = createConnectedSession();
      client.sendString('one');
      expect(ClientMetrics.from(client).sends).assertEqual(1);
      client.reset();
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(0);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
    });

    /**
     * @tc.name          snapshotRegressionSuccessRatioStaysBounded
     * @tc.desc          Every derived ratio sits between zero and one.
     * @tc.precondition  Several independent sessions can be scripted.
     * @tc.steps         1. Run four scripts. 2. Derive ratios. 3. Check the bounds.
     * @tc.expected      Every ratio is within the closed unit interval.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionSuccessRatioStaysBounded', 0, () => {
      logStep('snapshotRegression', 'ratio bounds');
      const ratios: number[] = [];
      for (let index = 0; index < 4; index++) {
        const client = createConnectedSession();
        for (let send = 0; send < index; send++) {
          client.sendString('payload-' + String(send));
        }
        ratios.push(ClientMetrics.from(client).successRatio());
      }
      expect(ratios.length).assertEqual(4);
      expect(ratios[0]).assertEqual(0);
      expect(ratios[1]).assertEqual(1);
      for (let index = 0; index < ratios.length; index++) {
        expect(ratios[index] >= 0).assertTrue();
        expect(ratios[index] <= 1).assertTrue();
      }
      expect(joined(['0', '1', '1', '1'], ',')).assertEqual('0,1,1,1');
      expect(ratios[3] > ratios[0]).assertTrue();
    });

    /**
     * @tc.name          snapshotRegressionEventTraceHasGoldenShape
     * @tc.desc          The connect trace has a fixed three entry shape.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the trace. 2. Split it. 3. Compare every part.
     * @tc.expected      The trace is connect, death-register and connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionEventTraceHasGoldenShape', 0, () => {
      logStep('snapshotRegression', 'trace shape');
      const client = createConnectedSession();
      const parts = client.events.trace().split('|');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(parts[1]).assertEqual('death-register:IPCStubTest');
      expect(parts[2]).assertEqual('connected:IPCStubTest');
      expect(client.events.trace().split(':').length).assertEqual(4);
      expect(client.events.trace().startsWith('connect:')).assertTrue();
      expect(client.events.trace().endsWith('IPCStubTest')).assertTrue();
      expect(client.events.entries.length).assertEqual(3);
    });

    /**
     * @tc.name          snapshotRegressionToastTrailIsGolden
     * @tc.desc          Connect, send and disconnect produce three known toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send. 2. Disconnect. 3. Read the toast trail.
     * @tc.expected      The trail is connect success, send success, disconnect success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionToastTrailIsGolden', 0, () => {
      logStep('snapshotRegression', 'toast trail');
      const client = createConnectedSession();
      client.sendString('hello world');
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(joined(client.toasts, '|')).assertEqual('connectAbility success|sendRequest success|disconnectAbility success');
      expect(uniqueStrings(client.toasts).length).assertEqual(3);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts.join('|').split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          snapshotRegressionResetSnapshotMatchesFresh
     * @tc.desc          A reset session snapshots like a brand new one.
     * @tc.precondition  A session has connected, sent and disconnected.
     * @tc.steps         1. Reset. 2. Snapshot both clients. 3. Compare equality.
     * @tc.expected      The reset snapshot equals the fresh snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionResetSnapshotMatchesFresh', 0, () => {
      logStep('snapshotRegression', 'reset matches fresh');
      const used = createConnectedSession();
      used.sendString('one');
      used.onDisconnect();
      used.reset();
      const resetSnapshot = snapshotOf(used);
      const freshSnapshot = snapshotOf(new ConnectionModel());
      expect(resetSnapshot.sameAs(freshSnapshot)).assertTrue();
      expect(resetSnapshot.describe()).assertEqual(freshSnapshot.describe());
      expect(resetSnapshot.describe()).assertEqual(GOLDEN_DISCONNECTED);
      expect(resetSnapshot.toastCount).assertEqual(0);
      expect(used.toasts.length).assertEqual(0);
      expect(used.events.size()).assertEqual(0);
      expect(used.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          snapshotRegressionFailureToastTrailIsGolden
     * @tc.desc          A failed connect yields exactly one failure toast.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Deliver onFailed. 2. Read the toasts. 3. Compare the text
     *                   and count.
     * @tc.expected      One toast carries the connect failure guidance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionFailureToastTrailIsGolden', 0, () => {
      logStep('snapshotRegression', 'failure toast');
      const client = new ConnectionModel();
      client.onFailed(16000001);
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.toasts[0].indexOf('background')).assertEqual(65);
      expect(client.toasts[0].startsWith('Connect failed')).assertTrue();
      expect(client.lastToast()).assertEqual(client.toasts[0]);
      expect(countOf(client.toasts, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(uniqueStrings(client.toasts).length).assertEqual(1);
      expect(snapshotOf(client).toastCount).assertEqual(1);
    });

    /**
     * @tc.name          snapshotRegressionSnapshotHasFiveFields
     * @tc.desc          The snapshot description is a five part slash join.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Split the description. 2. Check each part. 3. Count the
     *                   separators.
     * @tc.expected      Five fields describe state, id, proxy, death and toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionSnapshotHasFiveFields', 0, () => {
      logStep('snapshotRegression', 'five fields');
      const snapshot = snapshotOf(createConnectedSession());
      const parts = snapshot.describe().split('/');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('connected');
      expect(parts[1]).assertEqual('7');
      expect(parts[2]).assertEqual('true');
      expect(parts[3]).assertEqual('true');
      expect(parts[4]).assertEqual('1');
      expect(snapshot.describe().split('/').length - 1).assertEqual(4);
      expect(snapshot.describe().indexOf('connected')).assertEqual(0);
    });

    /**
     * @tc.name          snapshotRegressionDisconnectFlagStaysTrue
     * @tc.desc          The disconnect flag is set by every onDisconnect callback.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect once. 2. Read the flag. 3. Disconnect again and
     *                   read it again.
     * @tc.expected      The flag is true after both callbacks.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionDisconnectFlagStaysTrue', 0, () => {
      logStep('snapshotRegression', 'disconnect flag');
      const client = createConnectedSession();
      expect(client.isDisconnect).assertFalse();
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(snapshotOf(client).toastCount).assertEqual(3);
    });

    /**
     * @tc.name          snapshotRegressionSnapshotTracksToastsNotEvents
     * @tc.desc          A refused connect grows events and logs but not toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Snapshot. 2. Attempt a duplicate connect. 3. Snapshot again.
     * @tc.expected      The toast count is stable while events and logs grow.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionSnapshotTracksToastsNotEvents', 0, () => {
      logStep('snapshotRegression', 'tracks toasts');
      const client = createConnectedSession();
      const before = snapshotOf(client);
      expect(client.connect(2)).assertFalse();
      const after = snapshotOf(client);
      expect(after.sameAs(before)).assertTrue();
      expect(after.toastCount).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.size()).assertEqual(3);
      expect(client.logs.size()).assertEqual(3);
      expect(after.describe()).assertEqual(GOLDEN_CONNECTED);
     });

    /**
     * @tc.name          snapshotRegressionMetricsFingerprintChangesWithTraffic
     * @tc.desc          One send changes the metric fingerprint from the empty one.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Derive the initial metrics. 2. Send once. 3. Derive again.
     * @tc.expected      The two fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionMetricsFingerprintChangesWithTraffic', 0, () => {
      logStep('snapshotRegression', 'fingerprint traffic');
      const client = createConnectedSession();
      const before = ClientMetrics.from(client);
      client.sendString('one');
      const after = ClientMetrics.from(client);
      expect(before.sends).assertEqual(0);
      expect(after.sends).assertEqual(1);
      expect(before.fingerprint() === after.fingerprint()).assertFalse();
      expect(before.fingerprint()).assertEqual(textFingerprint('1:0:0:0'));
      expect(after.fingerprint()).assertEqual(textFingerprint('1:1:0:1'));
      expect(after.fingerprint() > 0).assertTrue();
      expect(before.connects).assertEqual(after.connects);
    });

    /**
     * @tc.name          snapshotRegressionCallbackOracleMatchesState
     * @tc.desc          Scheduled callbacks move the client to the oracle state.
     * @tc.precondition  The expectedStateAfter oracle is exported.
     * @tc.steps         1. Apply connect, onConnect, onDisconnect and onFailed. 2. Compare
     *                   each state to the oracle. 3. Snapshot after each step.
     * @tc.expected      Every state and snapshot follows the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionCallbackOracleMatchesState', 0, () => {
      logStep('snapshotRegression', 'callback oracle');
      const client = new ConnectionModel();
      client.connect(1);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      expect(snapshotOf(client).describe()).assertEqual('connecting/1/false/false/0');
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(snapshotOf(client).describe()).assertEqual('connected/1/true/true/1');
      client.onDisconnect();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(snapshotOf(client).toastCount).assertEqual(2);
      client.onFailed(16000001);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(snapshotOf(client).state).assertEqual(STATE_FAILED);
     });

    /**
     * @tc.name          snapshotRegressionSnapshotFieldsAreTyped
     * @tc.desc          Every flattened snapshot field has the expected primitive type.
     * @tc.precondition  A connected session is snapshotted.
     * @tc.steps         1. Read each field. 2. Compare to its literal. 3. Confirm the
     *                   boolean and numeric kinds.
     * @tc.expected      State is a string, id a number and flags are booleans.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionSnapshotFieldsAreTyped', 0, () => {
      logStep('snapshotRegression', 'typed fields');
      const snapshot = snapshotOf(createConnectedSession());
      expect(snapshot.state === 'connected').assertTrue();
      expect(snapshot.connectId === 7).assertTrue();
      expect(snapshot.hasProxy === true).assertTrue();
      expect(snapshot.deathRegistered === true).assertTrue();
      expect(snapshot.toastCount === 1).assertTrue();
      expect(snapshot.state.length).assertEqual(9);
      expect(String(snapshot.connectId)).assertEqual('7');
      expect(snapshot.describe().split('/').length).assertEqual(5);
     });

    /**
     * @tc.name          snapshotRegressionEventCountOfRespectsColon
     * @tc.desc          countOf matches a kind only with its colon delimiter.
     * @tc.precondition  An event recorder is available.
     * @tc.steps         1. Record send-ok and send-okay. 2. Count send-ok. 3. Count
     *                   send-okay.
     * @tc.expected      Each kind is counted once without cross matching.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionEventCountOfRespectsColon', 0, () => {
      logStep('snapshotRegression', 'count delimiter');
      const recorder = new EventRecorder();
      recorder.record('send-ok', 'reply');
      recorder.record('send-okay', 'other');
      expect(recorder.countOf('send-ok')).assertEqual(1);
      expect(recorder.countOf('send-okay')).assertEqual(1);
      expect(recorder.countOf('send')).assertEqual(0);
      expect(recorder.size()).assertEqual(2);
      expect(recorder.last()).assertEqual('send-okay:other');
      expect(recorder.entries[0]).assertEqual('send-ok:reply');
      expect(joined(recorder.entries, '|')).assertEqual('send-ok:reply|send-okay:other');
     });

    /**
     * @tc.name          snapshotRegressionEventClearRestoresEmptyFingerprint
     * @tc.desc          Clearing the recorder yields the empty fingerprint.
     * @tc.precondition  A recorder holds two events.
     * @tc.steps         1. Fingerprint the trace. 2. Clear. 3. Fingerprint again.
     * @tc.expected      The cleared fingerprint is 216613.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionEventClearRestoresEmptyFingerprint', 0, () => {
      logStep('snapshotRegression', 'event clear');
      const recorder = new EventRecorder();
      recorder.record('a', '1');
      recorder.record('b', '2');
      const busy = recorder.fingerprint();
      expect(recorder.fingerprint()).assertEqual(textFingerprint('a:1|b:2'));
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.fingerprint()).assertEqual(216613);
      expect(recorder.fingerprint() === busy).assertFalse();
      expect(recorder.last()).assertEqual('');
      expect(recorder.countOf('a')).assertEqual(0);
     });

    /**
     * @tc.name          snapshotRegressionRepliesNeverExceedSends
     * @tc.desc          Reply counts stay bounded by send counts.
     * @tc.precondition  Several sessions with mixed outcomes exist.
     * @tc.steps         1. Build three traffic mixes. 2. Derive metrics. 3. Compare reply
     *                   and send counts.
     * @tc.expected      Every reply count is at most its send count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionRepliesNeverExceedSends', 0, () => {
      logStep('snapshotRegression', 'replies bounded');
      const sessions: ConnectionModel[] = [
        createConnectedSession(),
        createConnectedSession(),
        createConnectedSession()
      ];
      sessions[0].sendString('one');
      sessions[1].sendString('one');
      sessions[1].sendString('two');
      (sessions[2].proxy as RemoteProxyModel).stub.kill();
      sessions[2].sendString('lost');
      for (let index = 0; index < sessions.length; index++) {
        const metrics = ClientMetrics.from(sessions[index]);
        expect(metrics.replies <= metrics.sends).assertTrue();
        expect(metrics.failures >= 0).assertTrue();
        expect(metrics.connects).assertEqual(1);
      }
      expect(ClientMetrics.from(sessions[0]).sends).assertEqual(1);
      expect(ClientMetrics.from(sessions[1]).sends).assertEqual(2);
      expect(ClientMetrics.from(sessions[2]).replies).assertEqual(0);
      expect(ClientMetrics.from(sessions[2]).failures).assertEqual(1);
     });

    /**
     * @tc.name          snapshotRegressionDisconnectedSnapshotHasNoProxy
     * @tc.desc          A disconnected snapshot reports no proxy after a real connect.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect. 2. Read the hasProxy field. 3. Compare with a fresh
     *                   client.
     * @tc.expected      Both snapshots report no proxy but differ in toast count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionDisconnectedSnapshotHasNoProxy', 0, () => {
      logStep('snapshotRegression', 'disconnected no proxy');
      const client = createConnectedSession();
      client.onDisconnect();
      const snapshot = snapshotOf(client);
      const fresh = snapshotOf(new ConnectionModel());
      expect(snapshot.hasProxy).assertFalse();
      expect(fresh.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(fresh.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(2);
      expect(fresh.toastCount).assertEqual(0);
      expect(snapshot.sameAs(fresh)).assertFalse();
     });

    /**
     * @tc.name          snapshotRegressionGoldenTableMatchesActions
     * @tc.desc          Three client lifecycle stages map to three golden strings.
     * @tc.precondition  Fresh, connecting and connected clients are available.
     * @tc.steps         1. Build each stage. 2. Snapshot it. 3. Compare the golden table.
     * @tc.expected      Each stage matches its golden entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionGoldenTableMatchesActions', 0, () => {
      logStep('snapshotRegression', 'golden table');
      const fresh = new ConnectionModel();
      const connecting = new ConnectionModel();
      connecting.connect(3);
      const connected = createConnectedSession();
      const table: string[] = [snapshotOf(fresh).describe(), snapshotOf(connecting).describe(),
        snapshotOf(connected).describe()];
      expect(table[0]).assertEqual('disconnected/-1/false/false/0');
      expect(table[1]).assertEqual('connecting/3/false/false/0');
      expect(table[2]).assertEqual(GOLDEN_CONNECTED);
      expect(table.length).assertEqual(3);
      expect(uniqueStrings(table).length).assertEqual(3);
      expect(table[0] === table[1]).assertFalse();
      expect(table[2] === table[0]).assertFalse();
     });

    /**
     * @tc.name          snapshotRegressionEventLastAfterClearIsEmpty
     * @tc.desc          last() returns the empty string after clear.
     * @tc.precondition  A recorder with two events exists.
     * @tc.steps         1. Read the last event. 2. Clear. 3. Read it again.
     * @tc.expected      The last event is empty after the clear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionEventLastAfterClearIsEmpty', 0, () => {
      logStep('snapshotRegression', 'last after clear');
      const recorder = new EventRecorder();
      recorder.record('one', 'a');
      recorder.record('two', 'b');
      expect(recorder.last()).assertEqual('two:b');
      expect(recorder.size()).assertEqual(2);
      recorder.clear();
      expect(recorder.last()).assertEqual('');
      expect(recorder.size()).assertEqual(0);
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.countOf('one')).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(216613);
     });

    /**
     * @tc.name          snapshotRegressionRepliesEqualSendOkEvents
     * @tc.desc          The reply count equals the send-ok event count.
     * @tc.precondition  A connected session has served two sends.
     * @tc.steps         1. Send twice. 2. Derive metrics. 3. Compare replies to events.
     * @tc.expected      Both counts are two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionRepliesEqualSendOkEvents', 0, () => {
      logStep('snapshotRegression', 'replies equal events');
      const client = createConnectedSession();
      client.sendString('one');
      client.sendString('two');
      const metrics = ClientMetrics.from(client);
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.replies).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.sends).assertEqual(metrics.replies + metrics.failures);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
     });

    /**
     * @tc.name          snapshotRegressionDefaultConnectIdIsSeven
     * @tc.desc          createConnectedSession always uses connect id seven.
     * @tc.precondition  createConnectedSession is exported.
     * @tc.steps         1. Build a session. 2. Read the id. 3. Split the snapshot.
     * @tc.expected      The id field is seven in the snapshot string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionDefaultConnectIdIsSeven', 0, () => {
      logStep('snapshotRegression', 'default id seven');
      const snapshot = snapshotOf(createConnectedSession());
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.describe().split('/')[1]).assertEqual('7');
      expect(snapshot.describe()).assertEqual('connected/7/true/true/1');
      expect(snapshot.connectId > 0).assertTrue();
      expect(String(snapshot.connectId)).assertEqual('7');
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.hasProxy).assertTrue();
     });

    /**
     * @tc.name          snapshotRegressionToastCountAfterThreeSends
     * @tc.desc          Three sends add three toasts to the connect toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three times. 2. Count the toasts. 3. Compare the snapshot.
     * @tc.expected      Four toasts exist while the snapshot toast count stays one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionToastCountAfterThreeSends', 0, () => {
      logStep('snapshotRegression', 'toasts after three sends');
      const client = createConnectedSession();
      client.sendString('one');
      client.sendString('two');
      client.sendString('three');
      expect(client.toasts.length).assertEqual(4);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(3);
      expect(countOf(client.toasts, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(snapshotOf(client).toastCount).assertEqual(4);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(uniqueStrings(client.toasts).length).assertEqual(2);
      expect(client.toasts[3]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
     });

    /**
     * @tc.name          snapshotRegressionStateStaysConnectedAfterSend
     * @tc.desc          Sending never moves the connection state.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send once. 2. Read the state. 3. Compare to the golden.
     * @tc.expected      The state remains connected with the same id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionStateStaysConnectedAfterSend', 0, () => {
      logStep('snapshotRegression', 'state after send');
      const client = createConnectedSession();
      client.sendString('hello world');
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.isConnected()).assertTrue();
      expect(snapshotOf(client).state).assertEqual(STATE_CONNECTED);
      expect(snapshotOf(client).describe()).assertEqual('connected/7/true/true/2');
      expect(client.proxy === undefined).assertFalse();
      expect(client.deathRecipient.registered).assertTrue();
     });

    /**
     * @tc.name          snapshotRegressionEqualityIsTransitive
     * @tc.desc          Three identical sessions compare transitively.
     * @tc.precondition  Three connected sessions exist.
     * @tc.steps         1. Snapshot all three. 2. Compare pairwise. 3. Compare the describes.
     * @tc.expected      All pairwise comparisons are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionEqualityIsTransitive', 0, () => {
      logStep('snapshotRegression', 'equality transitive');
      const first = snapshotOf(createConnectedSession());
      const second = snapshotOf(createConnectedSession());
      const third = snapshotOf(createConnectedSession());
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(third)).assertTrue();
      expect(first.sameAs(third)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(second.describe()).assertEqual(third.describe());
      expect(uniqueStrings([first.describe(), second.describe(), third.describe()]).length).assertEqual(1);
      expect(first.toastCount).assertEqual(third.toastCount);
     });

    /**
     * @tc.name          snapshotRegressionFailureAndDisconnectDiffer
     * @tc.desc          Failure and disconnect snapshots are distinct values.
     * @tc.precondition  One failed client and one disconnected client exist.
     * @tc.steps         1. Build both. 2. Snapshot both. 3. Compare states and equality.
     * @tc.expected      The two snapshots differ in state but share the id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionFailureAndDisconnectDiffer', 0, () => {
      logStep('snapshotRegression', 'failure versus disconnect');
      const failed = new ConnectionModel();
      failed.onFailed(16000001);
      const disconnected = createConnectedSession();
      disconnected.onDisconnect();
      const failureSnapshot = snapshotOf(failed);
      const disconnectSnapshot = snapshotOf(disconnected);
      expect(failureSnapshot.state).assertEqual(STATE_FAILED);
      expect(disconnectSnapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(failureSnapshot.connectId).assertEqual(disconnectSnapshot.connectId);
      expect(failureSnapshot.sameAs(disconnectSnapshot)).assertFalse();
      expect(failureSnapshot.describe()).assertEqual('failed/-1/false/false/1');
      expect(disconnectSnapshot.describe()).assertEqual(GOLDEN_AFTER_DISCONNECT);
      expect(countOf([failureSnapshot.state, disconnectSnapshot.state], 'failed')).assertEqual(1);
     });

    /**
     * @tc.name          snapshotRegressionMetricsMixedTrafficGolden
     * @tc.desc          A fixed mixed traffic script has a golden metric string.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send good, fail, disconnect. 2. Derive metrics. 3. Compare the
     *                   golden fingerprint.
     * @tc.expected      The metrics string is 1:2:1:1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionMetricsMixedTrafficGolden', 0, () => {
      logStep('snapshotRegression', 'mixed traffic golden');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.sendString('good');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('bad');
      client.onDisconnect();
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:2:1:1'));
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          snapshotRegressionConnectingAndConnectedDiffer
     * @tc.desc          Same id but different state yields unequal snapshots.
     * @tc.precondition  Two clients use connect id five.
     * @tc.steps         1. Leave one connecting. 2. Connect the other. 3. Compare the
     *                   snapshots.
     * @tc.expected      The snapshots differ in state and proxy flags.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionConnectingAndConnectedDiffer', 0, () => {
      logStep('snapshotRegression', 'connecting versus connected');
      const connecting = new ConnectionModel();
      connecting.connect(5);
      const connected = new ConnectionModel();
      connected.connect(5);
      connected.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const left = snapshotOf(connecting);
      const right = snapshotOf(connected);
      expect(left.connectId).assertEqual(right.connectId);
      expect(left.state).assertEqual(STATE_CONNECTING);
      expect(right.state).assertEqual(STATE_CONNECTED);
      expect(left.sameAs(right)).assertFalse();
      expect(left.hasProxy).assertFalse();
      expect(right.hasProxy).assertTrue();
      expect(left.toastCount).assertEqual(0);
      expect(right.toastCount).assertEqual(1);
      expect(left.describe()).assertEqual('connecting/5/false/false/0');
      expect(right.describe()).assertEqual('connected/5/true/true/1');
    });

    /**
     * @tc.name          snapshotRegressionResetClearsDisconnectFlag
     * @tc.desc          reset returns the disconnect flag to false.
     * @tc.precondition  A disconnected session exists.
     * @tc.steps         1. Disconnect. 2. Read the flag. 3. Reset and read it again.
     * @tc.expected      The flag is true after disconnect and false after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetClearsDisconnectFlag', 0, () => {
      logStep('snapshotRegression', 'reset clears flag');
      const client = createConnectedSession();
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      client.reset();
      expect(client.isDisconnect).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshotOf(client).describe()).assertEqual(GOLDEN_DISCONNECTED);
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          snapshotRegressionFreshToastCountIsZero
     * @tc.desc          A fresh client has no toasts in its snapshot.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Read the toast count. 2. Read the toasts. 3. Compare the golden.
     * @tc.expected      The toast count is zero and the snapshot is the fresh golden.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionFreshToastCountIsZero', 0, () => {
      logStep('snapshotRegression', 'fresh toast zero');
      const client = new ConnectionModel();
      const snapshot = snapshotOf(client);
      expect(snapshot.toastCount).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.lastToast()).assertEqual('');
      expect(snapshot.describe()).assertEqual(GOLDEN_DISCONNECTED);
      expect(snapshot.describe().split('/')[4]).assertEqual('0');
      expect(snapshot.sameAs(snapshotOf(new ConnectionModel()))).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          snapshotRegressionEventTraceGoldenString
     * @tc.desc          A hand built event trail matches a pinned string.
     * @tc.precondition  An event recorder exists.
     * @tc.steps         1. Record three events. 2. Read the trace. 3. Compare the fingerprint
     *                   and the last entry.
     * @tc.expected      The trace is one:1|two:2|three:3.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionEventTraceGoldenString', 0, () => {
      logStep('snapshotRegression', 'event trace golden');
      const recorder = new EventRecorder();
      recorder.record('one', '1');
      recorder.record('two', '2');
      recorder.record('three', '3');
      expect(recorder.trace()).assertEqual('one:1|two:2|three:3');
      expect(recorder.trace().split('|').length).assertEqual(3);
      expect(recorder.last()).assertEqual('three:3');
      expect(recorder.countOf('two')).assertEqual(1);
      expect(recorder.fingerprint()).assertEqual(textFingerprint('one:1|two:2|three:3'));
      expect(recorder.entries[1]).assertEqual('two:2');
      expect(recorder.size()).assertEqual(3);
      expect(recorder.countOf('four')).assertEqual(0);
    });

    /**
     * @tc.name          snapshotRegressionReconnectCountsTwoConnects
     * @tc.desc          Disconnect then reconnect yields two connect events.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect. 2. Reconnect with a new proxy. 3. Derive metrics.
     * @tc.expected      The connect count is two and the state is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReconnectCountsTwoConnects', 0, () => {
      logStep('snapshotRegression', 'reconnect counts');
      const client = createConnectedSession();
      client.onDisconnect();
      client.connect(9);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(9);
      expect(client.events.countOf('connected')).assertEqual(2);
      expect(client.events.countOf('disconnect')).assertEqual(0);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          snapshotRegressionEventKindOfUnusualDetail
     * @tc.desc          Event kind extraction works for a colon rich detail.
     * @tc.precondition  An event recorder exists.
     * @tc.steps         1. Record a detail with colons. 2. Extract the kinds. 3. Compare the
     *                   first kind.
     * @tc.expected      The kind is the text before the first colon.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('snapshotRegressionEventKindOfUnusualDetail', 0, () => {
      logStep('snapshotRegression', 'unusual detail');
      const recorder = new EventRecorder();
      recorder.record('send', 'a:b:c');
      recorder.record('reply', 'd:e');
      const kinds = eventKinds(recorder);
      expect(kinds.length).assertEqual(2);
      expect(kinds[0]).assertEqual('send');
      expect(kinds[1]).assertEqual('reply');
      expect(recorder.entries[0]).assertEqual('send:a:b:c');
      expect(recorder.entries[0].split(':').length).assertEqual(4);
      expect(recorder.countOf('send')).assertEqual(1);
      expect(recorder.last()).assertEqual('reply:d:e');
      expect(joined(kinds, '>')).assertEqual('send>reply');
    });

    /**
     * @tc.name          snapshotRegressionComparisonIsSymmetric
     * @tc.desc          Unequal snapshots report false in both directions.
     * @tc.precondition  A fresh and a connected snapshot exist.
     * @tc.steps         1. Compare fresh to connected. 2. Compare connected to fresh. 3. Compare
     *                   both descriptions.
     * @tc.expected      Both directions are false and the descriptions differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionComparisonIsSymmetric', 0, () => {
      logStep('snapshotRegression', 'symmetric compare');
      const fresh = snapshotOf(new ConnectionModel());
      const connected = snapshotOf(createConnectedSession());
      expect(fresh.sameAs(connected)).assertFalse();
      expect(connected.sameAs(fresh)).assertFalse();
      expect(fresh.sameAs(connected)).assertEqual(connected.sameAs(fresh));
      expect(fresh.describe() === connected.describe()).assertFalse();
      expect(fresh.state).assertEqual(STATE_DISCONNECTED);
      expect(connected.state).assertEqual(STATE_CONNECTED);
      expect(fresh.connectId === connected.connectId).assertFalse();
      expect(uniqueStrings([fresh.describe(), connected.describe()]).length).assertEqual(2);
    });

    /**
     * @tc.name          snapshotRegressionMetricsSurviveDisconnect
     * @tc.desc          Disconnecting does not erase the send metrics.
     * @tc.precondition  A connected session has sent once.
     * @tc.steps         1. Send. 2. Disconnect. 3. Derive metrics.
     * @tc.expected      The send and reply counts are preserved after disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionMetricsSurviveDisconnect', 0, () => {
      logStep('snapshotRegression', 'metrics survive disconnect');
      const client = createConnectedSession();
      client.sendString('one');
      client.onDisconnect();
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:1:0:1'));
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          snapshotRegressionInitialIdInDescribe
     * @tc.desc          The fresh describe carries the minus one sentinel.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Split the describe. 2. Read the id field. 3. Compare it to the sentinel.
     * @tc.expected      The second field is -1 and the state field is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionInitialIdInDescribe', 0, () => {
      logStep('snapshotRegression', 'initial id describe');
      const parts = snapshotOf(new ConnectionModel()).describe().split('/');
      expect(parts[0]).assertEqual('disconnected');
      expect(parts[1]).assertEqual('-1');
      expect(parts[1]).assertEqual(String(INITIAL_CONNECT_ID));
      expect(parts[2]).assertEqual('false');
      expect(parts[3]).assertEqual('false');
      expect(parts[4]).assertEqual('0');
      expect(parts.length).assertEqual(5);
      expect(parts.join('/')).assertEqual(GOLDEN_DISCONNECTED);
    });

  });
}
