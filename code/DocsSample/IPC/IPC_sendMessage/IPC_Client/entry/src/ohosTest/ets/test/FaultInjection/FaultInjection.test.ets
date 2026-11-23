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
 * FaultInjection: connect, send, proxy and death faults.
 *
 * The production callbacks are onConnect, onDisconnect and onFailed; a send
 * can fail because the proxy is absent, because the stub is dead, or because
 * sendMessageRequest returns a non-zero errCode. This suite injects each of
 * those faults through the shared models and checks the observable recovery.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  DISCONNECT_FAIL_TOAST,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_FAILED,
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_DISCONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  ERROR_DEATH_REGISTER,
  LEVEL_ERROR,
  LEVEL_WARN,
  ClientMetrics,
  RequestResultModel,
  RemoteStubModel,
  RemoteProxyModel,
  DeathRecipientModel,
  ConnectionModel,
  MessageSequenceModel,
  MessageOptionModel,
  createConnectedSession,
  expectedStateAfter,
  expectedToastFor,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

function freshClient(): ConnectionModel {
  return new ConnectionModel();
}

function connectedClient(reply: string): ConnectionModel {
  const stub = new RemoteStubModel();
  stub.replyText = reply;
  const proxy = new RemoteProxyModel(stub);
  const client = new ConnectionModel();
  client.connect(11);
  client.onConnect(proxy);
  return client;
}

function lastEventKind(client: ConnectionModel): string {
  const last = client.events.last();
  const index = last.indexOf(':');
  return index < 0 ? last : last.substring(0, index);
}

