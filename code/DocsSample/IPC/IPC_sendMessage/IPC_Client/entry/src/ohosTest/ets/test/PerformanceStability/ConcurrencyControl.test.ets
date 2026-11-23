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
  DeathRecipientModel,
  MessageSequenceModel,
  MessageOptionModel,
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
  DISCONNECT_SUCCESS_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  CONNECT_FAIL_TOAST,
  INITIAL_CONNECT_ID,
  countOf
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

/** Result of one scripted operation applied to a connection model. */
class OpResult {
  public kind: string;
  public accepted: boolean;
  public code: number;

  constructor(kind: string, accepted: boolean, code: number) {
    this.kind = kind;
    this.accepted = accepted;
    this.code = code;
  }

  public describe(): string {
    return this.kind + '/' + String(this.accepted) + '/' + String(this.code);
  }
}

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

function replyTexts(results: RequestResultModel[]): string[] {
  const texts: string[] = [];
  for (let index = 0; index < results.length; index++) {
    texts.push(results[index].replyText);
  }
  return texts;
}

function applyOp(client: ConnectionModel, op: string): OpResult {
  if (op === 'connect') {
    const accepted: boolean = client.connect(31);
    return new OpResult('connect', accepted, ERROR_NONE);
  }
  if (op === 'onConnect') {
    client.onConnect(new RemoteProxyModel());
    return new OpResult('onConnect', true, ERROR_NONE);
  }
  if (op === 'onConnectDead') {
    const proxy: RemoteProxyModel = new RemoteProxyModel();
    proxy.kill();
    client.onConnect(proxy);
    return new OpResult('onConnectDead', false, ERROR_NONE);
  }
  if (op === 'send') {
    const result: RequestResultModel = client.sendString(REQUEST_PAYLOAD);
    return new OpResult('send', result.isSuccess(), result.errCode);
  }
  if (op === 'disconnect') {
    client.onDisconnect();
    return new OpResult('disconnect', true, ERROR_NONE);
  }
  if (op === 'failed') {
    client.onFailed(ERROR_CONNECT);
    return new OpResult('failed', false, ERROR_CONNECT);
  }
  if (op === 'death') {
    const proxy: RemoteProxyModel | undefined = client.proxy;
    if (proxy !== undefined) {
      proxy.notifyDeath();
      return new OpResult('death', true, ERROR_SEND);
    }
    return new OpResult('death', false, ERROR_PROXY_INVALID);
  }
  return new OpResult('unknown', false, ERROR_NONE);
}

function runScript(client: ConnectionModel, ops: string[]): OpResult[] {
  const results: OpResult[] = [];
  for (let index = 0; index < ops.length; index++) {
    results.push(applyOp(client, ops[index]));
  }
  return results;
}

function acceptedCount(results: OpResult[]): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].accepted) {
      total = total + 1;
    }
  }
  return total;
}

