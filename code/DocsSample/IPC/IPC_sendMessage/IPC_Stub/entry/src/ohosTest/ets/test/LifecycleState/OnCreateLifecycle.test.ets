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
  EVENT_ON_CONNECT,
  EVENT_ON_CREATE,
  EVENT_ON_DESTROY,
  EVENT_ON_DISCONNECT,
  EVENT_ON_REQUEST,
  LEVEL_ERROR,
  LEVEL_INFO,
  LEVEL_WARN,
  STUB_DESCRIPTOR,
  InProcessClient,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  joined
} from '../Shared/SharedDriver';

function freshModel(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function createdModel(): ServiceLifecycleModel {
  const service = new ServiceLifecycleModel();
  service.onCreate();
  return service;
}

function eventTrace(service: ServiceLifecycleModel): string {
  return service.events.trace();
}

function snapshotOf(service: ServiceLifecycleModel): ServiceSnapshot {
  return new ServiceSnapshot(service);
}

function nonDestroyCounters(service: ServiceLifecycleModel): number {
  return service.connectCount + service.disconnectCount + service.requestCount;
}

function repeatedCreate(service: ServiceLifecycleModel, times: number): void {
  for (let index = 0; index < times; index++) {
    service.onCreate();
  }
}

export default function onCreateLifecycle(): void {
  describe('OnCreateLifecycle', () => {
    beforeAll(() => {
      logSuite('OnCreateLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('OnCreateLifecycle', 'end');
    });

    /**
     * @tc.name          onCreateLifecycleFreshModelStartsIdle
     * @tc.desc          A newly constructed lifecycle model is idle before any callback.
     * @tc.precondition  No lifecycle callback has been invoked.
     * @tc.steps         1. Construct a ServiceLifecycleModel.
     *                   2. Read the state field.
     *                   3. Read the event recorder and log buffer sizes.
     * @tc.expected      State is idle, recorder is empty and the service is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onCreateLifecycleFreshModelStartsIdle', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      expect(service.state).assertEqual('idle');
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleMovesStateToCreated
     * @tc.desc          onCreate assigns the created state string.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onCreate once.
     *                   2. Read the state field.
     *                   3. Compare with the literal used by the model.
     * @tc.expected      State becomes created and the service remains alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onCreateLifecycleMovesStateToCreated', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      service.onCreate();
      expect(service.state).assertEqual('created');
      expect(service.state).assertContain('create');
      expect(service.isAlive()).assertTrue();
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          onCreateLifecycleRecordsExactlyOneEvent
     * @tc.desc          A single onCreate call appends one lifecycle event.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onCreate.
     *                   2. Count entries matching the onCreate constant.
     *                   3. Compare with the recorder size.
     * @tc.expected      Exactly one onCreate event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onCreateLifecycleRecordsExactlyOneEvent', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      expect(service.events.size()).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
    });

    /**
     * @tc.name          onCreateLifecycleEventEntryCarriesNoDetail
     * @tc.desc          The onCreate event entry is the bare constant without a suffix.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Read the single recorder entry.
     *                   2. Compare it with the event constant.
     *                   3. Check for an absent detail separator.
     * @tc.expected      The entry equals 'onCreate' and contains no colon.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onCreateLifecycleEventEntryCarriesNoDetail', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      expect(service.events.entries.length).assertEqual(1);
      expect(service.events.entries[0]).assertEqual('onCreate');
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[0].indexOf(':')).assertLess(0);
      expect(service.events.trace()).assertEqual('onCreate');
      expect(service.events.trace().length).assertEqual('onCreate'.length);
    });

    /**
     * @tc.name          onCreateLifecycleWritesOneInfoLogLine
     * @tc.desc          onCreate logs at info level exactly once.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onCreate.
     *                   2. Inspect the recorded log levels.
     *                   3. Inspect the recorded log text.
     * @tc.expected      One INFO line whose body is 'onCreate'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onCreateLifecycleWritesOneInfoLogLine', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.contains('onCreate')).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleLeavesStubUndefined
     * @tc.desc          onCreate alone never binds a remote stub object.
     * @tc.precondition  onConnect has not been invoked.
     * @tc.steps         1. Invoke onCreate.
     *                   2. Read the stub field.
     *                   3. Compare with undefined.
     * @tc.expected      No stub exists and the connect counter stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onCreateLifecycleLeavesStubUndefined', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(nonDestroyCounters(service)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecycleRepeatedCallKeepsStateCreated
     * @tc.desc          A second onCreate does not move the state away from created.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Invoke onCreate a second time.
     *                   2. Read the state field.
     *                   3. Confirm the service stays alive.
     * @tc.expected      State remains created and liveness is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleRepeatedCallKeepsStateCreated', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onCreate();
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(0);
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
    });

    /**
     * @tc.name          onCreateLifecycleRepeatedCallAppendsEventPerCall
     * @tc.desc          Each onCreate invocation appends one recorder entry.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onCreate three times through the helper.
     *                   2. Count onCreate entries.
     *                   3. Compare with the expected multiplicity.
     * @tc.expected      Three identical onCreate entries exist in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleRepeatedCallAppendsEventPerCall', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 3);
      expect(service.events.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(3);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[2]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.trace()).assertEqual('onCreate>onCreate>onCreate');
    });

    /**
     * @tc.name          onCreateLifecycleRepeatedCallAppendsLogPerCall
     * @tc.desc          Each onCreate invocation writes one info log entry.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onCreate four times.
     *                   2. Read the log buffer size.
     *                   3. Count info level lines.
     * @tc.expected      Four info lines are present and no warning is emitted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleRepeatedCallAppendsLogPerCall', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.lines[3]).assertEqual('INFO onCreate');
      expect(service.logs.trace().length).assertLarger(0);
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotReportsCreatedState
     * @tc.desc          A snapshot taken after onCreate mirrors the created state.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Capture a ServiceSnapshot.
     *                   2. Read its state and counters.
     *                   3. Compare with the live model.
     * @tc.expected      Snapshot state is created and all counters are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleSnapshotReportsCreatedState', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('created');
      expect(snapshot.state).assertEqual(service.state);
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('created/0/0/0/0');
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotDescribeFormatIsStable
     * @tc.desc          ServiceSnapshot.describe joins five fields with slashes.
     * @tc.precondition  A created model and its snapshot are available.
     * @tc.steps         1. Read the describe string.
     *                   2. Split it on the slash separator.
     *                   3. Count the resulting fields.
     * @tc.expected      Five fields appear and the first is the state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleSnapshotDescribeFormatIsStable', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const described: string = snapshotOf(service).describe();
      const fields: string[] = described.split('/');
      expect(fields.length).assertEqual(5);
      expect(fields[0]).assertEqual('created');
      expect(fields[1]).assertEqual('0');
      expect(fields[2]).assertEqual('0');
      expect(fields[4]).assertEqual('0');
      expect(described.indexOf('created')).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecycleSecondSnapshotMatchesFirst
     * @tc.desc          Two snapshots of an idle-after-create model are equal.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Capture two consecutive snapshots.
     *                   2. Compare them with sameAs.
     *                   3. Compare their describe strings.
     * @tc.expected      Both snapshots are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleSecondSnapshotMatchesFirst', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const first: ServiceSnapshot = snapshotOf(service);
      const second: ServiceSnapshot = snapshotOf(service);
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.connects).assertEqual(second.connects);
      expect(first.destroys).assertEqual(second.destroys);
      logStep('onCreateLifecycleSecondSnapshotMatchesFirst', first.describe());
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotDiffersFromIdleSnapshot
     * @tc.desc          Creating the service changes the snapshot state field.
     * @tc.precondition  One idle model and one created model exist.
     * @tc.steps         1. Capture the idle snapshot.
     *                   2. Capture the created snapshot.
     *                   3. Compare them.
     * @tc.expected      The snapshots differ only in the state field.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleSnapshotDiffersFromIdleSnapshot', 0, () => {
      const idle: ServiceSnapshot = snapshotOf(freshModel());
      const created: ServiceSnapshot = snapshotOf(createdModel());
      expect(idle.sameAs(created)).assertFalse();
      expect(created.sameAs(idle)).assertFalse();
      expect(idle.state).assertEqual('idle');
      expect(created.state).assertEqual('created');
      expect(idle.connects).assertEqual(created.connects);
      expect(idle.destroys).assertEqual(created.destroys);
      expect(idle.describe() === created.describe()).assertFalse();
    });

    /**
     * @tc.name          onCreateLifecycleEventFingerprintDiffersFromIdle
     * @tc.desc          The event trace fingerprint changes after creation.
     * @tc.precondition  One idle model and one created model exist.
     * @tc.steps         1. Read the idle fingerprint.
     *                   2. Read the created fingerprint.
     *                   3. Compare both values.
     * @tc.expected      The fingerprints differ and the created trace is non-empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleEventFingerprintDiffersFromIdle', 0, () => {
      const idle: ServiceLifecycleModel = freshModel();
      const created: ServiceLifecycleModel = createdModel();
      const idlePrint: number = idle.events.fingerprint();
      const createdPrint: number = created.events.fingerprint();
      expect(idle.events.trace()).assertEqual('');
      expect(created.events.trace()).assertEqual(EVENT_ON_CREATE);
      expect(idlePrint === createdPrint).assertFalse();
      expect(createdPrint).assertLarger(0);
      expect(idlePrint).assertLarger(0);
      expect(created.events.fingerprint()).assertEqual(createdPrint);
    });

    /**
     * @tc.name          onCreateLifecycleEventFingerprintStableOnRepeat
     * @tc.desc          Repeating the same trace yields the same fingerprint.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Create both models once.
     *                   2. Read both fingerprints.
     *                   3. Compare the recorder traces as well.
     * @tc.expected      Identical call sequences produce identical fingerprints.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleEventFingerprintStableOnRepeat', 0, () => {
      const first: ServiceLifecycleModel = createdModel();
      const second: ServiceLifecycleModel = createdModel();
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.state).assertEqual(second.state);
      expect(first.isAlive()).assertEqual(second.isAlive());
    });

    /**
     * @tc.name          onCreateLifecycleUnrelatedEventCountsStayZero
     * @tc.desc          onCreate adds no connect, request, disconnect or destroy event.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Read counts for each other event kind.
     *                   2. Sum them.
     *                   3. Compare with the recorder size.
     * @tc.expected      Only the onCreate count is non-zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleUnrelatedEventCountsStayZero', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const others: number = service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DISCONNECT) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(others).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.countOf('onUnknown')).assertEqual(0);
      expect(service.events.countOf('on')).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CREATE) + others).assertEqual(service.events.size());
    });

    /**
     * @tc.name          onCreateLifecycleThenConnectRecordsTwoEvents
     * @tc.desc          onCreate followed by onConnect produces an ordered pair.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Call onConnect.
     *                   2. Read the recorder trace.
     *                   3. Read the event count per kind.
     * @tc.expected      The trace is onCreate then onConnect with a descriptor detail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleThenConnectRecordsTwoEvents', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const stub = service.onConnect();
      expect(service.events.size()).assertEqual(2);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1].startsWith(EVENT_ON_CONNECT + ':')).assertTrue();
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(service.events.trace().indexOf('onCreate>onConnect:')).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecyclePrecedesRequestInTrace
     * @tc.desc          onCreate stays the first event when a request follows.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Invoke onRequest with startId 7.
     *                   2. Read the trace and entry positions.
     *                   3. Check the request counter.
     * @tc.expected      onCreate is first, onRequest second and request count is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecyclePrecedesRequestInTrace', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onRequest(7);
      expect(service.events.size()).assertEqual(2);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual('onRequest:7');
      expect(service.events.trace()).assertEqual('onCreate>onRequest:7');
      expect(service.requestCount).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.state).assertEqual('created');
    });

    /**
     * @tc.name          onCreateLifecycleAliveAfterDisconnect
     * @tc.desc          A created service remains alive across a disconnect.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Invoke onDisconnect.
     *                   2. Read liveness and state.
     *                   3. Confirm onCreate still leads the trace.
     * @tc.expected      The service is alive, disconnected and onCreate is still first.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleAliveAfterDisconnect', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onDisconnect();
      expect(service.isAlive()).assertTrue();
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
    });

    /**
     * @tc.name          onCreateLifecycleAfterDestroyReturnsToCreated
     * @tc.desc          Invoking onCreate on a destroyed model sets created again.
     * @tc.precondition  A model has already been destroyed.
     * @tc.steps         1. Destroy the model.
     *                   2. Invoke onCreate.
     *                   3. Read state and liveness.
     * @tc.expected      State is created again and the service reports alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleAfterDestroyReturnsToCreated', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
      const before: number = service.destroyCount;
      service.onCreate();
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(before);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
    });

    /**
     * @tc.name          onCreateLifecycleAfterDestroyKeepsHistory
     * @tc.desc          Re-creation does not erase earlier lifecycle events.
     * @tc.precondition  A model has been created and destroyed.
     * @tc.steps         1. Record the trace length before re-creation.
     *                   2. Invoke onCreate again.
     *                   3. Inspect the full trace.
     * @tc.expected      The new onCreate is appended after the destroy event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleAfterDestroyKeepsHistory', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onDestroy();
      const before: number = service.events.size();
      service.onCreate();
      expect(service.events.size()).assertEqual(before + 1);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.entries[2]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy>onCreate');
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.logs.contains('onCreate')).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleResetReturnsToIdle
     * @tc.desc          Resetting a created model restores the idle state.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Invoke reset.
     *                   2. Read state and liveness.
     *                   3. Read the counters.
     * @tc.expected      State is idle with zero counters and no stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleResetReturnsToIdle', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          onCreateLifecycleResetClearsEventsAndLogs
     * @tc.desc          Reset empties both the recorder and the log buffer.
     * @tc.precondition  onCreate has been invoked more than once.
     * @tc.steps         1. Repeat onCreate three times.
     *                   2. Invoke reset.
     *                   3. Read recorder and log sizes.
     * @tc.expected      Both containers are empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleResetClearsEventsAndLogs', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 3);
      expect(service.events.size()).assertEqual(3);
      expect(service.logs.size()).assertEqual(3);
      service.reset();
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.events.last()).assertEqual('');
      expect(service.logs.contains('onCreate')).assertFalse();
    });

    /**
     * @tc.name          onCreateLifecycleRecreateAfterResetMatchesFirst
     * @tc.desc          The first post-reset onCreate mirrors the original creation.
     * @tc.precondition  A created model has been reset.
     * @tc.steps         1. Reset the model.
     *                   2. Invoke onCreate again.
     *                   3. Compare with a freshly created model.
     * @tc.expected      Trace, state and log line match a fresh creation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleRecreateAfterResetMatchesFirst', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.reset();
      service.onCreate();
      const reference: ServiceLifecycleModel = createdModel();
      expect(service.state).assertEqual(reference.state);
      expect(service.events.trace()).assertEqual(reference.events.trace());
      expect(service.logs.trace()).assertEqual(reference.logs.trace());
      expect(service.events.fingerprint()).assertEqual(reference.events.fingerprint());
      expect(service.isAlive()).assertEqual(reference.isAlive());
      expect(nonDestroyCounters(service)).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotAfterResetIsIdle
     * @tc.desc          A post-reset snapshot reports the idle precondition.
     * @tc.precondition  A created model has been reset.
     * @tc.steps         1. Invoke reset.
     *                   2. Capture a snapshot.
     *                   3. Compare with an idle snapshot.
     * @tc.expected      The post-reset snapshot equals a fresh idle snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleSnapshotAfterResetIsIdle', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.reset();
      const afterReset: ServiceSnapshot = snapshotOf(service);
      const idle: ServiceSnapshot = snapshotOf(freshModel());
      expect(afterReset.state).assertEqual('idle');
      expect(afterReset.sameAs(idle)).assertTrue();
      expect(idle.sameAs(afterReset)).assertTrue();
      expect(afterReset.describe()).assertEqual(idle.describe());
      expect(afterReset.requests).assertEqual(0);
      expect(afterReset.destroys).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecycleLogBufferTrimsAtCapacity
     * @tc.desc          The 128-entry log buffer drops the oldest create lines.
     * @tc.precondition  A fresh model with a default log limit is available.
     * @tc.steps         1. Invoke onCreate 130 times.
     *                   2. Read the log buffer size.
     *                   3. Verify the retained levels.
     * @tc.expected      The buffer is capped at 128 info lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleLogBufferTrimsAtCapacity', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 130);
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.lines[127]).assertEqual('INFO onCreate');
      expect(service.events.size()).assertEqual(130);
    });

    /**
     * @tc.name          onCreateLifecycleLogTrimKeepsOnlyInfoLevel
     * @tc.desc          Trimming never introduces a warning or error level.
     * @tc.precondition  The create loop has exceeded the buffer capacity.
     * @tc.steps         1. Fill the buffer with create lines.
     *                   2. Count each level.
     *                   3. Sum the level counts.
     * @tc.expected      Level sum equals the retained size and errors are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleLogTrimKeepsOnlyInfoLevel', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 200);
      const total: number = service.logs.countLevel(LEVEL_INFO) +
        service.logs.countLevel(LEVEL_WARN) +
        service.logs.countLevel(LEVEL_ERROR);
      expect(total).assertEqual(service.logs.size());
      expect(service.logs.size()).assertEqual(128);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.contains('WARN')).assertFalse();
      expect(service.logs.contains('ERROR')).assertFalse();
    });

    /**
     * @tc.name          onCreateLifecycleModelsDoNotShareEvents
     * @tc.desc          Event recorders are per-instance and never shared.
     * @tc.precondition  Two independent models are constructed.
     * @tc.steps         1. Create the first model only.
     *                   2. Read the second model recorder.
     *                   3. Create the second model afterwards.
     * @tc.expected      The second model stays empty until its own onCreate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleModelsDoNotShareEvents', 0, () => {
      const first: ServiceLifecycleModel = freshModel();
      const second: ServiceLifecycleModel = freshModel();
      first.onCreate();
      expect(second.events.size()).assertEqual(0);
      expect(second.state).assertEqual('idle');
      second.onCreate();
      expect(first.events.size()).assertEqual(1);
      expect(second.events.size()).assertEqual(1);
      expect(first.events.entries[0]).assertEqual(second.events.entries[0]);
      expect(first.events === second.events).assertFalse();
    });

    /**
     * @tc.name          onCreateLifecycleModelsDoNotShareLogs
     * @tc.desc          Log buffers are per-instance and never shared.
     * @tc.precondition  Two independent models are constructed.
     * @tc.steps         1. Log into the first model via onCreate.
     *                   2. Inspect the second log buffer.
     *                   3. Reset the first model and re-inspect.
     * @tc.expected      The second buffer is unaffected by the first.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleModelsDoNotShareLogs', 0, () => {
      const first: ServiceLifecycleModel = freshModel();
      const second: ServiceLifecycleModel = freshModel();
      repeatedCreate(first, 2);
      expect(first.logs.size()).assertEqual(2);
      expect(second.logs.size()).assertEqual(0);
      expect(second.logs.contains('onCreate')).assertFalse();
      first.reset();
      expect(first.logs.size()).assertEqual(0);
      expect(second.logs.size()).assertEqual(0);
      expect(second.events.size()).assertEqual(0);
      expect(second.state).assertEqual('idle');
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotIsImmutableAfterConnect
     * @tc.desc          A snapshot taken after create keeps created state later.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Capture the snapshot.
     *                   2. Connect the live service.
     *                   3. Read the captured snapshot again.
     * @tc.expected      The captured snapshot still reports created with zero connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleSnapshotIsImmutableAfterConnect', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const captured: ServiceSnapshot = snapshotOf(service);
      const capturedText: string = captured.describe();
      service.onConnect();
      expect(captured.state).assertEqual('created');
      expect(captured.state).assertEqual('created');
      expect(captured.connects).assertEqual(0);
      expect(captured.describe()).assertEqual(capturedText);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(snapshotOf(service).sameAs(captured)).assertFalse();
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotVariesWithRequestCount
     * @tc.desc          Snapshots taken at different request counts are unequal.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Capture a snapshot before requests.
     *                   2. Send two onRequest callbacks.
     *                   3. Capture and compare a second snapshot.
     * @tc.expected      The requests field grows from zero to two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleSnapshotVariesWithRequestCount', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const before: ServiceSnapshot = snapshotOf(service);
      service.onRequest(1);
      service.onRequest(2);
      const after: ServiceSnapshot = snapshotOf(service);
      expect(before.requests).assertEqual(0);
      expect(after.requests).assertEqual(2);
      expect(before.sameAs(after)).assertFalse();
      expect(after.sameAs(before)).assertFalse();
      expect(after.state).assertEqual('created');
      expect(after.describe()).assertEqual('created/0/0/2/0');
      expect(service.requestCount).assertEqual(after.requests);
    });

    /**
     * @tc.name          onCreateLifecycleEventClearKeepsCreatedState
     * @tc.desc          Clearing the recorder manually does not change the state.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Clear the event recorder directly.
     *                   2. Read state and counters.
     *                   3. Invoke onCreate again.
     * @tc.expected      State remains created and a new event is appended.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleEventClearKeepsCreatedState', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.logs.size()).assertEqual(1);
      service.onCreate();
      expect(service.events.size()).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
      expect(service.state).assertEqual('created');
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotLadderTracksEachPhase
     * @tc.desc          Snapshots captured per phase form a monotonic history.
     * @tc.precondition  A fresh model is available for a full callback walk.
     * @tc.steps         1. Capture a snapshot before creation.
     *                   2. Create and capture again.
     *                   3. Connect, request, disconnect and destroy, capturing each.
     * @tc.expected      Each snapshot reflects exactly the counters reached so far.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleSnapshotLadderTracksEachPhase', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      const shots: ServiceSnapshot[] = [];
      shots.push(snapshotOf(service));
      service.onCreate();
      shots.push(snapshotOf(service));
      service.onConnect();
      shots.push(snapshotOf(service));
      service.onRequest(3);
      shots.push(snapshotOf(service));
      service.onDisconnect();
      shots.push(snapshotOf(service));
      service.onDestroy();
      shots.push(snapshotOf(service));
      expect(shots.length).assertEqual(6);
      expect(shots[0].state).assertEqual('idle');
      expect(shots[1].state).assertEqual('created');
      expect(shots[2].connects).assertEqual(1);
      expect(shots[3].requests).assertEqual(1);
      expect(shots[4].disconnects).assertEqual(1);
      expect(shots[5].destroys).assertEqual(1);
      expect(shots[0].sameAs(shots[5])).assertFalse();
    });

    /**
     * @tc.name          onCreateLifecycleTraceMatchesJoinedConstants
     * @tc.desc          The recorder trace equals the constants joined by arrows.
     * @tc.precondition  A model has walked create, connect and request.
     * @tc.steps         1. Walk the three callbacks.
     *                   2. Join the constants with a greater-than sign.
     *                   3. Compare against the recorder trace.
     * @tc.expected      The trace prefix matches the joined expectation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleTraceMatchesJoinedConstants', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(5);
      const expected: string = joined([EVENT_ON_CREATE, EVENT_ON_CONNECT + ':IPCStubTest', 'onRequest:5'], '>');
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:5');
      expect(service.events.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.fingerprint()).assertEqual(service.events.fingerprint());
    });

    /**
     * @tc.name          onCreateLifecycleCreateCountSurvivesLaterPhases
     * @tc.desc          The single create event is never duplicated by other callbacks.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Connect, request, disconnect and destroy.
     *                   2. Count create events after each phase.
     *                   3. Confirm the total recorder size.
     * @tc.expected      Exactly one create event exists across the full walk.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleCreateCountSurvivesLaterPhases', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onConnect();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      service.onRequest(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      service.onDisconnect();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      service.onDestroy();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.size()).assertEqual(5);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
    });

    /**
     * @tc.name          onCreateLifecycleLivenessMatrixByState
     * @tc.desc          Only the destroyed state reports a dead service.
     * @tc.precondition  Several models at different lifecycle stages exist.
     * @tc.steps         1. Build one model per state.
     *                   2. Read isAlive for each.
     *                   3. Compare with the expected table.
     * @tc.expected      Idle, created and connected are alive; destroyed is not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onCreateLifecycleLivenessMatrixByState', 0, () => {
      const idle: ServiceLifecycleModel = freshModel();
      const created: ServiceLifecycleModel = createdModel();
      const connected: ServiceLifecycleModel = freshModel();
      connected.onCreate();
      connected.onConnect();
      const destroyed: ServiceLifecycleModel = freshModel();
      destroyed.onCreate();
      destroyed.onDestroy();
      expect(idle.isAlive()).assertTrue();
      expect(created.isAlive()).assertTrue();
      expect(connected.isAlive()).assertTrue();
      expect(destroyed.isAlive()).assertFalse();
      expect(destroyed.destroyCount).assertEqual(1);
      expect(created.onConnect().descriptor).assertEqual('IPCStubTest');
    });

    /**
     * @tc.name          onCreateLifecycleRepeatedCreateThenDestroyIsDead
     * @tc.desc          Destruction wins over many prior create callbacks.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Invoke onCreate five times.
     *                   2. Invoke onDestroy once.
     *                   3. Read state, counters and trace tail.
     * @tc.expected      State is destroyed, dead, and destroy is the last event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleRepeatedCreateThenDestroyIsDead', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 5);
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(6);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.trace().endsWith('onDestroy')).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotMatchesLiveCounters
     * @tc.desc          Every snapshot field mirrors the live model after creation.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Capture the snapshot.
     *                   2. Read each live counter.
     *                   3. Compare field by field.
     * @tc.expected      All five snapshot fields equal their live counterparts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleSnapshotMatchesLiveCounters', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual(service.state);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.destroys).assertEqual(service.destroyCount);
      expect(snapshot.connects + snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests + snapshot.destroys).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleRecorderIndexesAreSequential
     * @tc.desc          Recorder entries append in index order without gaps.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Create, connect, request and disconnect.
     *                   2. Walk the entries by index.
     *                   3. Confirm each position holds the expected kind.
     * @tc.expected      Positions zero through three hold the four callback kinds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleRecorderIndexesAreSequential', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(2);
      service.onDisconnect();
      expect(service.events.entries.length).assertEqual(4);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[2]).assertEqual('onRequest:2');
      expect(service.events.entries[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.entries[0].indexOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.events.entries[3].indexOf(EVENT_ON_DISCONNECT)).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecycleLogOrderMatchesEventOrder
     * @tc.desc          Info log lines are emitted in the same order as events.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Walk create, connect and request.
     *                   2. Read the log trace.
     *                   3. Compare the line count and leading fragments.
     * @tc.expected      Three INFO lines follow the callback order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleLogOrderMatchesEventOrder', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(4);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.lines[1]).assertEqual('INFO onConnect');
      expect(service.logs.lines[2]).assertEqual('INFO onRequest 4');
      expect(service.logs.lines[0].indexOf('INFO ')).assertEqual(0);
      expect(service.logs.lines[2].indexOf('INFO ')).assertEqual(0);
      expect(service.logs.trace().indexOf('INFO onCreate|INFO onConnect')).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecycleClientRoundTripAfterCreation
     * @tc.desc          A stub returned after creation still answers code one.
     * @tc.precondition  A created model has been connected.
     * @tc.steps         1. Obtain the stub through onConnect.
     *                   2. Drive one request through InProcessClient.
     *                   3. Inspect the reply and the create event count.
     * @tc.expected      The round trip succeeds and creation remains recorded once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleClientRoundTripAfterCreation', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const stub = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(1, 'hello world');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.errCode).assertEqual(0);
      expect(client.sentCodes.length).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          onCreateLifecycleMinimalCreationSequence
     * @tc.desc          Creation performs exactly state, event and log mutations.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Record the initial stub reference.
     *                   2. Invoke onCreate.
     *                   3. Compare every observable field.
     * @tc.expected      Only state, event count and log count change.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleMinimalCreationSequence', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      const stubBefore = service.stub;
      service.onCreate();
      expect(stubBefore).assertUndefined();
      expect(service.stub).assertUndefined();
      expect(service.state).assertEqual('created');
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
    });

    /**
     * @tc.name          onCreateLifecycleDescriptorConstantIsStable
     * @tc.desc          Creation never alters the shared descriptor literal.
     * @tc.precondition  The descriptor constant is imported.
     * @tc.steps         1. Read the descriptor before creation.
     *                   2. Create and connect.
     *                   3. Read the descriptor and stub descriptor again.
     * @tc.expected      The descriptor remains IPCStubTest in all three reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleDescriptorConstantIsStable', 0, () => {
      const before: string = STUB_DESCRIPTOR;
      const service: ServiceLifecycleModel = createdModel();
      const stub = service.onConnect();
      expect(before).assertEqual('IPCStubTest');
      expect(STUB_DESCRIPTOR).assertEqual(before);
      expect(stub.descriptor).assertEqual(before);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.entries[1]).assertEqual('onConnect:' + before);
      expect(service.events.trace().indexOf(before)).assertLarger(0);
    });

    /**
     * @tc.name          onCreateLifecycleDifferentWalksChangeFingerprint
     * @tc.desc          Divergent call walks yield divergent recorder fingerprints.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Create and request on the first model.
     *                   2. Create and connect on the second model.
     *                   3. Compare fingerprints and traces.
     * @tc.expected      Both traces start with create but differ afterwards.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleDifferentWalksChangeFingerprint', 0, () => {
      const first: ServiceLifecycleModel = createdModel();
      const second: ServiceLifecycleModel = createdModel();
      first.onRequest(9);
      second.onConnect();
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.events.trace() === second.events.trace()).assertFalse();
      expect(first.events.entries[0]).assertEqual(second.events.entries[0]);
      expect(first.events.entries[1]).assertEqual('onRequest:9');
      expect(second.events.entries[1]).assertEqual('onConnect:IPCStubTest');
      expect(first.events.size()).assertEqual(2);
      expect(second.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          onCreateLifecycleLogLineHasFixedShape
     * @tc.desc          The create log line is exactly the level plus one word.
     * @tc.precondition  onCreate has been invoked once.
     * @tc.steps         1. Read the single log line.
     *                   2. Split on the space character.
     *                   3. Compare against the expected shape.
     * @tc.expected      Two tokens appear: INFO and onCreate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleLogLineHasFixedShape', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const line: string = service.logs.lines[0];
      const tokens: string[] = line.split(' ');
      expect(tokens.length).assertEqual(2);
      expect(tokens[0]).assertEqual(LEVEL_INFO);
      expect(tokens[1]).assertEqual('onCreate');
      expect(line.length).assertEqual('INFO onCreate'.length);
      expect(line.indexOf(LEVEL_INFO)).assertEqual(0);
      expect(line.indexOf(':')).assertLess(0);
      expect(service.logs.countLevel(tokens[0])).assertEqual(1);
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotAfterTwoCreates
     * @tc.desc          A double create leaves the snapshot in the created state.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Invoke onCreate twice.
     *                   2. Capture a snapshot.
     *                   3. Compare with a single-create snapshot.
     * @tc.expected      Both snapshots describe the same created state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleSnapshotAfterTwoCreates', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 2);
      const doubled: ServiceSnapshot = snapshotOf(service);
      const single: ServiceSnapshot = snapshotOf(createdModel());
      expect(doubled.state).assertEqual('created');
      expect(doubled.sameAs(single)).assertTrue();
      expect(doubled.describe()).assertEqual('created/0/0/0/0');
      expect(service.events.size()).assertEqual(2);
      expect(service.logs.size()).assertEqual(2);
      expect(doubled.destroys).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleEventClearThenTwoCreates
     * @tc.desc          A cleared recorder restarts counting from two fresh entries.
     * @tc.precondition  A created model has had its recorder cleared.
     * @tc.steps         1. Clear the recorder.
     *                   2. Invoke onCreate twice.
     *                   3. Read the trace and log size.
     * @tc.expected      Exactly two create entries exist in the trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleEventClearThenTwoCreates', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.events.clear();
      repeatedCreate(service, 2);
      expect(service.events.size()).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.trace()).assertEqual('onCreate>onCreate');
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual(EVENT_ON_CREATE);
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(3);
    });

    /**
     * @tc.name          onCreateLifecycleCreateDisconnectCreateTrace
     * @tc.desc          Re-creation after a disconnect appends a second create.
     * @tc.precondition  A created model exists.
     * @tc.steps         1. Disconnect the model.
     *                   2. Invoke onCreate again.
     *                   3. Read state, trace and create count.
     * @tc.expected      Trace is create, disconnect, create and state is created.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleCreateDisconnectCreateTrace', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onDisconnect();
      service.onCreate();
      expect(service.events.trace()).assertEqual('onCreate>onDisconnect>onCreate');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.entries[2]).assertEqual(EVENT_ON_CREATE);
    });

    /**
     * @tc.name          onCreateLifecycleResetCyclesAreDeterministic
     * @tc.desc          Repeated reset and create cycles converge on one fingerprint.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Run three reset-then-create cycles.
     *                   2. Record the fingerprint of each cycle.
     *                   3. Compare all three values.
     * @tc.expected      Every cycle produces the same trace and fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleResetCyclesAreDeterministic', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      const prints: number[] = [];
      for (let cycle = 0; cycle < 3; cycle++) {
        service.reset();
        service.onCreate();
        prints.push(service.events.fingerprint());
      }
      expect(prints.length).assertEqual(3);
      expect(prints[0]).assertEqual(prints[1]);
      expect(prints[1]).assertEqual(prints[2]);
      expect(service.events.trace()).assertEqual('onCreate');
      expect(service.events.size()).assertEqual(1);
      expect(service.logs.size()).assertEqual(1);
      expect(service.state).assertEqual('created');
    });

    /**
     * @tc.name          onCreateLifecycleDefaultLogLimitIsBounded
     * @tc.desc          The lifecycle model exposes a finite default log limit.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Read the log limit.
     *                   2. Create once and read the size.
     *                   3. Compare size against the limit.
     * @tc.expected      The limit is 128 and the size stays below it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleDefaultLogLimitIsBounded', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      expect(service.logs.limit).assertEqual(128);
      expect(service.logs.limit).assertLarger(0);
      service.onCreate();
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.size()).assertLess(service.logs.limit);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.trace()).assertEqual('INFO onCreate');
    });

    /**
     * @tc.name          onCreateLifecycleCreateEventsAreNotRequests
     * @tc.desc          Creation does not touch the request ledger or counters.
     * @tc.precondition  A created and connected model is available.
     * @tc.steps         1. Read the stub request count after creation.
     *                   2. Read the lifecycle request counter.
     *                   3. Compare the two independent counters.
     * @tc.expected      Both request counters are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleCreateEventsAreNotRequests', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const stub = service.onConnect();
      expect(service.requestCount).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(StubMetrics.from(stub).requests).assertEqual(0);
      expect(service.logs.contains('onRequest')).assertFalse();
    });

    /**
     * @tc.name          onCreateLifecycleStubKillLeavesStateCreated
     * @tc.desc          Killing the stub does not alter lifecycle state or events.
     * @tc.precondition  A created and connected model is available.
     * @tc.steps         1. Kill the stub.
     *                   2. Read lifecycle state and event counts.
     *                   3. Confirm the service still reports alive.
     * @tc.expected      Lifecycle stays connected and alive after stub death.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleStubKillLeavesStateCreated', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const stub = service.onConnect();
      const eventsBefore: number = service.events.size();
      stub.kill();
      expect(stub.alive).assertFalse();
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(service.events.size()).assertEqual(eventsBefore);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest');
    });

    /**
     * @tc.name          onCreateLifecycleSnapshotTextAfterDisconnect
     * @tc.desc          The snapshot describe string tracks the connect count.
     * @tc.precondition  A created model has connected and disconnected.
     * @tc.steps         1. Connect, then disconnect.
     *                   2. Capture the snapshot.
     *                   3. Split the describe string.
     * @tc.expected      The describe string reports one connect and one disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleSnapshotTextAfterDisconnect', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.onConnect();
      service.onDisconnect();
      const snapshot: ServiceSnapshot = snapshotOf(service);
      const fields: string[] = snapshot.describe().split('/');
      expect(snapshot.state).assertEqual('disconnected');
      expect(fields[0]).assertEqual('disconnected');
      expect(fields[1]).assertEqual('1');
      expect(fields[2]).assertEqual('1');
      expect(fields[3]).assertEqual('0');
      expect(fields[4]).assertEqual('0');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleFullWalkEventCountSum
     * @tc.desc          The event kind counts add up to the full walk length.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Walk create, connect, request, disconnect and destroy.
     *                   2. Sum the per-kind counts.
     *                   3. Compare against the recorder size.
     * @tc.expected      The sum equals five and the trace length is five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleFullWalkEventCountSum', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(8);
      service.onDisconnect();
      service.onDestroy();
      const sum: number = service.events.countOf(EVENT_ON_CREATE) +
        service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DISCONNECT) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(sum).assertEqual(5);
      expect(sum).assertEqual(service.events.size());
      expect(service.events.entries.length).assertEqual(5);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          onCreateLifecycleClearLogOnlyKeepsEvents
     * @tc.desc          Clearing the log buffer leaves the recorder untouched.
     * @tc.precondition  A model has been created twice.
     * @tc.steps         1. Create twice.
     *                   2. Clear only the log buffer.
     *                   3. Read both container sizes.
     * @tc.expected      Logs are empty while events remain two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleClearLogOnlyKeepsEvents', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      repeatedCreate(service, 2);
      service.logs.clear();
      expect(service.logs.size()).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(service.events.size()).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.trace()).assertEqual('onCreate>onCreate');
      expect(service.state).assertEqual('created');
    });

    /**
     * @tc.name          onCreateLifecycleClientLedgerAfterCreatedConnect
     * @tc.desc          A client ledger keeps one entry per request after creation.
     * @tc.precondition  A created model is connected to a client.
     * @tc.steps         1. Send code one twice.
     *                   2. Read the ledger lengths.
     *                   3. Compare with the lifecycle counter.
     * @tc.expected      The client ledger has two entries and lifecycle requests stay zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleClientLedgerAfterCreatedConnect', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      const client: InProcessClient = new InProcessClient(service.onConnect());
      client.send(1, 'alpha');
      client.send(1, 'beta');
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.sentTexts.length).assertEqual(2);
      expect(client.results.length).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(client.replies[0]).assertEqual('hello rpc');
      expect(client.replies[1]).assertEqual('hello rpc');
      expect(service.requestCount).assertEqual(0);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          onCreateLifecycleEachCreateCycleBindsNewStub
     * @tc.desc          Creation followed by connection binds a fresh stub per cycle.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Create and connect to obtain the first stub.
     *                   2. Reset, create and connect again.
     *                   3. Compare stub identity and descriptors.
     * @tc.expected      The two stubs are distinct objects with the same descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleEachCreateCycleBindsNewStub', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      service.onCreate();
      const firstStub = service.onConnect();
      service.reset();
      service.onCreate();
      const secondStub = service.onConnect();
      expect(firstStub === secondStub).assertFalse();
      expect(firstStub.descriptor).assertEqual(secondStub.descriptor);
      expect(firstStub.descriptor).assertEqual('IPCStubTest');
      expect(service.connectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.stub).assertEqual(secondStub);
    });

    /**
     * @tc.name          onCreateLifecycleCreationLogFingerprintStable
     * @tc.desc          Two separate creations share the same log fingerprint text.
     * @tc.precondition  Two fresh models are available.
     * @tc.steps         1. Create both models.
     *                   2. Read the textual log traces.
     *                   3. Compare them and their line counts.
     * @tc.expected      Both traces are the single INFO onCreate line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleCreationLogFingerprintStable', 0, () => {
      const first: ServiceLifecycleModel = createdModel();
      const second: ServiceLifecycleModel = createdModel();
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.logs.trace()).assertEqual('INFO onCreate');
      expect(first.logs.size()).assertEqual(second.logs.size());
      expect(first.logs.countLevel(LEVEL_INFO)).assertEqual(second.logs.countLevel(LEVEL_INFO));
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.logs.lines[0]).assertEqual(second.logs.lines[0]);
      expect(first.logs.contains('onCreate')).assertTrue();
      expect(second.logs.contains('onCreate')).assertTrue();
    });

    /**
     * @tc.name          onCreateLifecycleIdleSnapshotSurvivesCreation
     * @tc.desc          A snapshot captured before creation still reports idle later.
     * @tc.precondition  A fresh model is available.
     * @tc.steps         1. Capture a snapshot before creation.
     *                   2. Invoke onCreate on the model.
     *                   3. Re-read the captured snapshot.
     * @tc.expected      The old snapshot stays idle while the live model is created.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleIdleSnapshotSurvivesCreation', 0, () => {
      const service: ServiceLifecycleModel = freshModel();
      const before: ServiceSnapshot = snapshotOf(service);
      const beforeText: string = before.describe();
      service.onCreate();
      expect(before.state).assertEqual('idle');
      expect(before.describe()).assertEqual(beforeText);
      expect(before.describe()).assertEqual('idle/0/0/0/0');
      expect(service.state).assertEqual('created');
      expect(before.sameAs(snapshotOf(service))).assertFalse();
      expect(service.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          onCreateLifecycleResetSnapshotDescribeIdle
     * @tc.desc          A snapshot after reset uses the canonical idle describe text.
     * @tc.precondition  A created model has been reset.
     * @tc.steps         1. Create and reset the model.
     *                   2. Capture a snapshot.
     *                   3. Compare describe text with the idle literal.
     * @tc.expected      The describe text is idle/0/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onCreateLifecycleResetSnapshotDescribeIdle', 0, () => {
      const service: ServiceLifecycleModel = createdModel();
      service.reset();
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.describe()).assertEqual('idle/0/0/0/0');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.state).assertEqual('idle');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
    });
  });
}
