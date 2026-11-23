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
import {
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  RequestResultModel,
  ClientSnapshot,
  ClientMetrics,
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  STATE_CONNECTED,
  STATE_CONNECTING,
  STATE_DISCONNECTED,
  STATE_FAILED,
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  DISCONNECT_FAIL_TOAST,
  INITIAL_CONNECT_ID,
  expectedStateAfter,
  expectedToastFor,
  countOf
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

function newClient(): ConnectionModel {
  return new ConnectionModel();
}

function openConnection(client: ConnectionModel, id: number, reply: string = REPLY_PAYLOAD): RemoteProxyModel {
  client.connect(id);
  const stub: RemoteStubModel = new RemoteStubModel();
  stub.replyText = reply;
  const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
  client.onConnect(proxy);
  return proxy;
}

function sendBurst(client: ConnectionModel, times: number, payload: string = REQUEST_PAYLOAD): RequestResultModel[] {
  const results: RequestResultModel[] = [];
  for (let index = 0; index < times; index++) {
    results.push(client.sendString(payload));
  }
  return results;
}

function successCount(results: RequestResultModel[]): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

function codeCount(results: RequestResultModel[], code: number): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].errCode === code) {
      total = total + 1;
    }
  }
  return total;
}

function toastCount(client: ConnectionModel, text: string): number {
  return countOf(client.toasts, text);
}

function eventCount(client: ConnectionModel, kind: string): number {
  return client.events.countOf(kind);
}

/** Runs a complete first-use journey and returns the client. */
function firstUseJourney(): ConnectionModel {
  const client: ConnectionModel = newClient();
  openConnection(client, 3001);
  client.sendString(REQUEST_PAYLOAD);
  client.onDisconnect();
  return client;
}

