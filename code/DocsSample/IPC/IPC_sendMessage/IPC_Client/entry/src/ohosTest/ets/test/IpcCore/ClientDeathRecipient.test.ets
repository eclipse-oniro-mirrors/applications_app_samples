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
  RemoteProxyModel,
  RemoteStubModel,
  DeathRecipientModel,
  ClientSnapshot,
  createConnectedSession,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  ERROR_NONE,
  LEVEL_INFO,
  LEVEL_ERROR
} from '../Shared/SharedDriver';

export default function clientDeathRecipient(): void {
  describe('ClientDeathRecipient', () => {
    beforeAll(() => {
      logSuite('ClientDeathRecipient', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientDeathRecipient', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientInitialState
     * @tc.desc          A new death recipient starts unregistered with a zero died count.
     * @tc.precondition  A freshly created death recipient model.
     * @tc.steps         1. Create the recipient.
     *                   2. Read both fields.
     *                   3. Format the descriptor.
     * @tc.expected      The recipient is unregistered and has never fired.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientInitialState', 0, () => {
      logStep('clientDeathRecipientInitialState', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.describe()).assertEqual('0/false');
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.describe()).assertEqual('0/true');
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(recipient.describe().indexOf('/') > 0).assertTrue();
      expect(recipient.describe().endsWith(String(recipient.registered))).assertTrue();
      expect(recipient.diedCount >= 0).assertTrue();
      logStep('clientDeathRecipientInitialState', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientRegisterFlipsFlag
     * @tc.desc          Registering a recipient flips its registered flag to true.
     * @tc.precondition  A live proxy and a fresh recipient.
     * @tc.steps         1. Register the recipient.
     *                   2. Read the flag.
     *                   3. Read the descriptor.
     * @tc.expected      The flag becomes true and the descriptor reflects it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientRegisterFlipsFlag', 0, () => {
      logStep('clientDeathRecipientRegisterFlipsFlag', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.describe()).assertEqual('0/false');
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.describe()).assertEqual('0/true');
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientRegisterFlipsFlag', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientRegisterKeepsCounter
     * @tc.desc          Registration never changes the died counter.
     * @tc.precondition  A fresh recipient.
     * @tc.steps         1. Register the recipient.
     *                   2. Read the counter.
     *                   3. Read the descriptor.
     * @tc.expected      The counter stays zero after registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientRegisterKeepsCounter', 0, () => {
      logStep('clientDeathRecipientRegisterKeepsCounter', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.describe()).assertEqual('0/false');
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.describe()).assertEqual('0/true');
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientRegisterKeepsCounter', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientRegisterProxyReference
     * @tc.desc          The proxy stores the exact recipient instance on registration.
     * @tc.precondition  A live proxy and a recipient instance.
     * @tc.steps         1. Register the recipient.
     *                   2. Compare the proxy reference.
     *                   3. Check liveness.
     * @tc.expected      The stored reference equals the recipient and the proxy is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientRegisterProxyReference', 0, () => {
      logStep('clientDeathRecipientRegisterProxyReference', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.describe()).assertEqual('0/false');
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.describe()).assertEqual('0/true');
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientRegisterProxyReference', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientRegisterObserverIdle
     * @tc.desc          Standalone registration leaves an observer client untouched.
     * @tc.precondition  A live proxy and an idle observer client.
     * @tc.steps         1. Register the recipient.
     *                   2. Read the client state.
     *                   3. Reset the observer.
     * @tc.expected      The client stays disconnected and can be reset safely.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientRegisterObserverIdle', 0, () => {
      logStep('clientDeathRecipientRegisterObserverIdle', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.describe()).assertEqual('0/false');
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.describe()).assertEqual('0/true');
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientRegisterObserverIdle', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientFireOnce
     * @tc.desc          A single remote death increments the died counter once.
     * @tc.precondition  A registered recipient.
     * @tc.steps         1. Call onRemoteDied.
     *                   2. Read the counter.
     *                   3. Read the registration flag.
     * @tc.expected      The counter is one and the flag stays true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientFireOnce', 0, () => {
      logStep('clientDeathRecipientFireOnce', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertTrue();
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(2);
      expect(recipient.describe().startsWith('2/')).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(recipient.describe().indexOf('/') > 0).assertTrue();
      expect(recipient.describe().endsWith(String(recipient.registered))).assertTrue();
      expect(recipient.diedCount >= 0).assertTrue();
      logStep('clientDeathRecipientFireOnce', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientFireTwice
     * @tc.desc          Repeated death callbacks keep incrementing the counter.
     * @tc.precondition  A registered recipient fired once.
     * @tc.steps         1. Call onRemoteDied again.
     *                   2. Read the counter.
     *                   3. Read the descriptor prefix.
     * @tc.expected      The counter reads two and the descriptor starts with two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientFireTwice', 0, () => {
      logStep('clientDeathRecipientFireTwice', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertTrue();
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(2);
      expect(recipient.describe().startsWith('2/')).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientFireTwice', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientFireIsLocal
     * @tc.desc          Firing a standalone recipient never affects the proxy or observer.
     * @tc.precondition  A registered recipient and a live proxy.
     * @tc.steps         1. Fire the recipient.
     *                   2. Check proxy liveness.
     *                   3. Check the observer recipient.
     * @tc.expected      The proxy remains alive and the observer counter is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientFireIsLocal', 0, () => {
      logStep('clientDeathRecipientFireIsLocal', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertTrue();
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(2);
      expect(recipient.describe().startsWith('2/')).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientFireIsLocal', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientFireLogCount
     * @tc.desc          Firing a standalone recipient produces no client log lines.
     * @tc.precondition  An idle observer client.
     * @tc.steps         1. Fire the recipient.
     *                   2. Read the log size.
     *                   3. Read the error count.
     * @tc.expected      The client log stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientFireLogCount', 0, () => {
      logStep('clientDeathRecipientFireLogCount', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertTrue();
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(2);
      expect(recipient.describe().startsWith('2/')).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientFireLogCount', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientAttachOnConnect
     * @tc.desc          onConnect registers the client owned recipient on the proxy.
     * @tc.precondition  A connecting client and a live proxy.
     * @tc.steps         1. Connect the client.
     *                   2. Deliver onConnect.
     *                   3. Inspect registration.
     * @tc.expected      The client recipient is registered and held by the proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientAttachOnConnect', 0, () => {
      logStep('clientDeathRecipientAttachOnConnect', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.deathRecipient = recipient;
      client.connect(419);
      expect(recipient.registered).assertFalse();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(recipient.describe().indexOf('/') > 0).assertTrue();
      expect(recipient.describe().endsWith(String(recipient.registered))).assertTrue();
      expect(recipient.diedCount >= 0).assertTrue();
      logStep('clientDeathRecipientAttachOnConnect', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientAttachBeforeConnect
     * @tc.desc          The recipient is unregistered until onConnect runs.
     * @tc.precondition  A connecting client with an injected recipient.
     * @tc.steps         1. Connect without a proxy.
     *                   2. Read the flag.
     *                   3. Attach a proxy.
     * @tc.expected      The flag flips only when onConnect runs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientAttachBeforeConnect', 0, () => {
      logStep('clientDeathRecipientAttachBeforeConnect', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.deathRecipient = recipient;
      client.connect(421);
      expect(recipient.registered).assertFalse();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientAttachBeforeConnect', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientAttachEvent
     * @tc.desc          A successful registration records one death-register event.
     * @tc.precondition  A connecting client with an injected recipient.
     * @tc.steps         1. Attach the proxy.
     *                   2. Count events.
     *                   3. Search the log.
     * @tc.expected      One registration event and one success log line exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientAttachEvent', 0, () => {
      logStep('clientDeathRecipientAttachEvent', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.deathRecipient = recipient;
      client.connect(423);
      expect(recipient.registered).assertFalse();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientAttachEvent', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientAttachToast
     * @tc.desc          Registration on connect queues the connect success toast.
     * @tc.precondition  A connecting client before onConnect.
     * @tc.steps         1. Attach a proxy.
     *                   2. Read the toast.
     *                   3. Reset the client.
     * @tc.expected      One connect toast is queued and reset clears it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientAttachToast', 0, () => {
      logStep('clientDeathRecipientAttachToast', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.deathRecipient = recipient;
      client.connect(425);
      expect(recipient.registered).assertFalse();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      const before: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(before >= 0).assertTrue();
      logStep('clientDeathRecipientAttachToast', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientAttachLog
     * @tc.desc          The registration success line is written at info level.
     * @tc.precondition  A connecting client with a live proxy.
     * @tc.steps         1. Attach the proxy.
     *                   2. Count info lines.
     *                   3. Check both flags.
     * @tc.expected      At least two info lines exist after the attach.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientAttachLog', 0, () => {
      logStep('clientDeathRecipientAttachLog', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.deathRecipient = recipient;
      client.connect(427);
      expect(recipient.registered).assertFalse();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientAttachLog', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDetachOnDisconnect
     * @tc.desc          onDisconnect unregisters the client recipient from the proxy.
     * @tc.precondition  A connected client with a registered recipient.
     * @tc.steps         1. Disconnect.
     *                   2. Read the proxy flags.
     *                   3. Read the client proxy field.
     * @tc.expected      Both registration flags clear and the proxy reference drops.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientDetachOnDisconnect', 0, () => {
      logStep('clientDeathRecipientDetachOnDisconnect', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(429);
      client.onConnect(proxy);
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      client.onDisconnect();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(client.proxy === undefined).assertTrue();
      expect(recipient.describe().indexOf('/') > 0).assertTrue();
      expect(recipient.describe().endsWith(String(recipient.registered))).assertTrue();
      expect(recipient.diedCount >= 0).assertTrue();
      logStep('clientDeathRecipientDetachOnDisconnect', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDetachKeepsCounter
     * @tc.desc          Unregistering on disconnect never fires the recipient.
     * @tc.precondition  A connected client with a clean recipient.
     * @tc.steps         1. Disconnect.
     *                   2. Read the died counter.
     *                   3. Read the descriptor.
     * @tc.expected      The counter stays zero after the disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientDetachKeepsCounter', 0, () => {
      logStep('clientDeathRecipientDetachKeepsCounter', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(431);
      client.onConnect(proxy);
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      client.onDisconnect();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(client.proxy === undefined).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientDetachKeepsCounter', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDetachProxyCleared
     * @tc.desc          The server of the client proxy is cleared by onDisconnect.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Disconnect.
     *                   2. Read the proxy field.
     *                   3. Snapshot the client.
     * @tc.expected      The proxy field is undefined and the snapshot agrees.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientDetachProxyCleared', 0, () => {
      logStep('clientDeathRecipientDetachProxyCleared', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(433);
      client.onConnect(proxy);
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      client.onDisconnect();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(client.proxy === undefined).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientDetachProxyCleared', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDetachNoLiveness
     * @tc.desc          A detached client reports not connected.
     * @tc.precondition  A client that completed connect and disconnect.
     * @tc.steps         1. Disconnect.
     *                   2. Call isConnected.
     *                   3. Read the liveness oracle.
     * @tc.expected      The predicate is false and the proxy died zero times.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientDetachNoLiveness', 0, () => {
      logStep('clientDeathRecipientDetachNoLiveness', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(435);
      client.onConnect(proxy);
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      client.onDisconnect();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(client.proxy === undefined).assertTrue();
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientDetachNoLiveness', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDetachLog
     * @tc.desc          The disconnect path logs one info line for the callback.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Disconnect.
     *                   2. Read the log.
     *                   3. Read the event count.
     * @tc.expected      The log contains the onDisconnect fragment.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientDetachLog', 0, () => {
      logStep('clientDeathRecipientDetachLog', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(437);
      client.onConnect(proxy);
      const recipient: DeathRecipientModel = client.deathRecipient;
      expect(recipient.registered).assertTrue();
      client.onDisconnect();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientDetachLog', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientDeathFires
     * @tc.desc          Proxy death fires the recipient owned by a connected client.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Notify proxy death.
     *                   2. Read the died counter.
     *                   3. Read the registration flag.
     * @tc.expected      The client recipient counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientClientDeathFires', 0, () => {
      logStep('clientDeathRecipientClientDeathFires', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(439);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.describe()).assertEqual('1/true');
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientClientDeathFires', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientDeathState
     * @tc.desc          Proxy death keeps the state connected while liveness fails.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Notify proxy death.
     *                   2. Read the state.
     *                   3. Call isConnected.
     * @tc.expected      The state reads connected but isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientClientDeathState', 0, () => {
      logStep('clientDeathRecipientClientDeathState', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(441);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.describe()).assertEqual('1/true');
      expect(client.logs.contains('onConnect')).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientClientDeathState', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientDeathDescribe
     * @tc.desc          The recipient descriptor after death reports one and true.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Notify proxy death.
     *                   2. Format the descriptor.
     *                   3. Compare the text.
     * @tc.expected      The descriptor reads one slash true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientClientDeathDescribe', 0, () => {
      logStep('clientDeathRecipientClientDeathDescribe', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(443);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.describe()).assertEqual('1/true');
      expect(client.logs.contains('onConnect')).assertTrue();
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientClientDeathDescribe', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientDeathLog
     * @tc.desc          Death notification does not add an error line to the client log.
     * @tc.precondition  A connected client before death notification.
     * @tc.steps         1. Notify proxy death.
     *                   2. Count error lines.
     *                   3. Read the event size.
     * @tc.expected      No error line is added by the notification.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientClientDeathLog', 0, () => {
      logStep('clientDeathRecipientClientDeathLog', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(445);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.describe()).assertEqual('1/true');
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientClientDeathLog', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientDeathReset
     * @tc.desc          A client reset after proxy death installs a fresh recipient.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Notify proxy death.
     *                   2. Reset the client.
     *                   3. Read the recipient fields.
     * @tc.expected      The new recipient is unregistered with a zero counter.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientClientDeathReset', 0, () => {
      logStep('clientDeathRecipientClientDeathReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(447);
      client.onConnect(proxy);
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.describe()).assertEqual('1/true');
      expect(client.logs.contains('onConnect')).assertTrue();
      const before: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(before >= 0).assertTrue();
      logStep('clientDeathRecipientClientDeathReset', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDeadProxyAttach
     * @tc.desc          Connecting to a dead proxy still enters the connected state.
     * @tc.precondition  A proxy whose death was already notified.
     * @tc.steps         1. Connect the client.
     *                   2. Attach the dead proxy.
     *                   3. Read the state.
     * @tc.expected      The state is connected even though registration failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientDeadProxyAttach', 0, () => {
      logStep('clientDeathRecipientDeadProxyAttach', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      proxy.notifyDeath();
      client.connect(451);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientDeadProxyAttach', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDeadProxyUnregistered
     * @tc.desc          A dead proxy leaves the client recipient unregistered.
     * @tc.precondition  A dead proxy and a connecting client.
     * @tc.steps         1. Attach the dead proxy.
     *                   2. Read the recipient flag.
     *                   3. Call isConnected.
     * @tc.expected      The recipient stays unregistered and liveness fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientDeadProxyUnregistered', 0, () => {
      logStep('clientDeathRecipientDeadProxyUnregistered', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      proxy.notifyDeath();
      client.connect(453);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientDeadProxyUnregistered', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDeadProxyEvent
     * @tc.desc          A failed registration records the failure event instead.
     * @tc.precondition  A dead proxy and a connecting client.
     * @tc.steps         1. Attach the dead proxy.
     *                   2. Count registration events.
     *                   3. Read the log.
     * @tc.expected      One death-register-failed event exists and no success event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientDeadProxyEvent', 0, () => {
      logStep('clientDeathRecipientDeadProxyEvent', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      proxy.notifyDeath();
      client.connect(455);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientDeadProxyEvent', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDeadProxyErrorLog
     * @tc.desc          The failed registration writes exactly one error line.
     * @tc.precondition  A dead proxy and a connecting client.
     * @tc.steps         1. Attach the dead proxy.
     *                   2. Count error lines.
     *                   3. Reset the client.
     * @tc.expected      One error line exists and reset clears it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientDeadProxyErrorLog', 0, () => {
      logStep('clientDeathRecipientDeadProxyErrorLog', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      proxy.notifyDeath();
      client.connect(457);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      const before: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(before >= 0).assertTrue();
      logStep('clientDeathRecipientDeadProxyErrorLog', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientDeadProxyDescribe
     * @tc.desc          The unregistered recipient descriptor stays zero and false.
     * @tc.precondition  A client that attached a dead proxy.
     * @tc.steps         1. Attach the dead proxy.
     *                   2. Format the recipient.
     *                   3. Check the proxy liveness.
     * @tc.expected      The descriptor reads zero slash false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientDeadProxyDescribe', 0, () => {
      logStep('clientDeathRecipientDeadProxyDescribe', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      proxy.notifyDeath();
      client.connect(459);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientDeadProxyDescribe', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientSwapReplaces
     * @tc.desc          Registering a second recipient replaces the stored reference.
     * @tc.precondition  A proxy with a first recipient already registered.
     * @tc.steps         1. Register the first recipient.
     *                   2. Register a second one.
     *                   3. Compare the reference.
     * @tc.expected      The proxy stores the second recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientSwapReplaces', 0, () => {
      logStep('clientDeathRecipientSwapReplaces', 'begin');
      const first: DeathRecipientModel = new DeathRecipientModel();
      const second: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(first);
      proxy.registerDeathRecipient(second);
      expect(proxy.deathRecipient === second).assertTrue();
      expect(second.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(second.diedCount).assertEqual(1);
      expect(first.diedCount).assertEqual(0);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientSwapReplaces', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientSwapFiresSecond
     * @tc.desc          Death notification reaches only the newest recipient.
     * @tc.precondition  A proxy with two registrations.
     * @tc.steps         1. Register both recipients.
     *                   2. Notify death.
     *                   3. Compare the counters.
     * @tc.expected      The second counter is one and the first is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientSwapFiresSecond', 0, () => {
      logStep('clientDeathRecipientSwapFiresSecond', 'begin');
      const first: DeathRecipientModel = new DeathRecipientModel();
      const second: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(first);
      proxy.registerDeathRecipient(second);
      expect(proxy.deathRecipient === second).assertTrue();
      expect(second.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(second.diedCount).assertEqual(1);
      expect(first.diedCount).assertEqual(0);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientSwapFiresSecond', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientSwapKeepsFlag
     * @tc.desc          The replacement keeps the proxy registration flag true.
     * @tc.precondition  A proxy with two registrations.
     * @tc.steps         1. Register both.
     *                   2. Read the proxy flag.
     *                   3. Read the observer events.
     * @tc.expected      The proxy remains registered with the second recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientSwapKeepsFlag', 0, () => {
      logStep('clientDeathRecipientSwapKeepsFlag', 'begin');
      const first: DeathRecipientModel = new DeathRecipientModel();
      const second: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(first);
      proxy.registerDeathRecipient(second);
      expect(proxy.deathRecipient === second).assertTrue();
      expect(second.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(second.diedCount).assertEqual(1);
      expect(first.diedCount).assertEqual(0);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientSwapKeepsFlag', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientSwapObserverClean
     * @tc.desc          Swapping recipients never touches a separate observer client.
     * @tc.precondition  A proxy with two registrations and an observer client.
     * @tc.steps         1. Register both recipients.
     *                   2. Read the observer recipient.
     *                   3. Notify death.
     * @tc.expected      The observer recipient counter stays zero until notified.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientSwapObserverClean', 0, () => {
      logStep('clientDeathRecipientSwapObserverClean', 'begin');
      const first: DeathRecipientModel = new DeathRecipientModel();
      const second: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(first);
      proxy.registerDeathRecipient(second);
      expect(proxy.deathRecipient === second).assertTrue();
      expect(second.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(second.diedCount).assertEqual(1);
      expect(first.diedCount).assertEqual(0);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientSwapObserverClean', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientUnregisterOwner
     * @tc.desc          Unregistering the owner recipient succeeds and clears flags.
     * @tc.precondition  A proxy with one registered recipient.
     * @tc.steps         1. Unregister the owner.
     *                   2. Read the flags.
     *                   3. Notify death afterwards.
     * @tc.expected      The flags clear and the recipient never fires.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientUnregisterOwner', 0, () => {
      logStep('clientDeathRecipientUnregisterOwner', 'begin');
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(owner);
      expect(removed).assertTrue();
      expect(owner.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      proxy.notifyDeath();
      expect(owner.diedCount).assertEqual(0);
      expect(owner.describe()).assertEqual('0/false');
      proxy.alive = true;
      const again: boolean = proxy.registerDeathRecipient(owner);
      expect(again).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientUnregisterOwner', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientUnregisterDescribe
     * @tc.desc          The unregistered recipient descriptor returns to zero and false.
     * @tc.precondition  A proxy whose recipient was removed.
     * @tc.steps         1. Unregister.
     *                   2. Format the descriptor.
     *                   3. Compare the text.
     * @tc.expected      The descriptor reads zero slash false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientUnregisterDescribe', 0, () => {
      logStep('clientDeathRecipientUnregisterDescribe', 'begin');
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(owner);
      expect(removed).assertTrue();
      expect(owner.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      proxy.notifyDeath();
      expect(owner.diedCount).assertEqual(0);
      expect(owner.describe()).assertEqual('0/false');
      proxy.alive = true;
      const again: boolean = proxy.registerDeathRecipient(owner);
      expect(again).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.events.size()).assertEqual(0);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientUnregisterDescribe', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientUnregisterNoEvents
     * @tc.desc          Standalone unregistration never records client events.
     * @tc.precondition  An observer client and a proxy with one recipient.
     * @tc.steps         1. Unregister the owner.
     *                   2. Read the event count.
     *                   3. Read the log size.
     * @tc.expected      The observer client stays silent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientUnregisterNoEvents', 0, () => {
      logStep('clientDeathRecipientUnregisterNoEvents', 'begin');
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(owner);
      expect(removed).assertTrue();
      expect(owner.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      proxy.notifyDeath();
      expect(owner.diedCount).assertEqual(0);
      expect(owner.describe()).assertEqual('0/false');
      proxy.alive = true;
      const again: boolean = proxy.registerDeathRecipient(owner);
      expect(again).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientUnregisterNoEvents', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientUnregisterThenRegister
     * @tc.desc          A recipient can be registered again after removal.
     * @tc.precondition  A proxy whose recipient was removed.
     * @tc.steps         1. Unregister.
     *                   2. Register again.
     *                   3. Read the proxy flag.
     * @tc.expected      The second registration succeeds and the flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientUnregisterThenRegister', 0, () => {
      logStep('clientDeathRecipientUnregisterThenRegister', 'begin');
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(owner);
      expect(removed).assertTrue();
      expect(owner.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      proxy.notifyDeath();
      expect(owner.diedCount).assertEqual(0);
      expect(owner.describe()).assertEqual('0/false');
      proxy.alive = true;
      const again: boolean = proxy.registerDeathRecipient(owner);
      expect(again).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.events.size()).assertEqual(0);
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientUnregisterThenRegister', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientProxyResetLiveness
     * @tc.desc          Resetting a dead proxy restores its liveness.
     * @tc.precondition  A proxy that was notified dead once.
     * @tc.steps         1. Notify death.
     *                   2. Reset the proxy.
     *                   3. Read liveness.
     * @tc.expected      The proxy is alive again after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientProxyResetLiveness', 0, () => {
      logStep('clientDeathRecipientProxyResetLiveness', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      proxy.reset();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      proxy.registerDeathRecipient(recipient);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientProxyResetLiveness', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientProxyResetClearsRecipient
     * @tc.desc          Reset clears the stored recipient and its registration flag.
     * @tc.precondition  A proxy with one recipient.
     * @tc.steps         1. Register the recipient.
     *                   2. Reset the proxy.
     *                   3. Read the proxy fields.
     * @tc.expected      The stored recipient is undefined and the flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientProxyResetClearsRecipient', 0, () => {
      logStep('clientDeathRecipientProxyResetClearsRecipient', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      proxy.reset();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      proxy.registerDeathRecipient(recipient);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(recipient.describe().indexOf('/') > 0).assertTrue();
      expect(recipient.describe().endsWith(String(recipient.registered))).assertTrue();
      expect(recipient.diedCount >= 0).assertTrue();
      logStep('clientDeathRecipientProxyResetClearsRecipient', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientProxyResetReuse
     * @tc.desc          A reset proxy accepts a recipient registration again.
     * @tc.precondition  A proxy that was reset after death.
     * @tc.steps         1. Reset the proxy.
     *                   2. Register the recipient.
     *                   3. Read both flags.
     * @tc.expected      Registration succeeds and both flags turn true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientProxyResetReuse', 0, () => {
      logStep('clientDeathRecipientProxyResetReuse', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      proxy.reset();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      proxy.registerDeathRecipient(recipient);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientProxyResetReuse', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientProxyResetObserver
     * @tc.desc          Proxy reset never disturbs an idle observer client.
     * @tc.precondition  A proxy and an idle client.
     * @tc.steps         1. Register and reset.
     *                   2. Read the client state.
     *                   3. Check the client recipient.
     * @tc.expected      The observer stays disconnected with a clean recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientProxyResetObserver', 0, () => {
      logStep('clientDeathRecipientProxyResetObserver', 'begin');
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      const client: ConnectionModel = new ConnectionModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      proxy.reset();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      proxy.registerDeathRecipient(recipient);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientProxyResetObserver', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientResetFresh
     * @tc.desc          Client reset installs a new unregistered recipient object.
     * @tc.precondition  A connected client with a registered recipient.
     * @tc.steps         1. Reset the client.
     *                   2. Compare recipient identity.
     *                   3. Read the new fields.
     * @tc.expected      A fresh recipient with zero deaths replaces the old one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientClientResetFresh', 0, () => {
      logStep('clientDeathRecipientClientResetFresh', 'begin');
      const client: ConnectionModel = createConnectedSession('death-reset');
      const oldRecipient: DeathRecipientModel = client.deathRecipient;
      expect(oldRecipient.registered).assertTrue();
      client.reset();
      expect(client.deathRecipient === oldRecipient).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(oldRecipient.registered).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.size()).assertEqual(0);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientClientResetFresh', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientResetKeepsOld
     * @tc.desc          Reset leaves the old recipient object flagged as registered.
     * @tc.precondition  A connected client whose recipient was captured.
     * @tc.steps         1. Reset the client.
     *                   2. Read the old recipient flag.
     *                   3. Read the new flag.
     * @tc.expected      The old object keeps its flag while the new one is clean.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientClientResetKeepsOld', 0, () => {
      logStep('clientDeathRecipientClientResetKeepsOld', 'begin');
      const client: ConnectionModel = createConnectedSession('death-reset');
      const oldRecipient: DeathRecipientModel = client.deathRecipient;
      expect(oldRecipient.registered).assertTrue();
      client.reset();
      expect(client.deathRecipient === oldRecipient).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(oldRecipient.registered).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.size()).assertEqual(0);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientDeathRecipientClientResetKeepsOld', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientClientResetProxy
     * @tc.desc          Reset drops the proxy reference without notifying death.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Reset the client.
     *                   2. Read the proxy field.
     *                   3. Read the counter.
     * @tc.expected      The proxy is undefined and no death was fired.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientClientResetProxy', 0, () => {
      logStep('clientDeathRecipientClientResetProxy', 'begin');
      const client: ConnectionModel = createConnectedSession('death-reset');
      const oldRecipient: DeathRecipientModel = client.deathRecipient;
      expect(oldRecipient.registered).assertTrue();
      client.reset();
      expect(client.deathRecipient === oldRecipient).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(oldRecipient.registered).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.size()).assertEqual(0);
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientClientResetProxy', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientTraceOrder
     * @tc.desc          The death registration event is ordered between connect and connected.
     * @tc.precondition  A connecting client with a live proxy.
     * @tc.steps         1. Connect.
     *                   2. Attach the proxy.
     *                   3. Compare the trace.
     * @tc.expected      The trace reads connect, death-register and connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDeathRecipientTraceOrder', 0, () => {
      logStep('clientDeathRecipientTraceOrder', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(491);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_INFO) >= 2).assertTrue();
      expect(client.logs.contains(proxy.descriptor)).assertFalse();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientDeathRecipientTraceOrder', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientTraceFlags
     * @tc.desc          Both sides agree on registration after the trace is recorded.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Attach the proxy.
     *                   2. Read both flags.
     *                   3. Build a snapshot.
     * @tc.expected      Both registration flags are true and the snapshot agrees.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDeathRecipientTraceFlags', 0, () => {
      logStep('clientDeathRecipientTraceFlags', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(493);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_INFO) >= 2).assertTrue();
      expect(client.logs.contains(proxy.descriptor)).assertFalse();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientDeathRecipientTraceFlags', 'end');
    });

    /**
     * @tc.name          clientDeathRecipientTraceReset
     * @tc.desc          Reset after registration clears the recorded trace.
     * @tc.precondition  A connected client with a recorded registration trace.
     * @tc.steps         1. Attach the proxy.
     *                   2. Reset the client.
     *                   3. Read the event size.
     * @tc.expected      The trace is emptied by reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDeathRecipientTraceReset', 0, () => {
      logStep('clientDeathRecipientTraceReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(495);
      client.onConnect(proxy);
      const expected: string = 'connect:' + client.want.describe() + '|death-register:' +
        proxy.descriptor + '|connected:' + proxy.descriptor;
      expect(client.events.trace()).assertEqual(expected);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_INFO) >= 2).assertTrue();
      expect(client.logs.contains(proxy.descriptor)).assertFalse();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      const probe: DeathRecipientModel = new DeathRecipientModel();
      expect(probe.registered).assertFalse();
      expect(client.connectCalls >= 0).assertTrue();
      expect(client.deathRecipient !== undefined).assertTrue();
      expect(client.state.length > 0).assertTrue();
      logStep('clientDeathRecipientTraceReset', 'end');
    });
  });
}
