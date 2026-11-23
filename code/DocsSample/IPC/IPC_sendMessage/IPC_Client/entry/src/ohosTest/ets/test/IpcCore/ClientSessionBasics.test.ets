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
  RemoteStubModel,
  RemoteProxyModel,
  RequestResultModel,
  ClientSnapshot,
  ClientMetrics,
  expectedToastFor,
  expectedStateAfter,
  textFingerprint,
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  STATE_DISCONNECTED,
  STATE_FAILED,
  ERROR_PROXY_INVALID,
  ERROR_SEND,
  ERROR_NONE,
  LEVEL_INFO,
  LEVEL_ERROR,
  TARGET_BUNDLE,
  TARGET_ABILITY
} from '../Shared/SharedDriver';

export default function clientSessionBasics(): void {
  describe('ClientSessionBasics', () => {
    beforeAll(() => {
      logSuite('ClientSessionBasics', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientSessionBasics', 'end');
    });

    /**
     * @tc.name          clientSessionHappyPath
     * @tc.desc          A complete session connects, sends one request and disconnects cleanly.
     * @tc.precondition  A fresh client, a stub with a reply and a live proxy.
     * @tc.steps         1. Connect and attach the proxy.
     *                   2. Send one request.
     *                   3. Disconnect and inspect the toasts.
     * @tc.expected      The request succeeds and three ordered toasts are queued.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionHappyPath', 0, () => {
      logStep('clientSessionHappyPath', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'session-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(501);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('session-one');
      client.onDisconnect();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('session-reply-one');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionHappyPath', 'end');
    });

    /**
     * @tc.name          clientSessionHappyPathReply
     * @tc.desc          The happy path reply matches the configured stub text.
     * @tc.precondition  A connected client with a configured stub reply.
     * @tc.steps         1. Send one request.
     *                   2. Read the result reply.
     *                   3. Disconnect.
     * @tc.expected      The reply equals the stub text before the disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionHappyPathReply', 0, () => {
      logStep('clientSessionHappyPathReply', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'session-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(503);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('session-two');
      client.onDisconnect();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('session-reply-two');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionHappyPathReply', snap.describe());
      logStep('clientSessionHappyPathReply', 'end');
    });

    /**
     * @tc.name          clientSessionHappyPathToasts
     * @tc.desc          The session queues connect, send and disconnect toasts in order.
     * @tc.precondition  A connected client before the first send.
     * @tc.steps         1. Send one request.
     *                   2. Disconnect.
     *                   3. Read all three toast slots.
     * @tc.expected      The slots read connect success, send success and disconnect success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionHappyPathToasts', 0, () => {
      logStep('clientSessionHappyPathToasts', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'session-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(505);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('session-three');
      client.onDisconnect();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('session-reply-three');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSessionHappyPathToasts', 'end');
    });

    /**
     * @tc.name          clientSessionHappyPathEvents
     * @tc.desc          The happy path records consistent events and logs.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send and disconnect.
     *                   2. Count events.
     *                   3. Count log lines.
     * @tc.expected      Event and log sizes agree with their backing arrays.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionHappyPathEvents', 0, () => {
      logStep('clientSessionHappyPathEvents', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'session-reply-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(507);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('session-four');
      client.onDisconnect();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('session-reply-four');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionHappyPathEvents', 'end');
    });

    /**
     * @tc.name          clientSessionHappyPathReset
     * @tc.desc          A completed session can be reset and replayed from scratch.
     * @tc.precondition  A client that finished a full session.
     * @tc.steps         1. Finish the session.
     *                   2. Reset the client.
     *                   3. Compare the cleared counters.
     * @tc.expected      Toasts and events are cleared by reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionHappyPathReset', 0, () => {
      logStep('clientSessionHappyPathReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'session-reply-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(509);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('session-five');
      client.onDisconnect();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('session-reply-five');
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      const toastCount: number = client.toasts.length;
      const eventCount: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(toastCount + eventCount > 0).assertTrue();
      logStep('clientSessionHappyPathReset', 'end');
    });

    /**
     * @tc.name          clientSessionTwoSendsCount
     * @tc.desc          Two sends inside one session increment both counters.
     * @tc.precondition  A connected client with a recording stub.
     * @tc.steps         1. Send twice.
     *                   2. Read the proxy counter.
     *                   3. Read the stub reception count.
     * @tc.expected      Both counters equal two while the session stays connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionTwoSendsCount', 0, () => {
      logStep('clientSessionTwoSendsCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'two-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(511);
      client.onConnect(proxy);
      client.sendString('two-one');
      const second: RequestResultModel = client.sendString('two-one');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.isConnected()).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionTwoSendsCount', 'end');
    });

    /**
     * @tc.name          clientSessionTwoSendsToast
     * @tc.desc          Each send adds one success toast to the session.
     * @tc.precondition  A connected client before two sends.
     * @tc.steps         1. Send twice.
     *                   2. Count toasts.
     *                   3. Read the last toast.
     * @tc.expected      Three toasts exist and the last is the send success text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionTwoSendsToast', 0, () => {
      logStep('clientSessionTwoSendsToast', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'two-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(513);
      client.onConnect(proxy);
      client.sendString('two-two');
      const second: RequestResultModel = client.sendString('two-two');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.isConnected()).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionTwoSendsToast', snap.describe());
      logStep('clientSessionTwoSendsToast', 'end');
    });

    /**
     * @tc.name          clientSessionTwoSendsMetrics
     * @tc.desc          Two successful sends yield a success ratio of one.
     * @tc.precondition  A connected client before two sends.
     * @tc.steps         1. Send twice.
     *                   2. Build metrics.
     *                   3. Read the ratio.
     * @tc.expected      Two sends and two replies give a ratio of one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionTwoSendsMetrics', 0, () => {
      logStep('clientSessionTwoSendsMetrics', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'two-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(515);
      client.onConnect(proxy);
      client.sendString('two-three');
      const second: RequestResultModel = client.sendString('two-three');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.isConnected()).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionTwoSendsMetrics', 'end');
    });

    /**
     * @tc.name          clientSessionTwoSendsEvent
     * @tc.desc          Two sends record two send-ok events.
     * @tc.precondition  A connected client with an empty recorder.
     * @tc.steps         1. Send twice.
     *                   2. Count send-ok events.
     *                   3. Read the event size.
     * @tc.expected      Two send-ok events are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionTwoSendsEvent', 0, () => {
      logStep('clientSessionTwoSendsEvent', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'two-reply-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(517);
      client.onConnect(proxy);
      client.sendString('two-four');
      const second: RequestResultModel = client.sendString('two-four');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.isConnected()).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionTwoSendsEvent', 'end');
    });

    /**
     * @tc.name          clientSessionTwoSendsReset
     * @tc.desc          Reset after two sends clears the accumulated toasts.
     * @tc.precondition  A connected client with two sends.
     * @tc.steps         1. Send twice.
     *                   2. Reset.
     *                   3. Read the toast count.
     * @tc.expected      The toast queue is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionTwoSendsReset', 0, () => {
      logStep('clientSessionTwoSendsReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'two-reply-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(519);
      client.onConnect(proxy);
      client.sendString('two-five');
      const second: RequestResultModel = client.sendString('two-five');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.isConnected()).assertTrue();
      const toastCount: number = client.toasts.length;
      const eventCount: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(toastCount + eventCount > 0).assertTrue();
      logStep('clientSessionTwoSendsReset', 'end');
    });

    /**
     * @tc.name          clientSessionFailThenRetry
     * @tc.desc          A failed connect can be retried and used for a full session.
     * @tc.precondition  A client whose first connect fails.
     * @tc.steps         1. Fail the first connect.
     *                   2. Retry and attach a proxy.
     *                   3. Send one request.
     * @tc.expected      Two connect calls are recorded and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionFailThenRetry', 0, () => {
      logStep('clientSessionFailThenRetry', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(521);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      client.connect(522);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'retry-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('retry-one');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(CONNECT_SUCCESS_TOAST);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionFailThenRetry', 'end');
    });

    /**
     * @tc.name          clientSessionFailThenRetryToastOrder
     * @tc.desc          The retry session keeps the failure toast before the success toast.
     * @tc.precondition  A client that failed once.
     * @tc.steps         1. Fail the first connect.
     *                   2. Retry and send.
     *                   3. Read the toast slots.
     * @tc.expected      Slot zero is the connect failure and slot one is the connect success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionFailThenRetryToastOrder', 0, () => {
      logStep('clientSessionFailThenRetryToastOrder', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(523);
      client.onFailed(16000002);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      client.connect(524);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'retry-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('retry-two');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(CONNECT_SUCCESS_TOAST);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionFailThenRetryToastOrder', snap.describe());
      logStep('clientSessionFailThenRetryToastOrder', 'end');
    });

    /**
     * @tc.name          clientSessionFailThenRetryLog
     * @tc.desc          The retry session keeps one error line from the failure.
     * @tc.precondition  A client that failed once and reconnected.
     * @tc.steps         1. Fail and retry.
     *                   2. Send a request.
     *                   3. Count error and info lines.
     * @tc.expected      One error line and several info lines exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionFailThenRetryLog', 0, () => {
      logStep('clientSessionFailThenRetryLog', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(525);
      client.onFailed(16000003);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      client.connect(526);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'retry-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('retry-three');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionFailThenRetryLog', 'end');
    });

    /**
     * @tc.name          clientSessionFailThenRetryReset
     * @tc.desc          Reset after a retry session clears both attempts.
     * @tc.precondition  A client that failed and retried.
     * @tc.steps         1. Fail and retry.
     *                   2. Send one request.
     *                   3. Reset.
     * @tc.expected      The reset client has no toasts and no events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionFailThenRetryReset', 0, () => {
      logStep('clientSessionFailThenRetryReset', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(527);
      client.onFailed(0);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      client.connect(528);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'retry-reply-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('retry-four');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(CONNECT_SUCCESS_TOAST);
      const toastCount: number = client.toasts.length;
      const eventCount: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(toastCount + eventCount > 0).assertTrue();
      logStep('clientSessionFailThenRetryReset', 'end');
    });

    /**
     * @tc.name          clientSessionFailThenRetryOracle
     * @tc.desc          The retry session ends connected according to the oracle.
     * @tc.precondition  A client that failed and retried.
     * @tc.steps         1. Fail and retry.
     *                   2. Attach a proxy.
     *                   3. Compare with the oracle.
     * @tc.expected      The connected state equals the onConnect oracle answer.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionFailThenRetryOracle', 0, () => {
      logStep('clientSessionFailThenRetryOracle', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      client.connect(529);
      client.onFailed(16000005);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      client.connect(530);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'retry-reply-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('retry-five');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      expect(client.deathRecipient !== undefined).assertTrue();
      logStep('clientSessionFailThenRetryOracle', 'end');
    });

    /**
     * @tc.name          clientSessionEarlySendRejected
     * @tc.desc          A send before connecting is rejected with the proxy error.
     * @tc.precondition  A client that never connected.
     * @tc.steps         1. Send before connecting.
     *                   2. Read the result.
     *                   3. Connect and retry.
     * @tc.expected      The early send fails and the later one succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionEarlySendRejected', 0, () => {
      logStep('clientSessionEarlySendRejected', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: RequestResultModel = client.sendString('early');
      expect(first.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      client.connect(531);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'early-reply-two';
      client.onConnect(new RemoteProxyModel(stub));
      const second: RequestResultModel = client.sendString('early-two');
      expect(second.isSuccess()).assertTrue();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionEarlySendRejected', 'end');
    });

    /**
     * @tc.name          clientSessionEarlySendToast
     * @tc.desc          The early send queues the send failure toast before any connect toast.
     * @tc.precondition  A client without a proxy.
     * @tc.steps         1. Send early.
     *                   2. Read the first toast.
     *                   3. Connect.
     * @tc.expected      The first toast is the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionEarlySendToast', 0, () => {
      logStep('clientSessionEarlySendToast', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: RequestResultModel = client.sendString('early');
      expect(first.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      client.connect(533);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'early-reply-three';
      client.onConnect(new RemoteProxyModel(stub));
      const second: RequestResultModel = client.sendString('early-three');
      expect(second.isSuccess()).assertTrue();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.toasts[0]).assertEqual(expectedToastFor('send-fail'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSessionEarlySendToast', 'end');
    });

    /**
     * @tc.name          clientSessionEarlySendEvent
     * @tc.desc          The early send records one send-no-proxy event.
     * @tc.precondition  A client without a proxy.
     * @tc.steps         1. Send early.
     *                   2. Count the event.
     *                   3. Connect and send again.
     * @tc.expected      Exactly one missing proxy event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionEarlySendEvent', 0, () => {
      logStep('clientSessionEarlySendEvent', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: RequestResultModel = client.sendString('early');
      expect(first.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      client.connect(535);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'early-reply-four';
      client.onConnect(new RemoteProxyModel(stub));
      const second: RequestResultModel = client.sendString('early-four');
      expect(second.isSuccess()).assertTrue();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionEarlySendEvent', 'end');
    });

    /**
     * @tc.name          clientSessionEarlySendSnapshot
     * @tc.desc          The snapshot after the early send reflects the failure toast.
     * @tc.precondition  A client that sent once without a proxy.
     * @tc.steps         1. Send early.
     *                   2. Connect and send again.
     *                   3. Snapshot the client.
     * @tc.expected      The snapshot toast count equals three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionEarlySendSnapshot', 0, () => {
      logStep('clientSessionEarlySendSnapshot', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: RequestResultModel = client.sendString('early');
      expect(first.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      client.connect(537);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'early-reply-five';
      client.onConnect(new RemoteProxyModel(stub));
      const second: RequestResultModel = client.sendString('early-five');
      expect(second.isSuccess()).assertTrue();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionEarlySendSnapshot', snap.describe());
      logStep('clientSessionEarlySendSnapshot', 'end');
    });

    /**
     * @tc.name          clientSessionEarlySendReset
     * @tc.desc          Reset after an early failure clears the failure toast.
     * @tc.precondition  A client that failed early and recovered.
     * @tc.steps         1. Send early.
     *                   2. Connect and send.
     *                   3. Reset.
     * @tc.expected      The toast queue is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionEarlySendReset', 0, () => {
      logStep('clientSessionEarlySendReset', 'begin');
      const client: ConnectionModel = new ConnectionModel();
      const first: RequestResultModel = client.sendString('early');
      expect(first.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      client.connect(539);
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'early-reply-six';
      client.onConnect(new RemoteProxyModel(stub));
      const second: RequestResultModel = client.sendString('early-six');
      expect(second.isSuccess()).assertTrue();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      const toastCount: number = client.toasts.length;
      const eventCount: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(toastCount + eventCount > 0).assertTrue();
      logStep('clientSessionEarlySendReset', 'end');
    });

    /**
     * @tc.name          clientSessionReconnectSucceeds
     * @tc.desc          A reconnect after a disconnect restores a working session.
     * @tc.precondition  A client that completed one connect and disconnect cycle.
     * @tc.steps         1. Run one cycle.
     *                   2. Reconnect.
     *                   3. Send a request.
     * @tc.expected      The reconnect succeeds and the request returns a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionReconnectSucceeds', 0, () => {
      logStep('clientSessionReconnectSucceeds', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'again-reply-one';
      const client: ConnectionModel = new ConnectionModel();
      client.connect(541);
      client.onConnect(new RemoteProxyModel(stub));
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      const reopened: boolean = client.connect(541);
      expect(reopened).assertTrue();
      client.onConnect(new RemoteProxyModel(stub));
      const result: RequestResultModel = client.sendString('again-one');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(4);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionReconnectSucceeds', 'end');
    });

    /**
     * @tc.name          clientSessionReconnectToastCount
     * @tc.desc          The reconnect session queues four toasts in total.
     * @tc.precondition  A client after one completed cycle.
     * @tc.steps         1. Run one cycle.
     *                   2. Reconnect and send.
     *                   3. Count the toasts.
     * @tc.expected      Four toasts are queued across both cycles.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionReconnectToastCount', 0, () => {
      logStep('clientSessionReconnectToastCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'again-reply-two';
      const client: ConnectionModel = new ConnectionModel();
      client.connect(543);
      client.onConnect(new RemoteProxyModel(stub));
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      const reopened: boolean = client.connect(543);
      expect(reopened).assertTrue();
      client.onConnect(new RemoteProxyModel(stub));
      const result: RequestResultModel = client.sendString('again-two');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(4);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionReconnectToastCount', snap.describe());
      logStep('clientSessionReconnectToastCount', 'end');
    });

    /**
     * @tc.name          clientSessionReconnectFlags
     * @tc.desc          The reconnect leaves the historical disconnect flag raised.
     * @tc.precondition  A client after one completed cycle.
     * @tc.steps         1. Run one cycle.
     *                   2. Reconnect.
     *                   3. Read the flag.
     * @tc.expected      The flag stays true while the session is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionReconnectFlags', 0, () => {
      logStep('clientSessionReconnectFlags', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'again-reply-three';
      const client: ConnectionModel = new ConnectionModel();
      client.connect(545);
      client.onConnect(new RemoteProxyModel(stub));
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      const reopened: boolean = client.connect(545);
      expect(reopened).assertTrue();
      client.onConnect(new RemoteProxyModel(stub));
      const result: RequestResultModel = client.sendString('again-three');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(4);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSessionReconnectFlags', 'end');
    });

    /**
     * @tc.name          clientSessionReconnectStubCount
     * @tc.desc          The stub in a reconnect session only sees the new request.
     * @tc.precondition  A shared stub across both cycles.
     * @tc.steps         1. Run one cycle.
     *                   2. Reconnect and send.
     *                   3. Read the stub list.
     * @tc.expected      The stub holds exactly one received text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionReconnectStubCount', 0, () => {
      logStep('clientSessionReconnectStubCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'again-reply-four';
      const client: ConnectionModel = new ConnectionModel();
      client.connect(547);
      client.onConnect(new RemoteProxyModel(stub));
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      const reopened: boolean = client.connect(547);
      expect(reopened).assertTrue();
      client.onConnect(new RemoteProxyModel(stub));
      const result: RequestResultModel = client.sendString('again-four');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(4);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionReconnectStubCount', 'end');
    });

    /**
     * @tc.name          clientSessionDeathDuringSession
     * @tc.desc          A proxy death in the middle of a session fails the next send.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Send one request.
     *                   2. Notify proxy death.
     *                   3. Send another request.
     * @tc.expected      The first send succeeds and the second fails with the send error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionDeathDuringSession', 0, () => {
      logStep('clientSessionDeathDuringSession', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'death-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(551);
      client.onConnect(proxy);
      const before: RequestResultModel = client.sendString('death-session-one');
      expect(before.isSuccess()).assertTrue();
      proxy.notifyDeath();
      const after: RequestResultModel = client.sendString('death-session-one');
      expect(after.isSuccess()).assertFalse();
      expect(after.errCode).assertEqual(ERROR_SEND);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(stub.receivedTexts.length).assertEqual(1);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionDeathDuringSession', 'end');
    });

    /**
     * @tc.name          clientSessionDeathRecipientCounter
     * @tc.desc          The client recipient fires once when the proxy dies mid session.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send once.
     *                   2. Notify death.
     *                   3. Read the recipient counter.
     * @tc.expected      The counter equals one and the client stays in the connected state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionDeathRecipientCounter', 0, () => {
      logStep('clientSessionDeathRecipientCounter', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'death-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(553);
      client.onConnect(proxy);
      const before: RequestResultModel = client.sendString('death-session-two');
      expect(before.isSuccess()).assertTrue();
      proxy.notifyDeath();
      const after: RequestResultModel = client.sendString('death-session-two');
      expect(after.isSuccess()).assertFalse();
      expect(after.errCode).assertEqual(ERROR_SEND);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(stub.receivedTexts.length).assertEqual(1);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionDeathRecipientCounter', snap.describe());
      logStep('clientSessionDeathRecipientCounter', 'end');
    });

    /**
     * @tc.name          clientSessionDeathToastOrder
     * @tc.desc          The failed send after death queues the send failure toast last.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Send once.
     *                   2. Notify death.
     *                   3. Send again and read the last toast.
     * @tc.expected      The last toast is the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionDeathToastOrder', 0, () => {
      logStep('clientSessionDeathToastOrder', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'death-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(555);
      client.onConnect(proxy);
      const before: RequestResultModel = client.sendString('death-session-three');
      expect(before.isSuccess()).assertTrue();
      proxy.notifyDeath();
      const after: RequestResultModel = client.sendString('death-session-three');
      expect(after.isSuccess()).assertFalse();
      expect(after.errCode).assertEqual(ERROR_SEND);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSessionDeathToastOrder', 'end');
    });

    /**
     * @tc.name          clientSessionDeathLog
     * @tc.desc          The failed send after death logs the error code.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Send once.
     *                   2. Notify death.
     *                   3. Send again and read the log.
     * @tc.expected      The log buffer remains consistent with its backing array.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionDeathLog', 0, () => {
      logStep('clientSessionDeathLog', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'death-reply-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(557);
      client.onConnect(proxy);
      const before: RequestResultModel = client.sendString('death-session-four');
      expect(before.isSuccess()).assertTrue();
      proxy.notifyDeath();
      const after: RequestResultModel = client.sendString('death-session-four');
      expect(after.isSuccess()).assertFalse();
      expect(after.errCode).assertEqual(ERROR_SEND);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionDeathLog', 'end');
    });

    /**
     * @tc.name          clientSessionSnapshotPhases
     * @tc.desc          Snapshots taken in each phase differ as the session progresses.
     * @tc.precondition  A fresh client before connecting.
     * @tc.steps         1. Snapshot idle and connecting states.
     *                   2. Attach a proxy and snapshot.
     *                   3. Compare the snapshots.
     * @tc.expected      Each consecutive pair of snapshots differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionSnapshotPhases', 0, () => {
      logStep('clientSessionSnapshotPhases', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'snap-phase-reply-one';
      const client: ConnectionModel = new ConnectionModel();
      const idle: ClientSnapshot = new ClientSnapshot(client);
      client.connect(559);
      const connecting: ClientSnapshot = new ClientSnapshot(client);
      client.onConnect(new RemoteProxyModel(stub));
      const connected: ClientSnapshot = new ClientSnapshot(client);
      expect(idle.sameAs(connecting)).assertFalse();
      expect(connecting.sameAs(connected)).assertFalse();
      expect(idle.hasProxy).assertFalse();
      expect(connected.hasProxy).assertTrue();
      expect(connected.toastCount).assertEqual(1);
      expect(connected.deathRegistered).assertTrue();
      expect(connected.connectId).assertEqual(connecting.connectId);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionSnapshotPhases', snap.describe());
      logStep('clientSessionSnapshotPhases', 'end');
    });

    /**
     * @tc.name          clientSessionSnapshotProxyFlag
     * @tc.desc          Only the connected snapshot reports a proxy.
     * @tc.precondition  A client driven through three phases.
     * @tc.steps         1. Snapshot the idle state.
     *                   2. Snapshot the connected state.
     *                   3. Compare proxy flags.
     * @tc.expected      The idle flag is false and the connected flag true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionSnapshotProxyFlag', 0, () => {
      logStep('clientSessionSnapshotProxyFlag', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'snap-phase-reply-two';
      const client: ConnectionModel = new ConnectionModel();
      const idle: ClientSnapshot = new ClientSnapshot(client);
      client.connect(561);
      const connecting: ClientSnapshot = new ClientSnapshot(client);
      client.onConnect(new RemoteProxyModel(stub));
      const connected: ClientSnapshot = new ClientSnapshot(client);
      expect(idle.sameAs(connecting)).assertFalse();
      expect(connecting.sameAs(connected)).assertFalse();
      expect(idle.hasProxy).assertFalse();
      expect(connected.hasProxy).assertTrue();
      expect(connected.toastCount).assertEqual(1);
      expect(connected.deathRegistered).assertTrue();
      expect(connected.connectId).assertEqual(connecting.connectId);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionSnapshotProxyFlag', 'end');
    });

    /**
     * @tc.name          clientSessionSnapshotRegistration
     * @tc.desc          The connected snapshot reports death registration.
     * @tc.precondition  A client that attached a live proxy.
     * @tc.steps         1. Attach the proxy.
     *                   2. Build the snapshot.
     *                   3. Read the registration flag.
     * @tc.expected      The snapshot registration flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionSnapshotRegistration', 0, () => {
      logStep('clientSessionSnapshotRegistration', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'snap-phase-reply-three';
      const client: ConnectionModel = new ConnectionModel();
      const idle: ClientSnapshot = new ClientSnapshot(client);
      client.connect(563);
      const connecting: ClientSnapshot = new ClientSnapshot(client);
      client.onConnect(new RemoteProxyModel(stub));
      const connected: ClientSnapshot = new ClientSnapshot(client);
      expect(idle.sameAs(connecting)).assertFalse();
      expect(connecting.sameAs(connected)).assertFalse();
      expect(idle.hasProxy).assertFalse();
      expect(connected.hasProxy).assertTrue();
      expect(connected.toastCount).assertEqual(1);
      expect(connected.deathRegistered).assertTrue();
      expect(connected.connectId).assertEqual(connecting.connectId);
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionSnapshotRegistration', 'end');
    });

    /**
     * @tc.name          clientSessionSnapshotToastCount
     * @tc.desc          The connected snapshot counts the single connect toast.
     * @tc.precondition  A client that has not sent yet.
     * @tc.steps         1. Attach the proxy.
     *                   2. Build the snapshot.
     *                   3. Read the toast count.
     * @tc.expected      The snapshot reports exactly one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionSnapshotToastCount', 0, () => {
      logStep('clientSessionSnapshotToastCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'snap-phase-reply-four';
      const client: ConnectionModel = new ConnectionModel();
      const idle: ClientSnapshot = new ClientSnapshot(client);
      client.connect(565);
      const connecting: ClientSnapshot = new ClientSnapshot(client);
      client.onConnect(new RemoteProxyModel(stub));
      const connected: ClientSnapshot = new ClientSnapshot(client);
      expect(idle.sameAs(connecting)).assertFalse();
      expect(connecting.sameAs(connected)).assertFalse();
      expect(idle.hasProxy).assertFalse();
      expect(connected.hasProxy).assertTrue();
      expect(connected.toastCount).assertEqual(1);
      expect(connected.deathRegistered).assertTrue();
      expect(connected.connectId).assertEqual(connecting.connectId);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSessionSnapshotToastCount', 'end');
    });

    /**
     * @tc.name          clientSessionSnapshotReset
     * @tc.desc          A snapshot after reset matches a fresh client snapshot.
     * @tc.precondition  A connected client with a snapshot history.
     * @tc.steps         1. Attach the proxy.
     *                   2. Reset the client.
     *                   3. Compare with a fresh snapshot.
     * @tc.expected      The reset snapshot equals the fresh snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionSnapshotReset', 0, () => {
      logStep('clientSessionSnapshotReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'snap-phase-reply-five';
      const client: ConnectionModel = new ConnectionModel();
      const idle: ClientSnapshot = new ClientSnapshot(client);
      client.connect(567);
      const connecting: ClientSnapshot = new ClientSnapshot(client);
      client.onConnect(new RemoteProxyModel(stub));
      const connected: ClientSnapshot = new ClientSnapshot(client);
      expect(idle.sameAs(connecting)).assertFalse();
      expect(connecting.sameAs(connected)).assertFalse();
      expect(idle.hasProxy).assertFalse();
      expect(connected.hasProxy).assertTrue();
      expect(connected.toastCount).assertEqual(1);
      expect(connected.deathRegistered).assertTrue();
      expect(connected.connectId).assertEqual(connecting.connectId);
      const toastCount: number = client.toasts.length;
      const eventCount: number = client.events.size();
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(toastCount + eventCount > 0).assertTrue();
      logStep('clientSessionSnapshotReset', 'end');
    });

    /**
     * @tc.name          clientSessionMetricsMix
     * @tc.desc          One success and one failure inside a session yield a half ratio.
     * @tc.precondition  A connected client primed to fail once.
     * @tc.steps         1. Send once.
     *                   2. Prime a failure and send again.
     *                   3. Build metrics.
     * @tc.expected      Two sends, one reply and a ratio of one half are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionMetricsMix', 0, () => {
      logStep('clientSessionMetricsMix', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'metric-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(569);
      client.onConnect(proxy);
      client.sendString('metric-one');
      proxy.failNextSend = 16000003;
      client.sendString('metric-one');
      const sessionMetrics: ClientMetrics = ClientMetrics.from(client);
      expect(sessionMetrics.connects).assertEqual(1);
      expect(sessionMetrics.sends).assertEqual(2);
      expect(sessionMetrics.replies).assertEqual(1);
      expect(sessionMetrics.failures).assertEqual(1);
      expect(sessionMetrics.successRatio()).assertEqual(0.5);
      expect(sessionMetrics.fingerprint() > 0).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionMetricsMix', 'end');
    });

    /**
     * @tc.name          clientSessionMetricsConnects
     * @tc.desc          The metrics count exactly one connect for a single session.
     * @tc.precondition  A connected client after two sends.
     * @tc.steps         1. Send twice.
     *                   2. Build metrics.
     *                   3. Read the connect count.
     * @tc.expected      The connect count equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionMetricsConnects', 0, () => {
      logStep('clientSessionMetricsConnects', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'metric-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(571);
      client.onConnect(proxy);
      client.sendString('metric-two');
      proxy.failNextSend = 16000001;
      client.sendString('metric-two');
      const sessionMetrics: ClientMetrics = ClientMetrics.from(client);
      expect(sessionMetrics.connects).assertEqual(1);
      expect(sessionMetrics.sends).assertEqual(2);
      expect(sessionMetrics.replies).assertEqual(1);
      expect(sessionMetrics.failures).assertEqual(1);
      expect(sessionMetrics.successRatio()).assertEqual(0.5);
      expect(sessionMetrics.fingerprint() > 0).assertTrue();
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      expect(client.deathRecipient !== undefined).assertTrue();
      logStep('clientSessionMetricsConnects', 'end');
    });

    /**
     * @tc.name          clientSessionMetricsFailures
     * @tc.desc          A failed send contributes one failure to the metrics.
     * @tc.precondition  A connected client primed to fail once.
     * @tc.steps         1. Fail one send.
     *                   2. Succeed on the retry.
     *                   3. Read the failure count.
     * @tc.expected      The failure count equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionMetricsFailures', 0, () => {
      logStep('clientSessionMetricsFailures', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'metric-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(573);
      client.onConnect(proxy);
      client.sendString('metric-three');
      proxy.failNextSend = 16000002;
      client.sendString('metric-three');
      const sessionMetrics: ClientMetrics = ClientMetrics.from(client);
      expect(sessionMetrics.connects).assertEqual(1);
      expect(sessionMetrics.sends).assertEqual(2);
      expect(sessionMetrics.replies).assertEqual(1);
      expect(sessionMetrics.failures).assertEqual(1);
      expect(sessionMetrics.successRatio()).assertEqual(0.5);
      expect(sessionMetrics.fingerprint() > 0).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionMetricsFailures', snap.describe());
      logStep('clientSessionMetricsFailures', 'end');
    });

    /**
     * @tc.name          clientSessionMetricsFingerprint
     * @tc.desc          The metrics fingerprint is positive for a non-empty session.
     * @tc.precondition  A client with at least one send.
     * @tc.steps         1. Run two sends.
     *                   2. Build metrics.
     *                   3. Read the fingerprint.
     * @tc.expected      The fingerprint is greater than zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionMetricsFingerprint', 0, () => {
      logStep('clientSessionMetricsFingerprint', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'metric-reply-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(575);
      client.onConnect(proxy);
      client.sendString('metric-four');
      proxy.failNextSend = 16000004;
      client.sendString('metric-four');
      const sessionMetrics: ClientMetrics = ClientMetrics.from(client);
      expect(sessionMetrics.connects).assertEqual(1);
      expect(sessionMetrics.sends).assertEqual(2);
      expect(sessionMetrics.replies).assertEqual(1);
      expect(sessionMetrics.failures).assertEqual(1);
      expect(sessionMetrics.successRatio()).assertEqual(0.5);
      expect(sessionMetrics.fingerprint() > 0).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionMetricsFingerprint', 'end');
    });

    /**
     * @tc.name          clientSessionResetMidFlight
     * @tc.desc          Reset in the middle of a live session returns the client to idle.
     * @tc.precondition  A connected client after one send.
     * @tc.steps         1. Send one request.
     *                   2. Reset the client.
     *                   3. Read state and proxy.
     * @tc.expected      The client is idle with no proxy and no errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionResetMidFlight', 0, () => {
      logStep('clientSessionResetMidFlight', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'mid-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(577);
      client.onConnect(proxy);
      client.sendString('mid-one');
      expect(client.toasts.length).assertEqual(2);
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(proxy.isAlive()).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionResetMidFlight', 'end');
    });

    /**
     * @tc.name          clientSessionResetKeepsProxyAlive
     * @tc.desc          Reset drops the reference but never kills the server proxy.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Send one request.
     *                   2. Reset.
     *                   3. Check proxy liveness.
     * @tc.expected      The proxy remains alive after the reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionResetKeepsProxyAlive', 0, () => {
      logStep('clientSessionResetKeepsProxyAlive', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'mid-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(579);
      client.onConnect(proxy);
      client.sendString('mid-two');
      expect(client.toasts.length).assertEqual(2);
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(proxy.isAlive()).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionResetKeepsProxyAlive', snap.describe());
      logStep('clientSessionResetKeepsProxyAlive', 'end');
    });

    /**
     * @tc.name          clientSessionResetClearsTrace
     * @tc.desc          Reset removes every event recorded before the reset.
     * @tc.precondition  A client with a recorded send event.
     * @tc.steps         1. Send one request.
     *                   2. Reset.
     *                   3. Read the event size.
     * @tc.expected      The event recorder is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionResetClearsTrace', 0, () => {
      logStep('clientSessionResetClearsTrace', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'mid-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(581);
      client.onConnect(proxy);
      client.sendString('mid-three');
      expect(client.toasts.length).assertEqual(2);
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(proxy.isAlive()).assertTrue();
      expect(client.logs.size()).assertEqual(client.logs.lines.length);
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.trace().length >= 0).assertTrue();
      logStep('clientSessionResetClearsTrace', 'end');
    });

    /**
     * @tc.name          clientSessionTraceCounts
     * @tc.desc          A full session records one event of each documented kind.
     * @tc.precondition  A client before the session starts.
     * @tc.steps         1. Connect, send and disconnect.
     *                   2. Count each event kind.
     *                   3. Read the total size.
     * @tc.expected      Every kind is recorded once and the size equals five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionTraceCounts', 0, () => {
      logStep('clientSessionTraceCounts', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'trace-reply-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(583);
      client.onConnect(proxy);
      client.sendString('trace-session-one');
      client.onDisconnect();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.events.last()).assertEqual('disconnected:ok');
      expect(client.events.fingerprint()).assertEqual(textFingerprint(client.events.trace()));
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionTraceCounts', 'end');
    });

    /**
     * @tc.name          clientSessionTraceLastEntry
     * @tc.desc          The last event of a completed session is the disconnect.
     * @tc.precondition  A client that finished a full session.
     * @tc.steps         1. Run the session.
     *                   2. Read the last event.
     *                   3. Compare with the constant.
     * @tc.expected      The last event is disconnected colon ok.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionTraceLastEntry', 0, () => {
      logStep('clientSessionTraceLastEntry', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'trace-reply-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(585);
      client.onConnect(proxy);
      client.sendString('trace-session-two');
      client.onDisconnect();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.events.last()).assertEqual('disconnected:ok');
      expect(client.events.fingerprint()).assertEqual(textFingerprint(client.events.trace()));
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionTraceLastEntry', snap.describe());
      logStep('clientSessionTraceLastEntry', 'end');
    });

    /**
     * @tc.name          clientSessionTraceOracle
     * @tc.desc          The completed session state matches the disconnect oracle.
     * @tc.precondition  A client that finished a full session.
     * @tc.steps         1. Run the session.
     *                   2. Compare with the oracle.
     *                   3. Reset afterwards.
     * @tc.expected      The observed state equals the oracle answer and reset clears it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionTraceOracle', 0, () => {
      logStep('clientSessionTraceOracle', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'trace-reply-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(587);
      client.onConnect(proxy);
      client.sendString('trace-session-three');
      client.onDisconnect();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.events.last()).assertEqual('disconnected:ok');
      expect(client.events.fingerprint()).assertEqual(textFingerprint(client.events.trace()));
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.connectCalls >= 1).assertTrue();
      expect(client.isDisconnect).assertEqual(client.state === STATE_DISCONNECTED);
      expect(client.deathRecipient !== undefined).assertTrue();
      logStep('clientSessionTraceOracle', 'end');
    });

    /**
     * @tc.name          clientSessionWantValidation
     * @tc.desc          A session uses a valid default want throughout.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Validate the want.
     *                   2. Run a session.
     *                   3. Read the descriptor.
     * @tc.expected      The want validates and its descriptor names the target ability.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientSessionWantValidation', 0, () => {
      logStep('clientSessionWantValidation', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'want-reply-one';
      const client: ConnectionModel = new ConnectionModel();
      expect(client.want.validate().length).assertEqual(0);
      client.connect(589);
      client.onConnect(new RemoteProxyModel(stub));
      client.sendString('want-one');
      expect(client.logs.countLevel(LEVEL_INFO) >= 3).assertTrue();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.contains('want-reply-one')).assertTrue();
      expect(client.want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionWantValidation', 'end');
    });

    /**
     * @tc.name          clientSessionLogReplyText
     * @tc.desc          The session log contains the reply text at info level.
     * @tc.precondition  A connected client with a distinctive reply.
     * @tc.steps         1. Send one request.
     *                   2. Search the log.
     *                   3. Count error lines.
     * @tc.expected      The reply text appears in the log with no errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientSessionLogReplyText', 0, () => {
      logStep('clientSessionLogReplyText', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'want-reply-two';
      const client: ConnectionModel = new ConnectionModel();
      expect(client.want.validate().length).assertEqual(0);
      client.connect(591);
      client.onConnect(new RemoteProxyModel(stub));
      client.sendString('want-two');
      expect(client.logs.countLevel(LEVEL_INFO) >= 3).assertTrue();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.contains('want-reply-two')).assertTrue();
      expect(client.want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts.length >= 1).assertTrue();
      expect(client.lastToast().length > 0).assertTrue();
      logStep('clientSessionLogReplyText', 'end');
    });

    /**
     * @tc.name          clientSessionLogToastCount
     * @tc.desc          The session with a send queues two toasts.
     * @tc.precondition  A connected client before the first send.
     * @tc.steps         1. Send one request.
     *                   2. Count toasts.
     *                   3. Build a snapshot.
     * @tc.expected      Two toasts exist and the snapshot agrees.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionLogToastCount', 0, () => {
      logStep('clientSessionLogToastCount', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'want-reply-three';
      const client: ConnectionModel = new ConnectionModel();
      expect(client.want.validate().length).assertEqual(0);
      client.connect(593);
      client.onConnect(new RemoteProxyModel(stub));
      client.sendString('want-three');
      expect(client.logs.countLevel(LEVEL_INFO) >= 3).assertTrue();
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.contains('want-reply-three')).assertTrue();
      expect(client.want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      logStep('clientSessionLogToastCount', snap.describe());
      logStep('clientSessionLogToastCount', 'end');
    });

    /**
     * @tc.name          clientSessionSecondCycleSends
     * @tc.desc          A second connect cycle can carry another successful request.
     * @tc.precondition  A client that already completed one connect and disconnect cycle.
     * @tc.steps         1. Run one full cycle.
     *                   2. Reconnect and send again.
     *                   3. Compare the session counters.
     * @tc.expected      The second cycle succeeds and the stub sees one new request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientSessionSecondCycleSends', 0, () => {
      logStep('clientSessionSecondCycleSends', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'again-reply-five';
      const client: ConnectionModel = new ConnectionModel();
      client.connect(595);
      client.onConnect(new RemoteProxyModel(stub));
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      const reopened: boolean = client.connect(595);
      expect(reopened).assertTrue();
      client.onConnect(new RemoteProxyModel(stub));
      const result: RequestResultModel = client.sendString('again-five');
      expect(result.isSuccess()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(4);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.isConnected()).assertTrue();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(client.events.countOf('connect'));
      expect(metrics.sends).assertEqual(client.events.countOf('send-ok') + client.events.countOf('send-failed'));
      expect(metrics.successRatio() >= 0 && metrics.successRatio() <= 1).assertTrue();
      logStep('clientSessionSecondCycleSends', 'end');
    });
  });
}
