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
 * End-to-end protocol workflow for the IPC client.
 *
 * The production page performs connect -> send request code 1 with
 * 'hello world' -> read 'hello rpc' -> disconnect, and shows one toast per
 * step. SharedDriver mirrors that flow over in-process doubles. This suite
 * walks the whole workflow, its failure branches, reconnect cycles, death
 * notifications, metrics snapshots and event traces, then cross-checks every
 * observable for consistency.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  TARGET_BUNDLE,
  TARGET_ABILITY,
  STUB_DESCRIPTOR,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  ERROR_CONNECT,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  STATE_FAILED,
  INITIAL_CONNECT_ID,
  MessageOptionModel,
  RemoteStubModel,
  RemoteProxyModel,
  ConnectionModel,
  ClientSnapshot,
  ClientMetrics,
  createConnectedSession,
  expectedHandled,
  expectedReplyFor
} from '../Shared/SharedDriver';

/** Arms a one-shot send failure on the session proxy. */
function armFailure(session: ConnectionModel, code: number): boolean {
  const proxy = session.proxy;
  if (proxy === undefined) {
    return false;
  }
  proxy.failNextSend = code;
  return true;
}

/** Sends a request through the client and returns the reply it read. */
function roundTrip(session: ConnectionModel, payload: string): string {
  return session.sendString(payload).readReply();
}

/** Builds a fresh connected client with a private proxy. */
function freshWorkflow(connectId: number): ConnectionModel {
  const client = new ConnectionModel();
  client.connect(connectId);
  client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
  return client;
}