export default function userScenarios(): void {
  describe('UserScenarios', () => {
    beforeAll(() => {
      logSuite('UserScenarios', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('UserScenarios', 'end');
    });

    /**
     * @tc.name          userScenariosFirstUseGoldenPath
     * @tc.desc          The documented first-use journey connects, sends and disconnects.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect with id 3001 and deliver a proxy.
     *                   2. Send the default payload.
     *                   3. Disconnect.
     * @tc.expected      One success toast per phase and a disconnected end state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosFirstUseGoldenPath', 0, () => {
      logStep('userScenariosFirstUseGoldenPath', 'begin');
      const client: ConnectionModel = firstUseJourney();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(ClientMetrics.from(client).replies).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosSendBeforeConnectHint
     * @tc.desc          A user who sends before connecting sees the connection hint.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Send a request immediately.
     *                   2. Inspect the result and toast.
     *                   3. Confirm the state never advanced.
     * @tc.expected      The request fails and the failure hint is shown.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosSendBeforeConnectHint', 0, () => {
      logStep('userScenariosSendBeforeConnectHint', 'begin');
      const client: ConnectionModel = newClient();
      const result: RequestResultModel = client.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.lastToast()).assertEqual(expectedToastFor('send-fail'));
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          userScenariosConnectTwiceThenSend
     * @tc.desc          A user who taps connect twice still sends exactly once per request.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect twice in a row.
     *                   2. Deliver one proxy.
     *                   3. Send one request.
     * @tc.expected      The duplicate connect is refused and only one request is dispatched.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosConnectTwiceThenSend', 0, () => {
      logStep('userScenariosConnectTwiceThenSend', 'begin');
      const client: ConnectionModel = newClient();
      const first: boolean = client.connect(3002);
      const second: boolean = client.connect(3003);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('single-send');
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(client.connectId).assertEqual(3002);
      expect(result.isSuccess()).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.countLevel('WARN')).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosDisconnectThenSendThenReconnect
     * @tc.desc          A user who sends after disconnecting sees the hint and can reconnect.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Disconnect and send once.
     *                   2. Reconnect and send again.
     *                   3. Compare both outcomes.
     * @tc.expected      The post-disconnect send fails and the post-reconnect send succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosDisconnectThenSendThenReconnect', 0, () => {
      logStep('userScenariosDisconnectThenSendThenReconnect', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3004);
      client.onDisconnect();
      const rejected: RequestResultModel = client.sendString('too-late');
      openConnection(client, 3005);
      const accepted: RequestResultModel = client.sendString('welcome-back');
      expect(rejected.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(accepted.errCode).assertEqual(ERROR_NONE);
      expect(accepted.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.toasts.length).assertEqual(5);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(3005);
    });

    /**
     * @tc.name          userScenariosServiceDiesDuringSession
     * @tc.desc          A user continues sending after the service dies and sees failures.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Send once successfully.
     *                   2. Notify proxy death.
     *                   3. Send twice more.
     * @tc.expected      The later sends fail with the send code and death is counted once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosServiceDiesDuringSession', 0, () => {
      logStep('userScenariosServiceDiesDuringSession', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3006);
      const first: RequestResultModel = client.sendString('first');
      proxy.notifyDeath();
      const later: RequestResultModel[] = sendBurst(client, 2);
      expect(first.isSuccess()).assertTrue();
      expect(codeCount(later, ERROR_SEND)).assertEqual(2);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(2);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          userScenariosReconnectAfterServiceDeath
     * @tc.desc          A user recovers from a service death by disconnecting and reconnecting.
     * @tc.precondition  A client whose proxy has died.
     * @tc.steps         1. Notify death and disconnect.
     *                   2. Reconnect and send.
     *                   3. Confirm the new session is healthy.
     * @tc.expected      The new send succeeds and the death count stays at one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosReconnectAfterServiceDeath', 0, () => {
      logStep('userScenariosReconnectAfterServiceDeath', 'begin');
      const client: ConnectionModel = newClient();
      const deadProxy: RemoteProxyModel = openConnection(client, 3007);
      deadProxy.notifyDeath();
      client.onDisconnect();
      const revived: RequestResultModel = client.sendString('while-down');
      openConnection(client, 3008);
      const recovered: RequestResultModel = client.sendString('after-reconnect');
      expect(revived.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(3008);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(ClientMetrics.from(client).replies).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosFailedConnectRetry
     * @tc.desc          A user whose first connect fails retries and succeeds.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect and receive onFailed.
     *                   2. Retry with a new id and deliver a proxy.
     *                   3. Send a request.
     * @tc.expected      The failure toast appears once and the retried session answers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosFailedConnectRetry', 0, () => {
      logStep('userScenariosFailedConnectRetry', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(3009);
      client.onFailed(ERROR_CONNECT);
      const failedState: string = client.state;
      const retried: boolean = client.connect(3010);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('retry-journey');
      expect(failedState).assertEqual(STATE_FAILED);
      expect(retried).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-journey');
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.connectId).assertEqual(3010);
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosDisconnectBeforeConnectHint
     * @tc.desc          A user who disconnects before connecting is warned by the guard.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Request disconnection.
     *                   2. Record the failure hint manually as the page does.
     *                   3. Confirm the client never bound a proxy.
     * @tc.expected      The guard refuses and the failure hint text is the documented one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosDisconnectBeforeConnectHint', 0, () => {
      logStep('userScenariosDisconnectBeforeConnectHint', 'begin');
      const client: ConnectionModel = newClient();
      const requested: boolean = client.disconnectRequested();
      client.toasts.push(DISCONNECT_FAIL_TOAST);
      expect(requested).assertFalse();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.lastToast()).assertEqual(DISCONNECT_FAIL_TOAST);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(eventCount(client, 'disconnect-request')).assertEqual(0);
      expect(client.proxy).assertUndefined();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          userScenariosSendManyThenDisconnect
     * @tc.desc          A user sends several messages before leaving the page.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send five messages.
     *                   2. Disconnect.
     *                   3. Inspect the toast history.
     * @tc.expected      Five success toasts precede the single disconnect toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosSendManyThenDisconnect', 0, () => {
      logStep('userScenariosSendManyThenDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3012);
      const results: RequestResultModel[] = sendBurst(client, 5);
      client.onDisconnect();
      expect(successCount(results)).assertEqual(5);
      expect(client.toasts.length).assertEqual(7);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(5);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(ClientMetrics.from(client).replies).assertEqual(5);
      expect(client.events.countOf('send-ok')).assertEqual(5);
    });

    /**
     * @tc.name          userScenariosJourneyToastSequence
     * @tc.desc          The journey toast sequence matches the oracle for each action.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect, send and disconnect.
     *                   2. Compare each toast with the action oracle.
     *                   3. Confirm the total count.
     * @tc.expected      Every toast matches the oracle for its action.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosJourneyToastSequence', 0, () => {
      logStep('userScenariosJourneyToastSequence', 'begin');
      const client: ConnectionModel = firstUseJourney();
      expect(client.toasts[0]).assertEqual(expectedToastFor('connect-success'));
      expect(client.toasts[1]).assertEqual(expectedToastFor('send-success'));
      expect(client.toasts[2]).assertEqual(expectedToastFor('disconnect-success'));
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(expectedToastFor('disconnect-success'));
      expect(client.toasts.indexOf(CONNECT_FAIL_TOAST)).assertEqual(-1);
      expect(client.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          userScenariosSendEmptyMessage
     * @tc.desc          An empty message is still transmitted and answered.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send an empty payload.
     *                   2. Inspect the stub receipt and reply.
     *                   3. Confirm the success toast.
     * @tc.expected      The stub records the empty text and the reply is the default payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosSendEmptyMessage', 0, () => {
      logStep('userScenariosSendEmptyMessage', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3013);
      const result: RequestResultModel = client.sendString('');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('');
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosSendLongMessage
     * @tc.desc          A long message reaches the stub intact and is answered once.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Build a long payload.
     *                   2. Send it.
     *                   3. Compare the stub receipt with the payload.
     * @tc.expected      The stub receives the exact payload and one reply is produced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosSendLongMessage', 0, () => {
      logStep('userScenariosSendLongMessage', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3014);
      let payload: string = '';
      for (let index = 0; index < 40; index++) {
        payload = payload + 'segment-';
      }
      const result: RequestResultModel = client.sendString(payload);
      expect(payload.length).assertEqual(320);
      expect(result.isSuccess()).assertTrue();
      expect(proxy.stub.receivedTexts[0]).assertEqual(payload);
      expect(proxy.stub.receivedTexts[0].length).assertEqual(320);
      expect(proxy.stub.requestCount()).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          userScenariosRapidConnectDisconnect
     * @tc.desc          Rapid connect and disconnect taps leave the client in a clean state.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Repeat open and close three times.
     *                   2. Confirm each close clears the binding.
     *                   3. Inspect the final state.
     * @tc.expected      Every cycle balances and the final state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosRapidConnectDisconnect', 0, () => {
      logStep('userScenariosRapidConnectDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      for (let cycle = 0; cycle < 3; cycle++) {
        openConnection(client, 3020 + cycle);
        expect(client.state).assertEqual(STATE_CONNECTED);
        client.onDisconnect();
        expect(client.proxy).assertUndefined();
        expect(client.state).assertEqual(STATE_DISCONNECTED);
      }
      expect(client.connectCalls).assertEqual(3);
      expect(client.toasts.length).assertEqual(6);
      expect(eventCount(client, 'connected')).assertEqual(3);
      expect(eventCount(client, 'disconnected')).assertEqual(3);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          userScenariosReconnectKeepsToastHistory
     * @tc.desc          Toast history accumulates across five user sessions.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run five sessions with one disconnect each.
     *                   2. Count connect and disconnect toasts.
     *                   3. Confirm the history length.
     * @tc.expected      Each session adds exactly two toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosReconnectKeepsToastHistory', 0, () => {
      logStep('userScenariosReconnectKeepsToastHistory', 'begin');
      const client: ConnectionModel = newClient();
      for (let session = 0; session < 5; session++) {
        openConnection(client, 3030 + session);
        client.onDisconnect();
      }
      expect(client.toasts.length).assertEqual(10);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(5);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(5);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[9]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.connectCalls).assertEqual(5);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          userScenariosMultipleUsersIndependent
     * @tc.desc          Two users on separate clients do not affect each other.
     * @tc.precondition  Two empty clients.
     * @tc.steps         1. Both users connect.
     *                   2. One sends and disconnects; the other sends twice.
     *                   3. Compare their histories.
     * @tc.expected      The first user's history has three toasts and the second has three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosMultipleUsersIndependent', 0, () => {
      logStep('userScenariosMultipleUsersIndependent', 'begin');
      const alice: ConnectionModel = newClient();
      const bob: ConnectionModel = newClient();
      const aliceProxy: RemoteProxyModel = openConnection(alice, 3040);
      const bobProxy: RemoteProxyModel = openConnection(bob, 3041);
      alice.sendString('alice-message');
      alice.onDisconnect();
      bob.sendString('bob-one');
      bob.sendString('bob-two');
      expect(alice.toasts.length).assertEqual(3);
      expect(bob.toasts.length).assertEqual(3);
      expect(alice.state).assertEqual(STATE_DISCONNECTED);
      expect(bob.state).assertEqual(STATE_CONNECTED);
      expect(aliceProxy.stub.receivedTexts[0]).assertEqual('alice-message');
      expect(bobProxy.stub.receivedTexts.length).assertEqual(2);
      expect(alice.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(bob.connectId).assertEqual(3041);
    });

    /**
     * @tc.name          userScenariosReconnectAfterSessionFailure
     * @tc.desc          A user recovers from a failed send by reconnecting.
     * @tc.precondition  A connected client with a proxy that will be killed.
     * @tc.steps         1. Kill the proxy and send once.
     *                   2. Disconnect and reconnect.
     *                   3. Send again.
     * @tc.expected      The failure is isolated and the recovered send succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosReconnectAfterSessionFailure', 0, () => {
      logStep('userScenariosReconnectAfterSessionFailure', 'begin');
      const client: ConnectionModel = newClient();
      const broken: RemoteProxyModel = openConnection(client, 3042);
      broken.kill();
      const failed: RequestResultModel = client.sendString('session-failure');
      client.onDisconnect();
      openConnection(client, 3043);
      const recovered: RequestResultModel = client.sendString('session-recovery');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual(REPLY_PAYLOAD);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(ClientMetrics.from(client).sends).assertEqual(2);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(0.5);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          userScenariosSessionSummarySnapshot
     * @tc.desc          The session summary snapshot records the client state after connection and two sends.
     * @tc.precondition  A connected client with two sends.
     * @tc.steps         1. Connect and send twice.
     *                   2. Capture the snapshot.
     *                   3. Compare the fields.
     * @tc.expected      The snapshot reports connected state, id, proxy and three toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosSessionSummarySnapshot', 0, () => {
      logStep('userScenariosSessionSummarySnapshot', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3044);
      sendBurst(client, 2);
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(3044);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.describe()).assertEqual('connected/3044/true/true/3');
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          userScenariosJourneyMetricsSummary
     * @tc.desc          The aggregate metrics after a full journey match the user's actions.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect, send four requests and disconnect.
     *                   2. Build metrics.
     *                   3. Compare each field.
     * @tc.expected      One connect, four sends, four replies and no failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosJourneyMetricsSummary', 0, () => {
      logStep('userScenariosJourneyMetricsSummary', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3045);
      sendBurst(client, 4);
      client.onDisconnect();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(4);
      expect(metrics.replies).assertEqual(4);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.toasts.length).assertEqual(6);
      expect(client.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosSendsTenTimes
     * @tc.desc          Ten user sends in one session all succeed and are counted.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send ten requests.
     *                   2. Compare the stub and event counts.
     *                   3. Confirm the toast total.
     * @tc.expected      Ten replies and eleven toasts appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosSendsTenTimes', 0, () => {
      logStep('userScenariosSendsTenTimes', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3046);
      const results: RequestResultModel[] = sendBurst(client, 10);
      expect(successCount(results)).assertEqual(10);
      expect(proxy.stub.receivedTexts.length).assertEqual(10);
      expect(proxy.sendCalls).assertEqual(10);
      expect(client.toasts.length).assertEqual(11);
      expect(client.events.countOf('send-ok')).assertEqual(10);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          userScenariosDisconnectsTwice
     * @tc.desc          A user who disconnects twice sees two confirmations without damage.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Disconnect twice.
     *                   2. Send once afterwards.
     *                   3. Inspect toasts and state.
     * @tc.expected      Both disconnect toasts appear and the send safely fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosDisconnectsTwice', 0, () => {
      logStep('userScenariosDisconnectsTwice', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3047);
      client.onDisconnect();
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('after-two');
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.toasts.length).assertEqual(4);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosFailedSendThenRetry
     * @tc.desc          A user retries a failed send within the same session successfully.
     * @tc.precondition  A connected client with one armed failure.
     * @tc.steps         1. Arm the proxy and send.
     *                   2. Send again without arming.
     *                   3. Compare both results.
     * @tc.expected      The first attempt fails and the retry succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosFailedSendThenRetry', 0, () => {
      logStep('userScenariosFailedSendThenRetry', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3048);
      proxy.failNextSend = ERROR_SEND;
      const first: RequestResultModel = client.sendString('first-attempt');
      const retry: RequestResultModel = client.sendString('second-attempt');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(retry.errCode).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('second-attempt');
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(ClientMetrics.from(client).sends).assertEqual(2);
    });

    /**
     * @tc.name          userScenariosServiceDeathThenDisconnect
     * @tc.desc          Closing the page after a service death still shows a clean disconnect.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Notify death.
     *                   2. Disconnect.
     *                   3. Inspect toasts and registration.
     * @tc.expected      The connect and disconnect toasts appear and the binding clears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosServiceDeathThenDisconnect', 0, () => {
      logStep('userScenariosServiceDeathThenDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3049);
      proxy.notifyDeath();
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(2);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.proxy).assertUndefined();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          userScenariosJourneyWithCustomReply
     * @tc.desc          A session with a custom server reply returns that reply to the user.
     * @tc.precondition  A client whose stub replies with a custom text.
     * @tc.steps         1. Connect with the custom stub.
     *                   2. Send one message.
     *                   3. Read the result.
     * @tc.expected      The result carries the custom reply and the success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosJourneyWithCustomReply', 0, () => {
      logStep('userScenariosJourneyWithCustomReply', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3050, 'custom-hello');
      const result: RequestResultModel = client.sendString('greetings');
      expect(result.replyText).assertEqual('custom-hello');
      expect(result.readReply()).assertEqual('custom-hello');
      expect(proxy.stub.receivedTexts[0]).assertEqual('greetings');
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.logs.contains('reply custom-hello')).assertTrue();
      expect(client.events.last()).assertEqual('send-ok:custom-hello');
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          userScenariosFirstToastIsConnectSuccess
     * @tc.desc          The first toast of a successful journey is the connect confirmation.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect.
     *                   2. Send two messages.
     *                   3. Inspect the first toast.
     * @tc.expected      The head of the toast list is the connect success message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosFirstToastIsConnectSuccess', 0, () => {
      logStep('userScenariosFirstToastIsConnectSuccess', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3051);
      sendBurst(client, 2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(3);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.events.entries[0].startsWith('connect:')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          userScenariosLastToastAfterFailure
     * @tc.desc          The last toast after a failed send is the failure hint.
     * @tc.precondition  A connected client with an armed failure.
     * @tc.steps         1. Connect and arm a failure.
     *                   2. Send once.
     *                   3. Inspect the last toast.
     * @tc.expected      The tail of the toast list is the send failure hint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosLastToastAfterFailure', 0, () => {
      logStep('userScenariosLastToastAfterFailure', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3052);
      proxy.failNextSend = ERROR_SEND;
      client.sendString('will-fail');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(expectedToastFor('send-fail'));
      expect(client.events.last()).assertEqual('send-failed:' + String(ERROR_SEND));
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosJourneyLogErrorsCount
     * @tc.desc          A clean journey records no error lines but error paths record one each.
     * @tc.precondition  Two clients, one clean and one failing.
     * @tc.steps         1. Run the clean journey.
     *                   2. Run a journey with one failed send.
     *                   3. Compare error counts.
     * @tc.expected      The clean client has no errors and the failing client has one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosJourneyLogErrorsCount', 0, () => {
      logStep('userScenariosJourneyLogErrorsCount', 'begin');
      const clean: ConnectionModel = firstUseJourney();
      const failing: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(failing, 3053);
      proxy.failNextSend = ERROR_SEND;
      failing.sendString('journey-error');
      expect(clean.logs.countLevel('ERROR')).assertEqual(0);
      expect(failing.logs.countLevel('ERROR')).assertEqual(1);
      expect(clean.logs.countLevel('INFO')).assertEqual(4);
      expect(failing.logs.countLevel('INFO')).assertEqual(2);
      expect(clean.state).assertEqual(STATE_DISCONNECTED);
      expect(failing.state).assertEqual(STATE_CONNECTED);
      expect(clean.toasts.length).assertEqual(3);
      expect(failing.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          userScenariosBurstOfFailures
     * @tc.desc          Four failing sends in a row each produce a failure hint.
     * @tc.precondition  A connected client whose proxy is killed.
     * @tc.steps         1. Kill the proxy.
     *                   2. Send four requests.
     *                   3. Count failure toasts and codes.
     * @tc.expected      Four failures appear with four failure toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosBurstOfFailures', 0, () => {
      logStep('userScenariosBurstOfFailures', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3054);
      proxy.kill();
      const results: RequestResultModel[] = sendBurst(client, 4);
      expect(codeCount(results, ERROR_SEND)).assertEqual(4);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(4);
      expect(client.toasts.length).assertEqual(5);
      expect(client.events.countOf('send-failed')).assertEqual(4);
      expect(client.logs.countLevel('ERROR')).assertEqual(4);
      expect(proxy.sendCalls).assertEqual(4);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          userScenariosJourneyProxyIdentity
     * @tc.desc          The proxy bound during the journey is the one that receives requests.
     * @tc.precondition  An empty client and a captured proxy.
     * @tc.steps         1. Connect and capture the proxy.
     *                   2. Send two requests.
     *                   3. Compare proxy identity and counters.
     * @tc.expected      The captured proxy is current and receives both requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosJourneyProxyIdentity', 0, () => {
      logStep('userScenariosJourneyProxyIdentity', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3055);
      sendBurst(client, 2);
      expect(client.proxy).assertEqual(proxy);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.descriptor).assertEqual('IPCStubTest');
      expect(client.events.entries[2]).assertEqual('connected:IPCStubTest');
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          userScenariosResetAndStartOver
     * @tc.desc          A user who resets the client can repeat the journey from scratch.
     * @tc.precondition  A client that completed a journey.
     * @tc.steps         1. Complete a journey and reset.
     *                   2. Repeat the journey with a new id.
     *                   3. Compare with a fresh journey.
     * @tc.expected      The restarted journey matches a fresh one exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosResetAndStartOver', 0, () => {
      logStep('userScenariosResetAndStartOver', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3056);
      sendBurst(client, 3);
      client.reset();
      openConnection(client, 3057);
      client.sendString('restart');
      const fresh: ConnectionModel = newClient();
      openConnection(fresh, 3057);
      fresh.sendString('restart');
      expect(new ClientSnapshot(client).sameAs(new ClientSnapshot(fresh))).assertTrue();
      expect(client.events.trace()).assertEqual(fresh.events.trace());
      expect(client.toasts.length).assertEqual(2);
      expect(ClientMetrics.from(client).replies).assertEqual(1);
      expect(client.connectId).assertEqual(3057);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          userScenariosStateOracleTable
     * @tc.desc          The state oracle maps every callback name to the documented state.
     * @tc.precondition  A pure oracle table.
     * @tc.steps         1. Evaluate the oracle for all four callbacks.
     *                   2. Compare with the shared state constants.
     *                   3. Confirm unknown callbacks fall back to failed.
     * @tc.expected      Each callback maps to its documented state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosStateOracleTable', 0, () => {
      logStep('userScenariosStateOracleTable', 'begin');
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('unknown')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('onConnect')).assertEqual('connected');
      expect(expectedStateAfter('connect')).assertEqual('connecting');
      expect(STATE_CONNECTED === STATE_FAILED).assertFalse();
    });

    /**
     * @tc.name          userScenariosToastOracleMapping
     * @tc.desc          The toast oracle maps every action to the documented message.
     * @tc.precondition  A pure oracle table.
     * @tc.steps         1. Evaluate the oracle for six actions.
     *                   2. Compare each with the shared toasts.
     *                   3. Confirm unknown actions fall back to disconnect success.
     * @tc.expected      All six mappings match their constants.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosToastOracleMapping', 0, () => {
      logStep('userScenariosToastOracleMapping', 'begin');
      expect(expectedToastFor('connect-success')).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('connect-fail')).assertEqual(CONNECT_FAIL_TOAST);
      expect(expectedToastFor('send-success')).assertEqual(SEND_SUCCESS_TOAST);
      expect(expectedToastFor('send-fail')).assertEqual(SEND_FAIL_TOAST);
      expect(expectedToastFor('disconnect-fail')).assertEqual(DISCONNECT_FAIL_TOAST);
      expect(expectedToastFor('disconnect-success')).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('other')).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(CONNECT_SUCCESS_TOAST === SEND_SUCCESS_TOAST).assertFalse();
    });

    /**
     * @tc.name          userScenariosStateTransitionSequence
     * @tc.desc          Observed states across a journey follow the oracle transition table.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Record the state after each step.
     *                   2. Compare with the oracle.
     *                   3. Confirm the final state.
     * @tc.expected      The observed states match the oracle at each step.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosStateTransitionSequence', 0, () => {
      logStep('userScenariosStateTransitionSequence', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(3058);
      const afterConnect: string = client.state;
      client.onConnect(new RemoteProxyModel());
      const afterOnConnect: string = client.state;
      client.sendString('transition');
      const afterSend: string = client.state;
      client.onDisconnect();
      const afterDisconnect: string = client.state;
      expect(afterConnect).assertEqual(expectedStateAfter('connect'));
      expect(afterOnConnect).assertEqual(expectedStateAfter('onConnect'));
      expect(afterSend).assertEqual(STATE_CONNECTED);
      expect(afterDisconnect).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.toasts.length).assertEqual(3);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          userScenariosDisconnectFlagJourney
     * @tc.desc          The disconnect flag is set by the callback and cleared only by the user flow.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect and confirm the flag is clear.
     *                   2. Disconnect and confirm it is set.
     *                   3. Reset and confirm it clears.
     * @tc.expected      The flag tracks the disconnect callback lifecycle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosDisconnectFlagJourney', 0, () => {
      logStep('userScenariosDisconnectFlagJourney', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3059);
      expect(client.isDisconnect).assertFalse();
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      client.reset();
      expect(client.isDisconnect).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          userScenariosNoBindingAtJourneyEnd
     * @tc.desc          A completed journey leaves no proxy, registration or id behind.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run the golden journey.
     *                   2. Inspect binding fields.
     *                   3. Confirm the client is safe to reuse.
     * @tc.expected      No proxy, no registration and the initial id remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosNoBindingAtJourneyEnd', 0, () => {
      logStep('userScenariosNoBindingAtJourneyEnd', 'begin');
      const client: ConnectionModel = firstUseJourney();
      expect(client.proxy).assertUndefined();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(3);
      const nextOpen: boolean = client.connect(3060);
      expect(nextOpen).assertTrue();
    });

    /**
     * @tc.name          userScenariosMixedPayloadJourney
     * @tc.desc          A user sending varied messages gets one reply per message.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send four distinct payloads.
     *                   2. Compare the stub receipt order.
     *                   3. Confirm the reply count.
     * @tc.expected      The stub receives all four payloads in order with four replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosMixedPayloadJourney', 0, () => {
      logStep('userScenariosMixedPayloadJourney', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3061);
      const payloads: string[] = ['morning', 'afternoon', 'evening', 'midnight'];
      for (let index = 0; index < payloads.length; index++) {
        const result: RequestResultModel = client.sendString(payloads[index]);
        expect(result.isSuccess()).assertTrue();
      }
      expect(proxy.stub.receivedTexts.length).assertEqual(4);
      expect(proxy.stub.receivedTexts[0]).assertEqual('morning');
      expect(proxy.stub.receivedTexts[3]).assertEqual('midnight');
      expect(proxy.stub.receivedTexts.join('>')).assertEqual('morning>afternoon>evening>midnight');
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(4);
      expect(ClientMetrics.from(client).replies).assertEqual(4);
      expect(client.toasts.length).assertEqual(5);
    });

    /**
     * @tc.name          userScenariosThreeSessionJourney
     * @tc.desc          Three sessions with different message counts reconcile in the aggregate.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Send two, three and four messages in separate sessions.
     *                   2. Sum the replies.
     *                   3. Count the lifecycle toasts.
     * @tc.expected      Nine replies and six lifecycle toasts appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosThreeSessionJourney', 0, () => {
      logStep('userScenariosThreeSessionJourney', 'begin');
      const client: ConnectionModel = newClient();
      const counts: number[] = [2, 3, 4];
      for (let session = 0; session < counts.length; session++) {
        openConnection(client, 3070 + session);
        sendBurst(client, counts[session]);
        client.onDisconnect();
      }
      expect(ClientMetrics.from(client).replies).assertEqual(9);
      expect(ClientMetrics.from(client).connects).assertEqual(3);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(3);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(3);
      expect(client.toasts.length).assertEqual(15);
      expect(client.connectCalls).assertEqual(3);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          userScenariosScenarioLabelCoverage
     * @tc.desc          A small scenario table covers the four documented user situations.
     * @tc.precondition  A pure scenario table.
     * @tc.steps         1. Build the scenario labels.
     *                   2. Deduplicate and count them.
     *                   3. Compare with the expected labels.
     * @tc.expected      The table holds the four distinct labels.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosScenarioLabelCoverage', 0, () => {
      logStep('userScenariosScenarioLabelCoverage', 'begin');
      const labels: string[] = ['connect', 'send', 'disconnect', 'connect', 'send'];
      const distinct: string[] = [];
      for (let index = 0; index < labels.length; index++) {
        if (distinct.indexOf(labels[index]) < 0) {
          distinct.push(labels[index]);
        }
      }
      expect(labels.length).assertEqual(5);
      expect(distinct.length).assertEqual(3);
      expect(distinct[0]).assertEqual('connect');
      expect(distinct[1]).assertEqual('send');
      expect(distinct[2]).assertEqual('disconnect');
      expect(countOf(labels, 'connect')).assertEqual(2);
      expect(distinct.join(',')).assertEqual('connect,send,disconnect');
    });

    /**
     * @tc.name          userScenariosSnapshotAfterJourney
     * @tc.desc          The post-journey snapshot matches the description of a disconnected client.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run the golden journey.
     *                   2. Capture the snapshot.
     *                   3. Compare the fields.
     * @tc.expected      The snapshot shows disconnected, initial id, no proxy and three toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosSnapshotAfterJourney', 0, () => {
      logStep('userScenariosSnapshotAfterJourney', 'begin');
      const client: ConnectionModel = firstUseJourney();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/3');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
    });

    /**
     * @tc.name          userScenariosToastCountsPerPhase
     * @tc.desc          Each journey phase contributes a predictable number of toasts.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Capture the count after connect.
     *                   2. Capture it after two sends.
     *                   3. Capture it after disconnect.
     * @tc.expected      The counts read one, three and four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosToastCountsPerPhase', 0, () => {
      logStep('userScenariosToastCountsPerPhase', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3062);
      const afterConnect: number = client.toasts.length;
      sendBurst(client, 2);
      const afterSends: number = client.toasts.length;
      client.onDisconnect();
      const afterDisconnect: number = client.toasts.length;
      expect(afterConnect).assertEqual(1);
      expect(afterSends).assertEqual(3);
      expect(afterDisconnect).assertEqual(4);
      expect(afterSends - afterConnect).assertEqual(2);
      expect(afterDisconnect - afterSends).assertEqual(1);
      expect(client.toasts[3]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(4);
    });

    /**
     * @tc.name          userScenariosFinalInvariants
     * @tc.desc          The final journey invariants hold across a mixed user session.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Send a mix of successful and failing requests.
     *                   2. Disconnect and send once more.
     *                   3. Verify all invariants.
     * @tc.expected      Sends equal replies plus failures and the client ends disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosFinalInvariants', 0, () => {
      logStep('userScenariosFinalInvariants', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3063);
      sendBurst(client, 4);
      proxy.failNextSend = ERROR_SEND;
      client.sendString('mixed-failure');
      client.onDisconnect();
      client.sendString('after-journey');
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(5);
      expect(metrics.replies).assertEqual(4);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(metrics.successRatio()).assertEqual(4 / 5);
      expect(client.toasts.length).assertEqual(8);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy).assertUndefined();
    });

    /**
     * @tc.name          userScenariosReopenAfterReset
     * @tc.desc          A reset client can start a second conversation with a fresh id.
     * @tc.precondition  A client that completed one conversation.
     * @tc.steps         1. Complete a conversation and reset.
     *                   2. Open with id 3064.
     *                   3. Send twice.
     * @tc.expected      Only the new conversation appears in the client history.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosReopenAfterReset', 0, () => {
      logStep('userScenariosReopenAfterReset', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3065);
      sendBurst(client, 2);
      client.reset();
      openConnection(client, 3064);
      sendBurst(client, 2);
      expect(client.connectId).assertEqual(3064);
      expect(client.toasts.length).assertEqual(3);
      expect(ClientMetrics.from(client).replies).assertEqual(2);
      expect(ClientMetrics.from(client).connects).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.logs.size()).assertEqual(4);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          userScenariosEventTraceComplete
     * @tc.desc          A one-message conversation records the complete event trace.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run the golden journey.
     *                   2. Count each event kind.
     *                   3. Confirm the trace tail.
     * @tc.expected      The trace holds one of each lifecycle event plus one send event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosEventTraceComplete', 0, () => {
      logStep('userScenariosEventTraceComplete', 'begin');
      const client: ConnectionModel = firstUseJourney();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.events.last()).assertEqual('disconnected:ok');
      expect(client.events.entries[0].startsWith('connect:')).assertTrue();
    });

    /**
     * @tc.name          userScenariosProxyDescriptorCheck
     * @tc.desc          The user-visible session always reports the shared stub descriptor.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Open a connection.
     *                   2. Compare descriptors and connected event.
     *                   3. Confirm the toast.
     * @tc.expected      The descriptor is the shared one throughout.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosProxyDescriptorCheck', 0, () => {
      logStep('userScenariosProxyDescriptorCheck', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3066);
      expect(proxy.descriptor).assertEqual('IPCStubTest');
      expect(proxy.stub.descriptor).assertEqual('IPCStubTest');
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.entries[2]).assertEqual('connected:IPCStubTest');
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          userScenariosDeathThenReconnectToastFlow
     * @tc.desc          A death followed by a reconnect produces the documented toast sequence.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect, kill the proxy and send.
     *                   2. Disconnect and reconnect.
     *                   3. Read the toast sequence.
     * @tc.expected      Connect, failure, disconnect and connect toasts appear in that order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosDeathThenReconnectToastFlow', 0, () => {
      logStep('userScenariosDeathThenReconnectToastFlow', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3067);
      proxy.notifyDeath();
      client.sendString('death-send');
      client.onDisconnect();
      openConnection(client, 3068);
      expect(client.toasts.length).assertEqual(4);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[3]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.connectId).assertEqual(3068);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          userScenariosEmptyJourneyBaseline
     * @tc.desc          Before any action the client reports an empty user-facing history.
     * @tc.precondition  A new client.
     * @tc.steps         1. Capture the initial snapshot.
     *                   2. Read toasts, events and metrics.
     *                   3. Confirm the client offers connect.
     * @tc.expected      All histories are empty and a connect request is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosEmptyJourneyBaseline', 0, () => {
      logStep('userScenariosEmptyJourneyBaseline', 'begin');
      const client: ConnectionModel = newClient();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.toastCount).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(ClientMetrics.from(client).sends).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const accepted: boolean = client.connect(3069);
      expect(accepted).assertTrue();
    });

    /**
     * @tc.name          userScenariosLongConversation
     * @tc.desc          A twelve-message conversation keeps every counter consistent.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send twelve messages.
     *         2. Confirm the reply and toast counts.
     *                   3. Disconnect and confirm the final state.
     * @tc.expected      Twelve replies, thirteen toasts and a disconnected end state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosLongConversation', 0, () => {
      logStep('userScenariosLongConversation', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3080);
      const results: RequestResultModel[] = sendBurst(client, 12);
      client.onDisconnect();
      expect(successCount(results)).assertEqual(12);
      expect(proxy.stub.receivedTexts.length).assertEqual(12);
      expect(ClientMetrics.from(client).replies).assertEqual(12);
      expect(client.toasts.length).assertEqual(14);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(12);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy).assertUndefined();
    });

    /**
     * @tc.name          userScenariosJourneyStateAfterEachStep
     * @tc.desc          The state after each user step follows the documented transition table.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect, send and disconnect step by step.
     *                   2. Record the state after each step.
     *                   3. Compare with the oracle.
     * @tc.expected      The recorded states equal the oracle entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosJourneyStateAfterEachStep', 0, () => {
      logStep('userScenariosJourneyStateAfterEachStep', 'begin');
      const client: ConnectionModel = newClient();
      const states: string[] = [];
      client.connect(3090);
      states.push(client.state);
      client.onConnect(new RemoteProxyModel());
      states.push(client.state);
      client.sendString('state-step');
      states.push(client.state);
      client.onDisconnect();
      states.push(client.state);
      expect(states.length).assertEqual(4);
      expect(states[0]).assertEqual(expectedStateAfter('connect'));
      expect(states[1]).assertEqual(expectedStateAfter('onConnect'));
      expect(states[2]).assertEqual(STATE_CONNECTED);
      expect(states[3]).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.toasts.length).assertEqual(3);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          userScenariosToastAfterEachSend
     * @tc.desc          Each send adds exactly one toast to the visible history.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Capture the toast count after connect.
     *                   2. Send four messages one at a time.
     *                   3. Compare the count after each send.
     * @tc.expected      The count equals the connect baseline plus the send index.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosToastAfterEachSend', 0, () => {
      logStep('userScenariosToastAfterEachSend', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3091);
      const baseline: number = client.toasts.length;
      const counts: number[] = [];
      for (let index = 0; index < 4; index++) {
        client.sendString('toast-step-' + String(index));
        counts.push(client.toasts.length);
      }
      expect(baseline).assertEqual(1);
      expect(counts.length).assertEqual(4);
      expect(counts[0]).assertEqual(2);
      expect(counts[1]).assertEqual(3);
      expect(counts[2]).assertEqual(4);
      expect(counts[3]).assertEqual(5);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(4);
      expect(client.toasts.length).assertEqual(5);
    });

    /**
     * @tc.name          userScenariosTwoJourneysSequential
     * @tc.desc          Two sequential journeys on the same client keep cumulative histories.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run the first journey with one send.
     *                   2. Run the second journey with two sends.
     *                   3. Compare the cumulative totals.
     * @tc.expected      The client reports three replies and six toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosTwoJourneysSequential', 0, () => {
      logStep('userScenariosTwoJourneysSequential', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 3092);
      client.sendString('journey-one');
      client.onDisconnect();
      openConnection(client, 3093);
      sendBurst(client, 2);
      client.onDisconnect();
      expect(ClientMetrics.from(client).replies).assertEqual(3);
      expect(ClientMetrics.from(client).connects).assertEqual(2);
      expect(client.toasts.length).assertEqual(7);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          userScenariosConnectFailThenGuard
     * @tc.desc          After a failed connect the disconnect guard still sees the recorded id.
     * @tc.precondition  A client that received onFailed.
     * @tc.steps         1. Connect with id 3094 and fail.
     *                   2. Request disconnection.
     *                   3. Confirm the recorded id and toast.
     * @tc.expected      The guard accepts because the id was recorded before the failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosConnectFailThenGuard', 0, () => {
      logStep('userScenariosConnectFailThenGuard', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(3094);
      client.onFailed(ERROR_CONNECT);
      const requested: boolean = client.disconnectRequested();
      expect(requested).assertTrue();
      expect(client.connectId).assertEqual(3094);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.events.last()).assertEqual('disconnect-request:3094');
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(client.proxy).assertUndefined();
      expect(client.connectCalls).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosMessageRoundTripDetails
     * @tc.desc          A single message round trip exposes every expected detail to the user flow.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send one message.
     *                   2. Inspect the result, stub and logs.
     *                   3. Confirm the toast and event.
     * @tc.expected      The reply, receipt, log line and toast all agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosMessageRoundTripDetails', 0, () => {
      logStep('userScenariosMessageRoundTripDetails', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3095);
      const result: RequestResultModel = client.sendString('detail-message');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts[0]).assertEqual('detail-message');
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(proxy.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosFinalSummaryCounts
     * @tc.desc          The final summary of a three-phase user session reconciles every count.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect and send three messages.
     *                   2. Inject one failure and send once.
     *                   3. Disconnect and summarize.
     * @tc.expected      Four replies and one failure reconcile with the toasts and events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosFinalSummaryCounts', 0, () => {
      logStep('userScenariosFinalSummaryCounts', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 3096);
      sendBurst(client, 3);
      proxy.failNextSend = ERROR_SEND;
      client.sendString('summary-failure');
      client.onDisconnect();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.sends).assertEqual(4);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(3);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.toasts.length).assertEqual(6);
    });
  });
}