export default function concurrencyControl(): void {
  describe('ConcurrencyControl', () => {
    beforeAll(() => {
      logSuite('ConcurrencyControl', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ConcurrencyControl', 'end');
    });

    /**
     * @tc.name          concurrencyControlFirstConnectWins
     * @tc.desc          A burst of connect requests must accept only the first one.
     * @tc.precondition  A freshly constructed client with no proxy bound.
     * @tc.steps         1. Call connect with id 11.
     *                   2. Call connect with id 12 and id 13 while connecting.
     *                   3. Count accepted attempts and inspect connectId.
     * @tc.expected      Only the first request is accepted and connectId stays 11.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlFirstConnectWins', 0, () => {
      logStep('concurrencyControlFirstConnectWins', 'begin');
      const client: ConnectionModel = newClient();
      const first: boolean = client.connect(11);
      const second: boolean = client.connect(12);
      const third: boolean = client.connect(13);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(third).assertFalse();
      expect(client.connectId).assertEqual(11);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(3);
      expect(eventCount(client, 'connect')).assertEqual(1);
      expect(client.logs.countLevel('WARN')).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlConnectWhileConnectedBlocked
     * @tc.desc          Connect attempts issued after onConnect are rejected and logged.
     * @tc.precondition  A client already connected through a live proxy.
     * @tc.steps         1. Open a connection with id 21.
     *                   2. Issue two more connect requests.
     *                   3. Inspect state, proxy identity and warn count.
     * @tc.expected      State remains connected, proxy is unchanged and warnings accumulate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlConnectWhileConnectedBlocked', 0, () => {
      logStep('concurrencyControlConnectWhileConnectedBlocked', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 21);
      const again: boolean = client.connect(22);
      const onceMore: boolean = client.connect(23);
      expect(again).assertFalse();
      expect(onceMore).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy).assertEqual(proxy);
      expect(client.connectId).assertEqual(21);
      expect(client.connectCalls).assertEqual(3);
      expect(client.logs.countLevel('WARN')).assertEqual(2);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlSendBurstWithoutProxy
     * @tc.desc          Every send in a burst without a proxy fails with the proxy-invalid code.
     * @tc.precondition  A client that never connected.
     * @tc.steps         1. Send five requests in a row.
     *                   2. Collect the error codes.
     *                   3. Count failure toasts and events.
     * @tc.expected      All five requests fail with ERROR_PROXY_INVALID and five toasts appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlSendBurstWithoutProxy', 0, () => {
      logStep('concurrencyControlSendBurstWithoutProxy', 'begin');
      const client: ConnectionModel = newClient();
      const results: RequestResultModel[] = sendBurst(client, 5);
      expect(results.length).assertEqual(5);
      expect(successCount(results)).assertEqual(0);
      expect(codeCount(results, ERROR_PROXY_INVALID)).assertEqual(5);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(5);
      expect(eventCount(client, 'send-no-proxy')).assertEqual(5);
      expect(eventCount(client, 'send-ok')).assertEqual(0);
      expect(client.events.size()).assertEqual(5);
      expect(client.logs.countLevel('ERROR')).assertEqual(5);
    });

    /**
     * @tc.name          concurrencyControlInterleavedConnectThenSend
     * @tc.desc          An interleaving where connect precedes sends yields all-success replies.
     * @tc.precondition  An empty client and a three-step operation script.
     * @tc.steps         1. Run connect, onConnect and send in that order.
     *                   2. Verify each operation result.
     *                   3. Reconcile success ratio with the metrics view.
     * @tc.expected      The script is accepted end to end with one reply and a unit ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlInterleavedConnectThenSend', 0, () => {
      logStep('concurrencyControlInterleavedConnectThenSend', 'begin');
      const client: ConnectionModel = newClient();
      const ops: string[] = ['connect', 'onConnect', 'send'];
      const results: OpResult[] = runScript(client, ops);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(acceptedCount(results)).assertEqual(3);
      expect(results[2].code).assertEqual(ERROR_NONE);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlSendBeforeConnectAllFail
     * @tc.desc          A send-only script cannot succeed because no proxy is bound yet.
     * @tc.precondition  An empty client and a three-send script.
     * @tc.steps         1. Run three send operations.
     *                   2. Count failures by code.
     *                   3. Confirm the state machine never advanced.
     * @tc.expected      All sends fail and the client stays disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlSendBeforeConnectAllFail', 0, () => {
      logStep('concurrencyControlSendBeforeConnectAllFail', 'begin');
      const client: ConnectionModel = newClient();
      const results: OpResult[] = runScript(client, ['send', 'send', 'send']);
      expect(results.length).assertEqual(3);
      expect(acceptedCount(results)).assertEqual(0);
      expect(results[0].code).assertEqual(ERROR_PROXY_INVALID);
      expect(results[2].code).assertEqual(ERROR_PROXY_INVALID);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(eventCount(client, 'send-no-proxy')).assertEqual(3);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlConnectAfterFailureRecovers
     * @tc.desc          A failed callback does not block a later connect attempt.
     * @tc.precondition  A client moved to the failed state by onFailed.
     * @tc.steps         1. Trigger onFailed with the connect error code.
     *                   2. Issue a new connect request.
     *                   3. Deliver onConnect and send one request.
     * @tc.expected      Connect is accepted after failure and the send succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlConnectAfterFailureRecovers', 0, () => {
      logStep('concurrencyControlConnectAfterFailureRecovers', 'begin');
      const client: ConnectionModel = newClient();
      client.onFailed(ERROR_CONNECT);
      const failedState: string = client.state;
      const retried: boolean = client.connect(41);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('retry');
      expect(failedState).assertEqual(STATE_FAILED);
      expect(retried).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(41);
      expect(result.isSuccess()).assertTrue();
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(eventCount(client, 'failed')).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlTwoClientsIsolated
     * @tc.desc          Two clients running in parallel keep independent proxies and counters.
     * @tc.precondition  Two empty clients constructed side by side.
     * @tc.steps         1. Connect each client with a distinct id.
     *                   2. Send a distinct payload through each proxy.
     *                   3. Compare stubs, metrics and toast totals.
     * @tc.expected      Each stub sees only its own payload and metrics stay separate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlTwoClientsIsolated', 0, () => {
      logStep('concurrencyControlTwoClientsIsolated', 'begin');
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      const leftProxy: RemoteProxyModel = openConnection(left, 51);
      const rightProxy: RemoteProxyModel = openConnection(right, 52);
      const leftResult: RequestResultModel = left.sendString('left-payload');
      const rightResult: RequestResultModel = right.sendString('right-payload');
      expect(leftProxy === rightProxy).assertFalse();
      expect(leftResult.isSuccess()).assertTrue();
      expect(rightResult.isSuccess()).assertTrue();
      expect(leftProxy.stub.receivedTexts.length).assertEqual(1);
      expect(leftProxy.stub.receivedTexts[0]).assertEqual('left-payload');
      expect(rightProxy.stub.receivedTexts[0]).assertEqual('right-payload');
      expect(ClientMetrics.from(left).sends).assertEqual(1);
      expect(ClientMetrics.from(right).sends).assertEqual(1);
      expect(left.toasts.length).assertEqual(2);
      expect(right.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlSendBurstAfterDisconnect
     * @tc.desc          A burst issued after disconnection fails uniformly with the invalid-proxy code.
     * @tc.precondition  A client that connected once and then received onDisconnect.
     * @tc.steps         1. Open and close the connection.
     *                   2. Send four requests.
     *                   3. Verify codes, toasts and state.
     * @tc.expected      The burst fails four times and the client remains disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlSendBurstAfterDisconnect', 0, () => {
      logStep('concurrencyControlSendBurstAfterDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 61);
      client.onDisconnect();
      const beforeToasts: number = client.toasts.length;
      const results: RequestResultModel[] = sendBurst(client, 4);
      expect(codeCount(results, ERROR_PROXY_INVALID)).assertEqual(4);
      expect(successCount(results)).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy).assertUndefined();
      expect(client.toasts.length).assertEqual(beforeToasts + 4);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(4);
      expect(eventCount(client, 'send-no-proxy')).assertEqual(4);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(0);
    });

    /**
     * @tc.name          concurrencyControlDisconnectRequestGuard
     * @tc.desc          Disconnect requests are refused until a connect id exists.
     * @tc.precondition  An empty client with the initial connect id.
     * @tc.steps         1. Request disconnection before connecting.
     *                   2. Connect with id 71 and request again.
     *                   3. Inspect the recorded disconnect events.
     * @tc.expected      The first request is refused and the second is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDisconnectRequestGuard', 0, () => {
      logStep('concurrencyControlDisconnectRequestGuard', 'begin');
      const client: ConnectionModel = newClient();
      const premature: boolean = client.disconnectRequested();
      client.connect(71);
      const valid: boolean = client.disconnectRequested();
      expect(premature).assertFalse();
      expect(valid).assertTrue();
      expect(client.connectId).assertEqual(71);
      expect(eventCount(client, 'disconnect-request')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.events.last()).assertEqual('disconnect-request:71');
      expect(client.connectId).assertEqual(71);
    });

    /**
     * @tc.name          concurrencyControlDeathMidBurst
     * @tc.desc          A proxy death between two sends turns subsequent sends into failures.
     * @tc.precondition  A connected client with a registered death recipient.
     * @tc.steps         1. Send one request successfully.
     *                   2. Notify death on the proxy.
     *                   3. Send three more requests and inspect codes and death count.
     * @tc.expected      The first send succeeds, the later three fail with ERROR_SEND and death is counted once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDeathMidBurst', 0, () => {
      logStep('concurrencyControlDeathMidBurst', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 81);
      const first: RequestResultModel = client.sendString('before-death');
      proxy.notifyDeath();
      const later: RequestResultModel[] = sendBurst(client, 3);
      expect(first.isSuccess()).assertTrue();
      expect(codeCount(later, ERROR_SEND)).assertEqual(3);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(3);
      expect(eventCount(client, 'send-failed')).assertEqual(3);
      expect(eventCount(client, 'send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlReconnectAfterDeath
     * @tc.desc          A client recovers by disconnecting and opening a fresh session after death.
     * @tc.precondition  A client whose first proxy has been killed.
     * @tc.steps         1. Kill the first proxy and close the session.
     *                   2. Connect again with a new id.
     *                   3. Send one request and inspect the new recipient.
     * @tc.expected      The new session is connected, registered and able to reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlReconnectAfterDeath', 0, () => {
      logStep('concurrencyControlReconnectAfterDeath', 'begin');
      const client: ConnectionModel = newClient();
      const firstProxy: RemoteProxyModel = openConnection(client, 91);
      firstProxy.notifyDeath();
      client.onDisconnect();
      const secondProxy: RemoteProxyModel = openConnection(client, 92);
      const result: RequestResultModel = client.sendString('recovered');
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(92);
      expect(secondProxy.isAlive()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(result.isSuccess()).assertTrue();
      expect(secondProxy.stub.receivedTexts[0]).assertEqual('recovered');
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlConnectDisconnectCyclesBalance
     * @tc.desc          Repeated connect and disconnect cycles keep toast and event counts balanced.
     * @tc.precondition  An empty client and four planned cycles.
     * @tc.steps         1. For each cycle connect with a distinct id and deliver a proxy.
     *                   2. Close each session immediately.
     *                   3. Compare connect, connected and disconnected counts.
     * @tc.expected      Four of each lifecycle event appear and the final state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlConnectDisconnectCyclesBalance', 0, () => {
      logStep('concurrencyControlConnectDisconnectCyclesBalance', 'begin');
      const client: ConnectionModel = newClient();
      for (let index = 0; index < 4; index++) {
        openConnection(client, 100 + index);
        client.onDisconnect();
      }
      expect(client.connectCalls).assertEqual(4);
      expect(eventCount(client, 'connect')).assertEqual(4);
      expect(eventCount(client, 'connected')).assertEqual(4);
      expect(eventCount(client, 'disconnected')).assertEqual(4);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(4);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(4);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.toasts.length).assertEqual(8);
    });

    /**
     * @tc.name          concurrencyControlDeadProxyRegisterFails
     * @tc.desc          A proxy that dies before registration leaves the recipient unregistered.
     * @tc.precondition  A client in the connecting state and a killed proxy instance.
     * @tc.steps         1. Request connect with id 110.
     *                   2. Kill the proxy before delivering onConnect.
     *                   3. Deliver onConnect and inspect registration flags.
     * @tc.expected      The session reports connected but registration and liveness checks fail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDeadProxyRegisterFails', 0, () => {
      logStep('concurrencyControlDeadProxyRegisterFails', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(110);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      proxy.kill();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy).assertEqual(proxy);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(eventCount(client, 'death-register-failed')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlRepeatedOnConnectRebinds
     * @tc.desc          A second onConnect callback replaces the proxy binding and re-registers death.
     * @tc.precondition  A connected client holding a first proxy.
     * @tc.steps         1. Connect and deliver the first proxy.
     *                   2. Deliver a second proxy without disconnecting.
     *                   3. Send one request and check which stub received it.
     * @tc.expected      The second proxy becomes current and receives the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlRepeatedOnConnectRebinds', 0, () => {
      logStep('concurrencyControlRepeatedOnConnectRebinds', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 120);
      const second: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(second);
      const result: RequestResultModel = client.sendString('second-binding');
      expect(client.proxy).assertEqual(second);
      expect(client.proxy === first).assertFalse();
      expect(client.connectCalls).assertEqual(1);
      expect(eventCount(client, 'death-register')).assertEqual(2);
      expect(result.isSuccess()).assertTrue();
      expect(second.stub.receivedTexts[0]).assertEqual('second-binding');
      expect(first.stub.receivedTexts.length).assertEqual(0);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlResetClearsCounters
     * @tc.desc          Reset returns every observable counter to its initial value.
     * @tc.precondition  A client that connected, sent and failed at least once.
     * @tc.steps         1. Build a mixed history.
     *                   2. Invoke reset.
     *                   3. Inspect state, counters, logs, toasts and a follow-up send.
     * @tc.expected      All counters are zero and the follow-up send fails without a proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlResetClearsCounters', 0, () => {
      logStep('concurrencyControlResetClearsCounters', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 130);
      client.sendString('one');
      client.onFailed(ERROR_CONNECT);
      client.reset();
      const afterReset: RequestResultModel = client.sendString('after-reset');
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connectCalls).assertEqual(0);
      expect(client.events.size()).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(afterReset.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlIdenticalScriptsSnapshot
     * @tc.desc          Two clients driven by the same script produce identical snapshots.
     * @tc.precondition  Two empty clients and one shared operation script.
     * @tc.steps         1. Run the script on both clients.
     *                   2. Capture snapshots and metrics.
     *                   3. Compare description and fingerprint.
     * @tc.expected      Snapshots compare equal and metrics fingerprints match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlIdenticalScriptsSnapshot', 0, () => {
      logStep('concurrencyControlIdenticalScriptsSnapshot', 'begin');
      const script: string[] = ['connect', 'onConnect', 'send', 'send', 'disconnect'];
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      runScript(left, script);
      runScript(right, script);
      const leftSnapshot: ClientSnapshot = new ClientSnapshot(left);
      const rightSnapshot: ClientSnapshot = new ClientSnapshot(right);
      expect(leftSnapshot.sameAs(rightSnapshot)).assertTrue();
      expect(leftSnapshot.describe()).assertEqual(rightSnapshot.describe());
      expect(ClientMetrics.from(left).fingerprint()).assertEqual(ClientMetrics.from(right).fingerprint());
      expect(left.toasts.length).assertEqual(right.toasts.length);
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.state).assertEqual(right.state);
    });

    /**
     * @tc.name          concurrencyControlInjectedFailureSingleShot
     * @tc.desc          A single injected send failure does not poison the following request.
     * @tc.precondition  A connected client whose proxy carries a one-shot failure code.
     * @tc.steps         1. Arm the proxy with ERROR_SEND.
     *                   2. Send twice.
     *                   3. Compare per-request codes and proxy counters.
     * @tc.expected      The first request fails, the second succeeds and only one toast of each kind appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlInjectedFailureSingleShot', 0, () => {
      logStep('concurrencyControlInjectedFailureSingleShot', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 140);
      proxy.failNextSend = ERROR_SEND;
      const first: RequestResultModel = client.sendString('first');
      const second: RequestResultModel = client.sendString('second');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(second.errCode).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(2);
      expect(proxy.requests.length).assertEqual(2);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          concurrencyControlLifecycleEventOrder
     * @tc.desc          Lifecycle events are appended in the order connect, register, connected, send.
     * @tc.precondition  An empty client and one request to dispatch.
     * @tc.steps         1. Connect, deliver a proxy and send once.
     *                   2. Read the event entries by index.
     *                   3. Verify the relative ordering.
     * @tc.expected      The trace starts with connect, death-register, connected and ends with send-ok.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlLifecycleEventOrder', 0, () => {
      logStep('concurrencyControlLifecycleEventOrder', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 150);
      client.sendString(REQUEST_PAYLOAD);
      const entries: string[] = client.events.entries;
      expect(entries.length).assertEqual(4);
      expect(entries[0].startsWith('connect:')).assertTrue();
      expect(entries[1].startsWith('death-register:')).assertTrue();
      expect(entries[2].startsWith('connected:')).assertTrue();
      expect(entries[3]).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
    });

    /**
     * @tc.name          concurrencyControlLargeBurstFortyRequests
     * @tc.desc          A forty-request burst against one proxy completes without loss.
     * @tc.precondition  A connected client with a live stub.
     * @tc.steps         1. Dispatch forty requests.
     *                   2. Compare proxy, stub and metrics counters.
     *                   3. Check that the log buffer stayed within its cap.
     * @tc.expected      All forty replies arrive and the aggregate ratio is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlLargeBurstFortyRequests', 0, () => {
      logStep('concurrencyControlLargeBurstFortyRequests', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 160);
      const results: RequestResultModel[] = sendBurst(client, 40);
      expect(results.length).assertEqual(40);
      expect(successCount(results)).assertEqual(40);
      expect(proxy.sendCalls).assertEqual(40);
      expect(proxy.stub.receivedTexts.length).assertEqual(40);
      expect(proxy.stub.requestCount()).assertEqual(40);
      expect(ClientMetrics.from(client).sends).assertEqual(40);
      expect(ClientMetrics.from(client).replies).assertEqual(40);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
      expect(client.logs.size() <= client.logs.limit).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlDistinctPayloadsPreserved
     * @tc.desc          Distinct payloads are delivered in order without merging or reordering.
     * @tc.precondition  A connected client and a five-element payload list.
     * @tc.steps         1. Send each payload in sequence.
     *                   2. Compare the stub receive log with the input list.
     *                   3. Verify the last payload recorded by the proxy.
     * @tc.expected      The stub receive log matches the input order exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDistinctPayloadsPreserved', 0, () => {
      logStep('concurrencyControlDistinctPayloadsPreserved', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 170);
      const payloads: string[] = ['alpha', 'beta', 'gamma', 'delta', 'epsilon'];
      for (let index = 0; index < payloads.length; index++) {
        client.sendString(payloads[index]);
      }
      expect(proxy.stub.receivedTexts.length).assertEqual(5);
      expect(proxy.stub.receivedTexts[0]).assertEqual('alpha');
      expect(proxy.stub.receivedTexts[4]).assertEqual('epsilon');
      expect(proxy.stub.receivedTexts.join(',')).assertEqual('alpha,beta,gamma,delta,epsilon');
      expect(proxy.stub.requestCount()).assertEqual(5);
      expect(eventCount(client, 'send-ok')).assertEqual(5);
      expect(proxy.sendCalls).assertEqual(5);
    });

    /**
     * @tc.name          concurrencyControlZeroLengthBurst
     * @tc.desc          An empty burst is a no-op for events, toasts and proxy counters.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Record event and toast sizes.
     *                   2. Dispatch zero requests.
     *                   3. Compare the sizes again.
     * @tc.expected      No event, toast or send counter changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlZeroLengthBurst', 0, () => {
      logStep('concurrencyControlZeroLengthBurst', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 180);
      const eventsBefore: number = client.events.size();
      const toastsBefore: number = client.toasts.length;
      const results: RequestResultModel[] = sendBurst(client, 0);
      expect(results.length).assertEqual(0);
      expect(client.events.size()).assertEqual(eventsBefore);
      expect(client.toasts.length).assertEqual(toastsBefore);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.stub.requestCount()).assertEqual(0);
      expect(ClientMetrics.from(client).sends).assertEqual(0);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(0);
    });

    /**
     * @tc.name          concurrencyControlConnectDuringConnecting
     * @tc.desc          A second connect is refused while the first is still in flight.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Accept a connect with id 190.
     *                   2. Attempt a second connect.
     *                   3. Deliver onConnect and verify the original id survives.
     * @tc.expected      The duplicate is refused and the original connect id remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlConnectDuringConnecting', 0, () => {
      logStep('concurrencyControlConnectDuringConnecting', 'begin');
      const client: ConnectionModel = newClient();
      const first: boolean = client.connect(190);
      const duplicate: boolean = client.connect(191);
      client.onConnect(new RemoteProxyModel());
      expect(first).assertTrue();
      expect(duplicate).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(190);
      expect(client.connectCalls).assertEqual(2);
      expect(eventCount(client, 'connect')).assertEqual(1);
      expect(client.logs.countLevel('WARN')).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlSendAfterFailedCallback
     * @tc.desc          After onFailed there is still no proxy, so sends are rejected.
     * @tc.precondition  A client that received onFailed without a preceding onConnect.
     * @tc.steps         1. Deliver onFailed with ERROR_CONNECT.
     *                   2. Send two requests.
     *                   3. Inspect codes, state and toast totals.
     * @tc.expected      Both sends fail with the invalid-proxy code and the state stays failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlSendAfterFailedCallback', 0, () => {
      logStep('concurrencyControlSendAfterFailedCallback', 'begin');
      const client: ConnectionModel = newClient();
      client.onFailed(ERROR_CONNECT);
      const results: RequestResultModel[] = sendBurst(client, 2);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(codeCount(results, ERROR_PROXY_INVALID)).assertEqual(2);
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(eventCount(client, 'failed')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlToastAccountingAcrossPhases
     * @tc.desc          Toast totals reconcile with the number of connect, send and disconnect phases.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect and send twice.
     *                   2. Disconnect and then send once.
     *                   3. Sum toasts per category.
     * @tc.expected      One connect toast, two success toasts, one disconnect toast and one failure toast appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlToastAccountingAcrossPhases', 0, () => {
      logStep('concurrencyControlToastAccountingAcrossPhases', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 200);
      client.sendString('phase-one');
      client.sendString('phase-two');
      client.onDisconnect();
      client.sendString('phase-three');
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(2);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(client.toasts.length).assertEqual(5);
      expect(eventCount(client, 'send-ok')).assertEqual(2);
      expect(ClientMetrics.from(client).failures).assertEqual(0);
    });

    /**
     * @tc.name          concurrencyControlRepeatedFailureCallbacks
     * @tc.desc          Repeated failure callbacks accumulate toasts but settle on the last code.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Deliver onFailed with ERROR_CONNECT.
     *                   2. Deliver onFailed with ERROR_DISCONNECT.
     *                   3. Compare failed code, toast count and state.
     * @tc.expected      Two failure toasts appear and the recorded code is the latest one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlRepeatedFailureCallbacks', 0, () => {
      logStep('concurrencyControlRepeatedFailureCallbacks', 'begin');
      const client: ConnectionModel = newClient();
      client.onFailed(ERROR_CONNECT);
      client.onFailed(1002);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(1002);
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(2);
      expect(eventCount(client, 'failed')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlMetricsMatchEventCounts
     * @tc.desc          Aggregate metrics derived from events agree with direct event counts.
     * @tc.precondition  A client with two successes and one injected failure.
     * @tc.steps         1. Connect and send three requests with one armed failure.
     *                   2. Build metrics.
     *                   3. Recompute the expected values by hand.
     * @tc.expected      Metrics and hand-computed counts match exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlMetricsMatchEventCounts', 0, () => {
      logStep('concurrencyControlMetricsMatchEventCounts', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 210);
      proxy.failNextSend = ERROR_SEND;
      sendBurst(client, 3);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(eventCount(client, 'connect'));
      expect(metrics.sends).assertEqual(eventCount(client, 'send-ok') + eventCount(client, 'send-failed'));
      expect(metrics.failures).assertEqual(eventCount(client, 'failed') + eventCount(client, 'send-failed'));
      expect(metrics.replies).assertEqual(eventCount(client, 'send-ok'));
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(2 / 3);
    });

    /**
     * @tc.name          concurrencyControlEventFingerprintStable
     * @tc.desc          The same script repeated on separate clients yields the same event fingerprint.
     * @tc.precondition  Two empty clients and a six-step script with one failure.
     * @tc.steps         1. Run the script on both clients.
     *                   2. Compare fingerprints and traces.
     *                   3. Confirm the fingerprint is non-zero.
     * @tc.expected      Both clients produce an identical, non-zero fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlEventFingerprintStable', 0, () => {
      logStep('concurrencyControlEventFingerprintStable', 'begin');
      const script: string[] = ['connect', 'onConnect', 'send', 'disconnect', 'send', 'connect'];
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      runScript(left, script);
      runScript(right, script);
      const leftPrint: number = left.events.fingerprint();
      const rightPrint: number = right.events.fingerprint();
      expect(leftPrint).assertEqual(rightPrint);
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(leftPrint > 0).assertTrue();
      expect(left.events.size()).assertEqual(right.events.size());
      expect(left.events.size()).assertEqual(7);
      expect(left.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          concurrencyControlLogsBoundedUnderBurst
     * @tc.desc          Two hundred sends keep the bounded log buffer at or below its limit.
     * @tc.precondition  A connected client with a log limit of 128.
     * @tc.steps         1. Dispatch two hundred requests.
     *                   2. Inspect log size, limit and level counts.
     *                   3. Confirm event and toast totals are not capped.
     * @tc.expected      The log buffer holds at most 128 lines while the event log keeps all sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlLogsBoundedUnderBurst', 0, () => {
      logStep('concurrencyControlLogsBoundedUnderBurst', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 220);
      sendBurst(client, 200);
      expect(client.logs.size() <= 128).assertTrue();
      expect(client.logs.size()).assertEqual(128);
      expect(client.logs.countLevel('INFO') > 0).assertTrue();
      expect(client.logs.trace().length > 0).assertTrue();
      expect(eventCount(client, 'send-ok')).assertEqual(200);
      expect(ClientMetrics.from(client).replies).assertEqual(200);
      expect(client.toasts.length).assertEqual(201);
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlToastsTrackOperations
     * @tc.desc          Unbounded toast history grows by exactly one entry per observable action.
     * @tc.precondition  An empty client and fifty planned sends.
     * @tc.steps         1. Connect and send fifty requests.
     *                   2. Count toasts before and after.
     *                   3. Subtract the connect toast from the total.
     * @tc.expected      The toast list length equals one connect plus fifty sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlToastsTrackOperations', 0, () => {
      logStep('concurrencyControlToastsTrackOperations', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 230);
      const baseline: number = client.toasts.length;
      sendBurst(client, 50);
      expect(baseline).assertEqual(1);
      expect(client.toasts.length).assertEqual(51);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(50);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(0);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          concurrencyControlTwoPhaseDelayedConnect
     * @tc.desc          A send issued between connect and onConnect fails once, then succeeds.
     * @tc.precondition  A client in the connecting state with no proxy yet.
     * @tc.steps         1. Call connect with id 240.
     *                   2. Send before the callback arrives.
     *                   3. Deliver onConnect and send again.
     * @tc.expected      Only the pre-callback send fails; the post-callback send succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlTwoPhaseDelayedConnect', 0, () => {
      logStep('concurrencyControlTwoPhaseDelayedConnect', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(240);
      const early: RequestResultModel = client.sendString('too-early');
      client.onConnect(new RemoteProxyModel());
      const late: RequestResultModel = client.sendString('just-right');
      expect(early.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(late.errCode).assertEqual(ERROR_NONE);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(ClientMetrics.from(client).sends).assertEqual(1);
      expect(ClientMetrics.from(client).replies).assertEqual(1);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          concurrencyControlDisconnectClearsBinding
     * @tc.desc          onDisconnect clears the proxy, resets the id and unregisters death.
     * @tc.precondition  A connected client with a registered recipient.
     * @tc.steps         1. Open a session with id 250.
     *                   2. Deliver onDisconnect.
     *                   3. Inspect proxy, id, flag and recipient flags.
     * @tc.expected      The binding is cleared, the id resets and the recipient is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDisconnectClearsBinding', 0, () => {
      logStep('concurrencyControlDisconnectClearsBinding', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 250);
      client.onDisconnect();
      expect(client.proxy).assertUndefined();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlDeathThenDisconnectCleanup
     * @tc.desc          Closing a session whose proxy already died still clears state cleanly.
     * @tc.precondition  A connected client whose proxy has been killed.
     * @tc.steps         1. Open a session with id 260.
     *                   2. Notify death.
     *                   3. Deliver onDisconnect and inspect cleanup flags.
     * @tc.expected      Death is counted once and the session ends disconnected with no proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlDeathThenDisconnectCleanup', 0, () => {
      logStep('concurrencyControlDeathThenDisconnectCleanup', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 260);
      proxy.notifyDeath();
      client.onDisconnect();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.proxy).assertUndefined();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlConnectIdSurvivesFailure
     * @tc.desc          A failed callback keeps the id assigned by the preceding connect request.
     * @tc.precondition  A client that requested connect with id 270.
     * @tc.steps         1. Request connect.
     *                   2. Deliver onFailed.
     *                   3. Compare the id and the disconnect guard.
     * @tc.expected      The id is retained, allowing a later disconnect request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlConnectIdSurvivesFailure', 0, () => {
      logStep('concurrencyControlConnectIdSurvivesFailure', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(270);
      client.onFailed(ERROR_CONNECT);
      const guard: boolean = client.disconnectRequested();
      expect(client.connectId).assertEqual(270);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(guard).assertTrue();
      expect(eventCount(client, 'disconnect-request')).assertEqual(1);
      expect(client.proxy).assertUndefined();
    });

    /**
     * @tc.name          concurrencyControlResetThenReconnect
     * @tc.desc          A reset client can complete a full lifecycle exactly like a fresh instance.
     * @tc.precondition  A client with prior history that was reset.
     * @tc.steps         1. Build history and reset.
     *                   2. Open a new connection and send.
     *                   3. Compare the snapshot with a fresh client driven the same way.
     * @tc.expected      The reset client matches the fresh client after identical work.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlResetThenReconnect', 0, () => {
      logStep('concurrencyControlResetThenReconnect', 'begin');
      const reused: ConnectionModel = newClient();
      openConnection(reused, 280);
      reused.sendString('stale');
      reused.reset();
      openConnection(reused, 281);
      reused.sendString('fresh');
      const reference: ConnectionModel = newClient();
      openConnection(reference, 281);
      reference.sendString('fresh');
      expect(new ClientSnapshot(reused).sameAs(new ClientSnapshot(reference))).assertTrue();
      expect(reused.events.trace()).assertEqual(reference.events.trace());
      expect(ClientMetrics.from(reused).fingerprint()).assertEqual(ClientMetrics.from(reference).fingerprint());
      expect(reused.toasts.length).assertEqual(2);
      expect(reused.logs.contains('stale')).assertFalse();
      expect(reused.isConnected()).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlAlternatingScriptsDiffer
     * @tc.desc          Different scripts produce different snapshots and fingerprints.
     * @tc.precondition  Two clients and two scripts differing in one send step.
     * @tc.steps         1. Run each script on its client.
     *                   2. Capture snapshots and event fingerprints.
     *                   3. Compare sizes and equality.
     * @tc.expected      The snapshots differ in toast count and the fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlAlternatingScriptsDiffer', 0, () => {
      logStep('concurrencyControlAlternatingScriptsDiffer', 'begin');
      const shortClient: ConnectionModel = newClient();
      const longClient: ConnectionModel = newClient();
      runScript(shortClient, ['connect', 'onConnect', 'send']);
      runScript(longClient, ['connect', 'onConnect', 'send', 'send', 'send']);
      const shortSnapshot: ClientSnapshot = new ClientSnapshot(shortClient);
      const longSnapshot: ClientSnapshot = new ClientSnapshot(longClient);
      expect(shortSnapshot.sameAs(longSnapshot)).assertFalse();
      expect(shortSnapshot.toastCount).assertEqual(2);
      expect(longSnapshot.toastCount).assertEqual(4);
      expect(shortClient.events.fingerprint() === longClient.events.fingerprint()).assertFalse();
      expect(shortClient.events.size()).assertEqual(4);
      expect(longClient.events.size()).assertEqual(6);
    });

    /**
     * @tc.name          concurrencyControlRequestCodeRecordedPerSend
     * @tc.desc          Every send records the request code on the proxy in dispatch order.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send five requests.
     *                   2. Read the proxy request list.
     *                   3. Verify every entry is the known request code.
     * @tc.expected      The proxy holds five entries, all equal to the request code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlRequestCodeRecordedPerSend', 0, () => {
      logStep('concurrencyControlRequestCodeRecordedPerSend', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 290);
      sendBurst(client, 5);
      expect(proxy.requests.length).assertEqual(5);
      expect(proxy.requests[0]).assertEqual(1);
      expect(proxy.requests[4]).assertEqual(1);
      expect(countOf(proxy.stub.handledCodes.map((value: number) => String(value)), '1')).assertEqual(5);
      expect(proxy.sendCalls).assertEqual(5);
      expect(proxy.stub.requestCount()).assertEqual(5);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          concurrencyControlSequentialProxiesIndependent
     * @tc.desc          Two sequential sessions keep their proxy request logs independent.
     * @tc.precondition  An empty client and two planned sessions.
     * @tc.steps         1. Open session one and send twice.
     *                   2. Close it, open session two and send once.
     *                   3. Compare both proxy logs.
     * @tc.expected      The first proxy holds two requests and the second holds one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlSequentialProxiesIndependent', 0, () => {
      logStep('concurrencyControlSequentialProxiesIndependent', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 300);
      client.sendString('session-one-a');
      client.sendString('session-one-b');
      client.onDisconnect();
      const second: RemoteProxyModel = openConnection(client, 301);
      client.sendString('session-two');
      expect(first.requests.length).assertEqual(2);
      expect(second.requests.length).assertEqual(1);
      expect(first.stub.receivedTexts.length).assertEqual(2);
      expect(second.stub.receivedTexts.length).assertEqual(1);
      expect(first.isAlive()).assertTrue();
      expect(second.stub.receivedTexts[0]).assertEqual('session-two');
      expect(client.connectCalls).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlMixedBatchSuccessRatio
     * @tc.desc          A success batch followed by a failure batch yields a two-thirds ratio.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect and send ten requests.
     *                   2. Disconnect and send five more.
     *                   3. Build metrics and compare the ratio.
     * @tc.expected      Ten replies out of fifteen attempts produce a ratio of two thirds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlMixedBatchSuccessRatio', 0, () => {
      logStep('concurrencyControlMixedBatchSuccessRatio', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 310);
      sendBurst(client, 10);
      client.onDisconnect();
      sendBurst(client, 5);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(10);
      expect(metrics.replies).assertEqual(10);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(10);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(5);
      expect(client.toasts.length).assertEqual(17);
    });

    /**
     * @tc.name          concurrencyControlDoubleDisconnectIdempotent
     * @tc.desc          Two disconnect callbacks leave the client safely disconnected.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Deliver onDisconnect twice.
     *                   2. Inspect toasts, state and binding.
     *                   3. Confirm a later send still fails safely.
     * @tc.expected      Both callbacks are counted, the state is disconnected and sends still fail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlDoubleDisconnectIdempotent', 0, () => {
      logStep('concurrencyControlDoubleDisconnectIdempotent', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 320);
      client.onDisconnect();
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('post-double');
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(eventCount(client, 'disconnected')).assertEqual(2);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.proxy).assertUndefined();
      expect(client.toasts.length).assertEqual(4);
    });

    /**
     * @tc.name          concurrencyControlConnectThenImmediateDeath
     * @tc.desc          Death immediately after onConnect blocks the very next send.
     * @tc.precondition  A connected client whose proxy dies right away.
     * @tc.steps         1. Open a session with id 330.
     *                   2. Notify death before any send.
     *                   3. Send once and inspect the error.
     * @tc.expected      The send fails with ERROR_SEND and the death recipient records one event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlConnectThenImmediateDeath', 0, () => {
      logStep('concurrencyControlConnectThenImmediateDeath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 330);
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('too-late');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(eventCount(client, 'send-failed')).assertEqual(1);
      expect(eventCount(client, 'send-ok')).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlSendCallsIncludeFailures
     * @tc.desc          Proxy send counters advance for failed dispatches as well as successes.
     * @tc.precondition  A connected client with a one-shot armed failure.
     * @tc.steps         1. Arm the proxy with a send error.
     *                   2. Send twice, then kill the proxy and send once more.
     *                   3. Compare proxy send counters with the requests list.
     * @tc.expected      Three dispatch calls are recorded while only one reply is produced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlSendCallsIncludeFailures', 0, () => {
      logStep('concurrencyControlSendCallsIncludeFailures', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 340);
      proxy.failNextSend = ERROR_SEND;
      client.sendString('armed-failure');
      client.sendString('normal');
      proxy.kill();
      client.sendString('after-kill');
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.stub.requestCount()).assertEqual(1);
      expect(ClientMetrics.from(client).replies).assertEqual(1);
      expect(ClientMetrics.from(client).failures).assertEqual(2);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlFinalAggregateInvariants
     * @tc.desc          A long mixed script obeys counting and state invariants at the end.
     * @tc.precondition  An empty client and a twelve-step mixed script.
     * @tc.steps         1. Run the script.
     *                   2. Recompute aggregate counters independently.
     *                   3. Verify the invariants.
     * @tc.expected      Sends equal replies plus failures and the final state is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlFinalAggregateInvariants', 0, () => {
      logStep('concurrencyControlFinalAggregateInvariants', 'begin');
      const client: ConnectionModel = newClient();
      const script: string[] = ['connect', 'onConnect', 'send', 'send', 'send', 'send', 'disconnect',
        'send', 'send', 'connect', 'onConnect', 'send'];
      const results: OpResult[] = runScript(client, script);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      const sendOps: number = 7;
      expect(results.length).assertEqual(script.length);
      expect(metrics.sends + client.events.countOf('send-no-proxy')).assertEqual(sendOps);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(metrics.replies).assertEqual(5);
      expect(metrics.failures).assertEqual(0);
      expect(client.toasts.length).assertEqual(10);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          concurrencyControlDisconnectBetweenSends
     * @tc.desc          A disconnect inserted between two sends splits the burst into success then failure.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send two requests.
     *                   2. Disconnect and send two more.
     *                   3. Compare per-phase outcomes and metrics.
     * @tc.expected      The first phase succeeds twice and the second fails twice.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlDisconnectBetweenSends', 0, () => {
      logStep('concurrencyControlDisconnectBetweenSends', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 350);
      const early: RequestResultModel[] = sendBurst(client, 2);
      client.onDisconnect();
      const late: RequestResultModel[] = sendBurst(client, 2);
      expect(successCount(early)).assertEqual(2);
      expect(codeCount(late, ERROR_PROXY_INVALID)).assertEqual(2);
      expect(ClientMetrics.from(client).replies).assertEqual(2);
      expect(ClientMetrics.from(client).failures).assertEqual(0);
      expect(client.events.last()).assertEqual('send-no-proxy:' + REQUEST_PAYLOAD);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(6);
    });

    /**
     * @tc.name          concurrencyControlToastFirstEntryPerSession
     * @tc.desc          The first toast of every session is the connect-success message.
     * @tc.precondition  An empty client and two planned sessions.
     * @tc.steps         1. Open session one and record its first toast.
     *                   2. Close and open session two.
     *                   3. Record the toast appended at each connect.
     * @tc.expected      Both sessions start with connect success and end with a disconnect toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlToastFirstEntryPerSession', 0, () => {
      logStep('concurrencyControlToastFirstEntryPerSession', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 360);
      const sessionOneStart: string = client.toasts[0];
      client.onDisconnect();
      const sessionOneEnd: string = client.toasts[1];
      openConnection(client, 361);
      const sessionTwoStart: string = client.toasts[2];
      expect(sessionOneStart).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(sessionOneEnd).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(sessionTwoStart).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(3);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          concurrencyControlSnapshotFieldsAfterDeath
     * @tc.desc          A snapshot taken after death still reports the bound proxy and recipient.
     * @tc.precondition  A connected client whose proxy has died.
     * @tc.steps         1. Open a session and kill the proxy.
     *                   2. Capture a snapshot.
     *                   3. Inspect each field and the description.
     * @tc.expected      The snapshot reports connected, a proxy, a registered recipient and one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlSnapshotFieldsAfterDeath', 0, () => {
      logStep('concurrencyControlSnapshotFieldsAfterDeath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 370);
      proxy.notifyDeath();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(370);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('connected/370/true/true/1');
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlFreshClientBaseline
     * @tc.desc          A fresh client exposes a fully zeroed baseline for counters and history.
     * @tc.precondition  A single newly constructed client.
     * @tc.steps         1. Read state, id, proxy and flags.
     *                   2. Read events, toasts, logs and metrics.
     *                   3. Confirm every baseline value.
     * @tc.expected      The client is disconnected with empty histories and zeroed metrics.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('concurrencyControlFreshClientBaseline', 0, () => {
      logStep('concurrencyControlFreshClientBaseline', 'begin');
      const client: ConnectionModel = newClient();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy).assertUndefined();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlReconnectLoopTenTimes
     * @tc.desc          Ten connect and disconnect cycles leave no residual binding or id.
     * @tc.precondition  An empty client and a loop bound of ten.
     * @tc.steps         1. Repeat open and close ten times.
     *                   2. Count lifecycle events and toasts.
     *                   3. Inspect the final binding state.
     * @tc.expected      Ten of each lifecycle event appear and the client ends disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('concurrencyControlReconnectLoopTenTimes', 0, () => {
      logStep('concurrencyControlReconnectLoopTenTimes', 'begin');
      const client: ConnectionModel = newClient();
      const ids: number[] = [];
      for (let index = 0; index < 10; index++) {
        ids.push(400 + index);
        openConnection(client, 400 + index);
        client.onDisconnect();
      }
      expect(ids.length).assertEqual(10);
      expect(ids[0]).assertEqual(400);
      expect(ids[9]).assertEqual(409);
      expect(eventCount(client, 'connect')).assertEqual(10);
      expect(eventCount(client, 'connected')).assertEqual(10);
      expect(eventCount(client, 'disconnected')).assertEqual(10);
      expect(client.toasts.length).assertEqual(20);
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          concurrencyControlInterleavedScriptTrace
     * @tc.desc          A script with sends interleaved between callbacks yields the expected trace.
     * @tc.precondition  An empty client and an eight-step interleaved script.
     * @tc.steps         1. Run connect, send, onConnect, send, send, disconnect, send, onConnect.
     *                   2. Verify the per-step codes.
     *                   3. Inspect the final trace tail.
     * @tc.expected      Sends fail before a proxy exists and succeed once it is bound.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlInterleavedScriptTrace', 0, () => {
      logStep('concurrencyControlInterleavedScriptTrace', 'begin');
      const client: ConnectionModel = newClient();
      const script: string[] = ['connect', 'send', 'onConnect', 'send', 'send', 'disconnect', 'send', 'onConnect'];
      const results: OpResult[] = runScript(client, script);
      expect(results.length).assertEqual(8);
      expect(results[1].accepted).assertFalse();
      expect(results[1].code).assertEqual(ERROR_PROXY_INVALID);
      expect(results[3].accepted).assertTrue();
      expect(results[4].accepted).assertTrue();
      expect(results[6].code).assertEqual(ERROR_PROXY_INVALID);
      expect(results[7].accepted).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(eventCount(client, 'send-ok')).assertEqual(2);
      expect(eventCount(client, 'send-no-proxy')).assertEqual(2);
    });

    /**
     * @tc.name          concurrencyControlResetTwiceIdempotent
     * @tc.desc          Two consecutive resets leave the client in the same empty baseline.
     * @tc.precondition  A client with one completed session.
     * @tc.steps         1. Build a session and reset.
     *                   2. Reset a second time.
     *                   3. Compare with a fresh client.
     * @tc.expected      The double-reset client equals a fresh client.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlResetTwiceIdempotent', 0, () => {
      logStep('concurrencyControlResetTwiceIdempotent', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 410);
      client.sendString('before-reset');
      client.reset();
      client.reset();
      const fresh: ConnectionModel = newClient();
      expect(new ClientSnapshot(client).sameAs(new ClientSnapshot(fresh))).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectCalls).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          concurrencyControlHandlerFiltersForeignCodes
     * @tc.desc          The stub records every handled code but only answers the known request code.
     * @tc.precondition  A connected client and a proxy referenced directly.
     * @tc.steps         1. Send the normal request code.
     *                   2. Send a foreign code through the proxy manually.
     *                   3. Compare handled codes, received texts and replies.
     * @tc.expected      Both codes are recorded while only the known code produces a reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('concurrencyControlHandlerFiltersForeignCodes', 0, () => {
      logStep('concurrencyControlHandlerFiltersForeignCodes', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 420);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const direct: RequestResultModel =
        proxy.sendMessageRequest(99, data, reply, new MessageOptionModel());
      client.sendString('known-code');
      expect(direct.isSuccess()).assertFalse();
      expect(direct.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.handledCodes.length).assertEqual(2);
      expect(proxy.stub.handledCodes[0]).assertEqual(99);
      expect(proxy.stub.handledCodes[1]).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('known-code');
    });
  });
}
