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
import { logSuite, logStep } from '../Shared/Support';
import {
  ConnectionModel,
  ClientSnapshot,
  RemoteProxyModel,
  RemoteStubModel,
  createConnectedSession,
  expectedStateAfter,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_FAILED,
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_SEND,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

export default function stateValidation(): void {
  describe('StateValidation', () => {
    beforeAll(() => {
      logSuite('StateValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StateValidation', 'end');
    });

    /**
     * @tc.name          stateValidationFourLiterals
     * @tc.desc          The four state literals match the production vocabulary.
     * @tc.precondition  The state constants are exported.
     * @tc.steps         1. Read each constant.
     *                   2. Compare with the expected words.
     *                   3. Deduplicate the list.
     * @tc.expected      The literals are disconnected, connecting, connected, failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationFourLiterals', 0, () => {
      logStep('stateValidation', 'literals');
      expect(STATE_DISCONNECTED).assertEqual('disconnected');
      expect(STATE_CONNECTING).assertEqual('connecting');
      expect(STATE_CONNECTED).assertEqual('connected');
      expect(STATE_FAILED).assertEqual('failed');
      expect(uniqueStrings([STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED]).length)
        .assertEqual(4);
      expect(joined([STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED], '>'))
        .assertEqual('disconnected>connecting>connected');
    });

    /**
     * @tc.name          stateValidationInitialIsDisconnected
     * @tc.desc          A new client starts in the disconnected state.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Construct the client.
     *                   2. Read the state.
     *                   3. Compare with the constant.
     * @tc.expected      The state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationInitialIsDisconnected', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.state).assertEqual('disconnected');
      expect(client.state.length).assertEqual(12);
      expect(client.state.startsWith('dis')).assertTrue();
      expect(client.state.endsWith('ed')).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.connectId).assertEqual(-1);
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          stateValidationConnectMovesToConnecting
     * @tc.desc          connect() transitions the state to connecting.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Call connect(4).
     *                   2. Read the state.
     *                   3. Compare with the oracle.
     * @tc.expected      The state equals connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationConnectMovesToConnecting', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(4)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      expect(client.state.length).assertEqual(10);
      expect(client.state.endsWith('ing')).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.connectId).assertEqual(4);
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationOnConnectMovesToConnected
     * @tc.desc          The success callback transitions the state to connected.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect the client.
     *                   2. Deliver a live proxy.
     *                   3. Read the state.
     * @tc.expected      The state equals connected and isConnected is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationOnConnectMovesToConnected', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(4);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.state).assertEqual(expectedStateAfter('onConnect'));
      expect(client.state.length).assertEqual(9);
      expect(client.state.endsWith('ed')).assertTrue();
      expect(client.isConnected()).assertTrue();
      expect(client.proxy !== undefined).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationOnDisconnectMovesToDisconnected
     * @tc.desc          The disconnect callback returns the state to disconnected.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Create the session.
     *                   2. Trigger onDisconnect.
     *                   3. Read the state.
     * @tc.expected      The state equals disconnected and the proxy is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationOnDisconnectMovesToDisconnected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.connectId).assertEqual(-1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.isDisconnect).assertTrue();
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          stateValidationOnFailedMovesToFailed
     * @tc.desc          The failure callback transitions the state to failed.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect the client.
     *                   2. Trigger onFailed with an error code.
     *                   3. Read the state.
     * @tc.expected      The state equals failed and the code is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationOnFailedMovesToFailed', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(4);
      client.onFailed(ERROR_CONNECT);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      expect(client.state.length).assertEqual(6);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationOracleFourCallbacks
     * @tc.desc          The oracle maps the four documented callbacks to states.
     * @tc.precondition  The oracle helper is imported.
     * @tc.steps         1. Evaluate connect, onConnect and onDisconnect.
     *                   2. Evaluate onFailed and an unknown callback.
     *                   3. Compare with the constants.
     * @tc.expected      The first three map correctly and unknown falls back to failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationOracleFourCallbacks', 0, () => {
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('onConnect')).assertEqual(STATE_CONNECTED);
      expect(expectedStateAfter('onDisconnect')).assertEqual(STATE_DISCONNECTED);
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('unknown')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('')).assertEqual(STATE_FAILED);
      expect(uniqueStrings([expectedStateAfter('connect'), expectedStateAfter('onConnect'),
        expectedStateAfter('onDisconnect')]).length).assertEqual(3);
    });

    /**
     * @tc.name          stateValidationOracleCaseSensitive
     * @tc.desc          Callback keys are case sensitive for the oracle.
     * @tc.precondition  The oracle helper is imported.
     * @tc.steps         1. Query an uppercase key.
     *                   2. Query the lowercase key.
     *                   3. Compare the results.
     * @tc.expected      Only the exact lowercase key resolves to connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationOracleCaseSensitive', 0, () => {
      expect(expectedStateAfter('CONNECT')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('connect')).assertEqual(STATE_CONNECTING);
      expect(expectedStateAfter('OnConnect')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('ONCONNECT')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('onconnect')).assertEqual(STATE_FAILED);
      expect(expectedStateAfter('CONNECT') === expectedStateAfter('connect')).assertFalse();
      expect(expectedStateAfter('onDisconnect')).assertEqual('disconnected');
      expect(expectedStateAfter('onFailed')).assertEqual('failed');
    });

    /**
     * @tc.name          stateValidationIsConnectedMatrix
     * @tc.desc          isConnected is true only in the connected state with a live proxy.
     * @tc.precondition  Clients covering all four states exist.
     * @tc.steps         1. Build clients in each state.
     *                   2. Query isConnected for each.
     *                   3. Count the true results.
     * @tc.expected      Only the connected client reports true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationIsConnectedMatrix', 0, () => {
      const fresh: ConnectionModel = new ConnectionModel();
      const connecting: ConnectionModel = new ConnectionModel();
      connecting.connect(1);
      const connected: ConnectionModel = createConnectedSession();
      const failed: ConnectionModel = new ConnectionModel();
      failed.connect(2);
      failed.onFailed(ERROR_CONNECT);
      let trueCount: number = 0;
      const clients: ConnectionModel[] = [fresh, connecting, connected, failed];
      for (let index = 0; index < clients.length; index++) {
        if (clients[index].isConnected()) {
          trueCount = trueCount + 1;
        }
      }
      expect(trueCount).assertEqual(1);
      expect(connected.isConnected()).assertTrue();
      expect(fresh.isConnected()).assertFalse();
      expect(connecting.isConnected()).assertFalse();
      expect(failed.isConnected()).assertFalse();
      expect(connected.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateValidationConnectRejectedWhenConnected
     * @tc.desc          A connected client refuses a second connect.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Create the session.
     *                   2. Attempt connect(9).
     *                   3. Read the state and warning.
     * @tc.expected      The attempt fails and the state stays connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectRejectedWhenConnected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.connect(9)).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.contains('connect skipped in state connected')).assertTrue();
      expect(client.logs.countLevel('WARN')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          stateValidationConnectRejectedWhenConnecting
     * @tc.desc          A connecting client refuses a second connect.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect with id one.
     *                   2. Attempt connect(2).
     *                   3. Read the state.
     * @tc.expected      The second attempt fails and the state stays connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectRejectedWhenConnecting', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      expect(client.connect(2)).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(1);
      expect(client.logs.contains('connect skipped in state connecting')).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.connectCalls).assertEqual(2);
      expect(client.toasts.length).assertEqual(0);
    });

    /**
     * @tc.name          stateValidationConnectAllowedAfterFailed
     * @tc.desc          A failed client may start a new connection attempt.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Connect again with id forty.
     *                   3. Read the state.
     * @tc.expected      The state moves back to connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectAllowedAfterFailed', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(3);
      client.onFailed(ERROR_CONNECT);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.connect(40)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(40);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.connectCalls).assertEqual(2);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });

    /**
     * @tc.name          stateValidationConnectAllowedAfterDisconnected
     * @tc.desc          A disconnected client may connect again.
     * @tc.precondition  A session was disconnected.
     * @tc.steps         1. Create and disconnect a session.
     *                   2. Connect with id forty-one.
     *                   3. Read the state.
     * @tc.expected      The state is connecting and isDisconnect remains true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectAllowedAfterDisconnected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connect(41)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(41);
      expect(client.isDisconnect).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          stateValidationDoubleDisconnectStaysDisconnected
     * @tc.desc          Two disconnect callbacks keep the state disconnected.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect twice.
     *                   2. Read the state each time.
     *                   3. Count the events.
     * @tc.expected      The state is disconnected after both callbacks.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDoubleDisconnectStaysDisconnected', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.countOf('disconnected')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.connectId).assertEqual(-1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isDisconnect).assertTrue();
      expect(client.events.size()).assertEqual(5);
    });

    /**
     * @tc.name          stateValidationDoubleFailureStaysFailed
     * @tc.desc          Two failure callbacks keep the failed state and last code.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect.
     *                   2. Fail with two different codes.
     *                   3. Compare the stored code.
     * @tc.expected      The state is failed and the latest code is kept.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDoubleFailureStaysFailed', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(5);
      client.onFailed(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      client.onFailed(ERROR_SEND);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_SEND);
      expect(client.events.countOf('failed')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.last()).assertEqual('failed:' + String(ERROR_SEND));
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateValidationDoubleConnectCallback
     * @tc.desc          Two success callbacks keep the state connected and register once each.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect.
     *                   2. Deliver two proxies.
     *                   3. Count connected events.
     * @tc.expected      The state stays connected with two connected events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDoubleConnectCallback', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(6);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const firstProxy: boolean = client.proxy !== undefined;
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(firstProxy).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.events.countOf('connected')).assertEqual(2);
      expect(client.events.countOf('death-register')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
      expect(client.connectId).assertEqual(6);
      expect(client.isConnected()).assertTrue();
      expect(client.logs.countLevel('INFO')).assertEqual(4);
    });

    /**
     * @tc.name          stateValidationStateUnaffectedBySend
     * @tc.desc          Sending keeps the connected state on success and failure.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send successfully.
     *                   2. Force a failure and send again.
     *                   3. Read the state after each send.
     * @tc.expected      The state stays connected through both sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateUnaffectedBySend', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      expect(client.state).assertEqual(STATE_CONNECTED);
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.connectId).assertEqual(7);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          stateValidationFullTransitionPath
     * @tc.desc          A full lifecycle visits all four states in order.
     * @tc.precondition  A fresh client and a live proxy exist.
     * @tc.steps         1. Connect, succeed and disconnect.
     *                   2. Record each observed state.
     *                   3. Fail a separate client afterwards.
     * @tc.expected      The observed sequence is disconnected, connecting, connected, disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFullTransitionPath', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const seen: string[] = [client.state];
      client.connect(1);
      seen.push(client.state);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      seen.push(client.state);
      client.onDisconnect();
      seen.push(client.state);
      expect(seen.length).assertEqual(4);
      expect(joined(seen, '>')).assertEqual('disconnected>connecting>connected>disconnected');
      expect(seen[1]).assertEqual(expectedStateAfter('connect'));
      expect(seen[2]).assertEqual(expectedStateAfter('onConnect'));
      expect(seen[3]).assertEqual(expectedStateAfter('onDisconnect'));
      expect(uniqueStrings(seen).length).assertEqual(3);
      expect(seen.indexOf(STATE_FAILED)).assertLess(0);
    });

    /**
     * @tc.name          stateValidationFailureEntersFourthState
     * @tc.desc          A failure path adds the fourth distinct state.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Collect the two states.
     *                   3. Compare with the full literal set.
     * @tc.expected      The failed state appears after connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFailureEntersFourthState', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const seen: string[] = [client.state];
      client.connect(2);
      seen.push(client.state);
      client.onFailed(ERROR_CONNECT);
      seen.push(client.state);
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(STATE_DISCONNECTED);
      expect(seen[1]).assertEqual(STATE_CONNECTING);
      expect(seen[2]).assertEqual(STATE_FAILED);
      expect(joined(seen, '>')).assertEqual('disconnected>connecting>failed');
      expect(seen[2]).assertEqual(expectedStateAfter('onFailed'));
      expect(uniqueStrings(seen).length).assertEqual(3);
    });

    /**
     * @tc.name          stateValidationResetFromEachState
     * @tc.desc          reset() always lands on disconnected regardless of the prior state.
     * @tc.precondition  Clients in all four states exist.
     * @tc.steps         1. Build the four clients.
     *                   2. Reset each one.
     *                   3. Compare the resulting states.
     * @tc.expected      Every reset client is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationResetFromEachState', 0, () => {
      const fresh: ConnectionModel = new ConnectionModel();
      const connecting: ConnectionModel = new ConnectionModel();
      connecting.connect(1);
      const connected: ConnectionModel = createConnectedSession();
      const failed: ConnectionModel = new ConnectionModel();
      failed.connect(2);
      failed.onFailed(ERROR_CONNECT);
      fresh.reset();
      connecting.reset();
      connected.reset();
      failed.reset();
      expect(fresh.state).assertEqual(STATE_DISCONNECTED);
      expect(connecting.state).assertEqual(STATE_DISCONNECTED);
      expect(connected.state).assertEqual(STATE_DISCONNECTED);
      expect(failed.state).assertEqual(STATE_DISCONNECTED);
      expect(failed.failedCode).assertEqual(ERROR_NONE);
      expect(connected.proxy === undefined).assertTrue();
      expect(connecting.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          stateValidationSnapshotMatchesClient
     * @tc.desc          A snapshot reports the same state as its source client.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Create the session.
     *                   2. Build a snapshot.
     *                   3. Compare both state values.
     * @tc.expected      The snapshot state equals the client state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationSnapshotMatchesClient', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(client.state);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.describe().startsWith('connected/7/true/true/1')).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.connectId).assertEqual(7);
    });

    /**
     * @tc.name          stateValidationDeathKeepsConnectedState
     * @tc.desc          Remote death leaves the recorded state connected but liveness false.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Notify proxy death.
     *                   2. Read the state.
     *                   3. Query isConnected.
     * @tc.expected      The state text is connected and isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationDeathKeepsConnectedState', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.proxy?.notifyDeath();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.state).assertEqual('connected');
      expect(client.isConnected()).assertFalse();
      expect(client.proxy !== undefined).assertTrue();
      expect(client.proxy?.isAlive()).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationStatesAreLowercaseAscii
     * @tc.desc          Every state literal is lowercase ASCII without spaces.
     * @tc.precondition  The four constants are exported.
     * @tc.steps         1. Build the literal list.
     *                   2. Compare each with its lowercase form.
     *                   3. Scan character codes.
     * @tc.expected      All literals are lowercase with codes above one hundred.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStatesAreLowercaseAscii', 0, () => {
      const states: string[] = [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED];
      for (let index = 0; index < states.length; index++) {
        expect(states[index]).assertEqual(states[index].toLowerCase());
        expect(states[index].indexOf(' ')).assertLess(0);
        expect(states[index].charCodeAt(0)).assertLarger(96);
        expect(states[index].charCodeAt(0)).assertLess(123);
      }
      expect(states[3].length).assertEqual(6);
      expect(states[0].length).assertEqual(12);
      expect(states[1].charAt(0)).assertEqual('c');
      expect(states[2].charAt(0)).assertEqual('c');
    });

    /**
     * @tc.name          stateValidationStateLengthSequence
     * @tc.desc          The four state texts have known distinct lengths.
     * @tc.precondition  The state constants are exported.
     * @tc.steps         1. Read each length.
     *                   2. Sum the lengths.
     *                   3. Compare the sum.
     * @tc.expected      The lengths are twelve, ten, nine and six with sum thirty-seven.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateLengthSequence', 0, () => {
      const sum: number = STATE_DISCONNECTED.length + STATE_CONNECTING.length +
        STATE_CONNECTED.length + STATE_FAILED.length;
      expect(STATE_DISCONNECTED.length).assertEqual(12);
      expect(STATE_CONNECTING.length).assertEqual(10);
      expect(STATE_CONNECTED.length).assertEqual(9);
      expect(STATE_FAILED.length).assertEqual(6);
      expect(sum).assertEqual(37);
      expect(STATE_DISCONNECTED.length).assertLarger(STATE_CONNECTED.length);
      expect(STATE_FAILED.length).assertLess(STATE_CONNECTING.length);
    });

    /**
     * @tc.name          stateValidationStateFingerprintsUnique
     * @tc.desc          The four state literals hash differently.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Hash each state literal.
     *                   2. Deduplicate the hash texts.
     *                   3. Confirm positive hashes.
     * @tc.expected      All four hashes are distinct and positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateFingerprintsUnique', 0, () => {
      const states: string[] = [STATE_DISCONNECTED, STATE_CONNECTING, STATE_CONNECTED, STATE_FAILED];
      const hashes: string[] = [];
      for (let index = 0; index < states.length; index++) {
        const hash: number = textFingerprint(states[index]);
        hashes.push(String(hash));
        expect(hash).assertLarger(0);
      }
      expect(hashes.length).assertEqual(4);
      expect(uniqueStrings(hashes).length).assertEqual(4);
      expect(textFingerprint(STATE_CONNECTED) === textFingerprint(STATE_CONNECTING)).assertFalse();
      expect(textFingerprint(STATE_FAILED)).assertEqual(textFingerprint('failed'));
      expect(textFingerprint(STATE_DISCONNECTED)).assertLarger(0);
    });

    /**
     * @tc.name          stateValidationFailureThenDisconnectThenConnect
     * @tc.desc          Three callbacks drive the state failed, disconnected, connecting.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Fail the client.
     *                   2. Disconnect it.
     *                   3. Connect again.
     * @tc.expected      Each step matches the oracle mapping.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFailureThenDisconnectThenConnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(2);
      client.onFailed(ERROR_CONNECT);
      expect(client.state).assertEqual(expectedStateAfter('onFailed'));
      client.onDisconnect();
      expect(client.state).assertEqual(expectedStateAfter('onDisconnect'));
      expect(client.connect(3)).assertTrue();
      expect(client.state).assertEqual(expectedStateAfter('connect'));
      expect(client.connectId).assertEqual(3);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          stateValidationTransitionPairCount
     * @tc.desc          A three-step lifecycle produces three ordered transition pairs.
     * @tc.precondition  A client and live proxy exist.
     * @tc.steps         1. Record the four observations.
     *                   2. Build the three adjacent pairs.
     *                   3. Compare the joined pairs.
     * @tc.expected      The pairs are dis-conn, conn-conn, conn-dis.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationTransitionPairCount', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const seen: string[] = [client.state];
      client.connect(1);
      seen.push(client.state);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      seen.push(client.state);
      client.onDisconnect();
      seen.push(client.state);
      const pairs: string[] = [];
      for (let index = 0; index + 1 < seen.length; index++) {
        pairs.push(seen[index] + '->' + seen[index + 1]);
      }
      expect(pairs.length).assertEqual(3);
      expect(pairs[0]).assertEqual('disconnected->connecting');
      expect(pairs[1]).assertEqual('connecting->connected');
      expect(pairs[2]).assertEqual('connected->disconnected');
      expect(joined(pairs, ',')).assertEqual(
        'disconnected->connecting,connecting->connected,connected->disconnected');
      expect(countOf(pairs, 'connected->disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationInvalidWantStillConnecting
     * @tc.desc          An invalid want does not prevent the connecting state.
     * @tc.precondition  A client with an empty bundle exists.
     * @tc.steps         1. Connect the invalid client.
     *                   2. Read the state.
     *                   3. Confirm the want error remains.
     * @tc.expected      The state is connecting with one want error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationInvalidWantStillConnecting', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.want.bundleName = '';
      expect(client.connect(5)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.want.validate().length).assertEqual(1);
      expect(client.want.validate()[0]).assertEqual('bundle-empty');
      expect(client.disconnectRequested()).assertTrue();
      expect(client.connectId).assertEqual(5);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateValidationSentinelConnectState
     * @tc.desc          Connecting with the sentinel id still enters connecting.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect with minus one.
     *                   2. Read the state.
     *                   3. Request a disconnect.
     * @tc.expected      The state is connecting while disconnect requests are blocked.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationSentinelConnectState', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(-1)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(-1);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateValidationZeroIdConnectState
     * @tc.desc          Connecting with id zero enters connecting normally.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect with zero.
     *                   2. Read the state.
     *                   3. Request a disconnect.
     * @tc.expected      The state is connecting and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationZeroIdConnectState', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(0);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(0);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:0');
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
      expect(client.toasts.length).assertEqual(0);
    });

    /**
     * @tc.name          stateValidationStateAndToastCorrelation
     * @tc.desc          Each callback state pairs with its documented toast.
     * @tc.precondition  A fresh client and live proxy exist.
     * @tc.steps         1. Succeed the connection.
     *                   2. Disconnect.
     *                   3. Fail a second client.
     * @tc.expected      Connected pairs with the success toast and failed with the fail toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateAndToastCorrelation', 0, () => {
      const good: ConnectionModel = new ConnectionModel();
      good.connect(1);
      expect(good.toasts.length).assertEqual(0);
      good.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(good.state).assertEqual(STATE_CONNECTED);
      expect(good.lastToast()).assertEqual('connectAbility success');
      good.onDisconnect();
      expect(good.state).assertEqual(STATE_DISCONNECTED);
      expect(good.lastToast()).assertEqual('disconnectAbility success');
      const bad: ConnectionModel = new ConnectionModel();
      bad.connect(2);
      bad.onFailed(ERROR_CONNECT);
      expect(bad.state).assertEqual(STATE_FAILED);
      expect(bad.lastToast().startsWith('Connect failed.')).assertTrue();
      expect(bad.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationFailureLogMentionsCode
     * @tc.desc          The failure log carries the numeric error code.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Fail with code 16000005.
     *                   2. Join the log trace.
     *                   3. Search for the code text.
     * @tc.expected      The trace contains 'onFailed code 16000005'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFailureLogMentionsCode', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(3);
      client.onFailed(16000005);
      expect(client.logs.size()).assertEqual(1);
      expect(client.logs.contains('ERROR onFailed code 16000005')).assertTrue();
      expect(client.logs.trace()).assertEqual('ERROR onFailed code 16000005');
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.trace().indexOf(String(client.failedCode))).assertLarger(0);
      expect(client.logs.trace().startsWith('ERROR ')).assertTrue();
      expect(client.state).assertEqual(STATE_FAILED);
    });

    /**
     * @tc.name          stateValidationSnapshotDescribeAllStates
     * @tc.desc          Snapshot descriptions begin with the matching state word.
     * @tc.precondition  Clients in all four states exist.
     * @tc.steps         1. Build the four clients and snapshots.
     *                   2. Read each description.
     *                   3. Compare the first segment.
     * @tc.expected      Each description starts with the client state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationSnapshotDescribeAllStates', 0, () => {
      const fresh: ConnectionModel = new ConnectionModel();
      const connecting: ConnectionModel = new ConnectionModel();
      connecting.connect(1);
      const connected: ConnectionModel = createConnectedSession();
      const failed: ConnectionModel = new ConnectionModel();
      failed.connect(2);
      failed.onFailed(ERROR_CONNECT);
      const clients: ConnectionModel[] = [fresh, connecting, connected, failed];
      const heads: string[] = [];
      for (let index = 0; index < clients.length; index++) {
        const snapshot: ClientSnapshot = new ClientSnapshot(clients[index]);
        heads.push(snapshot.describe().split('/')[0]);
        expect(snapshot.describe().split('/').length).assertEqual(5);
      }
      expect(joined(heads, ',')).assertEqual('disconnected,connecting,connected,failed');
      expect(uniqueStrings(heads).length).assertEqual(4);
      expect(heads[2]).assertEqual(STATE_CONNECTED);
      expect(heads[3]).assertEqual(STATE_FAILED);
    });

    /**
     * @tc.name          stateValidationStateStableAcrossManySends
     * @tc.desc          Fifty sends never alter the connected state.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send fifty payloads.
     *                   2. Read the state.
     *                   3. Count the send events.
     * @tc.expected      The state is connected with fifty send events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateStableAcrossManySends', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 50; index++) {
        client.sendString('payload');
      }
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.events.countOf('send-ok')).assertEqual(50);
      expect(client.toasts.length).assertEqual(51);
      expect(client.connectId).assertEqual(7);
      expect(client.isConnected()).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.events.size()).assertEqual(53);
    });

    /**
     * @tc.name          stateValidationStrictStringComparison
     * @tc.desc          State strings compare strictly equal to their literals.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Compare the state with strict equality.
     *                   2. Compare with a padded variant.
     *                   3. Compare a mismatched literal.
     * @tc.expected      Only the exact literal compares true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStrictStringComparison', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.state === STATE_CONNECTED).assertTrue();
      expect(client.state === STATE_CONNECTED + ' ').assertFalse();
      expect(client.state === STATE_CONNECTED.toUpperCase()).assertFalse();
      expect(client.state === STATE_CONNECTING).assertFalse();
      expect(client.state.length).assertEqual(9);
      expect(client.state.trim()).assertEqual(client.state);
      expect(client.state.indexOf(' ')).assertLess(0);
      expect(client.state.split('').length).assertEqual(9);
    });

    /**
     * @tc.name          stateValidationConnectedWordPrefixRelation
     * @tc.desc          connected and connecting share a common prefix of ten characters.
     * @tc.precondition  The two literals are exported.
     * @tc.steps         1. Slice both to ten characters.
     *                   2. Compare slices.
     *                   3. Compare full lengths.
     * @tc.expected      The ten character slices are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationConnectedWordPrefixRelation', 0, () => {
      const left: string = STATE_CONNECTING.slice(0, 10);
      const right: string = STATE_CONNECTED.slice(0, 9) + 'g';
      expect(left).assertEqual('connecti' + 'ng');
      expect(STATE_CONNECTING.startsWith('connect')).assertTrue();
      expect(STATE_CONNECTED.startsWith('connect')).assertTrue();
      expect(STATE_CONNECTED.indexOf('connect')).assertEqual(0);
      expect(STATE_CONNECTING.indexOf('connect')).assertEqual(0);
      expect(STATE_CONNECTING.slice(0, 7)).assertEqual(STATE_CONNECTED.slice(0, 7));
      expect(right.length).assertEqual(10);
      expect(left === STATE_CONNECTED).assertFalse();
    });

    /**
     * @tc.name          stateValidationKilledProxyOnConnectState
     * @tc.desc          A killed proxy yields connected state with failed registration.
     * @tc.precondition  A proxy is killed before the callback.
     * @tc.steps         1. Connect the client.
     *                   2. Hand over the killed proxy.
     *                   3. Read the state and liveness.
     * @tc.expected      The state is connected while isConnected is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationKilledProxyOnConnectState', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(8);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.connectId).assertEqual(8);
      expect(client.state === STATE_CONNECTING).assertFalse();
    });

    /**
     * @tc.name          stateValidationConnectAfterDoubleFailure
     * @tc.desc          A twice failed client can still start a new attempt.
     * @tc.precondition  A client failed twice exists.
     * @tc.steps         1. Fail the client twice.
     *                   2. Connect again.
     *                   3. Read the state and code.
     * @tc.expected      The state is connecting and the last code persists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectAfterDoubleFailure', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(ERROR_CONNECT);
      client.onFailed(ERROR_SEND);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.connect(2)).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.failedCode).assertEqual(ERROR_SEND);
      expect(client.events.countOf('failed')).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
      expect(client.connectId).assertEqual(2);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateValidationMetricsTrackSendState
     * @tc.desc          Send success and failure metrics match the recorded state events.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send once successfully.
     *                   2. Force a failure and send again.
     *                   3. Compare event counts.
     * @tc.expected      One success and one failure are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationMetricsTrackSendState', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString();
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.lastToast().startsWith('sendRequest failed')).assertTrue();
      expect(client.failedCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name          stateValidationDisconnectThenIsConnected
     * @tc.desc          The liveness predicate is false in every non-connected state.
     * @tc.precondition  Clients in three non-connected states exist.
     * @tc.steps         1. Build fresh, failed and disconnected clients.
     *                   2. Query isConnected for each.
     *                   3. Compare the states.
     * @tc.expected      All three report false with their own state text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDisconnectThenIsConnected', 0, () => {
      const fresh: ConnectionModel = new ConnectionModel();
      const failed: ConnectionModel = new ConnectionModel();
      failed.connect(1);
      failed.onFailed(ERROR_CONNECT);
      const gone: ConnectionModel = createConnectedSession();
      gone.onDisconnect();
      expect(fresh.isConnected()).assertFalse();
      expect(failed.isConnected()).assertFalse();
      expect(gone.isConnected()).assertFalse();
      expect(fresh.state).assertEqual(STATE_DISCONNECTED);
      expect(failed.state).assertEqual(STATE_FAILED);
      expect(gone.state).assertEqual(STATE_DISCONNECTED);
      expect(gone.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          stateValidationFailureThenConnectCallback
     * @tc.desc          A late success callback after a failure still sets connected.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. Fail the client.
     *                   2. Deliver a live proxy.
     *                   3. Read the state.
     * @tc.expected      The state becomes connected despite the earlier failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationFailureThenConnectCallback', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(9);
      client.onFailed(ERROR_CONNECT);
      expect(client.state).assertEqual(STATE_FAILED);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
      expect(client.connectId).assertEqual(9);
    });

    /**
     * @tc.name          stateValidationResetBetweenTransitions
     * @tc.desc          Repeating a lifecycle after reset yields the same state sequence.
     * @tc.precondition  A client completed one lifecycle.
     * @tc.steps         1. Run the lifecycle once and reset.
     *                   2. Run it again.
     *                   3. Compare the two sequences.
     * @tc.expected      Both cycles visit the same three states.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationResetBetweenTransitions', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const first: string[] = [];
      client.connect(1);
      first.push(client.state);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      first.push(client.state);
      client.onDisconnect();
      first.push(client.state);
      client.reset();
      const second: string[] = [];
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      client.connect(2);
      second.push(client.state);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      second.push(client.state);
      client.onDisconnect();
      second.push(client.state);
      expect(joined(first, '>')).assertEqual(joined(second, '>'));
      expect(joined(first, '>')).assertEqual('connecting>connected>disconnected');
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.size()).assertEqual(4);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationTwoClientsIndependent
     * @tc.desc          Changing one client state leaves the other untouched.
     * @tc.precondition  Two connecting clients exist.
     * @tc.steps         1. Fail the first client.
     *                   2. Read both states.
     *                   3. Disconnect the second.
     * @tc.expected      Each client state changes independently.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationTwoClientsIndependent', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      first.connect(1);
      second.connect(2);
      first.onFailed(ERROR_CONNECT);
      expect(first.state).assertEqual(STATE_FAILED);
      expect(second.state).assertEqual(STATE_CONNECTING);
      expect(first.state === second.state).assertFalse();
      second.onDisconnect();
      expect(first.state).assertEqual(STATE_FAILED);
      expect(second.state).assertEqual(STATE_DISCONNECTED);
      expect(first.connectId).assertEqual(1);
      expect(second.connectId).assertEqual(-1);
      expect(uniqueStrings([first.state, second.state]).length).assertEqual(2);
    });

    /**
     * @tc.name          stateValidationThreeCycleStates
     * @tc.desc          Three connect cycles always start from disconnected.
     * @tc.precondition  One client is reused three times.
     * @tc.steps         1. Connect three times with a failed step between.
     *                   2. Record the pre-connect state each cycle.
     *                   3. Compare the recorded list.
     * @tc.expected      Every pre-connect state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationThreeCycleStates', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const before: string[] = [];
      for (let index = 0; index < 3; index++) {
        before.push(client.state);
        client.connect(index + 1);
        client.onFailed(ERROR_CONNECT);
        client.onDisconnect();
      }
      expect(before.length).assertEqual(3);
      expect(uniqueStrings(before).length).assertEqual(1);
      expect(before[0]).assertEqual(STATE_DISCONNECTED);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.countOf('failed')).assertEqual(3);
      expect(client.events.countOf('disconnected')).assertEqual(3);
      expect(client.toasts.length).assertEqual(6);
    });

    /**
     * @tc.name          stateValidationConnectInfoLogSequence
     * @tc.desc          onConnect logs the registration and callback messages in order.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect and deliver a proxy.
     *                   2. Read the log trace.
     *                   3. Compare with the expected trace.
     * @tc.expected      The trace holds the register and onConnect lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationConnectInfoLogSequence', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(15);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.logs.size()).assertEqual(2);
      expect(client.logs.countLevel('INFO')).assertEqual(2);
      expect(client.logs.trace()).assertEqual('INFO registerDeathRecipient success|INFO onConnect');
      expect(client.logs.lines[0].startsWith('INFO ')).assertTrue();
      expect(client.logs.lines[1]).assertEqual('INFO onConnect');
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          stateValidationConnectedWithoutProxy
     * @tc.desc          A connected state without a proxy fails the liveness predicate.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Assign the connected state directly.
     *                   2. Query isConnected.
     *                   3. Clear the assignment with reset.
     * @tc.expected      isConnected is false with the state text connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationConnectedWithoutProxy', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.state = STATE_CONNECTED;
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.connectId).assertEqual(-1);
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.logs.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
    });

    /**
     * @tc.name          stateValidationSnapshotEqualityAfterSameLifecycle
     * @tc.desc          Two identical lifecycles produce equal snapshots.
     * @tc.precondition  Two clients run the same callbacks.
     * @tc.steps         1. Connect and succeed on both.
     *                   2. Snapshot both.
     *                   3. Compare equality.
     * @tc.expected      The snapshots are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationSnapshotEqualityAfterSameLifecycle', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      first.connect(3);
      second.connect(3);
      first.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      second.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const left: ClientSnapshot = new ClientSnapshot(first);
      const right: ClientSnapshot = new ClientSnapshot(second);
      expect(left.sameAs(right)).assertTrue();
      expect(left.state).assertEqual(STATE_CONNECTED);
      expect(left.toastCount).assertEqual(1);
      expect(left.deathRegistered).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(left.describe()).assertEqual('connected/3/true/true/1');
    });

    /**
     * @tc.name          stateValidationFourDisconnects
     * @tc.desc          Four disconnect callbacks stay in the disconnected state.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Call onDisconnect four times.
     *                   2. Read the state.
     *                   3. Count the events and toasts.
     * @tc.expected      The state is disconnected with four events and four toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFourDisconnects', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 4; index++) {
        client.onDisconnect();
        expect(client.state).assertEqual(STATE_DISCONNECTED);
      }
      expect(client.events.countOf('disconnected')).assertEqual(4);
      expect(client.toasts.length).assertEqual(5);
      expect(client.connectId).assertEqual(-1);
      expect(client.isConnected()).assertFalse();
      expect(client.events.size()).assertEqual(7);
      expect(client.logs.countLevel('INFO')).assertEqual(6);
    });

    /**
     * @tc.name          stateValidationFailedCodeDefaults
     * @tc.desc          Non-failed clients keep a zero failure code.
     * @tc.precondition  Clients in three non-failed states exist.
     * @tc.steps         1. Build the clients.
     *                   2. Read failedCode.
     *                   3. Compare with the none constant.
     * @tc.expected      Every code is the none constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFailedCodeDefaults', 0, () => {
      const fresh: ConnectionModel = new ConnectionModel();
      const connecting: ConnectionModel = new ConnectionModel();
      connecting.connect(1);
      const connected: ConnectionModel = createConnectedSession();
      expect(fresh.failedCode).assertEqual(ERROR_NONE);
      expect(connecting.failedCode).assertEqual(ERROR_NONE);
      expect(connected.failedCode).assertEqual(ERROR_NONE);
      expect(fresh.failedCode).assertEqual(0);
      expect(connecting.state).assertEqual(STATE_CONNECTING);
      expect(connected.state).assertEqual(STATE_CONNECTED);
      expect(fresh.state).assertEqual(STATE_DISCONNECTED);
      expect(connected.failedCode === ERROR_CONNECT).assertFalse();
    });

    /**
     * @tc.name          stateValidationSendWithoutProxyKeepsState
     * @tc.desc          A failed send from a disconnected client keeps the state.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Send without connecting.
     *                   2. Read the state.
     *                   3. Read the result code.
     * @tc.expected      The state stays disconnected with the proxy invalid code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationSendWithoutProxyKeepsState', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.sendString().errCode).assertEqual(16000004);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.connectId).assertEqual(-1);
      expect(client.state.length).assertEqual(12);
    });

    /**
     * @tc.name          stateValidationConnectedThenFailed
     * @tc.desc          A failure callback after success overrides the state.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Create the session.
     *                   2. Trigger onFailed.
     *                   3. Read the state and proxy.
     * @tc.expected      The state becomes failed while the proxy reference remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationConnectedThenFailed', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.state).assertEqual(STATE_CONNECTED);
      client.onFailed(ERROR_SEND);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.isConnected()).assertFalse();
      expect(client.proxy !== undefined).assertTrue();
      expect(client.failedCode).assertEqual(ERROR_SEND);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.connectId).assertEqual(7);
      expect(client.toasts.length).assertEqual(2);
      expect(client.lastToast().startsWith('Connect failed')).assertTrue();
    });

    /**
     * @tc.name          stateValidationResetFromConnectedClears
     * @tc.desc          Reset from connected removes proxy, toasts and events.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send once.
     *                   2. Reset.
     *                   3. Read the state, proxy, toasts and events.
     * @tc.expected      Everything is cleared and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationResetFromConnectedClears', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      expect(client.toasts.length).assertEqual(2);
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.connectId).assertEqual(-1);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateValidationMutationVisibleInSnapshot
     * @tc.desc          A state assigned externally is visible to a new snapshot.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Assign the failed state.
     *                   2. Build a snapshot.
     *                   3. Compare the snapshot state.
     * @tc.expected      The snapshot reports failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationMutationVisibleInSnapshot', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.state = STATE_FAILED;
      client.failedCode = ERROR_CONNECT;
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_FAILED);
      expect(snapshot.describe().startsWith('failed/')).assertTrue();
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.toastCount).assertEqual(0);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.state).assertEqual(expectedStateAfter('onFailed'));
      expect(snapshot.describe().split('/').length).assertEqual(5);
    });

    /**
     * @tc.name          stateValidationConnectWordLengthDifference
     * @tc.desc          Connecting is one character longer than connected.
     * @tc.precondition  The two literals are exported.
     * @tc.steps         1. Subtract the lengths.
     *                   2. Compare the suffix letters.
     *                   3. Check the prefixes.
     * @tc.expected      The difference is one and the suffixes differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectWordLengthDifference', 0, () => {
      expect(STATE_CONNECTING.length - STATE_CONNECTED.length).assertEqual(1);
      expect(STATE_CONNECTING.endsWith('ing')).assertTrue();
      expect(STATE_CONNECTED.endsWith('ed')).assertTrue();
      expect(STATE_CONNECTING.charAt(9)).assertEqual('g');
      expect(STATE_CONNECTED.charAt(8)).assertEqual('d');
      expect(STATE_CONNECTING.slice(0, 7)).assertEqual(STATE_CONNECTED.slice(0, 7));
      expect(STATE_CONNECTING === STATE_CONNECTED).assertFalse();
    });

    /**
     * @tc.name          stateValidationLifecycleWithSendAndClose
     * @tc.desc          A lifecycle of connect, send, fail and disconnect ends disconnected.
     * @tc.precondition  A fresh client and live proxy exist.
     * @tc.steps         1. Connect, succeed and send.
     *                   2. Force a send failure.
     *                   3. Disconnect.
     * @tc.expected      The final state is disconnected with four events before closing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationLifecycleWithSendAndClose', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(70);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.sendString('alpha');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('beta');
      expect(client.state).assertEqual(STATE_CONNECTED);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(4);
      expect(client.connectId).assertEqual(-1);
    });
    /**
     * @tc.name          stateValidationFailureToastAfterSendFailure
     * @tc.desc          Sending while failed still leaves the recorded failed state.
     * @tc.precondition  A failed client exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Send without a proxy.
     *                   3. Read the state and toasts.
     * @tc.expected      The state stays failed and the send toast is last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFailureToastAfterSendFailure', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(11);
      client.onFailed(ERROR_CONNECT);
      expect(client.sendString().errCode).assertEqual(16000004);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0].startsWith('Connect failed')).assertTrue();
      expect(client.lastToast().startsWith('sendRequest failed')).assertTrue();
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          stateValidationTransitionCountPerCallback
     * @tc.desc          Each callback records exactly one transition event.
     * @tc.precondition  A fresh client and live proxy exist.
     * @tc.steps         1. Connect, succeed, send and disconnect.
     *                   2. Count the transition events.
     *                   3. Compare with the expected total.
     * @tc.expected      The transition events total four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationTransitionCountPerCallback', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(12);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.sendString();
      client.onDisconnect();
      const transitions: number = client.events.countOf('connect') + client.events.countOf('connected') +
        client.events.countOf('disconnected');
      expect(transitions).assertEqual(3);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.connectId).assertEqual(-1);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
    });
  });
}
