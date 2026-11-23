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
  EVENT_ON_DESTROY,
  EVENT_ON_DISCONNECT,
  EVENT_ON_REQUEST,
  LEVEL_ERROR,
  LEVEL_INFO,
  LEVEL_WARN,
  REPLY_PAYLOAD,
  STUB_DESCRIPTOR,
  InProcessClient,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  StubRemoteObjectModel,
  joined
} from '../Shared/SharedDriver';

function emptyModel(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function destroyedModel(): ServiceLifecycleModel {
  const service = new ServiceLifecycleModel();
  service.onCreate();
  service.onDestroy();
  return service;
}

function destroyTimes(service: ServiceLifecycleModel, times: number): void {
  for (let index = 0; index < times; index++) {
    service.onDestroy();
  }
}

function destroySnapshot(service: ServiceLifecycleModel): ServiceSnapshot {
  return new ServiceSnapshot(service);
}

function latestLine(service: ServiceLifecycleModel): string {
  return service.logs.lines[service.logs.size() - 1];
}

export default function onDestroyLifecycle(): void {
  describe('OnDestroyLifecycle', () => {
    beforeAll(() => {
      logSuite('OnDestroyLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('OnDestroyLifecycle', 'end');
    });

    /**
     * @tc.name          onDestroyLifecycleFirstCallCounts
     * @tc.desc          The first destroy increments the destroy counter.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDestroy.
     *                   2. Read the destroy counter.
     *                   3. Read the event count.
     * @tc.expected      Counter and event count both equal one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDestroyLifecycleFirstCallCounts', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onDestroy();
      expect(service.destroyCount).assertEqual(1);
      expect(service.destroyCount).assertLarger(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
    });

    /**
     * @tc.name          onDestroyLifecycleStateBecomesDestroyed
     * @tc.desc          Destroy sets the state string to destroyed.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Read the idle state.
     *                   2. Invoke onDestroy.
     *                   3. Read the new state.
     * @tc.expected      The state changes from idle to destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDestroyLifecycleStateBecomesDestroyed', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      expect(service.state).assertEqual('idle');
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.state === 'idle').assertFalse();
      expect(service.state.startsWith('destroy')).assertTrue();
      expect(service.state.length).assertEqual('destroyed'.length);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.contains('onDestroy')).assertTrue();
    });

    /**
     * @tc.name          onDestroyLifecycleIsAliveBecomesFalse
     * @tc.desc          Liveness is the only state that reports false after destroy.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Confirm liveness before the call.
     *                   2. Invoke onDestroy.
     *                   3. Read liveness again.
     * @tc.expected      Liveness flips from true to false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDestroyLifecycleIsAliveBecomesFalse', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      expect(service.isAlive()).assertTrue();
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
      expect(service.isAlive() === true).assertFalse();
      expect(service.state).assertEqual('destroyed');
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleRecordsBareEvent
     * @tc.desc          The destroy entry is the bare constant without a detail.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDestroy.
     *                   2. Read the recorder entry.
     *                   3. Search for the colon separator.
     * @tc.expected      The entry equals onDestroy with no colon.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDestroyLifecycleRecordsBareEvent', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onDestroy();
      expect(service.events.entries[0]).assertEqual('onDestroy');
      expect(service.events.entries[0]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.entries[0].indexOf(':')).assertLess(0);
      expect(service.events.entries[0].length).assertEqual('onDestroy'.length);
      expect(service.events.trace()).assertEqual('onDestroy');
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleWritesInfoLog
     * @tc.desc          Destroy writes one info line.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDestroy.
     *                   2. Read the log buffer.
     *                   3. Count severity levels.
     * @tc.expected      One INFO onDestroy line and no warnings.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDestroyLifecycleWritesInfoLog', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.lines[0]).assertEqual('INFO onDestroy');
      expect(latestLine(service)).assertEqual('INFO onDestroy');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.logs.trace()).assertEqual('INFO onDestroy');
    });

    /**
     * @tc.name          onDestroyLifecycleKeepsStubReference
     * @tc.desc          Destroy never clears the previously bound stub field.
     * @tc.precondition  A connected model holds a bound stub.
     * @tc.steps         1. Connect and record the stub.
     *                   2. Invoke onDestroy.
     *                   3. Compare the stub field and stub status.
     * @tc.expected      The stub stays bound and alive after destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleKeepsStubReference', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      service.onDestroy();
      expect(service.stub === stub).assertTrue();
      expect(service.stub?.alive).assertTrue();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.connectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleKeepsConnectCounts
     * @tc.desc          Destroy leaves connect and disconnect counters unchanged.
     * @tc.precondition  A model has connected and disconnected.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Invoke onDestroy.
     *                   3. Compare both counters.
     * @tc.expected      Connect and disconnect counters stay at one each.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleKeepsConnectCounts', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          onDestroyLifecycleKeepsRequestCount
     * @tc.desc          Destroy leaves the lifecycle request counter unchanged.
     * @tc.precondition  A model has received three requests.
     * @tc.steps         1. Request three times.
     *                   2. Invoke onDestroy.
     *                   3. Compare the request total.
     * @tc.expected      The request counter stays at three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleKeepsRequestCount', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onRequest(1);
      service.onRequest(2);
      service.onRequest(3);
      service.onDestroy();
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.trace()).assertEqual(
        'onRequest:1>onRequest:2>onRequest:3>onDestroy');
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(4);
    });

    /**
     * @tc.name          onDestroyLifecycleSnapshotDescribe
     * @tc.desc          A destroyed snapshot reports the destroyed state and one destroy.
     * @tc.precondition  A created and destroyed model is available.
     * @tc.steps         1. Create and destroy.
     *                   2. Capture the snapshot.
     *                   3. Describe and split it.
     * @tc.expected      The describe text is destroyed/0/0/0/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleSnapshotDescribe', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      const snapshot: ServiceSnapshot = destroySnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/0/0/0/1');
      const fields: string[] = snapshot.describe().split('/');
      expect(fields.length).assertEqual(5);
      expect(fields[0]).assertEqual('destroyed');
      expect(fields[4]).assertEqual('1');
      expect(snapshot.sameAs(destroySnapshot(service))).assertTrue();
      expect(snapshot.connects).assertEqual(0);
    });

    /**
     * @tc.name          onDestroyLifecycleRepeatedDestroysCount
     * @tc.desc          Every destroy call adds one event and one counter unit.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDestroy three times.
     *                   2. Read counter, event and log sizes.
     *                   3. Read the trace.
     * @tc.expected      All three measures equal three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleRepeatedDestroysCount', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      destroyTimes(service, 3);
      expect(service.destroyCount).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(3);
      expect(service.events.trace()).assertEqual('onDestroy>onDestroy>onDestroy');
      expect(service.events.entries[0]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.entries[2]).assertEqual(EVENT_ON_DESTROY);
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDestroyLifecycleAfterCreateOnly
     * @tc.desc          Destroying a created but unconnected service still counts.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Invoke onCreate.
     *                   2. Invoke onDestroy.
     *                   3. Read counters and liveness.
     * @tc.expected      The destroy count is one and the service is not alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleAfterCreateOnly', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      expect(service.destroyCount).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy');
      expect(service.events.size()).assertEqual(2);
      expect(service.stub).assertUndefined();
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
      expect(service.logs.size()).assertEqual(2);
    });

    /**
     * @tc.name          onDestroyLifecycleFromIdleState
     * @tc.desc          Destroying an idle model needs no prior callbacks.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDestroy directly.
     *                   2. Read counters and containers.
     *                   3. Confirm no create event exists.
     * @tc.expected      The state is destroyed with no unrelated events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleFromIdleState', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.destroyCount).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual('onDestroy');
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          onDestroyLifecycleAfterDisconnect
     * @tc.desc          Destroy after disconnect appends the destroy event last.
     * @tc.precondition  A model has connected and disconnected.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Invoke onDestroy.
     *                   3. Read the trace tail.
     * @tc.expected      Disconnect precedes destroy and the service is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleAfterDisconnect', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.entries[1]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[2]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          onDestroyLifecycleFullWalkTrace
     * @tc.desc          A complete walk ends with the destroy event.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, connect, request, disconnect and destroy.
     *                   2. Read the trace.
     *                   3. Read the final counters.
     * @tc.expected      The trace holds the five callbacks in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleFullWalkTrace', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(4);
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.size()).assertEqual(5);
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:IPCStubTest>onRequest:4>onDisconnect>onDestroy');
      expect(service.events.entries[4]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.destroyCount).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(5);
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDestroyLifecycleResetRestoresAlive
     * @tc.desc          Reset returns a destroyed model to the alive idle state.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Read liveness before reset.
     *                   2. Invoke reset.
     *                   3. Read liveness and state.
     * @tc.expected      Liveness returns to true and state to idle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleResetRestoresAlive', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      expect(service.isAlive()).assertFalse();
      service.reset();
      expect(service.isAlive()).assertTrue();
      expect(service.state).assertEqual('idle');
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          onDestroyLifecycleResetClearsCounters
     * @tc.desc          Reset zeroes all lifecycle counters for a destroyed model.
     * @tc.precondition  A model has walked and been destroyed twice.
     * @tc.steps         1. Walk and destroy twice.
     *                   2. Invoke reset.
     *                   3. Read all counters.
     * @tc.expected      Every counter is zero after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDestroyLifecycleResetClearsCounters', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      service.onDestroy();
      expect(service.destroyCount).assertEqual(2);
      service.reset();
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name          onDestroyLifecycleStubStillUsable
     * @tc.desc          The retained stub still answers code one after destroy.
     * @tc.precondition  A model has connected and destroyed while retaining a stub.
     * @tc.steps         1. Connect and destroy.
     *                   2. Send a code-one message through the stub.
     *                   3. Inspect the reply and ledger.
     * @tc.expected      The request succeeds and the stub records it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleStubStillUsable', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      service.onDestroy();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(1, 'after-destroy');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual('after-destroy');
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleRecreateAfterDestroy
     * @tc.desc          onCreate after destroy restores the created state.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Invoke onCreate on the destroyed model.
     *                   2. Read state and liveness.
     *                   3. Read both event counts.
     * @tc.expected      The state is created and alive with two create events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleRecreateAfterDestroy', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      service.onCreate();
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy>onCreate');
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          onDestroyLifecycleEventKindSum
     * @tc.desc          Per-kind counts sum to the recorder size for a full walk.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Walk all five callbacks.
     *                   2. Sum the per-kind counts.
     *                   3. Compare with the recorder size.
     * @tc.expected      The sum equals five and destroy contributes one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleEventKindSum', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      const sum: number = service.events.countOf(EVENT_ON_CREATE) +
        service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DISCONNECT) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(sum).assertEqual(5);
      expect(sum).assertEqual(service.events.size());
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.entries.length).assertEqual(sum);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.fingerprint()).assertLarger(0);
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDestroyLifecycleLogCountMatches
     * @tc.desc          Log lines stay one-to-one with lifecycle events.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Walk create, connect and destroy.
     *                   2. Compare log and event sizes.
     *                   3. Count info lines.
     * @tc.expected      Both containers hold three info lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleLogCountMatches', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.lines[2]).assertEqual('INFO onDestroy');
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.logs.trace().split('|').length).assertEqual(3);
      expect(latestLine(service)).assertEqual('INFO onDestroy');
    });

    /**
     * @tc.name          onDestroyLifecycleFingerprintChangesPerCall
     * @tc.desc          Each destroy call changes the recorder fingerprint.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Read the empty fingerprint.
     *                   2. Destroy once and read again.
     *                   3. Destroy twice more and compare.
     * @tc.expected      All four fingerprints differ pairwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleFingerprintChangesPerCall', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const empty: number = service.events.fingerprint();
      service.onDestroy();
      const once: number = service.events.fingerprint();
      service.onDestroy();
      const twice: number = service.events.fingerprint();
      service.onDestroy();
      const thrice: number = service.events.fingerprint();
      expect(empty === once).assertFalse();
      expect(once === twice).assertFalse();
      expect(twice === thrice).assertFalse();
      expect(empty === thrice).assertFalse();
      expect(thrice).assertLarger(0);
      expect(service.events.size()).assertEqual(3);
      expect(service.destroyCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(3);
    });

    /**
     * @tc.name          onDestroyLifecycleManyDestroysLogTrim
     * @tc.desc          The bounded log keeps only the newest destroy lines.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Destroy 130 times.
     *                   2. Read the log size.
     *                   3. Inspect the retained first and last lines.
     * @tc.expected      Logs cap at 128 INFO onDestroy lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleManyDestroysLogTrim', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      destroyTimes(service, 130);
      expect(service.destroyCount).assertEqual(130);
      expect(service.events.size()).assertEqual(130);
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(service.logs.lines[0]).assertEqual('INFO onDestroy');
      expect(service.logs.lines[127]).assertEqual('INFO onDestroy');
      expect(service.logs.contains('WARN')).assertFalse();
      expect(service.logs.contains('ERROR')).assertFalse();
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleIndependentModels
     * @tc.desc          Destroy counters and recorders are per instance.
     * @tc.precondition  Two independent models are available.
     * @tc.steps         1. Destroy the first model twice.
     *                   2. Read the second model.
     *                   3. Destroy the second model once.
     * @tc.expected      The second model counts only its own destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleIndependentModels', 0, () => {
      const first: ServiceLifecycleModel = emptyModel();
      const second: ServiceLifecycleModel = emptyModel();
      destroyTimes(first, 2);
      expect(second.destroyCount).assertEqual(0);
      expect(second.events.size()).assertEqual(0);
      expect(second.isAlive()).assertTrue();
      expect(second.state).assertEqual('idle');
      second.onDestroy();
      expect(second.destroyCount).assertEqual(1);
      expect(first.destroyCount).assertEqual(2);
      expect(first.events.size()).assertEqual(2);
      expect(second.events.trace()).assertEqual('onDestroy');
      expect(first.events === second.events).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleSnapshotImmutable
     * @tc.desc          A captured snapshot stays destroyed after later resets.
     * @tc.precondition  A destroyed model and its snapshot are available.
     * @tc.steps         1. Capture the snapshot.
     *                   2. Reset the live model.
     *                   3. Re-read the snapshot fields.
     * @tc.expected      The snapshot still reports destroyed with one destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleSnapshotImmutable', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      const captured: ServiceSnapshot = destroySnapshot(service);
      const text: string = captured.describe();
      service.reset();
      expect(captured.state).assertEqual('destroyed');
      expect(captured.destroys).assertEqual(1);
      expect(captured.describe()).assertEqual(text);
      expect(captured.describe()).assertEqual('destroyed/0/0/0/1');
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(captured.sameAs(destroySnapshot(service))).assertFalse();
      expect(text.split('/')[0]).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDestroyLifecycleSecondDestroyKeepsState
     * @tc.desc          A second destroy does not change the state or liveness.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Read state and liveness.
     *                   2. Invoke onDestroy again.
     *                   3. Re-read state and liveness.
     * @tc.expected      State stays destroyed and liveness stays false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleSecondDestroyKeepsState', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      const stateBefore: string = service.state;
      service.onDestroy();
      expect(service.state).assertEqual(stateBefore);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(2);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.size()).assertEqual(3);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy>onDestroy');
    });

    /**
     * @tc.name          onDestroyLifecycleCounterAfterRecorderClear
     * @tc.desc          Clearing the recorder does not reset the destroy counter.
     * @tc.precondition  A model has destroyed once.
     * @tc.steps         1. Destroy once.
     *                   2. Clear the recorder.
     *                   3. Destroy again and read counters.
     * @tc.expected      The counter reaches two while the recorder holds one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleCounterAfterRecorderClear', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onDestroy();
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.destroyCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      service.onDestroy();
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual('onDestroy');
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.logs.size()).assertEqual(2);
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDestroyLifecycleLivenessMatrix
     * @tc.desc          Only destroyed models report a dead service.
     * @tc.precondition  Models at four lifecycle stages are available.
     * @tc.steps         1. Build idle, created, connected and destroyed models.
     *                   2. Read liveness for each.
     *                   3. Compare with the expected table.
     * @tc.expected      The first three are alive and only destroyed is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleLivenessMatrix', 0, () => {
      const idle: ServiceLifecycleModel = emptyModel();
      const created: ServiceLifecycleModel = emptyModel();
      created.onCreate();
      const connected: ServiceLifecycleModel = emptyModel();
      connected.onCreate();
      connected.onConnect();
      const destroyed: ServiceLifecycleModel = destroyedModel();
      expect(idle.isAlive()).assertTrue();
      expect(created.isAlive()).assertTrue();
      expect(connected.isAlive()).assertTrue();
      expect(destroyed.isAlive()).assertFalse();
      expect(idle.state).assertEqual('idle');
      expect(created.state).assertEqual('created');
      expect(connected.state).assertEqual('connected');
      expect(destroyed.state).assertEqual('destroyed');
      expect(destroyed.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleJoinedTrace
     * @tc.desc          The trace equals the expected constants joined by arrows.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Walk create, request and destroy.
     *                   2. Join the expected entries.
     *                   3. Compare with the recorder trace.
     * @tc.expected      The joined expectation equals the trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleJoinedTrace', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onRequest(6);
      service.onDestroy();
      const expected: string = joined([EVENT_ON_CREATE, 'onRequest:6', EVENT_ON_DESTROY], '>');
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.trace()).assertEqual('onCreate>onRequest:6>onDestroy');
      expect(service.events.entries[0] + '>' + service.events.entries[1] + '>' +
        service.events.entries[2]).assertEqual(expected);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.requestCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.events.fingerprint()).assertEqual(service.events.fingerprint());
    });

    /**
     * @tc.name          onDestroyLifecycleStubMetricsPreserved
     * @tc.desc          Destroy does not alter stub request metrics.
     * @tc.precondition  A connected stub has served two requests.
     * @tc.steps         1. Send two code-one requests.
     *                   2. Destroy the service.
     *                   3. Compare metrics before and after.
     * @tc.expected      Metrics keep two handled requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleStubMetricsPreserved', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(1, 'a');
      client.send(1, 'b');
      const before: StubMetrics = StubMetrics.from(stub);
      service.onDestroy();
      const after: StubMetrics = StubMetrics.from(stub);
      expect(after.requests).assertEqual(before.requests);
      expect(after.requests).assertEqual(2);
      expect(after.handled).assertEqual(2);
      expect(after.rejected).assertEqual(0);
      expect(after.fingerprint()).assertEqual(before.fingerprint());
      expect(stub.alive).assertTrue();
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleClientAfterDestroy
     * @tc.desc          Client traffic after destroy still updates the stub ledger.
     * @tc.precondition  A destroyed model retains its stub.
     * @tc.steps         1. Destroy the service.
     *                   2. Send two requests through the retained stub.
     *                   3. Read the client ledger and service state.
     * @tc.expected      The ledger grows while the service stays destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleClientAfterDestroy', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      service.onDestroy();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(1, 'x');
      client.send(2, 'y');
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.sentCodes[0]).assertEqual(1);
      expect(client.sentCodes[1]).assertEqual(2);
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.results[1].isSuccess()).assertFalse();
      expect(client.stub.requestCount()).assertEqual(2);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleSnapshotAfterTwoDestroys
     * @tc.desc          A snapshot after two destroys reports two destroy events.
     * @tc.precondition  A model has been destroyed twice.
     * @tc.steps         1. Create and destroy twice.
     *                   2. Capture the snapshot.
     *                   3. Describe and split it.
     * @tc.expected      The describe text is destroyed/0/0/0/2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleSnapshotAfterTwoDestroys', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onDestroy();
      service.onDestroy();
      const snapshot: ServiceSnapshot = destroySnapshot(service);
      expect(snapshot.destroys).assertEqual(2);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.describe()).assertEqual('destroyed/0/0/0/2');
      expect(snapshot.describe().split('/')[4]).assertEqual('2');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.size()).assertEqual(3);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleDestroyThenRequest
     * @tc.desc          A request after destroy is appended after the destroy event.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Destroy the model.
     *                   2. Invoke onRequest with startId 88.
     *                   3. Read the trace and counters.
     * @tc.expected      The request follows destroy and liveness stays false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleDestroyThenRequest', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      service.onRequest(88);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy>onRequest:88');
      expect(service.events.last()).assertEqual('onRequest:88');
      expect(service.events.entries[1]).assertEqual(EVENT_ON_DESTROY);
      expect(service.requestCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          onDestroyLifecycleDestroyThenDisconnectRevives
     * @tc.desc          A disconnect after destroy returns the model to alive.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Destroy the model.
     *                   2. Invoke onDisconnect.
     *                   3. Read state, liveness and counters.
     * @tc.expected      The state is disconnected and liveness is true again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleDestroyThenDisconnectRevives', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      expect(service.isAlive()).assertFalse();
      service.onDisconnect();
      expect(service.isAlive()).assertTrue();
      expect(service.state).assertEqual('disconnected');
      expect(service.destroyCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy>onDisconnect');
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          onDestroyLifecycleStateStringShape
     * @tc.desc          The destroyed state string has the exact expected shape.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Read the state string.
     *                   2. Measure its length and prefix.
     *                   3. Check the suffix.
     * @tc.expected      The state is destroyed with the correct bounds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleStateStringShape', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      expect(service.state.length).assertEqual(9);
      expect(service.state.startsWith('destr')).assertTrue();
      expect(service.state.endsWith('oyed')).assertTrue();
      expect(service.state).assertEqual('destroyed');
      expect(service.state.indexOf('roy')).assertLarger(0);
      expect(service.state === 'destroy').assertFalse();
      expect(service.state === 'destroyed').assertTrue();
      expect(service.isAlive()).assertFalse();
      expect(service.state.charAt(0)).assertEqual('d');
    });

    /**
     * @tc.name          onDestroyLifecycleTraceTailAfterRecreate
     * @tc.desc          Re-creation after destroy moves the tail off destroy.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Destroy the model.
     *                   2. Invoke onCreate again.
     *                   3. Read the trace tail and counts.
     * @tc.expected      The last event is create while destroy remains once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleTraceTailAfterRecreate', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      service.onCreate();
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.size()).assertEqual(3);
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.events.trace().endsWith('onCreate')).assertTrue();
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleResetThenDestroyMatchesFresh
     * @tc.desc          Reset then destroy matches a fresh destroy-only walk.
     * @tc.precondition  A model with prior activity is available.
     * @tc.steps         1. Walk several callbacks.
     *                   2. Reset and destroy.
     *                   3. Compare with a fresh destroyed model.
     * @tc.expected      Trace, snapshot and counters match the fresh walk.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleResetThenDestroyMatchesFresh', 0, () => {
      const reused: ServiceLifecycleModel = emptyModel();
      reused.onCreate();
      reused.onConnect();
      reused.onRequest(1);
      reused.onDisconnect();
      reused.reset();
      reused.onDestroy();
      const fresh: ServiceLifecycleModel = emptyModel();
      fresh.onDestroy();
      expect(reused.events.trace()).assertEqual(fresh.events.trace());
      expect(reused.events.fingerprint()).assertEqual(fresh.events.fingerprint());
      expect(reused.logs.trace()).assertEqual(fresh.logs.trace());
      expect(destroySnapshot(reused).describe()).assertEqual(destroySnapshot(fresh).describe());
      expect(reused.state).assertEqual(fresh.state);
      expect(reused.destroyCount).assertEqual(fresh.destroyCount);
      expect(reused.isAlive()).assertEqual(fresh.isAlive());
      expect(reused.events.size()).assertEqual(fresh.events.size());
    });

    /**
     * @tc.name          onDestroyLifecycleLogEventDivergence
     * @tc.desc          Clearing events leaves destroy log lines intact.
     * @tc.precondition  A model has destroyed twice.
     * @tc.steps         1. Destroy twice.
     *                   2. Clear the recorder only.
     *                   3. Compare log and event sizes.
     * @tc.expected      Logs hold two lines while events are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     */
    it('onDestroyLifecycleLogEventDivergence', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      destroyTimes(service, 2);
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.trace()).assertEqual('INFO onDestroy|INFO onDestroy');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.trace()).assertEqual('');
      expect(service.isAlive()).assertFalse();
      expect(service.logs.contains('onDestroy')).assertTrue();
    });

    /**
     * @tc.name          onDestroyLifecycleSnapshotDestroyFields
     * @tc.desc          A destroyed snapshot zeroes every non-destroy counter.
     * @tc.precondition  A fresh model has been destroyed without other callbacks.
     * @tc.steps         1. Destroy the fresh model.
     *                   2. Capture the snapshot.
     *                   3. Read all five fields.
     * @tc.expected      Only the state and destroy fields are non-zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleSnapshotDestroyFields', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onDestroy();
      const snapshot: ServiceSnapshot = destroySnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/0/0/0/1');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.sameAs(destroySnapshot(service))).assertTrue();
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          onDestroyLifecycleStubKillThenDestroy
     * @tc.desc          Destroying after killing the stub keeps the dead stub bound.
     * @tc.precondition  A connected model holds a stub.
     * @tc.steps         1. Kill the stub.
     *                   2. Invoke onDestroy.
     *                   3. Read the stub status and counters.
     * @tc.expected      The stub stays bound and dead while destroy is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleStubKillThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      stub.kill();
      service.onDestroy();
      expect(stub.alive).assertFalse();
      expect(service.stub === stub).assertTrue();
      expect(service.destroyCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onDestroy');
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          onDestroyLifecycleCountAfterLogClear
     * @tc.desc          Clearing logs does not reset the destroy counter.
     * @tc.precondition  A model has destroyed once.
     * @tc.steps         1. Destroy once.
     *                   2. Clear the log buffer.
     *                   3. Destroy again and read sizes.
     * @tc.expected      The counter is two and logs hold one line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleCountAfterLogClear', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onDestroy();
      service.logs.clear();
      expect(service.logs.size()).assertEqual(0);
      expect(service.destroyCount).assertEqual(1);
      service.onDestroy();
      expect(service.destroyCount).assertEqual(2);
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.lines[0]).assertEqual('INFO onDestroy');
      expect(service.events.size()).assertEqual(2);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleRequestTotalPreserved
     * @tc.desc          The request total survives destroy without reset.
     * @tc.precondition  A model has received two requests.
     * @tc.steps         1. Request twice.
     *                   2. Destroy the model.
     *                   3. Read request counters.
     * @tc.expected      The request total remains two after destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleRequestTotalPreserved', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onRequest(1);
      service.onRequest(2);
      service.onDestroy();
      expect(service.requestCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.trace()).assertEqual('onRequest:1>onRequest:2>onDestroy');
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.requestCount).assertEqual(2);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          onDestroyLifecycleChainedPhases
     * @tc.desc          Two connects, two requests and a destroy form one trace.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect twice and request twice.
     *                   2. Destroy the model.
     *                   3. Read the trace and counters.
     * @tc.expected      The trace holds five entries ending with destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleChainedPhases', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onConnect();
      service.onConnect();
      service.onRequest(1);
      service.onRequest(2);
      service.onDestroy();
      expect(service.events.size()).assertEqual(5);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onConnect:IPCStubTest>onRequest:1>onRequest:2>onDestroy');
      expect(service.connectCount).assertEqual(2);
      expect(service.requestCount).assertEqual(2);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.isAlive()).assertFalse();
      expect(destroySnapshot(service).describe()).assertEqual('destroyed/2/0/2/1');
      expect(service.logs.size()).assertEqual(5);
    });

    /**
     * @tc.name          onDestroyLifecycleSnapshotCounterAlignment
     * @tc.desc          Snapshot fields match live counters after destroy.
     * @tc.precondition  A model has connected, requested and been destroyed.
     * @tc.steps         1. Walk connect, request and destroy.
     *                   2. Capture the snapshot.
     *                   3. Compare each field.
     * @tc.expected      Every field equals its live counterpart.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleSnapshotCounterAlignment', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onConnect();
      service.onRequest(1);
      service.onDestroy();
      const snapshot: ServiceSnapshot = destroySnapshot(service);
      expect(snapshot.state).assertEqual(service.state);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.destroys).assertEqual(service.destroyCount);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.sameAs(destroySnapshot(service))).assertTrue();
      expect(snapshot.describe()).assertEqual('destroyed/1/0/1/1');
    });

    /**
     * @tc.name          onDestroyLifecycleFinalFingerprintStable
     * @tc.desc          The same destroy walk yields the same final fingerprint.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Walk create then destroy on both models.
     *                   2. Compare fingerprints.
     *                   3. Compare traces and logs.
     * @tc.expected      Both models are observationally identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleFinalFingerprintStable', 0, () => {
      const first: ServiceLifecycleModel = destroyedModel();
      const second: ServiceLifecycleModel = destroyedModel();
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.trace()).assertEqual('onCreate>onDestroy');
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.destroyCount).assertEqual(second.destroyCount);
      expect(destroySnapshot(first).describe()).assertEqual(destroySnapshot(second).describe());
      expect(first.isAlive()).assertEqual(second.isAlive());
      expect(first.isAlive()).assertFalse();
      expect(second.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          onDestroyLifecycleRepeatedResetDeterministic
     * @tc.desc          Three reset-destroy cycles produce the same observations.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three reset-destroy cycles.
     *                   2. Capture the trace per cycle.
     *                   3. Compare them and the snapshot.
     * @tc.expected      Every cycle yields the single onDestroy trace and dead state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleRepeatedResetDeterministic', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const traces: string[] = [];
      for (let cycle = 0; cycle < 3; cycle++) {
        service.reset();
        service.onDestroy();
        traces.push(service.events.trace());
      }
      expect(traces.length).assertEqual(3);
      expect(traces[0]).assertEqual('onDestroy');
      expect(traces[1]).assertEqual('onDestroy');
      expect(traces[2]).assertEqual('onDestroy');
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleLastEntryDestroy
     * @tc.desc          Destroy is always the final entry of a completed walk.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Walk create, connect, request, disconnect and destroy.
     *                   2. Read the final entry position.
     *                   3. Compare the trace tail.
     * @tc.expected      The last entry is onDestroy and nothing follows it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleLastEntryDestroy', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(3);
      service.onDisconnect();
      service.onDestroy();
      const size: number = service.events.size();
      expect(service.events.entries[size - 1]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.trace().endsWith('onDestroy')).assertTrue();
      expect(service.events.entries[size - 2]).assertEqual(EVENT_ON_DISCONNECT);
      expect(size).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(5);
    });

    /**
     * @tc.name          onDestroyLifecycleObservationSummary
     * @tc.desc          A full destroy observation is internally consistent.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, connect, request and destroy.
     *                   2. Capture the snapshot.
     *                   3. Cross-check trace, logs and counters.
     * @tc.expected      All observations agree on one destroy and a dead service.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleObservationSummary', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(2);
      service.onDestroy();
      const snapshot: ServiceSnapshot = destroySnapshot(service);
      expect(snapshot.destroys).assertEqual(service.destroyCount);
      expect(snapshot.describe()).assertEqual('destroyed/1/0/1/1');
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.events.trace().split('>').length).assertEqual(4);
      expect(service.logs.trace().split('|').length).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDestroyLifecycleStubResetAfterDestroy
     * @tc.desc          The retained stub can be reset after the service is destroyed.
     * @tc.precondition  A destroyed service retains a stub with one request.
     * @tc.steps         1. Send one request and destroy the service.
     *                   2. Reset the retained stub.
     *                   3. Read the stub ledger and descriptor.
     * @tc.expected      The ledger is empty while the descriptor and service state hold.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleStubResetAfterDestroy', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      new InProcessClient(stub).send(1, 'before-reset');
      service.onDestroy();
      expect(stub.requestCount()).assertEqual(1);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.alive).assertTrue();
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleEventSizeAfterResetThenWalk
     * @tc.desc          Reset then a full walk yields exactly five events.
     * @tc.precondition  A model has prior destroy activity.
     * @tc.steps         1. Destroy several times.
     *                   2. Reset.
     *                   3. Walk all five callbacks.
     * @tc.expected      The recorder holds five entries after the reset walk.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleEventSizeAfterResetThenWalk', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      destroyTimes(service, 3);
      service.reset();
      service.onCreate();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.size()).assertEqual(5);
      expect(service.logs.size()).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:IPCStubTest>onRequest:1>onDisconnect>onDestroy');
      expect(service.destroyCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.events.entries[4]).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDestroyLifecycleFingerprintPerModel
     * @tc.desc          Different destroy counts produce different fingerprints.
     * @tc.precondition  Two independent models are available.
     * @tc.steps         1. Destroy the first model once.
     *                   2. Destroy the second model twice.
     *                   3. Compare fingerprints and traces.
     * @tc.expected      The fingerprints and traces differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleFingerprintPerModel', 0, () => {
      const once: ServiceLifecycleModel = emptyModel();
      const twice: ServiceLifecycleModel = emptyModel();
      once.onDestroy();
      destroyTimes(twice, 2);
      expect(once.events.trace()).assertEqual('onDestroy');
      expect(twice.events.trace()).assertEqual('onDestroy>onDestroy');
      expect(once.events.trace() === twice.events.trace()).assertFalse();
      expect(once.events.fingerprint() === twice.events.fingerprint()).assertFalse();
      expect(once.events.size()).assertEqual(1);
      expect(twice.events.size()).assertEqual(2);
      expect(once.destroyCount).assertEqual(1);
      expect(twice.destroyCount).assertEqual(2);
      expect(once.logs.size()).assertEqual(1);
      expect(twice.logs.size()).assertEqual(2);
    });

    /**
     * @tc.name          onDestroyLifecycleCountExactlyFive
     * @tc.desc          Five destroys are counted without drift.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Destroy five times.
     *                   2. Read the counter and sizes.
     *                   3. Read the trace segment count.
     * @tc.expected      Counter, event size and trace segments all equal five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleCountExactlyFive', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      destroyTimes(service, 5);
      expect(service.destroyCount).assertEqual(5);
      expect(service.events.size()).assertEqual(5);
      expect(service.logs.size()).assertEqual(5);
      expect(service.events.trace().split('>').length).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(5);
      expect(service.events.entries[4]).assertEqual(EVENT_ON_DESTROY);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          onDestroyLifecycleSnapshotBeforeDestroy
     * @tc.desc          A snapshot before destroy still reports connected.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect and capture a snapshot.
     *                   2. Destroy the live model.
     *                   3. Re-read the captured snapshot.
     * @tc.expected      The captured snapshot remains connected with zero destroys.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleSnapshotBeforeDestroy', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onConnect();
      const captured: ServiceSnapshot = destroySnapshot(service);
      service.onDestroy();
      expect(captured.state).assertEqual('connected');
      expect(captured.destroys).assertEqual(0);
      expect(captured.describe()).assertEqual('connected/1/0/0/0');
      expect(captured.connects).assertEqual(1);
      expect(service.state).assertEqual('destroyed');
      expect(captured.sameAs(destroySnapshot(service))).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(captured.requests).assertEqual(0);
      expect(captured.disconnects).assertEqual(0);
    });

    /**
     * @tc.name          onDestroyLifecycleSnapshotAfterRecreateCycle
     * @tc.desc          A re-created and re-destroyed service accumulates destroy totals.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Re-create, connect and request.
     *                   2. Capture the live snapshot.
     *                   3. Disconnect, destroy and capture again.
     * @tc.expected      The final snapshot reports two destroys and one disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleSnapshotAfterRecreateCycle', 0, () => {
      const service: ServiceLifecycleModel = destroyedModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(4);
      const live: ServiceSnapshot = destroySnapshot(service);
      service.onDisconnect();
      service.onDestroy();
      const dead: ServiceSnapshot = destroySnapshot(service);
      expect(live.state).assertEqual('connected');
      expect(live.connects).assertEqual(1);
      expect(live.requests).assertEqual(1);
      expect(live.destroys).assertEqual(1);
      expect(dead.state).assertEqual('destroyed');
      expect(dead.disconnects).assertEqual(1);
      expect(dead.destroys).assertEqual(2);
      expect(dead.sameAs(live)).assertFalse();
      expect(dead.describe()).assertEqual('destroyed/1/1/1/2');
      expect(service.events.size()).assertEqual(7);
    });

    /**
     * @tc.name          onDestroyLifecycleDestroyCountAudit
     * @tc.desc          The final destroy audit confirms every counter survives.
     * @tc.precondition  A model has been destroyed twice with prior history.
     * @tc.steps         1. Create, connect and destroy twice.
     *                   2. Capture the snapshot.
     *                   3. Audit counters and container sizes.
     * @tc.expected      The destroy total is two and all other totals hold.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDestroyLifecycleDestroyCountAudit', 0, () => {
      const service: ServiceLifecycleModel = emptyModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      service.onDestroy();
      const snapshot: ServiceSnapshot = destroySnapshot(service);
      expect(snapshot.destroys).assertEqual(2);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/0/0/2');
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.isAlive()).assertFalse();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });
  });
}