export default function faultInjection(): void {
  describe('FaultInjection', () => {
    beforeAll(() => {
      logSuite('FaultInjection', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('FaultInjection', 'end');
    });

    /**
     * @tc.name          faultInjectionConnectFailureStopsTheSession
     * @tc.desc          onFailed records a failure state and a failure toast.
     * @tc.precondition  A fresh client is in the disconnected state.
     * @tc.steps         1. Start a connect. 2. Deliver onFailed(16000001).
     *                   3. Inspect state, code and toast.
     * @tc.expected      State is failed, the code is recorded and one toast fires.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionConnectFailureStopsTheSession', 0, () => {
      logStep('faultInjection', 'connect failure');
      const client = freshClient();
      expect(client.connect(5)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast()).assertEqual(expectedToastFor('connect-fail'));
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          faultInjectionSendWithoutProxyFailsFast
     * @tc.desc          Sending before connect returns the invalid proxy error.
     * @tc.precondition  A fresh client has no proxy.
     * @tc.steps         1. Call sendString. 2. Inspect the result and toast.
     *                   3. Confirm no proxy request was attempted.
     * @tc.expected      errCode is 16000004 and the send failure toast fires.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionSendWithoutProxyFailsFast', 0, () => {
      logStep('faultInjection', 'send without proxy');
      const client = freshClient();
      const result = client.sendString('hello world');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.readReply()).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(lastEventKind(client)).assertEqual('send-no-proxy');
    });

    /**
     * @tc.name          faultInjectionDeadProxyRejectsTheSend
     * @tc.desc          A killed proxy returns the send error without a reply.
     * @tc.precondition  A connected session owns a live proxy.
     * @tc.steps         1. Kill the stub. 2. Send a payload. 3. Read the result.
     * @tc.expected      errCode is 16000003, the reply is empty and no reply toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionDeadProxyRejectsTheSend', 0, () => {
      logStep('faultInjection', 'dead proxy');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.stub.kill();
      const result = client.sendString('hello world');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.errCode).assertEqual(16000003);
      expect(result.reply.size()).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
    });

    /**
     * @tc.name          faultInjectionTransientSendErrorIsConsumed
     * @tc.desc          failNextSend fails exactly one request and then clears.
     * @tc.precondition  A connected session owns a live proxy.
     * @tc.steps         1. Arm failNextSend. 2. Send twice. 3. Compare results.
     * @tc.expected      The first send fails, the second succeeds, the arm resets.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionTransientSendErrorIsConsumed', 0, () => {
      logStep('faultInjection', 'transient send error');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const first = client.sendString('first');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const second = client.sendString('second');
      expect(second.errCode).assertEqual(ERROR_NONE);
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          faultInjectionDeathNotificationReachesRecipient
     * @tc.desc          notifyDeath wakes the registered death recipient once.
     * @tc.precondition  A connected session registered its death recipient.
     * @tc.steps         1. Read the recipient counter. 2. Notify death.
     *                   3. Confirm the proxy is dead and the counter advanced.
     * @tc.expected      diedCount is 1 and isConnected becomes false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionDeathNotificationReachesRecipient', 0, () => {
      logStep('faultInjection', 'death notification');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.deathRecipient.registered).assertTrue();
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      const again = client.sendString('after death');
      expect(again.errCode).assertEqual(ERROR_SEND);
    });

    /**
     * @tc.name          faultInjectionDisconnectWithoutConnectIdIsRefused
     * @tc.desc          A disconnect with no connect id logs an error and fails.
     * @tc.precondition  A fresh client keeps connectId at minus one.
     * @tc.steps         1. Call disconnectRequested. 2. Inspect the boolean.
     *                   3. Inspect the error log and event trail.
     * @tc.expected      The request is refused with one error log and no event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionDisconnectWithoutConnectIdIsRefused', 0, () => {
      logStep('faultInjection', 'disconnect without id');
      const client = freshClient();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          faultInjectionDisconnectWithConnectIdIsRecorded
     * @tc.desc          A valid disconnect request records its connect id.
     * @tc.precondition  A client has started a connect with id three.
     * @tc.steps         1. Start connect(3). 2. Request disconnect. 3. Read the
     *                   last event.
     * @tc.expected      The request succeeds and the event carries id three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionDisconnectWithConnectIdIsRecorded', 0, () => {
      logStep('faultInjection', 'disconnect with id');
      const client = freshClient();
      expect(client.connect(3)).assertTrue();
      expect(client.connectId).assertEqual(3);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:3');
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          faultInjectionOnDisconnectClearsProxyState
     * @tc.desc          onDisconnect drops the proxy and restores the sentinel id.
     * @tc.precondition  A connected session owns a proxy and death recipient.
     * @tc.steps         1. Call onDisconnect. 2. Inspect proxy and connectId.
     *                   3. Inspect the death flag and the toast.
     * @tc.expected      Proxy is gone, id is minus one and the death flag is set.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionOnDisconnectClearsProxyState', 0, () => {
      logStep('faultInjection', 'onDisconnect clears');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      expect(proxy.deathRegistered).assertTrue();
      client.onDisconnect();
      expect(client.proxy === undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          faultInjectionConnectIsRejectedWhileConnecting
     * @tc.desc          A second connect while connecting is refused.
     * @tc.precondition  A client has started a connect but has no proxy.
     * @tc.steps         1. Connect once. 2. Connect again. 3. Inspect counters
     *                   and logs.
     * @tc.expected      The second call returns false and logs a skip warning.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionConnectIsRejectedWhileConnecting', 0, () => {
      logStep('faultInjection', 'connect while connecting');
      const client = freshClient();
      expect(client.connect(1)).assertTrue();
      expect(client.connect(2)).assertFalse();
      expect(client.connectCalls).assertEqual(2);
      expect(client.connectId).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.contains('connect skipped in state connecting')).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          faultInjectionConnectIsRejectedWhileConnected
     * @tc.desc          A second connect after success is refused.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Connect again. 2. Inspect the result and the state.
     *                   3. Confirm the proxy is unchanged.
     * @tc.expected      The call returns false, state stays connected and the
     *                   original proxy is retained.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionConnectIsRejectedWhileConnected', 0, () => {
      logStep('faultInjection', 'connect while connected');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      expect(client.connect(99)).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.logs.contains('connect skipped in state connected')).assertTrue();
    });

    /**
     * @tc.name          faultInjectionReconnectAfterFailureSucceeds
     * @tc.desc          A failed state can start a new connect attempt.
     * @tc.precondition  A client failed with code 16000001.
     * @tc.steps         1. Deliver onFailed. 2. Connect again. 3. Complete it
     *                   with onConnect.
     * @tc.expected      The retry reaches the connected state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReconnectAfterFailureSucceeds', 0, () => {
      logStep('faultInjection', 'reconnect after failure');
      const client = freshClient();
      client.connect(1);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.connect(2)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(2);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
    });

    /**
     * @tc.name          faultInjectionResetClearsEveryFaultField
     * @tc.desc          reset clears errors, toasts, events and the proxy.
     * @tc.precondition  A session failed after a send attempt.
     * @tc.steps         1. Inject a send fault. 2. Reset. 3. Inspect every
     *                   observable field.
     * @tc.expected      The client is back to its pristine state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionResetClearsEveryFaultField', 0, () => {
      logStep('faultInjection', 'reset clears faults');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).failNextSend = ERROR_SEND;
      client.sendString('boom');
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.size() > 0).assertTrue();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          faultInjectionCustomFailCodeIsPropagated
     * @tc.desc          An armed custom errCode is returned to the caller.
     * @tc.precondition  A connected session owns a live proxy.
     * @tc.steps         1. Arm ERROR_DISCONNECT. 2. Send. 3. Inspect result,
     *                   toast and event.
     * @tc.expected      The result carries 16000002 and the failure toast fires.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionCustomFailCodeIsPropagated', 0, () => {
      logStep('faultInjection', 'custom fail code');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_DISCONNECT;
      const result = client.sendString('armed');
      expect(result.errCode).assertEqual(ERROR_DISCONNECT);
      expect(result.errCode).assertEqual(16000002);
      expect(result.readReply()).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(client.events.last()).assertEqual('send-failed:16000002');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.logs.contains('16000002')).assertTrue();
    });

    /**
     * @tc.name          faultInjectionStubRejectsUnknownCode
     * @tc.desc          A request code other than one reaches the stub and fails.
     * @tc.precondition  A connected session and a live stub exist.
     * @tc.steps         1. Call sendMessageRequest with code two. 2. Read the
     *                   result. 3. Inspect the stub history.
     * @tc.expected      The result is 16000003 and the payload is not recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionStubRejectsUnknownCode', 0, () => {
      logStep('faultInjection', 'unknown code');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('ignored');
      const result = proxy.sendMessageRequest(2, data, reply, new MessageOptionModel());
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(proxy.stub.handledCodes[0]).assertEqual(2);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          faultInjectionDeathWithoutRecipientIsSilent
     * @tc.desc          A proxy without a recipient survives notifyDeath quietly.
     * @tc.precondition  A proxy was never registered with a recipient.
     * @tc.steps         1. Notify death. 2. Inspect the flags. 3. Send afterwards.
     * @tc.expected      The proxy dies without a callback and sends fail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDeathWithoutRecipientIsSilent', 0, () => {
      logStep('faultInjection', 'death without recipient');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      expect(proxy.deathRegistered).assertFalse();
      proxy.notifyDeath();
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      const result = proxy.sendMessageRequest(1, MessageSequenceModel.create(),
        MessageSequenceModel.create(), new MessageOptionModel());
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          faultInjectionDeathAfterUnregisterSkipsRecipient
     * @tc.desc          An unregistered recipient is not notified of death.
     * @tc.precondition  A live proxy registered then unregistered a recipient.
     * @tc.steps         1. Register and unregister. 2. Notify death. 3. Read the
     *                   recipient counter.
     * @tc.expected      The proxy dies while the counter stays at zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDeathAfterUnregisterSkipsRecipient', 0, () => {
      logStep('faultInjection', 'death after unregister');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(proxy.unregisterDeathRecipient(recipient)).assertTrue();
      expect(recipient.registered).assertFalse();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.describe()).assertEqual('0/false');
    });

    /**
     * @tc.name          faultInjectionRevivedStubServesAgain
     * @tc.desc          Reviving a killed stub restores successful sends.
     * @tc.precondition  A connected session whose stub was killed.
     * @tc.steps         1. Kill and send. 2. Revive and send. 3. Compare results.
     * @tc.expected      The first send fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRevivedStubServesAgain', 0, () => {
      logStep('faultInjection', 'revived stub');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.stub.kill();
      const failed = client.sendString('before');
      proxy.stub.revive();
      const recovered = client.sendString('after');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.isSuccess()).assertTrue();
      expect(recovered.reply.size()).assertEqual(1);
      expect(recovered.reply.cursor).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('after');
      expect(proxy.sendCalls).assertEqual(2);
    });

    /**
     * @tc.name          faultInjectionOnFailedAfterConnectKeepsProxy
     * @tc.desc          onFailed flips the state but does not drop the proxy.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Deliver onFailed. 2. Inspect the proxy and state.
     *                   3. Check isConnected.
     * @tc.expected      The proxy is retained while isConnected reports false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('faultInjectionOnFailedAfterConnectKeepsProxy', 0, () => {
      logStep('faultInjection', 'failed keeps proxy');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.proxy === proxy).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          faultInjectionFailureCodeSweepIsRecorded
     * @tc.desc          Each failure code is stored verbatim on a fresh client.
     * @tc.precondition  Six independent clients are available.
     * @tc.steps         1. Deliver a different code to each client. 2. Read the
     *                   stored codes. 3. Compare the toast counts.
     * @tc.expected      Every code is preserved and each client shows one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionFailureCodeSweepIsRecorded', 0, () => {
      logStep('faultInjection', 'failure code sweep');
      const codes: number[] = [16000001, 16000002, 16000003, 16000004, 16000005, 0];
      const stored: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        const client = freshClient();
        client.onFailed(codes[index]);
        stored.push(client.failedCode);
        expect(client.toasts.length).assertEqual(1);
        expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
        expect(client.state).assertEqual(STATE_FAILED);
      }
      expect(joined(['16000001', '16000002', '16000003', '16000004', '16000005', '0'], ',').split(',').length)
        .assertEqual(6);
      expect(stored[0]).assertEqual(16000001);
      expect(stored[4]).assertEqual(16000005);
      expect(stored[5]).assertEqual(ERROR_NONE);
      expect(stored.length).assertEqual(6);
    });

    /**
     * @tc.name          faultInjectionSendAfterFailureStillReachesProxy
     * @tc.desc          A failed state with a live proxy still allows a send.
     * @tc.precondition  A connected session received onFailed but kept its proxy.
     * @tc.steps         1. Deliver onFailed. 2. Send a payload. 3. Read the result.
     * @tc.expected      The send succeeds even though isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('faultInjectionSendAfterFailureStillReachesProxy', 0, () => {
      logStep('faultInjection', 'send after failure');
      const client = createConnectedSession();
      client.onFailed(16000001);
      const result = client.sendString('resilient');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect((client.proxy as RemoteProxyModel).stub.receivedTexts[0]).assertEqual('resilient');
      expect(client.events.last()).assertEqual('send-ok:hello rpc');
    });

    /**
     * @tc.name          faultInjectionReconnectAfterDeathWorks
     * @tc.desc          A dead session can be disconnected and reconnected.
     * @tc.precondition  A connected session whose proxy died.
     * @tc.steps         1. Notify death. 2. Disconnect. 3. Connect a new proxy.
     * @tc.expected      The new session is connected and can send again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReconnectAfterDeathWorks', 0, () => {
      logStep('faultInjection', 'reconnect after death');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).notifyDeath();
      expect(client.isConnected()).assertFalse();
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connect(21)).assertTrue();
      const fresh = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(fresh);
      expect(client.isConnected()).assertTrue();
      expect(client.connectId).assertEqual(21);
      const result = client.sendString('again');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(fresh.stub.receivedTexts[0]).assertEqual('again');
      expect(client.deathRecipient.diedCount).assertEqual(1);
    });

    /**
     * @tc.name          faultInjectionOptionCloneIsIndependent
     * @tc.desc          Cloning a message option does not share mutable fields.
     * @tc.precondition  A MessageOptionModel is available.
     * @tc.steps         1. Clone an option. 2. Mutate the original. 3. Compare
     *                   both descriptions.
     * @tc.expected      The clone keeps its original wait time and flags.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('faultInjectionOptionCloneIsIndependent', 0, () => {
      logStep('faultInjection', 'option clone');
      const original = new MessageOptionModel(0, 5, false);
      const clone = original.clone();
      expect(clone.describe()).assertEqual('0/5/false');
      expect(clone.isSync()).assertTrue();
      expect(clone.isAsync()).assertFalse();
      original.waitTime = 99;
      original.flags = 1;
      expect(clone.waitTime).assertEqual(5);
      expect(clone.flags).assertEqual(0);
      expect(clone.describe()).assertEqual('0/5/false');
      expect(original.describe()).assertEqual('1/99/false');
    });

    /**
     * @tc.name          faultInjectionErrorResultHasEmptyReply
     * @tc.desc          A RequestResultModel built with an error has no reply value.
     * @tc.precondition  RequestResultModel is exported by the driver.
     * @tc.steps         1. Build an error result. 2. Read the reply. 3. Compare it
     *                   to a success result.
     * @tc.expected      The error result is unsuccessful with an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionErrorResultHasEmptyReply', 0, () => {
      logStep('faultInjection', 'error result');
      const failure = new RequestResultModel(ERROR_SEND);
      const success = new RequestResultModel(ERROR_NONE, 'hello rpc');
      expect(failure.isSuccess()).assertFalse();
      expect(failure.errCode).assertEqual(ERROR_SEND);
      expect(failure.reply.size()).assertEqual(0);
      expect(failure.readReply()).assertEqual('');
      expect(success.isSuccess()).assertTrue();
      expect(success.reply.size()).assertEqual(1);
      expect(success.readReply()).assertEqual('hello rpc');
    });

    /**
     * @tc.name          faultInjectionMetricsAfterDeathSend
     * @tc.desc          A send to a dead stub counts as one failed attempt.
     * @tc.precondition  A connected session whose stub was killed.
     * @tc.steps         1. Kill the stub. 2. Send once. 3. Derive metrics.
     * @tc.expected      One send, zero replies, one failure and a zero ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsAfterDeathSend', 0, () => {
      logStep('faultInjection', 'metrics after death');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).stub.kill();
      client.sendString('doomed');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:1:1:0'));
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          faultInjectionRecipientDescribeTracksState
     * @tc.desc          The recipient description reflects registration and deaths.
     * @tc.precondition  A live proxy and a fresh recipient exist.
     * @tc.steps         1. Describe the fresh recipient. 2. Register it. 3. Notify
     *                   death and describe again.
     * @tc.expected      The description moves from 0/false to 0/true to 1/true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecipientDescribeTracksState', 0, () => {
      logStep('faultInjection', 'recipient describe');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      expect(recipient.describe()).assertEqual('0/false');
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(recipient.describe()).assertEqual('0/true');
      proxy.notifyDeath();
      expect(recipient.describe()).assertEqual('1/true');
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertTrue();
      expect(proxy.isAlive()).assertFalse();
    });

    /**
     * @tc.name          faultInjectionProxyRequestLogKeepsCodes
     * @tc.desc          The proxy records every attempted request code.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send twice. 2. Send an unknown code directly. 3. Read the
     *                   request log.
     * @tc.expected      The log is one, one, two and sendCalls is three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionProxyRequestLogKeepsCodes', 0, () => {
      logStep('faultInjection', 'request log');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.sendString('one');
      client.sendString('two');
      proxy.sendMessageRequest(2, MessageSequenceModel.create(), MessageSequenceModel.create(),
        new MessageOptionModel());
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.requests[1]).assertEqual(1);
      expect(proxy.requests[2]).assertEqual(2);
      expect(proxy.sendCalls).assertEqual(3);
      expect(joined(['1', '1', '2'], ',')).assertEqual('1,1,2');
      expect(proxy.stub.handledCodes.length).assertEqual(3);
    });

    /**
     * @tc.name          faultInjectionFailureBeforeConnectIsRecorded
     * @tc.desc          onFailed on a fresh client stores the code with no id.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Deliver onFailed. 2. Read the connect id. 3. Read the
     *                   event and toast.
     * @tc.expected      The id stays at the sentinel while the failure is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionFailureBeforeConnectIsRecorded', 0, () => {
      logStep('faultInjection', 'failure before connect');
      const client = freshClient();
      client.onFailed(16000001);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.events.last()).assertEqual('failed:16000001');
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.contains('onFailed code 16000001')).assertTrue();
    });

    /**
     * @tc.name          faultInjectionDisconnectAfterFailureClearsState
     * @tc.desc          A failed client can still run the disconnect callback.
     * @tc.precondition  A client failed after starting a connect.
     * @tc.steps         1. Connect and fail. 2. Call onDisconnect. 3. Inspect the
     *                   state and flags.
     * @tc.expected      The state returns to disconnected and the flag is set.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDisconnectAfterFailureClearsState', 0, () => {
      logStep('faultInjection', 'disconnect after failure');
      const client = freshClient();
      client.connect(4);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.failedCode).assertEqual(16000001);
    });

    /**
     * @tc.name          faultInjectionDeadStubStillRecordsHandledCode
     * @tc.desc          A killed stub records the code it could not serve.
     * @tc.precondition  A connected session whose stub was killed but proxy lives.
     * @tc.steps         1. Kill only the stub. 2. Send. 3. Inspect the stub history.
     * @tc.expected      The code is recorded but no payload is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('faultInjectionDeadStubStillRecordsHandledCode', 0, () => {
      logStep('faultInjection', 'dead stub records code');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.stub.kill();
      const result = client.sendString('lost');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.handledCodes.length).assertEqual(1);
      expect(proxy.stub.handledCodes[0]).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.sendCalls).assertEqual(1);
      expect(client.events.last()).assertEqual('send-failed:16000003');
    });

    /**
     * @tc.name          faultInjectionResetThenSendHasNoProxy
     * @tc.desc          After reset a send returns the invalid proxy code.
     * @tc.precondition  A connected session is reset.
     * @tc.steps         1. Reset. 2. Send. 3. Compare the result and the toast.
     * @tc.expected      The send fails with 16000004 and the failure toast fires.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionResetThenSendHasNoProxy', 0, () => {
      logStep('faultInjection', 'reset then send');
      const client = createConnectedSession();
      client.reset();
      const result = client.sendString('after reset');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.errCode).assertEqual(16000004);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.last()).assertEqual('send-no-proxy:after reset');
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          faultInjectionFailureToastIsLast
     * @tc.desc          A failed send leaves the failure toast at the end.
     * @tc.precondition  A connected session whose stub was killed.
     * @tc.steps         1. Kill the stub. 2. Send. 3. Inspect both toasts.
     * @tc.expected      The connect toast stays first and the failure toast is last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionFailureToastIsLast', 0, () => {
      logStep('faultInjection', 'failure toast last');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).stub.kill();
      client.sendString('doomed');
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast() === client.toasts[0]).assertFalse();
      expect(countOf(client.toasts, SEND_FAIL_TOAST)).assertEqual(1);
      expect(uniqueStrings(client.toasts).length).assertEqual(2);
    });

    /**
     * @tc.name          faultInjectionDeadProxySkipsStub
     * @tc.desc          A dead proxy rejects before the stub handler runs.
     * @tc.precondition  A connected session whose proxy was killed.
     * @tc.steps         1. Kill the proxy. 2. Send. 3. Inspect the stub history.
     * @tc.expected      The request is logged but the stub handles nothing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDeadProxySkipsStub', 0, () => {
      logStep('faultInjection', 'dead proxy skips stub');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.notifyDeath();
      const result = client.sendString('skipped');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.stub.handledCodes.length).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.isAlive()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          faultInjectionStubRequestCountTracksSends
     * @tc.desc          The stub counts every handled request.
     * @tc.precondition  A connected session and a live stub exist.
     * @tc.steps         1. Send twice. 2. Read the stub count. 3. Compare it to the
     *                   proxy count.
     * @tc.expected      Both counters agree at two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionStubRequestCountTracksSends', 0, () => {
      logStep('faultInjection', 'stub request count');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.sendString('one');
      client.sendString('two');
      expect(proxy.stub.requestCount()).assertEqual(2);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.stub.handledCodes.length).assertEqual(2);
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('one');
      expect(proxy.stub.receivedTexts[1]).assertEqual('two');
      expect(proxy.stub.handledCodes[0] === proxy.stub.handledCodes[1]).assertTrue();
      expect(proxy.stub.replyText).assertEqual('hello rpc');
    });

    /**
     * @tc.name          faultInjectionStateOracleMapsCallbacks
     * @tc.desc          The state oracle maps each callback to its result state.
     * @tc.precondition  The expectedStateAfter oracle is exported.
     * @tc.steps         1. Query four callback names. 2. Compare each state. 3. Check
     *                   the unknown fallback.
     * @tc.expected      The four callbacks map to four distinct states.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionStateOracleMapsCallbacks', 0, () => {
      logStep('faultInjection', 'state oracle');
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('unknown')).assertEqual(STATE_FAILED);
      expect(uniqueStrings([expectedStateAfter('connect'), expectedStateAfter('onConnect'),
        expectedStateAfter('onDisconnect'), expectedStateAfter('onFailed')]).length).assertEqual(4);
      expect(expectedStateAfter('onFailed') === expectedStateAfter('other')).assertTrue();
      expect(expectedStateAfter('onConnect').length).assertEqual(9);
    });

    /**
     * @tc.name          faultInjectionLivenessNeedsBothConditions
     * @tc.desc          isConnected requires the connected state and a live proxy.
     * @tc.precondition  Fresh, connecting and connected clients are available.
     * @tc.steps         1. Check a fresh client. 2. Check a connecting client. 3. Check
     *                   connected clients before and after death.
     * @tc.expected      Only a connected client with a live proxy reports true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionLivenessNeedsBothConditions', 0, () => {
      logStep('faultInjection', 'liveness conditions');
      const fresh = freshClient();
      const connecting = freshClient();
      connecting.connect(1);
      const connected = createConnectedSession();
      expect(fresh.isConnected()).assertFalse();
      expect(connecting.isConnected()).assertFalse();
      expect(connected.isConnected()).assertTrue();
      (connected.proxy as RemoteProxyModel).notifyDeath();
      expect(connected.isConnected()).assertFalse();
      connected.onFailed(16000001);
      expect(connected.isConnected()).assertFalse();
      expect(connecting.state).assertEqual(STATE_CONNECTING);
      expect(connected.state).assertEqual(STATE_FAILED);
    });

    /**
     * @tc.name          faultInjectionConnectIdSurvivesFailure
     * @tc.desc          A failure does not clear the connect id until reset.
     * @tc.precondition  A client connected with id six and failed.
     * @tc.steps         1. Connect and fail. 2. Read the id. 3. Reset and read it again.
     * @tc.expected      The id is six after failure and minus one after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionConnectIdSurvivesFailure', 0, () => {
      logStep('faultInjection', 'id survives failure');
      const client = freshClient();
      client.connect(6);
      client.onFailed(16000001);
      expect(client.connectId).assertEqual(6);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(16000001);
      client.reset();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          faultInjectionMetricsCountRetryConnects
     * @tc.desc          A failed connect plus a retry counts two connect events.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Connect and fail. 2. Connect and succeed. 3. Derive metrics.
     * @tc.expected      The metrics count two connects and no sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsCountRetryConnects', 0, () => {
      logStep('faultInjection', 'metrics retry connects');
      const client = freshClient();
      client.connect(1);
      client.onFailed(16000001);
      client.connect(2);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('2:0:1:0'));
      expect(client.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          faultInjectionOptionFlagDrivesSync
     * @tc.desc          An async flag makes isSync false and isAsync true.
     * @tc.precondition  MessageOptionModel accepts explicit flags.
     * @tc.steps         1. Build a sync option. 2. Build an async option. 3. Compare the
     *                   predicates.
     * @tc.expected      The predicates are complementary for both options.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionOptionFlagDrivesSync', 0, () => {
      logStep('faultInjection', 'option flag sync');
      const sync = new MessageOptionModel(0, 0, false);
      const async = new MessageOptionModel(1, 0, false);
      expect(sync.isSync()).assertTrue();
      expect(sync.isAsync()).assertFalse();
      expect(async.isSync()).assertFalse();
      expect(async.isAsync()).assertTrue();
      expect(sync.isSync() === async.isAsync()).assertTrue();
      expect(sync.describe()).assertEqual('0/0/false');
      expect(async.describe()).assertEqual('1/0/false');
      expect(sync.flags).assertEqual(0);
      expect(async.flags).assertEqual(1);
    });

    /**
     * @tc.name          faultInjectionSendFailureKeepsProxyAlive
     * @tc.desc          A stub failure does not kill the proxy object.
     * @tc.precondition  A connected session whose stub was killed.
     * @tc.steps         1. Kill the stub. 2. Send. 3. Check liveness and revive.
     * @tc.expected      The proxy stays alive and recovers after the stub revives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSendFailureKeepsProxyAlive', 0, () => {
      logStep('faultInjection', 'failure keeps proxy');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.stub.kill();
      const failed = client.sendString('one');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.stub.alive).assertFalse();
      proxy.stub.revive();
      const recovered = client.sendString('two');
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('two');
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          faultInjectionZeroFailureCodeIsRecorded
     * @tc.desc          onFailed with code zero still records a failure state.
     * @tc.precondition  A fresh client is available.
     * @tc.steps         1. Deliver onFailed(0). 2. Read the state and code. 3. Read the
     *                   toast.
     * @tc.expected      The state is failed with code zero and a failure toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionZeroFailureCodeIsRecorded', 0, () => {
      logStep('faultInjection', 'zero failure code');
      const client = freshClient();
      client.onFailed(0);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(0);
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.events.last()).assertEqual('failed:0');
      expect(client.logs.contains('onFailed code 0')).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          faultInjectionDisconnectCallbackResetsId
     * @tc.desc          onDisconnect returns the connect id to the sentinel.
     * @tc.precondition  A connected session with id seven.
     * @tc.steps         1. Read the id. 2. Disconnect. 3. Read the id again.
     * @tc.expected      The id moves from seven to minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionDisconnectCallbackResetsId', 0, () => {
      logStep('faultInjection', 'disconnect resets id');
      const client = createConnectedSession();
      expect(client.connectId).assertEqual(7);
      client.onDisconnect();
      expect(client.connectId).assertEqual(-1);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          faultInjectionDeathCountSurvivesReconnect
     * @tc.desc          The death counter is not reset by a reconnect.
     * @tc.precondition  A connected session whose proxy died.
     * @tc.steps         1. Notify death. 2. Disconnect and reconnect. 3. Read the counter.
     * @tc.expected      The counter still reads one after the new connection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('faultInjectionDeathCountSurvivesReconnect', 0, () => {
      logStep('faultInjection', 'death count survives reconnect');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      client.onDisconnect();
      client.connect(8);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.connectId).assertEqual(8);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('death-register')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          faultInjectionErrorReplyReadsEmptyRepeatedly
     * @tc.desc          An empty reply keeps returning empty on every read.
     * @tc.precondition  An error RequestResultModel exists.
     * @tc.steps         1. Read the reply three times. 2. Compare all reads. 3. Check the
     *                   reply size.
     * @tc.expected      Every read is empty and the size stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionErrorReplyReadsEmptyRepeatedly', 0, () => {
      logStep('faultInjection', 'error reply repeated');
      const result = new RequestResultModel(ERROR_PROXY_INVALID);
      expect(result.readReply()).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(16000004);
      expect(result.reply.readString()).assertEqual('');
      expect(result.reply.readCount).assertEqual(0);
    });

    /**
     * @tc.name          faultInjectionTwoTransientFaultsInARow
     * @tc.desc          Two armed failures consume one each and allow recovery.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Arm and fail twice. 2. Send without arming. 3. Compare results.
     * @tc.expected      The third send succeeds after two failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionTwoTransientFaultsInARow', 0, () => {
      logStep('faultInjection', 'two transient faults');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const first = client.sendString('one');
      proxy.failNextSend = ERROR_DISCONNECT;
      const second = client.sendString('two');
      const third = client.sendString('three');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(second.errCode).assertEqual(ERROR_DISCONNECT);
      expect(third.errCode).assertEqual(ERROR_NONE);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(3);
      expect(client.events.countOf('send-failed')).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.toasts.length).assertEqual(4);
    });

    /**
     * @tc.name          faultInjectionStubReviveKeepsHistory
     * @tc.desc          Reviving a stub does not clear its request history.
     * @tc.precondition  A stub served one request and was killed.
     * @tc.steps         1. Send successfully. 2. Kill and revive. 3. Send again.
     * @tc.expected      Both requests remain in the stub history.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionStubReviveKeepsHistory', 0, () => {
      logStep('faultInjection', 'revive keeps history');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      client.sendString('first');
      proxy.stub.kill();
      proxy.stub.revive();
      client.sendString('second');
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('first');
      expect(proxy.stub.receivedTexts[1]).assertEqual('second');
      expect(proxy.stub.handledCodes.length).assertEqual(2);
      expect(proxy.stub.requestCount()).assertEqual(2);
      expect(proxy.stub.alive).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          faultInjectionMetricsRatioWithOneOfThree
     * @tc.desc          One good send among two failures gives a one third ratio.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Fail twice. 2. Send once good. 3. Derive metrics.
     * @tc.expected      The ratio is near one third with one reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('faultInjectionMetricsRatioWithOneOfThree', 0, () => {
      logStep('faultInjection', 'one of three ratio');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      client.sendString('one');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('two');
      client.sendString('three');
      const metrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.successRatio() > 0.33).assertTrue();
      expect(metrics.successRatio() < 0.34).assertTrue();
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:3:2:1'));
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          faultInjectionRecipientRegistersAfterRevive
     * @tc.desc          A revived proxy accepts a death recipient again.
     * @tc.precondition  A proxy was killed without a recipient.
     * @tc.steps         1. Kill the proxy. 2. Try to register. 3. Revive and register.
     * @tc.expected      Registration fails while dead and succeeds after revive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecipientRegistersAfterRevive', 0, () => {
      logStep('faultInjection', 'register after revive');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.notifyDeath();
      expect(proxy.registerDeathRecipient(recipient)).assertFalse();
      expect(recipient.registered).assertFalse();
      proxy.reset();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
    });

    /**
     * @tc.name          faultInjectionSessionsAreIndependent
     * @tc.desc          A fault in one session does not affect another.
     * @tc.precondition  Two connected sessions exist.
     * @tc.steps         1. Kill one stub. 2. Send on both. 3. Compare the results.
     * @tc.expected      Only the faulty session fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSessionsAreIndependent', 0, () => {
      logStep('faultInjection', 'independent sessions');
      const first = createConnectedSession();
      const second = createConnectedSession();
      (first.proxy as RemoteProxyModel).stub.kill();
      const failed = first.sendString('one');
      const healthy = second.sendString('two');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(healthy.errCode).assertEqual(ERROR_NONE);
      expect(first.isConnected()).assertTrue();
      expect(second.isConnected()).assertTrue();
      expect(first.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(second.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(second.proxy === first.proxy).assertFalse();
      expect(second.events.countOf('send-ok')).assertEqual(1);
      expect(first.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          faultInjectionSendCallCounterOnFailure
     * @tc.desc          A failed send still increments the proxy call counter.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm a failure. 2. Send. 3. Read the counters.
     * @tc.expected      The send call and request log both record one attempt.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSendCallCounterOnFailure', 0, () => {
      logStep('faultInjection', 'counter on failure');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = client.sendString('one');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.stub.handledCodes.length).assertEqual(0);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          faultInjectionConnectCallbackAfterFailure
     * @tc.desc          A late onConnect still overrides the failed state.
     * @tc.precondition  A client failed after starting a connect.
     * @tc.steps         1. Connect and fail. 2. Deliver onConnect. 3. Inspect state and proxy.
     * @tc.expected      The state becomes connected despite the earlier failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('faultInjectionConnectCallbackAfterFailure', 0, () => {
      logStep('faultInjection', 'connect after failure');
      const client = freshClient();
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.connect(1);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.failedCode).assertEqual(16000001);
      expect(client.toasts.length).assertEqual(2);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          faultInjectionProxyDescriptorAfterReset
     * @tc.desc          Proxy reset preserves the descriptor while clearing counters.
     * @tc.precondition  A proxy with a custom descriptor served one request.
     * @tc.steps         1. Send. 2. Reset. 3. Compare descriptor and counters.
     * @tc.expected      The descriptor survives and the counters return to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionProxyDescriptorAfterReset', 0, () => {
      logStep('faultInjection', 'descriptor after reset');
      const proxy = new RemoteProxyModel(new RemoteStubModel('CustomStub'));
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('one');
      proxy.sendMessageRequest(1, data, reply, new MessageOptionModel());
      expect(proxy.sendCalls).assertEqual(1);
      proxy.reset();
      expect(proxy.descriptor).assertEqual('CustomStub');
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name          faultInjectionToastTrailAfterTwoFaults
     * @tc.desc          Two different faults append two failure toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Fail a send. 2. Fail another send. 3. Read the toast trail.
     * @tc.expected      The connect toast is followed by two identical failure toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionToastTrailAfterTwoFaults', 0, () => {
      logStep('faultInjection', 'toast trail two faults');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      client.sendString('one');
      proxy.failNextSend = ERROR_PROXY_INVALID;
      client.sendString('two');
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_FAIL_TOAST);
      expect(countOf(client.toasts, SEND_FAIL_TOAST)).assertEqual(2);
      expect(uniqueStrings(client.toasts).length).assertEqual(2);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-failed')).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          faultInjectionResetThenConnectSucceeds
     * @tc.desc          A reset session can connect from scratch.
     * @tc.precondition  A failed session was reset.
     * @tc.steps         1. Fail and reset. 2. Connect. 3. Deliver onConnect.
     * @tc.expected      The session reaches the connected state with fresh counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionResetThenConnectSucceeds', 0, () => {
      logStep('faultInjection', 'reset then connect');
      const client = createConnectedSession();
      (client.proxy as RemoteProxyModel).notifyDeath();
      client.onFailed(16000003);
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connect(12)).assertTrue();
      expect(client.connectId).assertEqual(12);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          faultInjectionDeathRegisterCodeIsRecorded
     * @tc.desc          The death registration failure code constant is usable.
     * @tc.precondition  ERROR_DEATH_REGISTER is exported.
     * @tc.steps         1. Build a failure result with that code. 2. Read the code. 3. Compare
     *                   it to the other failure codes.
     * @tc.expected      The code is 16000005 and unique among failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDeathRegisterCodeIsRecorded', 0, () => {
      logStep('faultInjection', 'death register code');
      const result = new RequestResultModel(ERROR_DEATH_REGISTER);
      expect(result.errCode).assertEqual(16000005);
      expect(result.isSuccess()).assertFalse();
      expect(result.readReply()).assertEqual('');
      expect(ERROR_DEATH_REGISTER > ERROR_PROXY_INVALID).assertTrue();
      expect(ERROR_DEATH_REGISTER - ERROR_PROXY_INVALID).assertEqual(1);
      expect(joined(['16000004', '16000005'], ',')).assertEqual('16000004,16000005');
      expect(result.errCode === ERROR_PROXY_INVALID).assertFalse();
    });

    /**
     * @tc.name          faultInjectionDisconnectRequestedTwice
     * @tc.desc          Two disconnect requests record two events.
     * @tc.precondition  A client has started a connect with id four.
     * @tc.steps         1. Request disconnect twice. 2. Count the events. 3. Read the last one.
     * @tc.expected      Both requests succeed and the trail holds two entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDisconnectRequestedTwice', 0, () => {
      logStep('faultInjection', 'disconnect twice');
      const client = freshClient();
      client.connect(4);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.countOf('disconnect-request')).assertEqual(2);
      expect(client.events.last()).assertEqual('disconnect-request:4');
      expect(client.events.size()).assertEqual(3);
      expect(client.connectId).assertEqual(4);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.events.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          faultInjectionSendAfterDisconnectFails
     * @tc.desc          A disconnected session cannot send until it reconnects.
     * @tc.precondition  A connected session was disconnected.
     * @tc.steps         1. Disconnect. 2. Send. 3. Read the result and toast.
     * @tc.expected      The send fails with the invalid proxy code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSendAfterDisconnectFails', 0, () => {
      logStep('faultInjection', 'send after disconnect');
      const client = createConnectedSession();
      client.onDisconnect();
      const result = client.sendString('too late');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.last()).assertEqual('send-no-proxy:too late');
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          faultInjectionSuccessResultCarriesReply
     * @tc.desc          A success RequestResultModel exposes one reply value.
     * @tc.precondition  RequestResultModel is exported.
     * @tc.steps         1. Build a success result. 2. Read the reply. 3. Inspect the size and counters.
     * @tc.expected      The result succeeds with one readable reply value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionSuccessResultCarriesReply', 0, () => {
      logStep('faultInjection', 'success result reply');
      const result = new RequestResultModel(ERROR_NONE, 'hello rpc');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(0);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('hello rpc');
      expect(result.reply.cursor).assertEqual(1);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(1);
    });

  });
}
