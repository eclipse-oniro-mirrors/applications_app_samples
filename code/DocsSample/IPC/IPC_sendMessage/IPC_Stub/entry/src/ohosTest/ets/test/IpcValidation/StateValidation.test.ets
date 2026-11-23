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
  EVENT_ON_CREATE,
  EVENT_ON_CONNECT,
  EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint,
  clampInt,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubRemoteObjectModel,
  InProcessClient
} from '../Shared/SharedDriver';

const STATE_IDLE: string = 'idle';
const STATE_CREATED: string = 'created';
const STATE_CONNECTED: string = 'connected';
const STATE_DISCONNECTED: string = 'disconnected';
const STATE_DESTROYED: string = 'destroyed';

const KNOWN_STATES: string[] = [
  STATE_IDLE,
  STATE_CREATED,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  STATE_DESTROYED
];

/** Returns the documented ordinal of a lifecycle state. */
function stateRank(state: string): number {
  if (state === STATE_IDLE) {
    return 0;
  }
  if (state === STATE_CREATED) {
    return 1;
  }
  if (state === STATE_CONNECTED) {
    return 2;
  }
  if (state === STATE_DISCONNECTED) {
    return 3;
  }
  if (state === STATE_DESTROYED) {
    return 4;
  }
  return -1;
}

/** Only destroyed is terminal for the documented service. */
function isTerminal(state: string): boolean {
  return state === STATE_DESTROYED;
}

function isKnownState(state: string): boolean {
  return KNOWN_STATES.indexOf(state) >= 0;
}

