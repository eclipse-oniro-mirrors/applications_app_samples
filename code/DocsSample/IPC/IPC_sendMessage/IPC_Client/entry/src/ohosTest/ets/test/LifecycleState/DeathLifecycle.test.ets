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
  STUB_DESCRIPTOR,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_SEND,
  SEND_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  DeathRecipientModel,
  ClientSnapshot,
  ClientMetrics,
  createConnectedSession
} from '../Shared/SharedDriver';

export default function deathLifecycle(): void {
  describe('DeathLifecycle', () => {
    beforeAll(() => {
      logSuite('DeathLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('DeathLifecycle', 'end');
    });

    /**
     * @tc.name          deathLifecycleRecipientRegistersOnConnect
     * @tc.desc          onConnect marks the client recipient registered.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. A connecting client exists.
     *                   2. Deliver onConnect and inspect the recipient flag.
     *                   3. The recipient is registered.
     * @tc.expected      The recipient is registered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleRecipientRegistersOnConnect', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(10);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleProxyRegistersOnConnect
     * @tc.desc          onConnect marks the proxy side registration.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. A connecting client exists.
     *                   2. Deliver onConnect and inspect the proxy flag.
     *                   3. The proxy reports a registered recipient.
     * @tc.expected      The proxy reports a registered recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleProxyRegistersOnConnect', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(11);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleRecipientIdentityIsPreserved
     * @tc.desc          onConnect stores the client recipient object.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. A connecting client exists.
     *                   2. Compare the proxy recipient with the client one.
     *                   3. Both references are identical.
     * @tc.expected      Both references are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleRecipientIdentityIsPreserved', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(12);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleRegistrationStartsWithZeroDeaths
     * @tc.desc          A fresh registration has no death callbacks.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Read the recipient death counter.
     *                   3. The counter equals zero.
     * @tc.expected      The counter equals zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleRegistrationStartsWithZeroDeaths', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(13);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleRegistrationRecordsEvent
     * @tc.desc          The successful registration writes one event.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. A connecting client exists.
     *                   2. Deliver onConnect and count death-register events.
     *                   3. Exactly one event exists.
     * @tc.expected      Exactly one event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleRegistrationRecordsEvent', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(14);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleRegistrationLogsInfo
     * @tc.desc          The successful registration logs an INFO line.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. A connecting client exists.
     *                   2. Deliver onConnect and search the buffer.
     *                   3. The buffer contains registerDeathRecipient success.
     * @tc.expected      The buffer contains registerDeathRecipient success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleRegistrationLogsInfo', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(15);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleDeadProxyFailsRegistration
     * @tc.desc          A dead proxy refuses the death recipient.
     * @tc.precondition  A proxy is marked dead before delivery.
     * @tc.steps         1. A proxy is marked dead before delivery.
     *                   2. Deliver onConnect with that proxy.
     *                   3. The recipient stays unregistered.
     * @tc.expected      The recipient stays unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleDeadProxyFailsRegistration', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      proxy.alive = false;
      const client = new ConnectionModel();
      client.connect(16);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleDeadProxyRecordsFailureEvent
     * @tc.desc          The refused registration records a failure event.
     * @tc.precondition  A dead proxy is delivered to onConnect.
     * @tc.steps         1. A dead proxy is delivered to onConnect.
     *                   2. Count death-register-failed events.
     *                   3. Exactly one failure event exists.
     * @tc.expected      Exactly one failure event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleDeadProxyRecordsFailureEvent', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      proxy.alive = false;
      const client = new ConnectionModel();
      client.connect(17);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleDeadProxyLogsError
     * @tc.desc          The refused registration logs an error line.
     * @tc.precondition  A dead proxy is delivered to onConnect.
     * @tc.steps         1. A dead proxy is delivered to onConnect.
     *                   2. Count ERROR lines in the buffer.
     *                   3. At least one ERROR line exists.
     * @tc.expected      At least one ERROR line exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleDeadProxyLogsError', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      proxy.alive = false;
      const client = new ConnectionModel();
      client.connect(18);
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleRegisterTwiceIdempotent
     * @tc.desc          Registering the same recipient twice is safe.
     * @tc.precondition  A proxy with a registered recipient exists.
     * @tc.steps         1. A proxy with a registered recipient exists.
     *                   2. Register the same recipient again.
     *                   3. The flags stay true and no death occurs.
     * @tc.expected      The flags stay true and no death occurs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleRegisterTwiceIdempotent', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      const again = proxy.registerDeathRecipient(session.deathRecipient);
      expect(again).assertTrue();
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === session.deathRecipient).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.events.countOf('death-register')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(session.logs.contains('registerDeathRecipient success')).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleRegisterSecondRecipientReplaces
     * @tc.desc          A new recipient replaces the stored one.
     * @tc.precondition  A proxy with a registered recipient exists.
     * @tc.steps         1. A proxy with a registered recipient exists.
     *                   2. Register a different recipient.
     *                   3. The proxy stores the new recipient.
     * @tc.expected      The proxy stores the new recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleRegisterSecondRecipientReplaces', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      const other = new DeathRecipientModel();
      const replaced = proxy.registerDeathRecipient(other);
      expect(replaced).assertTrue();
      expect(proxy.deathRecipient === other).assertTrue();
      expect(other.registered).assertTrue();
      expect(proxy.deathRecipient === session.deathRecipient).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(other.diedCount).assertEqual(1);
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(proxy.alive).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleStandaloneRecipientCountsDeaths
     * @tc.desc          The recipient model counts callbacks.
     * @tc.precondition  A fresh DeathRecipientModel exists.
     * @tc.steps         1. A fresh DeathRecipientModel exists.
     *                   2. Call onRemoteDied twice.
     *                   3. The death counter equals two.
     * @tc.expected      The death counter equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleStandaloneRecipientCountsDeaths', 0, () => {
      const recipient = new DeathRecipientModel();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      recipient.onRemoteDied();
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(2);
      expect(recipient.registered).assertFalse();
      recipient.registered = true;
      expect(recipient.registered).assertTrue();
      expect(recipient.describe()).assertEqual('2/true');
      expect(recipient.diedCount > 1).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleStandaloneRecipientDescribe
     * @tc.desc          The recipient describe exposes both fields.
     * @tc.precondition  A fresh recipient exists.
     * @tc.steps         1. A fresh recipient exists.
     *                   2. Call describe before and after a death.
     *                   3. The text changes from zero to one.
     * @tc.expected      The text changes from zero to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleStandaloneRecipientDescribe', 0, () => {
      const recipient = new DeathRecipientModel();
      const before = recipient.describe();
      recipient.onRemoteDied();
      const after = recipient.describe();
      expect(before).assertEqual('0/false');
      expect(after).assertEqual('1/false');
      expect(before === after).assertFalse();
      expect(recipient.diedCount).assertEqual(1);
      expect(after.indexOf('1/') === 0).assertTrue();
      expect(before.indexOf('0/') === 0).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(after.length).assertEqual(7);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathCallsRecipient
     * @tc.desc          The death notification reaches the recipient.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath on the proxy.
     *                   3. The recipient death counter equals one.
     * @tc.expected      The recipient death counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleNotifyDeathCallsRecipient', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(113);
      session.onConnect(proxy);
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathMarksProxyDead
     * @tc.desc          The proxy becomes not alive after death.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath and read the proxy liveness.
     *                   3. The proxy reports not alive.
     * @tc.expected      The proxy reports not alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleNotifyDeathMarksProxyDead', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(114);
      session.onConnect(proxy);
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathBreaksIsConnected
     * @tc.desc          A dead proxy makes isConnected false.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath then isConnected.
     *                   3. The result is false.
     * @tc.expected      The result is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleNotifyDeathBreaksIsConnected', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(115);
      session.onConnect(proxy);
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathKeepsProxyReference
     * @tc.desc          The client keeps the dead proxy until disconnect.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath and inspect the client proxy.
     *                   3. The proxy reference survives.
     * @tc.expected      The proxy reference survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleNotifyDeathKeepsProxyReference', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(116);
      session.onConnect(proxy);
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathKeepsConnectedState
     * @tc.desc          The state machine is unchanged by death.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath and read the state.
     *                   3. The state stays connected.
     * @tc.expected      The state stays connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleNotifyDeathKeepsConnectedState', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(117);
      session.onConnect(proxy);
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathKeepsRegistrationFlags
     * @tc.desc          The death does not clear registration flags.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath and inspect the flags.
     *                   3. Both flags remain true.
     * @tc.expected      Both flags remain true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleNotifyDeathKeepsRegistrationFlags', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(118);
      session.onConnect(proxy);
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathKillsStub
     * @tc.desc          The underlying stub is no longer alive.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath and inspect the stub.
     *                   3. The stub reports not alive.
     * @tc.expected      The stub reports not alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleNotifyDeathKillsStub', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(119);
      session.onConnect(proxy);
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathTwiceCountsTwice
     * @tc.desc          Each notification increments the recipient counter.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath twice.
     *                   3. The death counter equals two.
     * @tc.expected      The death counter equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleNotifyDeathTwiceCountsTwice', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(120);
      session.onConnect(proxy);
      proxy.notifyDeath();
      proxy.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(2);
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === proxy).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyDeathWithoutRecipientIsSilent
     * @tc.desc          A proxy without a recipient survives the call.
     * @tc.precondition  A bare proxy exists.
     * @tc.steps         1. A bare proxy exists.
     *                   2. Call notifyDeath and read the death count.
     *                   3. No recipient exists to be notified.
     * @tc.expected      No recipient exists to be notified.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleNotifyDeathWithoutRecipientIsSilent', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      proxy.notifyDeath();
      expect(proxy.alive).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleSendAfterDeathFails
     * @tc.desc          A dead proxy rejects the request.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath then sendString.
     *                   3. The errCode is the send error.
     * @tc.expected      The errCode is the send error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleSendAfterDeathFails', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-22';
      proxy.notifyDeath();
      const result = session.sendString('after death');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleSendAfterDeathToastsFailure
     * @tc.desc          The rejected send shows the send failure toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath then sendString.
     *                   3. The last toast is the send failure text.
     * @tc.expected      The last toast is the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleSendAfterDeathToastsFailure', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-23';
      proxy.notifyDeath();
      const result = session.sendString('alpha');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleSendAfterDeathRecordsFailureEvent
     * @tc.desc          The rejected send records a send-failed event.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath then sendString.
     *                   3. One send-failed event exists.
     * @tc.expected      One send-failed event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleSendAfterDeathRecordsFailureEvent', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-24';
      proxy.notifyDeath();
      const result = session.sendString('beta');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleSendAfterDeathStillCountsCall
     * @tc.desc          The proxy counts the rejected request.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath then sendString.
     *                   3. The proxy send counter equals one.
     * @tc.expected      The proxy send counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleSendAfterDeathStillCountsCall', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-25';
      proxy.notifyDeath();
      const result = session.sendString('gamma');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleSendAfterDeathRecordsRequestCode
     * @tc.desc          The request code is buffered before the liveness check.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call notifyDeath then sendString.
     *                   3. The proxy recorded request code one.
     * @tc.expected      The proxy recorded request code one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleSendAfterDeathRecordsRequestCode', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-26';
      proxy.notifyDeath();
      const result = session.sendString('delta');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleUnregisterAfterDeathSucceeds
     * @tc.desc          A dead proxy still accepts the unregister call.
     * @tc.precondition  A connected session with a dead proxy exists.
     * @tc.steps         1. A connected session with a dead proxy exists.
     *                   2. Unregister the client recipient.
     *                   3. The call returns true.
     * @tc.expected      The call returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleUnregisterAfterDeathSucceeds', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-27';
      proxy.notifyDeath();
      const removed = proxy.unregisterDeathRecipient(session.deathRecipient);
      expect(removed).assertEqual(true);
      expect(session.deathRecipient.registered).assertEqual(false);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(proxy.deathRecipient === undefined).assertEqual(true);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === proxy).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleUnregisterClearsRecipientFlag
     * @tc.desc          Unregistering clears the recipient flag.
     * @tc.precondition  A dead proxy remains registered.
     * @tc.steps         1. A dead proxy remains registered.
     *                   2. Unregister and read the recipient flag.
     *                   3. The flag is false.
     * @tc.expected      The flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleUnregisterClearsRecipientFlag', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-28';
      proxy.notifyDeath();
      const removed = proxy.unregisterDeathRecipient(session.deathRecipient);
      expect(removed).assertEqual(true);
      expect(session.deathRecipient.registered).assertEqual(false);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(proxy.deathRecipient === undefined).assertEqual(true);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === proxy).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleUnregisterClearsProxyFlag
     * @tc.desc          Unregistering clears the proxy flag.
     * @tc.precondition  A dead proxy remains registered.
     * @tc.steps         1. A dead proxy remains registered.
     *                   2. Unregister and read the proxy flag.
     *                   3. The flag is false.
     * @tc.expected      The flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleUnregisterClearsProxyFlag', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-29';
      proxy.notifyDeath();
      const removed = proxy.unregisterDeathRecipient(session.deathRecipient);
      expect(removed).assertEqual(true);
      expect(session.deathRecipient.registered).assertEqual(false);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(proxy.deathRecipient === undefined).assertEqual(true);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === proxy).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleUnregisterDropsRecipientReference
     * @tc.desc          Unregistering removes the proxy recipient.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. A registered proxy exists.
     *                   2. Unregister and inspect the proxy field.
     *                   3. The recipient field is undefined.
     * @tc.expected      The recipient field is undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleUnregisterDropsRecipientReference', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-30';
      proxy.notifyDeath();
      const removed = proxy.unregisterDeathRecipient(session.deathRecipient);
      expect(removed).assertEqual(true);
      expect(session.deathRecipient.registered).assertEqual(false);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(proxy.deathRecipient === undefined).assertEqual(true);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === proxy).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleUnregisterWrongRecipientRefused
     * @tc.desc          A mismatched recipient cannot be removed.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. A registered proxy exists.
     *                   2. Unregister a fresh recipient object.
     *                   3. The call returns false.
     * @tc.expected      The call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleUnregisterWrongRecipientRefused', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-31';
      proxy.notifyDeath();
      const other = new DeathRecipientModel();
      const removed = proxy.unregisterDeathRecipient(other);
      expect(removed).assertEqual(false);
      expect(session.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(proxy.deathRecipient === undefined).assertEqual(false);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === proxy).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleUnregisterWrongRecipientKeepsFlags
     * @tc.desc          The refused unregister keeps the flags.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. A registered proxy exists.
     *                   2. Unregister a fresh recipient object.
     *                   3. Both flags remain true.
     * @tc.expected      Both flags remain true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleUnregisterWrongRecipientKeepsFlags', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-32';
      proxy.notifyDeath();
      const other = new DeathRecipientModel();
      const removed = proxy.unregisterDeathRecipient(other);
      expect(removed).assertEqual(false);
      expect(session.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(proxy.deathRecipient === undefined).assertEqual(false);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.alive).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === proxy).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleDisconnectAfterDeathClearsProxy
     * @tc.desc          onDisconnect clears a dead proxy.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Deliver onDisconnect.
     *                   3. The client proxy becomes undefined.
     * @tc.expected      The client proxy becomes undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleDisconnectAfterDeathClearsProxy', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('death-cleanup-33'));
      const session = new ConnectionModel();
      session.connect(433);
      session.onConnect(proxy);
      proxy.notifyDeath();
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.isDisconnect).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleDisconnectAfterDeathRestoresState
     * @tc.desc          onDisconnect restores the disconnected state.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Deliver onDisconnect.
     *                   3. The state is disconnected and the id is minus one.
     * @tc.expected      The state is disconnected and the id is minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleDisconnectAfterDeathRestoresState', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('death-cleanup-34'));
      const session = new ConnectionModel();
      session.connect(434);
      session.onConnect(proxy);
      proxy.notifyDeath();
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.isDisconnect).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleDisconnectAfterDeathToastsSuccess
     * @tc.desc          The cleanup still shows the disconnect toast.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Deliver onDisconnect.
     *                   3. The last toast is disconnectAbility success.
     * @tc.expected      The last toast is disconnectAbility success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleDisconnectAfterDeathToastsSuccess', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('death-cleanup-35'));
      const session = new ConnectionModel();
      session.connect(435);
      session.onConnect(proxy);
      proxy.notifyDeath();
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.isDisconnect).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleDisconnectAfterDeathSetsProbeFlag
     * @tc.desc          The cleanup marks the probe flag.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Deliver onDisconnect.
     *                   3. The isDisconnect flag is true.
     * @tc.expected      The isDisconnect flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleDisconnectAfterDeathSetsProbeFlag', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('death-cleanup-36'));
      const session = new ConnectionModel();
      session.connect(436);
      session.onConnect(proxy);
      proxy.notifyDeath();
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.isDisconnect).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleDisconnectAfterDeathUnregisters
     * @tc.desc          The cleanup withdraws the registration flags.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Deliver onDisconnect.
     *                   3. Both flags are false.
     * @tc.expected      Both flags are false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleDisconnectAfterDeathUnregisters', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('death-cleanup-37'));
      const session = new ConnectionModel();
      session.connect(437);
      session.onConnect(proxy);
      proxy.notifyDeath();
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.isDisconnect).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleDisconnectAfterDeathKeepsDeathCount
     * @tc.desc          The cleanup keeps the observed death count.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Deliver onDisconnect and read the counter.
     *                   3. The counter equals one.
     * @tc.expected      The counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleDisconnectAfterDeathKeepsDeathCount', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel('death-cleanup-38'));
      const session = new ConnectionModel();
      session.connect(438);
      session.onConnect(proxy);
      proxy.notifyDeath();
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.isDisconnect).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleResetAfterDeathClearsAll
     * @tc.desc          reset removes every death trace.
     * @tc.precondition  A session with a dead proxy was reset.
     * @tc.steps         1. A session with a dead proxy was reset.
     *                   2. Read the state, flags and counters.
     *                   3. Everything is back to defaults.
     * @tc.expected      Everything is back to defaults.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleResetAfterDeathClearsAll', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.reset();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.proxy === undefined).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.toasts.length).assertEqual(0);
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.isConnected()).assertFalse();
      expect(session.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleSnapshotAfterDeathKeepsProxy
     * @tc.desc          The snapshot still reports the dead proxy.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Build a ClientSnapshot.
     *                   3. hasProxy and deathRegistered are true.
     * @tc.expected      hasProxy and deathRegistered are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleSnapshotAfterDeathKeepsProxy', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-40';
      proxy.notifyDeath();
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.sameAs(snapshot)).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(proxy.stub.alive).assertFalse();
    });

    /**
     * @tc.name          deathLifecycleConnectAfterDeathWithoutDisconnectRefused
     * @tc.desc          A dead proxy keeps the connected state and blocks connect.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Call connect with a new id.
     *                   3. The call returns false.
     * @tc.expected      The call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleConnectAfterDeathWithoutDisconnectRefused', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-41';
      proxy.notifyDeath();
      const again = session.connect(71);
      expect(again).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      expect(session.logs.countLevel('WARN')).assertEqual(1);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.connectCalls).assertEqual(2);
      expect(session.isConnected()).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleConnectAfterDeathLogsWarning
     * @tc.desc          The refused connect records a warning.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Call connect and count WARN lines.
     *                   3. One WARN line exists.
     * @tc.expected      One WARN line exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleConnectAfterDeathLogsWarning', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-42';
      proxy.notifyDeath();
      const again = session.connect(72);
      expect(again).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      expect(session.logs.countLevel('WARN')).assertEqual(1);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.connectCalls).assertEqual(2);
      expect(session.isConnected()).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleReconnectAfterDeathDisconnectFirst
     * @tc.desc          A logout followed by connect is accepted.
     * @tc.precondition  A session with a dead proxy exists.
     * @tc.steps         1. A session with a dead proxy exists.
     *                   2. Deliver onDisconnect then connect.
     *                   3. The call returns true.
     * @tc.expected      The call returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleReconnectAfterDeathDisconnectFirst', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      const ok = session.connect(73);
      expect(ok).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTING);
      expect(session.connectId).assertEqual(73);
      expect(session.isDisconnect).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.connectCalls).assertEqual(2);
    });

    /**
     * @tc.name          deathLifecycleReconnectAfterDeathNewProxy
     * @tc.desc          A fresh proxy can be attached after death.
     * @tc.precondition  The dead session was cleaned up.
     * @tc.steps         1. The dead session was cleaned up.
     *                   2. Connect and deliver a new live proxy.
     *                   3. The stored proxy is the new instance.
     * @tc.expected      The stored proxy is the new instance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleReconnectAfterDeathNewProxy', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      session.connect(154);
      const next = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(next);
      expect(session.proxy === next).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(154);
      expect(next.deathRegistered).assertTrue();
      expect(session.deathRecipient.registered).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          deathLifecycleReconnectAfterDeathIsConnected
     * @tc.desc          The new live proxy restores isConnected.
     * @tc.precondition  The dead session was cleaned up and reconnected.
     * @tc.steps         1. The dead session was cleaned up and reconnected.
     *                   2. Call isConnected.
     *                   3. The result is true.
     * @tc.expected      The result is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('deathLifecycleReconnectAfterDeathIsConnected', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      session.connect(155);
      const next = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(next);
      expect(session.proxy === next).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(155);
      expect(next.deathRegistered).assertTrue();
      expect(session.deathRecipient.registered).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          deathLifecycleReconnectAfterDeathDeathCountPreserved
     * @tc.desc          The client recipient keeps its observed count.
     * @tc.precondition  The same session reconnects after a death.
     * @tc.steps         1. The same session reconnects after a death.
     *                   2. Inspect the recipient death counter.
     *                   3. The counter still equals one.
     * @tc.expected      The counter still equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleReconnectAfterDeathDeathCountPreserved', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      session.connect(156);
      const next = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(next);
      expect(session.proxy === next).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(156);
      expect(next.deathRegistered).assertTrue();
      expect(session.deathRecipient.registered).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          deathLifecycleReconnectAfterDeathToastsStack
     * @tc.desc          The reconnect adds connect and disconnect toasts.
     * @tc.precondition  The dead session was cleaned up and reconnected.
     * @tc.steps         1. The dead session was cleaned up and reconnected.
     *                   2. Read the toast list.
     *                   3. Four toasts exist with connect success last.
     * @tc.expected      Four toasts exist with connect success last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleReconnectAfterDeathToastsStack', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-47';
      proxy.notifyDeath();
      session.sendString('after death');
      session.onDisconnect();
      session.connect(77);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(session.toasts.length).assertEqual(4);
      expect(session.lastToast()).assertEqual('connectAbility success');
      expect(session.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleMetricsAfterDeathSend
     * @tc.desc          A failed send on a dead proxy raises failures.
     * @tc.precondition  A session sent once after death.
     * @tc.steps         1. A session sent once after death.
     *                   2. Build ClientMetrics from the session.
     *                   3. sends and failures equal one.
     * @tc.expected      sends and failures equal one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleMetricsAfterDeathSend', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.sendString('metrics death');
      const metrics = ClientMetrics.from(session);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.isConnected()).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleSnapshotAfterReconnect
     * @tc.desc          The reconnected snapshot reports a live registration.
     * @tc.precondition  The dead session was cleaned up and reconnected.
     * @tc.steps         1. The dead session was cleaned up and reconnected.
     *                   2. Build a ClientSnapshot.
     *                   3. state is connected and hasProxy is true.
     * @tc.expected      state is connected and hasProxy is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleSnapshotAfterReconnect', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      session.connect(76);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.connectId).assertEqual(76);
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.connectId === 7).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
    });

    /**
     * @tc.name          deathLifecycleResetAfterReconnectClearsDeaths
     * @tc.desc          reset creates a fresh recipient counter.
     * @tc.precondition  The reconnected session was reset.
     * @tc.steps         1. The reconnected session was reset.
     *                   2. Read the recipient counter and flags.
     *                   3. The counter is zero and the flags are false.
     * @tc.expected      The counter is zero and the flags are false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('deathLifecycleResetAfterReconnectClearsDeaths', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      session.connect(78);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      session.reset();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.toasts.length).assertEqual(0);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.events.size()).assertEqual(0);
      expect(session.isConnected()).assertFalse();
      expect(session.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          deathLifecycleDeadProxyRejectsSecondSend
     * @tc.desc          Two rejected sends each count as calls.
     * @tc.precondition  A connected session with a dead proxy exists.
     * @tc.steps         1. A connected session with a dead proxy exists.
     *                   2. Send twice after the death.
     *                   3. Both requests fail and the counter equals two.
     * @tc.expected      Both requests fail and the counter equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleDeadProxyRejectsSecondSend', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.descriptor = 'unregister-51';
      proxy.notifyDeath();
      const first = session.sendString('first');
      const second = session.sendString('second');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(second.errCode).assertEqual(ERROR_SEND);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(session.events.countOf('send-failed')).assertEqual(2);
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts[2]).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          deathLifecycleNotifyAfterUnregisterIsIgnored
     * @tc.desc          A removed recipient receives no further callback.
     * @tc.precondition  A registered proxy is unregistered.
     * @tc.steps         1. A registered proxy is unregistered.
     *                   2. Notify death after unregister.
     *                   3. The client death counter stays zero.
     * @tc.expected      The client death counter stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('deathLifecycleNotifyAfterUnregisterIsIgnored', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      const removed = proxy.unregisterDeathRecipient(session.deathRecipient);
      proxy.notifyDeath();
      expect(removed).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.alive).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(proxy.deathRecipient === undefined).assertTrue();
    });

  });
}
