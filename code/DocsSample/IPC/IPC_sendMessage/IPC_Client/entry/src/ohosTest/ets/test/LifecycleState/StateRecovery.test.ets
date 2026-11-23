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
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  SEND_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  MessageSequenceModel,
  ClientMetrics,
  createConnectedSession
} from '../Shared/SharedDriver';

export default function stateRecovery(): void {
  describe('StateRecovery', () => {
    beforeAll(() => {
      logSuite('StateRecovery', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StateRecovery', 'end');
    });

    /**
     * @tc.name          stateRecoveryRetryAfterFailedSendSucceeds
     * @tc.desc          A transient send failure is followed by a success.
     * @tc.precondition  A connected session is primed to fail once.
     * @tc.steps         1. A connected session is primed to fail once.
     *                   2. Send twice.
     *                   3. The second result succeeds with the stub reply.
     * @tc.expected      The second result succeeds with the stub reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryRetryAfterFailedSendSucceeds', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const failed = session.sendString('first-0');
      const recovered = session.sendString('retry-0');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual('hello rpc');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-0');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          stateRecoveryFailedSendReportsError
     * @tc.desc          The primed failure reports the send error.
     * @tc.precondition  A connected session is primed to fail once.
     * @tc.steps         1. A connected session is primed to fail once.
     *                   2. Send once.
     *                   3. The result carries the send error code.
     * @tc.expected      The result carries the send error code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryFailedSendReportsError', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = session.sendString('once-1');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoveryFailedSendToastsFailure
     * @tc.desc          The primed failure shows the send failure toast.
     * @tc.precondition  A connected session is primed to fail once.
     * @tc.steps         1. A connected session is primed to fail once.
     *                   2. Send once and read the tail toast.
     *                   3. The send failure text is last.
     * @tc.expected      The send failure text is last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryFailedSendToastsFailure', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = session.sendString('once-2');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoveryFailedSendRecordsEvent
     * @tc.desc          The primed failure records a send-failed event.
     * @tc.precondition  A connected session is primed to fail once.
     * @tc.steps         1. A connected session is primed to fail once.
     *                   2. Send once and count events.
     *                   3. One send-failed event exists.
     * @tc.expected      One send-failed event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedSendRecordsEvent', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = session.sendString('once-3');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoveryFailedSendKeepsConnection
     * @tc.desc          A send failure does not break the connection.
     * @tc.precondition  A connected session is primed to fail once.
     * @tc.steps         1. A connected session is primed to fail once.
     *                   2. Send once and call isConnected.
     *                   3. The connection is still live.
     * @tc.expected      The connection is still live.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedSendKeepsConnection', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = session.sendString('once-4');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoveryFailureIsConsumedOnce
     * @tc.desc          The primed failure applies only once.
     * @tc.precondition  A session with one primed failure exists.
     * @tc.steps         1. A session with one primed failure exists.
     *                   2. Read the failNextSend field after the send.
     *                   3. The field is back to no error.
     * @tc.expected      The field is back to no error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailureIsConsumedOnce', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = session.sendString('once-5');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoveryRetryKeepsSameProxy
     * @tc.desc          The retry uses the same live proxy.
     * @tc.precondition  A session recovered from one failure.
     * @tc.steps         1. A session recovered from one failure.
     *                   2. Inspect the proxy send counter.
     *                   3. Two calls reached the same proxy.
     * @tc.expected      Two calls reached the same proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryRetryKeepsSameProxy', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const failed = session.sendString('first-6');
      const recovered = session.sendString('retry-6');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual('hello rpc');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-6');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          stateRecoveryRetryReplyMatchesStub
     * @tc.desc          The successful retry returns the stub reply.
     * @tc.precondition  A session recovered from one failure.
     * @tc.steps         1. A session recovered from one failure.
     *                   2. Read the second reply text.
     *                   3. The text equals the stub reply.
     * @tc.expected      The text equals the stub reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryRetryReplyMatchesStub', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const failed = session.sendString('first-7');
      const recovered = session.sendString('retry-7');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual('hello rpc');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-7');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          stateRecoveryRetryClearsFailureMetrics
     * @tc.desc          The retry balances the failure metric.
     * @tc.precondition  A session failed once then succeeded.
     * @tc.steps         1. A session failed once then succeeded.
     *                   2. Build ClientMetrics.
     *                   3. One failure and one reply exist.
     * @tc.expected      One failure and one reply exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateRecoveryRetryClearsFailureMetrics', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const failed = session.sendString('first-8');
      const recovered = session.sendString('retry-8');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual('hello rpc');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-8');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          stateRecoveryRepeatedFailuresRecover
     * @tc.desc          Three primed failures all recover.
     * @tc.precondition  A connected session is primed repeatedly.
     * @tc.steps         1. A connected session is primed repeatedly.
     *                   2. Send four times.
     *                   3. Three failures and one reply are observed.
     * @tc.expected      Three failures and one reply are observed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryRepeatedFailuresRecover', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const one = session.sendString('one');
      proxy.failNextSend = ERROR_SEND;
      const two = session.sendString('two');
      proxy.failNextSend = ERROR_SEND;
      const three = session.sendString('three');
      const four = session.sendString('four');
      expect(one.errCode).assertEqual(ERROR_SEND);
      expect(two.errCode).assertEqual(ERROR_SEND);
      expect(three.errCode).assertEqual(ERROR_SEND);
      expect(four.errCode).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(4);
      expect(session.events.countOf('send-failed')).assertEqual(3);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.toasts.length).assertEqual(5);
    });

    /**
     * @tc.name          stateRecoverySendFailurePayloadIgnored
     * @tc.desc          A failed send does not reach the stub.
     * @tc.precondition  A connected session is primed to fail once.
     * @tc.steps         1. A connected session is primed to fail once.
     *                   2. Send once.
     *                   3. The stub received no text.
     * @tc.expected      The stub received no text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoverySendFailurePayloadIgnored', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const result = session.sendString('once-10');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.length).assertEqual(2);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(1);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoverySendFailureThenPayloadDelivered
     * @tc.desc          The retry delivers the payload to the stub.
     * @tc.precondition  A session recovered from one failure.
     * @tc.steps         1. A session recovered from one failure.
     *                   2. Send the sample payload twice.
     *                   3. The stub received the payload once.
     * @tc.expected      The stub received the payload once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoverySendFailureThenPayloadDelivered', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const failed = session.sendString('first-11');
      const recovered = session.sendString('retry-11');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual('hello rpc');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-11');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          stateRecoverySendFailureToastSequence
     * @tc.desc          The toast sequence shows failure then success.
     * @tc.precondition  A session recovered from one failure.
     * @tc.steps         1. A session recovered from one failure.
     *                   2. Read the last two toasts.
     *                   3. They are failure then success.
     * @tc.expected      They are failure then success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoverySendFailureToastSequence', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const failed = session.sendString('first-12');
      const recovered = session.sendString('retry-12');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual('hello rpc');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-12');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          stateRecoverySendFailureSequenceNumbers
     * @tc.desc          The proxy records every request code.
     * @tc.precondition  A session recovered from one failure.
     * @tc.steps         1. A session recovered from one failure.
     *                   2. Inspect the recorded codes.
     *                   3. Two codes of one are stored.
     * @tc.expected      Two codes of one are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateRecoverySendFailureSequenceNumbers', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      const failed = session.sendString('first-13');
      const recovered = session.sendString('second');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.isSuccess()).assertFalse();
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual('hello rpc');
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('second');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectRetryAccepted
     * @tc.desc          A retry after onFailed is accepted.
     * @tc.precondition  A client received onFailed.
     * @tc.steps         1. A client received onFailed.
     *                   2. Call connect with a new id.
     *                   3. The call returns true.
     * @tc.expected      The call returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryFailedConnectRetryAccepted', 0, () => {
      const client = new ConnectionModel();
      client.connect(74);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(174);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-14');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(174);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectRetryConnecting
     * @tc.desc          The retry parks the client in connecting.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. A failed client exists.
     *                   2. Call connect.
     *                   3. The state becomes connecting.
     * @tc.expected      The state becomes connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryFailedConnectRetryConnecting', 0, () => {
      const client = new ConnectionModel();
      client.connect(75);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(175);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-15');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(175);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectKeepsCode
     * @tc.desc          The retry keeps the recorded failure code.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. A failed client exists.
     *                   2. Call connect and read failedCode.
     *                   3. The code is unchanged.
     * @tc.expected      The code is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectKeepsCode', 0, () => {
      const client = new ConnectionModel();
      client.connect(76);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(176);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-16');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(176);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectReplacesCode
     * @tc.desc          A second failure replaces the first code.
     * @tc.precondition  A retried client failed again.
     * @tc.steps         1. A retried client failed again.
     *                   2. Read failedCode after the second failure.
     *                   3. The newest code is stored.
     * @tc.expected      The newest code is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectReplacesCode', 0, () => {
      const client = new ConnectionModel();
      client.connect(77);
      client.onFailed(16000001);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(177);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-17');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(177);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectToastRemains
     * @tc.desc          The failure toast stays in the list.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. A failed client exists.
     *                   2. Call connect and read the toast list.
     *                   3. The failure toast is still stored.
     * @tc.expected      The failure toast is still stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectToastRemains', 0, () => {
      const client = new ConnectionModel();
      client.connect(78);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(178);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-18');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(178);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectThenSucceeds
     * @tc.desc          A retry can complete with a live proxy.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. A failed client exists.
     *                   2. Connect and attach a proxy.
     *                   3. The client is connected.
     * @tc.expected      The client is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryFailedConnectThenSucceeds', 0, () => {
      const client = new ConnectionModel();
      client.connect(79);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(179);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-19');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(179);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectSendWorks
     * @tc.desc          A recovered connection serves requests.
     * @tc.precondition  A failed client retried and attached.
     * @tc.steps         1. A failed client retried and attached.
     *                   2. Send the sample payload.
     *                   3. The request succeeds.
     * @tc.expected      The request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryFailedConnectSendWorks', 0, () => {
      const client = new ConnectionModel();
      client.connect(80);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(180);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-20');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(180);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectRegistersDeath
     * @tc.desc          The recovered proxy registers the recipient.
     * @tc.precondition  A failed client retried and attached.
     * @tc.steps         1. A failed client retried and attached.
     *                   2. Inspect both registration flags.
     *                   3. Both flags are true.
     * @tc.expected      Both flags are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectRegistersDeath', 0, () => {
      const client = new ConnectionModel();
      client.connect(81);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(181);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-21');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(181);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectClearsNothingElse
     * @tc.desc          The recovery leaves unrelated fields alone.
     * @tc.precondition  A failed client retried.
     * @tc.steps         1. A failed client retried.
     *                   2. Read the want and the probe flag.
     *                   3. They keep their previous values.
     * @tc.expected      They keep their previous values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateRecoveryFailedConnectClearsNothingElse', 0, () => {
      const client = new ConnectionModel();
      client.connect(82);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(182);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-22');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(182);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectMetricsTwoConnects
     * @tc.desc          Both connect attempts are counted.
     * @tc.precondition  A failed client successfully retried.
     * @tc.steps         1. A failed client successfully retried.
     *                   2. Build ClientMetrics.
     *                   3. connects equals two.
     * @tc.expected      connects equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectMetricsTwoConnects', 0, () => {
      const client = new ConnectionModel();
      client.connect(83);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(183);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-23');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(183);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectThirdAttempt
     * @tc.desc          A second retry is still permitted after another failure.
     * @tc.precondition  A retried client failed a second time.
     * @tc.steps         1. A retried client failed a second time.
     *                   2. Call connect once more.
     *                   3. The third attempt is accepted.
     * @tc.expected      The third attempt is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateRecoveryFailedConnectThirdAttempt', 0, () => {
      const client = new ConnectionModel();
      client.connect(184);
      client.onFailed(16000001);
      client.connect(185);
      client.onFailed(16000002);
      const third = client.connect(186);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      expect(third).assertTrue();
      expect(client.connectId).assertEqual(186);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.failedCode).assertEqual(16000002);
      expect(client.events.countOf('failed')).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(3);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          stateRecoveryFailedConnectNoProxyBeforeAttach
     * @tc.desc          The retry opens without a proxy until onConnect.
     * @tc.precondition  A failed client retried.
     * @tc.steps         1. A failed client retried.
     *                   2. Read the proxy before onConnect.
     *                   3. The proxy is undefined.
     * @tc.expected      The proxy is undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectNoProxyBeforeAttach', 0, () => {
      const client = new ConnectionModel();
      client.connect(85);
      client.onFailed(16000002);
      const codeBefore = client.failedCode;
      const toastsBefore = client.toasts.length;
      const ok = client.connect(185);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recover-25');
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(185);
      expect(client.failedCode).assertEqual(codeBefore);
      expect(toastsBefore).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isDisconnect).assertFalse();
      expect(client.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectIdUpdated
     * @tc.desc          The retry replaces the stored connect id.
     * @tc.precondition  A failed client retried with id sixty.
     * @tc.steps         1. A failed client retried with id sixty.
     *                   2. Read connectId.
     *                   3. The new id is stored.
     * @tc.expected      The new id is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectIdUpdated', 0, () => {
      const client = new ConnectionModel();
      client.connect(186);
      client.onFailed(16000001);
      const ok = client.connect(187);
      expect(ok).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(187);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.isConnected()).assertFalse();
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          stateRecoveryFailedConnectThenDisconnect
     * @tc.desc          A recovery can be followed by a clean disconnect.
     * @tc.precondition  A failed client retried and attached.
     * @tc.steps         1. A failed client retried and attached.
     *                   2. Deliver onDisconnect.
     *                   3. The client returns to disconnected and clears the proxy.
     * @tc.expected      The client returns to disconnected and clears the proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryFailedConnectThenDisconnect', 0, () => {
      const client = new ConnectionModel();
      client.connect(188);
      client.onFailed(16000001);
      client.connect(189);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(client.failedCode).assertEqual(16000001);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateRecoveryProxyInvalidSendRefused
     * @tc.desc          A client without a proxy cannot send.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Call sendString.
     *                   3. The errCode is proxy invalid.
     * @tc.expected      The errCode is proxy invalid.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryProxyInvalidSendRefused', 0, () => {
      const client = new ConnectionModel();
      const result = client.sendString('no-proxy');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryProxyInvalidIsRecoverable
     * @tc.desc          A fresh client can connect after a refused send.
     * @tc.precondition  A fresh client attempted one send.
     * @tc.steps         1. A fresh client attempted one send.
     *                   2. Connect and attach a proxy.
     *                   3. The client is connected.
     * @tc.expected      The client is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryProxyInvalidIsRecoverable', 0, () => {
      const client = new ConnectionModel();
      client.sendString('no-proxy');
      const ok = client.connect(61);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      const result = client.sendString('recovered');
      expect(ok).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryProxyInvalidDoesNotChangeState
     * @tc.desc          The refused send leaves the state alone.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Call sendString and read the state.
     *                   3. The state stays disconnected.
     * @tc.expected      The state stays disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryProxyInvalidDoesNotChangeState', 0, () => {
      const client = new ConnectionModel();
      const result = client.sendString('no-proxy-two');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.connectCalls).assertEqual(0);
      expect(client.logs.size()).assertEqual(1);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateRecoveryDeathThenSendRefused
     * @tc.desc          A dead proxy refuses the request.
     * @tc.precondition  A connected proxy died.
     * @tc.steps         1. A connected proxy died.
     *                   2. Call sendString.
     *                   3. The errCode is the send error.
     * @tc.expected      The errCode is the send error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryDeathThenSendRefused', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      const result = session.sendString('after-death');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isConnected()).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          stateRecoveryDeathThenLogout
     * @tc.desc          The dead session can be cleaned up.
     * @tc.precondition  A connected proxy died.
     * @tc.steps         1. A connected proxy died.
     *                   2. Deliver onDisconnect.
     *                   3. The state is disconnected and the proxy is cleared.
     * @tc.expected      The state is disconnected and the proxy is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryDeathThenLogout', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.proxy === undefined).assertTrue();
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.isDisconnect).assertTrue();
      expect(session.isConnected()).assertFalse();
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.deathRecipient.diedCount).assertEqual(1);
    });

    /**
     * @tc.name          stateRecoveryDeathThenReconnect
     * @tc.desc          A fresh proxy can be attached after death.
     * @tc.precondition  The dead session was cleaned up.
     * @tc.steps         1. The dead session was cleaned up.
     *                   2. Connect and attach a new proxy.
     *                   3. The client is connected and live.
     * @tc.expected      The client is connected and live.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryDeathThenReconnect', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      const ok = session.connect(63);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      const result = session.sendString('revived');
      expect(ok).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(63);
      expect(session.proxy === proxy).assertTrue();
      expect(session.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(4);
      expect(session.proxy === undefined).assertEqual(false);
    });

    /**
     * @tc.name          stateRecoveryDeathThenSendSucceeds
     * @tc.desc          The replacement proxy accepts the request.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Send the sample payload.
     *                   3. The request succeeds.
     * @tc.expected      The request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoveryDeathThenSendSucceeds', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      const ok = session.connect(63);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      const result = session.sendString('revived');
      expect(ok).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(63);
      expect(session.proxy === proxy).assertTrue();
      expect(session.isConnected()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.toasts.length).assertEqual(4);
      expect(result.isSuccess()).assertEqual(true);
    });

    /**
     * @tc.name          stateRecoveryDeathCountPreserved
     * @tc.desc          The client recipient keeps the death count.
     * @tc.precondition  A dead session reconnected.
     * @tc.steps         1. A dead session reconnected.
     *                   2. Read the death counter.
     *                   3. The counter equals one.
     * @tc.expected      The counter equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryDeathCountPreserved', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).notifyDeath();
      session.onDisconnect();
      session.connect(64);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const recipient = session.deathRecipient;
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertTrue();
      expect(session.proxy !== undefined).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.isConnected()).assertTrue();
      expect(session.connectId).assertEqual(64);
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          stateRecoveryStubReviveAllowsHandling
     * @tc.desc          A revived stub handles the request again.
     * @tc.precondition  A stub was killed and then revived.
     * @tc.steps         1. A stub was killed and then revived.
     *                   2. Send through a proxy over the stub.
     *                   3. The request succeeds.
     * @tc.expected      The request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryStubReviveAllowsHandling', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.stub.kill();
      const refused = session.sendString('killed');
      expect(refused.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.alive).assertFalse();
      expect(proxy.alive).assertTrue();
      proxy.stub.revive();
      const recovered = session.sendString('revived');
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(proxy.stub.alive).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(session.isConnected()).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoveryKilledStubRefusesRequest
     * @tc.desc          A killed stub refuses the request.
     * @tc.precondition  A stub was killed.
     * @tc.steps         1. A stub was killed.
     *                   2. Send through a proxy over the stub.
     *                   3. The errCode is the send error.
     * @tc.expected      The errCode is the send error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryKilledStubRefusesRequest', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.stub.kill();
      const refused = session.sendString('killed');
      expect(refused.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.alive).assertFalse();
      expect(proxy.alive).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateRecoveryProxyResetRestoresState
     * @tc.desc          The proxy reset restores its defaults.
     * @tc.precondition  A proxy with recorded traffic exists.
     * @tc.steps         1. A proxy with recorded traffic exists.
     *                   2. Call reset and inspect the fields.
     *                   3. The counters are zero and the proxy is alive.
     * @tc.expected      The counters are zero and the proxy is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryProxyResetRestoresState', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      session.sendString('traffic');
      proxy.reset();
      expect(proxy.alive).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.lastPayload).assertEqual('');
    });

    /**
     * @tc.name          stateRecoveryResetThenConnect
     * @tc.desc          A reset client can start over.
     * @tc.precondition  A used session was reset.
     * @tc.steps         1. A used session was reset.
     *                   2. Connect and attach a proxy.
     *                   3. The client is connected with the new id.
     * @tc.expected      The client is connected with the new id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryResetThenConnect', 0, () => {
      const session = createConnectedSession();
      session.sendString('before-reset');
      session.onFailed(16000002);
      session.reset();
      const ok = session.connect(65);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(ok).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(65);
      expect(session.failedCode).assertEqual(ERROR_NONE);
      expect(session.connectCalls).assertEqual(1);
      expect(session.toasts.length).assertEqual(1);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          stateRecoverySequenceReclaimBlocksWrite
     * @tc.desc          A reclaimed sequence rejects writes.
     * @tc.precondition  A fresh MessageSequenceModel is reclaimed.
     * @tc.steps         1. A fresh MessageSequenceModel is reclaimed.
     *                   2. Call writeString.
     *                   3. The call returns false.
     * @tc.expected      The call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoverySequenceReclaimBlocksWrite', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.reclaim();
      const accepted = sequence.writeString('beta');
      expect(accepted).assertFalse();
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.size()).assertEqual(1);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.writeCount).assertEqual(1);
      expect(sequence.reclaimed).assertTrue();
    });

    /**
     * @tc.name          stateRecoverySequenceReclaimBlocksRead
     * @tc.desc          A reclaimed sequence returns an empty read.
     * @tc.precondition  A sequence with one value is reclaimed.
     * @tc.steps         1. A sequence with one value is reclaimed.
     *                   2. Call readString.
     *                   3. The result is empty.
     * @tc.expected      The result is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoverySequenceReclaimBlocksRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      sequence.readString();
      sequence.reclaim();
      expect(sequence.readString()).assertEqual('');
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.values.length).assertEqual(1);
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.isEmpty()).assertFalse();
    });

    /**
     * @tc.name          stateRecoverySequenceReclaimResetsCursor
     * @tc.desc          Reclaiming resets the read cursor.
     * @tc.precondition  A sequence was partially read then reclaimed.
     * @tc.steps         1. A sequence was partially read then reclaimed.
     *                   2. Read the cursor.
     *                   3. The cursor is zero.
     * @tc.expected      The cursor is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoverySequenceReclaimResetsCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      sequence.readString();
      expect(sequence.cursor).assertEqual(1);
      sequence.reclaim();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(1);
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.values.length).assertEqual(2);
      expect(sequence.trace()).assertEqual('one|two#0');
    });

    /**
     * @tc.name          stateRecoverySequenceSizeSurvivesReclaim
     * @tc.desc          Reclaiming keeps the recorded size.
     * @tc.precondition  A sequence with two values is reclaimed.
     * @tc.steps         1. A sequence with two values is reclaimed.
     *                   2. Read the size.
     *                   3. The size is still two.
     * @tc.expected      The size is still two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoverySequenceSizeSurvivesReclaim', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      sequence.reclaim();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.isEmpty()).assertFalse();
      expect(sequence.writeCount).assertEqual(2);
      expect(sequence.isReclaimed()).assertTrue();
      expect(sequence.values[0]).assertEqual('one');
      expect(sequence.values[1]).assertEqual('two');
    });

    /**
     * @tc.name          stateRecoverySequenceRewindAllowsReread
     * @tc.desc          A rewind allows the same value to be read again.
     * @tc.precondition  A sequence with one value was read once.
     * @tc.steps         1. A sequence with one value was read once.
     *                   2. Rewind and read again.
     *                   3. The same value is returned.
     * @tc.expected      The same value is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoverySequenceRewindAllowsReread', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('alpha');
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.readString()).assertEqual('');
      sequence.rewind();
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readString()).assertEqual('alpha');
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          stateRecoverySequenceEmptyRead
     * @tc.desc          An empty sequence reads as empty.
     * @tc.precondition  A fresh sequence exists.
     * @tc.steps         1. A fresh sequence exists.
     *                   2. Call readString.
     *                   3. The result is empty and the cursor stays zero.
     * @tc.expected      The result is empty and the cursor stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateRecoverySequenceEmptyRead', 0, () => {
      const sequence = MessageSequenceModel.create();
      expect(sequence.isEmpty()).assertTrue();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(0);
      expect(sequence.readCount).assertEqual(0);
      expect(sequence.writeCount).assertEqual(0);
      expect(sequence.trace()).assertEqual('#0');
    });

    /**
     * @tc.name          stateRecoverySequenceTraceIncludesCursor
     * @tc.desc          The trace includes the cursor position.
     * @tc.precondition  A sequence with two values was read once.
     * @tc.steps         1. A sequence with two values was read once.
     *                   2. Read the trace.
     *                   3. It lists the values and the cursor one.
     * @tc.expected      It lists the values and the cursor one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateRecoverySequenceTraceIncludesCursor', 0, () => {
      const sequence = MessageSequenceModel.create();
      sequence.writeString('one');
      sequence.writeString('two');
      sequence.readString();
      expect(sequence.trace()).assertEqual('one|two#1');
      sequence.readString();
      expect(sequence.trace()).assertEqual('one|two#2');
      expect(sequence.readString()).assertEqual('');
      expect(sequence.cursor).assertEqual(2);
      expect(sequence.readCount).assertEqual(2);
      expect(sequence.size()).assertEqual(2);
    });

    /**
     * @tc.name          stateRecoveryMetricsAfterRecoveredSend
     * @tc.desc          A recovered send yields one reply and one failure.
     * @tc.precondition  A session failed then succeeded.
     * @tc.steps         1. A session failed then succeeded.
     *                   2. Build ClientMetrics.
     *                   3. The counters match the observed events.
     * @tc.expected      The counters match the observed events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryMetricsAfterRecoveredSend', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      proxy.failNextSend = ERROR_SEND;
      session.sendString('failed');
      session.sendString('recovered');
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          stateRecoveryMetricsAfterConnectRetry
     * @tc.desc          A connect retry raises the connect counter.
     * @tc.precondition  A failed client reconnected.
     * @tc.steps         1. A failed client reconnected.
     *                   2. Build ClientMetrics.
     *                   3. connects equals two and failures equals one.
     * @tc.expected      connects equals two and failures equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateRecoveryMetricsAfterConnectRetry', 0, () => {
      const client = new ConnectionModel();
      client.connect(180);
      client.onFailed(16000001);
      client.connect(181);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          stateRecoveryResetClearsFailureState
     * @tc.desc          reset removes the failure code and the toasts.
     * @tc.precondition  A failed and recovered session was reset.
     * @tc.steps         1. A failed and recovered session was reset.
     *                   2. Read failedCode and the toast list.
     *                   3. Both are back to defaults.
     * @tc.expected      Both are back to defaults.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryResetClearsFailureState', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).failNextSend = ERROR_SEND;
      session.sendString('failed');
      session.sendString('recovered');
      session.reset();
      expect(session.failedCode).assertEqual(ERROR_NONE);
      expect(session.toasts.length).assertEqual(0);
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.events.size()).assertEqual(0);
      expect(session.proxy === undefined).assertTrue();
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateRecoveryResetRestoresConnectGate
     * @tc.desc          reset allows a later disconnect request to fail cleanly.
     * @tc.precondition  A recovered session was reset.
     * @tc.steps         1. A recovered session was reset.
     *                   2. Call disconnectRequested.
     *                   3. The call returns false.
     * @tc.expected      The call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryResetRestoresConnectGate', 0, () => {
      const session = createConnectedSession();
      session.onFailed(16000002);
      session.reset();
      const accepted = session.disconnectRequested();
      expect(accepted).assertFalse();
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(session.events.size()).assertEqual(0);
      expect(session.toasts.length).assertEqual(0);
      expect(session.failedCode).assertEqual(ERROR_NONE);
      expect(session.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          stateRecoveryRecoveredClientStateConsistent
     * @tc.desc          The recovered client fields agree with each other.
     * @tc.precondition  A session recovered from a failure.
     * @tc.steps         1. A session recovered from a failure.
     *                   2. Check state, proxy, id and isConnected.
     *                   3. All four values agree.
     * @tc.expected      All four values agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateRecoveryRecoveredClientStateConsistent', 0, () => {
      const session = createConnectedSession();
      (session.proxy as RemoteProxyModel).failNextSend = ERROR_SEND;
      session.sendString('failed');
      const result = session.sendString('ok');
      const proxy = session.proxy as RemoteProxyModel;
      expect(result.isSuccess()).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === proxy).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(session.connectId).assertEqual(7);
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
    });

  });
}
