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

function blankModel(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function disconnectedModel(): ServiceLifecycleModel {
  const service = new ServiceLifecycleModel();
  service.onConnect();
  service.onDisconnect();
  return service;
}

function boundStub(service: ServiceLifecycleModel): StubRemoteObjectModel {
  const stub = service.stub;
  if (stub === undefined) {
    throw new Error('Expected an already connected service stub');
  }
  return stub;
}

function disconnectTimes(service: ServiceLifecycleModel, times: number): void {
  for (let index = 0; index < times; index++) {
    service.onDisconnect();
  }
}

function modelSnapshot(service: ServiceLifecycleModel): ServiceSnapshot {
  return new ServiceSnapshot(service);
}

function finalLogLine(service: ServiceLifecycleModel): string {
  return service.logs.lines[service.logs.size() - 1];
}

export default function onDisconnectLifecycle(): void {
  describe('OnDisconnectLifecycle', () => {
    beforeAll(() => {
      logSuite('OnDisconnectLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('OnDisconnectLifecycle', 'end');
    });

    /**
     * @tc.name          onDisconnectLifecycleFirstCallCounts
     * @tc.desc          The first disconnect increments the disconnect counter.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDisconnect.
     *                   2. Read the counter.
     *                   3. Read the event count.
     * @tc.expected      Both the counter and event count equal one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDisconnectLifecycleFirstCallCounts', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(1);
      expect(service.disconnectCount).assertLarger(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
    });

    /**
     * @tc.name          onDisconnectLifecycleStateBecomesDisconnected
     * @tc.desc          Disconnect sets the state string to disconnected.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Read the idle state.
     *                   2. Invoke onDisconnect.
     *                   3. Read the new state.
     * @tc.expected      The state changes from idle to disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDisconnectLifecycleStateBecomesDisconnected', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      expect(service.state).assertEqual('idle');
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.state === 'idle').assertFalse();
      expect(service.state).assertContain('connect');
      expect(service.isAlive()).assertTrue();
      expect(service.state.length).assertEqual('disconnected'.length);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          onDisconnectLifecycleEventHasNoDetail
     * @tc.desc          The disconnect event entry is the bare event constant.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDisconnect.
     *                   2. Read the entry.
     *                   3. Search for the colon separator.
     * @tc.expected      The entry equals onDisconnect and has no colon.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDisconnectLifecycleEventHasNoDetail', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      expect(service.events.entries.length).assertEqual(1);
      expect(service.events.entries[0]).assertEqual('onDisconnect');
      expect(service.events.entries[0]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[0].indexOf(':')).assertLess(0);
      expect(service.events.entries[0].length).assertEqual('onDisconnect'.length);
      expect(service.events.trace()).assertEqual('onDisconnect');
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          onDisconnectLifecycleWritesInfoLog
     * @tc.desc          Disconnect writes exactly one info line.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDisconnect.
     *                   2. Read the log buffer.
     *                   3. Count message levels.
     * @tc.expected      One INFO onDisconnect line and no warnings.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onDisconnectLifecycleWritesInfoLog', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.lines[0]).assertEqual('INFO onDisconnect');
      expect(finalLogLine(service)).assertEqual('INFO onDisconnect');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains('onDisconnect')).assertTrue();
      expect(service.logs.trace()).assertEqual('INFO onDisconnect');
    });

    /**
     * @tc.name          onDisconnectLifecycleKeepsStubReference
     * @tc.desc          Disconnect never clears the previously bound stub field.
     * @tc.precondition  A connected model holds a bound stub.
     * @tc.steps         1. Connect and record the stub.
     *                   2. Invoke onDisconnect.
     *                   3. Compare the stub field and liveness.
     * @tc.expected      The stub remains bound and alive after disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleKeepsStubReference', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      service.onDisconnect();
      expect(service.stub === stub).assertTrue();
      expect(service.stub?.alive).assertTrue();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.state).assertEqual('disconnected');
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
      expect(service.stub?.requestCount()).assertEqual(0);
    });

    /**
     * @tc.name          onDisconnectLifecycleDoesNotResetRequests
     * @tc.desc          Disconnect leaves the lifecycle request counter intact.
     * @tc.precondition  A model has received two requests.
     * @tc.steps         1. Request twice.
     *                   2. Invoke onDisconnect.
     *                   3. Compare the request total.
     * @tc.expected      The request counter remains two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleDoesNotResetRequests', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onRequest(1);
      service.onRequest(2);
      service.onDisconnect();
      expect(service.requestCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.events.trace()).assertEqual('onRequest:1>onRequest:2>onDisconnect');
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.size()).assertEqual(3);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          onDisconnectLifecycleDoesNotChangeConnectCount
     * @tc.desc          Disconnect does not subtract from the connect counter.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect once.
     *                   2. Disconnect once.
     *                   3. Compare both counters.
     * @tc.expected      Connect and disconnect counters both equal one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleDoesNotChangeConnectCount', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      expect(service.connectCount).assertEqual(1);
      service.onDisconnect();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(service.disconnectCount);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onDisconnect');
    });

    /**
     * @tc.name          onDisconnectLifecycleSnapshotDescribe
     * @tc.desc          A disconnected snapshot reports one connect and one disconnect.
     * @tc.precondition  A connected and disconnected model is available.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Capture the snapshot.
     *                   3. Describe and split it.
     * @tc.expected      The describe text is disconnected/1/1/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleSnapshotDescribe', 0, () => {
      const service: ServiceLifecycleModel = disconnectedModel();
      const snapshot: ServiceSnapshot = modelSnapshot(service);
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.describe()).assertEqual('disconnected/1/1/0/0');
      const fields: string[] = snapshot.describe().split('/');
      expect(fields.length).assertEqual(5);
      expect(fields[0]).assertEqual('disconnected');
      expect(fields[2]).assertEqual('1');
      expect(snapshot.sameAs(modelSnapshot(service))).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleRepeatedDisconnectsCount
     * @tc.desc          Every disconnect call adds one to the counter.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDisconnect four times.
     *                   2. Read the counter and event size.
     *                   3. Compare the trace.
     * @tc.expected      Four disconnect events accumulate in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleRepeatedDisconnectsCount', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 4);
      expect(service.disconnectCount).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(4);
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.events.trace()).assertEqual('onDisconnect>onDisconnect>onDisconnect>onDisconnect');
      expect(service.events.entries[0]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          onDisconnectLifecycleConnectDisconnectTrace
     * @tc.desc          A connect followed by a disconnect yields a two-entry trace.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Invoke onDisconnect.
     *                   3. Read entries by index.
     * @tc.expected      Entry zero is connect and entry one is disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleConnectDisconnectTrace', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      service.onDisconnect();
      expect(service.events.size()).assertEqual(2);
      expect(service.events.entries[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[1]).assertEqual('onDisconnect');
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onDisconnect');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.lines[1]).assertEqual('INFO onDisconnect');
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
    });

    /**
     * @tc.name          onDisconnectLifecycleAfterCreateOnly
     * @tc.desc          Disconnecting a created but unconnected service still counts.
     * @tc.precondition  A created model without a connection is available.
     * @tc.steps         1. Invoke onCreate.
     *                   2. Invoke onDisconnect.
     *                   3. Read counters and the trace.
     * @tc.expected      The disconnect counter is one and connect stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleAfterCreateOnly', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.trace()).assertEqual('onCreate>onDisconnect');
      expect(service.events.size()).assertEqual(2);
      expect(service.stub).assertUndefined();
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.logs.size()).assertEqual(2);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleFromIdleState
     * @tc.desc          A disconnect from idle has no prerequisite callbacks.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDisconnect directly.
     *                   2. Read state and counters.
     *                   3. Confirm no create or connect event exists.
     * @tc.expected      The state is disconnected and unrelated counts are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onDisconnectLifecycleFromIdleState', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.connectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual('onDisconnect');
      expect(service.logs.trace()).assertEqual('INFO onDisconnect');
      expect(service.stub).assertUndefined();
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleAfterDestroyKeepsDestroyed
     * @tc.desc          Disconnecting a destroyed service leaves the destroyed state.
     * @tc.precondition  A model has been destroyed.
     * @tc.steps         1. Destroy the model.
     *                   2. Invoke onDisconnect.
     *                   3. Read state and liveness.
     * @tc.expected      The state stays destroyed and the service is not alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleAfterDestroyKeepsDestroyed', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onDestroy();
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.state === 'destroyed').assertFalse();
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy>onDisconnect');
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
    });

    /**
     * @tc.name          onDisconnectLifecycleLogCountMatchesEvents
     * @tc.desc          Each callback writes one log line, matching the event count.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, connect, disconnect and destroy.
     *                   2. Compare log and event sizes.
     *                   3. Count info lines.
     * @tc.expected      Both containers hold four entries, all info level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleLogCountMatchesEvents', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.lines[2]).assertEqual('INFO onDisconnect');
      expect(service.logs.contains('onDisconnect')).assertTrue();
      expect(service.logs.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name          onDisconnectLifecycleFingerprintChangesPerCall
     * @tc.desc          Each disconnect call changes the recorder fingerprint.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Read the empty fingerprint.
     *                   2. Disconnect once and read again.
     *                   3. Disconnect twice more and compare.
     * @tc.expected      All four fingerprint values differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleFingerprintChangesPerCall', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      const empty: number = service.events.fingerprint();
      service.onDisconnect();
      const once: number = service.events.fingerprint();
      service.onDisconnect();
      const twice: number = service.events.fingerprint();
      service.onDisconnect();
      const thrice: number = service.events.fingerprint();
      expect(empty === once).assertFalse();
      expect(once === twice).assertFalse();
      expect(twice === thrice).assertFalse();
      expect(empty === thrice).assertFalse();
      expect(thrice).assertLarger(0);
      expect(service.events.size()).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
    });

    /**
     * @tc.name          onDisconnectLifecycleResetClearsDisconnectState
     * @tc.desc          Reset zeroes the disconnect counter and empties the recorder.
     * @tc.precondition  A model has disconnected twice.
     * @tc.steps         1. Disconnect twice.
     *                   2. Invoke reset.
     *                   3. Read counters and containers.
     * @tc.expected      The counter is zero and the state is idle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleResetClearsDisconnectState', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 2);
      expect(service.disconnectCount).assertEqual(2);
      service.reset();
      expect(service.disconnectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.state).assertEqual('idle');
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.isAlive()).assertTrue();
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          onDisconnectLifecycleStubStillUsable
     * @tc.desc          The retained stub still serves code-one requests after disconnect.
     * @tc.precondition  A disconnected model retains its stub.
     * @tc.steps         1. Capture the retained stub.
     *                   2. Send a code-one message.
     *                   3. Inspect the reply and ledger.
     * @tc.expected      The request succeeds and the stub ledger records it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleStubStillUsable', 0, () => {
      const service: ServiceLifecycleModel = disconnectedModel();
      const stub: StubRemoteObjectModel = boundStub(service);
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(1, 'after-disconnect');
      expect(stub?.alive).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub?.requestCount()).assertEqual(1);
      expect(stub?.lastRequest()?.text).assertEqual('after-disconnect');
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(0);
    });

    /**
     * @tc.name          onDisconnectLifecycleReconnectPairCounts
     * @tc.desc          A second connect after disconnect pairs with the first disconnect.
     * @tc.precondition  A disconnected model is available.
     * @tc.steps         1. Connect again after the disconnect.
     *                   2. Read all counters.
     *                   3. Read the trace.
     * @tc.expected      Two connects and one disconnect are recorded in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleReconnectPairCounts', 0, () => {
      const service: ServiceLifecycleModel = disconnectedModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest');
      expect(service.events.entries[1]).assertEqual('onDisconnect');
      expect(service.state).assertEqual('connected');
      expect(service.stub === stub).assertTrue();
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleIndependentModelCounts
     * @tc.desc          Disconnect counters are isolated between model instances.
     * @tc.precondition  Two independent models are available.
     * @tc.steps         1. Disconnect the first model three times.
     *                   2. Read the second model counter.
     *                   3. Disconnect the second model once.
     * @tc.expected      The second model counts only its own disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleIndependentModelCounts', 0, () => {
      const first: ServiceLifecycleModel = blankModel();
      const second: ServiceLifecycleModel = blankModel();
      disconnectTimes(first, 3);
      expect(second.disconnectCount).assertEqual(0);
      expect(second.events.size()).assertEqual(0);
      expect(second.state).assertEqual('idle');
      second.onDisconnect();
      expect(second.disconnectCount).assertEqual(1);
      expect(first.disconnectCount).assertEqual(3);
      expect(first.events.size()).assertEqual(3);
      expect(second.events.trace()).assertEqual('onDisconnect');
      expect(first.events === second.events).assertFalse();
    });

    /**
     * @tc.name          onDisconnectLifecycleLogTrimAfterManyCalls
     * @tc.desc          The bounded log keeps only the newest disconnect lines.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Disconnect 130 times.
     *                   2. Read the log size.
     *                   3. Inspect the retained first and last lines.
     * @tc.expected      Logs cap at 128 lines of INFO onDisconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleLogTrimAfterManyCalls', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 130);
      expect(service.disconnectCount).assertEqual(130);
      expect(service.events.size()).assertEqual(130);
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(service.logs.lines[0]).assertEqual('INFO onDisconnect');
      expect(service.logs.lines[127]).assertEqual('INFO onDisconnect');
      expect(service.logs.contains('WARN')).assertFalse();
      expect(service.logs.contains('ERROR')).assertFalse();
    });

    /**
     * @tc.name          onDisconnectLifecycleFullWalkTrace
     * @tc.desc          A complete walk ends with the disconnect event before destroy.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, connect, request and disconnect.
     *                   2. Read the trace.
     *                   3. Read counts per kind.
     * @tc.expected      The trace is create, connect, request, disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleFullWalkTrace', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(9);
      service.onDisconnect();
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:IPCStubTest>onRequest:9>onDisconnect');
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.state).assertEqual('disconnected');
      expect(service.requestCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleRetainedLogLine
     * @tc.desc          The last retained log line belongs to the last disconnect.
     * @tc.precondition  A model has disconnected twice.
     * @tc.steps         1. Disconnect twice.
     *                   2. Read the final log line.
     *                   3. Compare with the first line.
     * @tc.expected      Both lines are identical info disconnect lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleRetainedLogLine', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 2);
      expect(finalLogLine(service)).assertEqual('INFO onDisconnect');
      expect(service.logs.lines[0]).assertEqual('INFO onDisconnect');
      expect(finalLogLine(service)).assertEqual(service.logs.lines[0]);
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(service.events.size()).assertEqual(2);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleOtherEventCountsZero
     * @tc.desc          A disconnect-only walk has no create, connect, request or destroy events.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onDisconnect.
     *                   2. Count the four other event kinds.
     *                   3. Sum with the disconnect count.
     * @tc.expected      Only disconnect counts, and the sum equals the size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleOtherEventCountsZero', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      const others: number = service.events.countOf(EVENT_ON_CREATE) +
        service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(others).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.size()).assertEqual(others + 1);
      expect(service.events.countOf('onDisconnected')).assertEqual(0);
      expect(service.events.countOf('onDisconnectX')).assertEqual(0);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.logs.contains('onConnect')).assertFalse();
    });

    /**
     * @tc.name          onDisconnectLifecycleCounterAfterRecorderClear
     * @tc.desc          Clearing the recorder does not reset the disconnect counter.
     * @tc.precondition  A model has disconnected once.
     * @tc.steps         1. Disconnect once.
     *                   2. Clear the recorder.
     *                   3. Disconnect again and read counters.
     * @tc.expected      The counter reaches two while the recorder holds one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleCounterAfterRecorderClear', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.disconnectCount).assertEqual(1);
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual('onDisconnect');
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.logs.size()).assertEqual(2);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          onDisconnectLifecycleAlternatingWalk
     * @tc.desc          Alternating connect and disconnect calls stay balanced.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three connect-disconnect cycles.
     *                   2. Compare both counters.
     *                   3. Count the trace entries.
     * @tc.expected      Both counters are three and the trace holds six entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleAlternatingWalk', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      for (let cycle = 0; cycle < 3; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
      expect(service.events.size()).assertEqual(6);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
      expect(service.events.entries[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[5]).assertEqual('onDisconnect');
      expect(service.state).assertEqual('disconnected');
      expect(service.events.trace().split('>').length).assertEqual(6);
    });

    /**
     * @tc.name          onDisconnectLifecycleDestroyAfterDisconnect
     * @tc.desc          Destroying after a disconnect appends the destroy event.
     * @tc.precondition  A disconnected model is available.
     * @tc.steps         1. Disconnect the model.
     *                   2. Invoke onDestroy.
     *                   3. Read the trace and liveness.
     * @tc.expected      The trace is connect, disconnect, destroy and the service is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleDestroyAfterDisconnect', 0, () => {
      const service: ServiceLifecycleModel = disconnectedModel();
      service.onDestroy();
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.events.size()).assertEqual(3);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.destroyCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          onDisconnectLifecycleSnapshotAfterTwoCycles
     * @tc.desc          Two full cycles describe two connects and two disconnects.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two connect-disconnect cycles.
     *                   2. Capture and describe the snapshot.
     *                   3. Compare fields.
     * @tc.expected      The describe text is disconnected/2/2/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleSnapshotAfterTwoCycles', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      for (let cycle = 0; cycle < 2; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      const snapshot: ServiceSnapshot = modelSnapshot(service);
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(2);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('disconnected/2/2/0/0');
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.describe().split('/')[2]).assertEqual('2');
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          onDisconnectLifecycleJoinedTrace
     * @tc.desc          The trace equals the expected constants joined by arrows.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect and disconnect once.
     *                   2. Join the expected entries.
     *                   3. Compare with the recorder trace.
     * @tc.expected      The joined expectation equals the trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleJoinedTrace', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      service.onDisconnect();
      const expected: string = joined(['onConnect:IPCStubTest', EVENT_ON_DISCONNECT], '>');
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onDisconnect');
      expect(service.events.entries[0] + '>' + service.events.entries[1]).assertEqual(expected);
      expect(service.events.fingerprint()).assertEqual(service.events.fingerprint());
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          onDisconnectLifecycleAfterStubKill
     * @tc.desc          Disconnecting after killing the stub keeps the dead stub bound.
     * @tc.precondition  A connected model holds a stub.
     * @tc.steps         1. Kill the stub.
     *                   2. Invoke onDisconnect.
     *                   3. Read the stub status and counters.
     * @tc.expected      The stub stays bound and dead while disconnect is counted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleAfterStubKill', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      stub.kill();
      service.onDisconnect();
      expect(stub.alive).assertFalse();
      expect(service.stub === stub).assertTrue();
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onDisconnect');
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          onDisconnectLifecycleStubMetricsUnaffected
     * @tc.desc          Disconnect does not alter stub request metrics.
     * @tc.precondition  A connected stub has served two requests.
     * @tc.steps         1. Send two code-one requests.
     *                   2. Disconnect the service.
     *                   3. Compare stub metrics.
     * @tc.expected      Metrics keep two requests and two handled entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleStubMetricsUnaffected', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(1, 'a');
      client.send(1, 'b');
      const before: StubMetrics = StubMetrics.from(stub);
      service.onDisconnect();
      const after: StubMetrics = StubMetrics.from(stub);
      expect(after.requests).assertEqual(before.requests);
      expect(after.requests).assertEqual(2);
      expect(after.handled).assertEqual(2);
      expect(after.rejected).assertEqual(0);
      expect(after.fingerprint()).assertEqual(before.fingerprint());
      expect(service.requestCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(1);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleRequestAfterDisconnect
     * @tc.desc          A post-disconnect request is recorded after the disconnect.
     * @tc.precondition  A disconnected model is available.
     * @tc.steps         1. Disconnect the model.
     *                   2. Invoke onRequest with startId 77.
     *                   3. Read the trace tail and counters.
     * @tc.expected      The request entry follows the disconnect and counts once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleRequestAfterDisconnect', 0, () => {
      const service: ServiceLifecycleModel = disconnectedModel();
      service.onRequest(77);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onRequest:77');
      expect(service.events.last()).assertEqual('onRequest:77');
      expect(service.events.entries[1]).assertEqual('onDisconnect');
      expect(service.requestCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.size()).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          onDisconnectLifecycleSnapshotImmutable
     * @tc.desc          A captured snapshot does not change after further disconnects.
     * @tc.precondition  A model has disconnected once.
     * @tc.steps         1. Disconnect once and capture the snapshot.
     *                   2. Disconnect three more times.
     *                   3. Re-read the captured fields.
     * @tc.expected      The captured snapshot still reports one disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleSnapshotImmutable', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      const captured: ServiceSnapshot = modelSnapshot(service);
      const text: string = captured.describe();
      disconnectTimes(service, 3);
      expect(captured.disconnects).assertEqual(1);
      expect(captured.describe()).assertEqual(text);
      expect(captured.describe()).assertEqual('disconnected/0/1/0/0');
      expect(service.disconnectCount).assertEqual(4);
      expect(captured.sameAs(modelSnapshot(service))).assertFalse();
      expect(captured.state).assertEqual('disconnected');
      expect(text.split('/')[2]).assertEqual('1');
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          onDisconnectLifecycleResetThenCycleMatchesFresh
     * @tc.desc          A reset then connect-disconnect matches a fresh cycle.
     * @tc.precondition  A model has walked several callbacks.
     * @tc.steps         1. Walk extra callbacks.
     *                   2. Reset and run one cycle.
     *                   3. Compare with a fresh model cycle.
     * @tc.expected      Both models share the same trace and snapshot text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleResetThenCycleMatchesFresh', 0, () => {
      const reused: ServiceLifecycleModel = blankModel();
      reused.onCreate();
      reused.onConnect();
      reused.onRequest(1);
      reused.onDisconnect();
      reused.onDestroy();
      reused.reset();
      reused.onConnect();
      reused.onDisconnect();
      const fresh: ServiceLifecycleModel = disconnectedModel();
      expect(reused.events.trace()).assertEqual(fresh.events.trace());
      expect(reused.events.fingerprint()).assertEqual(fresh.events.fingerprint());
      expect(reused.logs.trace()).assertEqual(fresh.logs.trace());
      expect(modelSnapshot(reused).describe()).assertEqual(modelSnapshot(fresh).describe());
      expect(reused.connectCount).assertEqual(fresh.connectCount);
      expect(reused.disconnectCount).assertEqual(fresh.disconnectCount);
      expect(reused.state).assertEqual(fresh.state);
      expect(reused.events.size()).assertEqual(fresh.events.size());
    });

    /**
     * @tc.name          onDisconnectLifecycleCountAfterLogClear
     * @tc.desc          Clearing the log buffer does not affect disconnect counting.
     * @tc.precondition  A model has disconnected twice.
     * @tc.steps         1. Disconnect twice.
     *                   2. Clear only the log buffer.
     *                   3. Disconnect once more and read sizes.
     * @tc.expected      The counter is three and logs hold one line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleCountAfterLogClear', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 2);
      service.logs.clear();
      expect(service.logs.size()).assertEqual(0);
      expect(service.disconnectCount).assertEqual(2);
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(3);
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.lines[0]).assertEqual('INFO onDisconnect');
      expect(service.events.size()).assertEqual(3);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.logs.trace()).assertEqual('INFO onDisconnect');
    });

    /**
     * @tc.name          onDisconnectLifecycleStateStringShape
     * @tc.desc          The state string has the exact expected length and prefix.
     * @tc.precondition  A model has disconnected once.
     * @tc.steps         1. Disconnect the model.
     *                   2. Measure the state string.
     *                   3. Compare the prefix.
     * @tc.expected      The state is twelve characters starting with disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleStateStringShape', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDisconnect();
      expect(service.state.length).assertEqual(12);
      expect(service.state.startsWith('disconnect')).assertTrue();
      expect(service.state.endsWith('ed')).assertTrue();
      expect(service.state).assertEqual('disconnected');
      expect(service.state.indexOf('connected')).assertEqual(3);
      expect(service.state === 'idle').assertFalse();
      expect(service.state === 'created').assertFalse();
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleTraceTailIsDisconnect
     * @tc.desc          After a walk the trace ends with the disconnect entry.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create and connect.
     *                   2. Disconnect twice.
     *                   3. Read the trace tail and event count.
     * @tc.expected      The last two entries are disconnect events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleTraceTailIsDisconnect', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDisconnect();
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[2]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.trace().endsWith('>onDisconnect>onDisconnect')).assertTrue();
      expect(service.events.size()).assertEqual(4);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.size()).assertEqual(4);
    });

    /**
     * @tc.name          onDisconnectLifecycleRepeatedThenResetMatchesFresh
     * @tc.desc          After reset the model is observationally identical to a fresh one.
     * @tc.precondition  A model has disconnected five times.
     * @tc.steps         1. Disconnect five times.
     *                   2. Reset.
     *                   3. Compare with a fresh model.
     * @tc.expected      Snapshot, trace, counters and liveness all match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleRepeatedThenResetMatchesFresh', 0, () => {
      const used: ServiceLifecycleModel = blankModel();
      disconnectTimes(used, 5);
      used.reset();
      const fresh: ServiceLifecycleModel = blankModel();
      expect(modelSnapshot(used).describe()).assertEqual(modelSnapshot(fresh).describe());
      expect(used.events.trace()).assertEqual(fresh.events.trace());
      expect(used.events.fingerprint()).assertEqual(fresh.events.fingerprint());
      expect(used.logs.trace()).assertEqual(fresh.logs.trace());
      expect(used.disconnectCount).assertEqual(0);
      expect(used.state).assertEqual('idle');
      expect(used.isAlive()).assertEqual(fresh.isAlive());
      expect(used.stub).assertUndefined();
    });

    /**
     * @tc.name          onDisconnectLifecycleKindSumEqualsSize
     * @tc.desc          Per-kind event counts sum to the recorder size for a mixed walk.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, connect, disconnect and destroy.
     *                   2. Sum all five kind counts.
     *                   3. Compare with the recorder size.
     * @tc.expected      The sum equals four and matches the size.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleKindSumEqualsSize', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const sum: number = service.events.countOf(EVENT_ON_CREATE) +
        service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DISCONNECT) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(sum).assertEqual(4);
      expect(sum).assertEqual(service.events.size());
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.entries.length).assertEqual(sum);
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          onDisconnectLifecycleCreateDisconnectCreate
     * @tc.desc          Re-creation after disconnect appends a second create.
     * @tc.precondition  A created and disconnected model is available.
     * @tc.steps         1. Create and disconnect.
     *                   2. Invoke onCreate again.
     *                   3. Read the trace and state.
     * @tc.expected      The trace is create, disconnect, create and state is created.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleCreateDisconnectCreate', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onDisconnect();
      service.onCreate();
      expect(service.events.trace()).assertEqual('onCreate>onDisconnect>onCreate');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.state).assertEqual('created');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
      expect(service.events.entries[2]).assertEqual(EVENT_ON_CREATE);
    });

    /**
     * @tc.name          onDisconnectLifecycleSnapshotRequestsAndDisconnects
     * @tc.desc          A snapshot reports both request and disconnect totals.
     * @tc.precondition  A model has received a request and disconnected.
     * @tc.steps         1. Connect and request.
     *                   2. Disconnect.
     *                   3. Capture and describe the snapshot.
     * @tc.expected      The describe text is disconnected/1/1/1/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleSnapshotRequestsAndDisconnects', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      const snapshot: ServiceSnapshot = modelSnapshot(service);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.describe()).assertEqual('disconnected/1/1/1/0');
      expect(snapshot.state).assertEqual('disconnected');
      expect(service.requestCount).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(snapshot.destroys).assertEqual(0);
    });

    /**
     * @tc.name          onDisconnectLifecycleTwoModelTraceDifference
     * @tc.desc          Different disconnect counts produce different traces.
     * @tc.precondition  Two independent models are available.
     * @tc.steps         1. Disconnect the first model once.
     *                   2. Disconnect the second model twice.
     *                   3. Compare traces and fingerprints.
     * @tc.expected      The traces differ in length and fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleTwoModelTraceDifference', 0, () => {
      const once: ServiceLifecycleModel = blankModel();
      const twice: ServiceLifecycleModel = blankModel();
      once.onDisconnect();
      disconnectTimes(twice, 2);
      expect(once.events.trace()).assertEqual('onDisconnect');
      expect(twice.events.trace()).assertEqual('onDisconnect>onDisconnect');
      expect(once.events.trace() === twice.events.trace()).assertFalse();
      expect(once.events.fingerprint() === twice.events.fingerprint()).assertFalse();
      expect(once.events.size()).assertEqual(1);
      expect(twice.events.size()).assertEqual(2);
      expect(once.disconnectCount).assertEqual(1);
      expect(twice.disconnectCount).assertEqual(2);
      expect(once.logs.size()).assertEqual(1);
      expect(twice.logs.size()).assertEqual(2);
    });

    /**
     * @tc.name          onDisconnectLifecycleEventEntryAtZero
     * @tc.desc          The first entry position always holds the first disconnect.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Disconnect twice.
     *                   2. Read entry zero and entry one.
     *                   3. Compare both with the constant.
     * @tc.expected      Both entries equal the bare disconnect constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleEventEntryAtZero', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 2);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[1]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[0].indexOf(':')).assertLess(0);
      expect(service.events.entries[1].indexOf(':')).assertLess(0);
      expect(service.events.entries[0].length).assertEqual(service.events.entries[1].length);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.events.size()).assertEqual(2);
      expect(service.events.entries[0]).assertEqual('onDisconnect');
    });

    /**
     * @tc.name          onDisconnectLifecycleLogEventDivergenceAfterEventClear
     * @tc.desc          Clearing events leaves the logs intact and independent.
     * @tc.precondition  A model has disconnected twice.
     * @tc.steps         1. Disconnect twice.
     *                   2. Clear the recorder only.
     *                   3. Compare log and event sizes.
     * @tc.expected      Logs hold two lines while events are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleLogEventDivergenceAfterEventClear', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 2);
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.trace()).assertEqual('INFO onDisconnect|INFO onDisconnect');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.trace()).assertEqual('');
      expect(service.state).assertEqual('disconnected');
      expect(service.logs.contains('onDisconnect')).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleChainedPhases
     * @tc.desc          Two connects followed by two disconnects form a balanced trace.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect twice.
     *                   2. Disconnect twice.
     *                   3. Read the trace and counters.
     * @tc.expected      The trace is two connects then two disconnects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleChainedPhases', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      service.onConnect();
      service.onDisconnect();
      service.onDisconnect();
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onConnect:IPCStubTest>onDisconnect>onDisconnect');
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.entries[1]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[2]).assertEqual('onDisconnect');
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.state).assertEqual('disconnected');
      expect(modelSnapshot(service).describe()).assertEqual('disconnected/2/2/0/0');
    });

    /**
     * @tc.name          onDisconnectLifecycleSnapshotCounterAlignment
     * @tc.desc          Snapshot fields align with the live counters after a disconnect.
     * @tc.precondition  A model has connected, requested and disconnected.
     * @tc.steps         1. Walk connect, request and disconnect.
     *                   2. Capture the snapshot.
     *                   3. Compare each field with the live counter.
     * @tc.expected      Every snapshot field equals its live counterpart.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleSnapshotCounterAlignment', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      service.onRequest(1);
      service.onDisconnect();
      const snapshot: ServiceSnapshot = modelSnapshot(service);
      expect(snapshot.state).assertEqual(service.state);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.destroys).assertEqual(service.destroyCount);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.sameAs(modelSnapshot(service))).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleDestroyThenDisconnectRevives
     * @tc.desc          Disconnect after destroy leaves the service alive per the model.
     * @tc.precondition  A destroyed model is available.
     * @tc.steps         1. Destroy the model.
     *                   2. Disconnect it.
     *                   3. Read liveness and destroy count.
     * @tc.expected      The service reports alive and the destroy count stays one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleDestroyThenDisconnectRevives', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
      service.onDisconnect();
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.trace()).assertEqual('onDestroy>onDisconnect');
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
    });

    /**
     * @tc.name          onDisconnectLifecycleFinalTraceFingerprint
     * @tc.desc          The final trace fingerprint is stable for the same walk.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Walk connect then disconnect on both models.
     *                   2. Compare fingerprints.
     *                   3. Compare the trace strings.
     * @tc.expected      Both models share one fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleFinalTraceFingerprint', 0, () => {
      const first: ServiceLifecycleModel = disconnectedModel();
      const second: ServiceLifecycleModel = disconnectedModel();
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.trace()).assertEqual('onConnect:IPCStubTest>onDisconnect');
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.disconnectCount).assertEqual(second.disconnectCount);
      expect(modelSnapshot(first).describe()).assertEqual(modelSnapshot(second).describe());
      expect(first.events.fingerprint()).assertLarger(0);
      expect(second.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          onDisconnectLifecycleRepeatedResetDeterministic
     * @tc.desc          Three reset-disconnect cycles produce identical state.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three reset-disconnect cycles.
     *                   2. Capture a trace per cycle.
     *                   3. Compare the traces.
     * @tc.expected      Every cycle yields the single onDisconnect trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleRepeatedResetDeterministic', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      const traces: string[] = [];
      for (let cycle = 0; cycle < 3; cycle++) {
        service.reset();
        service.onDisconnect();
        traces.push(service.events.trace());
      }
      expect(traces.length).assertEqual(3);
      expect(traces[0]).assertEqual('onDisconnect');
      expect(traces[0]).assertEqual(traces[1]);
      expect(traces[1]).assertEqual(traces[2]);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          onDisconnectLifecycleLastEntryBeforeDestroy
     * @tc.desc          Disconnect remains before destroy in a full walk.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, disconnect and destroy.
     *                   2. Read the last two entries.
     *                   3. Compare the ordering.
     * @tc.expected      Disconnect occupies the penultimate position.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleLastEntryBeforeDestroy', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onCreate();
      service.onDisconnect();
      service.onDestroy();
      const size: number = service.events.size();
      expect(size).assertEqual(3);
      expect(service.events.entries[size - 2]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[size - 1]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.trace()).assertEqual('onCreate>onDisconnect>onDestroy');
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          onDisconnectLifecycleStubMetricsKeptAfterDestroy
     * @tc.desc          Stub metrics survive service disconnect and destroy.
     * @tc.precondition  A connected stub has served one request.
     * @tc.steps         1. Send one request through the stub.
     *                   2. Disconnect and destroy the service.
     *                   3. Read the stub metrics.
     * @tc.expected      Metrics still report one handled request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleStubMetricsKeptAfterDestroy', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      new InProcessClient(stub).send(1, 'kept');
      service.onDisconnect();
      service.onDestroy();
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          onDisconnectLifecycleEventSizeAfterResetThenWalk
     * @tc.desc          Reset then a full walk yields exactly four events.
     * @tc.precondition  A model has prior activity.
     * @tc.steps         1. Walk extra callbacks.
     *                   2. Reset.
     *                   3. Walk create, connect, disconnect and destroy.
     * @tc.expected      The recorder holds four entries after the reset walk.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleEventSizeAfterResetThenWalk', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 4);
      service.reset();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.logs.contains('onDisconnect')).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleSnapshotBeforeDisconnect
     * @tc.desc          A snapshot before disconnect still reports connected.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect and capture a snapshot.
     *                   2. Disconnect the live model.
     *                   3. Re-read the captured snapshot.
     * @tc.expected      The captured snapshot remains connected with zero disconnects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleSnapshotBeforeDisconnect', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      const captured: ServiceSnapshot = modelSnapshot(service);
      service.onDisconnect();
      expect(captured.state).assertEqual('connected');
      expect(captured.disconnects).assertEqual(0);
      expect(captured.describe()).assertEqual('connected/1/0/0/0');
      expect(service.state).assertEqual('disconnected');
      expect(captured.sameAs(modelSnapshot(service))).assertFalse();
      expect(captured.connects).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(captured.destroys).assertEqual(0);
    });

    /**
     * @tc.name          onDisconnectLifecycleDisconnectCountExactlyFive
     * @tc.desc          Five disconnects are counted exactly with no drift.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Disconnect five times.
     *                   2. Read the counter and event size.
     *                   3. Read the trace segment count.
     * @tc.expected      Counter, event size and trace segments all equal five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleDisconnectCountExactlyFive', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      disconnectTimes(service, 5);
      expect(service.disconnectCount).assertEqual(5);
      expect(service.events.size()).assertEqual(5);
      expect(service.logs.size()).assertEqual(5);
      expect(service.events.trace().split('>').length).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(5);
      expect(service.events.entries[4]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          onDisconnectLifecycleObservationSummary
     * @tc.desc          A full observation summary after two disconnect cycles is consistent.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two connect-disconnect cycles.
     *                   2. Capture the snapshot and read counters.
     *                   3. Cross-check snapshot, trace and logs.
     * @tc.expected      All observations agree on two connects and two disconnects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleObservationSummary', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      for (let cycle = 0; cycle < 2; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      const snapshot: ServiceSnapshot = modelSnapshot(service);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.describe()).assertEqual('disconnected/2/2/0/0');
      expect(service.events.size()).assertEqual(4);
      expect(service.events.trace().split('>').length).assertEqual(4);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().split('|').length).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onDisconnectLifecycleResetCycleConsistency
     * @tc.desc          A reset cycle rebuilds disconnect resources from the baseline.
     * @tc.precondition  A model with connect, request and disconnect history is available.
     * @tc.steps         1. Connect, request and disconnect.
     *                   2. Reset and run a connect-disconnect cycle.
     *                   3. Compare both snapshots.
     * @tc.expected      The rebuilt snapshot reports only the new cycle totals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onDisconnectLifecycleResetCycleConsistency', 0, () => {
      const service: ServiceLifecycleModel = blankModel();
      service.onConnect();
      service.onRequest(9);
      service.onDisconnect();
      const before: ServiceSnapshot = modelSnapshot(service);
      service.reset();
      service.onConnect();
      service.onDisconnect();
      const after: ServiceSnapshot = modelSnapshot(service);
      expect(before.describe()).assertEqual('disconnected/1/1/1/0');
      expect(after.describe()).assertEqual('disconnected/1/1/0/0');
      expect(before.sameAs(after)).assertFalse();
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.logs.size()).assertEqual(2);
    });
  });
}