export default function clientProtocol(): void {
  describe('ClientProtocolWorkflow', () => {
    beforeAll(() => {
      logSuite('ClientProtocolWorkflow', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientProtocolWorkflow', 'end');
    });
    /**
     * @tc.name          clientProtocolConnectStartsConnecting
     * @tc.desc          The first workflow step moves the client to connecting.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Read the initial state.
     *                   2. Call connect. 3. Read the new state.
     * @tc.expected      The state changes from disconnected to connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolConnectStartsConnecting', 0, () => {
      const client = new ConnectionModel();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connect(1)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolConnectRecordsWant
     * @tc.desc          The connect step records the target Want description.
     * @tc.precondition  A fresh client with a default Want.
     * @tc.steps         1. Call connect. 2. Read the first event.
     *                   3. Compare with the Want description.
     * @tc.expected      The event is connect:com.example.ipc_stub/ServiceAbility.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolConnectRecordsWant', 0, () => {
      const client = new ConnectionModel();
      client.connect(4);
      expect(client.events.entries[0]).assertEqual('connect:' + TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.events.entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(client.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(client.want.abilityName).assertEqual(TARGET_ABILITY);
      expect(client.want.validate().length).assertEqual(0);
      expect(client.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolOnConnectState
     * @tc.desc          The onConnect callback completes the connection.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect. 2. Deliver a proxy through onConnect.
     *                   3. Read the state and proxy.
     * @tc.expected      The state is connected with the proxy stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolOnConnectState', 0, () => {
      const client = new ConnectionModel();
      client.connect(5);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.isConnected()).assertTrue();
      expect(client.connectId).assertEqual(5);
      expect(client.events.countOf('connected')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolOnConnectRegistersDeath
     * @tc.desc          The connect callback registers the death recipient.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect and deliver onConnect.
     *                   2. Inspect both registration flags.
     *                   3. Read the registration event.
     * @tc.expected      Both flags are true and the event names the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolOnConnectRegistersDeath', 0, () => {
      const client = new ConnectionModel();
      client.connect(6);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.events.entries[1]).assertEqual('death-register:' + STUB_DESCRIPTOR);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
    });

    /**
     * @tc.name          clientProtocolOnConnectToast
     * @tc.desc          The connect callback appends the success toast.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect and deliver onConnect.
     *                   2. Read the toast list.
     *                   3. Compare the message.
     * @tc.expected      One toast exists with the connect-success text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolOnConnectToast', 0, () => {
      const client = new ConnectionModel();
      client.connect(7);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual('connectAbility success');
      expect(client.toasts.indexOf(CONNECT_FAIL_TOAST)).assertEqual(-1);
      expect(client.events.countOf('failed')).assertEqual(0);
      expect(client.state).assertEqual('connected');
    });

    /**
     * @tc.name          clientProtocolRequestWritesPayload
     * @tc.desc          The send step writes 'hello world' into the request.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the default payload.
     *                   2. Inspect the stub received texts.
     *                   3. Compare with the constant.
     * @tc.expected      The stub receives exactly 'hello world'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolRequestWritesPayload', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('hello world');
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolRequestUsesCodeOne
     * @tc.desc          The send step always uses request code 1.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Read the recorded request code.
     *                   3. Compare with the constant and the oracle.
     * @tc.expected      The code is 1 and the oracle accepts it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolRequestUsesCodeOne', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      const recorded = session.proxy?.requests[0];
      expect(recorded).assertEqual(REQUEST_CODE);
      expect(expectedHandled(recorded === undefined ? 0 : recorded)).assertTrue();
      expect(session.proxy?.stub.handledCodes[0]).assertEqual(1);
      expect(session.proxy?.requests.length).assertEqual(1);
      expect(session.proxy?.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolReplyIsHelloRpc
     * @tc.desc          The reply step reads 'hello rpc' from the result.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload. 2. Read the reply.
     *                   3. Compare with the oracle.
     * @tc.expected      The reply is 'hello rpc' and matches expectedReplyFor(1).
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolReplyIsHelloRpc', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const reply = result.readReply();
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply).assertEqual('hello rpc');
      expect(reply).assertEqual(expectedReplyFor(REQUEST_CODE));
      expect(reply.length).assertEqual(9);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(1);
      expect(reply === REQUEST_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name          clientProtocolRoundTripHelper
     * @tc.desc          The workflow helper returns the reply in one call.
     * @tc.precondition  A connected session and the roundTrip helper.
     * @tc.steps         1. Call the helper with the sample payload.
     *                   2. Compare the returned text.
     *                   3. Confirm the stub stored the payload.
     * @tc.expected      The helper returns 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolRoundTripHelper', 0, () => {
      const session = createConnectedSession();
      const reply = roundTrip(session, REQUEST_PAYLOAD);
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply).assertEqual('hello rpc');
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.requests.length).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          clientProtocolSuccessToast
     * @tc.desc          The successful send appends the send-success toast.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Read the toast list.
     *                   3. Compare the last item.
     * @tc.expected      The second toast is 'sendRequest success'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolSuccessToast', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.lastToast()).assertEqual('sendRequest success');
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
    });

    /**
     * @tc.name          clientProtocolSuccessEvent
     * @tc.desc          The successful send records send-ok with the reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Read the last event. 3. Count send-ok events.
     * @tc.expected      The last event is send-ok:hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolSuccessEvent', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.events.size()).assertEqual(4);
      expect(session.events.entries[3]).assertEqual('send-ok:hello rpc');
      expect(session.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          clientProtocolSuccessLog
     * @tc.desc          The successful send logs the reply text at INFO level.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Search the log for the reply.
     *                   3. Count INFO and ERROR lines.
     * @tc.expected      The log contains 'reply hello rpc' with no ERROR line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolSuccessLog', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.logs.countLevel('INFO')).assertEqual(3);
      expect(session.logs.lines[session.logs.lines.length - 1]).assertEqual('INFO reply hello rpc');
      expect(session.logs.size()).assertEqual(3);
      expect(session.logs.contains('onConnect')).assertTrue();
    });

    /**
     * @tc.name          clientProtocolDisconnectToast
     * @tc.desc          The disconnect callback appends the disconnect-success toast.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Call onDisconnect.
     *                   2. Read the last toast.
     *                   3. Compare the count.
     * @tc.expected      The last toast is 'disconnectAbility success'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolDisconnectToast', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[1]).assertEqual('disconnectAbility success');
      expect(session.toasts.indexOf(SEND_SUCCESS_TOAST)).assertEqual(-1);
      expect(session.isDisconnect).assertTrue();
      expect(session.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          clientProtocolDisconnectState
     * @tc.desc          The disconnect callback restores the initial state.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Call onDisconnect.
     *                   2. Read state, id and proxy.
     *                   3. Compare with the initial constants.
     * @tc.expected      The state is disconnected, the id is -1 and the proxy is gone.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolDisconnectState', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.proxy === undefined).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolDisconnectUnregistersDeath
     * @tc.desc          Disconnect removes the death recipient from the proxy.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Capture the proxy.
     *                   2. Call onDisconnect. 3. Inspect the proxy flags.
     * @tc.expected      The proxy has no recipient and reports unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDisconnectUnregistersDeath', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy;
      expect(proxy?.deathRegistered).assertTrue();
      session.onDisconnect();
      expect(proxy?.deathRegistered).assertFalse();
      expect(proxy?.deathRecipient === undefined).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy?.alive).assertTrue();
      expect(proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientProtocolDisconnectEvent
     * @tc.desc          Disconnect appends exactly one disconnected event.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Call onDisconnect.
     *                   2. Read the event trace.
     *                   3. Compare the last entry.
     * @tc.expected      The trace ends with 'disconnected:ok'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolDisconnectEvent', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.events.last()).assertEqual('disconnected:ok');
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.size()).assertEqual(4);
      expect(session.events.entries[3]).assertEqual('disconnected:ok');
      expect(session.events.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name          clientProtocolFullFlowEvents
     * @tc.desc          The full connect-send-disconnect flow has six events.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Disconnect. 3. Read the event trace.
     * @tc.expected      The trace is connect, register, connected, send-ok, disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolFullFlowEvents', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      const entries = session.events.entries;
      expect(entries.length).assertEqual(5);
      expect(entries[0].startsWith('connect:')).assertTrue();
      expect(entries[1]).assertEqual('death-register:IPCStubTest');
      expect(entries[2]).assertEqual('connected:IPCStubTest');
      expect(entries[3]).assertEqual('send-ok:hello rpc');
      expect(entries[4]).assertEqual('disconnected:ok');
      expect(session.events.size()).assertEqual(5);
    });

    /**
     * @tc.name          clientProtocolFullFlowToasts
     * @tc.desc          The full flow yields three toasts in order.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Disconnect. 3. Read all toasts.
     * @tc.expected      The toasts are connect, send and disconnect successes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolFullFlowToasts', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(session.lastToast()).assertEqual('disconnectAbility success');
    });

    /**
     * @tc.name          clientProtocolFullFlowSnapshot
     * @tc.desc          The final snapshot of the full flow is disconnected.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send and disconnect.
     *                   2. Take a snapshot. 3. Read every field.
     * @tc.expected      The snapshot reports disconnected, -1, no proxy, no registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolFullFlowSnapshot', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/3');
    });

    /**
     * @tc.name          clientProtocolFullFlowMetrics
     * @tc.desc          The full flow metrics show one send and one reply.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send and disconnect.
     *                   2. Build metrics. 3. Read the counters.
     * @tc.expected      One connect, one send, one reply and a full ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolFullFlowMetrics', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      const metrics = ClientMetrics.from(session);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          clientProtocolSendBeforeConnect
     * @tc.desc          Sending before connecting takes the invalid proxy path.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Send without connecting.
     *                   2. Read errCode and toast.
     *                   3. Inspect the events.
     * @tc.expected      The errCode is 16000004 and the failure toast appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolSendBeforeConnect', 0, () => {
      const client = new ConnectionModel();
      const result = client.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.last()).assertEqual('send-no-proxy:' + REQUEST_PAYLOAD);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
    });

    /**
     * @tc.name          clientProtocolSendAfterDisconnect
     * @tc.desc          Sending after a full flow fails with the invalid proxy code.
     * @tc.precondition  A session that already disconnected.
     * @tc.steps         1. Disconnect. 2. Send the payload.
     *                   3. Read the result and snapshot.
     * @tc.expected      The errCode is 16000004 with no request recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolSendAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(session.proxy === undefined).assertTrue();
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(new ClientSnapshot(session).hasProxy).assertFalse();
      expect(session.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          clientProtocolConnectRefusedWhileConnected
     * @tc.desc          A second connect while connected is refused.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Call connect again.
     *                   2. Inspect the return value and state.
     *                   3. Read the warning log.
     * @tc.expected      The call returns false and leaves the session connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolConnectRefusedWhileConnected', 0, () => {
      const session = createConnectedSession();
      expect(session.connect(88)).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      expect(session.connectCalls).assertEqual(2);
      expect(session.logs.countLevel('WARN')).assertEqual(1);
      expect(session.logs.contains('connect skipped in state connected')).assertTrue();
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientProtocolReconnectFlow
     * @tc.desc          A disconnect-reconnect cycle repeats the full workflow.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send once and disconnect.
     *                   2. Reconnect with a new proxy.
     *                   3. Send again and read the reply.
     * @tc.expected      The second cycle replies with 'hello rpc' on a fresh proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolReconnectFlow', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      session.connect(70);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(70);
      expect(proxy.requests.length).assertEqual(1);
      expect(session.events.countOf('connected')).assertEqual(2);
    });

    /**
     * @tc.name          clientProtocolFailureFlow
     * @tc.desc          The onFailed branch records the failed connect workflow.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect. 2. Deliver onFailed with 16000001.
     *                   3. Read state, code and toasts.
     * @tc.expected      The state is failed with the code and the failure toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolFailureFlow', 0, () => {
      const client = new ConnectionModel();
      client.connect(3);
      client.onFailed(ERROR_CONNECT);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.events.last()).assertEqual('failed:16000001');
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.contains('onFailed code 16000001')).assertTrue();
    });

    /**
     * @tc.name          clientProtocolFailureSnapshot
     * @tc.desc          The failed workflow snapshot has no proxy or registration.
     * @tc.precondition  A client that failed once.
     * @tc.steps         1. Deliver onFailed. 2. Snapshot.
     *                   3. Read the description.
     * @tc.expected      The snapshot reports failed with no proxy and one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolFailureSnapshot', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(ERROR_CONNECT);
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual('failed');
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.describe()).assertEqual('failed/-1/false/false/1');
    });

    /**
     * @tc.name          clientProtocolFailureThenConnect
     * @tc.desc          A failed client can start a second connect cycle.
     * @tc.precondition  A client that failed once.
     * @tc.steps         1. Fail. 2. Connect with id 44.
     *                   3. Deliver onConnect and send.
     * @tc.expected      The workflow recovers and the reply arrives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolFailureThenConnect', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(ERROR_CONNECT);
      expect(client.connect(44)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolDeathNotifyFlow
     * @tc.desc          Remote death marks the proxy dead and notifies the recipient.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Notify death through the proxy.
     *                   2. Read the recipient counter.
     *                   3. Read the connection predicate.
     * @tc.expected      The recipient counted one death and isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDeathNotifyFlow', 0, () => {
      const session = createConnectedSession();
      session.proxy?.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.deathRecipient.describe()).assertEqual('1/true');
      expect(session.proxy?.isAlive()).assertFalse();
      expect(session.isConnected()).assertFalse();
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          clientProtocolDeathThenSend
     * @tc.desc          Sending after remote death fails with ERROR_SEND.
     * @tc.precondition  A default connected session after a death notification.
     * @tc.steps         1. Notify death. 2. Send the payload.
     *                   3. Read the result and toast.
     * @tc.expected      The errCode is 16000003 with the failure toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDeathThenSend', 0, () => {
      const session = createConnectedSession();
      session.proxy?.notifyDeath();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.logs.contains('16000003')).assertTrue();
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolSendFailureFlow
     * @tc.desc          An injected send failure yields the documented failure state.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Arm ERROR_SEND. 2. Send the payload.
     *                   3. Read result, toast, log and event.
     * @tc.expected      All failure observables agree on errCode 16000003.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolSendFailureFlow', 0, () => {
      const session = createConnectedSession();
      expect(armFailure(session, ERROR_SEND)).assertTrue();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(16000003);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.logs.contains('errCode is 16000003')).assertTrue();
      expect(session.events.last()).assertEqual('send-failed:16000003');
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(ClientMetrics.from(session).failures).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolMultiRoundTrip
     * @tc.desc          Three sequential round trips all return the fixed reply.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send three payloads.
     *                   2. Read each reply. 3. Compare them.
     * @tc.expected      All replies are 'hello rpc' and all texts are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolMultiRoundTrip', 0, () => {
      const session = createConnectedSession();
      const first = roundTrip(session, 'round one');
      const second = roundTrip(session, 'round two');
      const third = roundTrip(session, 'round three');
      expect(first).assertEqual(REPLY_PAYLOAD);
      expect(second).assertEqual(REPLY_PAYLOAD);
      expect(third).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(3);
      expect(session.proxy?.stub.receivedTexts[2]).assertEqual('round three');
      expect(session.toasts.length).assertEqual(4);
    });

    /**
     * @tc.name          clientProtocolMultiRoundMetrics
     * @tc.desc          Three round trips produce three counted replies.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send three payloads.
     *                   2. Build metrics. 3. Compare the counters.
     * @tc.expected      Sends and replies are three with zero failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolMultiRoundMetrics', 0, () => {
      const session = createConnectedSession();
      session.sendString('a');
      session.sendString('b');
      session.sendString('c');
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(3);
      expect(session.proxy?.sendCalls).assertEqual(3);
      expect(session.proxy?.requests.join(',')).assertEqual('1,1,1');
    });

    /**
     * @tc.name          clientProtocolEventCountPerRound
     * @tc.desc          Each round trip appends exactly one event.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Record the event size.
     *                   2. Send two payloads.
     *                   3. Compare the size and the entries.
     * @tc.expected      The size grows by two and the entries are send-ok.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolEventCountPerRound', 0, () => {
      const session = createConnectedSession();
      const before = session.events.size();
      session.sendString('x');
      session.sendString('y');
      expect(session.events.size()).assertEqual(before + 2);
      expect(session.events.countOf('send-ok')).assertEqual(2);
      expect(session.events.entries[3]).assertEqual('send-ok:hello rpc');
      expect(session.events.entries[4]).assertEqual('send-ok:hello rpc');
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.events.countOf('connected')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolRepeatedDisconnect
     * @tc.desc          A second disconnect after the flow is harmless.
     * @tc.precondition  A disconnected session.
     * @tc.steps         1. Disconnect once. 2. Disconnect again.
     *                   3. Compare the event and toast counts.
     * @tc.expected      Two disconnected events and four toasts accumulate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolRepeatedDisconnect', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(4);
      expect(session.toasts[3]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.events.countOf('disconnected')).assertEqual(2);
      expect(session.proxy === undefined).assertTrue();
      expect(session.connectId).assertEqual(-1);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          clientProtocolSnapshotAfterEachRound
     * @tc.desc          Snapshots taken per round change only the toast count.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Snapshot before sending.
     *                   2. Send and snapshot. 3. Send again and snapshot.
     * @tc.expected      The toast counts follow 1, 2, 3 with the same flags.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolSnapshotAfterEachRound', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      session.sendString('one');
      const afterOne = new ClientSnapshot(session);
      session.sendString('two');
      const afterTwo = new ClientSnapshot(session);
      expect(before.toastCount).assertEqual(1);
      expect(afterOne.toastCount).assertEqual(2);
      expect(afterTwo.toastCount).assertEqual(3);
      expect(before.state).assertEqual(afterTwo.state);
      expect(before.deathRegistered).assertEqual(afterTwo.deathRegistered);
      expect(afterOne.sameAs(afterTwo)).assertFalse();
    });

    /**
     * @tc.name          clientProtocolFinalWorkflowSummary
     * @tc.desc          Final cross-check of the whole documented workflow.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Connect, send, read and disconnect.
     *                   2. Collect every observable.
     *                   3. Verify they agree.
     * @tc.expected      The workflow produces one request, one reply and three toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolFinalWorkflowSummary', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.toasts.length).assertEqual(3);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(ClientMetrics.from(session).replies).assertEqual(1);
      expect(new ClientSnapshot(session).state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          clientProtocolConnectOnlyWorkflow
     * @tc.desc          A connect-only workflow stops in the connected state.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Connect with id 15.
     *                   2. Deliver onConnect. 3. Read state and counters.
     * @tc.expected      The client is connected with one connect event and no sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolConnectOnlyWorkflow', 0, () => {
      const client = freshWorkflow(15);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(15);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.proxy?.sendCalls).assertEqual(0);
      expect(ClientMetrics.from(client).sends).assertEqual(0);
    });

    /**
     * @tc.name          clientProtocolConnectThenDisconnect
     * @tc.desc          A connect-then-disconnect cycle leaves a clean state.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Build the workflow with id 16.
     *                   2. Disconnect. 3. Read the toasts and events.
     * @tc.expected      Two toasts and four events with the id reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolConnectThenDisconnect', 0, () => {
      const client = freshWorkflow(16);
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.size()).assertEqual(4);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.connectId).assertEqual(-1);
      expect(client.isDisconnect).assertTrue();
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          clientProtocolSendTwiceThenDisconnect
     * @tc.desc          Two sends then a disconnect keep the order of observables.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send two payloads.
     *                   2. Disconnect. 3. Read the trace.
     * @tc.expected      The trace ends with send-ok, send-ok, disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolSendTwiceThenDisconnect', 0, () => {
      const session = createConnectedSession();
      session.sendString('first');
      session.sendString('second');
      const proxy = session.proxy as RemoteProxyModel;
      session.onDisconnect();
      const entries = session.events.entries;
      expect(entries.length).assertEqual(6);
      expect(entries[3]).assertEqual('send-ok:hello rpc');
      expect(entries[4]).assertEqual('send-ok:hello rpc');
      expect(entries[5]).assertEqual('disconnected:ok');
      expect(session.toasts.length).assertEqual(4);
      expect(proxy.stub.receivedTexts.join(',')).assertEqual('first,second');
      expect(session.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          clientProtocolMetricsAfterDisconnect
     * @tc.desc          Disconnect does not erase accumulated send metrics.
     * @tc.precondition  A session after two sends and a disconnect.
     * @tc.steps         1. Send twice and disconnect.
     *                   2. Build metrics. 3. Compare replies and ratio.
     * @tc.expected      The metrics keep two replies and a full ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolMetricsAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(2);
      expect(session.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          clientProtocolTraceAfterReconnect
     * @tc.desc          Reconnecting appends a second connect group to the trace.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Disconnect and reconnect with id 31.
     *                   2. Read the trace.
     *                   3. Count connect and connected events.
     * @tc.expected      Two connect and two connected events exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolTraceAfterReconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(31);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.size()).assertEqual(7);
      expect(session.events.entries[6]).assertEqual('connected:IPCStubTest');
      expect(session.connectId).assertEqual(31);
      expect(session.state).assertEqual('connected');
    });

    /**
     * @tc.name          clientProtocolIdSequence
     * @tc.desc          Connect ids follow the supplied values across cycles.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Connect with 100 and disconnect.
     *                   2. Connect with 200. 3. Compare the ids.
     * @tc.expected      The ids change from 100 to -1 to 200.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolIdSequence', 0, () => {
      const client = new ConnectionModel();
      client.connect(100);
      expect(client.connectId).assertEqual(100);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.onDisconnect();
      expect(client.connectId).assertEqual(-1);
      client.connect(200);
      expect(client.connectId).assertEqual(200);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.state).assertEqual('connecting');
    });

    /**
     * @tc.name          clientProtocolFailThenSuccessFlow
     * @tc.desc          A failed send followed by a good one recovers the flow.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Arm a failure and send.
     *                   2. Send again. 3. Compare both results.
     * @tc.expected      The first fails, the second replies and the ratio is half.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolFailThenSuccessFlow', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      const failed = session.sendString(REQUEST_PAYLOAD);
      const recovered = session.sendString(REQUEST_PAYLOAD);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.isSuccess()).assertTrue();
      expect(recovered.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(ClientMetrics.from(session).successRatio()).assertEqual(0.5);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolStubReviveFlow
     * @tc.desc          Killing then reviving the stub allows the flow to resume.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Kill the stub and send.
     *                   2. Revive the stub and send.
     *                   3. Compare the two results.
     * @tc.expected      The first fails and the second replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolStubReviveFlow', 0, () => {
      const session = createConnectedSession();
      session.proxy?.stub.kill();
      const down = session.sendString(REQUEST_PAYLOAD);
      expect(down.errCode).assertEqual(ERROR_SEND);
      session.proxy?.stub.revive();
      const up = session.sendString(REQUEST_PAYLOAD);
      expect(up.errCode).assertEqual(ERROR_NONE);
      expect(up.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.stub.requestCount()).assertEqual(2);
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          clientProtocolOptionDefaultInFlow
     * @tc.desc          The workflow uses a default synchronous option.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Compare the option defaults.
     *                   3. Confirm the send succeeded.
     * @tc.expected      The default option is sync and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolOptionDefaultInFlow', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const option = new MessageOptionModel();
      expect(option.flags).assertEqual(0);
      expect(option.waitTime).assertEqual(0);
      expect(option.isSync()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolReplyCursorFlow
     * @tc.desc          The reply cursor moves once during the read step.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send and capture the result.
     *                   2. Read the reply. 3. Inspect the cursor.
     * @tc.expected      The cursor moves from zero to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolReplyCursorFlow', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.readCount).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.reply.trace()).assertEqual('hello rpc#1');
    });

    /**
     * @tc.name          clientProtocolDataReclaimFlow
     * @tc.desc          The send step reclaims its transport buffers.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Read the result reply.
     *                   3. Confirm the result stays readable.
     * @tc.expected      The result reply is readable after the transport reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDataReclaimFlow', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.reply.size()).assertEqual(1);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolMetricsFailureMix
     * @tc.desc          A mixed run reports the correct metric split.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send successfully, fail, then succeed.
     *                   2. Build metrics. 3. Compare every counter.
     * @tc.expected      Three sends, two replies and one failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolMetricsFailureMix', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(2 / 3);
      expect(session.proxy?.sendCalls).assertEqual(3);
      expect(session.toasts.length).assertEqual(4);
    });

    /**
     * @tc.name          clientProtocolTwoSessionsIndependent
     * @tc.desc          Two full workflows do not share state.
     * @tc.precondition  Two connected sessions.
     * @tc.steps         1. Send on both.
     *                   2. Disconnect only the first.
     *                   3. Compare both states.
     * @tc.expected      The second stays connected and can still send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolTwoSessionsIndependent', 0, () => {
      const first = createConnectedSession();
      const second = createConnectedSession();
      first.sendString('first');
      second.sendString('second');
      first.onDisconnect();
      expect(first.state).assertEqual('disconnected');
      expect(second.state).assertEqual('connected');
      expect(first.proxy === undefined).assertTrue();
      expect(second.proxy === undefined).assertFalse();
      const result = second.sendString('third');
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(second.proxy?.stub.receivedTexts.length).assertEqual(2);
    });

    /**
     * @tc.name          clientProtocolStubTextOrder
     * @tc.desc          Request payloads reach the stub in send order.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send four distinct payloads.
     *                   2. Read the stub text list.
     *                   3. Compare the joined order.
     * @tc.expected      The texts are one, two, three, four in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolStubTextOrder', 0, () => {
      const session = createConnectedSession();
      session.sendString('one');
      session.sendString('two');
      session.sendString('three');
      session.sendString('four');
      const texts = session.proxy?.stub.receivedTexts;
      expect(texts?.length).assertEqual(4);
      expect(texts?.join(',')).assertEqual('one,two,three,four');
      expect(texts?.length).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('one');
      expect(session.proxy?.stub.receivedTexts[3]).assertEqual('four');
      expect(session.proxy?.requests.join(',')).assertEqual('1,1,1,1');
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          clientProtocolReconnectMetrics
     * @tc.desc          Metrics count connections across a reconnect cycle.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Disconnect and reconnect.
     *                   2. Send once. 3. Build metrics.
     * @tc.expected      Two connects, one send and one reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolReconnectMetrics', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(12);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.size()).assertEqual(8);
    });

    /**
     * @tc.name          clientProtocolDeathRecipientDescribe
     * @tc.desc          The recipient description tracks the death counter.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Read the description.
     *                   2. Notify death. 3. Read it again.
     * @tc.expected      The description changes from '0/true' to '1/true'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDeathRecipientDescribe', 0, () => {
      const session = createConnectedSession();
      expect(session.deathRecipient.describe()).assertEqual('0/true');
      session.proxy?.notifyDeath();
      expect(session.deathRecipient.describe()).assertEqual('1/true');
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.deathRecipient.registered).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.events.countOf('connected')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolDisconnectRequestFlow
     * @tc.desc          The disconnect request is accepted during a live flow.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send once.
     *                   2. Call disconnectRequested.
     *                   3. Inspect the event.
     * @tc.expected      The request returns true with the current connect id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDisconnectRequestFlow', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.disconnectRequested()).assertTrue();
      expect(session.events.last()).assertEqual('disconnect-request:7');
      expect(session.events.countOf('disconnect-request')).assertEqual(1);
      expect(session.connectId).assertEqual(7);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.state).assertEqual('connected');
    });

    /**
     * @tc.name          clientProtocolConnectIdInitialConstant
     * @tc.desc          The initial connect id is minus one.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Read the id. 2. Compare with the constant.
     *                   3. Confirm the disconnect request is refused.
     * @tc.expected      The id is -1 and the request is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProtocolConnectIdInitialConstant', 0, () => {
      const client = new ConnectionModel();
      expect(INITIAL_CONNECT_ID).assertEqual(-1);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
    });

    /**
     * @tc.name          clientProtocolResetFlow
     * @tc.desc          Reset returns a worked session to pristine defaults.
     * @tc.precondition  A session after a full flow.
     * @tc.steps         1. Send and disconnect. 2. Reset.
     *                   3. Read every field.
     * @tc.expected      The session is indistinguishable from a fresh client.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolResetFlow', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      session.reset();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(-1);
      expect(session.proxy === undefined).assertTrue();
      expect(session.events.size()).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.toasts.length).assertEqual(0);
      expect(session.connectCalls).assertEqual(0);
    });

    /**
     * @tc.name          clientProtocolDisconnectedSendMetrics
     * @tc.desc          A post-disconnect send is invisible to metrics.
     * @tc.precondition  A disconnected session.
     * @tc.steps         1. Disconnect. 2. Send twice.
     *                   3. Build metrics.
     * @tc.expected      The metrics remain at zero sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDisconnectedSendMetrics', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(session.events.countOf('send-no-proxy')).assertEqual(2);
      expect(session.toasts.length).assertEqual(4);
      expect(session.logs.countLevel('ERROR')).assertEqual(2);
    });

    /**
     * @tc.name          clientProtocolDeepTraceOrder
     * @tc.desc          A two-cycle workflow has a deterministic trace order.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Connect, send, disconnect, reconnect, send.
     *                   2. Read the trace.
     *                   3. Compare the entry kinds.
     * @tc.expected      The trace follows connect, connected, send, disconnected, connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolDeepTraceOrder', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      session.connect(90);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const entries = session.events.entries;
      expect(entries.length).assertEqual(8);
      expect(entries[0].startsWith('connect:')).assertTrue();
      expect(entries[2]).assertEqual('connected:IPCStubTest');
      expect(entries[3]).assertEqual('send-ok:hello rpc');
      expect(entries[4]).assertEqual('disconnected:ok');
      expect(entries[5].startsWith('connect:')).assertTrue();
      expect(entries[7]).assertEqual('connected:IPCStubTest');
    });

    /**
     * @tc.name          clientProtocolToastSequence
     * @tc.desc          A two-cycle workflow follows a deterministic toast sequence.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send and disconnect.
     *                   2. Reconnect and send.
     *                   3. Compare the toast list.
     * @tc.expected      The toasts are connect, send, disconnect, connect, send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProtocolToastSequence', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      session.connect(91);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      session.sendString(REQUEST_PAYLOAD);
      expect(session.toasts.length).assertEqual(5);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.toasts[3]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[4]).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
    });

    /**
     * @tc.name          clientProtocolClosingCheck
     * @tc.desc          Final closing check of the documented workflow contract.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Confirm the target want.
     *                   2. Confirm the request, reply and reply text.
     *                   3. Confirm the clean disconnect.
     * @tc.expected      Every documented workflow fact holds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolClosingCheck', 0, () => {
      const session = createConnectedSession();
      expect(session.want.bundleName).assertEqual('com.example.ipc_stub');
      expect(session.want.abilityName).assertEqual('ServiceAbility');
      const result = session.sendString('hello world');
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual('hello rpc');
      expect(session.proxy?.requests[0]).assertEqual(1);
      session.onDisconnect();
      expect(session.state).assertEqual('disconnected');
      expect(session.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          clientProtocolConnectOnlyMetrics
     * @tc.desc          A connect-only client reports connect but no traffic.
     * @tc.precondition  A freshly connected client.
     * @tc.steps         1. Build the workflow.
     *                   2. Build metrics.
     *                   3. Compare connects and sends.
     * @tc.expected      One connect, zero sends and a zero ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolConnectOnlyMetrics', 0, () => {
      const client = freshWorkflow(61);
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.proxy?.sendCalls).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientProtocolMessageSequenceLengths
     * @tc.desc          Request and reply carry exactly one value each.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send the payload.
     *                   2. Inspect the stub text count.
     *                   3. Inspect the reply count.
     * @tc.expected      One request value and one reply value exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProtocolMessageSequenceLengths', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.writeCount).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
    });

  });
}
