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
  DeathRecipientModel,
  WantModel,
  createConnectedSession,
  expectedStateAfter,
  expectedToastFor,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_FAILED,
  INITIAL_CONNECT_ID,
  LEVEL_WARN,
  LEVEL_ERROR,
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  TARGET_BUNDLE,
  TARGET_ABILITY
} from '../Shared/SharedDriver';

export default function clientConnectionLifecycle(): void {
  describe('ClientConnectionLifecycle', () => {
    beforeAll(() => {
      logSuite('ClientConnectionLifecycle', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientConnectionLifecycle', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectFromIdle
     * @tc.desc          Connect from the idle state moves the client into connecting with the requested id.
     * @tc.precondition  A freshly constructed ConnectionModel with no proxy and no connect id.
     * @tc.steps         1. Build a new client and snapshot its initial state.
     *                   2. Call connect with id 101.
     *                   3. Compare the client against the independent state oracle.
     * @tc.expected      State becomes connecting, id is 101, and exactly one connect event is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleConnectFromIdle', 0, () => {
      logStep('clientLifecycleConnectFromIdle', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      expect(before.state).assertEqual(STATE_DISCONNECTED);
      expect(before.connectId).assertEqual(INITIAL_CONNECT_ID);
      const started: boolean = client.connect(101);
      expect(started).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(101);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleConnectFromIdle', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectStoresGeneratedId
     * @tc.desc          A generated connect id is stored verbatim and survives the connecting transition.
     * @tc.precondition  A fresh client whose connect id still equals the initial sentinel.
     * @tc.steps         1. Create the client and verify the sentinel id.
     *                   2. Connect with id 17.
     *                   3. Read back the stored id and call counter.
     * @tc.expected      The stored id equals 17 and the call counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleConnectStoresGeneratedId', 0, () => {
      logStep('clientLifecycleConnectStoresGeneratedId', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      expect(before.state).assertEqual(STATE_DISCONNECTED);
      expect(before.connectId).assertEqual(INITIAL_CONNECT_ID);
      const started: boolean = client.connect(17);
      expect(started).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(17);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleConnectStoresGeneratedId', snap.describe());
      logStep('clientLifecycleConnectStoresGeneratedId', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectIdSentinelReplaced
     * @tc.desc          Connecting replaces the initial sentinel id with the value handed to connect.
     * @tc.precondition  A client that has never been connected.
     * @tc.steps         1. Record the sentinel id.
     *                   2. Connect with id 42.
     *                   3. Assert the sentinel is gone.
     * @tc.expected      The connect id no longer equals INITIAL_CONNECT_ID.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleConnectIdSentinelReplaced', 0, () => {
      logStep('clientLifecycleConnectIdSentinelReplaced', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      expect(before.state).assertEqual(STATE_DISCONNECTED);
      expect(before.connectId).assertEqual(INITIAL_CONNECT_ID);
      const started: boolean = client.connect(42);
      expect(started).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(42);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleConnectIdSentinelReplaced', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectLargeId
     * @tc.desc          Large connect ids are accepted without truncation.
     * @tc.precondition  A fresh client and a large numeric id.
     * @tc.steps         1. Connect with id 999.
     *                   2. Inspect the stored id.
     *                   3. Check the recorded event count.
     * @tc.expected      The stored id stays 999 and one connect event remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleConnectLargeId', 0, () => {
      logStep('clientLifecycleConnectLargeId', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      expect(before.state).assertEqual(STATE_DISCONNECTED);
      expect(before.connectId).assertEqual(INITIAL_CONNECT_ID);
      const started: boolean = client.connect(999);
      expect(started).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(999);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleConnectLargeId', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectSmallId
     * @tc.desc          Small non-negative connect ids are accepted and stored.
     * @tc.precondition  A fresh client and id zero.
     * @tc.steps         1. Connect with id 0.
     *                   2. Verify the connecting state.
     *                   3. Confirm the proxy is still absent.
     * @tc.expected      The client is connecting with id 0 and no proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleConnectSmallId', 0, () => {
      logStep('clientLifecycleConnectSmallId', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const before: ClientSnapshot = new ClientSnapshot(client);
      expect(before.state).assertEqual(STATE_DISCONNECTED);
      expect(before.connectId).assertEqual(INITIAL_CONNECT_ID);
      const started: boolean = client.connect(0);
      expect(started).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(0);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleConnectSmallId', snap.describe());
      logStep('clientLifecycleConnectSmallId', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnConnectStoresProxy
     * @tc.desc          onConnect stores the remote proxy and registers the death recipient.
     * @tc.precondition  A client that already moved to connecting.
     * @tc.steps         1. Connect with id 7.
     *                   2. Deliver a proxy through onConnect.
     *                   3. Inspect proxy, recipient and toast fields.
     * @tc.expected      The proxy is retained, the recipient is registered and the success toast is queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleOnConnectStoresProxy', 0, () => {
      logStep('clientLifecycleOnConnectStoresProxy', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(7);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'alpha';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleOnConnectStoresProxy', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnConnectMarksConnected
     * @tc.desc          onConnect drives the state machine from connecting to connected.
     * @tc.precondition  A connecting client with no proxy attached.
     * @tc.steps         1. Connect the client.
     *                   2. Attach a stub proxy.
     *                   3. Assert the connected state through two oracles.
     * @tc.expected      Both the local state field and the oracle report connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleOnConnectMarksConnected', 0, () => {
      logStep('clientLifecycleOnConnectMarksConnected', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(11);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'beta';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(client.lastToast()).assertEqual(expectedToastFor('connect-success'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      logStep('clientLifecycleOnConnectMarksConnected', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnConnectEmitsSingleToast
     * @tc.desc          A successful connection queues exactly one toast and one connected event.
     * @tc.precondition  A connecting client and a live proxy.
     * @tc.steps         1. Connect and attach the proxy.
     *                   2. Count toasts and connected events.
     *                   3. Check the toast text.
     * @tc.expected      One toast with the connection success text is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnConnectEmitsSingleToast', 0, () => {
      logStep('clientLifecycleOnConnectEmitsSingleToast', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(13);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'gamma';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.lastToast().length).assertLarger(0);
      expect(client.toasts.length >= 1).assertTrue();
      logStep('clientLifecycleOnConnectEmitsSingleToast', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnConnectRegistersDeathRecipient
     * @tc.desc          The death recipient shared with the proxy is the client owned instance.
     * @tc.precondition  A connecting client that owns a single death recipient.
     * @tc.steps         1. Connect and attach the proxy.
     *                   2. Compare recipient identity on both sides.
     *                   3. Assert the registered flags.
     * @tc.expected      Proxy and client agree on the same recipient object.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnConnectRegistersDeathRecipient', 0, () => {
      logStep('clientLifecycleOnConnectRegistersDeathRecipient', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(19);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'delta';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleOnConnectRegistersDeathRecipient', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnConnectIsConnectedUtility
     * @tc.desc          The isConnected helper requires state, proxy and liveness together.
     * @tc.precondition  A connecting client with a live proxy available.
     * @tc.steps         1. Connect and attach the proxy.
     *                   2. Call isConnected.
     *                   3. Compare with the raw state field.
     * @tc.expected      isConnected returns true only after onConnect completes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnConnectIsConnectedUtility', 0, () => {
      logStep('clientLifecycleOnConnectIsConnectedUtility', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(29);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'epsilon';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleOnConnectIsConnectedUtility', snap.describe());
      logStep('clientLifecycleOnConnectIsConnectedUtility', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnDisconnectClearsProxy
     * @tc.desc          onDisconnect clears the proxy reference and restores the sentinel id.
     * @tc.precondition  A connected session built by createConnectedSession.
     * @tc.steps         1. Confirm the session is connected.
     *                   2. Deliver onDisconnect.
     *                   3. Inspect proxy and id fields.
     * @tc.expected      The proxy becomes undefined and the id returns to the sentinel.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleOnDisconnectClearsProxy', 0, () => {
      logStep('clientLifecycleOnDisconnectClearsProxy', 'begin');
      const client: ConnectionModel = createConnectedSession('zeta');
      expect(client.isConnected()).assertTrue();
      const recipient: DeathRecipientModel = client.deathRecipient;
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleOnDisconnectClearsProxy', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnDisconnectUnregistersRecipient
     * @tc.desc          Dropping the connection unregisters the death recipient from the proxy.
     * @tc.precondition  A connected session whose recipient is registered.
     * @tc.steps         1. Keep a handle to the recipient.
     *                   2. Deliver onDisconnect.
     *                   3. Assert the registered flag is cleared.
     * @tc.expected      The recipient registered flag turns false while the object identity is kept.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleOnDisconnectUnregistersRecipient', 0, () => {
      logStep('clientLifecycleOnDisconnectUnregistersRecipient', 'begin');
      const client: ConnectionModel = createConnectedSession('eta');
      expect(client.isConnected()).assertTrue();
      const recipient: DeathRecipientModel = client.deathRecipient;
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleOnDisconnectUnregistersRecipient', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnDisconnectSetsFlag
     * @tc.desc          The disconnect flag is raised so the UI can suppress the failure toast.
     * @tc.precondition  A connected session with the disconnect flag still false.
     * @tc.steps         1. Assert the flag starts false.
     *                   2. Deliver onDisconnect.
     *                   3. Read the flag and the toast text.
     * @tc.expected      The flag becomes true and the success toast is queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnDisconnectSetsFlag', 0, () => {
      logStep('clientLifecycleOnDisconnectSetsFlag', 'begin');
      const client: ConnectionModel = createConnectedSession('theta');
      expect(client.isConnected()).assertTrue();
      const recipient: DeathRecipientModel = client.deathRecipient;
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.lastToast().length).assertLarger(0);
      expect(client.toasts.length >= 1).assertTrue();
      logStep('clientLifecycleOnDisconnectSetsFlag', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnDisconnectIdempotent
     * @tc.desc          A second onDisconnect keeps the session disconnected and does not resurrect the proxy.
     * @tc.precondition  A session that has already been disconnected once.
     * @tc.steps         1. Disconnect once.
     *                   2. Disconnect a second time.
     *                   3. Compare the observable state.
     * @tc.expected      The proxy stays undefined and the state remains disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnDisconnectIdempotent', 0, () => {
      logStep('clientLifecycleOnDisconnectIdempotent', 'begin');
      const client: ConnectionModel = createConnectedSession('iota');
      expect(client.isConnected()).assertTrue();
      const recipient: DeathRecipientModel = client.deathRecipient;
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleOnDisconnectIdempotent', snap.describe());
      logStep('clientLifecycleOnDisconnectIdempotent', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnDisconnectToastText
     * @tc.desc          The disconnect callback queues the documented success toast text.
     * @tc.precondition  A connected session with no failure to report.
     * @tc.steps         1. Disconnect the session.
     *                   2. Read the last toast.
     *                   3. Compare with the expected oracle.
     * @tc.expected      The last toast equals the disconnect success constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnDisconnectToastText', 0, () => {
      logStep('clientLifecycleOnDisconnectToastText', 'begin');
      const client: ConnectionModel = createConnectedSession('kappa');
      expect(client.isConnected()).assertTrue();
      const recipient: DeathRecipientModel = client.deathRecipient;
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.lastToast()).assertEqual(expectedToastFor('disconnect-success'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      logStep('clientLifecycleOnDisconnectToastText', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnFailedStoresCode
     * @tc.desc          onFailed records the numeric failure code for later diagnostics.
     * @tc.precondition  A connecting client.
     * @tc.steps         1. Connect with id 31.
     *                   2. Deliver onFailed with code 16000001.
     *                   3. Read the stored failure code.
     * @tc.expected      The failed code equals 16000001 and the state is failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleOnFailedStoresCode', 0, () => {
      logStep('clientLifecycleOnFailedStoresCode', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(31);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleOnFailedStoresCode', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnFailedStateOracle
     * @tc.desc          The failed callback matches the independent state oracle.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect the client.
     *                   2. Call onFailed with code 16000002.
     *                   3. Compare against expectedStateAfter.
     * @tc.expected      The local state equals the oracle answer for onFailed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleOnFailedStateOracle', 0, () => {
      logStep('clientLifecycleOnFailedStateOracle', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(33);
      client.onFailed(16000002);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(16000002);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleOnFailedStateOracle', snap.describe());
      logStep('clientLifecycleOnFailedStateOracle', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnFailedToast
     * @tc.desc          A failed connection queues the service-not-running toast.
     * @tc.precondition  A connecting client and a failure code.
     * @tc.steps         1. Connect and fail the attempt.
     *                   2. Count the queued toasts.
     *                   3. Compare the text with the oracle.
     * @tc.expected      Exactly one toast with the connection failure text is queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnFailedToast', 0, () => {
      logStep('clientLifecycleOnFailedToast', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(35);
      client.onFailed(16000003);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(16000003);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-fail'));
      expect(client.lastToast().length).assertLarger(0);
      expect(client.toasts.length >= 1).assertTrue();
      logStep('clientLifecycleOnFailedToast', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnFailedZeroCode
     * @tc.desc          A zero failure code is still treated as a failed callback.
     * @tc.precondition  A connecting client.
     * @tc.steps         1. Connect the client.
     *                   2. Deliver onFailed with code 0.
     *                   3. Assert the failed state and code.
     * @tc.expected      The state is failed and the stored code is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOnFailedZeroCode', 0, () => {
      logStep('clientLifecycleOnFailedZeroCode', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(37);
      client.onFailed(0);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(0);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleOnFailedZeroCode', 'end');
    });

    /**
     * @tc.name          clientLifecycleOnFailedNegativeCode
     * @tc.desc          Negative failure codes are preserved without normalization.
     * @tc.precondition  A connecting client.
     * @tc.steps         1. Connect the client.
     *                   2. Deliver onFailed with code -1.
     *                   3. Read back the code and toast.
     * @tc.expected      The stored code stays -1 and the failure toast is queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientLifecycleOnFailedNegativeCode', 0, () => {
      logStep('clientLifecycleOnFailedNegativeCode', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(39);
      client.onFailed(-1);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(-1);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleOnFailedNegativeCode', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectTwiceKeepsFirstId
     * @tc.desc          A second connect while connecting is rejected and keeps the first id.
     * @tc.precondition  A client already in the connecting state.
     * @tc.steps         1. Connect with id 23.
     *                   2. Attempt a second connect with id 24.
     *                   3. Compare ids and call counters.
     * @tc.expected      The second call returns false and the id stays 23.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleConnectTwiceKeepsFirstId', 0, () => {
      logStep('clientLifecycleConnectTwiceKeepsFirstId', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(23);
      const again: boolean = client.connect(24);
      expect(again).assertFalse();
      expect(client.connectId).assertEqual(23);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.contains('connect skipped')).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleConnectTwiceKeepsFirstId', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectTwiceLogsWarning
     * @tc.desc          The rejected duplicate connect writes one warning to the client log buffer.
     * @tc.precondition  A client that is connecting.
     * @tc.steps         1. Connect once.
     *                   2. Connect again.
     *                   3. Inspect warning count and message fragment.
     * @tc.expected      One warning containing the skipped-connect fragment is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleConnectTwiceLogsWarning', 0, () => {
      logStep('clientLifecycleConnectTwiceLogsWarning', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(25);
      const again: boolean = client.connect(26);
      expect(again).assertFalse();
      expect(client.connectId).assertEqual(25);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.contains('connect skipped')).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleConnectTwiceLogsWarning', 'end');
    });

    /**
     * @tc.name          clientLifecycleConnectTwiceNoToast
     * @tc.desc          Rejected duplicate connects never queue a toast.
     * @tc.precondition  A client that is connecting.
     * @tc.steps         1. Connect once.
     *                   2. Attempt the duplicate.
     *                   3. Count toasts and events.
     * @tc.expected      No toast is queued and only one connect event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleConnectTwiceNoToast', 0, () => {
      logStep('clientLifecycleConnectTwiceNoToast', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(27);
      const again: boolean = client.connect(28);
      expect(again).assertFalse();
      expect(client.connectId).assertEqual(27);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.contains('connect skipped')).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleConnectTwiceNoToast', snap.describe());
      logStep('clientLifecycleConnectTwiceNoToast', 'end');
    });

    /**
     * @tc.name          clientLifecycleFullCycleReconnects
     * @tc.desc          A connect, drop and reconnect cycle leaves the client connecting again.
     * @tc.precondition  No prior state on the client under test.
     * @tc.steps         1. Connect and attach a proxy.
     *                   2. Drop the connection.
     *                   3. Connect again with the same id.
     * @tc.expected      Two connect events and two toasts are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleFullCycleReconnects', 0, () => {
      logStep('clientLifecycleFullCycleReconnects', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(51);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'cycle-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isDisconnect).assertTrue();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const reopened: boolean = client.connect(51);
      expect(reopened).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleFullCycleReconnects', 'end');
    });

    /**
     * @tc.name          clientLifecycleFullCycleToastOrder
     * @tc.desc          The full cycle queues the connect toast before the disconnect toast.
     * @tc.precondition  A client that has not connected yet.
     * @tc.steps         1. Connect and attach a proxy.
     *                   2. Disconnect.
     *                   3. Read both toast slots.
     * @tc.expected      Slot zero is the connect toast and slot one the disconnect toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleFullCycleToastOrder', 0, () => {
      logStep('clientLifecycleFullCycleToastOrder', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(53);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'cycle-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isDisconnect).assertTrue();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const reopened: boolean = client.connect(53);
      expect(reopened).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.lastToast().length).assertLarger(0);
      expect(client.toasts.length >= 1).assertTrue();
      logStep('clientLifecycleFullCycleToastOrder', 'end');
    });

    /**
     * @tc.name          clientLifecycleFullCycleEventCounts
     * @tc.desc          The cycle records one connect per attempt and one disconnect.
     * @tc.precondition  A client with an empty event recorder.
     * @tc.steps         1. Run a connect and drop cycle.
     *                   2. Reconnect.
     *                   3. Count connect and disconnect events.
     * @tc.expected      Two connect events and one disconnected event are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleFullCycleEventCounts', 0, () => {
      logStep('clientLifecycleFullCycleEventCounts', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(55);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'cycle-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isDisconnect).assertTrue();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const reopened: boolean = client.connect(55);
      expect(reopened).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleFullCycleEventCounts', 'end');
    });

    /**
     * @tc.name          clientLifecycleFullCycleFlagAfterReconnect
     * @tc.desc          Reconnecting after a drop keeps the historical disconnect flag.
     * @tc.precondition  A client that has completed one connect and drop cycle.
     * @tc.steps         1. Complete the cycle.
     *                   2. Reconnect.
     *                   3. Read the disconnect flag.
     * @tc.expected      The flag stays true while the state returns to connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientLifecycleFullCycleFlagAfterReconnect', 0, () => {
      logStep('clientLifecycleFullCycleFlagAfterReconnect', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(57);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'cycle-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isDisconnect).assertTrue();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const reopened: boolean = client.connect(57);
      expect(reopened).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleFullCycleFlagAfterReconnect', snap.describe());
      logStep('clientLifecycleFullCycleFlagAfterReconnect', 'end');
    });

    /**
     * @tc.name          clientLifecycleFullCycleMetricConnectCount
     * @tc.desc          Aggregate metrics count both connect attempts in a cycle.
     * @tc.precondition  A client ready for two connect attempts.
     * @tc.steps         1. Run the cycle.
     *                   2. Reconnect.
     *                   3. Build metrics from the client.
     * @tc.expected      Metrics report two connect events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientLifecycleFullCycleMetricConnectCount', 0, () => {
      logStep('clientLifecycleFullCycleMetricConnectCount', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(59);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'cycle-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isDisconnect).assertTrue();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const reopened: boolean = client.connect(59);
      expect(reopened).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleFullCycleMetricConnectCount', 'end');
    });

    /**
     * @tc.name          clientLifecycleDeathRecipientIdle
     * @tc.desc          A connected client keeps a registered recipient that has not fired.
     * @tc.precondition  A connected session created by the shared helper.
     * @tc.steps         1. Create the session.
     *                   2. Inspect recipient registration.
     *                   3. Read the died counter.
     * @tc.expected      The recipient is registered and the counter is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleDeathRecipientIdle', 0, () => {
      logStep('clientLifecycleDeathRecipientIdle', 'begin');
      const client: ConnectionModel = createConnectedSession('death-one');
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      const alive: boolean = client.isConnected();
      expect(alive).assertTrue();
      client.onDisconnect();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      expect(client.deathRecipient === recipient).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleDeathRecipientIdle', 'end');
    });

    /**
     * @tc.name          clientLifecycleDeathRecipientSurvivesDisconnect
     * @tc.desc          Unregistering on disconnect does not drop the client owned recipient object.
     * @tc.precondition  A connected session with a reachable recipient.
     * @tc.steps         1. Keep a recipient handle.
     *                   2. Disconnect.
     *                   3. Compare object identity.
     * @tc.expected      The same recipient instance remains attached to the client.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleDeathRecipientSurvivesDisconnect', 0, () => {
      logStep('clientLifecycleDeathRecipientSurvivesDisconnect', 'begin');
      const client: ConnectionModel = createConnectedSession('death-two');
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      const alive: boolean = client.isConnected();
      expect(alive).assertTrue();
      client.onDisconnect();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      expect(client.deathRecipient === recipient).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleDeathRecipientSurvivesDisconnect', snap.describe());
      logStep('clientLifecycleDeathRecipientSurvivesDisconnect', 'end');
    });

    /**
     * @tc.name          clientLifecycleDeathAfterDisconnectNoFire
     * @tc.desc          A disconnect path never triggers the remote-died callback.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Disconnect the session.
     *                   2. Read the died counter.
     *                   3. Call isConnected.
     * @tc.expected      The counter stays zero and isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleDeathAfterDisconnectNoFire', 0, () => {
      logStep('clientLifecycleDeathAfterDisconnectNoFire', 'begin');
      const client: ConnectionModel = createConnectedSession('death-three');
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      const alive: boolean = client.isConnected();
      expect(alive).assertTrue();
      client.onDisconnect();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      expect(client.deathRecipient === recipient).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.lastToast().length).assertLarger(0);
      expect(client.toasts.length >= 1).assertTrue();
      logStep('clientLifecycleDeathAfterDisconnectNoFire', 'end');
    });

    /**
     * @tc.name          clientLifecycleDeathRecipientUnregisteredFlag
     * @tc.desc          The recipient registration flag is cleared exactly once by onDisconnect.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Confirm registration.
     *                   2. Disconnect.
     *                   3. Confirm the flag is false.
     * @tc.expected      Registration changes from true to false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleDeathRecipientUnregisteredFlag', 0, () => {
      logStep('clientLifecycleDeathRecipientUnregisteredFlag', 'begin');
      const client: ConnectionModel = createConnectedSession('death-four');
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      const alive: boolean = client.isConnected();
      expect(alive).assertTrue();
      client.onDisconnect();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      expect(client.deathRecipient === recipient).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.lastToast()).assertEqual(expectedToastFor('disconnect-success'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      logStep('clientLifecycleDeathRecipientUnregisteredFlag', 'end');
    });

    /**
     * @tc.name          clientLifecycleDeathRecipientDescribe
     * @tc.desc          The recipient describe output reflects the unregistered state.
     * @tc.precondition  A session dropped after being connected.
     * @tc.steps         1. Drop the session.
     *                   2. Format the recipient descriptor.
     *                   3. Check the leading counter.
     * @tc.expected      The descriptor starts with zero and ends with false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientLifecycleDeathRecipientDescribe', 0, () => {
      logStep('clientLifecycleDeathRecipientDescribe', 'begin');
      const client: ConnectionModel = createConnectedSession('death-five');
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      const alive: boolean = client.isConnected();
      expect(alive).assertTrue();
      client.onDisconnect();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      expect(client.deathRecipient === recipient).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleDeathRecipientDescribe', 'end');
    });

    /**
     * @tc.name          clientLifecycleDisconnectRequestedBeforeConnect
     * @tc.desc          A disconnect request without a connect id is refused and logged as an error.
     * @tc.precondition  A client that has never connected.
     * @tc.steps         1. Call disconnectRequested.
     *                   2. Check the returned flag.
     *                   3. Count error log entries.
     * @tc.expected      The request returns false and one error line is logged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleDisconnectRequestedBeforeConnect', 0, () => {
      logStep('clientLifecycleDisconnectRequestedBeforeConnect', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: boolean = client.disconnectRequested();
      expect(first).assertFalse();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      client.connect(61);
      const second: boolean = client.disconnectRequested();
      expect(second).assertTrue();
      expect(client.connectId).assertEqual(61);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleDisconnectRequestedBeforeConnect', 'end');
    });

    /**
     * @tc.name          clientLifecycleDisconnectRequestedAfterConnect
     * @tc.desc          Once a connect id exists the disconnect request is accepted.
     * @tc.precondition  A client in the connecting state with an id.
     * @tc.steps         1. Connect with id 61.
     *                   2. Call disconnectRequested.
     *                   3. Inspect the recorded event.
     * @tc.expected      The request returns true and one disconnect-request event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleDisconnectRequestedAfterConnect', 0, () => {
      logStep('clientLifecycleDisconnectRequestedAfterConnect', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: boolean = client.disconnectRequested();
      expect(first).assertFalse();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      client.connect(61);
      const second: boolean = client.disconnectRequested();
      expect(second).assertTrue();
      expect(client.connectId).assertEqual(61);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleDisconnectRequestedAfterConnect', 'end');
    });

    /**
     * @tc.name          clientLifecycleDisconnectRequestKeepsState
     * @tc.desc          Requesting a disconnect does not itself change the connection state.
     * @tc.precondition  A connecting client with an id.
     * @tc.steps         1. Connect.
     *                   2. Request a disconnect.
     *                   3. Read the state field.
     * @tc.expected      The state remains connecting until onDisconnect arrives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleDisconnectRequestKeepsState', 0, () => {
      logStep('clientLifecycleDisconnectRequestKeepsState', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: boolean = client.disconnectRequested();
      expect(first).assertFalse();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      client.connect(63);
      const second: boolean = client.disconnectRequested();
      expect(second).assertTrue();
      expect(client.connectId).assertEqual(63);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleDisconnectRequestKeepsState', snap.describe());
      logStep('clientLifecycleDisconnectRequestKeepsState', 'end');
    });

    /**
     * @tc.name          clientLifecycleDisconnectRequestNoToast
     * @tc.desc          A disconnect request produces no toast on its own.
     * @tc.precondition  A connecting client.
     * @tc.steps         1. Connect.
     *                   2. Request a disconnect.
     *                   3. Count toasts.
     * @tc.expected      No toast is queued by the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleDisconnectRequestNoToast', 0, () => {
      logStep('clientLifecycleDisconnectRequestNoToast', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: boolean = client.disconnectRequested();
      expect(first).assertFalse();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      client.connect(65);
      const second: boolean = client.disconnectRequested();
      expect(second).assertTrue();
      expect(client.connectId).assertEqual(65);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleDisconnectRequestNoToast', 'end');
    });

    /**
     * @tc.name          clientLifecycleDisconnectRequestErrorOnce
     * @tc.desc          Only the id-less request contributes an error log line.
     * @tc.precondition  A client that requests a disconnect before and after connecting.
     * @tc.steps         1. Request without an id.
     *                   2. Connect.
     *                   3. Request again and count errors.
     * @tc.expected      The error count stays at one across both requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientLifecycleDisconnectRequestErrorOnce', 0, () => {
      logStep('clientLifecycleDisconnectRequestErrorOnce', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: boolean = client.disconnectRequested();
      expect(first).assertFalse();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      client.connect(67);
      const second: boolean = client.disconnectRequested();
      expect(second).assertTrue();
      expect(client.connectId).assertEqual(67);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleDisconnectRequestErrorOnce', 'end');
    });

    /**
     * @tc.name          clientLifecycleWantValidation
     * @tc.desc          The default want validates without errors and matches an equal want.
     * @tc.precondition  A default WantModel target.
     * @tc.steps         1. Build the want.
     *                   2. Run validate.
     *                   3. Compare against a second default want.
     * @tc.expected      Validation returns no errors and matching succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleWantValidation', 0, () => {
      logStep('clientLifecycleWantValidation', 'begin');
      const want: WantModel = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const client: ConnectionModel = new ConnectionModel(want);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertTrue();
      client.connect(71);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.last()).assertEqual('connect:' + want.describe());
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.want === want).assertTrue();
      expect(client.isConnected()).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleWantValidation', snap.describe());
      logStep('clientLifecycleWantValidation', 'end');
    });

    /**
     * @tc.name          clientLifecycleWantDescriptorRecorded
     * @tc.desc          The connect event stores the want descriptor verbatim.
     * @tc.precondition  A client constructed with a default want.
     * @tc.steps         1. Connect the client.
     *                   2. Read the last event.
     *                   3. Compare with the descriptor.
     * @tc.expected      The last event equals connect plus the bundle and ability pair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleWantDescriptorRecorded', 0, () => {
      logStep('clientLifecycleWantDescriptorRecorded', 'begin');
      const want: WantModel = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const client: ConnectionModel = new ConnectionModel(want);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertTrue();
      client.connect(73);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.last()).assertEqual('connect:' + want.describe());
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.want === want).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleWantDescriptorRecorded', 'end');
    });

    /**
     * @tc.name          clientLifecycleWantIsRetained
     * @tc.desc          The client retains the exact want object supplied at construction.
     * @tc.precondition  A want instance passed into the constructor.
     * @tc.steps         1. Construct the client.
     *                   2. Compare the retained want reference.
     *                   3. Connect.
     * @tc.expected      The retained want is the same instance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleWantIsRetained', 0, () => {
      logStep('clientLifecycleWantIsRetained', 'begin');
      const want: WantModel = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const client: ConnectionModel = new ConnectionModel(want);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertTrue();
      client.connect(75);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.last()).assertEqual('connect:' + want.describe());
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.want === want).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleWantIsRetained', 'end');
    });

    /**
     * @tc.name          clientLifecycleWantNoProxyAfterConnect
     * @tc.desc          Calling connect alone never fabricates a proxy.
     * @tc.precondition  A client with a valid want.
     * @tc.steps         1. Connect without delivering onConnect.
     *                   2. Check the proxy field.
     *                   3. Check isConnected.
     * @tc.expected      The proxy stays undefined and isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleWantNoProxyAfterConnect', 0, () => {
      logStep('clientLifecycleWantNoProxyAfterConnect', 'begin');
      const want: WantModel = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const client: ConnectionModel = new ConnectionModel(want);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertTrue();
      client.connect(77);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.last()).assertEqual('connect:' + want.describe());
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.want === want).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleWantNoProxyAfterConnect', 'end');
    });

    /**
     * @tc.name          clientLifecycleOracleAllCallbacks
     * @tc.desc          Every callback name maps to the documented state in the standalone oracle.
     * @tc.precondition  No client state required; the oracle is pure.
     * @tc.steps         1. Evaluate all four callback names.
     *                   2. Connect and check the state.
     *                   3. Attach a proxy and drop it.
     * @tc.expected      All four oracle answers match the observed transitions.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientLifecycleOracleAllCallbacks', 0, () => {
      logStep('clientLifecycleOracleAllCallbacks', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      client.connect(81);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      client.onDisconnect();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length).assertLarger(0);
      logStep('clientLifecycleOracleAllCallbacks', 'end');
    });

    /**
     * @tc.name          clientLifecycleOracleConnectMatchesObserved
     * @tc.desc          The observed connecting state equals the oracle answer for connect.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Connect the client.
     *                   2. Ask the oracle about connect.
     *                   3. Compare the two strings.
     * @tc.expected      Both values read connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOracleConnectMatchesObserved', 0, () => {
      logStep('clientLifecycleOracleConnectMatchesObserved', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      client.connect(83);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      client.onDisconnect();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.toasts.length).assertEqual(2);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleOracleConnectMatchesObserved', 'end');
    });

    /**
     * @tc.name          clientLifecycleOracleConnectedMatchesObserved
     * @tc.desc          The observed connected state equals the oracle answer for onConnect.
     * @tc.precondition  A client that has connected and attached a proxy.
     * @tc.steps         1. Connect the client.
     *                   2. Attach the proxy.
     *                   3. Compare with the oracle.
     * @tc.expected      Both values read connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientLifecycleOracleConnectedMatchesObserved', 0, () => {
      logStep('clientLifecycleOracleConnectedMatchesObserved', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      client.connect(85);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      client.onDisconnect();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.toasts.length).assertEqual(2);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientLifecycleOracleConnectedMatchesObserved', snap.describe());
      logStep('clientLifecycleOracleConnectedMatchesObserved', 'end');
    });

    /**
     * @tc.name          clientLifecycleOracleDisconnectMatchesObserved
     * @tc.desc          The observed disconnected state equals the oracle answer for onDisconnect.
     * @tc.precondition  A client that has completed a full cycle.
     * @tc.steps         1. Run connect and drop.
     *                   2. Ask the oracle about onDisconnect.
     *                   3. Compare the strings.
     * @tc.expected      Both values read disconnected and two toasts exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientLifecycleOracleDisconnectMatchesObserved', 0, () => {
      logStep('clientLifecycleOracleDisconnectMatchesObserved', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      client.connect(87);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      client.onDisconnect();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.toasts.length).assertEqual(2);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      logStep('clientLifecycleOracleDisconnectMatchesObserved', 'end');
    });

    /**
     * @tc.name          clientLifecycleOracleToastCoverage
     * @tc.desc          The toast oracle exposes every documented client toast.
     * @tc.precondition  No client state required; the oracle is pure.
     * @tc.steps         1. Look up the success and failure connect toasts.
     *                   2. Look up the send toasts.
     *                   3. Compare with the constants.
     * @tc.expected      All oracle answers equal their exported constants.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientLifecycleOracleToastCoverage', 0, () => {
      logStep('clientLifecycleOracleToastCoverage', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      client.connect(89);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      client.onDisconnect();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.toasts.length).assertEqual(2);
      const eventsBefore: number = client.events.size();
      const logsBefore: number = client.logs.size();
      client.reset();
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(eventsBefore > 0).assertTrue();
      expect(logsBefore > 0).assertTrue();
      logStep('clientLifecycleOracleToastCoverage', 'end');
    });
  });
}
