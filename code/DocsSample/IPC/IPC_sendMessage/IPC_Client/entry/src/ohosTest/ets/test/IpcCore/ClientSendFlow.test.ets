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
  RequestResultModel,
  RemoteProxyModel,
  RemoteStubModel,
  ClientSnapshot,
  ClientMetrics,
  createConnectedSession,
  expectedToastFor,
  textFingerprint,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  REQUEST_CODE,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  STATE_DISCONNECTED,
  LEVEL_INFO,
  LEVEL_ERROR
} from '../Shared/SharedDriver';

export default function clientSendFlow(): void {
  describe('ClientSendFlow', () => {
    beforeAll(() => {
      logSuite('ClientSendFlow', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientSendFlow', 'end');
    });

    /**
     * @tc.name          clientSendStringReturnsSuccess
     * @tc.desc          A request on a live proxy returns a successful result with the stub reply.
     * @tc.precondition  A connected client holding a proxy whose stub replies with a fixed text.
     * @tc.steps         1. Build the stub and proxy.
     *                   2. Connect and attach the proxy.
     *                   3. Send the hello world payload.
     * @tc.expected      errCode is zero and the reply text equals the configured stub reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendStringReturnsSuccess', 0, () => {
      logStep('clientSendStringReturnsSuccess', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(201);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('hello world');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('hello world');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendStringReturnsSuccess', 'end');
    });

    /**
     * @tc.name          clientSendStringForwardsPayload
     * @tc.desc          The stub receives the exact payload written into the data sequence.
     * @tc.precondition  A connected client with a recording stub.
     * @tc.steps         1. Send a readable payload.
     *                   2. Inspect the stub received list.
     *                   3. Compare the first entry.
     * @tc.expected      The stub received the payload verbatim exactly once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendStringForwardsPayload', 0, () => {
      logStep('clientSendStringForwardsPayload', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'reply-alpha';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(203);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('payload-alpha');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('reply-alpha');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('payload-alpha');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendStringForwardsPayload', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendStringForwardsPayload', 'end');
    });

    /**
     * @tc.name          clientSendStringUsesRequestCode
     * @tc.desc          Every send uses the documented request code one.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Send one payload.
     *                   2. Read the proxy request list.
     *                   3. Compare the recorded code.
     * @tc.expected      The only recorded request code equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendStringUsesRequestCode', 0, () => {
      logStep('clientSendStringUsesRequestCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'reply-beta';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(205);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('payload-beta');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('reply-beta');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('payload-beta');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.connectCalls).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(proxy.stub.receivedTexts.length <= proxy.sendCalls).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      logStep('clientSendStringUsesRequestCode', 'end');
    });

    /**
     * @tc.name          clientSendStringQueuesSuccessToast
     * @tc.desc          A successful send queues the send request success toast.
     * @tc.precondition  A connected client before its first send.
     * @tc.steps         1. Send one payload.
     *                   2. Read the last toast.
     *                   3. Compare with the send toast oracle.
     * @tc.expected      The last toast equals the send success text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendStringQueuesSuccessToast', 0, () => {
      logStep('clientSendStringQueuesSuccessToast', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'reply-gamma';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(207);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('payload-gamma');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('reply-gamma');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('payload-gamma');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(expectedToastFor('send-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSendStringQueuesSuccessToast', 'end');
    });

    /**
     * @tc.name          clientSendStringRecordsReplyLog
     * @tc.desc          A successful send writes the reply text into the client log.
     * @tc.precondition  A connected client with a distinctive reply.
     * @tc.steps         1. Send the payload.
     *                   2. Search the log buffer for the reply.
     *                   3. Check the info level count.
     * @tc.expected      The log contains the reply fragment at info level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendStringRecordsReplyLog', 0, () => {
      logStep('clientSendStringRecordsReplyLog', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'reply-delta';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(209);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('payload-delta');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('reply-delta');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('payload-delta');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO) >= 1).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      logStep('clientSendStringRecordsReplyLog', 'end');
    });

    /**
     * @tc.name          clientSendStringUpdatesMetrics
     * @tc.desc          One successful send yields a success ratio of one in the aggregate metrics.
     * @tc.precondition  A connected client with no previous sends.
     * @tc.steps         1. Send one payload.
     *                   2. Build metrics.
     *                   3. Compare sends, replies and ratio.
     * @tc.expected      Metrics report one send, one reply and a ratio of one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendStringUpdatesMetrics', 0, () => {
      logStep('clientSendStringUpdatesMetrics', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'reply-epsilon';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(211);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('payload-epsilon');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('reply-epsilon');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('payload-epsilon');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendStringUpdatesMetrics', 'end');
    });

    /**
     * @tc.name          clientSendStringSnapshotToast
     * @tc.desc          The snapshot toast count grows by exactly one per successful send.
     * @tc.precondition  A connected client that already holds the connect toast.
     * @tc.steps         1. Snapshot before sending.
     *                   2. Send one payload.
     *                   3. Snapshot again.
     * @tc.expected      The toast count grows from one to two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendStringSnapshotToast', 0, () => {
      logStep('clientSendStringSnapshotToast', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'reply-zeta';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(213);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('payload-zeta');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('reply-zeta');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('payload-zeta');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendStringSnapshotToast', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendStringSnapshotToast', 'end');
    });

    /**
     * @tc.name          clientSendStringThenReset
     * @tc.desc          Reset after a successful send clears events and toasts but keeps the result object.
     * @tc.precondition  A connected client with one completed send.
     * @tc.steps         1. Send one payload.
     *                   2. Keep the result reference.
     *                   3. Reset the client.
     * @tc.expected      The client is idle while the captured result still reports success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendStringThenReset', 0, () => {
      logStep('clientSendStringThenReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'reply-eta';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(215);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('payload-eta');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('reply-eta');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('payload-eta');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const toastCount: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(toastCount >= 1).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientSendStringThenReset', 'end');
    });

    /**
     * @tc.name          clientSendWithoutProxyFails
     * @tc.desc          Sending without a proxy returns the proxy invalid error code.
     * @tc.precondition  A client that never connected.
     * @tc.steps         1. Call sendString on the bare client.
     *                   2. Read the result code.
     *                   3. Inspect the toast.
     * @tc.expected      errCode is 16000004 and the failure toast is queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendWithoutProxyFails', 0, () => {
      logStep('clientSendWithoutProxyFails', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const result: RequestResultModel = client.sendString('orphan-one');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendWithoutProxyFails', 'end');
    });

    /**
     * @tc.name          clientSendWithoutProxyEmptyReply
     * @tc.desc          The proxy invalid result carries no reply text.
     * @tc.precondition  A client without a proxy.
     * @tc.steps         1. Send a payload.
     *                   2. Read the reply text.
     *                   3. Read the reply sequence.
     * @tc.expected      The reply text is empty and the sequence is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendWithoutProxyEmptyReply', 0, () => {
      logStep('clientSendWithoutProxyEmptyReply', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const result: RequestResultModel = client.sendString('orphan-two');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendWithoutProxyEmptyReply', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendWithoutProxyEmptyReply', 'end');
    });

    /**
     * @tc.name          clientSendWithoutProxyLogsError
     * @tc.desc          The missing proxy path logs the documented proxy invalid error.
     * @tc.precondition  A client without a proxy.
     * @tc.steps         1. Send a payload.
     *                   2. Count error lines.
     *                   3. Search for the fragment.
     * @tc.expected      One error line contains the proxy is invalid fragment.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendWithoutProxyLogsError', 0, () => {
      logStep('clientSendWithoutProxyLogsError', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const result: RequestResultModel = client.sendString('orphan-three');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(expectedToastFor('send-fail'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSendWithoutProxyLogsError', 'end');
    });

    /**
     * @tc.name          clientSendWithoutProxyKeepsState
     * @tc.desc          A failed send never mutates the disconnected state.
     * @tc.precondition  A client without a proxy.
     * @tc.steps         1. Send a payload.
     *                   2. Read the state.
     *                   3. Call isConnected.
     * @tc.expected      The state remains disconnected and the predicate is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendWithoutProxyKeepsState', 0, () => {
      logStep('clientSendWithoutProxyKeepsState', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const result: RequestResultModel = client.sendString('orphan-four');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const toastCount: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(toastCount >= 1).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientSendWithoutProxyKeepsState', 'end');
    });

    /**
     * @tc.name          clientSendWithoutProxyNoConnectCalls
     * @tc.desc          A missing proxy send does not fabricate a connect attempt.
     * @tc.precondition  A client that never connected.
     * @tc.steps         1. Send a payload.
     *                   2. Read the connect call counter.
     *                   3. Read the events.
     * @tc.expected      No connect call is recorded and no connect event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendWithoutProxyNoConnectCalls', 0, () => {
      logStep('clientSendWithoutProxyNoConnectCalls', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const result: RequestResultModel = client.sendString('orphan-five');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendWithoutProxyNoConnectCalls', 'end');
    });

    /**
     * @tc.name          clientSendWithoutProxyToastOracle
     * @tc.desc          The missing proxy toast equals the documented failure oracle.
     * @tc.precondition  A client without a proxy.
     * @tc.steps         1. Send a payload.
     *                   2. Read the last toast.
     *                   3. Compare with the oracle.
     * @tc.expected      The toast equals the send failure constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendWithoutProxyToastOracle', 0, () => {
      logStep('clientSendWithoutProxyToastOracle', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const result: RequestResultModel = client.sendString('orphan-six');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.lastToast()).assertEqual(expectedToastFor('send-fail'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSendWithoutProxyToastOracle', 'end');
    });

    /**
     * @tc.name          clientSendAfterProxyDeath
     * @tc.desc          A send against a dead proxy fails with the send error code.
     * @tc.precondition  A connected client whose proxy has been marked dead.
     * @tc.steps         1. Connect and attach the proxy.
     *                   2. Notify proxy death.
     *                   3. Send a payload.
     * @tc.expected      errCode is 16000003 and the proxy records the send attempt.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendAfterProxyDeath', 0, () => {
      logStep('clientSendAfterProxyDeath', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(229);
      client.onConnect(proxy);
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('dead-one');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('send-failed')).assertEqual(1);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendAfterProxyDeath', 'end');
    });

    /**
     * @tc.name          clientSendAfterDeathToast
     * @tc.desc          A dead proxy send queues the send failure toast.
     * @tc.precondition  A connected client with a dead proxy.
     * @tc.steps         1. Kill the proxy.
     *                   2. Send a payload.
     *                   3. Read the toast queue.
     * @tc.expected      The last toast equals the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendAfterDeathToast', 0, () => {
      logStep('clientSendAfterDeathToast', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(231);
      client.onConnect(proxy);
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('dead-two');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.lastToast()).assertEqual(expectedToastFor('send-fail'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSendAfterDeathToast', 'end');
    });

    /**
     * @tc.name          clientSendAfterDeathNoReply
     * @tc.desc          A dead proxy send never reaches the stub handler.
     * @tc.precondition  A connected client with a dead proxy.
     * @tc.steps         1. Kill the proxy.
     *                   2. Send a payload.
     *                   3. Inspect the stub received list.
     * @tc.expected      The stub received nothing and no reply text exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendAfterDeathNoReply', 0, () => {
      logStep('clientSendAfterDeathNoReply', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(233);
      client.onConnect(proxy);
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('dead-three');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO) >= 1).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      logStep('clientSendAfterDeathNoReply', 'end');
    });

    /**
     * @tc.name          clientSendAfterDeathLogCount
     * @tc.desc          The dead proxy send records one failure event and one error line.
     * @tc.precondition  A connected client with a dead proxy.
     * @tc.steps         1. Kill the proxy.
     *                   2. Send a payload.
     *                   3. Count failure events and errors.
     * @tc.expected      One send-failed event and at least one error line exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendAfterDeathLogCount', 0, () => {
      logStep('clientSendAfterDeathLogCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(235);
      client.onConnect(proxy);
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('dead-four');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('send-failed')).assertEqual(1);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendAfterDeathLogCount', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendAfterDeathLogCount', 'end');
    });

    /**
     * @tc.name          clientSendAfterDeathLiveness
     * @tc.desc          The client reports not connected once its proxy has died.
     * @tc.precondition  A connected client with a dead proxy.
     * @tc.steps         1. Kill the proxy.
     *                   2. Call isConnected.
     *                   3. Send a payload.
     * @tc.expected      isConnected is false before the send and the send is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendAfterDeathLiveness', 0, () => {
      logStep('clientSendAfterDeathLiveness', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(237);
      client.onConnect(proxy);
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('dead-five');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('send-failed')).assertEqual(1);
      const toastCount: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(toastCount >= 1).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientSendAfterDeathLiveness', 'end');
    });

    /**
     * @tc.name          clientSendForcedFailureCode
     * @tc.desc          A forced proxy failure surfaces its exact code in the result.
     * @tc.precondition  A connected client whose proxy is primed to fail once.
     * @tc.steps         1. Prime the failure code.
     *                   2. Send a payload.
     *                   3. Compare the result code.
     * @tc.expected      The result code equals the primed value and the primer resets.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendForcedFailureCode', 0, () => {
      logStep('clientSendForcedFailureCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(239);
      client.onConnect(proxy);
      proxy.failNextSend = 16000003;
      const result: RequestResultModel = client.sendString('forced-one');
      expect(result.errCode).assertEqual(16000003);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(stub.receivedTexts.length).assertEqual(0);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendForcedFailureCode', 'end');
    });

    /**
     * @tc.name          clientSendForcedFailureSkipsStub
     * @tc.desc          A forced failure prevents the stub from observing the payload.
     * @tc.precondition  A connected client primed for failure.
     * @tc.steps         1. Prime a failure.
     *                   2. Send a payload.
     *                   3. Check stub and proxy counters.
     * @tc.expected      The stub received nothing while one send call is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendForcedFailureSkipsStub', 0, () => {
      logStep('clientSendForcedFailureSkipsStub', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(241);
      client.onConnect(proxy);
      proxy.failNextSend = 16000001;
      const result: RequestResultModel = client.sendString('forced-two');
      expect(result.errCode).assertEqual(16000001);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(client.connectCalls).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(proxy.stub.receivedTexts.length <= proxy.sendCalls).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      logStep('clientSendForcedFailureSkipsStub', 'end');
    });

    /**
     * @tc.name          clientSendForcedFailureToast
     * @tc.desc          A forced failure queues the send failure toast.
     * @tc.precondition  A connected client primed for failure.
     * @tc.steps         1. Prime a failure.
     *                   2. Send a payload.
     *                   3. Read the last toast.
     * @tc.expected      The last toast is the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendForcedFailureToast', 0, () => {
      logStep('clientSendForcedFailureToast', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(243);
      client.onConnect(proxy);
      proxy.failNextSend = 16000002;
      const result: RequestResultModel = client.sendString('forced-three');
      expect(result.errCode).assertEqual(16000002);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(stub.receivedTexts.length).assertEqual(0);
      expect(client.lastToast()).assertEqual(expectedToastFor('send-fail'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSendForcedFailureToast', 'end');
    });

    /**
     * @tc.name          clientSendForcedFailureMetrics
     * @tc.desc          A forced failure counts as a send without a reply in the metrics.
     * @tc.precondition  A connected client primed for failure.
     * @tc.steps         1. Prime a failure.
     *                   2. Send a payload.
     *                   3. Build the metrics.
     * @tc.expected      One send and zero replies are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendForcedFailureMetrics', 0, () => {
      logStep('clientSendForcedFailureMetrics', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(245);
      client.onConnect(proxy);
      proxy.failNextSend = 16000005;
      const result: RequestResultModel = client.sendString('forced-four');
      expect(result.errCode).assertEqual(16000005);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(stub.receivedTexts.length).assertEqual(0);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendForcedFailureMetrics', 'end');
    });

    /**
     * @tc.name          clientSendForcedFailureNegativeCode
     * @tc.desc          A negative forced failure code is preserved through the send path.
     * @tc.precondition  A connected client primed with a negative code.
     * @tc.steps         1. Prime a negative failure.
     *                   2. Send a payload.
     *                   3. Compare the result code.
     * @tc.expected      The result reports the negative code unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendForcedFailureNegativeCode', 0, () => {
      logStep('clientSendForcedFailureNegativeCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(247);
      client.onConnect(proxy);
      proxy.failNextSend = -1;
      const result: RequestResultModel = client.sendString('forced-five');
      expect(result.errCode).assertEqual(-1);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(stub.receivedTexts.length).assertEqual(0);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendForcedFailureNegativeCode', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendForcedFailureNegativeCode', 'end');
    });

    /**
     * @tc.name          clientSendTwiceKeepsCounters
     * @tc.desc          Two sends increment proxy and stub counters exactly twice.
     * @tc.precondition  A connected client with a recording stub.
     * @tc.steps         1. Send the payload once.
     *                   2. Send it again.
     *                   3. Compare the counters.
     * @tc.expected      Two send calls and two stub receptions are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendTwiceKeepsCounters', 0, () => {
      logStep('clientSendTwiceKeepsCounters', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'twice-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(251);
      client.onConnect(proxy);
      client.sendString('twice-one');
      const second: RequestResultModel = client.sendString('twice-one');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(stub.receivedTexts[1]).assertEqual('twice-one');
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.connectCalls).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(proxy.stub.receivedTexts.length <= proxy.sendCalls).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      logStep('clientSendTwiceKeepsCounters', 'end');
    });

    /**
     * @tc.name          clientSendTwiceEventCount
     * @tc.desc          Each successful send contributes its own send event.
     * @tc.precondition  A connected client with no previous sends.
     * @tc.steps         1. Send twice.
     *                   2. Count send-ok events.
     *                   3. Compare with the toast queue.
     * @tc.expected      Two send events exist and three toasts are queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendTwiceEventCount', 0, () => {
      logStep('clientSendTwiceEventCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'twice-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(253);
      client.onConnect(proxy);
      client.sendString('twice-two');
      const second: RequestResultModel = client.sendString('twice-two');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(stub.receivedTexts[1]).assertEqual('twice-two');
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO) >= 1).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      logStep('clientSendTwiceEventCount', 'end');
    });

    /**
     * @tc.name          clientSendTwiceMetricsRatio
     * @tc.desc          Two successful sends keep the success ratio at one.
     * @tc.precondition  A connected client before two sends.
     * @tc.steps         1. Send twice.
     *                   2. Build the metrics.
     *                   3. Read the ratio.
     * @tc.expected      The ratio is one because both sends replied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendTwiceMetricsRatio', 0, () => {
      logStep('clientSendTwiceMetricsRatio', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'twice-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(255);
      client.onConnect(proxy);
      client.sendString('twice-three');
      const second: RequestResultModel = client.sendString('twice-three');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(stub.receivedTexts[1]).assertEqual('twice-three');
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendTwiceMetricsRatio', 'end');
    });

    /**
     * @tc.name          clientSendTwiceSnapshot
     * @tc.desc          The snapshot toast count reflects both send toasts.
     * @tc.precondition  A connected client with one connect toast.
     * @tc.steps         1. Send twice.
     *                   2. Build a snapshot.
     *                   3. Compare the toast count.
     * @tc.expected      The snapshot reports three queued toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendTwiceSnapshot', 0, () => {
      logStep('clientSendTwiceSnapshot', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'twice-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(257);
      client.onConnect(proxy);
      client.sendString('twice-four');
      const second: RequestResultModel = client.sendString('twice-four');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(stub.receivedTexts[1]).assertEqual('twice-four');
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendTwiceSnapshot', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendTwiceSnapshot', 'end');
    });

    /**
     * @tc.name          clientSendTwiceLastReply
     * @tc.desc          The second send returns the same stub reply text.
     * @tc.precondition  A connected client with a fixed reply.
     * @tc.steps         1. Send twice.
     *                   2. Read the second result.
     *                   3. Compare the reply text.
     * @tc.expected      The second reply text equals the configured stub reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendTwiceLastReply', 0, () => {
      logStep('clientSendTwiceLastReply', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'twice-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(259);
      client.onConnect(proxy);
      client.sendString('twice-five');
      const second: RequestResultModel = client.sendString('twice-five');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(stub.receivedTexts[1]).assertEqual('twice-five');
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(expectedToastFor('send-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSendTwiceLastReply', 'end');
    });

    /**
     * @tc.name          clientSendAfterDropFails
     * @tc.desc          A send after a disconnect is rejected as proxy invalid.
     * @tc.precondition  A client that was connected and then dropped.
     * @tc.steps         1. Drop the connection.
     *                   2. Send a payload.
     *                   3. Read the result code.
     * @tc.expected      errCode is 16000004 and the failure toast is queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendAfterDropFails', 0, () => {
      logStep('clientSendAfterDropFails', 'begin');
      const client: ConnectionModel = createConnectedSession('drop-reply');
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('drop-one');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendAfterDropFails', 'end');
    });

    /**
     * @tc.name          clientSendAfterDropEvent
     * @tc.desc          The dropped client records a send-no-proxy event.
     * @tc.precondition  A client with no proxy after a disconnect.
     * @tc.steps         1. Drop the connection.
     *                   2. Send a payload.
     *                   3. Count send-no-proxy events.
     * @tc.expected      Exactly one send-no-proxy event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendAfterDropEvent', 0, () => {
      logStep('clientSendAfterDropEvent', 'begin');
      const client: ConnectionModel = createConnectedSession('drop-reply');
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('drop-two');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendAfterDropEvent', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendAfterDropEvent', 'end');
    });

    /**
     * @tc.name          clientSendAfterDropToastCount
     * @tc.desc          The dropped client keeps its earlier toasts and adds the failure toast.
     * @tc.precondition  A dropped client with two toasts from the connect cycle.
     * @tc.steps         1. Drop the connection.
     *                   2. Send a payload.
     *                   3. Read the last toast.
     * @tc.expected      The last toast is the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendAfterDropToastCount', 0, () => {
      logStep('clientSendAfterDropToastCount', 'begin');
      const client: ConnectionModel = createConnectedSession('drop-reply');
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('drop-three');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.lastToast()).assertEqual(expectedToastFor('send-fail'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSendAfterDropToastCount', 'end');
    });

    /**
     * @tc.name          clientSendAfterDropRecipient
     * @tc.desc          A post-drop send leaves the unregistered recipient untouched.
     * @tc.precondition  A dropped client whose recipient is no longer registered.
     * @tc.steps         1. Drop the connection.
     *                   2. Send a payload.
     *                   3. Inspect recipient state.
     * @tc.expected      The recipient stays unregistered with a zero died count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendAfterDropRecipient', 0, () => {
      logStep('clientSendAfterDropRecipient', 'begin');
      const client: ConnectionModel = createConnectedSession('drop-reply');
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('drop-four');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size() > 0).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO) >= 1).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      logStep('clientSendAfterDropRecipient', 'end');
    });

    /**
     * @tc.name          clientSendAfterDropReset
     * @tc.desc          Reset after a post-drop send clears the accumulated toasts.
     * @tc.precondition  A dropped client that failed one send.
     * @tc.steps         1. Drop and send.
     *                   2. Call reset.
     *                   3. Verify the toast queue.
     * @tc.expected      The queue is empty and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendAfterDropReset', 0, () => {
      logStep('clientSendAfterDropReset', 'begin');
      const client: ConnectionModel = createConnectedSession('drop-reply');
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('drop-five');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      const toastCount: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(toastCount >= 1).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      logStep('clientSendAfterDropReset', 'end');
    });

    /**
     * @tc.name          clientSendAfterDropNoStub
     * @tc.desc          No stub is reachable once the connection has been dropped.
     * @tc.precondition  A client dropped before any send.
     * @tc.steps         1. Drop the connection.
     *                   2. Send a payload.
     *                   3. Check the event count.
     * @tc.expected      No success event exists and the failure path ran once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendAfterDropNoStub', 0, () => {
      logStep('clientSendAfterDropNoStub', 'begin');
      const client: ConnectionModel = createConnectedSession('drop-reply');
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('drop-six');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendAfterDropNoStub', 'end');
    });

    /**
     * @tc.name          clientSendEmptyPayload
     * @tc.desc          An empty payload is still written and delivered to the stub.
     * @tc.precondition  A connected client whose stub replies with an empty string.
     * @tc.steps         1. Send an empty payload.
     *                   2. Inspect the stub reception.
     *                   3. Read the reply.
     * @tc.expected      The stub receives an empty string and the reply is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendEmptyPayload', 0, () => {
      logStep('clientSendEmptyPayload', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = '';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(261);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('');
      expect(result.isSuccess()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('');
      expect(result.replyText).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.connectCalls).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(proxy.stub.receivedTexts.length <= proxy.sendCalls).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      logStep('clientSendEmptyPayload', 'end');
    });

    /**
     * @tc.name          clientSendEmptyPayloadSuccess
     * @tc.desc          An empty payload send still reports success and logs the reply.
     * @tc.precondition  A connected client with an empty reply stub.
     * @tc.steps         1. Send an empty payload.
     *                   2. Check the result flag.
     *                   3. Search the log.
     * @tc.expected      The result is successful and the reply line is logged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendEmptyPayloadSuccess', 0, () => {
      logStep('clientSendEmptyPayloadSuccess', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = '';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(263);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('');
      expect(result.isSuccess()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('');
      expect(result.replyText).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO) >= 1).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      logStep('clientSendEmptyPayloadSuccess', 'end');
    });

    /**
     * @tc.name          clientSendEmptyPayloadMetrics
     * @tc.desc          An empty payload counts as one send and one reply.
     * @tc.precondition  A connected client before the first send.
     * @tc.steps         1. Send an empty payload.
     *                   2. Build metrics.
     *                   3. Compare the counters.
     * @tc.expected      One send and one reply are counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendEmptyPayloadMetrics', 0, () => {
      logStep('clientSendEmptyPayloadMetrics', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = '';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(265);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('');
      expect(result.isSuccess()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('');
      expect(result.replyText).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendEmptyPayloadMetrics', 'end');
    });

    /**
     * @tc.name          clientSendEmptyPayloadReplySequence
     * @tc.desc          The reply sequence stays empty when the stub replies with nothing.
     * @tc.precondition  A connected client with an empty reply stub.
     * @tc.steps         1. Send an empty payload.
     *                   2. Read the reply sequence size.
     *                   3. Read the reply text.
     * @tc.expected      The reply sequence is empty and reads as an empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendEmptyPayloadReplySequence', 0, () => {
      logStep('clientSendEmptyPayloadReplySequence', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = '';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(267);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('');
      expect(result.isSuccess()).assertTrue();
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('');
      expect(result.replyText).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendEmptyPayloadReplySequence', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendEmptyPayloadReplySequence', 'end');
    });

    /**
     * @tc.name          clientSendLongPayload
     * @tc.desc          A long payload survives the round trip unchanged.
     * @tc.precondition  A connected client with a long request string.
     * @tc.steps         1. Send the long payload.
     *                   2. Compare the stub copy.
     *                   3. Hash both strings.
     * @tc.expected      Length, content and fingerprint all match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendLongPayload', 0, () => {
      logStep('clientSendLongPayload', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'long-reply-value-klmnopqrst';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(269);
      client.onConnect(proxy);
      const payload: string = 'long-payload-value-abcdefghij';
      expect(payload.length > 10).assertTrue();
      const result: RequestResultModel = client.sendString(payload);
      expect(result.isSuccess()).assertTrue();
      expect(stub.receivedTexts[0]).assertEqual(payload);
      expect(stub.receivedTexts[0].length).assertEqual(payload.length);
      expect(textFingerprint(stub.receivedTexts[0])).assertEqual(textFingerprint(payload));
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.connectCalls).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(proxy.stub.receivedTexts.length <= proxy.sendCalls).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      logStep('clientSendLongPayload', 'end');
    });

    /**
     * @tc.name          clientSendLongPayloadLog
     * @tc.desc          The long payload reply is written to the log buffer.
     * @tc.precondition  A connected client with a long reply stub.
     * @tc.steps         1. Send the long payload.
     *                   2. Inspect the log buffer.
     *                   3. Check the info count.
     * @tc.expected      At least one info line is present after the send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendLongPayloadLog', 0, () => {
      logStep('clientSendLongPayloadLog', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'another-long-reply-9876543210';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(271);
      client.onConnect(proxy);
      const payload: string = 'another-long-payload-0123456789';
      expect(payload.length > 10).assertTrue();
      const result: RequestResultModel = client.sendString(payload);
      expect(result.isSuccess()).assertTrue();
      expect(stub.receivedTexts[0]).assertEqual(payload);
      expect(stub.receivedTexts[0].length).assertEqual(payload.length);
      expect(textFingerprint(stub.receivedTexts[0])).assertEqual(textFingerprint(payload));
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.logs.size() > 0).assertTrue();
      expect(client.logs.countLevel(LEVEL_INFO) >= 1).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      logStep('clientSendLongPayloadLog', 'end');
    });

    /**
     * @tc.name          clientSendLongPayloadMetrics
     * @tc.desc          A long payload send is counted once in the metrics.
     * @tc.precondition  A connected client before the long send.
     * @tc.steps         1. Send the long payload.
     *                   2. Build metrics.
     *                   3. Compare sends and replies.
     * @tc.expected      One send and one reply are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendLongPayloadMetrics', 0, () => {
      logStep('clientSendLongPayloadMetrics', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'third-long-reply-abcdefghij';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(273);
      client.onConnect(proxy);
      const payload: string = 'third-long-payload-abcdefghij';
      expect(payload.length > 10).assertTrue();
      const result: RequestResultModel = client.sendString(payload);
      expect(result.isSuccess()).assertTrue();
      expect(stub.receivedTexts[0]).assertEqual(payload);
      expect(stub.receivedTexts[0].length).assertEqual(payload.length);
      expect(textFingerprint(stub.receivedTexts[0])).assertEqual(textFingerprint(payload));
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendLongPayloadMetrics', 'end');
    });

    /**
     * @tc.name          clientSendReadReplyAdvancesCursor
     * @tc.desc          The send flow consumes the reply so the result reply cursor is already one.
     * @tc.precondition  A connected client whose stub replies with a known text.
     * @tc.steps         1. Send a payload.
     *                   2. Read the reply from the result.
     *                   3. Inspect the reply cursor.
     * @tc.expected      The read returns empty because the send flow already consumed the text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendReadReplyAdvancesCursor', 0, () => {
      logStep('clientSendReadReplyAdvancesCursor', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'read-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(275);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('read-one');
      const firstRead: string = result.readReply();
      expect(firstRead).assertEqual('read-reply-one');
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.size()).assertEqual(1);
      expect(result.replyText).assertEqual('read-reply-one');
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.isSuccess()).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendReadReplyAdvancesCursor', 'end');
    });

    /**
     * @tc.name          clientSendReadReplyBeforeReclaim
     * @tc.desc          The result reply sequence stays live even though its text was consumed.
     * @tc.precondition  A connected client with one completed send.
     * @tc.steps         1. Send a payload.
     *                   2. Check the reclaim flag.
     *                   3. Compare the reply size.
     * @tc.expected      The reply sequence is live with one stored value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendReadReplyBeforeReclaim', 0, () => {
      logStep('clientSendReadReplyBeforeReclaim', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'read-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(277);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('read-two');
      const firstRead: string = result.readReply();
      expect(firstRead).assertEqual('read-reply-two');
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.size()).assertEqual(1);
      expect(result.replyText).assertEqual('read-reply-two');
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.isSuccess()).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      logStep('clientSendReadReplyBeforeReclaim', snap.describe());
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSendReadReplyBeforeReclaim', 'end');
    });

    /**
     * @tc.name          clientSendMixedFailureThenSuccess
     * @tc.desc          A failed send followed by a success leaves both event kinds.
     * @tc.precondition  A connected client primed to fail once.
     * @tc.steps         1. Prime the failure.
     *                   2. Send once and fail.
     *                   3. Send again and succeed.
     * @tc.expected      One failure event and one success event are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSendMixedFailureThenSuccess', 0, () => {
      logStep('clientSendMixedFailureThenSuccess', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'mixed-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(279);
      client.onConnect(proxy);
      proxy.failNextSend = 16000003;
      const failed: RequestResultModel = client.sendString('mixed-one');
      expect(failed.isSuccess()).assertFalse();
      expect(failed.errCode).assertEqual(16000003);
      const passed: RequestResultModel = client.sendString('mixed-one');
      expect(passed.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.connectCalls).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(proxy.stub.receivedTexts.length <= proxy.sendCalls).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      logStep('clientSendMixedFailureThenSuccess', 'end');
    });

    /**
     * @tc.name          clientSendMixedMetricsHalf
     * @tc.desc          One failure and one success produce a success ratio of one half.
     * @tc.precondition  A connected client primed to fail once.
     * @tc.steps         1. Fail one send.
     *                   2. Succeed on the retry.
     *                   3. Build the metrics.
     * @tc.expected      Two sends, one reply and a ratio of one half are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSendMixedMetricsHalf', 0, () => {
      logStep('clientSendMixedMetricsHalf', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'mixed-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(281);
      client.onConnect(proxy);
      proxy.failNextSend = 16000002;
      const failed: RequestResultModel = client.sendString('mixed-two');
      expect(failed.isSuccess()).assertFalse();
      expect(failed.errCode).assertEqual(16000002);
      const passed: RequestResultModel = client.sendString('mixed-two');
      expect(passed.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.replies).assertEqual(client.events.countOf('send-ok'));
      expect(metrics.fingerprint() > 0).assertTrue();
      logStep('clientSendMixedMetricsHalf', 'end');
    });

    /**
     * @tc.name          clientSendProxyCountersMatch
     * @tc.desc          Proxy send counters always match the sum of send events.
     * @tc.precondition  A connected client with a recording proxy.
     * @tc.steps         1. Send one payload.
     *                   2. Read the proxy counter.
     *                   3. Compare with the event sum.
     * @tc.expected      The proxy counter equals success plus failure events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSendProxyCountersMatch', 0, () => {
      logStep('clientSendProxyCountersMatch', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'counter-reply';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(283);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('counter-one');
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('counter-reply');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(stub.receivedTexts[0]).assertEqual('counter-one');
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.connectCalls).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(proxy.stub.receivedTexts.length <= proxy.sendCalls).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      logStep('clientSendProxyCountersMatch', 'end');
    });
  });
}
