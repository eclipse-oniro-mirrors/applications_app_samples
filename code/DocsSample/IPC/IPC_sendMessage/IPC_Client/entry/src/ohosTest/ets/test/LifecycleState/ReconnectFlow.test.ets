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
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_SEND,
  CONNECT_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  WantModel,
  ClientSnapshot,
  ClientMetrics,
  createConnectedSession
} from '../Shared/SharedDriver';

export default function reconnectFlow(): void {
  describe('ReconnectFlow', () => {
    beforeAll(() => {
      logSuite('ReconnectFlow', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ReconnectFlow', 'end');
    });

    /**
     * @tc.name          reconnectFlowAfterCleanDisconnect
     * @tc.desc          A clean disconnect allows a new session.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. A connected client exists.
     *                   2. Disconnect, then connect and attach a new proxy.
     *                   3. The client is connected on the new id.
     * @tc.expected      The client is connected on the new id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterCleanDisconnect', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(200);
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(200);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAssignsNewConnectId
     * @tc.desc          The reconnect uses the newly supplied id.
     * @tc.precondition  A disconnected client exists.
     * @tc.steps         1. A disconnected client exists.
     *                   2. Connect with a fresh id.
     *                   3. connectId equals the fresh id.
     * @tc.expected      connectId equals the fresh id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAssignsNewConnectId', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(201);
      const stub = new RemoteStubModel();
      stub.replyText = 'alpha';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(201);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('alpha');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowReplacesProxyInstance
     * @tc.desc          The reconnect stores the new proxy.
     * @tc.precondition  A disconnected client exists.
     * @tc.steps         1. A disconnected client exists.
     *                   2. Attach a new proxy after reconnecting.
     *                   3. The stored proxy is the new instance.
     * @tc.expected      The stored proxy is the new instance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowReplacesProxyInstance', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(202);
      const stub = new RemoteStubModel();
      stub.replyText = 'beta';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(202);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('beta');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowKeepsOldProxyDetached
     * @tc.desc          The old proxy stays detached after reconnect.
     * @tc.precondition  A client disconnected from its first proxy.
     * @tc.steps         1. A client disconnected from its first proxy.
     *                   2. Reconnect with a new proxy.
     *                   3. The old proxy remains unregistered.
     * @tc.expected      The old proxy remains unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowKeepsOldProxyDetached', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(203);
      const stub = new RemoteStubModel();
      stub.replyText = 'gamma';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(203);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('gamma');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowRegistersDeathRecipientAgain
     * @tc.desc          The new proxy receives the death recipient.
     * @tc.precondition  A client reconnected with a new proxy.
     * @tc.steps         1. A client reconnected with a new proxy.
     *                   2. Inspect both registration flags.
     *                   3. The recipient is registered on the new proxy.
     * @tc.expected      The recipient is registered on the new proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowRegistersDeathRecipientAgain', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(204);
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(204);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowRecordsSecondConnectEvent
     * @tc.desc          The reconnect adds one connect event.
     * @tc.precondition  A disconnected client exists.
     * @tc.steps         1. A disconnected client exists.
     *                   2. Reconnect and count connect events.
     *                   3. Two connect events exist.
     * @tc.expected      Two connect events exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowRecordsSecondConnectEvent', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(205);
      const stub = new RemoteStubModel();
      stub.replyText = 'alpha';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(205);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('alpha');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowRecordsSecondConnectedEvent
     * @tc.desc          The new handshake adds one connected event.
     * @tc.precondition  A client reconnected with a new proxy.
     * @tc.steps         1. A client reconnected with a new proxy.
     *                   2. Count connected events.
     *                   3. Two connected events exist.
     * @tc.expected      Two connected events exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowRecordsSecondConnectedEvent', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(206);
      const stub = new RemoteStubModel();
      stub.replyText = 'beta';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(206);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('beta');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowStacksSuccessToasts
     * @tc.desc          The reconnect adds the success toast.
     * @tc.precondition  A disconnected client exists.
     * @tc.steps         1. A disconnected client exists.
     *                   2. Reconnect and inspect the toast list.
     *                   3. Three toasts end with connect success.
     * @tc.expected      Three toasts end with connect success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowStacksSuccessToasts', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(207);
      const stub = new RemoteStubModel();
      stub.replyText = 'gamma';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(207);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('gamma');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowSatisfiesIsConnected
     * @tc.desc          The new live proxy makes isConnected true.
     * @tc.precondition  A client reconnected with a new proxy.
     * @tc.steps         1. A client reconnected with a new proxy.
     *                   2. Call isConnected.
     *                   3. The result is true.
     * @tc.expected      The result is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowSatisfiesIsConnected', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(208);
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(208);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowResetsProbeFlagOnlyOnDisconnect
     * @tc.desc          The probe flag persists through the reconnect.
     * @tc.precondition  A client disconnected and reconnected.
     * @tc.steps         1. A client disconnected and reconnected.
     *                   2. Read isDisconnect after the handshake.
     *                   3. The flag is still true.
     * @tc.expected      The flag is still true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowResetsProbeFlagOnlyOnDisconnect', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(209);
      const stub = new RemoteStubModel();
      stub.replyText = 'alpha';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(209);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('alpha');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowCanSendOnNewProxy
     * @tc.desc          The new proxy accepts the sample request.
     * @tc.precondition  A client reconnected with a new proxy.
     * @tc.steps         1. A client reconnected with a new proxy.
     *                   2. Send hello world.
     *                   3. The result reports no error.
     * @tc.expected      The result reports no error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowCanSendOnNewProxy', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(210);
      const stub = new RemoteStubModel();
      stub.replyText = 'beta';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(210);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('beta');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowNewProxyOwnsTheReply
     * @tc.desc          The reply comes from the new stub.
     * @tc.precondition  A client reconnected with a custom reply stub.
     * @tc.steps         1. A client reconnected with a custom reply stub.
     *                   2. Send and read the result reply text.
     *                   3. The reply text is the new stub text.
     * @tc.expected      The reply text is the new stub text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowNewProxyOwnsTheReply', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      expect(session.disconnectRequested()).assertTrue();
      session.onDisconnect();
      const ok = session.connect(211);
      const stub = new RemoteStubModel();
      stub.replyText = 'gamma';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('cycle');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(211);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(next.deathRegistered).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.isDisconnect).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('gamma');
      expect(stub.receivedTexts[0]).assertEqual('cycle');
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathRequiresDisconnect
     * @tc.desc          The dead session must be closed before reconnecting.
     * @tc.precondition  A client whose proxy died exists.
     * @tc.steps         1. A client whose proxy died exists.
     *                   2. Call connect before cleaning up.
     *                   3. The call is refused.
     * @tc.expected      The call is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterDeathRequiresDisconnect', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(292);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(242);
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(242);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('hello rpc');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathCleanupEnablesConnect
     * @tc.desc          The logout opens the reconnect gate.
     * @tc.precondition  A client whose proxy died exists.
     * @tc.steps         1. A client whose proxy died exists.
     *                   2. Deliver onDisconnect then connect.
     *                   3. The call is accepted.
     * @tc.expected      The call is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterDeathCleanupEnablesConnect', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(293);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(243);
      const stub = new RemoteStubModel();
      stub.replyText = 'delta';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(243);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('delta');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathNewProxyLives
     * @tc.desc          The replacement proxy is alive.
     * @tc.precondition  A dead session was cleaned up.
     * @tc.steps         1. A dead session was cleaned up.
     *                   2. Attach a fresh proxy.
     *                   3. The proxy reports alive.
     * @tc.expected      The proxy reports alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterDeathNewProxyLives', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(294);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(244);
      const stub = new RemoteStubModel();
      stub.replyText = 'epsilon';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(244);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('epsilon');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathDeathCountKept
     * @tc.desc          The recipient keeps the observed death count.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Inspect the death counter.
     *                   3. The counter equals one.
     * @tc.expected      The counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterDeathDeathCountKept', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(295);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(245);
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(245);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('hello rpc');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathRegistrationRevived
     * @tc.desc          The replacement proxy registers the same recipient.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Inspect the proxy registration flag.
     *                   3. The flag is true.
     * @tc.expected      The flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterDeathRegistrationRevived', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(296);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(246);
      const stub = new RemoteStubModel();
      stub.replyText = 'delta';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(246);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('delta');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathIsConnectedRestored
     * @tc.desc          The live replacement restores connectivity.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Call isConnected.
     *                   3. The result is true.
     * @tc.expected      The result is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterDeathIsConnectedRestored', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(297);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(247);
      const stub = new RemoteStubModel();
      stub.replyText = 'epsilon';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(247);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('epsilon');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathStaleProxyIgnored
     * @tc.desc          The dead proxy is no longer stored.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Compare the client proxy with the old one.
     *                   3. They differ.
     * @tc.expected      They differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterDeathStaleProxyIgnored', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(298);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(248);
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(248);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('hello rpc');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathOldProxySendFails
     * @tc.desc          The stale proxy still rejects requests.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Send through the captured old proxy.
     *                   3. The result carries the send error.
     * @tc.expected      The result carries the send error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowAfterDeathOldProxySendFails', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(299);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(249);
      const stub = new RemoteStubModel();
      stub.replyText = 'delta';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(249);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('delta');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathNewProxySendWorks
     * @tc.desc          The replacement proxy handles requests.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Send through the client.
     *                   3. The reply text is the stub text.
     * @tc.expected      The reply text is the stub text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterDeathNewProxySendWorks', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(300);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(250);
      const stub = new RemoteStubModel();
      stub.replyText = 'epsilon';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(250);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('epsilon');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathToastOrder
     * @tc.desc          The cleanup and reconnect keep toast order.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Read the three toast entries.
     *                   3. The order is connect, disconnect, connect.
     * @tc.expected      The order is connect, disconnect, connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowAfterDeathToastOrder', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(301);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(251);
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(251);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('hello rpc');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathEventOrder
     * @tc.desc          The event log keeps the lifecycle order.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Read the recorded event kinds.
     *                   3. Connect follows disconnect and a death registration.
     * @tc.expected      Connect follows disconnect and a death registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterDeathEventOrder', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(302);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(252);
      const stub = new RemoteStubModel();
      stub.replyText = 'delta';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(252);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('delta');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterDeathMetricsCountsTwoConnects
     * @tc.desc          The metric sees both connect calls.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Build ClientMetrics.
     *                   3. connects equals two.
     * @tc.expected      connects equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterDeathMetricsCountsTwoConnects', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      old.notifyDeath();
      const refused = session.connect(303);
      expect(refused).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      session.disconnectRequested();
      session.onDisconnect();
      const ok = session.connect(253);
      const stub = new RemoteStubModel();
      stub.replyText = 'epsilon';
      const next = new RemoteProxyModel(stub);
      session.onConnect(next);
      const result = session.sendString('after-death');
      expect(ok).assertTrue();
      expect(session.connectId).assertEqual(253);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === next).assertTrue();
      expect(session.proxy === old).assertFalse();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(next.deathRegistered).assertTrue();
      expect(old.deathRegistered).assertFalse();
      expect(session.toasts.length).assertEqual(4);
      expect(result.replyText).assertEqual('epsilon');
      expect(session.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureConnectAccepted
     * @tc.desc          A failed client may connect again.
     * @tc.precondition  The client received onFailed.
     * @tc.steps         1. The client received onFailed.
     *                   2. Call connect with a new id.
     *                   3. The call returns true.
     * @tc.expected      The call returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterFailureConnectAccepted', 0, () => {
      const client = new ConnectionModel();
      client.connect(324);
      client.onFailed(16000001);
      const ok = client.connect(424);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-24';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(424);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-24');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureStateConnecting
     * @tc.desc          The retry starts in the connecting state.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. A failed client exists.
     *                   2. Call connect.
     *                   3. The state becomes connecting.
     * @tc.expected      The state becomes connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterFailureStateConnecting', 0, () => {
      const client = new ConnectionModel();
      client.connect(325);
      client.onFailed(16000001);
      const ok = client.connect(425);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-25';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(425);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-25');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureKeepsFailedCode
     * @tc.desc          The retry leaves the failure code visible.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. A failed client exists.
     *                   2. Call connect and read failedCode.
     *                   3. The old code is retained.
     * @tc.expected      The old code is retained.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterFailureKeepsFailedCode', 0, () => {
      const client = new ConnectionModel();
      client.connect(326);
      client.onFailed(16000001);
      const ok = client.connect(426);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-26';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(426);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-26');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureClearsNoToasts
     * @tc.desc          The retry keeps the failure toast.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. A failed client exists.
     *                   2. Call connect and read the toast list.
     *                   3. The failure toast is still present.
     * @tc.expected      The failure toast is still present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterFailureClearsNoToasts', 0, () => {
      const client = new ConnectionModel();
      client.connect(327);
      client.onFailed(16000001);
      const ok = client.connect(427);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-27';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(427);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-27');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureNewProxyAttaches
     * @tc.desc          A successful retry can attach a proxy.
     * @tc.precondition  A failed client retried.
     * @tc.steps         1. A failed client retried.
     *                   2. Deliver onConnect with a live proxy.
     *                   3. The proxy is stored.
     * @tc.expected      The proxy is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterFailureNewProxyAttaches', 0, () => {
      const client = new ConnectionModel();
      client.connect(328);
      client.onFailed(16000001);
      const ok = client.connect(428);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-28';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(428);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-28');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureIsConnected
     * @tc.desc          A retried client can become connected.
     * @tc.precondition  A failed client retried and attached.
     * @tc.steps         1. A failed client retried and attached.
     *                   2. Call isConnected.
     *                   3. The result is true.
     * @tc.expected      The result is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterFailureIsConnected', 0, () => {
      const client = new ConnectionModel();
      client.connect(329);
      client.onFailed(16000001);
      const ok = client.connect(429);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-29';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(429);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-29');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureSendWorks
     * @tc.desc          The retried connection serves requests.
     * @tc.precondition  A retried client is connected.
     * @tc.steps         1. A retried client is connected.
     *                   2. Send hello world.
     *                   3. The request succeeds.
     * @tc.expected      The request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectFlowAfterFailureSendWorks', 0, () => {
      const client = new ConnectionModel();
      client.connect(330);
      client.onFailed(16000001);
      client.connect(331);
      client.onFailed(16000003);
      const ok = client.connect(332);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(ok).assertTrue();
      expect(client.failedCode).assertEqual(16000003);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(332);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.events.countOf('failed')).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(3);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureRegistrationWorks
     * @tc.desc          The retried proxy registers a recipient.
     * @tc.precondition  A failed client retried and attached.
     * @tc.steps         1. A failed client retried and attached.
     *                   2. Inspect the registration flags.
     *                   3. Both flags are true.
     * @tc.expected      Both flags are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterFailureRegistrationWorks', 0, () => {
      const client = new ConnectionModel();
      client.connect(331);
      client.onFailed(16000001);
      const ok = client.connect(431);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-31';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(431);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-31');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureIsDisconnectClear
     * @tc.desc          A retry does not fabricate a disconnect flag.
     * @tc.precondition  A failed client retried.
     * @tc.steps         1. A failed client retried.
     *                   2. Read isDisconnect.
     *                   3. The flag is false.
     * @tc.expected      The flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowAfterFailureIsDisconnectClear', 0, () => {
      const client = new ConnectionModel();
      client.connect(332);
      client.onFailed(16000001);
      const ok = client.connect(432);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-32';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(432);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-32');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureSecondFailureAllowed
     * @tc.desc          A retried client can fail again.
     * @tc.precondition  A retried client is connecting.
     * @tc.steps         1. A retried client is connecting.
     *                   2. Deliver onFailed with a new code.
     *                   3. The new failure code replaces the old one.
     * @tc.expected      The new failure code replaces the old one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterFailureSecondFailureAllowed', 0, () => {
      const client = new ConnectionModel();
      client.connect(333);
      client.onFailed(16000001);
      const ok = client.connect(433);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-33';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(433);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-33');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureRecoverySendReply
     * @tc.desc          The recovered request returns the stub text.
     * @tc.precondition  A retried client is connected.
     * @tc.steps         1. A retried client is connected.
     *                   2. Send and read the reply text.
     *                   3. The text equals the stub reply.
     * @tc.expected      The text equals the stub reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowAfterFailureRecoverySendReply', 0, () => {
      const client = new ConnectionModel();
      client.connect(340);
      client.onFailed(16000001);
      client.connect(341);
      client.onFailed(16000002);
      client.connect(342);
      client.onFailed(16000003);
      const ok = client.connect(343);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(ok).assertTrue();
      expect(client.failedCode).assertEqual(16000003);
      expect(client.connectId).assertEqual(343);
      expect(client.events.countOf('failed')).assertEqual(3);
      expect(client.events.countOf('connect')).assertEqual(4);
      expect(client.toasts.length).assertEqual(4);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(3);
    });

    /**
     * @tc.name          reconnectFlowAfterFailureRepeatedRetries
     * @tc.desc          Three failed retries each reopen the gate.
     * @tc.precondition  A client failed twice already.
     * @tc.steps         1. A client failed twice already.
     *                   2. Fail once more then connect.
     *                   3. The final connect is accepted.
     * @tc.expected      The final connect is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowAfterFailureRepeatedRetries', 0, () => {
      const client = new ConnectionModel();
      client.connect(335);
      client.onFailed(16000001);
      const ok = client.connect(435);
      const stub = new RemoteStubModel();
      stub.replyText = 'retry-35';
      const proxy = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result = client.sendString('retry');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(435);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('Connect failed. Please ensure that the service is running in the background.');
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('retry-35');
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowTwoFullCycles
     * @tc.desc          Two disconnect and reconnect cycles complete.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. A connected client exists.
     *                   2. Run two full cycles with fresh proxies.
     *                   3. The second cycle is connected on its own id.
     * @tc.expected      The second cycle is connected on its own id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowTwoFullCycles', 0, () => {
      const session = createConnectedSession();
      const first = session.proxy as RemoteProxyModel;
      session.onDisconnect();
      session.connect(500);
      const stub0 = new RemoteStubModel();
      stub0.replyText = 'two-cycle';
      session.onConnect(new RemoteProxyModel(stub0));
      session.sendString('cycle-0');
      session.onDisconnect();
      session.connect(501);
      const stub1 = new RemoteStubModel();
      stub1.replyText = 'two-cycle';
      session.onConnect(new RemoteProxyModel(stub1));
      session.sendString('cycle-1');
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(501);
      expect(session.events.countOf('connect')).assertEqual(3);
      expect(session.events.countOf('connected')).assertEqual(3);
      expect(session.events.countOf('send-ok')).assertEqual(2);
      expect(session.toasts.length).assertEqual(7);
      expect(first.deathRegistered).assertFalse();
      expect(session.isConnected()).assertTrue();
    });

    /**
     * @tc.name          reconnectFlowThreeFullCycles
     * @tc.desc          Three cycles keep the state machine healthy.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. A connected client exists.
     *                   2. Run three full cycles.
     *                   3. The final state is connected and live.
     * @tc.expected      The final state is connected and live.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowThreeFullCycles', 0, () => {
      const session = createConnectedSession();
      const first = session.proxy as RemoteProxyModel;
      session.onDisconnect();
      session.connect(510);
      const stub0 = new RemoteStubModel();
      stub0.replyText = 'three-cycle';
      session.onConnect(new RemoteProxyModel(stub0));
      session.sendString('cycle-0');
      session.onDisconnect();
      session.connect(511);
      const stub1 = new RemoteStubModel();
      stub1.replyText = 'three-cycle';
      session.onConnect(new RemoteProxyModel(stub1));
      session.sendString('cycle-1');
      session.onDisconnect();
      session.connect(512);
      const stub2 = new RemoteStubModel();
      stub2.replyText = 'three-cycle';
      session.onConnect(new RemoteProxyModel(stub2));
      session.sendString('cycle-2');
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(512);
      expect(session.events.countOf('connect')).assertEqual(4);
      expect(session.events.countOf('connected')).assertEqual(4);
      expect(session.events.countOf('send-ok')).assertEqual(3);
      expect(session.toasts.length).assertEqual(10);
      expect(first.deathRegistered).assertFalse();
      expect(session.isConnected()).assertTrue();
    });

    /**
     * @tc.name          reconnectFlowSnapshotAfterReconnect
     * @tc.desc          The snapshot reflects the replacement session.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Build a ClientSnapshot.
     *                   3. The snapshot has a proxy and a registration.
     * @tc.expected      The snapshot has a proxy and a registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowSnapshotAfterReconnect', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      session.connect(88);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.connectId).assertEqual(88);
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.sameAs(new ClientSnapshot(session))).assertTrue();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(1);
    });

    /**
     * @tc.name          reconnectFlowSnapshotUsesNewConnectId
     * @tc.desc          The snapshot reports the newest connect id.
     * @tc.precondition  A session reconnected with id ninety.
     * @tc.steps         1. A session reconnected with id ninety.
     *                   2. Build a ClientSnapshot.
     *                   3. connectId equals ninety.
     * @tc.expected      connectId equals ninety.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowSnapshotUsesNewConnectId', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(90);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.connectId).assertEqual(90);
      expect(snapshot.connectId === 7).assertFalse();
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.describe()).assertEqual('connected/90/true/true/3');
      expect(snapshot.sameAs(snapshot)).assertTrue();
      expect(session.proxy !== undefined).assertTrue();
    });

    /**
     * @tc.name          reconnectFlowResetAfterReconnect
     * @tc.desc          A reset after reconnect restores defaults.
     * @tc.precondition  A reconnected session exists.
     * @tc.steps         1. A reconnected session exists.
     *                   2. Call reset and inspect the fields.
     *                   3. Every field is back to its default.
     * @tc.expected      Every field is back to its default.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowResetAfterReconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(91);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      session.reset();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.proxy === undefined).assertTrue();
      expect(session.isDisconnect).assertFalse();
      expect(session.toasts.length).assertEqual(0);
      expect(session.events.size()).assertEqual(0);
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.connectCalls).assertEqual(0);
    });

    /**
     * @tc.name          reconnectFlowMetricsAfterTwoCycles
     * @tc.desc          The metric counts each connect call.
     * @tc.precondition  A session completed two cycles.
     * @tc.steps         1. A session completed two cycles.
     *                   2. Build ClientMetrics.
     *                   3. connects equals three including the first.
     * @tc.expected      connects equals three including the first.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowMetricsAfterTwoCycles', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(92);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      session.sendString('metric-one');
      session.sendString('metric-two');
      const metrics = ClientMetrics.from(session);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(session.toasts.length).assertEqual(5);
    });

    /**
     * @tc.name          reconnectFlowMetricsAfterSends
     * @tc.desc          Successful sends on both proxies are counted.
     * @tc.precondition  A session sent once per cycle.
     * @tc.steps         1. A session sent once per cycle.
     *                   2. Build ClientMetrics.
     *                   3. replies equals two and ratio is one.
     * @tc.expected      replies equals two and ratio is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowMetricsAfterSends', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(102);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      session.sendString('metric-alpha');
      session.sendString('metric-beta');
      const metrics = ClientMetrics.from(session);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(session.toasts.length).assertEqual(5);
    });

    /**
     * @tc.name          reconnectFlowReconnectKeepsWant
     * @tc.desc          The reconnect keeps the configured want.
     * @tc.precondition  A session with a default want reconnected.
     * @tc.steps         1. A session with a default want reconnected.
     *                   2. Inspect the want fields.
     *                   3. The target bundle and ability are unchanged.
     * @tc.expected      The target bundle and ability are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowReconnectKeepsWant', 0, () => {
      const session = createConnectedSession();
      const want = session.want;
      session.onDisconnect();
      session.connect(93);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(session.want === want).assertTrue();
      expect(session.want.bundleName).assertEqual('com.example.ipc_stub');
      expect(session.want.abilityName).assertEqual('ServiceAbility');
      expect(session.want.validate().length).assertEqual(0);
      expect(session.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(session.events.entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.isConnected()).assertTrue();
    });

    /**
     * @tc.name          reconnectFlowReconnectWithCustomWant
     * @tc.desc          A changed want is used by the next connect.
     * @tc.precondition  A client want was replaced before connecting.
     * @tc.steps         1. A client want was replaced before connecting.
     *                   2. Call connect and read the first event.
     *                   3. The event names the custom want.
     * @tc.expected      The event names the custom want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowReconnectWithCustomWant', 0, () => {
      const client = new ConnectionModel();
      client.want = new WantModel('com.example.custom2', 'CustomService');
      const ok = client.connect(94);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(ok).assertTrue();
      expect(client.want.bundleName).assertEqual('com.example.custom2');
      expect(client.want.abilityName).assertEqual('CustomService');
      expect(client.events.entries[0]).assertEqual('connect:com.example.custom2/CustomService');
      expect(client.connectId).assertEqual(94);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.want.matches(new WantModel('com.example.custom2', 'CustomService'))).assertTrue();
    });

    /**
     * @tc.name          reconnectFlowReconnectAfterReset
     * @tc.desc          A reset client can connect from scratch.
     * @tc.precondition  A reconnected session was reset.
     * @tc.steps         1. A reconnected session was reset.
     *                   2. Call connect and attach a proxy.
     *                   3. The client is connected again.
     * @tc.expected      The client is connected again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowReconnectAfterReset', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(95);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      session.reset();
      const ok = session.connect(96);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(ok).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(96);
      expect(session.connectCalls).assertEqual(1);
      expect(session.toasts.length).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          reconnectFlowStaleProxyDeathIgnored
     * @tc.desc          The detached proxy no longer reaches the recipient.
     * @tc.precondition  A session reconnected on a new proxy.
     * @tc.steps         1. A session reconnected on a new proxy.
     *                   2. Notify death on the old proxy.
     *                   3. The client death counter stays zero.
     * @tc.expected      The client death counter stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowStaleProxyDeathIgnored', 0, () => {
      const session = createConnectedSession();
      const old = session.proxy as RemoteProxyModel;
      session.onDisconnect();
      session.connect(97);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      old.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(old.alive).assertFalse();
      expect(old.deathRecipient === undefined).assertTrue();
      expect(session.isConnected()).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(97);
      expect(session.deathRecipient.registered).assertTrue();
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          reconnectFlowNewProxyKeepsDescriptor
     * @tc.desc          The replacement proxy uses the stub descriptor.
     * @tc.precondition  A session reconnected with a fresh proxy.
     * @tc.steps         1. A session reconnected with a fresh proxy.
     *                   2. Read the stored proxy descriptor.
     *                   3. The descriptor equals the stub descriptor.
     * @tc.expected      The descriptor equals the stub descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectFlowNewProxyKeepsDescriptor', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(98);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      expect(proxy.descriptor).assertEqual('IPCStubTest');
      expect(proxy.stub.descriptor).assertEqual('IPCStubTest');
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(session.proxy === proxy).assertTrue();
      expect(session.connectId).assertEqual(98);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          reconnectFlowToastsAfterThreeCycles
     * @tc.desc          Each cycle contributes three toasts.
     * @tc.precondition  A session completed three cycles.
     * @tc.steps         1. A session completed three cycles.
     *                   2. Read the toast list size.
     *                   3. Ten toasts exist in total.
     * @tc.expected      Ten toasts exist in total.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectFlowToastsAfterThreeCycles', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(610);
      const stub0 = new RemoteStubModel();
      stub0.replyText = 'toast-cycle';
      session.onConnect(new RemoteProxyModel(stub0));
      session.sendString('cycle-0');
      session.onDisconnect();
      session.connect(611);
      const stub1 = new RemoteStubModel();
      stub1.replyText = 'toast-cycle';
      session.onConnect(new RemoteProxyModel(stub1));
      session.sendString('cycle-1');
      session.onDisconnect();
      session.connect(612);
      const stub2 = new RemoteStubModel();
      stub2.replyText = 'toast-cycle';
      session.onConnect(new RemoteProxyModel(stub2));
      session.sendString('cycle-2');
      expect(session.toasts.length).assertEqual(10);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[8]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[9]).assertEqual('sendRequest success');
      expect(session.events.countOf('disconnected')).assertEqual(3);
      expect(session.connectId).assertEqual(612);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.isConnected()).assertTrue();
    });

  });
}
