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
  WantModel,
  RemoteProxyModel,
  RemoteStubModel,
  createConnectedSession,
  ClientSnapshot,
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_CONNECT,
  STATE_DISCONNECTED,
  STATE_CONNECTING,
  STATE_CONNECTED,
  STATE_FAILED,
  clampInt,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

export default function connectIdValidation(): void {
  describe('ConnectIdValidation', () => {
    beforeAll(() => {
      logSuite('ConnectIdValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConnectIdValidation', 'end');
    });

    /**
     * @tc.name          connectIdValidationSentinelIsMinusOne
     * @tc.desc          The unconnected sentinel is exactly minus one.
     * @tc.precondition  INITIAL_CONNECT_ID is exported.
     * @tc.steps         1. Read the constant.
     *                   2. Compare with the literal.
     *                   3. Check it is negative.
     * @tc.expected      The sentinel equals -1 and is the only negative constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationSentinelIsMinusOne', 0, () => {
      expect(INITIAL_CONNECT_ID).assertEqual(-1);
      expect(INITIAL_CONNECT_ID).assertLess(0);
      expect(INITIAL_CONNECT_ID + 1).assertEqual(0);
      expect(INITIAL_CONNECT_ID * 2).assertEqual(-2);
      expect(String(INITIAL_CONNECT_ID)).assertEqual('-1');
      expect(INITIAL_CONNECT_ID === -1).assertTrue();
    });

    /**
     * @tc.name          connectIdValidationFreshClientUsesSentinel
     * @tc.desc          A new client starts with the sentinel connect id.
     * @tc.precondition  A fresh ConnectionModel exists.
     * @tc.steps         1. Construct the client.
     *                   2. Read connectId.
     *                   3. Compare with the sentinel.
     * @tc.expected      The client reports -1 before any connect call.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationFreshClientUsesSentinel', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connectId).assertEqual(-1);
      expect(client.connectCalls).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.disconnectRequested()).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationConnectStoresArgument
     * @tc.desc          connect(7) stores seven as the connection id.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Call connect(7).
     *                   2. Read connectId.
     *                   3. Compare with the argument.
     * @tc.expected      The stored id equals seven and the state is connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationConnectStoresArgument', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      logStep('connectIdValidation', 'connect(7)');
      expect(client.connect(7)).assertTrue();
      expect(client.connectId).assertEqual(7);
      expect(client.connectId).assertLarger(0);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(1);
      expect(String(client.connectId)).assertEqual('7');
      expect(client.events.last()).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
    });

    /**
     * @tc.name          connectIdValidationDefaultConnectIsOne
     * @tc.desc          connect() without an argument uses id one.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Call connect with no argument.
     *                   2. Read connectId.
     *                   3. Confirm the default.
     * @tc.expected      The stored id is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationDefaultConnectIsOne', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect()).assertTrue();
      expect(client.connectId).assertEqual(1);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.connectId).assertLarger(INITIAL_CONNECT_ID);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationZeroIsValidId
     * @tc.desc          Zero is a real id and not treated as the sentinel.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Call connect(0).
     *                   2. Request a disconnect.
     *                   3. Read the recorded event.
     * @tc.expected      The id is zero and a disconnect request is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationZeroIsValidId', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(0)).assertTrue();
      expect(client.connectId).assertEqual(0);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.events.last()).assertEqual('disconnect-request:0');
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          connectIdValidationDisconnectBlockedAtSentinel
     * @tc.desc          Disconnect requests are refused while the id is the sentinel.
     * @tc.precondition  A client that never connected exists.
     * @tc.steps         1. Request a disconnect.
     *                   2. Read returned value and logs.
     *                   3. Confirm no event was added.
     * @tc.expected      The request fails and an error log explains why.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationDisconnectBlockedAtSentinel', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.disconnectRequested()).assertFalse();
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.connectId).assertEqual(-1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          connectIdValidationOnDisconnectRestoresSentinel
     * @tc.desc          The disconnect callback resets the id to the sentinel.
     * @tc.precondition  A connected session with id seven exists.
     * @tc.steps         1. Create the session.
     *                   2. Trigger onDisconnect.
     *                   3. Read connectId.
     * @tc.expected      The id returns to minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationOnDisconnectRestoresSentinel', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.connectId).assertEqual(7);
      client.onDisconnect();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connectId).assertEqual(-1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.isDisconnect).assertTrue();
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationOnFailedKeepsId
     * @tc.desc          A failed connection keeps the id that was assigned.
     * @tc.precondition  A client connected with id five exists.
     * @tc.steps         1. Connect with id five.
     *                   2. Fail the connection.
     *                   3. Read connectId.
     * @tc.expected      The id stays five in the failed state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationOnFailedKeepsId', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(5);
      client.onFailed(ERROR_CONNECT);
      expect(client.connectId).assertEqual(5);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:5');
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationResetRestoresSentinel
     * @tc.desc          reset() returns the id to the sentinel and clears counters.
     * @tc.precondition  A client with assigned id twelve exists.
     * @tc.steps         1. Connect with id twelve.
     *                   2. Reset the client.
     *                   3. Read id and call counter.
     * @tc.expected      The id is minus one and the connect counter is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationResetRestoresSentinel', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(12);
      expect(client.connectId).assertEqual(12);
      client.reset();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connectCalls).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(client.disconnectRequested()).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationSkipKeepsFirstId
     * @tc.desc          A rejected second connect never overwrites the first id.
     * @tc.precondition  A client is already connecting with id three.
     * @tc.steps         1. Connect with id three.
     *                   2. Attempt connect with id four.
     *                   3. Read the stored id.
     * @tc.expected      The stored id remains three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSkipKeepsFirstId', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(3)).assertTrue();
      expect(client.connect(4)).assertFalse();
      expect(client.connectId).assertEqual(3);
      expect(client.connectId === 4).assertFalse();
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.contains('connect skipped in state connecting')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          connectIdValidationOnConnectKeepsId
     * @tc.desc          The connection callback does not change the assigned id.
     * @tc.precondition  A client connecting with id twenty-one exists.
     * @tc.steps         1. Connect with id twenty-one.
     *                   2. Deliver a live proxy.
     *                   3. Read the id and state.
     * @tc.expected      The id stays twenty-one in the connected state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationOnConnectKeepsId', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(21);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.connectId).assertEqual(21);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationSixClientsUniqueIds
     * @tc.desc          Six clients connected with distinct ids keep distinct values.
     * @tc.precondition  Six fresh clients are constructed.
     * @tc.steps         1. Connect each client with an increasing id.
     *                   2. Collect the ids as text.
     *                   3. Deduplicate the list.
     * @tc.expected      All six ids remain unique.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSixClientsUniqueIds', 0, () => {
      const ids: string[] = [];
      for (let index = 0; index < 6; index++) {
        const client: ConnectionModel = new ConnectionModel();
        client.connect(100 + index);
        ids.push(String(client.connectId));
      }
      expect(ids.length).assertEqual(6);
      expect(uniqueStrings(ids).length).assertEqual(6);
      expect(ids[0]).assertEqual('100');
      expect(ids[5]).assertEqual('105');
      expect(joined(ids, ',')).assertEqual('100,101,102,103,104,105');
      expect(countOf(ids, '100')).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationLargeIdPreserved
     * @tc.desc          A large but safe integer id survives assignment.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect with a large id.
     *                   2. Read it back.
     *                   3. Request a disconnect.
     * @tc.expected      The id is preserved and a request is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationLargeIdPreserved', 0, () => {
      const large: number = 9007199254740991;
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(large)).assertTrue();
      expect(client.connectId).assertEqual(large);
      expect(client.connectId).assertLarger(1000000);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:' + String(large));
      expect(client.events.last().length).assertLarger(16);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationNegativeTwoIsNotSentinel
     * @tc.desc          Minus two is a normal id because only minus one is reserved.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect with minus two.
     *                   2. Request a disconnect.
     *                   3. Read the event text.
     * @tc.expected      The request is allowed and the id stays minus two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationNegativeTwoIsNotSentinel', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(-2)).assertTrue();
      expect(client.connectId).assertEqual(-2);
      expect(client.connectId).assertLess(0);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:-2');
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          connectIdValidationExplicitSentinelConnect
     * @tc.desc          Connecting with minus one stores it and blocks later requests.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect with minus one.
     *                   2. Request a disconnect.
     *                   3. Read the state.
     * @tc.expected      The request is refused because the id equals the sentinel.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationExplicitSentinelConnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(INITIAL_CONNECT_ID)).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationFractionalIdStored
     * @tc.desc          A fractional number is stored verbatim as the id.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect with two point five.
     *                   2. Read the id.
     *                   3. Request a disconnect.
     * @tc.expected      The fractional id is kept and the request is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationFractionalIdStored', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(2.5)).assertTrue();
      expect(client.connectId).assertEqual(2.5);
      expect(client.connectId).assertLarger(2);
      expect(client.connectId).assertLess(3);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:2.5');
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationTwoDisconnectRequests
     * @tc.desc          Two requests on one id record two events.
     * @tc.precondition  A client connected with id eight exists.
     * @tc.steps         1. Request a disconnect twice.
     *                   2. Count the events.
     *                   3. Compare the last event text.
     * @tc.expected      Both requests succeed and two events are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationTwoDisconnectRequests', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(8);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.countOf('disconnect-request')).assertEqual(2);
      expect(client.events.last()).assertEqual('disconnect-request:8');
      expect(client.events.size()).assertEqual(3);
      expect(client.connectId).assertEqual(8);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          connectIdValidationClampWithinRange
     * @tc.desc          clampInt returns the original value inside the range.
     * @tc.precondition  The clamp helper is imported.
     * @tc.steps         1. Clamp five between zero and ten.
     *                   2. Clamp the boundaries.
     *                   3. Compare results.
     * @tc.expected      Interior values pass through unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationClampWithinRange', 0, () => {
      expect(clampInt(5, 0, 10)).assertEqual(5);
      expect(clampInt(0, 0, 10)).assertEqual(0);
      expect(clampInt(10, 0, 10)).assertEqual(10);
      expect(clampInt(1, 1, 1)).assertEqual(1);
      expect(clampInt(5, 0, 10)).assertLarger(0);
      expect(clampInt(5, 0, 10)).assertLess(11);
      expect(clampInt(7, 7, 9)).assertEqual(7);
    });

    /**
     * @tc.name          connectIdValidationClampBelowAndAbove
     * @tc.desc          Out-of-range values snap to the nearest bound.
     * @tc.precondition  The clamp helper is imported.
     * @tc.steps         1. Clamp a value below the low bound.
     *                   2. Clamp a value above the high bound.
     *                   3. Compare with the bounds.
     * @tc.expected      The results equal the low and high bounds exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectIdValidationClampBelowAndAbove', 0, () => {
      expect(clampInt(-5, 0, 10)).assertEqual(0);
      expect(clampInt(15, 0, 10)).assertEqual(10);
      expect(clampInt(-100, -1, 7)).assertEqual(-1);
      expect(clampInt(50, -1, 7)).assertEqual(7);
      expect(clampInt(400, 100, 200)).assertEqual(200);
      expect(clampInt(400, 100, 200) === 400).assertFalse();
      expect(clampInt(-5, 0, 10) === -5).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationClampAroundRealId
     * @tc.desc          A real id can be bounded into an accepted range.
     * @tc.precondition  A client connected with id one hundred exists.
     * @tc.steps         1. Connect with id one hundred.
     *                   2. Clamp the id into one to ten.
     *                   3. Derive the effective id.
     * @tc.expected      The effective id becomes ten while the stored id stays one hundred.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationClampAroundRealId', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(100);
      const effective: number = clampInt(client.connectId, 1, 10);
      expect(effective).assertEqual(10);
      expect(client.connectId).assertEqual(100);
      expect(effective === client.connectId).assertFalse();
      expect(effective).assertLarger(0);
      expect(effective).assertLess(11);
      expect(clampInt(INITIAL_CONNECT_ID, -1, 10)).assertEqual(-1);
    });

    /**
     * @tc.name          connectIdValidationSequentialArithmetic
     * @tc.desc          Consecutive connects store values that differ by one.
     * @tc.precondition  Three fresh clients are constructed.
     * @tc.steps         1. Connect with ids forty, forty-one, forty-two.
     *                   2. Compute differences.
     *                   3. Compare the stored values.
     * @tc.expected      Each difference is one and the order is ascending.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSequentialArithmetic', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      const third: ConnectionModel = new ConnectionModel();
      first.connect(40);
      second.connect(41);
      third.connect(42);
      expect(second.connectId - first.connectId).assertEqual(1);
      expect(third.connectId - second.connectId).assertEqual(1);
      expect(first.connectId).assertLess(second.connectId);
      expect(second.connectId).assertLess(third.connectId);
      expect(first.connectId + 2).assertEqual(third.connectId);
      expect(third.connectId - first.connectId).assertEqual(2);
    });

    /**
     * @tc.name          connectIdValidationAfterFailedThenReset
     * @tc.desc          A failed id survives until reset clears it.
     * @tc.precondition  A client failed while connected with id six.
     * @tc.steps         1. Connect and fail.
     *                   2. Read the id.
     *                   3. Reset and read again.
     * @tc.expected      The id is six before reset and minus one after.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationAfterFailedThenReset', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(6);
      client.onFailed(16000004);
      expect(client.connectId).assertEqual(6);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      client.reset();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectCalls).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          connectIdValidationSurvivesSend
     * @tc.desc          Sending a request does not modify the connection id.
     * @tc.precondition  A connected session with id seven exists.
     * @tc.steps         1. Capture the id.
     *                   2. Send a payload.
     *                   3. Recapture the id.
     * @tc.expected      The id is unchanged after the send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSurvivesSend', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const before: number = client.connectId;
      expect(client.sendString().isSuccess()).assertTrue();
      expect(client.connectId).assertEqual(before);
      expect(client.connectId).assertEqual(7);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.connectCalls).assertEqual(1);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          connectIdValidationEventKindOrder
     * @tc.desc          Disconnect requests appear after the initial connect event.
     * @tc.precondition  A client connected with id nine exists.
     * @tc.steps         1. Connect and request a disconnect twice.
     *                   2. Read the event trace.
     *                   3. Check ordering of kinds.
     * @tc.expected      The trace is connect then two disconnect requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationEventKindOrder', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(9);
      client.disconnectRequested();
      client.disconnectRequested();
      const trace: string = client.events.trace();
      expect(client.events.size()).assertEqual(3);
      expect(trace.startsWith('connect:')).assertTrue();
      expect(trace.endsWith('disconnect-request:9|disconnect-request:9')).assertTrue();
      expect(trace.split('|').length).assertEqual(3);
      expect(trace.split('|')[1]).assertEqual('disconnect-request:9');
      expect(trace.indexOf('connect:')).assertLess(trace.indexOf('disconnect-request:'));
      expect(countOf(trace.split('|'), 'disconnect-request:9')).assertEqual(2);
    });

    /**
     * @tc.name          connectIdValidationIdTextFingerprints
     * @tc.desc          Distinct ids produce distinct text fingerprints.
     * @tc.precondition  A list of ids is available.
     * @tc.steps         1. Convert five ids to text.
     *                   2. Hash each text.
     *                   3. Deduplicate the hashes.
     * @tc.expected      All five hashes are unique.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationIdTextFingerprints', 0, () => {
      const hashes: string[] = [];
      for (let index = 0; index < 5; index++) {
        const client: ConnectionModel = new ConnectionModel();
        client.connect(index);
        hashes.push(String(textFingerprint(String(client.connectId))));
      }
      expect(hashes.length).assertEqual(5);
      expect(uniqueStrings(hashes).length).assertEqual(5);
      expect(textFingerprint(String(INITIAL_CONNECT_ID))).assertEqual(textFingerprint('-1'));
      expect(textFingerprint('0') === textFingerprint('-1')).assertFalse();
      expect(hashes[0]).assertEqual(String(textFingerprint('0')));
      expect(hashes[4]).assertEqual(String(textFingerprint('4')));
    });

    /**
     * @tc.name          connectIdValidationReconnectAfterDisconnect
     * @tc.desc          A disconnected client accepts a brand new id.
     * @tc.precondition  A session was disconnected.
     * @tc.steps         1. Create and disconnect a session.
     *                   2. Connect with id forty-four.
     *                   3. Read the new id.
     * @tc.expected      The new id replaces the sentinel cleanly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationReconnectAfterDisconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.connect(44)).assertTrue();
      expect(client.connectId).assertEqual(44);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.isDisconnect).assertTrue();
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          connectIdValidationRequestBeforeAndAfterConnect
     * @tc.desc          The sentinel blocks the first request and the id allows the next.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Request a disconnect while disconnected.
     *                   2. Connect with id seventeen.
     *                   3. Request a disconnect again.
     * @tc.expected      The first request fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationRequestBeforeAndAfterConnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.disconnectRequested()).assertFalse();
      client.connect(17);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.connectId).assertEqual(17);
      expect(client.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          connectIdValidationDistinctAcrossResetCycles
     * @tc.desc          Each reset cycle assigns a fresh id value.
     * @tc.precondition  One client is reused across three cycles.
     * @tc.steps         1. Connect and reset three times with different ids.
     *                   2. Record each id.
     *                   3. Deduplicate the recorded list.
     * @tc.expected      Three distinct ids were observed across the cycles.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationDistinctAcrossResetCycles', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const seen: string[] = [];
      client.connect(31);
      seen.push(String(client.connectId));
      client.reset();
      client.connect(32);
      seen.push(String(client.connectId));
      client.reset();
      client.connect(33);
      seen.push(String(client.connectId));
      expect(seen.length).assertEqual(3);
      expect(uniqueStrings(seen).length).assertEqual(3);
      expect(joined(seen, '/')).assertEqual('31/32/33');
      expect(client.connectId).assertEqual(33);
      expect(client.connectCalls).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          connectIdValidationEventFingerprintTracksId
     * @tc.desc          Changing the id changes the event fingerprint.
     * @tc.precondition  Two clients connect with different ids.
     * @tc.steps         1. Connect each with a distinct id.
     *                   2. Hash the event traces.
     *                   3. Compare the hashes.
     * @tc.expected      The fingerprints differ because the id changes no connect text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationEventFingerprintTracksId', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      first.connect(1);
      second.connect(2);
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      first.disconnectRequested();
      second.disconnectRequested();
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.events.countOf('disconnect-request')).assertEqual(1);
      expect(first.events.last()).assertEqual('disconnect-request:1');
      expect(second.events.last()).assertEqual('disconnect-request:2');
      expect(first.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          connectIdValidationTwentyClientsUnique
     * @tc.desc          Twenty clients produce twenty unique ids.
     * @tc.precondition  Twenty clients are constructed in a loop.
     * @tc.steps         1. Connect each client with a unique id.
     *                   2. Collect and deduplicate the ids.
     *                   3. Check the first and last values.
     * @tc.expected      All twenty ids are unique and ascending.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationTwentyClientsUnique', 0, () => {
      const ids: string[] = [];
      for (let index = 0; index < 20; index++) {
        const client: ConnectionModel = new ConnectionModel();
        client.connect(500 + index);
        ids.push(String(client.connectId));
      }
      expect(ids.length).assertEqual(20);
      expect(uniqueStrings(ids).length).assertEqual(20);
      expect(ids[0]).assertEqual('500');
      expect(ids[19]).assertEqual('519');
      expect(Number(ids[19]) - Number(ids[0])).assertEqual(19);
      expect(ids.indexOf('505')).assertEqual(5);
    });

    /**
     * @tc.name          connectIdValidationDefaultVersusExplicitOne
     * @tc.desc          The default connect and an explicit one assign the same id.
     * @tc.precondition  Two fresh clients exist.
     * @tc.steps         1. Call connect on each.
     *                   2. Compare the ids.
     *                   3. Compare event traces.
     * @tc.expected      Both ids are one and traces match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationDefaultVersusExplicitOne', 0, () => {
      const implicit: ConnectionModel = new ConnectionModel();
      const explicit: ConnectionModel = new ConnectionModel();
      implicit.connect();
      explicit.connect(1);
      expect(implicit.connectId).assertEqual(explicit.connectId);
      expect(implicit.connectId).assertEqual(1);
      expect(explicit.connectId).assertEqual(1);
      expect(implicit.events.trace()).assertEqual(explicit.events.trace());
      expect(implicit.events.fingerprint()).assertEqual(explicit.events.fingerprint());
      expect(implicit.state).assertEqual(explicit.state);
      expect(implicit.connectCalls).assertEqual(explicit.connectCalls);
    });

    /**
     * @tc.name          connectIdValidationNoErrorLogWithValidId
     * @tc.desc          A valid id never produces the missing-id error log.
     * @tc.precondition  A client connected with id twenty exists.
     * @tc.steps         1. Connect with a valid id.
     *                   2. Request a disconnect.
     *                   3. Scan the logs.
     * @tc.expected      The missing-id message is absent and no error is logged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationNoErrorLogWithValidId', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(20);
      client.disconnectRequested();
      expect(client.logs.contains('disconnect without connectId')).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(client.connectId).assertEqual(20);
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationIdKeptWhenProxyDies
     * @tc.desc          A remote death leaves the assigned id in place.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Create the session.
     *                   2. Notify proxy death.
     *                   3. Read the id.
     * @tc.expected      The id stays seven even though the proxy is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationIdKeptWhenProxyDies', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.proxy?.notifyDeath();
      expect(client.connectId).assertEqual(7);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:7');
    });

    /**
     * @tc.name          connectIdValidationRequestDoesNotAlterState
     * @tc.desc          A disconnect request alone never changes the state or toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Capture the state and toast count.
     *                   2. Request a disconnect.
     *                   3. Recapture both.
     * @tc.expected      Both values are unchanged by the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationRequestDoesNotAlterState', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const stateBefore: string = client.state;
      const toastsBefore: number = client.toasts.length;
      expect(client.disconnectRequested()).assertTrue();
      expect(client.state).assertEqual(stateBefore);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.toasts.length).assertEqual(toastsBefore);
      expect(client.lastToast()).assertEqual('connectAbility success');
      expect(client.isConnected()).assertTrue();
      expect(client.connectId).assertEqual(7);
    });

    /**
     * @tc.name          connectIdValidationIdIndexInEventDetail
     * @tc.desc          The event detail after the colon is the decimal id text.
     * @tc.precondition  A client connected with id twelve exists.
     * @tc.steps         1. Connect and request a disconnect.
     *                   2. Split the last event on the colon.
     *                   3. Compare the detail with the id text.
     * @tc.expected      The detail equals twelve in decimal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationIdIndexInEventDetail', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(12);
      client.disconnectRequested();
      const last: string = client.events.last();
      const parts: string[] = last.split(':');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual('disconnect-request');
      expect(parts[1]).assertEqual('12');
      expect(parts[1]).assertEqual(String(client.connectId));
      expect(last.indexOf(':')).assertLarger(0);
      expect(last.length).assertEqual('disconnect-request:12'.length);
      expect(client.events.entries.length).assertEqual(2);
    });

    /**
     * @tc.name          connectIdValidationResetAfterDisconnect
     * @tc.desc          Reset after a disconnect keeps the sentinel id.
     * @tc.precondition  A session was disconnected.
     * @tc.steps         1. Create and disconnect a session.
     *                   2. Reset.
     *                   3. Read the id and isDisconnect.
     * @tc.expected      The id stays minus one and the disconnect flag clears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationResetAfterDisconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      client.reset();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertFalse();
      expect(client.connectCalls).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.toasts.length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          connectIdValidationSnapshotCapturesId
     * @tc.desc          A client snapshot exposes the current connection id.
     * @tc.precondition  A client connected with id fifty-five exists.
     * @tc.steps         1. Connect with id fifty-five.
     *                   2. Build a ClientSnapshot.
     *                   3. Read the snapshot id.
     * @tc.expected      The snapshot id equals fifty-five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSnapshotCapturesId', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(55);
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.connectId).assertEqual(55);
      expect(snapshot.connectId).assertEqual(client.connectId);
      expect(snapshot.state).assertEqual(STATE_CONNECTING);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.describe().indexOf('55')).assertLarger(0);
      expect(snapshot.describe().split('/')[1]).assertEqual('55');
    });

    /**
     * @tc.name          connectIdValidationSnapshotsMatchForSameId
     * @tc.desc          Snapshots of equally built clients are identical.
     * @tc.precondition  Two clients connect with the same id.
     * @tc.steps         1. Connect both with id nineteen.
     *                   2. Snapshot both.
     *                   3. Compare equality and describe text.
     * @tc.expected      The snapshots are equal and describe identically.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSnapshotsMatchForSameId', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      first.connect(19);
      second.connect(19);
      const left: ClientSnapshot = new ClientSnapshot(first);
      const right: ClientSnapshot = new ClientSnapshot(second);
      expect(left.sameAs(right)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(left.connectId).assertEqual(right.connectId);
      expect(left.describe().startsWith('connecting/19/')).assertTrue();
      expect(left.toastCount).assertEqual(0);
      expect(left.deathRegistered).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationSnapshotsDifferForIds
     * @tc.desc          Snapshots with different ids never compare equal.
     * @tc.precondition  Two clients connect with distinct ids.
     * @tc.steps         1. Connect with ids ten and eleven.
     *                   2. Snapshot and compare.
     *                   3. Check the describe difference.
     * @tc.expected      The snapshots differ and the id text differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSnapshotsDifferForIds', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      first.connect(10);
      second.connect(11);
      const left: ClientSnapshot = new ClientSnapshot(first);
      const right: ClientSnapshot = new ClientSnapshot(second);
      expect(left.sameAs(right)).assertFalse();
      expect(left.connectId === right.connectId).assertFalse();
      expect(left.describe() === right.describe()).assertFalse();
      expect(left.describe().indexOf('/10/')).assertLarger(0);
      expect(right.describe().indexOf('/11/')).assertLarger(0);
      expect(left.state).assertEqual(right.state);
      expect(left.toastCount).assertEqual(right.toastCount);
    });

    /**
     * @tc.name          connectIdValidationSnapshotAfterDisconnect
     * @tc.desc          A snapshot after disconnect reports the sentinel id.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Snapshot before disconnect.
     *                   2. Disconnect and snapshot again.
     *                   3. Compare both snapshots.
     * @tc.expected      The new snapshot id is minus one and differs from the old one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSnapshotAfterDisconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.onDisconnect();
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(before.connectId).assertEqual(7);
      expect(after.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(after.connectId).assertEqual(-1);
      expect(before.sameAs(after)).assertFalse();
      expect(after.hasProxy).assertFalse();
      expect(after.deathRegistered).assertFalse();
      expect(after.describe().startsWith('disconnected/-1/')).assertTrue();
    });

    /**
     * @tc.name          connectIdValidationFailedSendKeepsId
     * @tc.desc          A send failure does not disturb the connection id.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force a send failure.
     *                   2. Read the id.
     *                   3. Request a disconnect.
     * @tc.expected      The id remains seven and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationFailedSendKeepsId', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = 16000003;
      }
      expect(client.sendString().errCode).assertEqual(16000003);
      expect(client.connectId).assertEqual(7);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:7');
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          connectIdValidationSentinelDuplicatesAllowed
     * @tc.desc          Two disconnected clients share the sentinel value.
     * @tc.precondition  Two fresh clients exist.
     * @tc.steps         1. Connect neither client.
     *                   2. Collect the ids.
     *                   3. Deduplicate the list.
     * @tc.expected      Both report minus one and deduplicate to one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSentinelDuplicatesAllowed', 0, () => {
      const first: ConnectionModel = new ConnectionModel();
      const second: ConnectionModel = new ConnectionModel();
      const ids: string[] = [String(first.connectId), String(second.connectId)];
      expect(first.connectId).assertEqual(second.connectId);
      expect(ids.length).assertEqual(2);
      expect(uniqueStrings(ids).length).assertEqual(1);
      expect(joined(ids, ',')).assertEqual('-1,-1');
      expect(countOf(ids, '-1')).assertEqual(2);
      expect(first.connectCalls).assertEqual(0);
      expect(second.disconnectRequested()).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationZeroAndOneDiffer
     * @tc.desc          Id zero and id one are treated as different connections.
     * @tc.precondition  Two clients connect with zero and one.
     * @tc.steps         1. Connect each client.
     *                   2. Compare ids and event details.
     *                   3. Check both request paths.
     * @tc.expected      The ids differ and both allow disconnect requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationZeroAndOneDiffer', 0, () => {
      const zero: ConnectionModel = new ConnectionModel();
      const one: ConnectionModel = new ConnectionModel();
      zero.connect(0);
      one.connect(1);
      expect(zero.connectId).assertEqual(0);
      expect(one.connectId).assertEqual(1);
      expect(zero.connectId === one.connectId).assertFalse();
      expect(zero.disconnectRequested()).assertTrue();
      expect(one.disconnectRequested()).assertTrue();
      expect(zero.events.last()).assertEqual('disconnect-request:0');
      expect(one.events.last()).assertEqual('disconnect-request:1');
    });

    /**
     * @tc.name          connectIdValidationIdTextLength
     * @tc.desc          The id text length grows with the magnitude.
     * @tc.precondition  Several ids of different magnitudes exist.
     * @tc.steps         1. Convert ids to text.
     *                   2. Compare lengths.
     *                   3. Confirm the sentinel has length two.
     * @tc.expected      Larger magnitudes have longer text representations.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationIdTextLength', 0, () => {
      expect(String(5).length).assertEqual(1);
      expect(String(50).length).assertEqual(2);
      expect(String(500).length).assertEqual(3);
      expect(String(5000).length).assertEqual(4);
      expect(String(INITIAL_CONNECT_ID).length).assertEqual(2);
      expect(String(INITIAL_CONNECT_ID).charAt(0)).assertEqual('-');
      expect(String(0).length).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationNoEventWhenBlocked
     * @tc.desc          Blocked requests never add disconnect-request events.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Call disconnectRequested twice.
     *                   2. Count the events.
     *                   3. Count the error logs.
     * @tc.expected      No events exist and two error logs are written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationNoEventWhenBlocked', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.disconnectRequested()).assertFalse();
      expect(client.disconnectRequested()).assertFalse();
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
      expect(client.logs.size()).assertEqual(2);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          connectIdValidationThreeDisconnectsAllSentinel
     * @tc.desc          Three clients share the sentinel only after disconnecting.
     * @tc.precondition  Three connected clients exist.
     * @tc.steps         1. Disconnect each client.
     *                   2. Collect their ids.
     *                   3. Deduplicate the list.
     * @tc.expected      Every id is minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationThreeDisconnectsAllSentinel', 0, () => {
      const first: ConnectionModel = createConnectedSession();
      const second: ConnectionModel = createConnectedSession();
      const third: ConnectionModel = createConnectedSession();
      first.onDisconnect();
      second.onDisconnect();
      third.onDisconnect();
      const ids: string[] = [String(first.connectId), String(second.connectId), String(third.connectId)];
      expect(uniqueStrings(ids).length).assertEqual(1);
      expect(ids[0]).assertEqual('-1');
      expect(ids[1]).assertEqual('-1');
      expect(ids[2]).assertEqual('-1');
      expect(first.logs.contains('onDisconnect')).assertTrue();
      expect(second.events.countOf('disconnected')).assertEqual(1);
      expect(third.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          connectIdValidationBlockedAgainAfterDisconnect
     * @tc.desc          A disconnect request is blocked again after the sentinel returns.
     * @tc.precondition  A session was disconnected.
     * @tc.steps         1. Disconnect the session.
     *                   2. Request a disconnect.
     *                   3. Count the error logs.
     * @tc.expected      The request is refused and an error log appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationBlockedAgainAfterDisconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.disconnectRequested()).assertFalse();
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationClampWithSentinelBounds
     * @tc.desc          Clamping around the sentinel respects it as a lower bound.
     * @tc.precondition  The clamp helper is imported.
     * @tc.steps         1. Clamp values between minus one and five.
     *                   2. Check the sentinel boundary.
     *                   3. Compare with the high bound.
     * @tc.expected      Values below minus one snap to minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationClampWithSentinelBounds', 0, () => {
      expect(clampInt(-9, INITIAL_CONNECT_ID, 5)).assertEqual(-1);
      expect(clampInt(-1, INITIAL_CONNECT_ID, 5)).assertEqual(-1);
      expect(clampInt(0, INITIAL_CONNECT_ID, 5)).assertEqual(0);
      expect(clampInt(9, INITIAL_CONNECT_ID, 5)).assertEqual(5);
      expect(clampInt(-9, INITIAL_CONNECT_ID, 5) === INITIAL_CONNECT_ID).assertTrue();
      expect(clampInt(9, INITIAL_CONNECT_ID, 5)).assertLarger(INITIAL_CONNECT_ID);
      expect(clampInt(2, INITIAL_CONNECT_ID, 5)).assertEqual(2);
    });

    /**
     * @tc.name          connectIdValidationDeadProxyOnConnect
     * @tc.desc          A killed proxy still leaves the id assigned after onConnect.
     * @tc.precondition  A client is connecting with a killed proxy.
     * @tc.steps         1. Connect with id twenty-two.
     *                   2. Kill the proxy and call onConnect.
     *                   3. Read the id.
     * @tc.expected      The id stays twenty-two even though registration failed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationDeadProxyOnConnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(22);
      client.onConnect(proxy);
      expect(client.connectId).assertEqual(22);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:22');
    });

    /**
     * @tc.name          connectIdValidationBlockedAfterReset
     * @tc.desc          A reset client refuses disconnect requests again.
     * @tc.precondition  A used client was reset.
     * @tc.steps         1. Connect, request and reset.
     *                   2. Request a disconnect.
     *                   3. Count the logs.
     * @tc.expected      The post-reset request is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationBlockedAfterReset', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(15);
      expect(client.disconnectRequested()).assertTrue();
      client.reset();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.connectCalls).assertEqual(0);
    });

    /**
     * @tc.name          connectIdValidationEightCyclesCounts
     * @tc.desc          Eight connect cycles reuse one client and keep one event each.
     * @tc.precondition  A single client is reused.
     * @tc.steps         1. Run eight connect and reset cycles.
     *                   2. Record the last id.
     *                   3. Check the event count per cycle.
     * @tc.expected      The last id is eight and each cycle starts clean.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationEightCyclesCounts', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      for (let index = 0; index < 8; index++) {
        client.connect(index + 1);
        expect(client.events.size()).assertEqual(1);
        expect(client.connectId).assertEqual(index + 1);
        client.reset();
      }
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.events.size()).assertEqual(0);
      client.connect(8);
      expect(client.connectId).assertEqual(8);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationSnapshotAfterSend
     * @tc.desc          Snapshots after a send keep the id and grow the toast count.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Snapshot before sending.
     *                   2. Send once.
     *                   3. Snapshot again.
     * @tc.expected      The id is unchanged and the toast count increased.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationSnapshotAfterSend', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.sendString();
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(before.connectId).assertEqual(7);
      expect(after.connectId).assertEqual(7);
      expect(after.toastCount).assertEqual(before.toastCount + 1);
      expect(before.sameAs(after)).assertFalse();
      expect(after.deathRegistered).assertTrue();
      expect(after.hasProxy).assertTrue();
      expect(after.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          connectIdValidationIdDeltaConstant
     * @tc.desc          Two ids chosen apart differ by a known constant.
     * @tc.precondition  Two clients connect with ids thirty and seventy.
     * @tc.steps         1. Connect both clients.
     *                   2. Subtract the ids.
     *                   3. Compare with the constant forty.
     * @tc.expected      The difference is exactly forty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationIdDeltaConstant', 0, () => {
      const low: ConnectionModel = new ConnectionModel();
      const high: ConnectionModel = new ConnectionModel();
      low.connect(30);
      high.connect(70);
      expect(high.connectId - low.connectId).assertEqual(40);
      expect(low.connectId).assertEqual(30);
      expect(high.connectId).assertEqual(70);
      expect(low.connectId).assertLess(high.connectId);
      expect(low.connectId + 40).assertEqual(high.connectId);
      expect(high.connectId / low.connectId).assertLarger(2);
    });

    /**
     * @tc.name          connectIdValidationIdWithInvalidWant
     * @tc.desc          The id is stored even when the want fails validation.
     * @tc.precondition  A client with an empty bundle want exists.
     * @tc.steps         1. Build the invalid want client.
     *                   2. Connect with id forty-eight.
     *                   3. Read the id and want errors.
     * @tc.expected      The id is forty-eight and the want reports one error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationIdWithInvalidWant', 0, () => {
      const client: ConnectionModel = new ConnectionModel(new WantModel('', 'ServiceAbility'));
      client.connect(48);
      expect(client.connectId).assertEqual(48);
      expect(client.want.validate().length).assertEqual(1);
      expect(client.want.validate()[0]).assertEqual('bundle-empty');
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.events.last()).assertEqual('connect:/ServiceAbility');
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:48');
    });

    /**
     * @tc.name          connectIdValidationCallsCountWithSkips
     * @tc.desc          Skipped connects still increment the call counter only.
     * @tc.precondition  A client is connecting with id two.
     * @tc.steps         1. Connect with id two.
     *                   2. Attempt three more connects.
     *                   3. Compare calls and events.
     * @tc.expected      Four calls are counted but only one event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationCallsCountWithSkips', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(2);
      client.connect(3);
      client.connect(4);
      client.connect(5);
      expect(client.connectCalls).assertEqual(4);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.connectId).assertEqual(2);
      expect(client.logs.countLevel('WARN')).assertEqual(3);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          connectIdValidationSentinelFingerprintDistinct
     * @tc.desc          The sentinel text hashes differently from positive ids.
     * @tc.precondition  The fingerprint helper is imported.
     * @tc.steps         1. Hash the sentinel text.
     *                   2. Hash the texts zero and one.
     *                   3. Compare all three.
     * @tc.expected      The three hashes are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationSentinelFingerprintDistinct', 0, () => {
      const sentinel: number = textFingerprint(String(INITIAL_CONNECT_ID));
      const zero: number = textFingerprint('0');
      const one: number = textFingerprint('1');
      expect(sentinel === zero).assertFalse();
      expect(sentinel === one).assertFalse();
      expect(zero === one).assertFalse();
      expect(sentinel).assertLarger(0);
      expect(uniqueStrings([String(sentinel), String(zero), String(one)]).length).assertEqual(3);
      expect(sentinel).assertEqual(textFingerprint('-1'));
    });

    /**
     * @tc.name          connectIdValidationFailedThenDisconnectSentinel
     * @tc.desc          Disconnecting a failed client restores the sentinel.
     * @tc.precondition  A client failed with id sixty exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Disconnect.
     *                   3. Read the id.
     * @tc.expected      The id is minus one after the disconnect callback.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationFailedThenDisconnectSentinel', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(60);
      client.onFailed(16000001);
      expect(client.connectId).assertEqual(60);
      client.onDisconnect();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          connectIdValidationIntMaxId
     * @tc.desc          The largest signed 32-bit integer is accepted as an id.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect with the integer maximum.
     *                   2. Read the id back.
     *                   3. Request a disconnect.
     * @tc.expected      The id is preserved and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationIntMaxId', 0, () => {
      const maximum: number = 2147483647;
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(maximum)).assertTrue();
      expect(client.connectId).assertEqual(maximum);
      expect(client.connectId).assertLarger(2147483646);
      expect(String(client.connectId)).assertEqual('2147483647');
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:2147483647');
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
    });

    /**
     * @tc.name          connectIdValidationTwelveClientIdMap
     * @tc.desc          Twelve clients expose ids forming a contiguous range.
     * @tc.precondition  Twelve clients are constructed.
     * @tc.steps         1. Connect ids from two hundred upward.
     *                   2. Check the range arithmetic.
     *                   3. Verify index lookups.
     * @tc.expected      The ids span two hundred to two hundred eleven.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationTwelveClientIdMap', 0, () => {
      const ids: number[] = [];
      for (let index = 0; index < 12; index++) {
        const client: ConnectionModel = new ConnectionModel();
        client.connect(200 + index);
        ids.push(client.connectId);
      }
      expect(ids.length).assertEqual(12);
      expect(ids[0]).assertEqual(200);
      expect(ids[11]).assertEqual(211);
      expect(ids[11] - ids[0]).assertEqual(11);
      expect(ids[5]).assertEqual(205);
      expect(ids.indexOf(207)).assertEqual(7);
      expect(ids[11] - ids[0]).assertEqual(11);
    });
    /**
     * @tc.name          connectIdValidationSnapshotResetEquality
     * @tc.desc          A reset client snapshot matches a brand new client snapshot.
     * @tc.precondition  A used client was reset.
     * @tc.steps         1. Reset the used client.
     *                   2. Snapshot it and a fresh client.
     *                   3. Compare the two.
     * @tc.expected      Both snapshots are equal after the reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectIdValidationSnapshotResetEquality', 0, () => {
      const used: ConnectionModel = createConnectedSession();
      used.reset();
      const fresh: ConnectionModel = new ConnectionModel();
      const left: ClientSnapshot = new ClientSnapshot(used);
      const right: ClientSnapshot = new ClientSnapshot(fresh);
      expect(left.sameAs(right)).assertTrue();
      expect(left.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(left.describe()).assertEqual(right.describe());
      expect(left.toastCount).assertEqual(0);
      expect(left.state).assertEqual(STATE_DISCONNECTED);
      expect(left.deathRegistered).assertFalse();
      expect(left.describe()).assertEqual('disconnected/-1/false/false/0');
    });

    /**
     * @tc.name          connectIdValidationIdAfterBlockedThenConnect
     * @tc.desc          A blocked request before connect does not poison the next id.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Request a disconnect while blocked.
     *                   2. Connect with id eighty.
     *                   3. Request again.
     * @tc.expected      The second request records id eighty cleanly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectIdValidationIdAfterBlockedThenConnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.disconnectRequested()).assertFalse();
      client.connect(80);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.size()).assertEqual(2);
      expect(client.events.entries[1]).assertEqual('disconnect-request:80');
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(client.connectId).assertEqual(80);
      expect(client.state).assertEqual(STATE_CONNECTING);
    });
  });
}
