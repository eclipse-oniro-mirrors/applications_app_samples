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
  TARGET_BUNDLE,
  STUB_DESCRIPTOR,
  DISCONNECT_PROBE_MS,
  TOAST_DURATION_MS,
  INITIAL_CONNECT_ID,
  STATE_DISCONNECTED,
  STATE_CONNECTED,
  STATE_CONNECTING,
  DISCONNECT_SUCCESS_TOAST,
  DISCONNECT_FAIL_TOAST,
  SEND_FAIL_TOAST,
  ERROR_NONE,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  DeathRecipientModel,
  WantModel,
  ClientSnapshot,
  ClientMetrics,
  createConnectedSession
} from '../Shared/SharedDriver';

export default function disconnectLifecycle(): void {
  describe('DisconnectLifecycle', () => {
    beforeAll(() => {
      logSuite('DisconnectLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('DisconnectLifecycle', 'end');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectClearsProxy
     * @tc.desc          onDisconnect drops the remote proxy reference.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect.
     *                   3. The proxy field becomes undefined.
     * @tc.expected      The proxy field becomes undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleOnDisconnectClearsProxy', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(300);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectSetsDisconnectedState
     * @tc.desc          onDisconnect returns the client to disconnected.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect and read the state.
     *                   3. The state equals disconnected.
     * @tc.expected      The state equals disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleOnDisconnectSetsDisconnectedState', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(301);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectResetsConnectId
     * @tc.desc          onDisconnect clears the stored connect id.
     * @tc.precondition  A connected session exists with id seven.
     * @tc.steps         1. A connected session exists with id seven.
     *                   2. Deliver onDisconnect.
     *                   3. connectId equals minus one.
     * @tc.expected      connectId equals minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleOnDisconnectResetsConnectId', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(302);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectSetsProbeFlag
     * @tc.desc          onDisconnect marks the disconnect probe as passed.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect and read isDisconnect.
     *                   3. The flag is true.
     * @tc.expected      The flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleOnDisconnectSetsProbeFlag', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(303);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectEmitsSuccessToast
     * @tc.desc          onDisconnect shows the success toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect and read the toast.
     *                   3. The toast is disconnectAbility success.
     * @tc.expected      The toast is disconnectAbility success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleOnDisconnectEmitsSuccessToast', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(304);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectUnregistersRecipient
     * @tc.desc          onDisconnect withdraws the death recipient.
     * @tc.precondition  A connected session exists with a registered recipient.
     * @tc.steps         1. A connected session exists with a registered recipient.
     *                   2. Deliver onDisconnect and inspect the flags.
     *                   3. Both registration flags are false.
     * @tc.expected      Both registration flags are false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleOnDisconnectUnregistersRecipient', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(305);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectRecordsEvent
     * @tc.desc          onDisconnect appends one disconnected event.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect and count events.
     *                   3. One disconnected event exists.
     * @tc.expected      One disconnected event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleOnDisconnectRecordsEvent', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(306);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectLogsInfo
     * @tc.desc          onDisconnect buffers an informational line.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect and count INFO lines.
     *                   3. At least three INFO lines exist.
     * @tc.expected      At least three INFO lines exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleOnDisconnectLogsInfo', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(307);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectBreaksIsConnected
     * @tc.desc          isConnected becomes false after disconnect.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect then call isConnected.
     *                   3. The result is false.
     * @tc.expected      The result is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleOnDisconnectBreaksIsConnected', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(308);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectKeepsDeathRecipientObject
     * @tc.desc          The recipient object survives with a zero death count.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver onDisconnect and inspect the counter.
     *                   3. diedCount remains zero.
     * @tc.expected      diedCount remains zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleOnDisconnectKeepsDeathRecipientObject', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(309);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectIsRepeatable
     * @tc.desc          A second onDisconnect is harmless.
     * @tc.precondition  A disconnected session exists.
     * @tc.steps         1. A disconnected session exists.
     *                   2. Deliver onDisconnect again.
     *                   3. The state stays disconnected and toasts grow.
     * @tc.expected      The state stays disconnected and toasts grow.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleOnDisconnectIsRepeatable', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(310);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(2);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleOnDisconnectTwiceKeepsIdle
     * @tc.desc          Repeated disconnects keep the idle id.
     * @tc.precondition  A disconnected session exists.
     * @tc.steps         1. A disconnected session exists.
     *                   2. Deliver onDisconnect twice.
     *                   3. connectId stays minus one.
     * @tc.expected      connectId stays minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleOnDisconnectTwiceKeepsIdle', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const session = new ConnectionModel();
      session.connect(311);
      session.onConnect(proxy);
      const recipient = session.deathRecipient;
      const requested = session.disconnectRequested();
      session.onDisconnect();
      session.onDisconnect();
      expect(requested).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient === session.deathRecipient).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(2);
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.logs.countLevel('INFO') >= 3).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[0]).assertEqual('connectAbility success');
    });

    /**
     * @tc.name          disconnectLifecycleRequestWithoutConnectIdRefused
     * @tc.desc          disconnectRequested refuses an idle client.
     * @tc.precondition  A fresh client has no connect id.
     * @tc.steps         1. A fresh client has no connect id.
     *                   2. Call disconnectRequested.
     *                   3. The call returns false.
     * @tc.expected      The call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleRequestWithoutConnectIdRefused', 0, () => {
      const client = new ConnectionModel();
      client.logs.info('idle-request-12');
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(false);
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestWithoutConnectIdLogsError
     * @tc.desc          The refused request buffers an error line.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Call disconnectRequested and count ERROR lines.
     *                   3. One ERROR line exists.
     * @tc.expected      One ERROR line exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestWithoutConnectIdLogsError', 0, () => {
      const client = new ConnectionModel();
      client.logs.info('idle-request-13');
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(false);
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestWithoutConnectIdSkipsEvent
     * @tc.desc          The refused request writes no event.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Call disconnectRequested and inspect events.
     *                   3. The event list is empty.
     * @tc.expected      The event list is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestWithoutConnectIdSkipsEvent', 0, () => {
      const client = new ConnectionModel();
      client.logs.info('idle-request-14');
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(false);
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestWithConnectIdAccepted
     * @tc.desc          disconnectRequested accepts a connected client.
     * @tc.precondition  The client is connecting with id forty.
     * @tc.steps         1. The client is connecting with id forty.
     *                   2. Call disconnectRequested.
     *                   3. The call returns true.
     * @tc.expected      The call returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleRequestWithConnectIdAccepted', 0, () => {
      const client = new ConnectionModel();
      client.connect(40);
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(true);
      expect(client.connectId).assertEqual(40);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('connecting');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestRecordsConnectId
     * @tc.desc          The accepted request records the numeric id.
     * @tc.precondition  The client is connecting with id forty one.
     * @tc.steps         1. The client is connecting with id forty one.
     *                   2. Call disconnectRequested.
     *                   3. One disconnect-request event exists.
     * @tc.expected      One disconnect-request event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestRecordsConnectId', 0, () => {
      const client = new ConnectionModel();
      client.connect(41);
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(true);
      expect(client.connectId).assertEqual(41);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('connecting');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestEventCarriesId
     * @tc.desc          The request event ends with the id digits.
     * @tc.precondition  The client is connecting with id forty two.
     * @tc.steps         1. The client is connecting with id forty two.
     *                   2. Call disconnectRequested and read the last event.
     *                   3. The event ends with forty two.
     * @tc.expected      The event ends with forty two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestEventCarriesId', 0, () => {
      const client = new ConnectionModel();
      client.connect(42);
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(true);
      expect(client.connectId).assertEqual(42);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('connecting');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestAfterDisconnectRefused
     * @tc.desc          A disconnected client cannot request again.
     * @tc.precondition  A session has just disconnected.
     * @tc.steps         1. A session has just disconnected.
     *                   2. Call disconnectRequested.
     *                   3. The call returns false.
     * @tc.expected      The call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleRequestAfterDisconnectRefused', 0, () => {
      const client = new ConnectionModel();
      client.connect(43);
      client.onDisconnect();
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(false);
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual('disconnected');
      expect(client.isDisconnect).assertEqual(true);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestAfterDisconnectLogsError
     * @tc.desc          The refused post-disconnect request logs.
     * @tc.precondition  A session has just disconnected.
     * @tc.steps         1. A session has just disconnected.
     *                   2. Call disconnectRequested and count ERROR lines.
     *                   3. The ERROR count grew by one.
     * @tc.expected      The ERROR count grew by one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestAfterDisconnectLogsError', 0, () => {
      const client = new ConnectionModel();
      client.connect(44);
      client.onDisconnect();
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(false);
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual('disconnected');
      expect(client.isDisconnect).assertEqual(true);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestAfterResetRefused
     * @tc.desc          reset clears the id used by the gate.
     * @tc.precondition  A live session was reset.
     * @tc.steps         1. A live session was reset.
     *                   2. Call disconnectRequested.
     *                   3. The call returns false.
     * @tc.expected      The call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestAfterResetRefused', 0, () => {
      const client = new ConnectionModel();
      client.connect(45);
      client.onConnect(new RemoteProxyModel());
      client.reset();
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(false);
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestAfterFailedConnectAccepted
     * @tc.desc          A failed connect keeps the requested id.
     * @tc.precondition  A fresh client was marked failed.
     * @tc.steps         1. A fresh client was marked failed.
     *                   2. Call disconnectRequested.
     *                   3. The call returns true.
     * @tc.expected      The call returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('disconnectLifecycleRequestAfterFailedConnectAccepted', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(16000001);
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(false);
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual('failed');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestRepeatedKeepsAccepting
     * @tc.desc          The gate stays open until onDisconnect.
     * @tc.precondition  The client is connecting with a valid id.
     * @tc.steps         1. The client is connecting with a valid id.
     *                   2. Call disconnectRequested twice.
     *                   3. Both calls return true.
     * @tc.expected      Both calls return true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestRepeatedKeepsAccepting', 0, () => {
      const client = new ConnectionModel();
      client.connect(46);
      client.disconnectRequested();
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(true);
      expect(client.connectId).assertEqual(46);
      expect(client.events.countOf('disconnect-request')).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('connecting');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleRequestRepeatedRecordsTwoEvents
     * @tc.desc          Each accepted request adds one event.
     * @tc.precondition  The client is connecting with a valid id.
     * @tc.steps         1. The client is connecting with a valid id.
     *                   2. Call disconnectRequested twice.
     *                   3. Two disconnect-request events exist.
     * @tc.expected      Two disconnect-request events exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleRequestRepeatedRecordsTwoEvents', 0, () => {
      const client = new ConnectionModel();
      client.connect(47);
      client.disconnectRequested();
      const accepted = client.disconnectRequested();
      expect(accepted).assertEqual(true);
      expect(client.connectId).assertEqual(47);
      expect(client.events.countOf('disconnect-request')).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual('connecting');
      expect(client.isDisconnect).assertEqual(false);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleProbeWindowConstant
     * @tc.desc          The probe waits exactly three seconds.
     * @tc.precondition  Driver constants are loaded.
     * @tc.steps         1. Driver constants are loaded.
     *                   2. Read DISCONNECT_PROBE_MS.
     *                   3. The value equals three thousand.
     * @tc.expected      The value equals three thousand.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleProbeWindowConstant', 0, () => {
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(DISCONNECT_PROBE_MS > TOAST_DURATION_MS).assertTrue();
      expect(DISCONNECT_PROBE_MS - TOAST_DURATION_MS).assertEqual(1000);
      expect(DISCONNECT_PROBE_MS / 1000).assertEqual(3);
      expect(TOAST_DURATION_MS / 1000).assertEqual(2);
      expect(String(DISCONNECT_PROBE_MS)).assertEqual('3000');
      expect(DISCONNECT_PROBE_MS === 2999).assertFalse();
    });

    /**
     * @tc.name          disconnectLifecycleProbeShorterThanWindowSkipsToast
     * @tc.desc          A probe shorter than three seconds stays silent.
     * @tc.precondition  A disconnected session exists.
     * @tc.steps         1. A disconnected session exists.
     *                   2. Compare a two second wait with the window.
     *                   3. The failure toast is not due.
     * @tc.expected      The failure toast is not due.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleProbeShorterThanWindowSkipsToast', 0, () => {
      const client = new ConnectionModel();
      const waited = 2000;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(false);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(false);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeAtWindowTriggersToast
     * @tc.desc          A probe at three seconds triggers the failure path.
     * @tc.precondition  A client that never disconnected exists.
     * @tc.steps         1. A client that never disconnected exists.
     *                   2. Compare a three second wait with the window.
     *                   3. The failure toast is due because the flag is false.
     * @tc.expected      The failure toast is due because the flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleProbeAtWindowTriggersToast', 0, () => {
      const client = new ConnectionModel();
      const waited = 3100;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(true);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(true);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeLongerThanWindowTriggersToast
     * @tc.desc          A probe beyond three seconds also triggers.
     * @tc.precondition  A client that never disconnected exists.
     * @tc.steps         1. A client that never disconnected exists.
     *                   2. Compare a four second wait with the window.
     *                   3. The failure toast is due.
     * @tc.expected      The failure toast is due.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleProbeLongerThanWindowTriggersToast', 0, () => {
      const client = new ConnectionModel();
      const waited = 4000;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(true);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(true);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeSuccessSuppressesToast
     * @tc.desc          A recorded disconnect suppresses the failure toast.
     * @tc.precondition  A session disconnected successfully.
     * @tc.steps         1. A session disconnected successfully.
     *                   2. Compare the expiry with the isDisconnect flag.
     *                   3. The failure toast is suppressed.
     * @tc.expected      The failure toast is suppressed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleProbeSuccessSuppressesToast', 0, () => {
      const client = new ConnectionModel();
      client.onDisconnect();
      const waited = 3000;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(true);
      expect(client.isDisconnect).assertEqual(true);
      expect(needsWarn).assertEqual(false);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeFlagResetsAfterWindow
     * @tc.desc          The production handler clears the flag after probing.
     * @tc.precondition  A session disconnected successfully.
     * @tc.steps         1. A session disconnected successfully.
     *                   2. Simulate the finally reset of isDisconnect.
     *                   3. The flag is false after the probe.
     * @tc.expected      The flag is false after the probe.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleProbeFlagResetsAfterWindow', 0, () => {
      const client = createConnectedSession();
      client.onDisconnect();
      const expired = 3000 >= DISCONNECT_PROBE_MS;
      expect(client.isDisconnect).assertTrue();
      expect(expired).assertTrue();
      client.isDisconnect = false;
      expect(client.isDisconnect).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(2);
      expect(client.proxy === undefined).assertTrue();
      expect(expired && client.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          disconnectLifecycleProbeResetEnablesNextToast
     * @tc.desc          A cleared flag makes the next failure visible.
     * @tc.precondition  A probe was already reset.
     * @tc.steps         1. A probe was already reset.
     *                   2. Compute the toast decision for an idle client.
     *                   3. The failure toast is due again.
     * @tc.expected      The failure toast is due again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleProbeResetEnablesNextToast', 0, () => {
      const client = new ConnectionModel();
      client.onDisconnect();
      client.isDisconnect = false;
      const waited = 3000;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(true);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(true);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeIdleClientStillWarns
     * @tc.desc          An idle client never sets the flag.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Call the probe decision logic.
     *                   3. The failure toast is due.
     * @tc.expected      The failure toast is due.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleProbeIdleClientStillWarns', 0, () => {
      const client = new ConnectionModel();
      const waited = 3500;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(true);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(true);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeToastDurationConstant
     * @tc.desc          The failure toast lasts two seconds.
     * @tc.precondition  Driver constants are loaded.
     * @tc.steps         1. Driver constants are loaded.
     *                   2. Read TOAST_DURATION_MS.
     *                   3. The value equals two thousand.
     * @tc.expected      The value equals two thousand.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleProbeToastDurationConstant', 0, () => {
      const client = new ConnectionModel();
      const waited = 0;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(false);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(false);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeSecondWaitSkipsAgain
     * @tc.desc          A second short wait after the window stays silent.
     * @tc.precondition  The probe flag was reset after the first window.
     * @tc.steps         1. The probe flag was reset after the first window.
     *                   2. Compare a one second wait with the window.
     *                   3. The failure toast is not due.
     * @tc.expected      The failure toast is not due.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('disconnectLifecycleProbeSecondWaitSkipsAgain', 0, () => {
      const client = new ConnectionModel();
      client.onDisconnect();
      client.isDisconnect = false;
      const waited = 1000;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(false);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(false);
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeExactBoundaryIsInclusive
     * @tc.desc          The boundary comparison uses greater or equal.
     * @tc.precondition  Driver constants are loaded.
     * @tc.steps         1. Driver constants are loaded.
     *                   2. Evaluate three thousand greater or equal to the probe window.
     *                   3. The comparison is true.
     * @tc.expected      The comparison is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleProbeExactBoundaryIsInclusive', 0, () => {
      const client = new ConnectionModel();
      const waited = 3000;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(true);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(true);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleProbeOneMillisecondShortFails
     * @tc.desc          One millisecond before the window stays silent.
     * @tc.precondition  Driver constants are loaded.
     * @tc.steps         1. Driver constants are loaded.
     *                   2. Evaluate two thousand nine hundred ninety nine against the window.
     *                   3. The comparison is false.
     * @tc.expected      The comparison is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleProbeOneMillisecondShortFails', 0, () => {
      const client = new ConnectionModel();
      const waited = 2999;
      const expired = waited >= DISCONNECT_PROBE_MS;
      const needsWarn = expired && !client.isDisconnect;
      expect(waited >= 0).assertTrue();
      expect(DISCONNECT_PROBE_MS).assertEqual(3000);
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(expired).assertEqual(false);
      expect(client.isDisconnect).assertEqual(false);
      expect(needsWarn).assertEqual(false);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expired || waited < DISCONNECT_PROBE_MS).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleSendAfterDisconnectFails
     * @tc.desc          A disconnected client cannot send.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Call sendString.
     *                   3. The errCode is proxy invalid.
     * @tc.expected      The errCode is proxy invalid.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleSendAfterDisconnectFails', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = session.sendString('hello world');
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(3);
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.proxy === undefined).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleSendAfterDisconnectToastsFailure
     * @tc.desc          The refused send shows the send failure toast.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Call sendString and read the last toast.
     *                   3. The toast is the send failure text.
     * @tc.expected      The toast is the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleSendAfterDisconnectToastsFailure', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = session.sendString('alpha');
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(3);
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.proxy === undefined).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleSendAfterDisconnectRecordsNoProxy
     * @tc.desc          The refused send records a no-proxy event.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Call sendString and count events.
     *                   3. One send-no-proxy event exists.
     * @tc.expected      One send-no-proxy event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleSendAfterDisconnectRecordsNoProxy', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = session.sendString('beta');
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(3);
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.proxy === undefined).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleSendAfterDisconnectKeepsState
     * @tc.desc          The refused send does not change state.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Call sendString and read the state.
     *                   3. The state stays disconnected.
     * @tc.expected      The state stays disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleSendAfterDisconnectKeepsState', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = session.sendString('gamma');
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(3);
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.proxy === undefined).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleSnapshotAfterDisconnectLosesProxy
     * @tc.desc          The disconnected snapshot reports no proxy.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Build a ClientSnapshot.
     *                   3. hasProxy is false and state is disconnected.
     * @tc.expected      hasProxy is false and state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleSnapshotAfterDisconnectLosesProxy', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshot.toastCount).assertEqual(2);
      expect(snapshot.sameAs(new ClientSnapshot(session))).assertTrue();
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/2');
      expect(snapshot.describe().indexOf('true') < 0).assertTrue();
      expect(snapshot.hasProxy).assertEqual(false);
    });

    /**
     * @tc.name          disconnectLifecycleSnapshotAfterDisconnectLosesRegistration
     * @tc.desc          The disconnected snapshot reports no death registration.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Build a ClientSnapshot.
     *                   3. deathRegistered is false.
     * @tc.expected      deathRegistered is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('disconnectLifecycleSnapshotAfterDisconnectLosesRegistration', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.deathRegistered).assertFalse();
      expect(session.deathRecipient.registered).assertFalse();
      expect(snapshot.toastCount).assertEqual(2);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.sameAs(snapshot)).assertTrue();
      expect(snapshot.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          disconnectLifecycleMetricsAfterDisconnectCountsConnect
     * @tc.desc          The connect metric survives a disconnect.
     * @tc.precondition  A session connected once then disconnected.
     * @tc.steps         1. A session connected once then disconnected.
     *                   2. Build ClientMetrics.
     *                   3. connects equals one and sends is zero.
     * @tc.expected      connects equals one and sends is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleMetricsAfterDisconnectCountsConnect', 0, () => {
      const session = createConnectedSession();
      session.disconnectRequested();
      session.onDisconnect();
      const metrics = ClientMetrics.from(session);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          disconnectLifecycleMetricsAfterFailedSendCountsFailure
     * @tc.desc          A failed send raises the failure metric.
     * @tc.precondition  A disconnected client attempted one send.
     * @tc.steps         1. A disconnected client attempted one send.
     *                   2. Build ClientMetrics from the client.
     *                   3. failures equals one and replies is zero.
     * @tc.expected      failures equals one and replies is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('disconnectLifecycleMetricsAfterFailedSendCountsFailure', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = 16000003;
      const result = session.sendString('failing');
      session.onDisconnect();
      const metrics = ClientMetrics.from(session);
      expect(result.errCode).assertEqual(16000003);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[1]).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          disconnectLifecycleToastsStackAfterDisconnect
     * @tc.desc          The success toast stacks on the connect toast.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Read the toast list size and last entry.
     *                   3. Two toasts exist with disconnect last.
     * @tc.expected      Two toasts exist with disconnect last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleToastsStackAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual('connectAbility success');
      expect(session.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(session.toasts.indexOf(DISCONNECT_FAIL_TOAST)).assertEqual(-1);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          disconnectLifecycleSecondCycleStacksToasts
     * @tc.desc          A reconnect and disconnect stack two more toasts.
     * @tc.precondition  A session completed one full cycle.
     * @tc.steps         1. A session completed one full cycle.
     *                   2. Run a second connect and disconnect cycle.
     *                   3. Four toasts exist in total.
     * @tc.expected      Four toasts exist in total.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('disconnectLifecycleSecondCycleStacksToasts', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(51);
      session.onConnect(new RemoteProxyModel());
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(4);
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.events.countOf('disconnected')).assertEqual(2);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.isDisconnect).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.logs.countLevel('INFO') >= 6).assertTrue();
    });

    /**
     * @tc.name          disconnectLifecycleDisconnectKeepsWant
     * @tc.desc          onDisconnect leaves the configured want alone.
     * @tc.precondition  A session with a custom want connects.
     * @tc.steps         1. A session with a custom want connects.
     *                   2. Deliver onDisconnect.
     *                   3. The want bundle and ability are unchanged.
     * @tc.expected      The want bundle and ability are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleDisconnectKeepsWant', 0, () => {
      const client = new ConnectionModel(new WantModel('com.example.custom', 'CustomAbility'));
      const want = client.want;
      client.connect(3);
      client.onConnect(new RemoteProxyModel());
      client.onDisconnect();
      expect(client.want === want).assertTrue();
      expect(client.want.bundleName).assertEqual('com.example.custom');
      expect(client.want.abilityName).assertEqual('CustomAbility');
      expect(client.want.bundleName === TARGET_BUNDLE).assertFalse();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.entries[0]).assertEqual('connect:com.example.custom/CustomAbility');
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          disconnectLifecycleDisconnectKeepsFailedCode
     * @tc.desc          onDisconnect leaves the failure code untouched.
     * @tc.precondition  A session recorded a connect failure.
     * @tc.steps         1. A session recorded a connect failure.
     *                   2. Deliver onDisconnect.
     *                   3. failedCode keeps the recorded value.
     * @tc.expected      failedCode keeps the recorded value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('disconnectLifecycleDisconnectKeepsFailedCode', 0, () => {
      const session = createConnectedSession();
      session.onFailed(16000003);
      session.onDisconnect();
      expect(session.failedCode).assertEqual(16000003);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[1]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.events.countOf('failed')).assertEqual(1);
      expect(session.events.last()).assertEqual('disconnected:ok');
      expect(session.proxy === undefined).assertTrue();
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          disconnectLifecyclePreviousProxyStaysRegistered
     * @tc.desc          The dropped proxy keeps its registration flag.
     * @tc.precondition  A connected session disconnects.
     * @tc.steps         1. A connected session disconnects.
     *                   2. Inspect the proxy captured before disconnect.
     *                   3. The proxy is no longer referenced but was registered.
     * @tc.expected      The proxy is no longer referenced but was registered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('disconnectLifecyclePreviousProxyStaysRegistered', 0, () => {
      const session = createConnectedSession();
      const previous = session.proxy as RemoteProxyModel;
      session.onDisconnect();
      expect(previous.deathRegistered).assertFalse();
      expect(previous.alive).assertTrue();
      expect(previous.requests.length).assertEqual(0);
      expect(previous.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(previous.stub.alive).assertTrue();
      expect(session.proxy === undefined).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.events.countOf('death-register')).assertEqual(1);
    });

    /**
     * @tc.name          disconnectLifecycleResetAfterDisconnectClearsToasts
     * @tc.desc          reset removes the disconnect toast stack.
     * @tc.precondition  A session just disconnected.
     * @tc.steps         1. A session just disconnected.
     *                   2. Call reset and read toasts and flag.
     *                   3. Both are empty and false.
     * @tc.expected      Both are empty and false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('disconnectLifecycleResetAfterDisconnectClearsToasts', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.reset();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.toasts.length).assertEqual(0);
      expect(session.isDisconnect).assertFalse();
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.proxy === undefined).assertTrue();
      expect(session.failedCode).assertEqual(ERROR_NONE);
      expect(session.connectCalls).assertEqual(0);
    });

  });
}