function stateLabel(service: ServiceLifecycleModel): string {
  return service.state + '#' + String(service.isAlive()) + '#' + String(service.connectCount);
}

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
     * @tc.name          stateValidationInitialIdle
     * @tc.desc          A new lifecycle model starts in the idle state.
     * @tc.precondition  The lifecycle model is available.
     * @tc.steps         1. Construct the model.
     *                   2. Read the state.
     *                   3. Check aliveness and counters.
     * @tc.expected      The state is idle with every counter at zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationInitialIdle', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      logStep('stateValidationInitialIdle', stateLabel(service));
      expect(service.state).assertEqual(STATE_IDLE);
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(stateRank(service.state)).assertEqual(0);
    });

    /**
     * @tc.name          stateValidationCreatedAfterOnCreate
     * @tc.desc          onCreate moves the model to the created state.
     * @tc.precondition  A fresh lifecycle model exists.
     * @tc.steps         1. Call onCreate.
     *                   2. Read the state.
     *                   3. Inspect the event recorder.
     * @tc.expected      The state becomes created and one event is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationCreatedAfterOnCreate', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      logStep('stateValidationCreatedAfterOnCreate', service.state);
      expect(service.state).assertEqual(STATE_CREATED);
      expect(service.state).assertEqual('created');
      expect(service.events.size()).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.isAlive()).assertTrue();
      expect(stateRank(service.state)).assertEqual(1);
      expect(isTerminal(service.state)).assertFalse();
    });

    /**
     * @tc.name          stateValidationConnectedAfterOnConnect
     * @tc.desc          onConnect moves the model to the connected state.
     * @tc.precondition  A created lifecycle model exists.
     * @tc.steps         1. Create and connect.
     *                   2. Read the state.
     *                   3. Inspect the stub and counters.
     * @tc.expected      The state becomes connected with one stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationConnectedAfterOnConnect', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const stub: StubRemoteObjectModel = service.onConnect();
      logStep('stateValidationConnectedAfterOnConnect', stateLabel(service));
      expect(service.state).assertEqual(STATE_CONNECTED);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(service.stub === stub).assertTrue();
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(stateRank(service.state)).assertEqual(2);
      expect(service.isAlive()).assertTrue();
      expect(service.logs.contains('onConnect')).assertTrue();
    });

    /**
     * @tc.name          stateValidationDisconnectedAfterOnDisconnect
     * @tc.desc          onDisconnect moves the model to the disconnected state.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Connect then disconnect.
     *                   2. Read the state.
     *                   3. Inspect the counters.
     * @tc.expected      The state becomes disconnected with one disconnect counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationDisconnectedAfterOnDisconnect', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      logStep('stateValidationDisconnectedAfterOnDisconnect', service.state);
      expect(service.state).assertEqual(STATE_DISCONNECTED);
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(stateRank(service.state)).assertEqual(3);
      expect(isTerminal(service.state)).assertFalse();
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          stateValidationDestroyedAfterOnDestroy
     * @tc.desc          onDestroy moves the model to the destroyed state.
     * @tc.precondition  A created lifecycle model exists.
     * @tc.steps         1. Create then destroy.
     *                   2. Read the state.
     *                   3. Check terminal and aliveness.
     * @tc.expected      The state becomes destroyed and isAlive turns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationDestroyedAfterOnDestroy', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      logStep('stateValidationDestroyedAfterOnDestroy', stateLabel(service));
      expect(service.state).assertEqual(STATE_DESTROYED);
      expect(service.state).assertEqual('destroyed');
      expect(service.destroyCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(isTerminal(service.state)).assertTrue();
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(stateRank(service.state)).assertEqual(4);
      expect(service.events.size()).assertEqual(2);
      expect(service.logs.contains('onDestroy')).assertTrue();
    });

    /**
     * @tc.name          stateValidationDirectConnectFromIdle
     * @tc.desc          onConnect works without a prior onCreate call.
     * @tc.precondition  A fresh lifecycle model exists.
     * @tc.steps         1. Connect immediately.
     *                   2. Read the state.
     *                   3. Confirm the connect event count.
     * @tc.expected      The model reaches connected from idle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDirectConnectFromIdle', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onConnect();
      logStep('stateValidationDirectConnectFromIdle', service.state);
      expect(service.state).assertEqual(STATE_CONNECTED);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.events.last()).assertEqual(EVENT_ON_CONNECT + ':IPCStubTest');
      expect(service.isAlive()).assertTrue();
      expect(stateRank(service.state)).assertEqual(2);
      expect(service.stub?.descriptor).assertEqual('IPCStubTest');
    });

    /**
     * @tc.name          stateValidationRepeatedConnectStaysConnected
     * @tc.desc          Repeated onConnect calls keep the connected state.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Connect three times.
     *                   2. Read the state.
     *                   3. Compare the connect counter.
     * @tc.expected      The state stays connected with three connects recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationRepeatedConnectStaysConnected', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onConnect();
      service.onConnect();
      service.onConnect();
      logStep('stateValidationRepeatedConnectStaysConnected', stateLabel(service));
      expect(service.state).assertEqual(STATE_CONNECTED);
      expect(service.connectCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.isAlive()).assertTrue();
      expect(countOf(service.events.entries, EVENT_ON_CONNECT + ':IPCStubTest')).assertEqual(3);
      expect(uniqueStrings(service.events.entries).length).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationDisconnectWithoutConnect
     * @tc.desc          onDisconnect from idle still records a disconnect.
     * @tc.precondition  A fresh lifecycle model exists.
     * @tc.steps         1. Disconnect immediately.
     *                   2. Read the state.
     *                   3. Compare the counters.
     * @tc.expected      The state becomes disconnected with zero connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDisconnectWithoutConnect', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onDisconnect();
      logStep('stateValidationDisconnectWithoutConnect', service.state);
      expect(service.state).assertEqual(STATE_DISCONNECTED);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.isAlive()).assertTrue();
      expect(stateRank(service.state)).assertEqual(3);
    });

    /**
     * @tc.name          stateValidationDestroyTwice
     * @tc.desc          Destroying twice increments the counter twice.
     * @tc.precondition  A destroyed lifecycle model exists.
     * @tc.steps         1. Destroy once.
     *                   2. Destroy again.
     *                   3. Compare the state and count.
     * @tc.expected      The state stays destroyed and the counter reaches two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDestroyTwice', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      service.onDestroy();
      logStep('stateValidationDestroyTwice', String(service.destroyCount));
      expect(service.state).assertEqual(STATE_DESTROYED);
      expect(service.destroyCount).assertEqual(2);
      expect(service.isAlive()).assertFalse();
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(2);
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.countLevel('INFO')).assertEqual(3);
      expect(isTerminal(service.state)).assertTrue();
      expect(stateRank(service.state)).assertEqual(4);
    });

    /**
     * @tc.name          stateValidationConnectRevivesDestroyed
     * @tc.desc          A connect after destroy returns the model to connected.
     * @tc.precondition  A destroyed lifecycle model exists.
     * @tc.steps         1. Destroy the model.
     *                   2. Connect again.
     *                   3. Compare the states.
     * @tc.expected      The state changes from destroyed to connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectRevivesDestroyed', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      const destroyedState: string = service.state;
      const destroyedAlive: boolean = service.isAlive();
      service.onConnect();
      logStep('stateValidationConnectRevivesDestroyed', service.state);
      expect(destroyedState).assertEqual(STATE_DESTROYED);
      expect(destroyedAlive).assertFalse();
      expect(service.state).assertEqual(STATE_CONNECTED);
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.stub?.descriptor).assertEqual('IPCStubTest');
      expect(service.events.last()).assertEqual(EVENT_ON_CONNECT + ':IPCStubTest');
    });

    /**
     * @tc.name          stateValidationResetFromDestroyed
     * @tc.desc          reset returns a destroyed model to the idle state.
     * @tc.precondition  A destroyed lifecycle model exists.
     * @tc.steps         1. Destroy the model.
     *                   2. Reset it.
     *                   3. Inspect the state and counters.
     * @tc.expected      The state becomes idle with zeroed counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationResetFromDestroyed', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDestroy();
      service.reset();
      logStep('stateValidationResetFromDestroyed', stateLabel(service));
      expect(service.state).assertEqual(STATE_IDLE);
      expect(service.destroyCount).assertEqual(0);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.isAlive()).assertTrue();
      expect(isKnownState(service.state)).assertTrue();
    });

    /**
     * @tc.name          stateValidationSnapshotEquality
     * @tc.desc          Two snapshots of the same lifecycle state compare equal.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Take two snapshots.
     *                   2. Compare them.
     *                   3. Compare with a later snapshot.
     * @tc.expected      Simultaneous snapshots match while a later one does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationSnapshotEquality', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const first: ServiceSnapshot = new ServiceSnapshot(service);
      const second: ServiceSnapshot = new ServiceSnapshot(service);
      service.onDisconnect();
      const third: ServiceSnapshot = new ServiceSnapshot(service);
      logStep('stateValidationSnapshotEquality', first.describe());
      expect(first.sameAs(second)).assertTrue();
      expect(first.sameAs(third)).assertFalse();
      expect(first.state).assertEqual(STATE_CONNECTED);
      expect(third.state).assertEqual(STATE_DISCONNECTED);
      expect(first.connects).assertEqual(1);
      expect(second.connects).assertEqual(1);
      expect(third.disconnects).assertEqual(1);
      expect(first.describe()).assertEqual(second.describe());
      expect(first.describe() === third.describe()).assertFalse();
    });

    /**
     * @tc.name          stateValidationStateRankOrdering
     * @tc.desc          State ranks increase along the documented lifecycle.
     * @tc.precondition  The state rank helper is available.
     * @tc.steps         1. Rank all five states.
     *                   2. Compare adjacent ranks.
     *                   3. Rank an unknown state.
     * @tc.expected      Ranks increase from zero to four and unknown is minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateRankOrdering', 0, () => {
      logStep('stateValidationStateRankOrdering', joined(KNOWN_STATES, '>'));
      expect(stateRank(STATE_IDLE)).assertEqual(0);
      expect(stateRank(STATE_CREATED)).assertEqual(1);
      expect(stateRank(STATE_CONNECTED)).assertEqual(2);
      expect(stateRank(STATE_DISCONNECTED)).assertEqual(3);
      expect(stateRank(STATE_DESTROYED)).assertEqual(4);
      expect(stateRank('unknown')).assertEqual(-1);
      expect(stateRank(STATE_CREATED)).assertLarger(stateRank(STATE_IDLE));
      expect(stateRank(STATE_DESTROYED)).assertLarger(stateRank(STATE_CONNECTED));
    });

    /**
     * @tc.name          stateValidationKnownStateMatrix
     * @tc.desc          The known state predicate accepts only the five literals.
     * @tc.precondition  The known state helper is available.
     * @tc.steps         1. Evaluate all five literals.
     *                   2. Evaluate an empty and an unknown value.
     *                   3. Count the accepted states.
     * @tc.expected      Five literals pass and both strays fail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationKnownStateMatrix', 0, () => {
      let accepted: number = 0;
      for (let index = 0; index < KNOWN_STATES.length; index++) {
        if (isKnownState(KNOWN_STATES[index])) {
          accepted = accepted + 1;
        }
      }
      logStep('stateValidationKnownStateMatrix', String(accepted));
      expect(accepted).assertEqual(5);
      expect(isKnownState(STATE_IDLE)).assertTrue();
      expect(isKnownState(STATE_DESTROYED)).assertTrue();
      expect(isKnownState('')).assertFalse();
      expect(isKnownState('IDLE')).assertFalse();
      expect(isKnownState('running')).assertFalse();
      expect(KNOWN_STATES.length).assertEqual(5);
      expect(uniqueStrings(KNOWN_STATES).length).assertEqual(5);
      expect(countOf(KNOWN_STATES, STATE_CONNECTED)).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationTerminalMatrix
     * @tc.desc          Only the destroyed state is terminal.
     * @tc.precondition  The terminal helper is available.
     * @tc.steps         1. Evaluate every known state.
     *                   2. Count the terminal results.
     *                   3. Compare with isAlive.
     * @tc.expected      Exactly one state is terminal and it is destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationTerminalMatrix', 0, () => {
      let terminalCount: number = 0;
      for (let index = 0; index < KNOWN_STATES.length; index++) {
        if (isTerminal(KNOWN_STATES[index])) {
          terminalCount = terminalCount + 1;
        }
      }
      logStep('stateValidationTerminalMatrix', String(terminalCount));
      expect(terminalCount).assertEqual(1);
      expect(isTerminal(STATE_DESTROYED)).assertTrue();
      expect(isTerminal(STATE_IDLE)).assertFalse();
      expect(isTerminal(STATE_CONNECTED)).assertFalse();
      expect(isTerminal(STATE_DISCONNECTED)).assertFalse();
      expect(isTerminal('')).assertFalse();
      expect(KNOWN_STATES[4]).assertEqual(STATE_DESTROYED);
      expect(stateRank(KNOWN_STATES[4])).assertEqual(4);
    });

    /**
     * @tc.name          stateValidationFullForwardChain
     * @tc.desc          The full forward lifecycle visits every state in order.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Record the initial state.
     *                   2. Create, connect and disconnect.
     *                   3. Destroy and compare the chain.
     * @tc.expected      The state chain is idle, created, connected, disconnected, destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stateValidationFullForwardChain', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const chain: string[] = [];
      chain.push(service.state);
      service.onCreate();
      chain.push(service.state);
      service.onConnect();
      chain.push(service.state);
      service.onDisconnect();
      chain.push(service.state);
      service.onDestroy();
      chain.push(service.state);
      logStep('stateValidationFullForwardChain', joined(chain, '>'));
      expect(chain.length).assertEqual(5);
      expect(chain[0]).assertEqual(STATE_IDLE);
      expect(chain[1]).assertEqual(STATE_CREATED);
      expect(chain[2]).assertEqual(STATE_CONNECTED);
      expect(chain[3]).assertEqual(STATE_DISCONNECTED);
      expect(chain[4]).assertEqual(STATE_DESTROYED);
      expect(chain[0]).assertEqual(KNOWN_STATES[0]);
      expect(chain[4]).assertEqual(KNOWN_STATES[4]);
      expect(countOf(chain, STATE_CONNECTED)).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationRequestDoesNotChangeState
     * @tc.desc          onRequest leaves the lifecycle state untouched.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Connect and record the state.
     *                   2. Request twice.
     *                   3. Compare the state.
     * @tc.expected      The state stays connected while the request count grows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationRequestDoesNotChangeState', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const before: string = service.state;
      service.onRequest(11);
      service.onRequest(12);
      logStep('stateValidationRequestDoesNotChangeState', service.state);
      expect(before).assertEqual(STATE_CONNECTED);
      expect(service.state).assertEqual(before);
      expect(service.requestCount).assertEqual(2);
      expect(service.events.countOf('onRequest')).assertEqual(2);
      expect(service.events.last()).assertEqual('onRequest:12');
      expect(service.events.size()).assertEqual(4);
      expect(service.isAlive()).assertTrue();
      expect(service.logs.contains('onRequest 11')).assertTrue();
    });

    /**
     * @tc.name          stateValidationStateTraceString
     * @tc.desc          A state trace string captures each transition label.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Build a trace of states.
     *                   2. Join with arrows.
     *                   3. Split and compare.
     * @tc.expected      The trace lists the five states in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateTraceString', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const states: string[] = [service.state];
      service.onCreate();
      states.push(service.state);
      service.onConnect();
      states.push(service.state);
      service.onDisconnect();
      states.push(service.state);
      service.onDestroy();
      states.push(service.state);
      const trace: string = joined(states, ' -> ');
      logStep('stateValidationStateTraceString', trace);
      expect(trace.split(' -> ').length).assertEqual(5);
      expect(trace.startsWith(STATE_IDLE)).assertTrue();
      expect(trace.endsWith(STATE_DESTROYED)).assertTrue();
      expect(trace.indexOf(STATE_CONNECTED)).assertLarger(0);
      expect(trace.split(' -> ')[2]).assertEqual(STATE_CONNECTED);
      expect(trace.split(' -> ')[3]).assertEqual(STATE_DISCONNECTED);
      expect(trace.indexOf(STATE_DISCONNECTED)).assertLarger(trace.indexOf(STATE_CONNECTED));
      expect(countOf(states, STATE_IDLE)).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationStateFingerprint
     * @tc.desc          State fingerprints separate distinct state strings.
     * @tc.precondition  The textFingerprint helper is available.
     * @tc.steps         1. Fingerprint each known state.
     *                   2. Deduplicate the fingerprints.
     *                   3. Confirm the empty fingerprint.
     * @tc.expected      Five distinct fingerprints appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateFingerprint', 0, () => {
      const fingerprints: string[] = [];
      for (let index = 0; index < KNOWN_STATES.length; index++) {
        fingerprints.push(String(textFingerprint(KNOWN_STATES[index])));
      }
      logStep('stateValidationStateFingerprint', joined(fingerprints, ','));
      expect(fingerprints.length).assertEqual(5);
      expect(uniqueStrings(fingerprints).length).assertEqual(5);
      expect(textFingerprint(STATE_IDLE)).assertEqual(textFingerprint('idle'));
      expect(textFingerprint(STATE_DESTROYED)).assertLarger(0);
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint(STATE_IDLE)).assertLess(1000003);
      expect(textFingerprint(STATE_CREATED) === textFingerprint(STATE_CONNECTED)).assertFalse();
      expect(fingerprints[2]).assertEqual(String(textFingerprint(STATE_CONNECTED)));
    });

    /**
     * @tc.name          stateValidationSnapshotAfterDestroy
     * @tc.desc          A snapshot after destroy reports zeros for connects and requests.
     * @tc.precondition  A destroyed lifecycle model exists.
     * @tc.steps         1. Destroy the model.
     *                   2. Take a snapshot.
     *                   3. Inspect every field.
     * @tc.expected      The snapshot state is destroyed with one destroy counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationSnapshotAfterDestroy', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      const snapshot: ServiceSnapshot = new ServiceSnapshot(service);
      logStep('stateValidationSnapshotAfterDestroy', snapshot.describe());
      expect(snapshot.state).assertEqual(STATE_DESTROYED);
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/0/0/0/1');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationSnapshotDescribeFormat
     * @tc.desc          The snapshot description uses slash separated counters.
     * @tc.precondition  A connected lifecycle model with traffic exists.
     * @tc.steps         1. Connect, request and disconnect.
     *                   2. Take a snapshot.
     *                   3. Inspect each segment.
     * @tc.expected      The description carries state and four counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationSnapshotDescribeFormat', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(3);
      service.onDisconnect();
      const snapshot: ServiceSnapshot = new ServiceSnapshot(service);
      const parts: string[] = snapshot.describe().split('/');
      logStep('stateValidationSnapshotDescribeFormat', snapshot.describe());
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual(STATE_DISCONNECTED);
      expect(parts[1]).assertEqual('1');
      expect(parts[2]).assertEqual('1');
      expect(parts[3]).assertEqual('1');
      expect(parts[4]).assertEqual('0');
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          stateValidationMultipleModelsIndependent
     * @tc.desc          Two lifecycle models keep independent states.
     * @tc.precondition  Two lifecycle models are available.
     * @tc.steps         1. Advance the first model.
     *                   2. Read both states.
     *                   3. Compare the counters.
     * @tc.expected      Only the first model leaves idle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationMultipleModelsIndependent', 0, () => {
      const first: ServiceLifecycleModel = new ServiceLifecycleModel();
      const second: ServiceLifecycleModel = new ServiceLifecycleModel();
      first.onCreate();
      first.onConnect();
      first.onRequest(1);
      logStep('stateValidationMultipleModelsIndependent', first.state + '/' + second.state);
      expect(first.state).assertEqual(STATE_CONNECTED);
      expect(second.state).assertEqual(STATE_IDLE);
      expect(first.connectCount).assertEqual(1);
      expect(second.connectCount).assertEqual(0);
      expect(second.requestCount).assertEqual(0);
      expect(second.events.size()).assertEqual(0);
      expect(first.events.size()).assertEqual(3);
      expect(second.stub).assertUndefined();
      expect(second.isAlive()).assertTrue();
    });

    /**
     * @tc.name          stateValidationStateClampIndex
     * @tc.desc          A state index clamps inside the known state array.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp a negative rank.
     *                   2. Clamp an oversized rank.
     *                   3. Resolve both boundaries.
     * @tc.expected      The clamped indices resolve to idle and destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateClampIndex', 0, () => {
      const low: number = clampInt(-2, 0, KNOWN_STATES.length - 1);
      const high: number = clampInt(9, 0, KNOWN_STATES.length - 1);
      logStep('stateValidationStateClampIndex', String(low) + '/' + String(high));
      expect(low).assertEqual(0);
      expect(high).assertEqual(4);
      expect(KNOWN_STATES[low]).assertEqual(STATE_IDLE);
      expect(KNOWN_STATES[high]).assertEqual(STATE_DESTROYED);
      expect(KNOWN_STATES.length - 1).assertEqual(4);
      expect(clampInt(2, 0, 4)).assertEqual(2);
      expect(clampInt(4, 4, 4)).assertEqual(4);
      expect(KNOWN_STATES[clampInt(3, 0, 4)]).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          stateValidationStateWithClientTraffic
     * @tc.desc          Client traffic does not alter the service state.
     * @tc.precondition  A connected service with a client exists.
     * @tc.steps         1. Connect and build a client.
     *                   2. Send two requests.
     *                   3. Compare the state and counters.
     * @tc.expected      The state stays connected while two requests are served.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateWithClientTraffic', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      const before: string = service.state;
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('stateValidationStateWithClientTraffic', service.state);
      expect(before).assertEqual(STATE_CONNECTED);
      expect(service.state).assertEqual(before);
      expect(stub.requestCount()).assertEqual(2);
      expect(client.results.length).assertEqual(2);
      expect(service.requestCount).assertEqual(0);
      expect(service.events.countOf('onRequest')).assertEqual(0);
      expect(service.connectCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name          stateValidationStateAfterStubKill
     * @tc.desc          Killing the stub does not change the service state.
     * @tc.precondition  A connected service exists.
     * @tc.steps         1. Connect the service.
     *                   2. Kill the stub.
     *                   3. Compare the state and aliveness.
     * @tc.expected      The service stays connected while the stub reports dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateAfterStubKill', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      stub.kill();
      logStep('stateValidationStateAfterStubKill', stateLabel(service));
      expect(service.state).assertEqual(STATE_CONNECTED);
      expect(stub.alive).assertFalse();
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.stub === stub).assertTrue();
      expect(service.stub?.alive).assertFalse();
      expect(isTerminal(service.state)).assertFalse();
    });

    /**
     * @tc.name          stateValidationLogStateEntries
     * @tc.desc          Each transition logs exactly one info entry.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Create, connect and destroy.
     *                   2. Count log entries.
     *                   3. Compare with the event count.
     * @tc.expected      Three info logs match three events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationLogStateEntries', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      logStep('stateValidationLogStateEntries', service.logs.trace());
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.countLevel('INFO')).assertEqual(3);
      expect(service.logs.countLevel('WARN')).assertEqual(0);
      expect(service.logs.contains('onCreate')).assertTrue();
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          stateValidationDisconnectTwice
     * @tc.desc          Two disconnects keep the state and increment the counter.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Disconnect twice.
     *                   2. Read the state.
     *                   3. Compare the event count.
     * @tc.expected      The state stays disconnected with two disconnect events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDisconnectTwice', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onConnect();
      service.onDisconnect();
      service.onDisconnect();
      logStep('stateValidationDisconnectTwice', String(service.disconnectCount));
      expect(service.state).assertEqual(STATE_DISCONNECTED);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.events.size()).assertEqual(3);
      expect(service.isAlive()).assertTrue();
      expect(isTerminal(service.state)).assertFalse();
      expect(stateRank(service.state)).assertEqual(3);
    });

    /**
     * @tc.name          stateValidationDestroyWithoutCreate
     * @tc.desc          onDestroy works directly from idle.
     * @tc.precondition  A fresh lifecycle model exists.
     * @tc.steps         1. Destroy immediately.
     *                   2. Read the state.
     *                   3. Compare with the create event count.
     * @tc.expected      The model becomes destroyed without a create event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDestroyWithoutCreate', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onDestroy();
      logStep('stateValidationDestroyWithoutCreate', service.state);
      expect(service.state).assertEqual(STATE_DESTROYED);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(1);
      expect(isTerminal(service.state)).assertTrue();
    });

    /**
     * @tc.name          stateValidationSnapshotComparisonMatrix
     * @tc.desc          Snapshots compare equal only when every field matches.
     * @tc.precondition  Two lifecycle models exist.
     * @tc.steps         1. Snapshot identical states.
     *                   2. Diverge one counter.
     *                   3. Compare the snapshots.
     * @tc.expected      Equal snapshots match and diverged ones do not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationSnapshotComparisonMatrix', 0, () => {
      const first: ServiceLifecycleModel = new ServiceLifecycleModel();
      const second: ServiceLifecycleModel = new ServiceLifecycleModel();
      first.onCreate();
      second.onCreate();
      const firstSnapshot: ServiceSnapshot = new ServiceSnapshot(first);
      const secondSnapshot: ServiceSnapshot = new ServiceSnapshot(second);
      second.onRequest(1);
      const diverged: ServiceSnapshot = new ServiceSnapshot(second);
      logStep('stateValidationSnapshotComparisonMatrix', diverged.describe());
      expect(firstSnapshot.sameAs(secondSnapshot)).assertTrue();
      expect(firstSnapshot.sameAs(diverged)).assertFalse();
      expect(firstSnapshot.requests).assertEqual(0);
      expect(diverged.requests).assertEqual(1);
      expect(firstSnapshot.state).assertEqual(STATE_CREATED);
      expect(diverged.state).assertEqual(STATE_CREATED);
      expect(firstSnapshot.describe()).assertEqual('created/0/0/0/0');
      expect(diverged.describe()).assertEqual('created/0/0/1/0');
    });

    /**
     * @tc.name          stateValidationStateListUnique
     * @tc.desc          A state list with repeats deduplicates to one entry.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Build a repeated state list.
     *                   2. Deduplicate it.
     *                   3. Compare the sizes.
     * @tc.expected      Four repeats collapse to one unique state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateListUnique', 0, () => {
      const states: string[] = [STATE_IDLE, STATE_IDLE, STATE_IDLE, STATE_IDLE];
      const unique: string[] = uniqueStrings(states);
      logStep('stateValidationStateListUnique', joined(unique, ','));
      expect(states.length).assertEqual(4);
      expect(unique.length).assertEqual(1);
      expect(unique[0]).assertEqual(STATE_IDLE);
      expect(countOf(states, STATE_IDLE)).assertEqual(4);
      expect(countOf(unique, STATE_IDLE)).assertEqual(1);
      expect(isKnownState(unique[0])).assertTrue();
      expect(stateRank(unique[0])).assertEqual(0);
      expect(uniqueStrings(unique).length).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationStateJoinedLedger
     * @tc.desc          A joined state ledger lists transitions in order.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Advance through four states.
     *                   2. Join the states.
     *                   3. Split and compare segments.
     * @tc.expected      The ledger lists idle, created, connected and disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateJoinedLedger', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const states: string[] = [service.state];
      service.onCreate();
      states.push(service.state);
      service.onConnect();
      states.push(service.state);
      service.onDisconnect();
      states.push(service.state);
      const ledger: string = joined(states, ',');
      logStep('stateValidationStateJoinedLedger', ledger);
      expect(ledger.split(',').length).assertEqual(4);
      expect(ledger).assertEqual('idle,created,connected,disconnected');
      expect(ledger.startsWith(STATE_IDLE)).assertTrue();
      expect(ledger.endsWith(STATE_DISCONNECTED)).assertTrue();
      expect(ledger.indexOf(STATE_CREATED)).assertLarger(0);
      expect(countOf(states, STATE_IDLE)).assertEqual(1);
      expect(states.length).assertEqual(4);
      expect(isKnownState(states[3])).assertTrue();
    });

    /**
     * @tc.name          stateValidationEventStateAlignment
     * @tc.desc          Event kinds align with the lifecycle state after each call.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Create, request and connect.
     *                   2. Read the events.
     *                   3. Compare kinds with the current state.
     * @tc.expected      The last event is connect and the state is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationEventStateAlignment', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(5);
      service.onConnect();
      const entries: string[] = service.events.entries;
      logStep('stateValidationEventStateAlignment', service.events.trace());
      expect(entries.length).assertEqual(3);
      expect(entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(entries[1]).assertEqual('onRequest:5');
      expect(entries[2]).assertEqual(EVENT_ON_CONNECT + ':IPCStubTest');
      expect(service.state).assertEqual(STATE_CONNECTED);
      expect(entries[2].startsWith(EVENT_ON_CONNECT)).assertTrue();
      expect(service.events.last()).assertEqual(entries[2]);
      expect(service.events.countOf('onRequest')).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationRequestStartIds
     * @tc.desc          Request start identifiers are recorded verbatim.
     * @tc.precondition  A created lifecycle model exists.
     * @tc.steps         1. Request with three start identifiers.
     *                   2. Read the event entries.
     *                   3. Compare the suffixes.
     * @tc.expected      The entries carry the documented start identifiers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationRequestStartIds', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(42);
      service.onRequest(9999);
      const entries: string[] = service.events.entries;
      logStep('stateValidationRequestStartIds', joined(entries, '>'));
      expect(entries.length).assertEqual(4);
      expect(entries[1]).assertEqual('onRequest:1');
      expect(entries[2]).assertEqual('onRequest:42');
      expect(entries[3]).assertEqual('onRequest:9999');
      expect(countOf(service.events.entries, 'onRequest:1')).assertEqual(1);
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf('onRequest')).assertEqual(3);
      expect(service.state).assertEqual(STATE_CREATED);
      expect(service.logs.contains('onRequest 42')).assertTrue();
    });

    /**
     * @tc.name          stateValidationResetTwice
     * @tc.desc          Resetting twice keeps the model idle and empty.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Reset twice.
     *                   2. Read the state.
     *                   3. Check every counter.
     * @tc.expected      The model stays idle with all counters zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationResetTwice', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(2);
      service.reset();
      service.reset();
      logStep('stateValidationResetTwice', stateLabel(service));
      expect(service.state).assertEqual(STATE_IDLE);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.isAlive()).assertTrue();
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          stateValidationOrdinalChainSnapshots
     * @tc.desc          Snapshots at every stage expose increasing ordinals.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Snapshot after each transition.
     *                   2. Rank each snapshot state.
     *                   3. Compare the ranks.
     * @tc.expected      Ranks increase from zero to four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationOrdinalChainSnapshots', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const snapshots: ServiceSnapshot[] = [];
      snapshots.push(new ServiceSnapshot(service));
      service.onCreate();
      snapshots.push(new ServiceSnapshot(service));
      service.onConnect();
      snapshots.push(new ServiceSnapshot(service));
      service.onDisconnect();
      snapshots.push(new ServiceSnapshot(service));
      service.onDestroy();
      snapshots.push(new ServiceSnapshot(service));
      logStep('stateValidationOrdinalChainSnapshots', snapshots[4].describe());
      expect(snapshots.length).assertEqual(5);
      expect(stateRank(snapshots[0].state)).assertEqual(0);
      expect(stateRank(snapshots[1].state)).assertEqual(1);
      expect(stateRank(snapshots[2].state)).assertEqual(2);
      expect(stateRank(snapshots[3].state)).assertEqual(3);
      expect(stateRank(snapshots[4].state)).assertEqual(4);
      expect(snapshots[2].connects).assertEqual(1);
      expect(snapshots[4].destroys).assertEqual(1);
      expect(snapshots[0].sameAs(snapshots[1])).assertFalse();
    });

    /**
     * @tc.name          stateValidationIdleEventsNone
     * @tc.desc          An idle model has no events and no logs.
     * @tc.precondition  A fresh lifecycle model exists.
     * @tc.steps         1. Read the event recorder.
     *                   2. Read the log buffer.
     *                   3. Confirm the empty traces.
     * @tc.expected      Both traces are empty in the idle state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationIdleEventsNone', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      logStep('stateValidationIdleEventsNone', service.state);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.logs.trace()).assertEqual('');
      expect(service.events.last()).assertEqual('');
      expect(service.events.fingerprint()).assertEqual(textFingerprint(''));
      expect(service.logs.countLevel('INFO')).assertEqual(0);
      expect(service.state).assertEqual(STATE_IDLE);
    });

    /**
     * @tc.name          stateValidationCreatedSnapshot
     * @tc.desc          A created snapshot reports zeros for traffic counters.
     * @tc.precondition  A created lifecycle model exists.
     * @tc.steps         1. Call onCreate.
     *                   2. Snapshot the model.
     *                   3. Inspect every field.
     * @tc.expected      The snapshot is created with all counters zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationCreatedSnapshot', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const snapshot: ServiceSnapshot = new ServiceSnapshot(service);
      logStep('stateValidationCreatedSnapshot', snapshot.describe());
      expect(snapshot.state).assertEqual(STATE_CREATED);
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('created/0/0/0/0');
      expect(snapshot.describe().split('/')[0]).assertEqual(STATE_CREATED);
      expect(service.events.size()).assertEqual(1);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          stateValidationConnectedSnapshot
     * @tc.desc          A connected snapshot reports one connect.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Create and connect.
     *                   2. Snapshot the model.
     *                   3. Compare with a literal description.
     * @tc.expected      The snapshot description is connected/1/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationConnectedSnapshot', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const snapshot: ServiceSnapshot = new ServiceSnapshot(service);
      logStep('stateValidationConnectedSnapshot', snapshot.describe());
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/0/0');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(service.connectCount).assertEqual(1);
      expect(service.stub?.descriptor).assertEqual('IPCStubTest');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          stateValidationDisconnectedSnapshot
     * @tc.desc          A disconnected snapshot reports both counters.
     * @tc.precondition  A disconnected lifecycle model exists.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Snapshot the model.
     *                   3. Inspect the counters.
     * @tc.expected      The snapshot reports one connect and one disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationDisconnectedSnapshot', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      const snapshot: ServiceSnapshot = new ServiceSnapshot(service);
      logStep('stateValidationDisconnectedSnapshot', snapshot.describe());
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.describe()).assertEqual('disconnected/1/1/0/0');
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(service.stub?.descriptor).assertEqual('IPCStubTest');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          stateValidationStateContainsFragments
     * @tc.desc          State strings contain expected fragments.
     * @tc.precondition  The state constants are available.
     * @tc.steps         1. Search for prefixes.
     *                   2. Search for absent fragments.
     *                   3. Compare lengths.
     * @tc.expected      Prefix fragments are found and absent ones are not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateContainsFragments', 0, () => {
      logStep('stateValidationStateContainsFragments', joined(KNOWN_STATES, ','));
      expect(STATE_DISCONNECTED.indexOf('connect')).assertLarger(0);
      expect(STATE_CONNECTED.indexOf('connect')).assertEqual(0);
      expect(STATE_DESTROYED.indexOf('destroy')).assertEqual(0);
      expect(STATE_IDLE.indexOf('connect')).assertEqual(-1);
      expect(STATE_CREATED.indexOf('create')).assertEqual(0);
      expect(STATE_DISCONNECTED.length).assertLarger(STATE_CONNECTED.length);
      expect(STATE_IDLE.length).assertEqual(4);
      expect(STATE_DESTROYED.endsWith('ed')).assertTrue();
    });

    /**
     * @tc.name          stateValidationStateTrimBehaviour
     * @tc.desc          Padded state text trims to a known state.
     * @tc.precondition  The state helpers are available.
     * @tc.steps         1. Pad a state string.
     *                   2. Trim it.
     *                   3. Compare with the constant.
     * @tc.expected      The trimmed text is the known state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateTrimBehaviour', 0, () => {
      const padded: string = '  ' + STATE_CONNECTED + '  ';
      const trimmed: string = padded.trim();
      logStep('stateValidationStateTrimBehaviour', padded);
      expect(padded.length).assertEqual(STATE_CONNECTED.length + 4);
      expect(trimmed.length).assertEqual(STATE_CONNECTED.length);
      expect(trimmed).assertEqual(STATE_CONNECTED);
      expect(isKnownState(padded)).assertFalse();
      expect(isKnownState(trimmed)).assertTrue();
      expect(padded.startsWith(' ')).assertTrue();
      expect(padded.endsWith(' ')).assertTrue();
      expect(stateRank(trimmed)).assertEqual(2);
    });

    /**
     * @tc.name          stateValidationStateCaseSensitivity
     * @tc.desc          State classification is case sensitive.
     * @tc.precondition  The state predicates are available.
     * @tc.steps         1. Upper case a known state.
     *                   2. Classify both forms.
     *                   3. Compare the ranks.
     * @tc.expected      Only the lower case form is known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateCaseSensitivity', 0, () => {
      const upper: string = STATE_CONNECTED.toUpperCase();
      logStep('stateValidationStateCaseSensitivity', upper);
      expect(upper).assertEqual('CONNECTED');
      expect(isKnownState(upper)).assertFalse();
      expect(isKnownState(STATE_CONNECTED)).assertTrue();
      expect(stateRank(upper)).assertEqual(-1);
      expect(stateRank(STATE_CONNECTED)).assertEqual(2);
      expect(upper.toLowerCase()).assertEqual(STATE_CONNECTED);
      expect(upper === STATE_CONNECTED).assertFalse();
      expect(upper.length).assertEqual(STATE_CONNECTED.length);
    });

    /**
     * @tc.name          stateValidationTransitionCounts
     * @tc.desc          Transition counts match the number of lifecycle calls.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Perform create, two connects and one disconnect.
     *                   2. Read the counters.
     *                   3. Compare with the event counts.
     * @tc.expected      Counters match the calls exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationTransitionCounts', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onConnect();
      service.onDisconnect();
      logStep('stateValidationTransitionCounts', stateLabel(service));
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(4);
      expect(service.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          stateValidationRequestThenDestroy
     * @tc.desc          A request before destroy leaves both counters set.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Request once.
     *                   2. Destroy the model.
     *                   3. Inspect the snapshot.
     * @tc.expected      The snapshot reports one request and one destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationRequestThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(4);
      service.onDestroy();
      const snapshot: ServiceSnapshot = new ServiceSnapshot(service);
      logStep('stateValidationRequestThenDestroy', snapshot.describe());
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.state).assertEqual(STATE_DESTROYED);
      expect(snapshot.describe()).assertEqual('destroyed/1/0/1/1');
      expect(service.isAlive()).assertFalse();
      expect(service.events.size()).assertEqual(4);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name          stateValidationStateEventFingerprint
     * @tc.desc          Event fingerprints differ between distinct lifecycles.
     * @tc.precondition  Two lifecycle models are available.
     * @tc.steps         1. Advance both differently.
     *                   2. Compare event fingerprints.
     *                   3. Compare identical sequences.
     * @tc.expected      Distinct sequences differ and identical ones match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateEventFingerprint', 0, () => {
      const first: ServiceLifecycleModel = new ServiceLifecycleModel();
      const second: ServiceLifecycleModel = new ServiceLifecycleModel();
      const third: ServiceLifecycleModel = new ServiceLifecycleModel();
      first.onCreate();
      first.onConnect();
      second.onCreate();
      second.onDisconnect();
      third.onCreate();
      third.onConnect();
      logStep('stateValidationStateEventFingerprint', String(first.events.fingerprint()));
      expect(first.events.fingerprint()).assertEqual(third.events.fingerprint());
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.events.fingerprint()).assertLarger(0);
      expect(second.events.fingerprint()).assertLarger(0);
      expect(first.events.trace() === second.events.trace()).assertFalse();
      expect(first.events.size()).assertEqual(2);
      expect(third.events.size()).assertEqual(2);
      expect(textFingerprint(first.events.trace())).assertEqual(first.events.fingerprint());
    });

    /**
     * @tc.name          stateValidationStateLogAlignment
     * @tc.desc          Log entries align with state transitions.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Create, connect and disconnect.
     *                   2. Read the log lines.
     *                   3. Compare each line.
     * @tc.expected      The log lines carry the info level and transition names.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationStateLogAlignment', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      const lines: string[] = service.logs.lines;
      logStep('stateValidationStateLogAlignment', service.logs.trace());
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertEqual('INFO onCreate');
      expect(lines[1]).assertEqual('INFO onConnect');
      expect(lines[2]).assertEqual('INFO onDisconnect');
      expect(service.logs.countLevel('INFO')).assertEqual(3);
      expect(service.events.size()).assertEqual(lines.length);
      expect(service.state).assertEqual(STATE_DISCONNECTED);
      expect(lines[2].startsWith('INFO ')).assertTrue();
      expect(countOf(service.logs.levels, 'INFO')).assertEqual(3);
    });

    /**
     * @tc.name          stateValidationStateUnknownInputs
     * @tc.desc          Unknown state inputs are classified safely.
     * @tc.precondition  The state predicates are available.
     * @tc.steps         1. Classify an empty string.
     *                   2. Classify numeric text.
     *                   3. Compare the ranks.
     * @tc.expected      Unknown inputs are not known and rank minus one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateUnknownInputs', 0, () => {
      const numeric: string = '42';
      const spaced: string = ' idle';
      logStep('stateValidationStateUnknownInputs', numeric + '/' + spaced);
      expect(isKnownState('')).assertFalse();
      expect(isKnownState(numeric)).assertFalse();
      expect(isKnownState(spaced)).assertFalse();
      expect(stateRank('')).assertEqual(-1);
      expect(stateRank(numeric)).assertEqual(-1);
      expect(stateRank(spaced)).assertEqual(-1);
      expect(isTerminal('')).assertFalse();
      expect(isTerminal(numeric)).assertFalse();
      expect(uniqueStrings(['', numeric, spaced]).length).assertEqual(3);
    });

    /**
     * @tc.name          stateValidationStateOrdinalBoundaries
     * @tc.desc          Ordinal boundaries map to the first and last states.
     * @tc.precondition  The clampInt helper and state list are available.
     * @tc.steps         1. Clamp the minimum ordinal.
     *                   2. Clamp the maximum ordinal.
     *                   3. Compare the resolved states.
     * @tc.expected      The boundaries resolve to idle and destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationStateOrdinalBoundaries', 0, () => {
      const min: number = clampInt(-99, 0, 4);
      const max: number = clampInt(99, 0, 4);
      logStep('stateValidationStateOrdinalBoundaries', KNOWN_STATES[min] + '/' + KNOWN_STATES[max]);
      expect(min).assertEqual(0);
      expect(max).assertEqual(4);
      expect(KNOWN_STATES[min]).assertEqual(STATE_IDLE);
      expect(KNOWN_STATES[max]).assertEqual(STATE_DESTROYED);
      expect(stateRank(KNOWN_STATES[min])).assertEqual(0);
      expect(stateRank(KNOWN_STATES[max])).assertEqual(4);
      expect(isTerminal(KNOWN_STATES[min])).assertFalse();
      expect(isTerminal(KNOWN_STATES[max])).assertTrue();
    });

    /**
     * @tc.name          stateValidationAfterDoubleReset
     * @tc.desc          A double reset keeps the model fully idle.
     * @tc.precondition  A noisy lifecycle model exists.
     * @tc.steps         1. Perform every transition.
     *                   2. Reset twice.
     *                   3. Snapshot the model.
     * @tc.expected      The snapshot reports idle with zeros everywhere.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationAfterDoubleReset', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      service.reset();
      const snapshot: ServiceSnapshot = new ServiceSnapshot(service);
      logStep('stateValidationAfterDoubleReset', snapshot.describe());
      expect(snapshot.state).assertEqual(STATE_IDLE);
      expect(snapshot.describe()).assertEqual('idle/0/0/0/0');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          stateValidationFinalStateReport
     * @tc.desc          A final report aggregates state, counters and log size.
     * @tc.precondition  A lifecycle model with full history exists.
     * @tc.steps         1. Drive the model through four transitions.
     *                   2. Compose the report.
     *                   3. Inspect each field.
     * @tc.expected      The report carries the state, counters and log size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stateValidationFinalStateReport', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(2);
      service.onDisconnect();
      const report: string = service.state + '|' + String(service.connectCount) + '|' +
        String(service.disconnectCount) + '|' + String(service.requestCount) + '|' + String(service.logs.size());
      logStep('stateValidationFinalStateReport', report);
      expect(report.split('|').length).assertEqual(5);
      expect(report.split('|')[0]).assertEqual(STATE_DISCONNECTED);
      expect(report.split('|')[1]).assertEqual('1');
      expect(report.split('|')[2]).assertEqual('1');
      expect(report.split('|')[3]).assertEqual('1');
      expect(report.split('|')[4]).assertEqual('4');
      expect(report.startsWith('disconnected|')).assertTrue();
      expect(service.isAlive()).assertTrue();
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          stateValidationTransitionLedgerClose
     * @tc.desc          A closing ledger matches the counters exactly.
     * @tc.precondition  A lifecycle model with one of each transition exists.
     * @tc.steps         1. Create, connect, request, disconnect and destroy.
     *                   2. Compose the ledger.
     *                   3. Compare the fields.
     * @tc.expected      The ledger reports one of each and a destroyed state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stateValidationTransitionLedgerClose', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(8);
      service.onDisconnect();
      service.onDestroy();
      const ledger: string = service.state + '#' + String(service.connectCount) + '#' +
        String(service.disconnectCount) + '#' + String(service.requestCount) + '#' + String(service.destroyCount);
      logStep('stateValidationTransitionLedgerClose', ledger);
      expect(ledger).assertEqual('destroyed#1#1#1#1');
      expect(ledger.split('#').length).assertEqual(5);
      expect(ledger.split('#')[0]).assertEqual(STATE_DESTROYED);
      expect(service.events.size()).assertEqual(5);
      expect(service.events.countOf('onRequest')).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(5);
      expect(stateRank(service.state)).assertEqual(4);
    });
  });
}
