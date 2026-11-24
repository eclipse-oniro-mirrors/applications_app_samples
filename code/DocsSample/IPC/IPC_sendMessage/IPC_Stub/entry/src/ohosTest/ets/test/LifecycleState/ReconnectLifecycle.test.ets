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

function baseModel(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function runCycle(service: ServiceLifecycleModel): StubRemoteObjectModel {
  const stub = service.onConnect();
  service.onDisconnect();
  return stub;
}

function runCycles(service: ServiceLifecycleModel, count: number): StubRemoteObjectModel[] {
  const stubs: StubRemoteObjectModel[] = [];
  for (let index = 0; index < count; index++) {
    stubs.push(runCycle(service));
  }
  return stubs;
}

function cycleSnapshot(service: ServiceLifecycleModel): ServiceSnapshot {
  return new ServiceSnapshot(service);
}

function tailLine(service: ServiceLifecycleModel): string {
  return service.logs.lines[service.logs.size() - 1];
}

export default function reconnectLifecycle(): void {
  describe('ReconnectLifecycle', () => {
    beforeAll(() => {
      logSuite('ReconnectLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ReconnectLifecycle', 'end');
    });

    /**
     * @tc.name          reconnectLifecycleFirstCycleBindsStub
     * @tc.desc          The first connect-disconnect cycle binds and retains a stub.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run one connect-disconnect cycle.
     *                   2. Read the returned stub.
     *                   3. Read the bound stub field.
     * @tc.expected      The returned and bound stubs are the same live object.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectLifecycleFirstCycleBindsStub', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const stub: StubRemoteObjectModel = runCycle(service);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.alive).assertTrue();
      expect(service.stub === stub).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.size()).assertEqual(2);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleSecondConnectCreatesNewStub
     * @tc.desc          Reconnecting constructs a fresh stub instance.
     * @tc.precondition  A model has completed one cycle.
     * @tc.steps         1. Run one cycle and record the stub.
     *                   2. Connect again.
     *                   3. Compare the two stub references.
     * @tc.expected      The new stub is a different object with the same descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('reconnectLifecycleSecondConnectCreatesNewStub', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const first: StubRemoteObjectModel = runCycle(service);
      const second: StubRemoteObjectModel = service.onConnect();
      expect(first === second).assertFalse();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(first.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(second.alive).assertTrue();
      expect(service.stub === second).assertTrue();
      expect(service.connectCount).assertEqual(2);
      expect(service.state).assertEqual('connected');
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          reconnectLifecycleCycleCountsPairs
     * @tc.desc          Each full cycle adds one connect and one disconnect.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three full cycles.
     *                   2. Read both cycle counters.
     *                   3. Read the recorder size.
     * @tc.expected      Both counters equal three and the recorder holds six entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectLifecycleCycleCountsPairs', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const stubs: StubRemoteObjectModel[] = runCycles(service, 3);
      expect(stubs.length).assertEqual(3);
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
      expect(service.connectCount).assertEqual(service.disconnectCount);
      expect(service.events.size()).assertEqual(6);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleStateAfterReconnect
     * @tc.desc          Connecting again after a cycle restores the connected state.
     * @tc.precondition  A model has completed one cycle.
     * @tc.steps         1. Run one cycle.
     *                   2. Connect again.
     *                   3. Read the state and liveness.
     * @tc.expected      The state returns to connected and the service is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectLifecycleStateAfterReconnect', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycle(service);
      expect(service.state).assertEqual('disconnected');
      service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.state === 'disconnected').assertFalse();
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.logs.lines[2]).assertEqual('INFO onConnect');
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          reconnectLifecycleTraceOrder
     * @tc.desc          Two cycles place callbacks in connect-disconnect order.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles.
     *                   2. Read entries by index.
     *                   3. Compare the trace.
     * @tc.expected      The trace alternates connect and disconnect four times.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectLifecycleTraceOrder', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest>onDisconnect');
      expect(service.events.entries[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[1]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[2]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.logs.size()).assertEqual(4);
      expect(service.events.trace().split('>').length).assertEqual(4);
    });

    /**
     * @tc.name          reconnectLifecycleStubAfterReconnectHandlesCodeOne
     * @tc.desc          The stub from the latest reconnect answers code one.
     * @tc.precondition  A model has completed one cycle and reconnected.
     * @tc.steps         1. Run one cycle.
     *                   2. Reconnect and wrap the stub in a client.
     *                   3. Send code one.
     * @tc.expected      The request succeeds with the production reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectLifecycleStubAfterReconnectHandlesCodeOne', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycle(service);
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(1, 'reconnect');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.errCode).assertEqual(0);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.text).assertEqual('reconnect');
      expect(service.connectCount).assertEqual(2);
      expect(service.state).assertEqual('connected');
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          reconnectLifecycleOldStubIndependentLedger
     * @tc.desc          The pre-reconnect stub keeps its own request ledger.
     * @tc.precondition  A model has completed one cycle.
     * @tc.steps         1. Send one request through the old stub.
     *                   2. Reconnect and send one through the new stub.
     *                   3. Compare ledgers.
     * @tc.expected      Each stub records exactly its own request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectLifecycleOldStubIndependentLedger', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const oldStub: StubRemoteObjectModel = runCycle(service);
      new InProcessClient(oldStub).send(1, 'old');
      const newStub: StubRemoteObjectModel = service.onConnect();
      new InProcessClient(newStub).send(1, 'new');
      expect(oldStub.requestCount()).assertEqual(1);
      expect(newStub.requestCount()).assertEqual(1);
      expect(oldStub.lastRequest()?.text).assertEqual('old');
      expect(newStub.lastRequest()?.text).assertEqual('new');
      expect(oldStub === newStub).assertFalse();
      expect(oldStub.alive).assertTrue();
      expect(newStub.alive).assertTrue();
      expect(service.stub === newStub).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleSnapshotAfterTwoCycles
     * @tc.desc          A two-cycle snapshot describes two connects and two disconnects.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles.
     *                   2. Capture the snapshot.
     *                   3. Describe and split it.
     * @tc.expected      The describe text is disconnected/2/2/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('reconnectLifecycleSnapshotAfterTwoCycles', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      const snapshot: ServiceSnapshot = cycleSnapshot(service);
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(2);
      expect(snapshot.describe()).assertEqual('disconnected/2/2/0/0');
      const fields: string[] = snapshot.describe().split('/');
      expect(fields[1]).assertEqual('2');
      expect(fields[2]).assertEqual('2');
      expect(snapshot.sameAs(cycleSnapshot(service))).assertTrue();
      expect(snapshot.requests).assertEqual(0);
    });

    /**
     * @tc.name          reconnectLifecycleThreeCyclesTrace
     * @tc.desc          Three cycles produce a six-entry alternating trace.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three cycles.
     *                   2. Read the trace.
     *                   3. Count segments and entries.
     * @tc.expected      The trace alternates three connect and three disconnect entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleThreeCyclesTrace', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 3);
      const segments: string[] = service.events.trace().split('>');
      expect(segments.length).assertEqual(6);
      expect(segments[0]).assertEqual('onConnect:IPCStubTest');
      expect(segments[1]).assertEqual('onDisconnect');
      expect(segments[4]).assertEqual('onConnect:IPCStubTest');
      expect(segments[5]).assertEqual('onDisconnect');
      expect(service.events.size()).assertEqual(6);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          reconnectLifecycleCounterEqualsCycleCount
     * @tc.desc          Both cycle counters equal the number of executed cycles.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run four cycles.
     *                   2. Read both counters.
     *                   3. Compare with the stub array length.
     * @tc.expected      Connect and disconnect counters both equal four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCounterEqualsCycleCount', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const stubs: StubRemoteObjectModel[] = runCycles(service, 4);
      expect(stubs.length).assertEqual(4);
      expect(service.connectCount).assertEqual(stubs.length);
      expect(service.disconnectCount).assertEqual(stubs.length);
      expect(service.connectCount).assertEqual(4);
      expect(service.disconnectCount).assertEqual(4);
      expect(service.events.size()).assertEqual(8);
      expect(service.logs.size()).assertEqual(8);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(4);
    });

    /**
     * @tc.name          reconnectLifecycleRequestTotalAcrossCycles
     * @tc.desc          Requests between cycles accumulate without reset.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles with one request between them.
     *                   2. Read the request total.
     *                   3. Read the trace order.
     * @tc.expected      The request total is two and cycles surround the requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleRequestTotalAcrossCycles', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycle(service);
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      service.onRequest(2);
      expect(service.requestCount).assertEqual(2);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.size()).assertEqual(6);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onRequest:1>onConnect:IPCStubTest>onDisconnect>onRequest:2');
      expect(service.events.last()).assertEqual('onRequest:2');
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          reconnectLifecyclePreservesDestroyCount
     * @tc.desc          Reconnecting does not clear the destroy counter.
     * @tc.precondition  A model has been destroyed once.
     * @tc.steps         1. Destroy the model.
     *                   2. Run one connect-disconnect cycle.
     *                   3. Read the destroy count and state.
     * @tc.expected      Destroy stays one while the cycle counters grow.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecyclePreservesDestroyCount', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      service.onDestroy();
      runCycle(service);
      expect(service.destroyCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
      expect(service.events.trace()).assertEqual(
        'onDestroy>onConnect:IPCStubTest>onDisconnect');
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          reconnectLifecycleAfterDestroyConnect
     * @tc.desc          Connecting after destroy produces a live stub and a dead history.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Destroy the model.
     *                   2. Connect again.
     *                   3. Read state, stub and counters.
     * @tc.expected      The state is connected, alive and the destroy count holds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleAfterDestroyConnect', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      service.onDestroy();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.destroyCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.logs.lines[1]).assertEqual('INFO onConnect');
    });

    /**
     * @tc.name          reconnectLifecycleResetThenCycleMatchesFresh
     * @tc.desc          A post-reset cycle matches a fresh single cycle.
     * @tc.precondition  A model with prior cycles is available.
     * @tc.steps         1. Run extra cycles.
     *                   2. Reset and run one cycle.
     *                   3. Compare with a fresh cycle.
     * @tc.expected      Trace, snapshot and counters match the fresh model.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleResetThenCycleMatchesFresh', 0, () => {
      const reused: ServiceLifecycleModel = baseModel();
      runCycles(reused, 3);
      reused.reset();
      runCycle(reused);
      const fresh: ServiceLifecycleModel = baseModel();
      runCycle(fresh);
      expect(reused.events.trace()).assertEqual(fresh.events.trace());
      expect(reused.events.fingerprint()).assertEqual(fresh.events.fingerprint());
      expect(reused.logs.trace()).assertEqual(fresh.logs.trace());
      expect(cycleSnapshot(reused).describe()).assertEqual(cycleSnapshot(fresh).describe());
      expect(reused.connectCount).assertEqual(fresh.connectCount);
      expect(reused.disconnectCount).assertEqual(fresh.disconnectCount);
      expect(reused.events.size()).assertEqual(fresh.events.size());
      expect(reused.state).assertEqual(fresh.state);
    });

    /**
     * @tc.name          reconnectLifecycleStubFieldPointsToNewest
     * @tc.desc          After several cycles the stub field holds the newest stub.
     * @tc.precondition  A model has run three cycles.
     * @tc.steps         1. Run three cycles, recording each stub.
     *                   2. Connect a fourth time.
     *                   3. Compare the field with every stub.
     * @tc.expected      The field equals only the newest stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleStubFieldPointsToNewest', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const stubs: StubRemoteObjectModel[] = runCycles(service, 3);
      const newest: StubRemoteObjectModel = service.onConnect();
      expect(service.stub === newest).assertTrue();
      expect(service.stub === stubs[0]).assertFalse();
      expect(service.stub === stubs[1]).assertFalse();
      expect(service.stub === stubs[2]).assertFalse();
      expect(stubs[0] === stubs[1]).assertFalse();
      expect(stubs[1] === stubs[2]).assertFalse();
      expect(service.connectCount).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(4);
      expect(service.events.size()).assertEqual(7);
    });

    /**
     * @tc.name          reconnectLifecycleLogCountPerCycle
     * @tc.desc          Each cycle writes exactly two info log lines.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three cycles.
     *                   2. Read the log size.
     *                   3. Count info and warning lines.
     * @tc.expected      Six info lines and no warnings or errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleLogCountPerCycle', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 3);
      expect(service.logs.size()).assertEqual(6);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(6);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.lines[0]).assertEqual('INFO onConnect');
      expect(service.logs.lines[1]).assertEqual('INFO onDisconnect');
      expect(service.logs.lines[5]).assertEqual('INFO onDisconnect');
      expect(tailLine(service)).assertEqual('INFO onDisconnect');
    });

    /**
     * @tc.name          reconnectLifecycleFingerprintPerCycle
     * @tc.desc          Every completed cycle changes the recorder fingerprint.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Read the empty fingerprint.
     *                   2. Run one cycle and read it.
     *                   3. Run a second cycle and compare.
     * @tc.expected      The three fingerprints differ pairwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleFingerprintPerCycle', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const empty: number = service.events.fingerprint();
      runCycle(service);
      const first: number = service.events.fingerprint();
      runCycle(service);
      const second: number = service.events.fingerprint();
      expect(empty === first).assertFalse();
      expect(first === second).assertFalse();
      expect(empty === second).assertFalse();
      expect(first).assertLarger(0);
      expect(second).assertLarger(0);
      expect(service.events.size()).assertEqual(4);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.trace().split('>').length).assertEqual(4);
    });

    /**
     * @tc.name          reconnectLifecycleAlternatingPattern
     * @tc.desc          The trace strictly alternates connect and disconnect entries.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run four cycles.
     *                   2. Walk entries at even positions.
     *                   3. Walk entries at odd positions.
     * @tc.expected      Even positions are connects and odd positions disconnects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleAlternatingPattern', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 4);
      for (let index = 0; index < service.events.size(); index++) {
        const entry: string = service.events.entries[index];
        if (index % 2 === 0) {
          expect(entry.startsWith(EVENT_ON_CONNECT)).assertTrue();
          expect(entry).assertEqual('onConnect:IPCStubTest');
        } else {
          expect(entry).assertEqual(EVENT_ON_DISCONNECT);
        }
      }
      expect(service.events.size()).assertEqual(8);
      expect(service.events.entries[6]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[7]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.connectCount).assertEqual(4);
      expect(service.disconnectCount).assertEqual(4);
    });

    /**
     * @tc.name          reconnectLifecycleEachCycleFreshClient
     * @tc.desc          A client per cycle talks only to that cycle stub.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles, recording both stubs.
     *                   2. Send one request per stub through separate clients.
     *                   3. Compare ledgers and replies.
     * @tc.expected      Each stub holds one request and replies with hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleEachCycleFreshClient', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const first: StubRemoteObjectModel = runCycle(service);
      const second: StubRemoteObjectModel = runCycle(service);
      const firstClient: InProcessClient = new InProcessClient(first);
      const secondClient: InProcessClient = new InProcessClient(second);
      const firstResult = firstClient.send(1, 'one');
      const secondResult = secondClient.send(1, 'two');
      expect(firstResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(secondResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.requestCount()).assertEqual(1);
      expect(second.requestCount()).assertEqual(1);
      expect(firstClient.sentTexts[0]).assertEqual('one');
      expect(secondClient.sentTexts[0]).assertEqual('two');
      expect(service.connectCount).assertEqual(2);
      expect(service.requestCount).assertEqual(0);
    });

    /**
     * @tc.name          reconnectLifecycleIndependentModels
     * @tc.desc          Cycle counters and stubs are isolated between models.
     * @tc.precondition  Two independent models are available.
     * @tc.steps         1. Run two cycles on the first model.
     *                   2. Read the second model.
     *                   3. Run one cycle on the second model.
     * @tc.expected      The second model counts only its own cycle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleIndependentModels', 0, () => {
      const first: ServiceLifecycleModel = baseModel();
      const second: ServiceLifecycleModel = baseModel();
      runCycles(first, 2);
      expect(second.connectCount).assertEqual(0);
      expect(second.disconnectCount).assertEqual(0);
      expect(second.events.size()).assertEqual(0);
      expect(second.stub).assertUndefined();
      runCycle(second);
      expect(second.connectCount).assertEqual(1);
      expect(second.disconnectCount).assertEqual(1);
      expect(first.connectCount).assertEqual(2);
      expect(first.events.size()).assertEqual(4);
      expect(second.events.size()).assertEqual(2);
      expect(first.events === second.events).assertFalse();
      expect(first.stub === second.stub).assertFalse();
    });

    /**
     * @tc.name          reconnectLifecycleCycleThenDestroy
     * @tc.desc          Destroying after cycles keeps both cycle totals in the snapshot.
     * @tc.precondition  A model has completed two cycles.
     * @tc.steps         1. Run two cycles.
     *                   2. Destroy the model.
     *                   3. Capture and describe the snapshot.
     * @tc.expected      The describe text is destroyed/2/2/0/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCycleThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      service.onDestroy();
      const snapshot: ServiceSnapshot = cycleSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(2);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/2/2/0/1');
      expect(service.isAlive()).assertFalse();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.size()).assertEqual(5);
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          reconnectLifecycleJoinedTrace
     * @tc.desc          A two-cycle trace equals the expected joined string.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles.
     *                   2. Join the expected entries.
     *                   3. Compare with the trace.
     * @tc.expected      The joined expectation equals the recorder trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleJoinedTrace', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      const expected: string = joined(['onConnect:IPCStubTest', EVENT_ON_DISCONNECT,
        'onConnect:IPCStubTest', EVENT_ON_DISCONNECT], '>');
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.trace().split('>').length).assertEqual(4);
      expect(service.events.entries[0] + '>' + service.events.entries[1]).assertEqual(
        'onConnect:IPCStubTest>onDisconnect');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.events.fingerprint()).assertEqual(service.events.fingerprint());
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          reconnectLifecycleSnapshotChain
     * @tc.desc          A chain of snapshots records each cycle boundary.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Capture a snapshot per cycle.
     *                   2. Walk the chain by index.
     *                   3. Compare connect and disconnect fields.
     * @tc.expected      Each snapshot increments both cycle counters by one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleSnapshotChain', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const chain: ServiceSnapshot[] = [];
      chain.push(cycleSnapshot(service));
      for (let cycle = 0; cycle < 3; cycle++) {
        runCycle(service);
        chain.push(cycleSnapshot(service));
      }
      expect(chain.length).assertEqual(4);
      expect(chain[0].connects).assertEqual(0);
      expect(chain[1].connects).assertEqual(1);
      expect(chain[3].connects).assertEqual(3);
      expect(chain[3].disconnects).assertEqual(3);
      for (let index = 1; index < chain.length; index++) {
        expect(chain[index].connects).assertEqual(chain[index - 1].connects + 1);
        expect(chain[index].disconnects).assertEqual(chain[index - 1].disconnects + 1);
      }
      expect(chain[0].state).assertEqual('idle');
      expect(chain[3].state).assertEqual('disconnected');
      expect(chain[3].sameAs(chain[0])).assertFalse();
    });

    /**
     * @tc.name          reconnectLifecycleStubKillBetweenCycles
     * @tc.desc          Killing a stub between cycles does not block a new connect.
     * @tc.precondition  A model has completed one cycle.
     * @tc.steps         1. Kill the first stub.
     *                   2. Run a second cycle.
     *                   3. Compare both stubs.
     * @tc.expected      The old stub stays dead while the new stub is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleStubKillBetweenCycles', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const first: StubRemoteObjectModel = runCycle(service);
      first.kill();
      const second: StubRemoteObjectModel = runCycle(service);
      expect(first.alive).assertFalse();
      expect(second.alive).assertTrue();
      expect(first === second).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.size()).assertEqual(4);
      expect(service.stub === second).assertTrue();
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleReconnectAfterStubReset
     * @tc.desc          Resetting the old stub does not affect a new connection.
     * @tc.precondition  A model has completed one cycle and holds a used stub.
     * @tc.steps         1. Send a request and reset the old stub.
     *                   2. Reconnect.
     *                   3. Read both ledgers and the new state.
     * @tc.expected      The old ledger is empty and the new stub is live and empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleReconnectAfterStubReset', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const oldStub: StubRemoteObjectModel = runCycle(service);
      new InProcessClient(oldStub).send(1, 'used');
      expect(oldStub.requestCount()).assertEqual(1);
      oldStub.reset();
      expect(oldStub.requestCount()).assertEqual(0);
      const newStub: StubRemoteObjectModel = service.onConnect();
      expect(newStub.requestCount()).assertEqual(0);
      expect(newStub.alive).assertTrue();
      expect(newStub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub === newStub).assertTrue();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          reconnectLifecycleCountAfterRecorderClear
     * @tc.desc          Clearing the recorder preserves both cycle counters.
     * @tc.precondition  A model has completed two cycles.
     * @tc.steps         1. Run two cycles.
     *                   2. Clear the recorder.
     *                   3. Run one more cycle.
     * @tc.expected      Counters reach three while the recorder holds two entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCountAfterRecorderClear', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      runCycle(service);
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
      expect(service.events.size()).assertEqual(2);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onDisconnect');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.logs.size()).assertEqual(6);
    });

    /**
     * @tc.name          reconnectLifecycleStubDescriptorStable
     * @tc.desc          All stubs across cycles share the same descriptor.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run five connect cycles.
     *                   2. Collect all descriptors.
     *                   3. Count distinct values.
     * @tc.expected      Every descriptor equals IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleStubDescriptorStable', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const stubs: StubRemoteObjectModel[] = [];
      for (let cycle = 0; cycle < 5; cycle++) {
        stubs.push(service.onConnect());
      }
      expect(stubs.length).assertEqual(5);
      for (let index = 0; index < stubs.length; index++) {
        expect(stubs[index].descriptor).assertEqual(STUB_DESCRIPTOR);
        expect(stubs[index].alive).assertTrue();
        if (index > 0) {
          expect(stubs[index] === stubs[index - 1]).assertFalse();
        }
      }
      expect(service.connectCount).assertEqual(5);
      expect(service.events.size()).assertEqual(5);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
    });

    /**
     * @tc.name          reconnectLifecycleManyCyclesLogTrim
     * @tc.desc          More than 64 cycles keep the log capped at 128 lines.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run 70 cycles.
     *                   2. Read the log size.
     *                   3. Read the event size.
     * @tc.expected      Logs cap at 128 while events hold all 140 entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleManyCyclesLogTrim', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 70);
      expect(service.connectCount).assertEqual(70);
      expect(service.disconnectCount).assertEqual(70);
      expect(service.events.size()).assertEqual(140);
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(service.logs.lines[0]).assertEqual('INFO onConnect');
      expect(service.logs.lines[127]).assertEqual('INFO onDisconnect');
      expect(service.logs.contains('WARN')).assertFalse();
      expect(service.logs.contains('ERROR')).assertFalse();
    });

    /**
     * @tc.name          reconnectLifecycleCycleWithoutDisconnect
     * @tc.desc          Connect without disconnect increases only the connect counter.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect three times without disconnecting.
     *                   2. Read both counters.
     *                   3. Read the state.
     * @tc.expected      Connects equal three while disconnects stay zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCycleWithoutDisconnect', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      service.onConnect();
      service.onConnect();
      service.onConnect();
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.size()).assertEqual(3);
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(service.stub?.alive).assertTrue();
      expect(service.events.trace().split('>').length).assertEqual(3);
    });

    /**
     * @tc.name          reconnectLifecycleSnapshotCounterAlignment
     * @tc.desc          Snapshot fields match both cycle counters after reconnects.
     * @tc.precondition  A model has run three cycles and reconnected.
     * @tc.steps         1. Run three cycles.
     *                   2. Reconnect once.
     *                   3. Capture and compare the snapshot.
     * @tc.expected      The snapshot reports four connects and three disconnects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleSnapshotCounterAlignment', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 3);
      service.onConnect();
      const snapshot: ServiceSnapshot = cycleSnapshot(service);
      expect(snapshot.connects).assertEqual(4);
      expect(snapshot.disconnects).assertEqual(3);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.describe()).assertEqual('connected/4/3/0/0');
      expect(snapshot.sameAs(cycleSnapshot(service))).assertTrue();
      expect(snapshot.requests).assertEqual(0);
      expect(service.events.size()).assertEqual(7);
    });

    /**
     * @tc.name          reconnectLifecycleIdleToReconnect
     * @tc.desc          Reconnecting from idle produces the expected minimal trace.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect and disconnect from idle.
     *                   2. Reconnect.
     *                   3. Read the trace and state.
     * @tc.expected      The trace starts with connect, disconnect, connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleIdleToReconnect', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycle(service);
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest');
      expect(service.events.entries.length).assertEqual(3);
      expect(service.state).assertEqual('connected');
      expect(service.stub === stub).assertTrue();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.logs.size()).assertEqual(3);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleFullWalkTwoCycles
     * @tc.desc          Two cycles wrapped by create and destroy hold seven events.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, run two cycles and destroy.
     *                   2. Read the trace and counters.
     *                   3. Capture the snapshot.
     * @tc.expected      The snapshot reports two connects, two disconnects and one destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleFullWalkTwoCycles', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      service.onCreate();
      runCycles(service, 2);
      service.onDestroy();
      expect(service.events.size()).assertEqual(6);
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(cycleSnapshot(service).describe()).assertEqual('destroyed/2/2/0/1');
      expect(service.isAlive()).assertFalse();
      expect(service.logs.size()).assertEqual(6);
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          reconnectLifecycleStubMetricsPerCycle
     * @tc.desc          Metrics stay per stub across reconnect cycles.
     * @tc.precondition  A model has completed two cycles.
     * @tc.steps         1. Send one request through each cycle stub.
     *                   2. Compute metrics per stub.
     *                   3. Compare handled counts.
     * @tc.expected      Each stub reports one handled request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleStubMetricsPerCycle', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const first: StubRemoteObjectModel = runCycle(service);
      const second: StubRemoteObjectModel = runCycle(service);
      new InProcessClient(first).send(1, 'first');
      new InProcessClient(second).send(1, 'second');
      const firstMetrics: StubMetrics = StubMetrics.from(first);
      const secondMetrics: StubMetrics = StubMetrics.from(second);
      expect(firstMetrics.requests).assertEqual(1);
      expect(secondMetrics.requests).assertEqual(1);
      expect(firstMetrics.handled).assertEqual(1);
      expect(secondMetrics.handled).assertEqual(1);
      expect(firstMetrics.rejected).assertEqual(0);
      expect(secondMetrics.rejected).assertEqual(0);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(service.connectCount).assertEqual(2);
      expect(service.requestCount).assertEqual(0);
    });

    /**
     * @tc.name          reconnectLifecycleFinalStateConnected
     * @tc.desc          Ending on a connect leaves the model connected and alive.
     * @tc.precondition  A model has run two cycles.
     * @tc.steps         1. Run two cycles.
     *                   2. Reconnect without disconnecting.
     *                   3. Read the final state.
     * @tc.expected      The final state is connected with two disconnects recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleFinalStateConnected', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      const last: StubRemoteObjectModel = service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.events.size()).assertEqual(5);
      expect(service.stub === last).assertTrue();
      expect(service.events.trace().endsWith('onDisconnect>onConnect:IPCStubTest')).assertTrue();
      expect(service.destroyCount).assertEqual(0);
    });

    /**
     * @tc.name          reconnectLifecycleCycleKindSum
     * @tc.desc          Cycle event counts sum to the recorder size.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles with one request between.
     *                   2. Sum the per-kind counts.
     *                   3. Compare with the recorder size.
     * @tc.expected      The sum equals five and matches the size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCycleKindSum', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycle(service);
      service.onRequest(1);
      runCycle(service);
      const sum: number = service.events.countOf(EVENT_ON_CREATE) +
        service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DISCONNECT) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(sum).assertEqual(5);
      expect(sum).assertEqual(service.events.size());
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.events.entries.length).assertEqual(sum);
      expect(service.events.fingerprint()).assertLarger(0);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          reconnectLifecycleReconnectAfterResetSnapshot
     * @tc.desc          A snapshot after reset and reconnect reports one connect.
     * @tc.precondition  A model with prior cycles is available.
     * @tc.steps         1. Run three cycles.
     *                   2. Reset and connect.
     *                   3. Capture and describe the snapshot.
     * @tc.expected      The describe text is connected/1/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleReconnectAfterResetSnapshot', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 3);
      service.reset();
      service.onConnect();
      const snapshot: ServiceSnapshot = cycleSnapshot(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/0/0');
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
      expect(snapshot.sameAs(cycleSnapshot(service))).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleLogEventDivergence
     * @tc.desc          Clearing events leaves both cycle log lines intact.
     * @tc.precondition  A model has completed two cycles.
     * @tc.steps         1. Run two cycles.
     *                   2. Clear the recorder only.
     *                   3. Compare log and event sizes.
     * @tc.expected      Logs hold four lines while events are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleLogEventDivergence', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.trace()).assertEqual(
        'INFO onConnect|INFO onDisconnect|INFO onConnect|INFO onDisconnect');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.trace()).assertEqual('');
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.contains('onConnect')).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleObservationSummary
     * @tc.desc          A cycle observation summary is internally consistent.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three cycles.
     *                   2. Capture the snapshot.
     *                   3. Cross-check counters, trace and logs.
     * @tc.expected      All observations agree on three cycles.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleObservationSummary', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 3);
      const snapshot: ServiceSnapshot = cycleSnapshot(service);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.describe()).assertEqual('disconnected/3/3/0/0');
      expect(service.events.size()).assertEqual(6);
      expect(service.logs.size()).assertEqual(6);
      expect(service.events.trace().split('>').length).assertEqual(6);
      expect(service.logs.trace().split('|').length).assertEqual(6);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          reconnectLifecycleTenCycles
     * @tc.desc          Ten cycles are counted exactly with no drift.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run ten cycles.
     *                   2. Read both counters and the event size.
     *                   3. Read the trace tail pair.
     * @tc.expected      Ten connects, ten disconnects and twenty events exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleTenCycles', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const stubs: StubRemoteObjectModel[] = runCycles(service, 10);
      expect(stubs.length).assertEqual(10);
      expect(service.connectCount).assertEqual(10);
      expect(service.disconnectCount).assertEqual(10);
      expect(service.events.size()).assertEqual(20);
      expect(service.logs.size()).assertEqual(20);
      expect(service.events.entries[18]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[19]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(10);
      expect(cycleSnapshot(service).describe()).assertEqual('disconnected/10/10/0/0');
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          reconnectLifecycleCycleTraceLength
     * @tc.desc          The trace length equals twice the completed cycle count.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run four cycles.
     *                   2. Compare trace length with twice the counter.
     *                   3. Count connect entries.
     * @tc.expected      Trace length is eight and connects are four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCycleTraceLength', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 4);
      const expectedLength: number = service.connectCount * 2;
      expect(service.events.trace().split('>').length).assertEqual(expectedLength);
      expect(expectedLength).assertEqual(8);
      expect(service.events.size()).assertEqual(expectedLength);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(4);
      expect(service.events.trace().split('>')[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.trace().split('>')[7]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.logs.size()).assertEqual(8);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          reconnectLifecycleNoRequestReset
     * @tc.desc          Reconnecting never clears the lifecycle request counter.
     * @tc.precondition  A model has received two requests.
     * @tc.steps         1. Request twice.
     *                   2. Run one connect-disconnect cycle.
     *                   3. Compare the request total.
     * @tc.expected      The request total remains two after the cycle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleNoRequestReset', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      service.onRequest(1);
      service.onRequest(2);
      runCycle(service);
      expect(service.requestCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.trace()).assertEqual(
        'onRequest:1>onRequest:2>onConnect:IPCStubTest>onDisconnect');
      expect(service.events.entries[2]).assertEqual('onConnect:IPCStubTest');
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.size()).assertEqual(4);
    });

    /**
     * @tc.name          reconnectLifecycleRepeatedResetDeterministic
     * @tc.desc          Three reset-cycle rounds produce identical observations.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three reset-cycle rounds.
     *                   2. Capture a trace per round.
     *                   3. Compare all traces.
     * @tc.expected      Every round yields the same two-entry trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleRepeatedResetDeterministic', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const traces: string[] = [];
      for (let round = 0; round < 3; round++) {
        service.reset();
        runCycle(service);
        traces.push(service.events.trace());
      }
      expect(traces.length).assertEqual(3);
      expect(traces[0]).assertEqual('onConnect:IPCStubTest>onDisconnect');
      expect(traces[0]).assertEqual(traces[1]);
      expect(traces[1]).assertEqual(traces[2]);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.logs.size()).assertEqual(2);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          reconnectLifecycleStubReplyEachCycle
     * @tc.desc          Every cycle stub replies correctly to a code-one message.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three cycles.
     *                   2. Send one request through each stub.
     *                   3. Compare all replies.
     * @tc.expected      All three replies equal hello rpc and all results succeed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleStubReplyEachCycle', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const stubs: StubRemoteObjectModel[] = runCycles(service, 3);
      const replies: string[] = [];
      for (let index = 0; index < stubs.length; index++) {
        const client: InProcessClient = new InProcessClient(stubs[index]);
        const result = client.send(1, 'cycle-' + String(index));
        expect(result.isSuccess()).assertTrue();
        replies.push(result.replyText);
      }
      expect(replies.length).assertEqual(3);
      expect(replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(replies[1]).assertEqual(REPLY_PAYLOAD);
      expect(replies[2]).assertEqual(REPLY_PAYLOAD);
      expect(stubs[0].lastRequest()?.text).assertEqual('cycle-0');
      expect(stubs[2].lastRequest()?.text).assertEqual('cycle-2');
      expect(service.connectCount).assertEqual(3);
      expect(service.requestCount).assertEqual(0);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          reconnectLifecycleSnapshotBeforeReconnect
     * @tc.desc          A snapshot before reconnect keeps the disconnected fields.
     * @tc.precondition  A model has completed one cycle.
     * @tc.steps         1. Run one cycle and capture a snapshot.
     *                   2. Reconnect the live model.
     *                   3. Re-read the captured snapshot.
     * @tc.expected      The captured snapshot stays disconnected with one connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleSnapshotBeforeReconnect', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycle(service);
      const captured: ServiceSnapshot = cycleSnapshot(service);
      service.onConnect();
      expect(captured.state).assertEqual('disconnected');
      expect(captured.connects).assertEqual(1);
      expect(captured.disconnects).assertEqual(1);
      expect(captured.describe()).assertEqual('disconnected/1/1/0/0');
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(2);
      expect(captured.sameAs(cycleSnapshot(service))).assertFalse();
      expect(captured.requests).assertEqual(0);
      expect(captured.destroys).assertEqual(0);
    });

    /**
     * @tc.name          reconnectLifecycleFingerprintDeterministic
     * @tc.desc          Two models running two cycles share one fingerprint.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Run two cycles on both models.
     *                   2. Compare fingerprints.
     *                   3. Compare logs and snapshots.
     * @tc.expected      Both models are observationally identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleFingerprintDeterministic', 0, () => {
      const first: ServiceLifecycleModel = baseModel();
      const second: ServiceLifecycleModel = baseModel();
      runCycles(first, 2);
      runCycles(second, 2);
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(cycleSnapshot(first).describe()).assertEqual(cycleSnapshot(second).describe());
      expect(first.connectCount).assertEqual(second.connectCount);
      expect(first.disconnectCount).assertEqual(second.disconnectCount);
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.state).assertEqual(second.state);
      expect(first.isAlive()).assertEqual(second.isAlive());
    });

    /**
     * @tc.name          reconnectLifecycleCounterAfterLogClear
     * @tc.desc          Clearing logs does not reset either cycle counter.
     * @tc.precondition  A model has completed two cycles.
     * @tc.steps         1. Run two cycles.
     *                   2. Clear the log buffer.
     *                   3. Run one more cycle and read sizes.
     * @tc.expected      Counters reach three and logs hold two lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCounterAfterLogClear', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      service.logs.clear();
      expect(service.logs.size()).assertEqual(0);
      expect(service.connectCount).assertEqual(2);
      runCycle(service);
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.lines[0]).assertEqual('INFO onConnect');
      expect(service.logs.lines[1]).assertEqual('INFO onDisconnect');
      expect(service.events.size()).assertEqual(6);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          reconnectLifecycleCycleCountExactlyFive
     * @tc.desc          Five cycles are counted without drift.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run five cycles.
     *                   2. Read both counters and event size.
     *                   3. Read the trace segment count.
     * @tc.expected      Both counters equal five and the trace has ten segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCycleCountExactlyFive', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 5);
      expect(service.connectCount).assertEqual(5);
      expect(service.disconnectCount).assertEqual(5);
      expect(service.events.size()).assertEqual(10);
      expect(service.events.trace().split('>').length).assertEqual(10);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(5);
      expect(service.logs.size()).assertEqual(10);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          reconnectLifecycleAlternatingAfterCreate
     * @tc.desc          Cycles after creation keep create first and alternate the rest.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Invoke onCreate.
     *                   2. Run two cycles.
     *                   3. Read entry positions.
     * @tc.expected      Entry zero is create and the remaining entries alternate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleAlternatingAfterCreate', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      service.onCreate();
      runCycles(service, 2);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[2]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[3]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[4]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.size()).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
    });

    /**
     * @tc.name          reconnectLifecycleLastStubBinding
     * @tc.desc          The stub field always points at the last connected stub.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles and reconnect once.
     *                   2. Read the stub field.
     *                   3. Compare with the last returned stub.
     * @tc.expected      The field equals the last returned stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleLastStubBinding', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      const first: StubRemoteObjectModel = runCycle(service);
      const second: StubRemoteObjectModel = runCycle(service);
      const last: StubRemoteObjectModel = service.onConnect();
      expect(service.stub === last).assertTrue();
      expect(service.stub === second).assertFalse();
      expect(service.stub === first).assertFalse();
      expect(last.alive).assertTrue();
      expect(last.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.state).assertEqual('connected');
      expect(service.events.size()).assertEqual(5);
    });

    /**
     * @tc.name          reconnectLifecycleFinalSnapshotDescribe
     * @tc.desc          The final snapshot after cycles and a reconnect is consistent.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two cycles.
     *                   2. Reconnect once.
     *                   3. Capture and describe the snapshot.
     * @tc.expected      The describe text is connected/3/2/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleFinalSnapshotDescribe', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      service.onConnect();
      const snapshot: ServiceSnapshot = cycleSnapshot(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(3);
      expect(snapshot.disconnects).assertEqual(2);
      expect(snapshot.describe()).assertEqual('connected/3/2/0/0');
      expect(snapshot.describe().split('/')[1]).assertEqual('3');
      expect(snapshot.describe().split('/')[2]).assertEqual('2');
      expect(service.events.size()).assertEqual(5);
      expect(service.logs.size()).assertEqual(5);
      expect(snapshot.sameAs(cycleSnapshot(service))).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleCycleCounterAlignment
     * @tc.desc          Cycle counters and snapshot fields stay aligned over time.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run cycles one at a time.
     *                   2. Capture a snapshot after each cycle.
     *                   3. Compare counters and fields.
     * @tc.expected      Snapshot fields equal the live counters at each step.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCycleCounterAlignment', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      for (let cycle = 1; cycle <= 3; cycle++) {
        runCycle(service);
        const snapshot: ServiceSnapshot = cycleSnapshot(service);
        expect(snapshot.connects).assertEqual(service.connectCount);
        expect(snapshot.disconnects).assertEqual(service.disconnectCount);
        expect(snapshot.connects).assertEqual(cycle);
        expect(snapshot.disconnects).assertEqual(cycle);
        expect(snapshot.requests).assertEqual(0);
        expect(snapshot.destroys).assertEqual(0);
      }
      expect(service.connectCount).assertEqual(3);
      expect(service.events.size()).assertEqual(6);
      expect(service.logs.size()).assertEqual(6);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleCycleWithRequestTraceConsistency
     * @tc.desc          Requests between cycles stay in trace order after reconnects.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run one cycle.
     *                   2. Request twice, then run another cycle.
     *                   3. Compare the trace and snapshot.
     * @tc.expected      The trace interleaves cycles and requests in invocation order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleCycleWithRequestTraceConsistency', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycle(service);
      service.onRequest(1);
      service.onRequest(2);
      runCycle(service);
      expect(service.events.size()).assertEqual(6);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onRequest:1>onRequest:2>onConnect:IPCStubTest>onDisconnect');
      expect(service.requestCount).assertEqual(2);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(cycleSnapshot(service).describe()).assertEqual('disconnected/2/2/2/0');
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.logs.size()).assertEqual(6);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          reconnectLifecycleTwoCycleSnapshotAudit
     * @tc.desc          A two-cycle audit confirms every persisted total.
     * @tc.precondition  A model has run two cycles.
     * @tc.steps         1. Run two cycles.
     *                   2. Capture the snapshot.
     *                   3. Compare counters and trace.
     * @tc.expected      The describe text is disconnected/2/2/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('reconnectLifecycleTwoCycleSnapshotAudit', 0, () => {
      const service: ServiceLifecycleModel = baseModel();
      runCycles(service, 2);
      const snapshot: ServiceSnapshot = cycleSnapshot(service);
      expect(snapshot.describe()).assertEqual('disconnected/2/2/0/0');
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.logs.size()).assertEqual(4);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });
  });
}
