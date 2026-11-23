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
  INITIAL_CONNECT_ID,
  expectedStateAfter,
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

function isKnownState(state: string): boolean {
  return state === STATE_DISCONNECTED || state === STATE_CONNECTING || state === STATE_CONNECTED ||
    state === STATE_FAILED;
}

export default function connectivityIntegration(): void {
  describe('ConnectivityIntegration', () => {
    beforeAll(() => {
      logSuite('ConnectivityIntegration', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ConnectivityIntegration', 'end');
    });

    /**
     * @tc.name          connectivityIntegrationInitialState
     * @tc.desc          A new client starts disconnected with the sentinel connect id.
     * @tc.precondition  A newly constructed client.
     * @tc.steps         1. Read the state and id.
     *                   2. Confirm no proxy is bound.
     *                   3. Check the liveness predicate.
     * @tc.expected      The client is disconnected, unbound and not connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationInitialState', 0, () => {
      logStep('connectivityIntegrationInitialState', 'begin');
      const client: ConnectionModel = newClient();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy).assertUndefined();
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.connectCalls).assertEqual(0);
      expect(isKnownState(client.state)).assertTrue();
      expect(client.toasts.length).assertEqual(0);
    });

    /**
     * @tc.name          connectivityIntegrationConnectMovesToConnecting
     * @tc.desc          A connect request moves the state to connecting.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Request connect with id 5001.
     *                   2. Read the state.
     *                   3. Confirm the transition is legal.
     * @tc.expected      The state is connecting and the id is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationConnectMovesToConnecting', 0, () => {
      logStep('connectivityIntegrationConnectMovesToConnecting', 'begin');
      const client: ConnectionModel = newClient();
      const accepted: boolean = client.connect(5001);
      expect(accepted).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      expect(client.connectId).assertEqual(5001);
      expect(client.connectCalls).assertEqual(1);
      expect(client.proxy).assertUndefined();
      expect(isKnownState(client.state)).assertTrue();
      expect(eventCount(client, 'connect')).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationOnConnectMovesToConnected
     * @tc.desc          The connect callback moves the state to connected and binds the proxy.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Request connect with id 5002.
     *                   2. Deliver a live proxy.
     *                   3. Inspect state, binding and registration.
     * @tc.expected      The state is connected and the proxy is registered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationOnConnectMovesToConnected', 0, () => {
      logStep('connectivityIntegrationOnConnectMovesToConnected', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5002);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(client.proxy).assertEqual(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(eventCount(client, 'connected')).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationOnDisconnectMovesToDisconnected
     * @tc.desc          The disconnect callback clears the binding and resets the state.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Open a connection with id 5003.
     *                   2. Deliver onDisconnect.
     *                   3. Compare with the state oracle.
     * @tc.expected      The state is disconnected with no proxy and the sentinel id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationOnDisconnectMovesToDisconnected', 0, () => {
      logStep('connectivityIntegrationOnDisconnectMovesToDisconnected', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5003);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(proxy.deathRegistered).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.isDisconnect).assertTrue();
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationOnFailedMovesToFailed
     * @tc.desc          A failed connect callback records the code and state.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Request connect with id 5004.
     *                   2. Deliver onFailed with the connect error.
     *                   3. Compare with the state oracle.
     * @tc.expected      The state is failed with the error code and failure toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationOnFailedMovesToFailed', 0, () => {
      logStep('connectivityIntegrationOnFailedMovesToFailed', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5004);
      client.onFailed(ERROR_CONNECT);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(16000001);
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(eventCount(client, 'failed')).assertEqual(1);
      expect(client.proxy).assertUndefined();
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationTransitionTable
     * @tc.desc          Each callback name maps to the documented state through the oracle.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Drive connect, onConnect, onDisconnect in order.
     *                   2. Compare each observed state with the oracle.
     *                   3. Drive onFailed and compare again.
     * @tc.expected      Every observed state matches the oracle entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationTransitionTable', 0, () => {
      logStep('connectivityIntegrationTransitionTable', 'begin');
      const client: ConnectionModel = newClient();
      const observed: string[] = [];
      client.connect(5005);
      observed.push(client.state);
      client.onConnect(new RemoteProxyModel());
      observed.push(client.state);
      client.onDisconnect();
      observed.push(client.state);
      client.onFailed(ERROR_CONNECT);
      observed.push(client.state);
      const expected: string[] = ['connect', 'onConnect', 'onDisconnect', 'onFailed'].map((name: string) => {
        return expectedStateAfter(name);
      });
      expect(observed.length).assertEqual(4);
      expect(observed.join(',')).assertEqual(expected.join(','));
      expect(observed[0]).assertEqual(STATE_CONNECTING);
      expect(observed[1]).assertEqual(STATE_CONNECTED);
      expect(observed[2]).assertEqual(STATE_DISCONNECTED);
      expect(observed[3]).assertEqual(STATE_FAILED);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          connectivityIntegrationDuplicateConnectRefused
     * @tc.desc          Duplicate connect requests are refused while a session is active.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Attempt two extra connects.
     *                   2. Inspect the accepted flags.
     *                   3. Confirm the original id survived.
     * @tc.expected      Both duplicates are refused and the id stays 5006.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDuplicateConnectRefused', 0, () => {
      logStep('connectivityIntegrationDuplicateConnectRefused', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 5006);
      const first: boolean = client.connect(5007);
      const second: boolean = client.connect(5008);
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(client.connectId).assertEqual(5006);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectCalls).assertEqual(3);
      expect(eventCount(client, 'connect')).assertEqual(1);
      expect(client.logs.countLevel('WARN')).assertEqual(2);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationOnConnectWithoutRequest
     * @tc.desc          A direct onConnect callback still establishes a connected session.
     * @tc.precondition  An empty client in the disconnected state.
     * @tc.steps         1. Deliver onConnect without a prior connect.
     *                   2. Inspect the state and binding.
     *                   3. Confirm the id remained the sentinel.
     * @tc.expected      The proxy is bound and registered while the id is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationOnConnectWithoutRequest', 0, () => {
      logStep('connectivityIntegrationOnConnectWithoutRequest', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy).assertEqual(proxy);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connectCalls).assertEqual(0);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationDeathWhileConnected
     * @tc.desc          A proxy death marks the session unusable without changing the state label.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Open a connection.
     *                   2. Notify death.
     *                   3. Inspect liveness, state and recipient.
     * @tc.expected      The proxy is dead while the state label remains connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDeathWhileConnected', 0, () => {
      logStep('connectivityIntegrationDeathWhileConnected', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5009);
      proxy.notifyDeath();
      expect(proxy.isAlive()).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.proxy).assertEqual(proxy);
      expect(client.connectId).assertEqual(5009);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationDeathCountAccumulates
     * @tc.desc          Repeated death notifications accumulate on the recipient counter.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Notify death four times.
     *                   2. Compare the counter with the description.
     *                   3. Confirm the proxy is dead.
     * @tc.expected      The recipient reports four deaths and stays registered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDeathCountAccumulates', 0, () => {
      logStep('connectivityIntegrationDeathCountAccumulates', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5010);
      for (let index = 0; index < 4; index++) {
        proxy.notifyDeath();
      }
      expect(client.deathRecipient.diedCount).assertEqual(4);
      expect(client.deathRecipient.describe()).assertEqual('4/true');
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectivityIntegrationUnregisterRemovesRecipient
     * @tc.desc          Unregistering removes both the proxy and recipient registration flags.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Unregister the recipient through the proxy.
     *                   2. Inspect both flags.
     *                   3. Repeat the unregister call.
     * @tc.expected      The first unregister succeeds and the second is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationUnregisterRemovesRecipient', 0, () => {
      logStep('connectivityIntegrationUnregisterRemovesRecipient', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5011);
      const first: boolean = proxy.unregisterDeathRecipient(client.deathRecipient);
      const second: boolean = proxy.unregisterDeathRecipient(client.deathRecipient);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient).assertUndefined();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationReRegisterAfterUnregister
     * @tc.desc          A recipient can be registered again after an explicit unregister.
     * @tc.precondition  A connected client with an unregistered recipient.
     * @tc.steps         1. Unregister the recipient.
     *                   2. Register it again.
     *                   3. Notify death and confirm the callback fires.
     * @tc.expected      Registration is restored and the death is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationReRegisterAfterUnregister', 0, () => {
      logStep('connectivityIntegrationReRegisterAfterUnregister', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5012);
      proxy.unregisterDeathRecipient(client.deathRecipient);
      const restored: boolean = proxy.registerDeathRecipient(client.deathRecipient);
      proxy.notifyDeath();
      expect(restored).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(eventCount(client, 'death-register')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          connectivityIntegrationSendFailsAfterDeath
     * @tc.desc          Requests issued after a death fail with the send error code.
     * @tc.precondition  A connected client whose proxy has died.
     * @tc.steps         1. Notify death.
     *                   2. Send three requests.
     *                   3. Inspect codes and toasts.
     * @tc.expected      All three requests fail with ERROR_SEND.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationSendFailsAfterDeath', 0, () => {
      logStep('connectivityIntegrationSendFailsAfterDeath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5013);
      proxy.notifyDeath();
      const results: RequestResultModel[] = sendBurst(client, 3);
      expect(codeCount(results, ERROR_SEND)).assertEqual(3);
      expect(successCount(results)).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(3);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(3);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(ClientMetrics.from(client).failures).assertEqual(3);
    });

    /**
     * @tc.name          connectivityIntegrationRecoveryByReconnect
     * @tc.desc          A client recovers from a loss by disconnecting and reconnecting.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Notify death and disconnect.
     *                   2. Connect with a new id and send.
     *                   3. Inspect the recovered session.
     * @tc.expected      The recovered session is connected, registered and replying.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRecoveryByReconnect', 0, () => {
      logStep('connectivityIntegrationRecoveryByReconnect', 'begin');
      const client: ConnectionModel = newClient();
      const lost: RemoteProxyModel = openConnection(client, 5014);
      lost.notifyDeath();
      client.onDisconnect();
      const recovered: RemoteProxyModel = openConnection(client, 5015);
      const result: RequestResultModel = client.sendString('recovered-send');
      expect(result.isSuccess()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(5015);
      expect(recovered.isAlive()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(recovered.stub.receivedTexts[0]).assertEqual('recovered-send');
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(ClientMetrics.from(client).replies).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationLossDetectedByLiveness
     * @tc.desc          The liveness predicate detects loss even when the state label says connected.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Confirm the healthy predicate.
     *                   2. Kill the proxy and re-check.
     *                   3. Compare state and predicate.
     * @tc.expected      The predicate flips to false while the state label stays connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationLossDetectedByLiveness', 0, () => {
      logStep('connectivityIntegrationLossDetectedByLiveness', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5016);
      const healthy: boolean = client.isConnected();
      proxy.kill();
      const afterKill: boolean = client.isConnected();
      expect(healthy).assertTrue();
      expect(afterKill).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy).assertEqual(proxy);
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationDisconnectAfterDeath
     * @tc.desc          Disconnect after a death clears the binding and unregisters the recipient.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Notify death.
     *                   2. Disconnect.
     *                   3. Inspect proxy, flags and state.
     * @tc.expected      The binding clears and the client ends disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDisconnectAfterDeath', 0, () => {
      logStep('connectivityIntegrationDisconnectAfterDeath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5017);
      proxy.notifyDeath();
      client.onDisconnect();
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.deathRegistered).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          connectivityIntegrationFailedConnectThenRetry
     * @tc.desc          A failed connect is followed by a successful retry.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect and receive onFailed.
     *                   2. Retry with a new id and deliver a proxy.
     *                   3. Send a request.
     * @tc.expected      The retry moves to connected and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationFailedConnectThenRetry', 0, () => {
      logStep('connectivityIntegrationFailedConnectThenRetry', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5018);
      client.onFailed(ERROR_CONNECT);
      const failedId: number = client.connectId;
      const retried: boolean = client.connect(5019);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('after-retry');
      expect(failedId).assertEqual(5018);
      expect(retried).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(5019);
      expect(result.isSuccess()).assertTrue();
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('after-retry');
    });

    /**
     * @tc.name          connectivityIntegrationReconnectLoopFiveTimes
     * @tc.desc          Five connect and disconnect cycles keep the client balanced.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run five cycles with increasing ids.
     *                   2. Count lifecycle events and toasts.
     *                   3. Confirm the final state.
     * @tc.expected      Five of each lifecycle event appear with ten toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationReconnectLoopFiveTimes', 0, () => {
      logStep('connectivityIntegrationReconnectLoopFiveTimes', 'begin');
      const client: ConnectionModel = newClient();
      for (let cycle = 0; cycle < 5; cycle++) {
        openConnection(client, 5020 + cycle);
        client.onDisconnect();
      }
      expect(eventCount(client, 'connect')).assertEqual(5);
      expect(eventCount(client, 'connected')).assertEqual(5);
      expect(eventCount(client, 'disconnected')).assertEqual(5);
      expect(client.toasts.length).assertEqual(10);
      expect(client.connectCalls).assertEqual(5);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationConnectIdLifecycle
     * @tc.desc          The connect id is recorded on request, kept while connected and reset on close.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect with id 5030 and check the id.
     *                   2. Deliver a proxy and check again.
     *                   3. Disconnect and confirm the reset.
     * @tc.expected      The id is 5030 until the disconnect resets it to minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationConnectIdLifecycle', 0, () => {
      logStep('connectivityIntegrationConnectIdLifecycle', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5030);
      const duringConnect: number = client.connectId;
      client.onConnect(new RemoteProxyModel());
      const duringSession: number = client.connectId;
      client.onDisconnect();
      const afterClose: number = client.connectId;
      expect(duringConnect).assertEqual(5030);
      expect(duringSession).assertEqual(5030);
      expect(afterClose).assertEqual(INITIAL_CONNECT_ID);
      expect(client.events.entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(eventCount(client, 'disconnected')).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          connectivityIntegrationDisconnectGuardWithoutId
     * @tc.desc          The disconnect guard refuses a request when no id is recorded.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Request disconnection.
     *                   2. Inspect the guard result and error log.
     *                   3. Confirm no event was recorded.
     * @tc.expected      The guard refuses and logs an error without an event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDisconnectGuardWithoutId', 0, () => {
      logStep('connectivityIntegrationDisconnectGuardWithoutId', 'begin');
      const client: ConnectionModel = newClient();
      const requested: boolean = client.disconnectRequested();
      expect(requested).assertFalse();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(eventCount(client, 'disconnect-request')).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          connectivityIntegrationDisconnectGuardWithId
     * @tc.desc          The disconnect guard accepts a request when an id is recorded.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect with id 5031.
     *                   2. Request disconnection.
     *                   3. Inspect the recorded event.
     * @tc.expected      The guard accepts and records the id in the event log.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDisconnectGuardWithId', 0, () => {
      logStep('connectivityIntegrationDisconnectGuardWithId', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5031);
      const requested: boolean = client.disconnectRequested();
      expect(requested).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:5031');
      expect(eventCount(client, 'disconnect-request')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.connectId).assertEqual(5031);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.toasts.length).assertEqual(0);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationRegisterOnDeadProxy
     * @tc.desc          Registering a recipient on a dead proxy is refused on both sides.
     * @tc.precondition  A killed proxy instance.
     * @tc.steps         1. Kill the proxy.
     *                   2. Attempt registration.
     *                   3. Attempt onConnect with the dead proxy.
     * @tc.expected      Registration fails and the session is connected but not live.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationRegisterOnDeadProxy', 0, () => {
      logStep('connectivityIntegrationRegisterOnDeadProxy', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5032);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      proxy.kill();
      const registered: boolean = proxy.registerDeathRecipient(client.deathRecipient);
      client.onConnect(proxy);
      expect(registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(eventCount(client, 'death-register-failed')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationLivenessToggle
     * @tc.desc          Killing and reviving the proxy toggles the liveness predicate.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Confirm liveness.
     *                   2. Kill and confirm loss.
     *                   3. Revive and confirm recovery.
     * @tc.expected      The predicate follows the proxy liveness exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLivenessToggle', 0, () => {
      logStep('connectivityIntegrationLivenessToggle', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5033);
      const first: boolean = client.isConnected();
      proxy.kill();
      const second: boolean = client.isConnected();
      proxy.revive();
      const third: boolean = client.isConnected();
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(third).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(proxy.isAlive()).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationRecoveryInSameSession
     * @tc.desc          A revived proxy serves requests again without a reconnect.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Kill the proxy and send once.
     *                   2. Revive it and send again.
     *                   3. Compare the outcomes.
     * @tc.expected      The first send fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRecoveryInSameSession', 0, () => {
      logStep('connectivityIntegrationRecoveryInSameSession', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5034);
      proxy.kill();
      const failed: RequestResultModel = client.sendString('while-dead');
      proxy.revive();
      const recovered: RequestResultModel = client.sendString('after-revive');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('after-revive');
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationNoToastWhileConnecting
     * @tc.desc          Connecting alone shows no toast until a callback arrives.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Request connect.
     *                   2. Inspect the toast list.
     *                   3. Deliver a proxy and inspect again.
     * @tc.expected      The toast list is empty while connecting and gains one after the callback.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationNoToastWhileConnecting', 0, () => {
      logStep('connectivityIntegrationNoToastWhileConnecting', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5035);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTING);
      client.onConnect(new RemoteProxyModel());
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(0);
      expect(client.events.countOf('connected')).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationFailureToast
     * @tc.desc          A failed connect produces exactly one failure toast with the documented text.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Request connect with id 5036.
     *                   2. Deliver onFailed.
     *                   3. Compare the toast with the constant.
     * @tc.expected      One failure toast with the documented text appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationFailureToast', 0, () => {
      logStep('connectivityIntegrationFailureToast', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5036);
      client.onFailed(ERROR_CONNECT);
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.toasts[0]).assertEqual(
        'Connect failed. Please ensure that the service is running in the background.');
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(0);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.proxy).assertUndefined();
    });

    /**
     * @tc.name          connectivityIntegrationRecoveryToastFlow
     * @tc.desc          Recovery after a loss appends the connect toast after the disconnect toast.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect, kill and disconnect.
     *                   2. Reconnect.
     *                   3. Inspect the toast tail.
     * @tc.expected      The tail is the second connect success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationRecoveryToastFlow', 0, () => {
      logStep('connectivityIntegrationRecoveryToastFlow', 'begin');
      const client: ConnectionModel = newClient();
      const lost: RemoteProxyModel = openConnection(client, 5037);
      lost.notifyDeath();
      client.onDisconnect();
      openConnection(client, 5038);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationLifecycleEventOrder
     * @tc.desc          Lifecycle events appear in connect, register, connected, disconnected order.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect, deliver a proxy and disconnect.
     *                   2. Read the event entries by index.
     *                   3. Confirm the order.
     * @tc.expected      The trace follows the documented lifecycle order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationLifecycleEventOrder', 0, () => {
      logStep('connectivityIntegrationLifecycleEventOrder', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 5039);
      client.onDisconnect();
      const entries: string[] = client.events.entries;
      expect(entries.length).assertEqual(4);
      expect(entries[0].startsWith('connect:')).assertTrue();
      expect(entries[1].startsWith('death-register:')).assertTrue();
      expect(entries[2].startsWith('connected:')).assertTrue();
      expect(entries[3]).assertEqual('disconnected:ok');
      expect(client.events.last()).assertEqual('disconnected:ok');
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationSnapshotAfterLoss
     * @tc.desc          A snapshot after a loss still reports the bound proxy and registration.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Notify death.
     *                   2. Capture the snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot shows connected with the proxy and one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationSnapshotAfterLoss', 0, () => {
      logStep('connectivityIntegrationSnapshotAfterLoss', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5040);
      proxy.notifyDeath();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(5040);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('connected/5040/true/true/1');
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationMetricsAfterLoss
     * @tc.desc          Metrics after a loss count the succeeded phase and the failed phase separately.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send twice while healthy.
     *                   2. Notify death and send twice.
     *                   3. Compare the metrics.
     * @tc.expected      Two replies and two failures are counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationMetricsAfterLoss', 0, () => {
      logStep('connectivityIntegrationMetricsAfterLoss', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5041);
      sendBurst(client, 2);
      proxy.notifyDeath();
      sendBurst(client, 2);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(4);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(2);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(2);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          connectivityIntegrationMetricsAfterRecovery
     * @tc.desc          Metrics after a recovery include both sessions and the loss in between.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Send once, kill and disconnect.
     *                   2. Reconnect and send twice.
     *                   3. Build metrics.
     * @tc.expected      Three replies and two connects are counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationMetricsAfterRecovery', 0, () => {
      logStep('connectivityIntegrationMetricsAfterRecovery', 'begin');
      const client: ConnectionModel = newClient();
      const lost: RemoteProxyModel = openConnection(client, 5042);
      client.sendString('before-loss');
      lost.notifyDeath();
      client.onDisconnect();
      openConnection(client, 5043);
      sendBurst(client, 2);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.toasts.length).assertEqual(6);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(5043);
    });

    /**
     * @tc.name          connectivityIntegrationProxyRequestsAfterLoss
     * @tc.desc          Failed dispatches after a loss are still recorded on the proxy.
     * @tc.precondition  A connected client whose proxy died.
     * @tc.steps         1. Notify death.
     *                   2. Send three requests.
     *                   3. Inspect the proxy request log.
     * @tc.expected      The log holds three entries while the stub handled none.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationProxyRequestsAfterLoss', 0, () => {
      logStep('connectivityIntegrationProxyRequestsAfterLoss', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5044);
      proxy.notifyDeath();
      sendBurst(client, 3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.stub.handledCodes.length).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.stub.requestCount()).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(3);
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationStubReceiptAfterRecovery
     * @tc.desc          The recovered stub receives only the post-recovery payloads.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Send once in the first session.
     *                   2. Reconnect and send once.
     *                   3. Compare both stub receipts.
     * @tc.expected      Each stub holds only its own payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationStubReceiptAfterRecovery', 0, () => {
      logStep('connectivityIntegrationStubReceiptAfterRecovery', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 5045);
      client.sendString('first-session');
      client.onDisconnect();
      const second: RemoteProxyModel = openConnection(client, 5046);
      client.sendString('second-session');
      expect(first.stub.receivedTexts.length).assertEqual(1);
      expect(second.stub.receivedTexts.length).assertEqual(1);
      expect(first.stub.receivedTexts[0]).assertEqual('first-session');
      expect(second.stub.receivedTexts[0]).assertEqual('second-session');
      expect(first.stub === second.stub).assertFalse();
      expect(client.proxy).assertEqual(second);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(second.isAlive()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationRegistrationFlagMatrix
     * @tc.desc          Client and proxy registration flags stay in lockstep across transitions.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Check flags before connect.
     *                   2. Check after onConnect.
     *                   3. Check after unregister and after disconnect.
     * @tc.expected      Both flags toggle together at each step.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationRegistrationFlagMatrix', 0, () => {
      logStep('connectivityIntegrationRegistrationFlagMatrix', 'begin');
      const client: ConnectionModel = newClient();
      expect(client.deathRecipient.registered).assertFalse();
      const proxy: RemoteProxyModel = openConnection(client, 5047);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.unregisterDeathRecipient(client.deathRecipient);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      proxy.registerDeathRecipient(client.deathRecipient);
      expect(client.deathRecipient.registered).assertTrue();
      client.onDisconnect();
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationStatesAlwaysKnown
     * @tc.desc          Every observed state during a scripted run is a known label.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run a nine-step mixed action script.
     *                   2. Sample the state after each step.
     *                   3. Confirm every sample is known.
     * @tc.expected      No unknown state label is ever observed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationStatesAlwaysKnown', 0, () => {
      logStep('connectivityIntegrationStatesAlwaysKnown', 'begin');
      const client: ConnectionModel = newClient();
      const samples: string[] = [];
      client.connect(5048);
      samples.push(client.state);
      client.onConnect(new RemoteProxyModel());
      samples.push(client.state);
      client.onDisconnect();
      samples.push(client.state);
      client.connect(5049);
      samples.push(client.state);
      client.onFailed(ERROR_CONNECT);
      samples.push(client.state);
      client.connect(5050);
      samples.push(client.state);
      client.onConnect(new RemoteProxyModel());
      samples.push(client.state);
      client.onDisconnect();
      samples.push(client.state);
      let known: number = 0;
      for (let index = 0; index < samples.length; index++) {
        if (isKnownState(samples[index])) {
          known = known + 1;
        }
      }
      expect(samples.length).assertEqual(8);
      expect(known).assertEqual(8);
      expect(samples[0]).assertEqual(STATE_CONNECTING);
      expect(samples[4]).assertEqual(STATE_FAILED);
      expect(samples[7]).assertEqual(STATE_DISCONNECTED);
      expect(client.connectCalls).assertEqual(3);
    });

    /**
     * @tc.name          connectivityIntegrationDoubleDeathSafe
     * @tc.desc          Two death notifications in a row are handled without errors.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Notify death twice.
     *                   2. Send once.
     *                   3. Inspect counters and logs.
     * @tc.expected      The counter reads two and no error-level lines appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationDoubleDeathSafe', 0, () => {
      logStep('connectivityIntegrationDoubleDeathSafe', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5051);
      proxy.notifyDeath();
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('after-double-death');
      expect(client.deathRecipient.diedCount).assertEqual(2);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationDeathWithoutRecipient
     * @tc.desc          A proxy without a registered recipient dies without invoking a callback.
     * @tc.precondition  A standalone proxy with no client registration.
     * @tc.steps         1. Notify death without registering.
     *                   2. Inspect the proxy.
     *                   3. Create a client and confirm it is unaffected.
     * @tc.expected      The proxy dies while an unrelated client stays unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationDeathWithoutRecipient', 0, () => {
      logStep('connectivityIntegrationDeathWithoutRecipient', 'begin');
      const orphan: RemoteProxyModel = new RemoteProxyModel();
      orphan.notifyDeath();
      const client: ConnectionModel = newClient();
      const bound: RemoteProxyModel = openConnection(client, 5052);
      expect(orphan.isAlive()).assertFalse();
      expect(orphan.deathRegistered).assertFalse();
      expect(orphan.deathRecipient).assertUndefined();
      expect(client.isConnected()).assertTrue();
      expect(bound.isAlive()).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationUnregisterThenDeath
     * @tc.desc          A death after unregistering does not reach the recipient.
     * @tc.precondition  A connected client with the registration removed.
     * @tc.steps         1. Unregister the recipient.
     *                   2. Notify death.
     *                   3. Inspect the counter and liveness.
     * @tc.expected      The counter stays zero while the proxy is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationUnregisterThenDeath', 0, () => {
      logStep('connectivityIntegrationUnregisterThenDeath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5053);
      proxy.unregisterDeathRecipient(client.deathRecipient);
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationRepeatedRecoveryCycles
     * @tc.desc          Three loss and recovery cycles each restore a healthy session.
     * @tc.precondition  An empty client.
     * @tc.steps         1. In each cycle connect, lose the proxy and reconnect.
     *                   2. Send after each recovery.
     *                   3. Count deaths and replies.
     * @tc.expected      Three deaths and three replies are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationRepeatedRecoveryCycles', 0, () => {
      logStep('connectivityIntegrationRepeatedRecoveryCycles', 'begin');
      const client: ConnectionModel = newClient();
      for (let cycle = 0; cycle < 3; cycle++) {
        const lost: RemoteProxyModel = openConnection(client, 5060 + cycle);
        lost.notifyDeath();
        client.onDisconnect();
        openConnection(client, 5070 + cycle);
        const result: RequestResultModel = client.sendString('cycle-' + String(cycle));
        expect(result.isSuccess()).assertTrue();
        if (cycle < 2) {
          client.onDisconnect();
        }
      }
      expect(client.deathRecipient.diedCount).assertEqual(3);
      expect(ClientMetrics.from(client).replies).assertEqual(3);
      expect(ClientMetrics.from(client).connects).assertEqual(6);
      expect(client.toasts.length).assertEqual(14);
      expect(client.connectId).assertEqual(5072);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationResetRestoresDisconnected
     * @tc.desc          Reset returns a damaged client to the disconnected baseline.
     * @tc.precondition  A client whose proxy died.
     * @tc.steps         1. Notify death and build history.
     *                   2. Reset the client.
     *                   3. Compare with a fresh client.
     * @tc.expected      The reset client matches the fresh baseline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationResetRestoresDisconnected', 0, () => {
      logStep('connectivityIntegrationResetRestoresDisconnected', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5080);
      proxy.notifyDeath();
      client.sendString('damaged');
      client.reset();
      const fresh: ConnectionModel = newClient();
      expect(new ClientSnapshot(client).sameAs(new ClientSnapshot(fresh))).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy).assertUndefined();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          connectivityIntegrationFinalInvariants
     * @tc.desc          A mixed loss and recovery script satisfies all connectivity invariants.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run health, loss, recovery and close phases.
     *                   2. Build metrics once.
     *                   3. Verify the invariants.
     * @tc.expected      Sends equal replies plus failures and the client ends disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationFinalInvariants', 0, () => {
      logStep('connectivityIntegrationFinalInvariants', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 5090);
      sendBurst(client, 3);
      first.notifyDeath();
      sendBurst(client, 2);
      client.onDisconnect();
      openConnection(client, 5091);
      sendBurst(client, 2);
      client.onDisconnect();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(7);
      expect(metrics.replies).assertEqual(5);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(metrics.connects).assertEqual(2);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy).assertUndefined();
    });

    /**
     * @tc.name          connectivityIntegrationLossDuringBurst
     * @tc.desc          A loss in the middle of a burst splits it into successes, failures and recovery.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send two requests.
     *                   2. Kill the proxy and send two more.
     *                   3. Revive and send one.
     * @tc.expected      Two successes, two failures and one success are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLossDuringBurst', 0, () => {
      logStep('connectivityIntegrationLossDuringBurst', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 5100);
      const before: RequestResultModel[] = sendBurst(client, 2);
      proxy.kill();
      const during: RequestResultModel[] = sendBurst(client, 2);
      proxy.revive();
      const after: RequestResultModel = client.sendString('after-revive');
      expect(successCount(before)).assertEqual(2);
      expect(codeCount(during, ERROR_SEND)).assertEqual(2);
      expect(after.errCode).assertEqual(ERROR_NONE);
      expect(ClientMetrics.from(client).replies).assertEqual(3);
      expect(ClientMetrics.from(client).failures).assertEqual(2);
      expect(client.toasts.length).assertEqual(6);
      expect(client.events.countOf('send-ok')).assertEqual(3);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          connectivityIntegrationDisconnectWhileConnecting
     * @tc.desc          A disconnect callback during the connecting phase returns to disconnected.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Request connect with id 5101.
     *                   2. Deliver onDisconnect without onConnect.
     *                   3. Inspect the state and id.
     * @tc.expected      The state is disconnected with the sentinel id and one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationDisconnectWhileConnecting', 0, () => {
      logStep('connectivityIntegrationDisconnectWhileConnecting', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5101);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy).assertUndefined();
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(eventCount(client, 'connected')).assertEqual(0);
      expect(eventCount(client, 'disconnected')).assertEqual(1);
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationFailedThenConnected
     * @tc.desc          A direct onConnect after a failure restores a working session.
     * @tc.precondition  A client in the failed state.
     * @tc.steps         1. Connect and deliver onFailed.
     *                   2. Deliver onConnect with a live proxy.
     *                   3. Send a request.
     * @tc.expected      The state returns to connected and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationFailedThenConnected', 0, () => {
      logStep('connectivityIntegrationFailedThenConnected', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5102);
      client.onFailed(ERROR_CONNECT);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('restored');
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(proxy.stub.receivedTexts[0]).assertEqual('restored');
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
    });

    /**
     * @tc.name          connectivityIntegrationRecipientReusedAcrossSessions
     * @tc.desc          The death recipient identity survives disconnect and reconnect.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Capture the recipient instance.
     *                   2. Disconnect and reconnect twice.
     *                   3. Compare identities and registration.
     * @tc.expected      The same recipient is registered again in every session.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationRecipientReusedAcrossSessions', 0, () => {
      logStep('connectivityIntegrationRecipientReusedAcrossSessions', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 5103);
      const recipient: DeathRecipientModel = client.deathRecipient;
      client.onDisconnect();
      openConnection(client, 5104);
      const sameAfterFirst: boolean = client.deathRecipient === recipient;
      client.onDisconnect();
      openConnection(client, 5105);
      const sameAfterSecond: boolean = client.deathRecipient === recipient;
      expect(sameAfterFirst).assertTrue();
      expect(sameAfterSecond).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(eventCount(client, 'death-register')).assertEqual(3);
      expect(client.connectId).assertEqual(5105);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          connectivityIntegrationSummarySnapshot
     * @tc.desc          The final connectivity snapshot reflects a healthy current session.
     * @tc.precondition  A connected client with three sends.
     * @tc.steps         1. Connect and send three requests.
     *                   2. Capture the snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reports connected with four toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationSummarySnapshot', 0, () => {
      logStep('connectivityIntegrationSummarySnapshot', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 5106);
      sendBurst(client, 3);
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(5106);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(4);
      expect(snapshot.describe()).assertEqual('connected/5106/true/true/4');
      expect(client.isConnected()).assertTrue();
      expect(ClientMetrics.from(client).replies).assertEqual(3);
    });

    /**
     * @tc.name          connectivityIntegrationConnectAfterFailedState
     * @tc.desc          A connect request from the failed state is accepted without a disconnect.
     * @tc.precondition  A client in the failed state.
     * @tc.steps         1. Fail a connect with id 5110.
     *                   2. Request connect with id 5111.
     *                   3. Deliver a proxy and confirm connected.
     * @tc.expected      The retry is accepted and the state moves to connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationConnectAfterFailedState', 0, () => {
      logStep('connectivityIntegrationConnectAfterFailedState', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(5110);
      client.onFailed(ERROR_CONNECT);
      const accepted: boolean = client.connect(5111);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      expect(accepted).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(5111);
      expect(client.connectCalls).assertEqual(2);
      expect(client.isConnected()).assertTrue();
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(proxy.deathRegistered).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationSendBeforeAndAfterConnect
     * @tc.desc          The same client fails before connecting and succeeds afterwards.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Send before connecting.
     *                   2. Connect and send again.
     *                   3. Compare both results.
     * @tc.expected      The early send fails with the invalid-proxy code and the late one succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationSendBeforeAndAfterConnect', 0, () => {
      logStep('connectivityIntegrationSendBeforeAndAfterConnect', 'begin');
      const client: ConnectionModel = newClient();
      const early: RequestResultModel = client.sendString('early-send');
      openConnection(client, 5112);
      const late: RequestResultModel = client.sendString('late-send');
      expect(early.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(late.errCode).assertEqual(ERROR_NONE);
      expect(late.replyText).assertEqual(REPLY_PAYLOAD);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(ClientMetrics.from(client).sends).assertEqual(1);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationProxySwapWithoutDisconnect
     * @tc.desc          A second onConnect swaps the binding while the old proxy keeps its registration.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Open a session with the first proxy.
     *                   2. Deliver a second proxy without disconnecting.
     *                   3. Compare registrations and the current binding.
     * @tc.expected      The client uses the second proxy while both proxies still report registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationProxySwapWithoutDisconnect', 0, () => {
      logStep('connectivityIntegrationProxySwapWithoutDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 5113);
      const second: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(second);
      const result: RequestResultModel = client.sendString('swapped');
      expect(client.proxy).assertEqual(second);
      expect(client.proxy === first).assertFalse();
      expect(second.deathRegistered).assertTrue();
      expect(first.deathRegistered).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(second.stub.receivedTexts[0]).assertEqual('swapped');
      expect(first.stub.receivedTexts.length).assertEqual(0);
      expect(client.connectId).assertEqual(5113);
    });

    /**
     * @tc.name          connectivityIntegrationLossResetThenConnect
     * @tc.desc          A reset after a loss allows a clean reconnect from the baseline.
     * @tc.precondition  A client whose proxy died.
     * @tc.steps         1. Notify death and reset.
     *                   2. Connect with a new id and send.
     *                   3. Confirm the fresh session.
     * @tc.expected      The reset clears the death history and the new session is healthy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationLossResetThenConnect', 0, () => {
      logStep('connectivityIntegrationLossResetThenConnect', 'begin');
      const client: ConnectionModel = newClient();
      const lost: RemoteProxyModel = openConnection(client, 5114);
      lost.notifyDeath();
      client.reset();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      openConnection(client, 5115);
      const result: RequestResultModel = client.sendString('after-reset');
      expect(result.isSuccess()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(5115);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.connectCalls).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
    });
  });
}
